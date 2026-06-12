-- =====================================================
-- Moon Hub | Obsidian UI Modded Base
-- Template for future scripts using Obsidian UI Modded.
-- =====================================================

do
    -- =====================================================
    -- BASIC HUB CONFIG
    -- Edit these values per game/script.
    -- =====================================================
    local HUB_NAME = "Moon Hub"
    local HUB_VERSION = "v1.0.0"
    local HUB_AUTHORS = "by d1_ofc & lopp_0"
    local GAME_NAME = "Game Name"
    local CONFIG_ROOT = "MoonHub"
    local CONFIG_GAME_FOLDER = "BaseGame"
    local CONFIG_PLACE_FOLDER = tostring(game.PlaceId)
    local DISCORD_INVITE = "https://discord.gg/eb6FD625UQ"

    local REPO = "https://raw.githubusercontent.com/opploop/696969/refs/heads/main/"
    local CACHE_KEY = tostring(os.time())

    local function repoAsset(path)
        return REPO .. path .. "?v=" .. CACHE_KEY
    end

    -- =====================================================
    -- SERVICES
    -- =====================================================
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    local TeleportService = game:GetService("TeleportService")

    local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
    local GlobalEnv = if typeof(getgenv) == "function" then getgenv() else _G
    local IS_PREMIUM = GlobalEnv.JD_IS_PREMIUM == true or GlobalEnv.MOON_HUB_PREMIUM == true
    local PREMIUM_STATUS = IS_PREMIUM and "PREMIUM" or "Freemium"
    local KEY_EXPIRES_AT = tonumber(GlobalEnv.JD_EXPIRES_AT)
    local DISCORD_USERNAME = typeof(GlobalEnv.JD_DISCORD_USERNAME) == "string" and GlobalEnv.JD_DISCORD_USERNAME or nil

    -- =====================================================
    -- DEBUG LOGGER
    -- =====================================================
    local DEBUG = true
    local function dbg(message)
        if not DEBUG then
            return
        end

        print(string.format("[MoonHub %.3f] %s", os.clock(), tostring(message)))
    end

    local function warnf(message)
        warn(string.format("[MoonHub %.3f] %s", os.clock(), tostring(message)))
    end

    -- =====================================================
    -- ROBUST LOADER
    -- Loads Library.lua/addons through HttpGet with request fallback.
    -- =====================================================
    local function fetch(url)
        local body

        local okHttpGet = pcall(function()
            body = game:HttpGet(url)
        end)

        if okHttpGet and typeof(body) == "string" and #body > 0 then
            return body
        end

        local requestFn = (syn and syn.request) or (http and http.request) or http_request or request
        if requestFn then
            local okRequest, response = pcall(function()
                return requestFn({
                    Url = url,
                    Method = "GET",
                })
            end)

            if okRequest and response and typeof(response.Body) == "string" and #response.Body > 0 then
                return response.Body
            end
        end

        error("Failed to download: " .. tostring(url))
    end

    local function loadRemote(name, path)
        local url = repoAsset(path)
        local source = fetch(url)
        local fn, compileError = loadstring(source)

        if not fn then
            error("Failed to compile " .. name .. ": " .. tostring(compileError))
        end

        return fn()
    end

    local Library
    local ThemeManager
    local SaveManager

    do
        local ok, result = pcall(function()
            Library = loadRemote("Library", "Library.lua")
            ThemeManager = loadRemote("ThemeManager", "addons/ThemeManager.lua")
            SaveManager = loadRemote("SaveManager", "addons/SaveManager.lua")
        end)

        if not ok then
            error("[MoonHub] Failed to load Obsidian Modded: " .. tostring(result))
        end
    end

    local Options = Library.Options
    ThemeManager:SetLibrary(Library)
    ThemeManager.DefaultTheme = "Gradient Midnight"
    ThemeManager:ApplyTheme("Gradient Midnight")
    Library:SetFont(Enum.Font.Gotham)

    -- =====================================================
    -- HELPERS
    -- =====================================================
    local accentA = Color3.fromRGB(80, 170, 255)
    local accentB = Color3.fromRGB(140, 110, 255)
    local RichTextRefreshers = {}

    local function rgb(color)
        return math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
    end

    local function colorTag(text, color)
        local r, g, b = rgb(color)
        return string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, tostring(text))
    end

    local function accentTag(text)
        return colorTag(text, Library.Scheme.AccentColor)
    end

    local function trackRichText(callback)
        table.insert(RichTextRefreshers, callback)
        callback()
    end

    local function refreshRichText()
        for _, callback in RichTextRefreshers do
            pcall(callback)
        end
    end

    local function gradientText(text, color1, color2)
        text = tostring(text)
        local half = math.max(1, math.floor(#text / 2))
        return colorTag(text:sub(1, half), color1) .. colorTag(text:sub(half + 1), color2)
    end

    local function getGreeting()
        local date = os.date("*t")
        local hour = date and date.hour or 12

        if hour < 12 then
            return "Good morning"
        elseif hour < 18 then
            return "Good afternoon"
        end

        return "Good evening"
    end

    local function getExecutor()
        local executor, version = "Unknown", ""
        pcall(function()
            if typeof(identifyexecutor) == "function" then
                executor, version = identifyexecutor()
            end
        end)

        return tostring(executor), tostring(version or "")
    end

    local function getPlayerCountText()
        return tostring(#Players:GetPlayers()) .. "/" .. tostring(Players.MaxPlayers)
    end

    local function getKeyExpiryText()
        if not KEY_EXPIRES_AT or KEY_EXPIRES_AT <= 0 then
            return "Lifetime"
        end

        local remaining = KEY_EXPIRES_AT - os.time()
        local dateText = os.date("%Y-%m-%d %H:%M:%S", KEY_EXPIRES_AT)

        if remaining <= 0 then
            return "Expired at " .. tostring(dateText)
        end

        local days = math.floor(remaining / 86400)
        local hours = math.floor((remaining % 86400) / 3600)
        local minutes = math.floor((remaining % 3600) / 60)

        if days > 0 then
            return string.format("%sd %sh remaining (%s)", days, hours, tostring(dateText))
        elseif hours > 0 then
            return string.format("%sh %sm remaining (%s)", hours, minutes, tostring(dateText))
        end

        return string.format("%sm remaining (%s)", minutes, tostring(dateText))
    end

    local function getDiscordText()
        if DISCORD_USERNAME and DISCORD_USERNAME:gsub("%s+", "") ~= "" then
            return DISCORD_USERNAME
        end

        return "Not linked"
    end

    local function getPingMs()
        local okPing, ping = pcall(function()
            return LocalPlayer:GetNetworkPing()
        end)

        if okPing and typeof(ping) == "number" then
            return math.floor((ping * 1000) + 0.5)
        end

        local okStats, statPing = pcall(function()
            return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        end)

        if okStats and typeof(statPing) == "number" then
            return math.floor(statPing + 0.5)
        end

        return 0
    end

    local function copyText(text, successMessage)
        if setclipboard then
            setclipboard(tostring(text))
            if Library then
                Library:NotifySuccess({
                    Title = "Done",
                    Description = successMessage or "Copied to clipboard.",
                    Time = 2,
                })
            end
            return true
        end

        if Library then
            Library:NotifyWarning({
                Title = "Clipboard unavailable",
                Description = "Your executor does not expose setclipboard.",
                Time = 3,
            })
        end

        return false
    end

    local function safeStep(name, callback)
        dbg("STEP: " .. name)
        local ok, result = pcall(callback)

        if not ok then
            warnf("STEP FAILED: " .. name .. " | " .. tostring(result))
            if Library then
                Library:NotifyError({
                    Title = "Crash @ " .. name,
                    Description = tostring(result):sub(1, 180),
                    Time = 8,
                    CloseButton = true,
                })
            end
            return false, result
        end

        dbg("STEP OK: " .. name)
        return true, result
    end

    -- =====================================================
    -- RUNTIME STATE
    -- Put shared feature state and runtime connections here.
    -- =====================================================
    local State = {
        LoadedAt = os.clock(),
        Running = true,
        Connections = {},
    }

    local function trackConnection(connection)
        table.insert(State.Connections, connection)
        return connection
    end

    local function disconnectAll()
        for _, connection in State.Connections do
            pcall(function()
                connection:Disconnect()
            end)
        end

        table.clear(State.Connections)
    end

    -- =====================================================
    -- WINDOW
    -- =====================================================
    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true
    local footerExecutor = getExecutor()

    local Window = Library:CreateWindow({
        Title = HUB_NAME,
        Footer = GAME_NAME,
        FooterLeft = os.date("%I:%M:%S %p"),
        FooterRight = footerExecutor,
        Icon = "rbxassetid://96306527242184",
        AutoShow = true,
        Center = true,
        Size = UDim2.fromOffset(760, 540),
        Resizable = true,

        TabsMode = "Sidebar",
        TabStyle = "Default",
        TabTitleMode = "Active",
        GlobalSearch = true,
        DisableSearch = false,

        Gradient = true,
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, accentB),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 12, 20)),
        }),
        GradientRotation = 35,

        BorderColor = "AccentColor",
        BorderThickness = 1.5,
        ShadowColor = "AccentColor",
        ShadowThickness = 4,
        ShadowTransparency = 0.72,
        CornerRadius = 15,
        Font = Enum.Font.Gotham,

        RainbowBorder = false,
        RainbowBorderTargets = {
            Window = true,
            Popups = true,
            Groupboxes = false,
            DependencyGroupboxes = false,
            Tabboxes = false,
            Cards = false,
        },
        RainbowBorderSpeed = 0.14,

        NotifySide = "Right",
        ShowCustomCursor = true,
        ToggleKeybind = Enum.KeyCode.RightControl,
        KeybindMenuWidth = 350,
        KeybindMenuMaxHeight = 250,

        MobileHitSize = 30,
        MobileButtonsSide = "Left",
        DesktopButtonsSide = "Left",
        ShowMobileButtons = true,
        ShowDesktopButtons = true,
        EnableEscapeToClose = true,
        ViewportDragWithM1 = false,

        EnableSidebarResize = true,
        EnableCompacting = true,
        SidebarCompacted = true,
        SidebarCompactWidth = 48,
    })

    Library:ApplyNewElements()

    -- =====================================================
    -- FLOATING STATUS LABEL
    -- =====================================================
    local function getStatusText(fps, ping)
        return string.format(
            "%s | %s %s | %s %s",
            accentTag(HUB_NAME),
            accentTag("FPS"),
            accentTag(fps),
            accentTag("Ping"),
            accentTag(tostring(ping) .. "ms")
        )
    end

    local lastFps = 0
    local lastPing = getPingMs()
    local StatusLabel = Library:AddDraggableLabel(getStatusText(lastFps, lastPing))
    trackRichText(function()
        StatusLabel:SetText(getStatusText(lastFps, lastPing))
    end)
    local frameCounter = 0
    local lastStatsUpdate = os.clock()
    local lastFooterUpdate = os.clock()
    local lastAccentHex = Library.Scheme.AccentColor:ToHex()

    trackConnection(RunService.RenderStepped:Connect(function()
        frameCounter += 1
        local accentHex = Library.Scheme.AccentColor:ToHex()
        if accentHex ~= lastAccentHex then
            lastAccentHex = accentHex
            Window:SetBorder({ Color = Library.Scheme.AccentColor, ShadowColor = Library.Scheme.AccentColor })
            refreshRichText()
        end

        local now = os.clock()
        if now - lastFooterUpdate >= 1 then
            lastFooterUpdate = now
            Window:SetFooterLeft(os.date("%I:%M:%S %p"))
        end

        local delta = now - lastStatsUpdate
        if delta < 1 then
            return
        end

        local fps = math.floor((frameCounter / delta) + 0.5)
        frameCounter = 0
        lastStatsUpdate = now
        lastFps = fps
        lastPing = getPingMs()

        StatusLabel:SetText(getStatusText(lastFps, lastPing))
    end))

    -- =====================================================
    -- TABS
    -- =====================================================
    local Tabs = {}

    local function setupDashboardTab()
        local executor, executorVersion = getExecutor()

        Tabs.Dashboard = Window:AddTab({
            Name = "Dashboard",
            Icon = "layout-dashboard",
            Description = "Hub overview, player, server, changelog and key rank.",
        })

        local DetailsTab = Window:AddHiddenTab({
            Name = "Dashboard Details",
            Icon = "panel-top-open",
            Description = "Full key and account details.",
        })

        local About = Tabs.Dashboard:AddLeftGroupbox("About", "info")
        local Server = Tabs.Dashboard:AddRightGroupbox("Server", "server")
        local Changelog = Tabs.Dashboard:AddFullGroupbox("Changelog", "history")

        About:AddGlassPanel({
            Title = HUB_NAME,
            Description = "Moon HUB - Premium-quality scripts for your favorite games.",
            Icon = "moon",
            Badge = PREMIUM_STATUS,
            Height = 88,
            RainbowBorder = false,
        })

        About:AddPlayerCard("DashboardPlayerCard", {
            Player = LocalPlayer,
            Height = 112,
            Badge = PREMIUM_STATUS,
            Footer = "Rank: " .. PREMIUM_STATUS,
        })

        local AccountSummaryLabel = About:AddLabel({
            Text = "",
            DoesWrap = true,
            Size = 14,
        })
        trackRichText(function()
            AccountSummaryLabel:SetText(
                "Username"
                    .. ": "
                    .. accentTag(LocalPlayer.Name)
                    .. "\n"
                    .. "Discord"
                    .. ": "
                    .. accentTag(getDiscordText())
                    .. "\n"
                    .. "Account age"
                    .. ": "
                    .. accentTag(tostring(LocalPlayer.AccountAge) .. " days")
                    .. "\n"
                    .. "Executor"
                    .. ": "
                    .. accentTag(executor .. " " .. executorVersion)
                    .. "\n"
                    .. "Rank"
                    .. ": "
                    .. accentTag(PREMIUM_STATUS)
                    .. "\n"
                    .. "Expires"
                    .. ": "
                    .. accentTag(getKeyExpiryText())
            )
        end)

        Tabs.Dashboard:AddCard({
            Side = "Full",
            Title = "Open full dashboard details",
            Description = "Shows account, executor and key rank details.",
            Icon = "external-link",
            Height = 70,
            BarHeight = 70,
            DisableHoverGrow = true,
            TargetTab = DetailsTab,
        })

        About:AddButton({
            Text = "Copy player info",
            Func = function()
                copyText(
                    "Username: " .. LocalPlayer.Name
                        .. "\nDisplay: " .. LocalPlayer.DisplayName
                        .. "\nUserId: " .. tostring(LocalPlayer.UserId)
                        .. "\nAccountAge: " .. tostring(LocalPlayer.AccountAge)
                        .. "\nDiscord: " .. getDiscordText()
                        .. "\nRank: " .. PREMIUM_STATUS
                        .. "\nExpires: " .. getKeyExpiryText()
                        .. "\nExecutor: " .. executor .. " " .. executorVersion,
                    "Player info copied."
                )
            end,
        })

        About:AddDivider("Credits")
        local CreditsLabel = About:AddLabel({
            Text = "",
            DoesWrap = true,
            Size = 14,
        })
        trackRichText(function()
            CreditsLabel:SetText(
                "Authors: " .. accentTag(HUB_AUTHORS) .. "\n" .. "UI Library: " .. accentTag("Obsidian UI Modded")
            )
        end)
        About:AddButton({
            Text = "Copy hub Discord",
            Func = function()
                copyText(DISCORD_INVITE, "Hub Discord copied.")
            end,
        })

        Server:AddGlassPanel({
            Title = "Server Information",
            Description = "Place, JobId, players and server join tools.",
            Icon = "monitor",
            Height = 84,
        })

        local ServerLabel = Server:AddLabel({
            Text = "PlaceId: " .. tostring(game.PlaceId) .. "\n"
                .. "JobId: " .. tostring(game.JobId) .. "\n"
                .. "Players: " .. getPlayerCountText() .. "\n"
                .. "Version: " .. tostring(game.PlaceVersion) .. "\n"
                .. "CreatorId: " .. tostring(game.CreatorId),
            DoesWrap = true,
            Size = 14,
            Idx = "ServerInfoLabel",
        })

        Server:AddDropdown("ServerAction", {
            Text = "Server action",
            Values = { "Refresh Info", "Copy Place ID", "Copy Job ID" },
            Default = nil,
            AllowNull = true,
            Callback = function(action)
                if action == "Refresh Info" then
                    ServerLabel:SetText(
                        "PlaceId: " .. tostring(game.PlaceId) .. "\n"
                            .. "JobId: " .. tostring(game.JobId) .. "\n"
                            .. "Players: " .. getPlayerCountText() .. "\n"
                            .. "Version: " .. tostring(game.PlaceVersion) .. "\n"
                            .. "CreatorId: " .. tostring(game.CreatorId)
                    )
                    Library:NotifySuccess({ Title = "Updated", Description = "Server info refreshed.", Time = 2 })
                elseif action == "Copy Place ID" then
                    copyText(game.PlaceId, "Place ID copied.")
                elseif action == "Copy Job ID" then
                    copyText(game.JobId, "Job ID copied.")
                end
            end,
        })

        Server:AddInput("ServerJoinPlaceId", {
            Text = "Join PlaceId",
            Default = tostring(game.PlaceId),
            Placeholder = "PlaceId",
            Numeric = true,
            Finished = true,
            ClearTextOnFocus = false,
        })
        Server:AddInput("ServerJoinJobId", {
            Text = "Join JobId",
            Default = "",
            Placeholder = "Paste server JobId here",
            Finished = true,
            ClearTextOnFocus = false,
        })
        Server:AddButton({
            Text = "Join server",
            Func = function()
                local placeIdValue = Options.ServerJoinPlaceId and Options.ServerJoinPlaceId.Value or tostring(game.PlaceId)
                local placeId = tonumber(placeIdValue) or game.PlaceId
                local jobId = tostring(Options.ServerJoinJobId and Options.ServerJoinJobId.Value or "")
                    :gsub("^%s+", "")
                    :gsub("%s+$", "")

                if jobId == "" then
                    Library:NotifyError({
                        Title = "Missing JobId",
                        Description = "Paste a server JobId before joining.",
                        Time = 4,
                    })
                    return
                end

                Library:NotifyInfo({
                    Title = "Teleporting",
                    Description = "Joining PlaceId " .. tostring(placeId) .. "...",
                    Time = 3,
                })
                TeleportService:TeleportToPlaceInstance(placeId, jobId, LocalPlayer)
            end,
        })

        local ChangelogLabel = Changelog:AddLabel({
            Text = "",
            DoesWrap = true,
            Size = 14,
        })
        trackRichText(function()
            ChangelogLabel:SetText(
                accentTag(HUB_VERSION)
                    .. " - Initial script\n\n"
                    .. "- Obsidian Modded loader\n"
                    .. "- Dashboard overview\n"
                    .. "- Server/player helpers\n"
                    .. "- Feature tabs placeholders\n"
                    .. "- ThemeManager + SaveManager\n"
                    .. "- Keybind menu + mobile friendly defaults"
            )
        end)
        Changelog:SetCollapsed(true)

        local Details = DetailsTab:AddFullGroupbox("Full Details", "badge-check")
        local KeyRankPanel = Details:AddGlassPanel({
            Title = "Key Rank",
            Description = "",
            Icon = "key",
            Badge = PREMIUM_STATUS,
            Height = 92,
            RainbowBorder = false,
        })
        trackRichText(function()
            KeyRankPanel:SetDescription(
                "Current key status"
                    .. ": "
                    .. accentTag(PREMIUM_STATUS)
                    .. "\n"
                    .. "Expires"
                    .. ": "
                    .. accentTag(getKeyExpiryText())
            )
        end)
        local AccountPanel = Details:AddGlassPanel({
            Title = "Account",
            Description = "",
            Icon = "user-round",
            Height = 96,
            RainbowBorder = false,
        })
        trackRichText(function()
            AccountPanel:SetDescription(
                accentTag(LocalPlayer.DisplayName)
                    .. " (@"
                    .. accentTag(LocalPlayer.Name)
                    .. ")\n"
                    .. "UserId"
                    .. ": "
                    .. accentTag(LocalPlayer.UserId)
                    .. " | "
                    .. "Age"
                    .. ": "
                    .. accentTag(tostring(LocalPlayer.AccountAge) .. " days")
                    .. "\n"
                    .. "Discord"
                    .. ": "
                    .. accentTag(getDiscordText())
            )
        end)
        local RuntimePanel = Details:AddGlassPanel({
            Title = "Runtime",
            Description = "",
            Icon = "terminal",
            Height = 86,
            RainbowBorder = false,
        })
        trackRichText(function()
            RuntimePanel:SetDescription(
                "Hub"
                    .. ": "
                    .. accentTag(HUB_NAME)
                    .. "\n"
                    .. "Version"
                    .. ": "
                    .. accentTag(HUB_VERSION)
                    .. "\n"
                    .. "Executor"
                    .. ": "
                    .. accentTag(executor .. " " .. executorVersion)
            )
        end)
        Details:AddButton({
            Text = "Copy full details",
            Func = function()
                copyText(
                    "Hub: " .. HUB_NAME
                        .. "\nVersion: " .. HUB_VERSION
                        .. "\nRank: " .. PREMIUM_STATUS
                        .. "\nUsername: " .. LocalPlayer.Name
                        .. "\nDisplay: " .. LocalPlayer.DisplayName
                        .. "\nUserId: " .. tostring(LocalPlayer.UserId)
                        .. "\nAccountAge: " .. tostring(LocalPlayer.AccountAge)
                        .. "\nDiscord: " .. getDiscordText()
                        .. "\nExpires: " .. getKeyExpiryText()
                        .. "\nExecutor: " .. executor .. " " .. executorVersion,
                    "Full details copied."
                )
            end,
        })
    end

    local function setupFeaturesTab()
        Tabs.Features = Window:AddTab({
            Name = "Features",
            Icon = "gamepad-2",
            Description = "Place the main game features here.",
        })
    end

    local function setupSettingsTab()
        Tabs.Settings = Window:AddTab({
            Name = "UI Settings",
            Icon = "settings",
            Description = "Themes, configs, rainbow, DPI and interface behavior.",
        })

        local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu", "wrench")

        MenuGroup:AddToggle("KeybindMenuOpen", {
            Default = Library.KeybindFrame.Visible,
            Text = "Open Keybind Menu",
            Callback = function(value)
                Library.KeybindFrame.Visible = value
            end,
        })
        MenuGroup:AddToggle("ShowCustomCursor", {
            Text = "Custom Cursor",
            Default = true,
            Callback = function(value)
                Library.ShowCustomCursor = value
            end,
        })
        MenuGroup:AddToggle("EnableEscapeToClose", {
            Text = "Escape closes menus/UI (PC)",
            Default = Library.EnableEscapeToClose,
            Callback = function(value)
                Library.EnableEscapeToClose = value
            end,
        })
        MenuGroup:AddLabel({
            Text = "When enabled, pressing Escape closes open menus/popups and can hide the UI on PC.",
            DoesWrap = true,
            Size = 13,
        })
        MenuGroup:AddToggle("ViewportDragWithM1", {
            Text = "Viewport drag with LMB (PC)",
            Default = Library.ViewportDragWithM1,
            Callback = function(value)
                Library.ViewportDragWithM1 = value
            end,
        })
        MenuGroup:AddLabel({
            Text = "When enabled, 3D viewport previews rotate with left mouse button instead of right mouse button.",
            DoesWrap = true,
            Size = 13,
        })
        MenuGroup:AddToggle("RainbowBorderEnabled", {
            Text = "Rainbow border",
            Default = Library.RainbowBorderEnabled,
            Callback = function(value)
                Window:SetRainbowBorder(value)
            end,
        })
        MenuGroup:AddDropdown("NotificationSide", {
            Values = { "Left", "Right" },
            Default = "Right",
            Text = "Notification Side",
            Callback = function(value)
                Library:SetNotifySide(value)
            end,
        })
        MenuGroup:AddDropdown("DPIDropdown", {
            Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
            Default = "100%",
            Text = "DPI Scale",
            Callback = function(value)
                value = value:gsub("%%", "")
                local dpi = tonumber(value)

                Library:SetDPIScale(dpi)
            end,
        })
        MenuGroup:AddSlider("UICornerSlider", {
            Text = "Corner Radius",
            Default = Library.CornerRadius,
            Min = 0,
            Max = 20,
            Rounding = 0,
            Callback = function(value)
                Window:SetCornerRadius(value)
            end,
        })
        MenuGroup:AddSlider("RainbowBorderSpeed", {
            Text = "Rainbow border speed",
            Default = Library.RainbowBorderSpeed,
            Min = 0.02,
            Max = 0.5,
            Rounding = 2,
            Callback = function(value)
                Library.RainbowBorderSpeed = value
            end,
        })
        MenuGroup:AddDivider()
        MenuGroup:AddLabel("Menu bind")
            :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

        MenuGroup:AddButton("Unload", function()
            Library:Unload()
        end)

        Library.ToggleKeybind = Options.MenuKeybind

        ThemeManager:SetLibrary(Library)
        SaveManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        SaveManager:SetIgnoreIndexes({ "MenuKeybind", "ServerAction" })
        ThemeManager:SetFolder(CONFIG_ROOT)
        SaveManager:SetFolder(CONFIG_ROOT .. "/" .. CONFIG_GAME_FOLDER)
        SaveManager:SetSubFolder(CONFIG_PLACE_FOLDER)

        SaveManager:BuildConfigSection(Tabs.Settings)
        ThemeManager:ApplyToTab(Tabs.Settings)
        if Options.ThemeManager_ThemeList then
            Options.ThemeManager_ThemeList:SetValue("Gradient Midnight")
        else
            ThemeManager:ApplyTheme("Gradient Midnight")
        end
        if Options.FontFace then
            Options.FontFace:SetValue("Gotham")
        else
            Library:SetFont(Enum.Font.Gotham)
        end
        SaveManager:LoadAutoloadConfig()
    end

    -- =====================================================
    -- BUILD UI
    -- =====================================================
    safeStep("Dashboard", setupDashboardTab)
    safeStep("Features", setupFeaturesTab)
    safeStep("Settings", setupSettingsTab)
    Window:SetCompact(true)

    -- =====================================================
    -- GLOBAL CALLBACKS / RUNTIME LOOPS
    -- =====================================================
    Library:OnUnload(function()
        State.Running = false
        disconnectAll()
        dbg("Unloaded.")
    end)

    Library:NotifySuccess({
        Title = HUB_NAME,
        Description = "Script loaded successfully.",
        Time = 4,
    })

    dbg("Script loaded.")
end
