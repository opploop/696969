local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local CoreGui: CoreGui = cloneref(game:GetService("CoreGui"))
local Players: Players = cloneref(game:GetService("Players"))
local RunService: RunService = cloneref(game:GetService("RunService"))
local SoundService: SoundService = cloneref(game:GetService("SoundService"))
local UserInputService: UserInputService = cloneref(game:GetService("UserInputService"))
local GuiService: GuiService = cloneref(game:GetService("GuiService"))
local ContextActionService = cloneref(game:GetService("ContextActionService"))
local TextService: TextService = cloneref(game:GetService("TextService"))
local Teams: Teams = cloneref(game:GetService("Teams"))
local TweenService: TweenService = cloneref(game:GetService("TweenService"))

local getgenv = getgenv or function()
    return shared
end
local setclipboard = setclipboard or nil
local protectgui = protectgui or (syn and syn.protect_gui) or function() end
local gethui = gethui or function()
    return CoreGui
end

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Mouse = cloneref(LocalPlayer:GetMouse())

local Labels = {}
local Buttons = {}
local Toggles = {}
local Options = {}
local Tooltips = {}

local BaseURL = "https://raw.githubusercontent.com/opploop/696969/refs/heads/main/"
local CustomImageManager = {}
local CustomImageManagerAssets = {
    TransparencyTexture = {
        RobloxId = 139785960036434,
        Path = "Obsidian/assets/TransparencyTexture.png",
        URL = BaseURL .. "assets/TransparencyTexture.png",

        Id = nil,
    },

    SaturationMap = {
        RobloxId = 4155801252,
        Path = "Obsidian/assets/SaturationMap.png",
        URL = BaseURL .. "assets/SaturationMap.png",

        Id = nil,
    },

    LoadingIcon = {
        RobloxId = 97544096941083,
        Path = "Obsidian/assets/LoadingIcon.png",
        URL = BaseURL .. "assets/LoadingIcon.png",

        Id = nil,
    },

    CheckIcon = {
        RobloxId = 97682394690683,
        Path = "Obsidian/assets/CheckIcon.png",
        URL = BaseURL .. "assets/CheckIcon.png",

        Id = nil,
    },

    ShinyEffect = {
        RobloxId = 0,
        Path = "Obsidian/assets/ShinyEffect.png",
        URL = BaseURL .. "assets/ShinyEffect.png",

        Id = nil,
    },

    LoadingBarTexture = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarTexture.png",
        URL = BaseURL .. "assets/LoadingBarTexture.png",

        Id = nil,
    },

    LoadingBarPixelTexture = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarPixelTexture.png",
        URL = BaseURL .. "assets/LoadingBarPixelTexture.png",

        Id = nil,
    },

    LoadingBarPixelTextureV2 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarPixelTextureV2.png",
        URL = BaseURL .. "assets/LoadingBarPixelTextureV2.png",

        Id = nil,
    },

    LoadingBarImagegenBase = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarImagegenBase.png",
        URL = BaseURL .. "assets/LoadingBarImagegenBase.png",

        Id = nil,
    },

    LoadingBarFrame1 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame1.png",
        URL = BaseURL .. "assets/LoadingBarFrame1.png",

        Id = nil,
    },

    LoadingBarFrame2 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame2.png",
        URL = BaseURL .. "assets/LoadingBarFrame2.png",

        Id = nil,
    },

    LoadingBarFrame3 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame3.png",
        URL = BaseURL .. "assets/LoadingBarFrame3.png",

        Id = nil,
    },

    LoadingBarFrame4 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame4.png",
        URL = BaseURL .. "assets/LoadingBarFrame4.png",

        Id = nil,
    },

    LoadingBarFrame5 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame5.png",
        URL = BaseURL .. "assets/LoadingBarFrame5.png",

        Id = nil,
    },

    LoadingBarFrame6 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarFrame6.png",
        URL = BaseURL .. "assets/LoadingBarFrame6.png",

        Id = nil,
    },

    LoadingPanelFrame1 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelFrame1.png",
        URL = BaseURL .. "assets/LoadingPanelFrame1.png",

        Id = nil,
    },

    LoadingPanelFrame2 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelFrame2.png",
        URL = BaseURL .. "assets/LoadingPanelFrame2.png",

        Id = nil,
    },

    LoadingPanelFrame3 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelFrame3.png",
        URL = BaseURL .. "assets/LoadingPanelFrame3.png",

        Id = nil,
    },

    LoadingPanelFrame4 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelFrame4.png",
        URL = BaseURL .. "assets/LoadingPanelFrame4.png",

        Id = nil,
    },

    LoadingPanelCleanFrame1 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelCleanFrame1.png",
        URL = BaseURL .. "assets/LoadingPanelCleanFrame1.png",

        Id = nil,
    },

    LoadingPanelCleanFrame2 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelCleanFrame2.png",
        URL = BaseURL .. "assets/LoadingPanelCleanFrame2.png",

        Id = nil,
    },

    LoadingPanelCleanFrame3 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelCleanFrame3.png",
        URL = BaseURL .. "assets/LoadingPanelCleanFrame3.png",

        Id = nil,
    },

    LoadingPanelCleanFrame4 = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelCleanFrame4.png",
        URL = BaseURL .. "assets/LoadingPanelCleanFrame4.png",

        Id = nil,
    },

    LoadingPanelStaticTexture = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingPanelStaticTexture.png",
        URL = BaseURL .. "assets/LoadingPanelStaticTexture.png",

        Id = nil,
    },

    LoadingBarStaticTexture = {
        RobloxId = 0,
        Path = "Obsidian/assets/LoadingBarStaticTexture.png",
        URL = BaseURL .. "assets/LoadingBarStaticTexture.png",

        Id = nil,
    },

    PixelLoadingDecor = {
        RobloxId = 0,
        Path = "Obsidian/assets/PixelLoadingDecor.png",
        URL = BaseURL .. "assets/PixelLoadingDecor.png",

        Id = nil,
    },

    PixelLoadingDecorV2 = {
        RobloxId = 0,
        Path = "Obsidian/assets/PixelLoadingDecorV2.png",
        URL = BaseURL .. "assets/PixelLoadingDecorV2.png",

        Id = nil,
    },
}
do
    local function RecursiveCreatePath(Path: string, IsFile: boolean?)
        if not isfolder or not makefolder then
            return
        end

        local Segments = Path:split("/")
        local TraversedPath = ""

        if IsFile then
            table.remove(Segments, #Segments)
        end

        for _, Segment in ipairs(Segments) do
            if not isfolder(TraversedPath .. Segment) then
                makefolder(TraversedPath .. Segment)
            end

            TraversedPath = TraversedPath .. Segment .. "/"
        end

        return TraversedPath
    end

    function CustomImageManager.AddAsset(
        AssetName: string,
        RobloxAssetId: number,
        URL: string,
        ForceRedownload: boolean?
    )
        if CustomImageManagerAssets[AssetName] ~= nil then
            error(string.format("Asset %q already exists", AssetName))
        end

        assert(typeof(RobloxAssetId) == "number", "RobloxAssetId must be a number")

        CustomImageManagerAssets[AssetName] = {
            RobloxId = RobloxAssetId,
            Path = string.format("Obsidian/custom_assets/%s", AssetName),
            URL = URL,

            Id = nil,
        }

        CustomImageManager.DownloadAsset(AssetName, ForceRedownload)
    end

    function CustomImageManager.GetAsset(AssetName: string)
        if not CustomImageManagerAssets[AssetName] then
            return nil
        end

        local AssetData = CustomImageManagerAssets[AssetName]
        if AssetData.Id then
            return AssetData.Id
        end

        local AssetID = string.format("rbxassetid://%s", AssetData.RobloxId)

        if getcustomasset then
            local Success, NewID = pcall(getcustomasset, AssetData.Path)

            if Success and NewID then
                AssetID = NewID
            end
        end

        AssetData.Id = AssetID
        return AssetID
    end

    function CustomImageManager.DownloadAsset(AssetName: string, ForceRedownload: boolean?)
        if not getcustomasset or not writefile or not isfile then
            return false, "missing functions"
        end

        local AssetData = CustomImageManagerAssets[AssetName]

        RecursiveCreatePath(AssetData.Path, true)

        if ForceRedownload ~= true and isfile(AssetData.Path) then
            return true, nil
        end

        local success, errorMessage = pcall(function()
            writefile(AssetData.Path, game:HttpGet(AssetData.URL))
        end)

        return success, errorMessage
    end

    for AssetName, _ in CustomImageManagerAssets do
        CustomImageManager.DownloadAsset(AssetName)
    end
end

local function IsHttpUrl(Value)
    return typeof(Value) == "string" and Value:match("^https?://") ~= nil
end

local function SanitizeAssetPathSegment(Value: string): string
    local Cleaned = tostring(Value or ""):gsub("[?#].*$", ""):gsub("[^%w_%-%.]", "_")
    Cleaned = Cleaned:gsub("_+", "_"):gsub("^_+", ""):gsub("_+$", "")
    return Cleaned ~= "" and Cleaned or "asset"
end

local function EnsureDownloadFolder(Path: string)
    if not isfolder or not makefolder then
        return
    end

    local Current = ""
    for Segment in Path:gmatch("[^/]+") do
        Current ..= Segment
        if not isfolder(Current) then
            makefolder(Current)
        end
        Current ..= "/"
    end
end

local function GetUrlFileName(Url: string, DefaultName: string?, Extension: string?): string
    local CleanUrl = Url:gsub("[?#].*$", "")
    local FileName = CleanUrl:match("[^/]+$") or DefaultName or "asset"
    FileName = SanitizeAssetPathSegment(FileName)

    if DefaultName and DefaultName ~= "" then
        FileName = SanitizeAssetPathSegment(DefaultName)
    end

    if Extension and not FileName:match("%.[%w]+$") then
        FileName ..= "." .. Extension:gsub("^%.", "")
    end

    return FileName
end

local function DownloadUrlToCustomAsset(Url: string, Info)
    assert(typeof(Url) == "string", "DownloadUrlAsset expects a URL string.")
    if not IsHttpUrl(Url) then
        return Url, true
    end

    if not (writefile and isfile and getcustomasset) then
        return Url, false, "missing writefile/isfile/getcustomasset"
    end

    Info = typeof(Info) == "table" and Info or {}
    local Folder = Info.Folder or "Obsidian/downloads"
    local FileName = GetUrlFileName(Url, Info.FileName or Info.Name, Info.Extension)
    local Path = string.format("%s/%s", Folder, FileName)

    EnsureDownloadFolder(Folder)

    if Info.ForceRedownload == true or not isfile(Path) then
        local Success, ErrorMessage = pcall(function()
            writefile(Path, game:HttpGet(Url))
        end)
        if not Success then
            return Url, false, ErrorMessage
        end
    end

    local Success, CustomAsset = pcall(getcustomasset, Path)
    if not Success or not CustomAsset then
        return Url, false, CustomAsset
    end

    return CustomAsset, true, Path
end

local function HashString(Value: string): string
    local Hash = 2166136261
    for Index = 1, #Value do
        Hash = bit32.bxor(Hash, string.byte(Value, Index))
        Hash = (Hash * 16777619) % 4294967296
    end
    return string.format("%08x", Hash)
end

local Library = {
    LocalPlayer = LocalPlayer,
    DevicePlatform = nil,
    IsMobile = false,
    IsDesktop = true,
    IsTouchDevice = false,
    IsHybridDevice = false,
    ViewportDragWithM1 = false,
    EnableEscapeToClose = true,
    KeybindCAS = {},
    IsRobloxFocused = true,

    ScreenGui = nil,

    SearchText = "",
    Searching = false,
    GlobalSearch = false,
    LastSearchTab = nil,

    ActiveTab = nil,
    Tabs = {},
    TabButtons = {},
    DependencyBoxes = {},

    KeybindFrame = nil,
    KeybindContainer = nil,
    KeybindMenuWidth = 300,
    KeybindMenuHeight = nil,
    KeybindMenuMaxHeight = 260,
    KeybindToggles = {},

    Notifications = {},
    Dialogues = {},
    Popups = {},
    DialogCounter = 0,
    PopupCounter = 0,
    ActiveLoading = nil,
    ActiveDialog = nil,

    Corners = {},
    RainbowStrokes = {},
    RainbowConnection = nil,
    RainbowBorderEnabled = false,
    RainbowBorderTargets = {},
    RainbowBorderSpeed = 0.12,
    RainbowBorderSaturation = 1,
    RainbowBorderValue = 1,
    SecondaryActionLocks = {},

    ToggleKeybind = Enum.KeyCode.RightControl,
    TweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    NotifyTweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),

    Toggled = false,
    Unloaded = false,

    Labels = Labels,
    Buttons = Buttons,
    Toggles = Toggles,
    Options = Options,

    NotifySide = "Right",
    ShowCustomCursor = true,
    ForceCheckbox = false,
    ShowToggleFrameInKeybinds = true,
    NotifyOnError = false,

    CantDragForced = false,

    Signals = {},
    UnloadSignals = {},
    HasBackgroundImage = false,
    BackgroundImageSurfaces = {},
    BackgroundImageContentTransparency = 0.2,
    BackgroundImagePanelTransparency = 0.08,
    Window = nil,
    Windows = {},

    OriginalMinSize = Vector2.new(480, 360),
    MinSize = Vector2.new(480, 360),
    DPIScale = 1,
    MobileHitSize = 28,
    CornerRadius = 4,
    CornerRadiusDropdown = true,

    IsLightTheme = false,
    Scheme = {
        BackgroundColor = Color3.fromRGB(15, 15, 15),
        MainColor = Color3.fromRGB(25, 25, 25),
        AccentColor = Color3.fromRGB(125, 85, 255),
        OutlineColor = Color3.fromRGB(40, 40, 40),
        FontColor = Color3.new(1, 1, 1),
        Font = Font.fromEnum(Enum.Font.Code),

        RedColor = Color3.fromRGB(255, 50, 50),
        DestructiveColor = Color3.fromRGB(220, 38, 38),
        DarkColor = Color3.new(0, 0, 0),
        WhiteColor = Color3.new(1, 1, 1),
    },

    Registry = {},
    Scales = {},
    ScalesOffset = {},

    ImageManager = CustomImageManager,
    ShowCursorBinding = string.sub(tostring({}), 10),
}

Library.IsTouchDevice = UserInputService.TouchEnabled
Library.IsHybridDevice = Library.IsTouchDevice and UserInputService.MouseEnabled

if RunService:IsStudio() then
    if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
        Library.IsMobile = true
        Library.OriginalMinSize = Vector2.new(480, 240)
    else
        Library.IsMobile = false
        Library.OriginalMinSize = Vector2.new(480, 360)
    end
else
    pcall(function()
        Library.DevicePlatform = UserInputService:GetPlatform()
    end)
    Library.IsMobile = (Library.DevicePlatform == Enum.Platform.Android or Library.DevicePlatform == Enum.Platform.IOS)
    Library.OriginalMinSize = Library.IsMobile and Vector2.new(480, 240) or Vector2.new(480, 360)
end
Library.IsDesktop = not Library.IsMobile

local Templates = {
    --// UI \\-
    Frame = {
        BorderSizePixel = 0,
    },
    ImageLabel = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    },
    ImageButton = {
        AutoButtonColor = false,
        BorderSizePixel = 0,
    },
    ScrollingFrame = {
        BorderSizePixel = 0,
    },
    TextLabel = {
        BorderSizePixel = 0,
        FontFace = "Font",
        RichText = true,
        TextColor3 = "FontColor",
    },
    TextButton = {
        AutoButtonColor = false,
        BorderSizePixel = 0,
        FontFace = "Font",
        RichText = true,
        TextColor3 = "FontColor",
    },
    TextBox = {
        BorderSizePixel = 0,
        FontFace = "Font",
        PlaceholderColor3 = function()
            local H, S, V = Library.Scheme.FontColor:ToHSV()
            return Color3.fromHSV(H, S, V / 2)
        end,
        Text = "",
        TextColor3 = "FontColor",
    },
    UIListLayout = {
        SortOrder = Enum.SortOrder.LayoutOrder,
    },
    UIStroke = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    },

    --// Library \\--
    Window = {
        Title = "No Title",
        Footer = "No Footer",
        FooterLeft = nil,
        FooterRight = nil,
        Position = UDim2.fromOffset(6, 6),
        Size = UDim2.fromOffset(720, 600),
        IconSize = UDim2.fromOffset(30, 30),
        AutoShow = true,
        Center = true,
        Resizable = true,
        SearchbarSize = UDim2.fromScale(1, 1),
        GlobalSearch = false,
        CornerRadius = 4,
        NotifySide = "Right",

        Gradient = false,
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(125, 85, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15)),
        }),
        GradientTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.88),
            NumberSequenceKeypoint.new(1, 1),
        }),
        GradientRotation = 35,
        BackgroundImageTransparency = 0.12,
        BackgroundImageScaleType = Enum.ScaleType.Crop,
        BackgroundImageContentTransparency = 0.2,
        BackgroundImagePanelTransparency = 0.08,
        BackgroundColor = nil,
        BorderColor = "OutlineColor",
        BorderThickness = 1,
        BorderTransparency = 0,
        ShadowColor = "DarkColor",
        ShadowThickness = 1.5,
        ShadowTransparency = 0,
        RainbowBorder = false,
        RainbowBorderTargets = nil,
        RainbowBorderSpeed = 0.12,
        RainbowBorderSaturation = 1,
        RainbowBorderValue = 1,
        TabsMode = "Sidebar", -- Sidebar, Topbar
        TabStyle = "Default", -- Default, Card
        TabTitleMode = "Active", -- Active, Window, Hidden
        FullscreenBackground = false,
        FullscreenBackgroundColor = Color3.fromRGB(0, 0, 0),
        FullscreenBackgroundTransparency = 1,
        FullscreenBackgroundImage = nil,
        FullscreenBackgroundImageTransparency = 0.15,
        FullscreenBackgroundImageScaleType = Enum.ScaleType.Crop,
        ShowCustomCursor = true,
        Font = Enum.Font.Code,
        ToggleKeybind = Enum.KeyCode.RightControl,

        ShowMobileButtons = true,
        MobileButtonsSide = "Left",
        MobileButtonsMode = "Normal", -- Normal, TopbarPlus

        ShowDesktopButtons = true,
        DesktopButtonsSide = "Left", -- Left, Right
        EnableEscapeToClose = true,
        ViewportDragWithM1 = false,
        MobileHitSize = 28,

        KeybindMenuWidth = 300,
        KeybindMenuHeight = nil,
        KeybindMenuMaxHeight = 260,
        KeybindMenuSize = nil,
        KeybindMenuPosition = nil,

        UnlockMouseWhileOpen = true,

        EnableSidebarResize = false,
        EnableCompacting = true,
        DisableCompactingSnap = false,
        SidebarCompacted = false,
        MinContainerWidth = 256,

        --// Snapping \\--
        MinSidebarWidth = 128,
        SidebarCompactWidth = 48,
        SidebarCollapseThreshold = 0.5,

        --// Dragging \\--
        CompactWidthActivation = 128,
    },
    Dialog = {
        Id = nil,
        Title = "Dialog",
        Description = "Description",
        Icon = nil,
        TitleColor = nil,
        DescriptionColor = nil,
        AutoDismiss = true,
        OutsideClickDismiss = true,
        OverlayTransparency = 0.5,
        FooterButtons = {},
    },
    Popup = {
        Title = "Popup",
        Description = "Description",
        Icon = "message-square",
        Time = 4,
        Persist = false,
        AutoDismiss = true,
        Dismissible = true,
        CloseButton = true,
        ShowOverlay = false,
        OutsideClickDismiss = true,
        OverlayTransparency = 0.74,
        Width = 360,
        MaxWidth = 460,
        Position = nil,
        AnchorPoint = nil,
        AccentColor = nil,
        IconColor = nil,
        TitleColor = nil,
        DescriptionColor = nil,
        Actions = {},
    },
    Loading = {
        Title = "mspaint",
        Icon = 95816097006870,
        IconSize = UDim2.fromOffset(30, 30),

        LoadingIcon = CustomImageManager.GetAsset("LoadingIcon"),
        LoadingIconColor = nil,
        LoadingIconTweenTime = 1,
        ShowLoadingIcon = false,
        CenterIcon = false,
        Animated = true,
        EntranceAnimation = true,
        ExitAnimation = true,
        DisableAnimation = false,
        DisableAppearAnimation = false,
        DisableDisappearAnimation = false,
        EntranceAnimationDuration = 0.62,
        ExitAnimationDuration = 0.38,
        AmbientGradient = false,
        Backdrop = false,
        BackdropTransparency = 0.35,
        IconPulse = true,
        SurfaceTransparency = 0,
        SurfaceFill = true,
        SurfaceFillTransparency = 0,
        SurfaceFillColor = nil,
        SurfaceInnerStroke = true,
        SurfaceInnerStrokeColor = "AccentColor",
        SurfaceInnerStrokeTransparency = 0.62,
        DrawingDecorations = true,
        Drawings = {},
        Decor = true,
        DecorImage = CustomImageManager.GetAsset("LoadingPanelStaticTexture"),
        DecorFrames = {
            CustomImageManager.GetAsset("LoadingPanelStaticTexture"),
        },
        DecorFrameRate = 30,
        DecorImageTransparency = 0.18,
        DecorImageColor3 = "WhiteColor",
        DecorHeight = 92,
        DecorPosition = "Full",
        DecorScaleType = Enum.ScaleType.Crop,
        ProgressShine = true,
        ProgressShineColor = "WhiteColor",
        ProgressShineTransparency = 0.58,
        ProgressShineSpeed = 1.8,
        ProgressShineWidth = 56,
        ProgressShineRotation = 12,
        ProgressTexture = true,
        ProgressTextureImage = CustomImageManager.GetAsset("LoadingBarStaticTexture"),
        ProgressTextureFrames = {
            CustomImageManager.GetAsset("LoadingBarStaticTexture"),
        },
        ProgressTextureFrameRate = 30,
        ProgressTextureTransparency = 0.04,
        ProgressTextureColor = "WhiteColor",
        ProgressTextureSpeed = 0,
        ProgressTextureTileSize = UDim2.fromOffset(192, 16),
        ProgressTrackTexture = true,
        ProgressTrackTextureImage = nil,
        ProgressTrackTextureTransparency = 0.56,
        ProgressTrackTextureColor = "AccentColor",
        ProgressTrackTextureTileSize = nil,
        GradientTransition = true,
        GradientTransitionDuration = 0.72,
        GradientTransitionRotation = 45,
        GradientTransitionStops = {
            { 125, 85, 255, 0 },
            { 125, 85, 255, 0.22 },
            { 255, 255, 255, 0.5 },
            { 65, 210, 255, 0.78 },
            { 65, 210, 255, 1 },
        },
        GradientTransitionTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.24, 0.08),
            NumberSequenceKeypoint.new(0.5, 0.16),
            NumberSequenceKeypoint.new(0.76, 0.1),
            NumberSequenceKeypoint.new(1, 1),
        }),
        GradientTransitionInOffset = Vector2.new(-1.2, -1.2),
        GradientTransitionOutOffset = Vector2.new(1.2, 1.2),
        GradientTransitionExitInOffset = Vector2.new(1.2, 1.2),
        GradientTransitionExitOutOffset = Vector2.new(-1.2, -1.2),
        ProgressBarSize = nil,
        ProgressBarHeight = 16,
        ProgressBarPadding = 2,
        ProgressBarTransparency = 0.18,
        ProgressBarColor = "MainColor",
        ProgressBarStrokeColor = "AccentColor",
        ProgressBarStrokeTransparency = 0.26,
        ProgressBarShadowTransparency = 0.78,
        ProgressFillTransparency = 0.06,
        ProgressFillColor = "AccentColor",
        ProgressCap = false,
        ProgressCapColor = "WhiteColor",
        ProgressCapTransparency = 0.16,
        SmoothProgress = true,
        SmoothProgressDuration = nil,
        SmoothProgressDefaultDuration = 0.58,
        SmoothProgressMinDuration = 0.26,
        SmoothProgressMaxDuration = 1.45,
        SmoothProgressCadenceScale = 0.86,
        Particles = false,
        ParticleCount = 10,

        CurrentStep = 0,
        TotalSteps = 10,

        ShowSidebar = false,
        AutoResizeHeight = false,

        WindowWidth = 450,
        WindowHeight = 275,

        ContentWidth = 450,
        SidebarWidth = 250,
    },
    Toggle = {
        Text = "Toggle",
        Default = false,

        Callback = function() end,
        Changed = function() end,

        ActionsMenu = false,
        KeybindMenu = false,
        KeybindMenuText = nil,
        KeybindMenuIdx = nil,
        KeybindMenuId = nil,

        Risky = false,
        Disabled = false,
        Visible = true,
    },
    Input = {
        Text = "Input",
        Default = "",
        Finished = false,
        Numeric = false,
        ClearTextOnFocus = true,
        ClearTextOnBlur = false,
        Placeholder = "",
        AllowEmpty = true,
        EmptyReset = "---",

        Callback = function() end,
        Changed = function() end,
        VerifyValue = nil,

        Disabled = false,
        Visible = true,
    },
    Slider = {
        Text = "Slider",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 0,

        Prefix = "",
        Suffix = "",

        Callback = function() end,
        Changed = function() end,

        Disabled = false,
        Visible = true,
    },
    Dropdown = {
        Values = {},
        DisabledValues = {},
        ValueImages = {},
        Cards = {},

        Multi = false,
        MaxVisibleDropdownItems = 8,
        CardDropdown = false,
        CardHeight = 76,
        CardBottomBarTransparency = 0.2,
        CardImageTransparency = 0,

        Callback = function() end,
        Changed = function() end,

        Disabled = false,
        Visible = true,
    },
    Viewport = {
        Object = nil,
        Camera = nil,
        Clone = true,
        AutoFocus = true,
        Interactive = false,
        Height = 200,
        Visible = true,
    },
    Image = {
        Image = "",
        Transparency = 0,
        BackgroundTransparency = 0,
        Color = Color3.new(1, 1, 1),
        RectOffset = Vector2.zero,
        RectSize = Vector2.zero,
        ScaleType = Enum.ScaleType.Fit,
        Height = 200,
        Visible = true,
    },
    Video = {
        Video = "",
        FileName = nil,
        Folder = nil,
        Extension = "mp4",
        ForceRedownload = false,
        Looped = false,
        Playing = false,
        Volume = 1,
        Height = 200,
        Visible = true,
    },
    Sprite = {
        Image = "",
        FileName = nil,
        Folder = nil,
        ForceRedownload = false,
        Frames = {},
        FrameSize = nil,
        FrameCount = nil,
        Columns = nil,
        Fps = 24,
        FPS = nil,
        Loop = true,
        Playing = true,
        Transparency = 0,
        BackgroundTransparency = 0,
        Color = Color3.new(1, 1, 1),
        ScaleType = Enum.ScaleType.Fit,
        Height = 96,
        Visible = true,
    },
    UIPassthrough = {
        Instance = nil,
        Height = 24,
        Visible = true,
    },

    --// Addons \\-
    KeyPicker = {
        Text = "KeyPicker",

        Default = "None",
        DefaultModifiers = {},

        Blacklisted = {},
        BlacklistedModifiers = {},
        Whitelisted = {},
        WhitelistedModifiers = {},

        Mode = "Toggle",
        Modes = { "Always", "Toggle", "Hold" },
        SyncToggleState = false,

        Callback = function() end,
        ChangedCallback = function() end,
        Changed = function() end,
        Clicked = function() end,
    },
    ColorPicker = {
        Default = Color3.new(1, 1, 1),

        Callback = function() end,
        Changed = function() end,
    },
}

local Places = {
    Bottom = { 0, 1 },
    Right = { 1, 0 },
}
local Sizes = {
    Left = { 0.5, 1 },
    Right = { 0.5, 1 },
}

local New

--// Scheme Functions \\--
local SchemeReplaceAlias = {
    RedColor = "Red",
    WhiteColor = "White",
    DarkColor = "Dark",
}

local SchemeAlias = {
    Red = "RedColor",
    White = "WhiteColor",
    Dark = "DarkColor",
}

local function GetSchemeValue(Index)
    if not Index then
        return nil
    end

    local ReplaceAliasIndex = SchemeReplaceAlias[Index]
    if ReplaceAliasIndex and Library.Scheme[ReplaceAliasIndex] ~= nil then
        Library.Scheme[Index] = Library.Scheme[ReplaceAliasIndex]
        Library.Scheme[ReplaceAliasIndex] = nil

        return Library.Scheme[Index]
    end

    local AliasIndex = SchemeAlias[Index]
    if AliasIndex and Library.Scheme[AliasIndex] ~= nil then
        warn(string.format("Scheme Value %q is deprecated, please use %q instead.", Index, AliasIndex))
        return Library.Scheme[AliasIndex]
    end

    return Library.Scheme[Index]
end

local function GetBackgroundImageSurfaceTransparency(DefaultTransparency: number?, Layer: string?)
    DefaultTransparency = DefaultTransparency or 0
    if not Library.HasBackgroundImage then
        return DefaultTransparency
    end

    local BackgroundTransparency = Layer == "Panel" and Library.BackgroundImagePanelTransparency
        or Library.BackgroundImageContentTransparency
    return math.max(DefaultTransparency, BackgroundTransparency or 0)
end

local function RegisterBackgroundImageSurface(Instance: GuiObject, DefaultTransparency: number?, Layer: string?)
    Library.BackgroundImageSurfaces[Instance] = {
        DefaultTransparency = DefaultTransparency or 0,
        Layer = Layer or "Content",
    }
    Instance.BackgroundTransparency = GetBackgroundImageSurfaceTransparency(DefaultTransparency, Layer)
    return Instance
end

local function UpdateBackgroundImageSurfaces()
    for Instance, Info in Library.BackgroundImageSurfaces do
        if typeof(Instance) ~= "Instance" or not Instance.Parent then
            Library.BackgroundImageSurfaces[Instance] = nil
            continue
        end

        Instance.BackgroundTransparency =
            GetBackgroundImageSurfaceTransparency(Info.DefaultTransparency, Info.Layer)
    end
end

--// Basic Functions \\--
local function WaitForEvent(Event, Timeout, Condition)
    local Bindable = Instance.new("BindableEvent")
    local Connection = Event:Once(function(...)
        if not Condition or typeof(Condition) == "function" and Condition(...) then
            Bindable:Fire(true)
        else
            Bindable:Fire(false)
        end
    end)
    task.delay(Timeout, function()
        Connection:Disconnect()
        Bindable:Fire(false)
    end)

    local Result = Bindable.Event:Wait()
    Bindable:Destroy()

    return Result
end

local function IsMouseInput(Input: InputObject, IncludeM2: boolean?)
    return Input.UserInputType == Enum.UserInputType.MouseButton1
        or (IncludeM2 == true and Input.UserInputType == Enum.UserInputType.MouseButton2)
        or Input.UserInputType == Enum.UserInputType.Touch
end
local function IsClickInput(Input: InputObject, IncludeM2: boolean?)
    return IsMouseInput(Input, IncludeM2)
        and Input.UserInputState == Enum.UserInputState.Begin
        and Library.IsRobloxFocused
end
local function IsHoverInput(Input: InputObject)
    return (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
        and Input.UserInputState == Enum.UserInputState.Change
end
local function IsDragInput(Input: InputObject, IncludeM2: boolean?)
    return IsMouseInput(Input, IncludeM2)
        and (Input.UserInputState == Enum.UserInputState.Begin or Input.UserInputState == Enum.UserInputState.Change)
        and Library.IsRobloxFocused
end

local function GetPointerPosition(Input: InputObject?): Vector2
    if Input and Input.UserInputType == Enum.UserInputType.Touch then
        return Vector2.new(Input.Position.X, Input.Position.Y)
    end

    local Location = UserInputService:GetMouseLocation()
    local Inset = GuiService:GetGuiInset()
    return Vector2.new(Location.X - Inset.X, Location.Y - Inset.Y)
end

local function GetMobileHitSize(Size: number): number
    if Library.IsMobile or Library.IsTouchDevice then
        return math.max(Size, Library.MobileHitSize or 28)
    end

    return Size
end

local function ReleaseFocusedTextBoxes()
    local FocusedTextBox = UserInputService:GetFocusedTextBox()
    if FocusedTextBox and FocusedTextBox:IsA("TextBox") then
        FocusedTextBox:ReleaseFocus()
    end
end

local function ScheduleCanvasRedraw(DrawCallback: () -> ())
    task.defer(DrawCallback)
    task.delay(0.05, DrawCallback)
    task.delay(0.2, DrawCallback)
end

local function GetTableSize(Table: { [any]: any })
    local Size = 0

    for _, _ in Table do
        Size += 1
    end

    return Size
end
local function StopTween(Tween: TweenBase)
    if not (Tween and Tween.PlaybackState == Enum.PlaybackState.Playing) then
        return
    end

    Tween:Cancel()
end
local function Trim(Text: string)
    return Text:match("^%s*(.-)%s*$")
end
local function Round(Value, Rounding)
    assert(Rounding >= 0, "Invalid rounding number.")

    if Rounding == 0 then
        return math.floor(Value)
    end

    return tonumber(string.format("%." .. Rounding .. "f", Value))
end

local function GetPlayers(ExcludeLocalPlayer: boolean?)
    local PlayerList = Players:GetPlayers()

    if ExcludeLocalPlayer then
        local Idx = table.find(PlayerList, LocalPlayer)
        if Idx then
            table.remove(PlayerList, Idx)
        end
    end

    table.sort(PlayerList, function(Player1, Player2)
        return Player1.Name:lower() < Player2.Name:lower()
    end)

    return PlayerList
end
local function GetTeams()
    local TeamList = Teams:GetTeams()

    table.sort(TeamList, function(Team1, Team2)
        return Team1.Name:lower() < Team2.Name:lower()
    end)

    return TeamList
end

function Library:UpdateDependencyBoxes()
    for _, Depbox in Library.DependencyBoxes do
        Depbox:Update(true)
    end

    if Library.Searching then
        Library:UpdateSearch(Library.SearchText)
    end
end

local CheckDepbox
local RestoreDepbox
local SearchTabbox
local RestoreTabbox

local function ApplySearchToBoxElements(Box, Search)
    local VisibleElements = 0

    for _, ElementInfo in Box.Elements do
        if ElementInfo.Type == "Tabbox" then
            if SearchTabbox(ElementInfo, Search) > 0 then
                VisibleElements += 1
            end

            continue
        elseif ElementInfo.Type == "Divider" then
            ElementInfo.Holder.Visible = false
            continue
        elseif ElementInfo.SubButton then
            --// Check if any of the Buttons Name matches with Search
            local Visible = false

            --// Check if Search matches Element's Name and if Element is Visible
            if ElementInfo.Text:lower():match(Search) and ElementInfo.Visible then
                Visible = true
            else
                ElementInfo.Base.Visible = false
            end
            if ElementInfo.SubButton.Text:lower():match(Search) and ElementInfo.SubButton.Visible then
                Visible = true
            else
                ElementInfo.SubButton.Base.Visible = false
            end
            ElementInfo.Holder.Visible = Visible
            if Visible then
                VisibleElements += 1
            end

            continue
        end

        --// Check if Search matches Element's Name and if Element is Visible
        if ElementInfo.Text and ElementInfo.Text:lower():match(Search) and ElementInfo.Visible then
            ElementInfo.Holder.Visible = true
            VisibleElements += 1
        else
            ElementInfo.Holder.Visible = false
        end
    end

    return VisibleElements
end

local function RestoreBoxElements(Box)
    for _, ElementInfo in Box.Elements do
        if ElementInfo.Type == "Tabbox" then
            RestoreTabbox(ElementInfo)
            continue
        end

        ElementInfo.Holder.Visible = typeof(ElementInfo.Visible) == "boolean" and ElementInfo.Visible or true

        if ElementInfo.SubButton then
            ElementInfo.Base.Visible = ElementInfo.Visible
            ElementInfo.SubButton.Base.Visible = ElementInfo.SubButton.Visible
        end
    end
end

CheckDepbox = function(Box, Search)
    local VisibleElements = ApplySearchToBoxElements(Box, Search)

    for _, Depbox in Box.DependencyBoxes do
        if not Depbox.Visible then
            continue
        end

        VisibleElements += CheckDepbox(Depbox, Search)
    end

    if Box.Collapsed ~= nil then
        Box.SearchExpanded = VisibleElements > 0
        Box:Resize()
    end

    Box.Holder.Visible = VisibleElements > 0
    return VisibleElements
end

RestoreDepbox = function(Box)
    RestoreBoxElements(Box)

    if Box.Collapsed ~= nil then
        Box.SearchExpanded = false
    end

    Box:Resize()
    Box.Holder.Visible = true

    for _, Depbox in Box.DependencyBoxes do
        if not Depbox.Visible then
            continue
        end

        RestoreDepbox(Depbox)
    end
end

SearchTabbox = function(Tabbox, Search)
    local VisibleTabs = 0
    local VisibleElements = {}

    for _, SubTab in Tabbox.Tabs do
        VisibleElements[SubTab] = ApplySearchToBoxElements(SubTab, Search)

        for _, Depbox in SubTab.DependencyBoxes do
            if not Depbox.Visible then
                continue
            end

            VisibleElements[SubTab] += CheckDepbox(Depbox, Search)
        end
    end

    for SubTab, Visible in VisibleElements do
        SubTab.ButtonHolder.Visible = Visible > 0
        if Visible > 0 then
            VisibleTabs += 1

            if Tabbox.ActiveTab == SubTab then
                SubTab:Resize()
            elseif Tabbox.ActiveTab and VisibleElements[Tabbox.ActiveTab] == 0 then
                SubTab:Show()
            end
        end
    end

    Tabbox.BoxHolder.Visible = VisibleTabs > 0
    return VisibleTabs
end

RestoreTabbox = function(Tabbox)
    for _, SubTab in Tabbox.Tabs do
        RestoreBoxElements(SubTab)

        for _, Depbox in SubTab.DependencyBoxes do
            if not Depbox.Visible then
                continue
            end

            RestoreDepbox(Depbox)
        end

        SubTab.ButtonHolder.Visible = true
    end

    if Tabbox.ActiveTab then
        Tabbox.ActiveTab:Resize()
    end

    Tabbox.BoxHolder.Visible = typeof(Tabbox.Visible) == "boolean" and Tabbox.Visible or true
end

local function ApplySearchToTab(Tab, Search)
    if not Tab then
        return
    end

    local HasVisible = false

    --// Loop through Groupboxes to get Elements Info
    for _, Groupbox in Tab.Groupboxes do
        local VisibleElements = ApplySearchToBoxElements(Groupbox, Search)

        for _, Depbox in Groupbox.DependencyBoxes do
            if not Depbox.Visible then
                continue
            end

            VisibleElements += CheckDepbox(Depbox, Search)
        end

        --// Update Groupbox Size and Visibility if found any element
        Groupbox.SearchExpanded = VisibleElements > 0
        if VisibleElements > 0 then
            Groupbox:Resize()
            HasVisible = true
        end
        Groupbox.BoxHolder.Visible = VisibleElements > 0
    end

    for _, DepGroupbox in Tab.DependencyGroupboxes do
        if not DepGroupbox.Visible then
            continue
        end

        local VisibleElements = CheckDepbox(DepGroupbox, Search)
        if VisibleElements > 0 then
            DepGroupbox:Resize()
            HasVisible = true
        end
    end

    for _, Tabbox in Tab.Tabboxes do
        if SearchTabbox(Tabbox, Search) > 0 then
            HasVisible = true
        end
    end

    return HasVisible
end
local function ResetTab(Tab)
    if not Tab then
        return
    end

    for _, Groupbox in Tab.Groupboxes do
        RestoreBoxElements(Groupbox)

        for _, Depbox in Groupbox.DependencyBoxes do
            if not Depbox.Visible then
                continue
            end

            RestoreDepbox(Depbox)
        end

        Groupbox.SearchExpanded = false
        Groupbox:Resize()
        Groupbox.BoxHolder.Visible = true
    end

    for _, DepGroupbox in Tab.DependencyGroupboxes do
        if not DepGroupbox.Visible then
            continue
        end

        RestoreDepbox(DepGroupbox)
    end

    for _, Tabbox in Tab.Tabboxes do
        RestoreTabbox(Tabbox)
    end
end

function Library:UpdateSearch(SearchText)
    Library.SearchText = SearchText

    local TabsToReset = {}

    if Library.GlobalSearch then
        for _, Tab in Library.Tabs do
            if typeof(Tab) == "table" and not Tab.IsKeyTab then
                table.insert(TabsToReset, Tab)
            end
        end
    elseif Library.LastSearchTab and typeof(Library.LastSearchTab) == "table" then
        table.insert(TabsToReset, Library.LastSearchTab)
    end

    for _, Tab in ipairs(TabsToReset) do
        ResetTab(Tab)
    end

    local Search = SearchText:lower()
    if Trim(Search) == "" then
        Library.Searching = false
        Library.LastSearchTab = nil
        return
    end
    if not Library.GlobalSearch and Library.ActiveTab and Library.ActiveTab.IsKeyTab then
        Library.Searching = false
        Library.LastSearchTab = nil
        return
    end

    Library.Searching = true

    local TabsToSearch = {}

    if Library.GlobalSearch then
        TabsToSearch = TabsToReset
        if #TabsToSearch == 0 then
            for _, Tab in Library.Tabs do
                if typeof(Tab) == "table" and not Tab.IsKeyTab then
                    table.insert(TabsToSearch, Tab)
                end
            end
        end
    elseif Library.ActiveTab then
        table.insert(TabsToSearch, Library.ActiveTab)
    end

    local FirstVisibleTab = nil
    local ActiveHasVisible = false

    for _, Tab in ipairs(TabsToSearch) do
        local HasVisible = ApplySearchToTab(Tab, Search)
        if HasVisible then
            if not FirstVisibleTab then
                FirstVisibleTab = Tab
            end
            if Tab == Library.ActiveTab then
                ActiveHasVisible = true
            end
        end
    end

    if Library.GlobalSearch then
        if ActiveHasVisible and Library.ActiveTab then
            Library.ActiveTab:RefreshSides()
        elseif FirstVisibleTab then
            local SearchMarker = SearchText
            task.defer(function()
                if Library.SearchText ~= SearchMarker then
                    return
                end

                if Library.ActiveTab ~= FirstVisibleTab then
                    FirstVisibleTab:Show()
                end
            end)
        end
        Library.LastSearchTab = nil
    else
        Library.LastSearchTab = Library.ActiveTab
    end
end

function Library:AddToRegistry(Instance, Properties)
    Library.Registry[Instance] = Properties
end

function Library:RemoveFromRegistry(Instance)
    Library.Registry[Instance] = nil
end

function Library:UpdateColorsUsingRegistry()
    for Instance, Properties in Library.Registry do
        for Property, Index in Properties do
            local SchemeValue = GetSchemeValue(Index)

            if SchemeValue or typeof(Index) == "function" then
                Instance[Property] = SchemeValue or Index()
            end
        end
    end
end

function Library:SetDPIScale(DPIScale: number)
    Library.DPIScale = DPIScale / 100
    Library.MinSize = Library.OriginalMinSize * Library.DPIScale

    for _, UIScale in Library.Scales do
        UIScale.Scale = Library.DPIScale - (tonumber(Library.ScalesOffset[UIScale]) or 0)
    end

    for _, Option in Options do
        if Option.Type == "Dropdown" then
            Option:RecalculateListSize()
        end
    end

    for _, Notification in Library.Notifications do
        Notification:Resize()
    end
end

function Library:GiveSignal(Connection: RBXScriptConnection | RBXScriptSignal)
    local ConnectionType = typeof(Connection)
    if Connection and (ConnectionType == "RBXScriptConnection" or ConnectionType == "RBXScriptSignal") then
        table.insert(Library.Signals, Connection)
    end

    return Connection
end

function IsValidCustomIcon(Icon: string)
    return typeof(Icon) == "string"
        and (Icon:match("rbxasset") or Icon:match("roblox%.com/asset/%?id=") or Icon:match("rbxthumb://type="))
end

type Icon = {
    Url: string,
    Id: number,
    IconName: string,
    ImageRectOffset: Vector2,
    ImageRectSize: Vector2,
}

type IconModule = {
    Icons: { string },
    GetAsset: (Name: string) -> Icon?,
}

local FetchIcons, Icons = pcall(function()
    return (loadstring(
        game:HttpGet("https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua")
    ) :: () -> IconModule)()
end)

function Library:GetIcon(IconName: string)
    if not FetchIcons then
        return
    end

    local Success, Icon = pcall(Icons.GetAsset, IconName)
    if not Success then
        return
    end
    return Icon
end

function Library:GetCustomIcon(IconName: string): any
    if not IconName then
        return nil
    end

    if tonumber(IconName) then
        IconName = string.format("rbxassetid://%s", tostring(IconName))
    end

    local CustomIcon = IsValidCustomIcon(IconName)
    if CustomIcon then
        return {
            Url = IconName,
            ImageRectOffset = Vector2.zero,
            ImageRectSize = Vector2.zero,
            Custom = true,
        }
    end

    local LucideIcon = Library:GetIcon(IconName)
    if LucideIcon then
        return LucideIcon
    end

    return nil
end

function Library:DownloadUrlAsset(Url: string, Info)
    local Asset, Success, ErrorMessage = DownloadUrlToCustomAsset(Url, Info)
    if not Success and IsHttpUrl(Url) then
        warn(string.format("Failed to download custom asset %q: %s", Url, tostring(ErrorMessage)))
    end

    return Asset
end

function Library:DownloadImage(Url: string, Info)
    if not IsHttpUrl(Url) then
        return Url
    end
    if not (getcustomasset and writefile and isfile) then
        return Url
    end

    Info = typeof(Info) == "table" and Info or { FileName = Info }
    local FileName = GetUrlFileName(Url, Info.FileName or Info.Name, Info.Extension)
    local AssetName = SanitizeAssetPathSegment(Info.AssetName or ("RemoteImage_" .. HashString(Url) .. "_" .. FileName))

    local AddSuccess, AddError = pcall(CustomImageManager.AddAsset, AssetName, Info.RobloxAssetId or 0, Url, Info.ForceRedownload)
    if not AddSuccess then
        if tostring(AddError):find("already exists", 1, true) then
            if Info.ForceRedownload == true then
                pcall(CustomImageManager.DownloadAsset, AssetName, true)
            end
        else
            warn(string.format("Failed to register remote image %q: %s", Url, tostring(AddError)))
        end
    end

    return CustomImageManager.GetAsset(AssetName) or Url
end

function Library:DownloadVideo(Url: string, Info)
    Info = typeof(Info) == "table" and Info or { FileName = Info }
    Info.Folder = Info.Folder or "Obsidian/videos"
    Info.Extension = Info.Extension or "mp4"
    return Library:DownloadUrlAsset(Url, Info)
end

function Library:DownloadSprite(Url: string, Info)
    Info = typeof(Info) == "table" and Info or { FileName = Info }
    Info.Folder = Info.Folder or "Obsidian/sprites"
    Info.Extension = Info.Extension or "png"
    return Library:DownloadUrlAsset(Url, Info)
end

local CustomFontManager = {}

local function ResolveFontAssetUrl(BaseUrl: string?, AssetUrl: string): string
    if AssetUrl:match("^https?://") or AssetUrl:match("^rbxasset") or AssetUrl:match("^roblox%.com/asset/%?id=") then
        return AssetUrl
    end

    if not BaseUrl then
        return AssetUrl
    end

    local BasePath = BaseUrl:match("^(.*)/[^/]*$")
    return BasePath and (BasePath .. "/" .. AssetUrl) or AssetUrl
end

local function EnsureFontFolder(Path: string)
    if not isfolder or not makefolder then
        return
    end

    local Current = ""
    for Segment in Path:gmatch("[^/]+") do
        Current ..= Segment
        if not isfolder(Current) then
            makefolder(Current)
        end
        Current ..= "/"
    end
end

local function DownloadFontAsset(AssetUrl: string, FontName: string, FileName: string): string
    if IsValidCustomIcon(AssetUrl) then
        return AssetUrl
    end

    if not (writefile and isfile and getcustomasset) then
        return AssetUrl
    end

    local Folder = string.format("Obsidian/custom_fonts/%s", FontName:gsub("[^%w_%-]", "_"))
    EnsureFontFolder(Folder)

    local Path = string.format("%s/%s", Folder, FileName:gsub("[^%w_%-%.]", "_"))
    if not isfile(Path) then
        writefile(Path, game:HttpGet(AssetUrl))
    end

    local Success, CustomAsset = pcall(getcustomasset, Path)
    return Success and CustomAsset or AssetUrl
end

local function AddFontUrlCandidate(Candidates, Url)
    if typeof(Url) ~= "string" or Url == "" then
        return
    end

    for _, ExistingUrl in ipairs(Candidates) do
        if ExistingUrl == Url then
            return
        end
    end

    table.insert(Candidates, Url)
end

local function GetGithubRawMainUrl(Url: string): string?
    if not Url:find("raw.githubusercontent.com", 1, true) then
        return nil
    end

    local MainUrl = Url:gsub("/refs/heads/main/", "/main/")
    return MainUrl ~= Url and MainUrl or nil
end

local function AddCacheBuster(Url: string): string
    local Separator = Url:find("?", 1, true) and "&" or "?"
    return Url .. Separator .. "obsidian_font_cache=" .. tostring(os.time())
end

local function GetFontResponsePreview(Body): string
    if typeof(Body) ~= "string" then
        return tostring(Body)
    end

    local Preview = Body:gsub("[%c]", " ")
    return Preview:sub(1, 120)
end

local function CleanJsonBody(Body: string): string
    Body = Body:gsub("^\239\187\191", "")
    return Body:match("^%s*(.-)%s*$") or Body
end

local function DecodeJsonFallback(Text: string)
    local Index = 1
    local Length = #Text
    local ParseValue

    local function SkipWhitespace()
        while Index <= Length and Text:sub(Index, Index):match("%s") do
            Index += 1
        end
    end

    local function ParseString()
        assert(Text:sub(Index, Index) == '"', "expected string")
        Index += 1

        local Parts = {}
        while Index <= Length do
            local Char = Text:sub(Index, Index)
            if Char == '"' then
                Index += 1
                return table.concat(Parts)
            elseif Char == "\\" then
                local Escaped = Text:sub(Index + 1, Index + 1)
                if Escaped == '"' or Escaped == "\\" or Escaped == "/" then
                    table.insert(Parts, Escaped)
                    Index += 2
                elseif Escaped == "b" then
                    table.insert(Parts, string.char(8))
                    Index += 2
                elseif Escaped == "f" then
                    table.insert(Parts, string.char(12))
                    Index += 2
                elseif Escaped == "n" then
                    table.insert(Parts, "\n")
                    Index += 2
                elseif Escaped == "r" then
                    table.insert(Parts, "\r")
                    Index += 2
                elseif Escaped == "t" then
                    table.insert(Parts, "\t")
                    Index += 2
                elseif Escaped == "u" then
                    local Code = tonumber(Text:sub(Index + 2, Index + 5), 16)
                    if Code then
                        table.insert(Parts, utf8.char(Code))
                    end
                    Index += 6
                else
                    table.insert(Parts, Escaped)
                    Index += 2
                end
            else
                table.insert(Parts, Char)
                Index += 1
            end
        end

        error("unterminated string")
    end

    local function ParseNumber()
        local Start = Index
        if Text:sub(Index, Index) == "-" then
            Index += 1
        end
        while Index <= Length and Text:sub(Index, Index):match("%d") do
            Index += 1
        end
        if Text:sub(Index, Index) == "." then
            Index += 1
            while Index <= Length and Text:sub(Index, Index):match("%d") do
                Index += 1
            end
        end
        local Char = Text:sub(Index, Index)
        if Char == "e" or Char == "E" then
            Index += 1
            Char = Text:sub(Index, Index)
            if Char == "+" or Char == "-" then
                Index += 1
            end
            while Index <= Length and Text:sub(Index, Index):match("%d") do
                Index += 1
            end
        end

        local Number = tonumber(Text:sub(Start, Index - 1))
        assert(Number ~= nil, "invalid number")
        return Number
    end

    local function ParseArray()
        Index += 1
        local Result = {}
        SkipWhitespace()
        if Text:sub(Index, Index) == "]" then
            Index += 1
            return Result
        end

        while true do
            table.insert(Result, ParseValue())
            SkipWhitespace()
            local Char = Text:sub(Index, Index)
            if Char == "]" then
                Index += 1
                return Result
            end
            assert(Char == ",", "expected comma")
            Index += 1
        end
    end

    local function ParseObject()
        Index += 1
        local Result = {}
        SkipWhitespace()
        if Text:sub(Index, Index) == "}" then
            Index += 1
            return Result
        end

        while true do
            SkipWhitespace()
            local Key = ParseString()
            SkipWhitespace()
            assert(Text:sub(Index, Index) == ":", "expected colon")
            Index += 1
            Result[Key] = ParseValue()
            SkipWhitespace()
            local Char = Text:sub(Index, Index)
            if Char == "}" then
                Index += 1
                return Result
            end
            assert(Char == ",", "expected comma")
            Index += 1
        end
    end

    ParseValue = function()
        SkipWhitespace()
        local Char = Text:sub(Index, Index)
        if Char == '"' then
            return ParseString()
        elseif Char == "{" then
            return ParseObject()
        elseif Char == "[" then
            return ParseArray()
        elseif Text:sub(Index, Index + 3) == "true" then
            Index += 4
            return true
        elseif Text:sub(Index, Index + 4) == "false" then
            Index += 5
            return false
        elseif Text:sub(Index, Index + 3) == "null" then
            Index += 4
            return nil
        end

        return ParseNumber()
    end

    local Result = ParseValue()
    SkipWhitespace()
    assert(Index > Length, "trailing data")
    return Result
end

local function DecodeFontJson(Body: string)
    local CleanBody = CleanJsonBody(Body)
    local DecodeSuccess, Decoded = pcall(function()
        return HttpService:JSONDecode(CleanBody)
    end)
    if DecodeSuccess and typeof(Decoded) == "table" then
        return true, Decoded
    end

    local FallbackSuccess, FallbackDecoded = pcall(DecodeJsonFallback, CleanBody)
    if FallbackSuccess and typeof(FallbackDecoded) == "table" then
        return true, FallbackDecoded
    end

    return false, Decoded or FallbackDecoded
end

local function FetchFontManifest(Url: string)
    local Candidates = {}
    AddFontUrlCandidate(Candidates, Url)

    local GithubMainUrl = GetGithubRawMainUrl(Url)
    AddFontUrlCandidate(Candidates, GithubMainUrl)

    if Url:find("raw.githubusercontent.com", 1, true) then
        AddFontUrlCandidate(Candidates, AddCacheBuster(GithubMainUrl or Url))
    end

    local LastError = "no response"
    for _, CandidateUrl in ipairs(Candidates) do
        local FetchSuccess, Body = pcall(function()
            return game:HttpGet(CandidateUrl)
        end)

        if FetchSuccess and typeof(Body) == "string" then
            local DecodeSuccess, Decoded = DecodeFontJson(Body)

            if DecodeSuccess then
                return Decoded, CandidateUrl
            end

            LastError = string.format("decode failed at %s; response starts with: %s", CandidateUrl, GetFontResponsePreview(Body))
        else
            LastError = string.format("request failed at %s; %s", CandidateUrl, tostring(Body))
        end
    end

    return nil, nil, LastError
end

local function ReadGlyphField(Glyph, ...)
    for _, Key in { ... } do
        if Glyph[Key] ~= nil then
            return Glyph[Key]
        end
    end
end

local function NormalizeCustomFont(FontInfo, SourceUrl: string?)
    assert(typeof(FontInfo) == "table", "Custom font info must be a table.")

    local FontName = tostring(FontInfo.Name or FontInfo.name or "CustomFont")
    local Pages = FontInfo.Pages or FontInfo.pages or FontInfo.Images or FontInfo.images
    if not Pages and (FontInfo.Image or FontInfo.image or FontInfo.Texture or FontInfo.texture) then
        Pages = { FontInfo.Image or FontInfo.image or FontInfo.Texture or FontInfo.texture }
    end

    assert(typeof(Pages) == "table" and #Pages > 0, "Custom font requires at least one image page.")

    local Common = FontInfo.Common or FontInfo.common or {}
    local FontData = {
        Type = "CustomFont",
        Name = FontName,
        Pages = {},
        Glyphs = {},
        Size = tonumber(FontInfo.Size or FontInfo.size) or 32,
        LineHeight = tonumber(FontInfo.LineHeight or FontInfo.lineHeight or Common.LineHeight or Common.lineHeight)
            or tonumber(FontInfo.Size or FontInfo.size)
            or 32,
        Space = tonumber(FontInfo.Space or FontInfo.space) or nil,
        SourceUrl = SourceUrl,
    }

    for Index, Page in ipairs(Pages) do
        local PageUrl = typeof(Page) == "table" and (Page.Url or Page.url or Page.Image or Page.image) or Page
        assert(typeof(PageUrl) == "string", "Custom font page image must be a string URL or asset id.")

        PageUrl = ResolveFontAssetUrl(SourceUrl, PageUrl)
        FontData.Pages[Index] = DownloadFontAsset(PageUrl, FontName, string.format("page_%d.png", Index))
    end

    local Characters = FontInfo.Characters or FontInfo.characters or FontInfo.Chars or FontInfo.chars
    assert(typeof(Characters) == "table", "Custom font requires a Characters/Chars table.")

    for Key, Glyph in Characters do
        if typeof(Glyph) ~= "table" then
            continue
        end

        local Char = Glyph.Char or Glyph.char or Glyph.Character or Glyph.character
        local Id = Glyph.Id or Glyph.id
        if not Char and Id then
            local Success, UtfChar = pcall(utf8.char, tonumber(Id))
            Char = Success and UtfChar or nil
        end
        Char = Char or (typeof(Key) == "string" and Key or nil)

        if not Char then
            continue
        end

        local Width = tonumber(ReadGlyphField(Glyph, "Width", "width", "W", "w")) or 0
        local Height = tonumber(ReadGlyphField(Glyph, "Height", "height", "H", "h")) or 0

        FontData.Glyphs[Char] = {
            Image = FontData.Pages[(tonumber(ReadGlyphField(Glyph, "Page", "page")) or 0) + 1] or FontData.Pages[1],
            X = tonumber(ReadGlyphField(Glyph, "X", "x")) or 0,
            Y = tonumber(ReadGlyphField(Glyph, "Y", "y")) or 0,
            Width = Width,
            Height = Height,
            XOffset = tonumber(ReadGlyphField(Glyph, "XOffset", "xoffset", "xOffset")) or 0,
            YOffset = tonumber(ReadGlyphField(Glyph, "YOffset", "yoffset", "yOffset")) or 0,
            XAdvance = tonumber(ReadGlyphField(Glyph, "XAdvance", "xadvance", "xAdvance")) or Width,
        }
    end

    if not FontData.Space then
        local SpaceGlyph = FontData.Glyphs[" "]
        FontData.Space = SpaceGlyph and SpaceGlyph.XAdvance or FontData.Size * 0.35
    end

    function FontData:GetTextBounds(Text: string, TextSize: number?, Width: number?): (number, number)
        local Scale = (TextSize or FontData.Size) / FontData.Size
        local MaxWidth = Width or math.huge
        local LineWidth = 0
        local BestWidth = 0
        local Lines = 1

        for _, Codepoint in utf8.codes(tostring(Text or "")) do
            local Char = utf8.char(Codepoint)

            if Char == "\n" then
                BestWidth = math.max(BestWidth, LineWidth)
                LineWidth = 0
                Lines += 1
                continue
            end

            local Advance = ((FontData.Glyphs[Char] and FontData.Glyphs[Char].XAdvance) or FontData.Space) * Scale
            if LineWidth > 0 and LineWidth + Advance > MaxWidth then
                BestWidth = math.max(BestWidth, LineWidth)
                LineWidth = 0
                Lines += 1
            end
            LineWidth += Advance
        end

        BestWidth = math.max(BestWidth, LineWidth)
        return BestWidth, Lines * FontData.LineHeight * Scale
    end

    return FontData
end

function CustomFontManager:Download(Url: string, Options)
    assert(typeof(Url) == "string", "Font:Download expects a URL string.")

    local Decoded, SourceUrl, ErrorMessage = FetchFontManifest(Url)
    assert(typeof(Decoded) == "table", "Font:Download expects a bitmap font JSON manifest URL. " .. tostring(ErrorMessage))

    if typeof(Options) == "table" then
        for Key, Value in Options do
            Decoded[Key] = Value
        end
    end

    return NormalizeCustomFont(Decoded, SourceUrl or Url)
end

function CustomFontManager:Register(FontInfo)
    return NormalizeCustomFont(FontInfo)
end

Library.Font = CustomFontManager
pcall(function()
    Font.Download = function(_, Url: string, Options)
        return CustomFontManager:Download(Url, Options)
    end
end)

function Library:DownloadFont(Url: string, Options)
    return CustomFontManager:Download(Url, Options)
end

function Library:RegisterCustomFont(FontInfo)
    return CustomFontManager:Register(FontInfo)
end

function Library:SetCustomFont(FontData)
    assert(typeof(FontData) == "table" and FontData.Type == "CustomFont", "SetCustomFont expects Font:Download/Register data.")

    Library.CustomFont = FontData
    return FontData
end

function Library:CreateCustomText(Parent: GuiObject, Info)
    Info = Info or {}
    local FontData = Info.Font or Library.CustomFont
    assert(typeof(FontData) == "table" and FontData.Type == "CustomFont", "CreateCustomText requires a custom font.")

    local TextObject = {
        Font = FontData,
        Text = tostring(Info.Text or ""),
        TextSize = Info.TextSize or FontData.Size,
        TextColor3 = Info.TextColor3 or Info.Color or Library.Scheme.FontColor,
        TextTransparency = Info.TextTransparency or 0,
        TextXAlignment = Info.TextXAlignment or Enum.TextXAlignment.Left,
        TextYAlignment = Info.TextYAlignment or Enum.TextYAlignment.Center,
        TextWrapped = Info.TextWrapped == true,
        Visible = Info.Visible ~= false,
    }

    local Holder = Instance.new("Frame")
    Holder.Name = Info.Name or "CustomFontText"
    Holder.BackgroundTransparency = 1
    Holder.ClipsDescendants = true
    Holder.Position = Info.Position or UDim2.fromScale(0, 0)
    Holder.Size = Info.Size or UDim2.fromScale(1, 1)
    Holder.Visible = TextObject.Visible
    Holder.ZIndex = Info.ZIndex or Parent.ZIndex
    Holder.Parent = Parent

    local Glyphs = {}

    local function ClearGlyphs()
        for _, Glyph in Glyphs do
            Glyph:Destroy()
        end
        table.clear(Glyphs)
    end

    function TextObject:Render()
        ClearGlyphs()

        local Scale = TextObject.TextSize / FontData.Size
        local MaxWidth = TextObject.TextWrapped and math.max(1, Holder.AbsoluteSize.X) or math.huge
        local Lines = { { Width = 0, Glyphs = {} } }

        for _, Codepoint in utf8.codes(TextObject.Text) do
            local Char = utf8.char(Codepoint)
            if Char == "\n" then
                table.insert(Lines, { Width = 0, Glyphs = {} })
                continue
            end

            local GlyphInfo = FontData.Glyphs[Char]
            local Advance = ((GlyphInfo and GlyphInfo.XAdvance) or FontData.Space) * Scale
            local Line = Lines[#Lines]

            if TextObject.TextWrapped and Line.Width > 0 and Line.Width + Advance > MaxWidth then
                Line = { Width = 0, Glyphs = {} }
                table.insert(Lines, Line)
            end

            if GlyphInfo then
                table.insert(Line.Glyphs, {
                    Info = GlyphInfo,
                    X = Line.Width,
                })
            end
            Line.Width += Advance
        end

        local LineHeight = FontData.LineHeight * Scale
        local TotalHeight = #Lines * LineHeight
        local StartY = TextObject.TextYAlignment == Enum.TextYAlignment.Bottom and Holder.AbsoluteSize.Y - TotalHeight
            or TextObject.TextYAlignment == Enum.TextYAlignment.Center and (Holder.AbsoluteSize.Y - TotalHeight) / 2
            or 0

        for LineIndex, Line in ipairs(Lines) do
            local StartX = TextObject.TextXAlignment == Enum.TextXAlignment.Right and Holder.AbsoluteSize.X - Line.Width
                or TextObject.TextXAlignment == Enum.TextXAlignment.Center and (Holder.AbsoluteSize.X - Line.Width) / 2
                or 0

            for _, GlyphData in Line.Glyphs do
                local GlyphInfo = GlyphData.Info
                local GlyphImage = Instance.new("ImageLabel")
                GlyphImage.BackgroundTransparency = 1
                GlyphImage.Image = GlyphInfo.Image
                GlyphImage.ImageColor3 = TextObject.TextColor3
                GlyphImage.ImageTransparency = TextObject.TextTransparency
                GlyphImage.ImageRectOffset = Vector2.new(GlyphInfo.X, GlyphInfo.Y)
                GlyphImage.ImageRectSize = Vector2.new(GlyphInfo.Width, GlyphInfo.Height)
                GlyphImage.Position = UDim2.fromOffset(
                    StartX + GlyphData.X + GlyphInfo.XOffset * Scale,
                    StartY + (LineIndex - 1) * LineHeight + GlyphInfo.YOffset * Scale
                )
                GlyphImage.Size = UDim2.fromOffset(GlyphInfo.Width * Scale, GlyphInfo.Height * Scale)
                GlyphImage.ZIndex = Holder.ZIndex
                GlyphImage.Parent = Holder
                table.insert(Glyphs, GlyphImage)
            end
        end
    end

    function TextObject:SetText(Text: string)
        TextObject.Text = tostring(Text)
        TextObject:Render()
    end

    function TextObject:SetFont(NewFont)
        assert(typeof(NewFont) == "table" and NewFont.Type == "CustomFont", "SetFont expects custom font data.")
        TextObject.Font = NewFont
        FontData = NewFont
        TextObject:Render()
    end

    function TextObject:SetColor(Color: Color3)
        TextObject.TextColor3 = Color
        for _, Glyph in Glyphs do
            Glyph.ImageColor3 = Color
        end
    end

    function TextObject:SetVisible(Visible: boolean)
        TextObject.Visible = Visible
        Holder.Visible = Visible
    end

    function TextObject:Destroy()
        Holder:Destroy()
    end

    Holder:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        TextObject:Render()
    end)

    TextObject.Holder = Holder
    TextObject:Render()

    return TextObject
end

function Library:AnimateIconSprite(ImageObject: ImageLabel | ImageButton, AtlasInfo)
    assert(ImageObject and ImageObject:IsA("GuiObject"), "AnimateIconSprite expected an image gui object.")
    assert(typeof(AtlasInfo) == "table", "AnimateIconSprite expected atlas info table.")

    local Frames = table.clone(AtlasInfo.Frames or {})
    local Fps = math.max(1, AtlasInfo.Fps or AtlasInfo.FPS or 24)
    local Loop = AtlasInfo.Loop ~= false
    local AtlasImage = AtlasInfo.Image or AtlasInfo.AtlasImage

    if AtlasImage then
        local Icon = Library:GetCustomIcon(AtlasImage)
        if Icon then
            ImageObject.Image = Icon.Url
            ImageObject.ImageRectOffset = Icon.ImageRectOffset or Vector2.zero
            ImageObject.ImageRectSize = Icon.ImageRectSize or Vector2.zero
        elseif IsHttpUrl(AtlasImage) then
            ImageObject.Image = Library:DownloadSprite(AtlasImage, {
                FileName = AtlasInfo.FileName or AtlasInfo.Name,
                Folder = AtlasInfo.Folder,
                ForceRedownload = AtlasInfo.ForceRedownload,
            })
        else
            ImageObject.Image = AtlasImage
        end
    end

    if #Frames == 0 and AtlasInfo.FrameSize and AtlasInfo.FrameCount then
        local FrameSize = AtlasInfo.FrameSize
        local Columns = AtlasInfo.Columns or AtlasInfo.FrameCount
        for Index = 0, AtlasInfo.FrameCount - 1 do
            local X = (Index % Columns) * FrameSize.X
            local Y = math.floor(Index / Columns) * FrameSize.Y
            table.insert(Frames, {
                Offset = Vector2.new(X, Y),
                Size = FrameSize,
            })
        end
    end

    if #Frames == 0 then
        return nil
    end

    local AnimationId = string.sub(tostring({}), 10)
    ImageObject:SetAttribute("ObsidianSpriteId", AnimationId)

    task.spawn(function()
        local Index = 1
        while ImageObject.Parent and ImageObject:GetAttribute("ObsidianSpriteId") == AnimationId do
            local Frame = Frames[Index]
            if Frame then
                ImageObject.ImageRectOffset = Frame.Offset or Frame.ImageRectOffset or Vector2.zero
                ImageObject.ImageRectSize = Frame.Size or Frame.ImageRectSize or AtlasInfo.FrameSize or Vector2.zero
            end

            task.wait(1 / Fps)
            Index += 1
            if Index > #Frames then
                if not Loop then
                    break
                end
                Index = 1
            end
        end
    end)

    return AnimationId
end

function Library:StopIconSpriteAnimation(ImageObject: ImageLabel | ImageButton)
    if ImageObject then
        ImageObject:SetAttribute("ObsidianSpriteId", nil)
    end
end

function Library:AddFloatingSprite(Info)
    Info = Info or {}

    local ParentGui = Info.Parent
    if not ParentGui then
        ParentGui = Info.ParentMode == "Window" and ScreenGui or FloatingSpritesGui
    end

    local Sprite = {
        Image = Info.Image or Info.AtlasImage or "",
        Visible = Info.Visible ~= false,
        Playing = Info.Playing ~= false,
        Type = "FloatingSprite",
    }

    local ImageObject = New("ImageLabel", {
        AnchorPoint = Info.AnchorPoint or Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        ImageTransparency = Info.Transparency or 0,
        Position = Info.Position or UDim2.new(0.5, 0, 0, 96),
        ScaleType = Info.ScaleType or Enum.ScaleType.Fit,
        Size = Info.Size or UDim2.fromOffset(96, 96),
        Visible = Sprite.Visible,
        ZIndex = Info.ZIndex or 50000,
        Parent = ParentGui,
    })

    local function ApplyImage(NewImage)
        if NewImage and NewImage ~= "" then
            local Icon = Library:GetCustomIcon(NewImage)
            if Icon then
                ImageObject.Image = Icon.Url
                ImageObject.ImageRectOffset = Icon.ImageRectOffset or Vector2.zero
                ImageObject.ImageRectSize = Icon.ImageRectSize or Vector2.zero
            elseif IsHttpUrl(NewImage) then
                ImageObject.Image = Library:DownloadSprite(NewImage, {
                    FileName = Info.FileName or Info.Name,
                    Folder = Info.Folder,
                    ForceRedownload = Info.ForceRedownload,
                })
            else
                ImageObject.Image = NewImage
            end
        end
    end

    function Sprite:Play()
        Sprite.Playing = true
        Library:AnimateIconSprite(ImageObject, {
            Image = Sprite.Image,
            FileName = Info.FileName or Info.Name,
            Folder = Info.Folder,
            ForceRedownload = Info.ForceRedownload,
            Frames = Info.Frames,
            FrameSize = Info.FrameSize,
            FrameCount = Info.FrameCount,
            Columns = Info.Columns,
            Fps = Info.Fps or Info.FPS,
            Loop = Info.Loop,
        })
    end

    function Sprite:Stop()
        Sprite.Playing = false
        Library:StopIconSpriteAnimation(ImageObject)
    end

    function Sprite:SetImage(NewImage)
        assert(typeof(NewImage) == "string", "SetImage expects a string.")
        Sprite.Image = NewImage
        ApplyImage(NewImage)
        if Sprite.Playing then
            Sprite:Play()
        end
    end

    function Sprite:SetVisible(Visible: boolean)
        Sprite.Visible = Visible
        ImageObject.Visible = Visible
    end

    function Sprite:SetPosition(Position: UDim2)
        assert(typeof(Position) == "UDim2", "SetPosition expects a UDim2.")
        ImageObject.Position = Position
    end

    function Sprite:SetSize(Size: UDim2)
        assert(typeof(Size) == "UDim2", "SetSize expects a UDim2.")
        ImageObject.Size = Size
    end

    function Sprite:SetZIndex(ZIndex: number)
        ImageObject.ZIndex = tonumber(ZIndex) or ImageObject.ZIndex
    end

    function Sprite:SetParent(Parent: Instance)
        assert(typeof(Parent) == "Instance", "SetParent expects an Instance.")
        ImageObject.Parent = Parent
    end

    function Sprite:BringToFront()
        if FloatingSpritesGui then
            FloatingSpritesGui.DisplayOrder = math.max(FloatingSpritesGui.DisplayOrder, 1001)
        end

        ImageObject.ZIndex = math.max(ImageObject.ZIndex, 50000)
        return ImageObject.ZIndex
    end

    function Sprite:Destroy()
        Sprite:Stop()
        ImageObject:Destroy()
    end

    Sprite.ImageObject = ImageObject
    ApplyImage(Sprite.Image)
    if Sprite.Playing then
        Sprite:Play()
    end
    Sprite:BringToFront()

    return Sprite
end

function Library:Validate(Table: { [string]: any }, Template: { [string]: any }): { [string]: any }
    if typeof(Table) ~= "table" then
        return Template
    end

    for k, v in Template do
        if typeof(k) == "number" then
            continue
        end

        if typeof(v) == "table" then
            Table[k] = Library:Validate(Table[k], v)
        elseif Table[k] == nil then
            Table[k] = v
        end
    end

    return Table
end

--// Creator Functions \\--
local function FillInstance(Table: { [string]: any }, Instance: GuiObject)
    local ThemeProperties = Library.Registry[Instance] or {}

    for key, value in Table do
        if key ~= "Text" then
            local SchemeValue = GetSchemeValue(value)

            if SchemeValue or typeof(value) == "function" then
                ThemeProperties[key] = value
                value = SchemeValue or value()
            else
                ThemeProperties[key] = nil
            end
        end

        Instance[key] = value
    end

    if GetTableSize(ThemeProperties) > 0 then
        Library.Registry[Instance] = ThemeProperties
    end
end

function New(ClassName: string, Properties: { [string]: any }): any
    local Instance = Instance.new(ClassName)

    if Templates[ClassName] then
        FillInstance(Templates[ClassName], Instance)
    end
    FillInstance(Properties, Instance)

    if Properties["Parent"] and not Properties["ZIndex"] then
        pcall(function()
            Instance.ZIndex = Properties.Parent.ZIndex
        end)
    end

    return Instance
end

--// Main Instances \\-
local function SafeParentUI(Instance: Instance, Parent: Instance | () -> Instance)
    local success, _error = pcall(function()
        if not Parent then
            Parent = CoreGui
        end

        local DestinationParent
        if typeof(Parent) == "function" then
            DestinationParent = Parent()
        else
            DestinationParent = Parent
        end

        Instance.Parent = DestinationParent
    end)

    if not (success and Instance.Parent) then
        Instance.Parent = Library.LocalPlayer:WaitForChild("PlayerGui", math.huge)
    end
end

local function ParentUI(UI: Instance, SkipHiddenUI: boolean?)
    if SkipHiddenUI then
        SafeParentUI(UI, CoreGui)
        return
    end

    pcall(protectgui, UI)
    SafeParentUI(UI, gethui)
end

local ScreenGui = New("ScreenGui", {
    Name = "Obsidian",
    DisplayOrder = 998,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Global,
})
ParentUI(ScreenGui)
Library.ScreenGui = ScreenGui

local FloatingSpritesGui = New("ScreenGui", {
    Name = "ObsidianFloatingSprites",
    DisplayOrder = 1001,
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Global,
})
ParentUI(FloatingSpritesGui)
Library.FloatingSpritesGui = FloatingSpritesGui

local FullscreenBackground = New("ImageLabel", {
    BackgroundColor3 = "DarkColor",
    BackgroundTransparency = 1,
    Image = "",
    ImageTransparency = 1,
    ScaleType = Enum.ScaleType.Crop,
    Size = UDim2.fromScale(1, 1),
    Visible = false,
    ZIndex = 0,
    Parent = ScreenGui,
})

ScreenGui.DescendantRemoving:Connect(function(Instance)
    Library:RemoveFromRegistry(Instance)
end)

local ModalElement = New("TextButton", {
    BackgroundTransparency = 1,
    Modal = false,
    Size = UDim2.fromScale(0, 0),
    AnchorPoint = Vector2.zero,
    Text = "",
    ZIndex = -999,
    Parent = ScreenGui,
})

--// Cursor
local Cursor, CursorCustomImage
do
    Cursor = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = "WhiteColor",
        Size = UDim2.fromOffset(9, 1),
        Visible = false,
        ZIndex = 11000,
        Parent = ScreenGui,
    })
    New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = "DarkColor",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 2, 1, 2),
        ZIndex = 10999,
        Parent = Cursor,
    })

    local CursorV = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = "WhiteColor",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(1, 9),
        ZIndex = 11000,
        Parent = Cursor,
    })
    New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = "DarkColor",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 2, 1, 2),
        ZIndex = 10999,
        Parent = CursorV,
    })

    CursorCustomImage = New("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(20, 20),
        ZIndex = 11000,
        Visible = false,
        Parent = Cursor,
    })
end

--// Notification
local NotificationArea
local NotificationList
do
    NotificationArea = New("Frame", {
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -6, 0, 6),
        Size = UDim2.new(0, 300, 1, -6),
        Parent = ScreenGui,
    })
    table.insert(
        Library.Scales,
        New("UIScale", {
            Parent = NotificationArea,
        })
    )

    NotificationList = New("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding = UDim.new(0, 8),
        Parent = NotificationArea,
    })
end

--// Lib Functions \\--
function Library:ResetCursorIcon()
    CursorCustomImage.Visible = false
    CursorCustomImage.Size = UDim2.fromOffset(20, 20)
end

function Library:ChangeCursorIcon(ImageId: string)
    if not ImageId or ImageId == "" then
        Library:ResetCursorIcon()
        return
    end

    local Icon = Library:GetCustomIcon(ImageId)
    assert(Icon, "Image must be a valid Roblox asset or a valid URL or a valid lucide icon.")

    CursorCustomImage.Visible = true
    CursorCustomImage.Image = Icon.Url
    CursorCustomImage.ImageRectOffset = Icon.ImageRectOffset
    CursorCustomImage.ImageRectSize = Icon.ImageRectSize
end

function Library:ChangeCursorIconSize(Size: UDim2)
    assert(typeof(Size) == "UDim2", "UDim2 expected.")
    CursorCustomImage.Size = Size
end

function Library:GetBetterColor(Color: Color3, Add: number): Color3
    Add = Add * (Library.IsLightTheme and -4 or 2)
    return Color3.fromRGB(
        math.clamp(Color.R * 255 + Add, 0, 255),
        math.clamp(Color.G * 255 + Add, 0, 255),
        math.clamp(Color.B * 255 + Add, 0, 255)
    )
end

function Library:GetLighterColor(Color: Color3): Color3
    local H, S, V = Color:ToHSV()
    return Color3.fromHSV(H, math.max(0, S - 0.1), math.min(1, V + 0.1))
end

function Library:GetDarkerColor(Color: Color3): Color3
    local H, S, V = Color:ToHSV()
    return Color3.fromHSV(H, S, V / 2)
end

function Library:GetKeyString(KeyCode: Enum.KeyCode)
    if KeyCode.EnumType == Enum.KeyCode and KeyCode.Value > 33 and KeyCode.Value < 127 then
        return string.char(KeyCode.Value)
    end

    return KeyCode.Name
end

function Library:GetTextBounds(Text: string, FontFace: any, Size: number, Width: number?): (number, number)
    if typeof(FontFace) == "table" and FontFace.Type == "CustomFont" and FontFace.GetTextBounds then
        return FontFace:GetTextBounds(Text, Size, Width)
    end

    local Params = Instance.new("GetTextBoundsParams")
    Params.Text = Text
    Params.RichText = true
    Params.Font = FontFace
    Params.Size = Size
    Params.Width = Width or workspace.CurrentCamera.ViewportSize.X - 32

    local Bounds = TextService:GetTextBoundsAsync(Params)
    return Bounds.X, Bounds.Y
end

function Library:MouseIsOverFrame(Frame: GuiObject, Mouse: Vector2): boolean
    local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize
    return Mouse.X >= AbsPos.X
        and Mouse.X <= AbsPos.X + AbsSize.X
        and Mouse.Y >= AbsPos.Y
        and Mouse.Y <= AbsPos.Y + AbsSize.Y
end

function Library:SafeCallback(Func: (...any) -> ...any, ...: any)
    if not (Func and typeof(Func) == "function") then
        return
    end

    local Result = table.pack(xpcall(Func, function(Error)
        task.defer(error, debug.traceback(Error, 2))
        if Library.NotifyOnError then
            Library:Notify(Error)
        end

        return Error
    end, ...))

    if not Result[1] then
        return nil
    end

    return table.unpack(Result, 2, Result.n)
end

function Library:MakeDraggable(UI: GuiObject, DragFrame: GuiObject, IgnoreToggled: boolean?, IsMainWindow: boolean?)
    local StartPos
    local FramePos
    local Dragging = false
    local Changed
    DragFrame.InputBegan:Connect(function(Input: InputObject)
        if not IsClickInput(Input) or IsMainWindow and Library.CantDragForced then
            return
        end

        StartPos = Input.Position
        FramePos = UI.Position
        Dragging = true

        Changed = Input.Changed:Connect(function()
            if Input.UserInputState ~= Enum.UserInputState.End then
                return
            end

            Dragging = false
            if Changed and Changed.Connected then
                Changed:Disconnect()
                Changed = nil
            end
        end)
    end)
    Library:GiveSignal(UserInputService.InputChanged:Connect(function(Input: InputObject)
        if
            (not IgnoreToggled and not Library.Toggled)
            or (IsMainWindow and Library.CantDragForced)
            or not (ScreenGui and ScreenGui.Parent)
        then
            Dragging = false
            if Changed and Changed.Connected then
                Changed:Disconnect()
                Changed = nil
            end

            return
        end

        if Dragging and IsHoverInput(Input) then
            local Delta = Input.Position - StartPos
            UI.Position =
                UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
        end
    end))
end

function Library:MakeResizable(UI: GuiObject, DragFrame: GuiObject, Callback: () -> ()?)
    local StartPos
    local FrameSize
    local Dragging = false
    local Changed

    DragFrame.InputBegan:Connect(function(Input: InputObject)
        if not IsClickInput(Input) then
            return
        end

        StartPos = Input.Position
        FrameSize = UI.Size
        Dragging = true

        Changed = Input.Changed:Connect(function()
            if Input.UserInputState ~= Enum.UserInputState.End then
                return
            end

            Dragging = false
            if Changed and Changed.Connected then
                Changed:Disconnect()
                Changed = nil
            end
        end)
    end)

    Library:GiveSignal(UserInputService.InputChanged:Connect(function(Input: InputObject)
        if not UI.Visible or not (ScreenGui and ScreenGui.Parent) then
            Dragging = false
            if Changed and Changed.Connected then
                Changed:Disconnect()
                Changed = nil
            end

            return
        end

        if Dragging and IsHoverInput(Input) then
            local Delta = Input.Position - StartPos
            UI.Size = UDim2.new(
                FrameSize.X.Scale,
                math.clamp(FrameSize.X.Offset + Delta.X, Library.MinSize.X, math.huge),
                FrameSize.Y.Scale,
                math.clamp(FrameSize.Y.Offset + Delta.Y, Library.MinSize.Y, math.huge)
            )
            if Callback then
                Library:SafeCallback(Callback)
            end
        end
    end))
end

function Library:MakeCover(Holder: GuiObject, Place: string)
    local Pos = Places[Place] or { 0, 0 }
    local Size = Sizes[Place] or { 1, 0.5 }

    local Cover = New("Frame", {
        AnchorPoint = Vector2.new(Pos[1], Pos[2]),
        BackgroundColor3 = Holder.BackgroundColor3,
        Position = UDim2.fromScale(Pos[1], Pos[2]),
        Size = UDim2.fromScale(Size[1], Size[2]),
        Parent = Holder,
    })

    return Cover
end

function Library:MakeLine(Frame: GuiObject, Info)
    local Line = New("Frame", {
        AnchorPoint = Info.AnchorPoint or Vector2.zero,
        BackgroundColor3 = "OutlineColor",
        Position = Info.Position,
        Size = Info.Size,
        ZIndex = Info.ZIndex or Frame.ZIndex,
        Parent = Frame,
    })

    return Line
end

function Library:GetRainbowTargets(Targets)
    local DefaultTargets = {
        Window = true,
        Groupboxes = true,
        DependencyGroupboxes = false,
        Tabboxes = false,
        Cards = false,
        Popups = false,
    }

    if typeof(Targets) ~= "table" then
        return DefaultTargets
    end

    local SelectedTargets = {
        Window = false,
        Groupboxes = false,
        DependencyGroupboxes = false,
        Tabboxes = false,
        Cards = false,
        Popups = false,
    }

    for Target, Enabled in Targets do
        SelectedTargets[Target] = Enabled == true
    end

    return SelectedTargets
end

function Library:RainbowTargetEnabled(Target: string?): boolean
    if not Library.RainbowBorderEnabled then
        return false
    end

    if not Target then
        return true
    end

    return Library.RainbowBorderTargets[Target] == true
end

local function IsRainbowStrokeEnabled(Data)
    if Data.Override == false then
        return false
    end

    if Data.Target then
        return Library:RainbowTargetEnabled(Data.Target)
    end

    return Data.Override == true
end

local function ResolveStrokeColor(Color)
    local SchemeValue = GetSchemeValue(Color)
    if SchemeValue then
        return SchemeValue
    end

    if typeof(Color) == "Color3" then
        return Color
    end

    return Library.Scheme.OutlineColor
end

function Library:ApplyRainbowStroke(Stroke: UIStroke, Data)
    if not (Stroke and Stroke.Parent) then
        Library.RainbowStrokes[Stroke] = nil
        return
    end

    local Enabled = IsRainbowStrokeEnabled(Data)
    if Enabled then
        return
    end

    Stroke.Color = ResolveStrokeColor(Data.Color)
end

function Library:EnsureRainbowConnection()
    if Library.RainbowConnection then
        return
    end

    Library.RainbowConnection = RunService.RenderStepped:Connect(function(DeltaTime)
        if Library.Unloaded then
            return
        end

        local HasStroke = false
        for Stroke, Data in Library.RainbowStrokes do
            if not (Stroke and Stroke.Parent) then
                Library.RainbowStrokes[Stroke] = nil
                continue
            end

            HasStroke = true
            local Enabled = IsRainbowStrokeEnabled(Data)
            if Enabled then
                Data.Hue = (Data.Hue + (Data.Speed or Library.RainbowBorderSpeed) * math.clamp(DeltaTime or 0, 0, 1 / 15)) % 1
                Stroke.Color = Color3.fromHSV(
                    Data.Hue,
                    Data.Saturation or Library.RainbowBorderSaturation,
                    Data.Value or Library.RainbowBorderValue
                )
            end
        end

        if not HasStroke and Library.RainbowConnection then
            Library.RainbowConnection:Disconnect()
            Library.RainbowConnection = nil
        end
    end)

    Library:GiveSignal(Library.RainbowConnection)
end

function Library:RegisterRainbowStroke(Stroke: UIStroke, Info)
    Info = Info or {}
    local Override = Info.Rainbow
    if Override == false then
        return
    end

    Library.RainbowStrokes[Stroke] = {
        Target = Info.RainbowTarget,
        Override = Override,
        Color = Info.Color or "OutlineColor",
        Hue = Info.RainbowHue or 0,
        Speed = Info.RainbowSpeed,
        Saturation = Info.RainbowSaturation,
        Value = Info.RainbowValue,
    }
    Library:ApplyRainbowStroke(Stroke, Library.RainbowStrokes[Stroke])
    if IsRainbowStrokeEnabled(Library.RainbowStrokes[Stroke]) then
        Library:EnsureRainbowConnection()
    end
end

function Library:RefreshRainbowStrokes()
    local HasActiveStroke = false
    for Stroke, Data in Library.RainbowStrokes do
        Library:ApplyRainbowStroke(Stroke, Data)
        if Stroke and Stroke.Parent and IsRainbowStrokeEnabled(Data) then
            HasActiveStroke = true
        end
    end

    if HasActiveStroke then
        Library:EnsureRainbowConnection()
    elseif Library.RainbowConnection then
        Library.RainbowConnection:Disconnect()
        Library.RainbowConnection = nil
    end
end

function Library:AddOutline(Frame: GuiObject, Info)
    Info = Info or {}

    local OutlineStroke = New("UIStroke", {
        Color = Info.Color or "OutlineColor",
        Thickness = Info.Thickness or 1,
        Transparency = Info.Transparency or 0,
        ZIndex = Info.ZIndex or 2,
        Parent = Frame,
    })
    local ShadowThickness = Info.ShadowThickness or 1.5
    local ShadowTransparency = Info.ShadowTransparency or 0
    local ShadowColor = Info.ShadowColor or "DarkColor"
    local ShadowStroke = New("UIStroke", {
        Color = ShadowColor,
        Thickness = ShadowThickness,
        Transparency = ShadowTransparency,
        ZIndex = Info.ShadowZIndex or 1,
        Parent = Frame,
    })

    if Info.Rainbow == true or Info.RainbowTarget ~= nil then
        Library:RegisterRainbowStroke(OutlineStroke, Info)
    end

    return OutlineStroke, ShadowStroke
end

function Library:AddGradient(Frame: GuiObject, Info)
    Info = Info or {}

    local Gradient = New("UIGradient", {
        Color = Info.Color or Info.ColorSequence or ColorSequence.new({
            ColorSequenceKeypoint.new(0, Library.Scheme.AccentColor),
            ColorSequenceKeypoint.new(1, Library.Scheme.BackgroundColor),
        }),
        Offset = Info.Offset or Vector2.zero,
        Rotation = Info.Rotation or 0,
        Transparency = Info.Transparency or NumberSequence.new(0),
        Parent = Frame,
    })

    return Gradient
end

function Library:AddBlank(Frame: GuiObject, Size: UDim2)
    return New("Frame", {
        BackgroundTransparency = 1,
        Size = Size or UDim2.fromScale(0, 0),
        Parent = Frame,
    })
end

--// Deprecated \\--
function Library:MakeOutline(Frame: GuiObject, Corner: number?, ZIndex: number?)
    warn("Obsidian:MakeOutline is deprecated, please use Obsidian:AddOutline instead.")
    local Holder = New("Frame", {
        BackgroundColor3 = "DarkColor",
        Position = UDim2.fromOffset(-2, -2),
        Size = UDim2.new(1, 4, 1, 4),
        ZIndex = ZIndex,
        Parent = Frame,
    })

    local Outline = New("Frame", {
        BackgroundColor3 = "OutlineColor",
        Position = UDim2.fromOffset(1, 1),
        Size = UDim2.new(1, -2, 1, -2),
        ZIndex = ZIndex,
        Parent = Holder,
    })

    if Corner and Corner > 0 then
        New("UICorner", {
            CornerRadius = UDim.new(0, Corner + 1),
            Parent = Holder,
        })
        New("UICorner", {
            CornerRadius = UDim.new(0, Corner),
            Parent = Outline,
        })
    end

    return Holder, Outline
end

function Library:AddDraggableLabel(Text: string)
    local Table = {}

    local Label = New("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = "BackgroundColor",
        Size = UDim2.fromOffset(0, 0),
        Position = UDim2.new(0.5, 0, 0, 6),
        Text = Text,
        TextSize = 15,
        ZIndex = 10,
        Parent = FloatingSpritesGui or ScreenGui,
    })
    table.insert(
        Library.Corners,
        New("UICorner", {
            CornerRadius = UDim.new(0, Library.CornerRadius),
            Parent = Label,
        })
    )
    New("UIPadding", {
        PaddingBottom = UDim.new(0, 6),
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 6),
        Parent = Label,
    })
    table.insert(
        Library.Scales,
        New("UIScale", {
            Parent = Label,
        })
    )
    Library:AddOutline(Label)

    Library:MakeDraggable(Label, Label, true)

    Table.Label = Label

    function Table:SetText(Text: string)
        Label.Text = Text
    end

    function Table:SetVisible(Visible: boolean)
        Label.Visible = Visible
    end

    return Table
end

function Library:AddDraggableButton(Text: string, Func, ExcludeScaling: boolean?)
    local Table = {}

    local Button = New("TextButton", {
        BackgroundColor3 = "BackgroundColor",
        Position = UDim2.fromOffset(6, 6),
        TextSize = 16,
        ZIndex = 10,
        Parent = ScreenGui,
    })
    table.insert(
        Library.Corners,
        New("UICorner", {
            CornerRadius = UDim.new(0, Library.CornerRadius),
            Parent = Button,
        })
    )
    if not ExcludeScaling then
        table.insert(
            Library.Scales,
            New("UIScale", {
                Parent = Button,
            })
        )
    end
    Library:AddOutline(Button)

    Button.MouseButton1Click:Connect(function()
        Library:SafeCallback(Func, Table)
    end)
    Library:MakeDraggable(Button, Button, true)

    Table.Button = Button

    function Table:SetText(Text: string)
        local X, Y = Library:GetTextBounds(Text, Library.Scheme.Font, 16)

        Button.Text = Text
        Button.Size = UDim2.fromOffset(X * 2, Y * 2)
    end
    Table:SetText(Text)

    return Table
end

function Library:SetupPlatformButtons(WindowInfo, Platform: "Mobile" | "Desktop")
    local IsMobilePlatform = Platform == "Mobile"
    local ShowButtons = IsMobilePlatform and WindowInfo.ShowMobileButtons ~= false
        or not IsMobilePlatform and WindowInfo.ShowDesktopButtons ~= false
    local ButtonsSide = IsMobilePlatform and WindowInfo.MobileButtonsSide or WindowInfo.DesktopButtonsSide

    local ToggleButton = Library:AddDraggableButton("Toggle", function()
        Library:Toggle()
    end, true)

    local LockButton = Library:AddDraggableButton("Lock", function(self)
        Library.CantDragForced = not Library.CantDragForced
        self:SetText(Library.CantDragForced and "Unlock" or "Lock")
    end, true)

    if IsMobilePlatform and tostring(WindowInfo.MobileButtonsMode):lower() == "topbarplus" then
        local Success, Topbar = pcall(function()
            return loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/tanhoangviet/ToolForLua/refs/heads/main/TopbarPlus_Extended.lua"
                )
            )()
        end)
        if Success and Topbar and Topbar.Icon then
            ToggleButton.Button.Visible = false
            LockButton.Button.Visible = false

            local Icon = Topbar.Icon
            local Eye = Icon.new():setLabel("UI"):setImage(6031071050):align("Left")
            Eye.toggled:Connect(function(On)
                Library:Toggle(On)
            end)

            local LockTop = Icon.new():setLabel("Lock"):setImage(6035047409):align("Left")
            LockTop.toggled:Connect(function(On)
                Library.CantDragForced = On
            end)
        else
            Library:NotifyWarning({
                Title = "TopbarPlus",
                Description = "Failed to load TopbarPlus, fallback to normal mobile buttons.",
                Time = 4,
            })
        end
    elseif ButtonsSide == "Right" then
        ToggleButton.Button.Position = UDim2.new(1, -6, 0, 6)
        ToggleButton.Button.AnchorPoint = Vector2.new(1, 0)

        LockButton.Button.Position = UDim2.new(1, -6, 0, 46)
        LockButton.Button.AnchorPoint = Vector2.new(1, 0)
    else
        LockButton.Button.Position = UDim2.fromOffset(6, 46)
    end

    if not ShowButtons then
        ToggleButton.Button.Visible = false
        LockButton.Button.Visible = false
    end

    return ToggleButton, LockButton
end

function Library:CloseOpenMenus(): boolean
    if CurrentMenu then
        CurrentMenu:Close()
        return true
    end

    local Closed = false
    for _, Option in Library.Options do
        if Option.Type == "ColorPicker" then
            if Option.ColorMenu and Option.ColorMenu.Active then
                Option.ColorMenu:Close()
                Closed = true
            end
            if Option.ContextMenu and Option.ContextMenu.Active then
                Option.ContextMenu:Close()
                Closed = true
            end
        elseif (Option.Type == "Dropdown" or Option.Type == "KeyPicker") and Option.Menu and Option.Menu.Active then
            Option.Menu:Close()
            Closed = true
        end
    end

    return Closed
end

function Library:AddDraggableMenu(Name: string, Info)
    Info = typeof(Info) == "table" and Info or {}
    local SizeInfo = typeof(Info.Size) == "UDim2" and Info.Size or nil
    local Width = math.max(180, (SizeInfo and SizeInfo.X.Offset > 0 and SizeInfo.X.Offset) or Info.Width or 280)
    local FixedHeight = (SizeInfo and SizeInfo.Y.Offset > 0 and SizeInfo.Y.Offset) or Info.Height or nil
    local MaxHeight = Info.MaxHeight or Info.MaximumHeight or nil
    if FixedHeight then
        FixedHeight = math.max(70, FixedHeight)
    end
    if MaxHeight then
        MaxHeight = math.max(70, MaxHeight)
    end
    local UseHeightConstraint = FixedHeight ~= nil or MaxHeight ~= nil

    local Holder = New("Frame", {
        AutomaticSize = UseHeightConstraint and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
        BackgroundColor3 = "BackgroundColor",
        ClipsDescendants = true,
        Position = UDim2.fromOffset(6, 6),
        Size = UDim2.fromOffset(Width, FixedHeight or 0),
        ZIndex = 10,
        Parent = ScreenGui,
    })
    table.insert(
        Library.Corners,
        New("UICorner", {
            CornerRadius = UDim.new(0, Library.CornerRadius),
            Parent = Holder,
        })
    )
    table.insert(
        Library.Scales,
        New("UIScale", {
            Parent = Holder,
        })
    )
    Library:AddOutline(Holder)

    Library:MakeLine(Holder, {
        Position = UDim2.fromOffset(0, 34),
        Size = UDim2.new(1, 0, 0, 1),
    })

    local Label = New("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 34),
        Text = Name,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Holder,
    })
    New("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        Parent = Label,
    })

    local Container = New("ScrollingFrame", {
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        AutomaticSize = UseHeightConstraint and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.fromScale(0, 0),
        Position = UDim2.fromOffset(0, 35),
        ScrollBarImageColor3 = "OutlineColor",
        ScrollBarThickness = UseHeightConstraint and 2 or 0,
        Size = UseHeightConstraint and UDim2.new(1, 0, 1, -35) or UDim2.new(1, 0, 0, 0),
        Parent = Holder,
    })
    local ContainerList = New("UIListLayout", {
        Padding = UDim.new(0, 7),
        Parent = Container,
    })
    New("UIPadding", {
        PaddingBottom = UDim.new(0, 7),
        PaddingLeft = UDim.new(0, 7),
        PaddingRight = UDim.new(0, 7),
        PaddingTop = UDim.new(0, 7),
        Parent = Container,
    })

    local function RefreshConstrainedHeight()
        if not UseHeightConstraint then
            return
        end

        local ContentHeight = ContainerList.AbsoluteContentSize.Y + 14
        local TargetHeight = FixedHeight or math.min(ContentHeight + 35, MaxHeight or ContentHeight + 35)
        TargetHeight = math.max(70, TargetHeight)

        Holder.Size = UDim2.fromOffset(Width, TargetHeight)
        Container.Size = UDim2.new(1, 0, 1, -35)
        Container.ScrollBarThickness = ContentHeight + 35 > TargetHeight and 2 or 0
    end

    if UseHeightConstraint then
        Library:GiveSignal(ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(RefreshConstrainedHeight))
        task.defer(RefreshConstrainedHeight)
    end

    Holder:SetAttribute("ObsidianMenuWidth", Width)
    Holder:SetAttribute("ObsidianMenuHeight", FixedHeight or 0)
    Holder:SetAttribute("ObsidianMenuMaxHeight", MaxHeight or 0)

    Library:MakeDraggable(Holder, Label, true)
    return Holder, Container
end

function Library:SetKeybindMenuSize(Width: number?, Height: number?)
    if not Library.KeybindFrame or not Library.KeybindContainer then
        return
    end

    Width = math.max(180, tonumber(Width) or Library.KeybindFrame.Size.X.Offset)
    local TargetHeight = Library.KeybindFrame.Size.Y.Offset
    if TargetHeight < 70 then
        TargetHeight = Library.KeybindMenuHeight or Library.KeybindMenuMaxHeight or 220
    end
    if Height ~= nil then
        TargetHeight = math.max(70, tonumber(Height) or TargetHeight)
    end

    Library.KeybindMenuWidth = Width
    Library.KeybindMenuHeight = TargetHeight

    Library.KeybindFrame.Size = UDim2.fromOffset(Width, TargetHeight)
    Library.KeybindContainer.Size = UDim2.new(1, 0, 1, -35)
    Library.KeybindContainer.ScrollBarThickness = 2
end

function Library:AddKeybindMenuButton(Info)
    assert(Library.KeybindContainer, "Create a window before adding keybind menu controls.")
    Info = typeof(Info) == "table" and Info or { Text = tostring(Info or "Button") }

    local Button = {
        Text = Info.Text or "Button",
        Disabled = Info.Disabled == true,
        Visible = Info.Visible ~= false,
        Callback = Info.Callback or Info.Func or function() end,
        Type = "KeybindMenuButton",
    }

    local Holder = New("TextButton", {
        Active = not Button.Disabled,
        BackgroundColor3 = "MainColor",
        BackgroundTransparency = Info.Transparency or 0.16,
        ClipsDescendants = true,
        Size = UDim2.new(1, 0, 0, Info.Height or 26),
        Text = "",
        Visible = Button.Visible,
        Parent = Library.KeybindContainer,
    })
    table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = Holder }))
    Library:AddOutline(Holder, {
        Color = Info.StrokeColor or "AccentColor",
        Transparency = Info.StrokeTransparency or 0.55,
        ShadowTransparency = 1,
    })
    Library:AddGradient(Holder, {
        Rotation = Info.GradientRotation or 10,
        Transparency = Info.GradientTransparency or NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.65),
            NumberSequenceKeypoint.new(1, 0.95),
        }),
    })

    local Label = New("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = Button.Text,
        TextSize = Info.TextSize or 13,
        TextTransparency = Button.Disabled and 0.75 or 0.08,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = Holder,
    })

    Holder.MouseButton1Click:Connect(function()
        if Button.Disabled then
            return
        end

        Library:SafeCallback(Button.Callback, Button)
    end)

    function Button:SetText(Text)
        Button.Text = tostring(Text)
        Label.Text = Button.Text
    end

    function Button:SetDisabled(Disabled)
        Button.Disabled = Disabled == true
        Holder.Active = not Button.Disabled
        Label.TextTransparency = Button.Disabled and 0.75 or 0.08
    end

    function Button:SetVisible(Visible)
        Button.Visible = Visible == true
        Holder.Visible = Button.Visible
    end

    Button.Holder = Holder
    Button.Label = Label
    return Button
end

function Library:AddKeybindMenuToggle(Idx, Info)
    assert(Library.KeybindContainer, "Create a window before adding keybind menu controls.")
    if typeof(Idx) == "table" then
        Info = Idx
        Idx = nil
    end
    Info = Info or {}

    local Toggle = {
        Text = Info.Text or tostring(Idx or "Toggle"),
        Value = Info.Default == true,
        Disabled = Info.Disabled == true,
        Visible = Info.Visible ~= false,
        Callback = Info.Callback or function() end,
        Changed = Info.Changed or function() end,
        Type = "KeybindMenuToggle",
    }

    local Holder = New("TextButton", {
        Active = not Toggle.Disabled,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, Info.Height or 24),
        Text = "",
        Visible = Toggle.Visible,
        Parent = Library.KeybindContainer,
    })

    local Track = New("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = "OutlineColor",
        BackgroundTransparency = 0.22,
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(40, 20),
        Parent = Holder,
    })
    table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Track }))
    Library:AddOutline(Track, { Color = "AccentColor", Transparency = 0.55, ShadowTransparency = 1 })
    Library:AddGradient(Track, {
        Rotation = 0,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.55),
            NumberSequenceKeypoint.new(1, 0.92),
        }),
    })

    local Knob = New("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = "WhiteColor",
        Position = UDim2.new(0, 4, 0.5, 0),
        Size = UDim2.fromOffset(12, 12),
        Parent = Track,
    })
    table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Knob }))

    local Label = New("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(48, 0),
        Size = UDim2.new(1, -48, 1, 0),
        Text = Toggle.Text,
        TextSize = Info.TextSize or 13,
        TextTransparency = 0.4,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Holder,
    })

    function Toggle:Display()
        TweenService:Create(Track, Library.TweenInfo, {
            BackgroundColor3 = Toggle.Value and Library.Scheme.AccentColor or Library.Scheme.OutlineColor,
            BackgroundTransparency = Toggle.Value and 0.04 or 0.22,
        }):Play()
        TweenService:Create(Knob, Library.TweenInfo, {
            Position = Toggle.Value and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 4, 0.5, 0),
        }):Play()
        Label.TextTransparency = Toggle.Disabled and 0.8 or Toggle.Value and 0 or 0.4
    end

    function Toggle:SetValue(Value)
        if Toggle.Disabled then
            return
        end

        Toggle.Value = Value == true
        Toggle:Display()
        Library:UpdateDependencyBoxes()
        Library:SafeCallback(Toggle.Callback, Toggle.Value)
        Library:SafeCallback(Toggle.Changed, Toggle.Value)
    end

    function Toggle:OnChanged(Func)
        Toggle.Changed = Func
    end

    function Toggle:SetText(Text)
        Toggle.Text = tostring(Text)
        Label.Text = Toggle.Text
    end

    function Toggle:SetDisabled(Disabled)
        Toggle.Disabled = Disabled == true
        Holder.Active = not Toggle.Disabled
        Toggle:Display()
    end

    function Toggle:SetVisible(Visible)
        Toggle.Visible = Visible == true
        Holder.Visible = Toggle.Visible
    end

    Holder.MouseButton1Click:Connect(function()
        Toggle:SetValue(not Toggle.Value)
    end)

    Toggle.Holder = Holder
    Toggle.Track = Track
    Toggle.Knob = Knob
    Toggle.Label = Label
    Toggle:Display()

    if Idx then
        Toggles[Idx] = Toggle
        Options[Idx] = Toggle
    end

    return Toggle
end

--// Watermark - Deprecated \\--
do
    local WatermarkLabel = Library:AddDraggableLabel("")
    WatermarkLabel:SetVisible(false)

    function Library:SetWatermark(Text: string)
        warn("Watermark is deprecated, please use Library:AddDraggableLabel instead.")
        WatermarkLabel:SetText(Text)
    end

    function Library:SetWatermarkVisibility(Visible: boolean)
        warn("Watermark is deprecated, please use Library:AddDraggableLabel instead.")
        WatermarkLabel:SetVisible(Visible)
    end
end

--// Context Menu \\--
local CurrentMenu
function Library:AddContextMenu(
    Holder: GuiObject,
    Size: UDim2 | () -> (),
    Offset: { [number]: number } | () -> {},
    List: number?,
    ActiveCallback: (Active: boolean) -> ()?,
    IgnoreCornerRadius: boolean?
)
    local Menu
    local ParentGui = Holder:FindFirstAncestorOfClass("ScreenGui")
    if ParentGui ~= ScreenGui and (Library.ActiveLoading and ParentGui ~= Library.ActiveLoading.ScreenGui) then
        ParentGui = ScreenGui
    end

    if List then
        Menu = New("ScrollingFrame", {
            AutomaticCanvasSize = List == 2 and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
            AutomaticSize = List == 1 and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
            BackgroundColor3 = "BackgroundColor",
            BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
            CanvasSize = UDim2.fromOffset(0, 0),
            ScrollBarImageColor3 = "OutlineColor",
            ScrollBarThickness = List == 2 and 2 or 0,
            Size = typeof(Size) == "function" and Size() or Size,
            TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
            Visible = false,
            ZIndex = 10,
            Parent = ParentGui,
        })
    else
        Menu = New("Frame", {
            BackgroundColor3 = "BackgroundColor",
            Size = typeof(Size) == "function" and Size() or Size,
            Visible = false,
            ZIndex = 10,
            Parent = ParentGui,
        })
    end
    table.insert(
        Library.Scales,
        New("UIScale", {
            Parent = Menu,
        })
    )

    New("UIStroke", {
        Color = "OutlineColor",
        Parent = Menu,
    })

    if IgnoreCornerRadius ~= true then
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Menu,
            })
        )
    end

    local Table = {
        Active = false,
        Holder = Holder,
        Menu = Menu,
        List = nil,
        Signal = nil,

        Size = Size,
    }

    if List then
        Table.List = New("UIListLayout", {
            Parent = Menu,
        })
    end

    function Table:Open()
        if CurrentMenu == Table then
            return
        elseif CurrentMenu then
            CurrentMenu:Close()
        end

        CurrentMenu = Table
        Table.Active = true

        if typeof(Offset) == "function" then
            Menu.Position = UDim2.fromOffset(
                math.floor(Holder.AbsolutePosition.X + Offset()[1]),
                math.floor(Holder.AbsolutePosition.Y + Offset()[2])
            )
        else
            Menu.Position = UDim2.fromOffset(
                math.floor(Holder.AbsolutePosition.X + Offset[1]),
                math.floor(Holder.AbsolutePosition.Y + Offset[2])
            )
        end
        Menu.Size = typeof(Table.Size) == "function" and Table.Size() or Table.Size
        if typeof(ActiveCallback) == "function" then
            Library:SafeCallback(ActiveCallback, true)
        end

        Menu.Visible = true

        Table.Signal = Holder:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
            if typeof(Offset) == "function" then
                Menu.Position = UDim2.fromOffset(
                    math.floor(Holder.AbsolutePosition.X + Offset()[1]),
                    math.floor(Holder.AbsolutePosition.Y + Offset()[2])
                )
            else
                Menu.Position = UDim2.fromOffset(
                    math.floor(Holder.AbsolutePosition.X + Offset[1]),
                    math.floor(Holder.AbsolutePosition.Y + Offset[2])
                )
            end
        end)
    end

    function Table:Close()
        if CurrentMenu ~= Table then
            return
        end
        Menu.Visible = false

        if Table.Signal then
            Table.Signal:Disconnect()
            Table.Signal = nil
        end
        Table.Active = false
        CurrentMenu = nil
        if typeof(ActiveCallback) == "function" then
            Library:SafeCallback(ActiveCallback, false)
        end
    end

    function Table:Toggle()
        if Table.Active then
            Table:Close()
        else
            Table:Open()
        end
    end

    function Table:SetSize(Size)
        Table.Size = Size
        Menu.Size = typeof(Size) == "function" and Size() or Size
    end

    return Table
end

function Library:IsSecondaryActionLocked(Holder: GuiObject): boolean
    local UnlockAt = Library.SecondaryActionLocks[Holder]
    if not UnlockAt then
        return false
    end

    if os.clock() <= UnlockAt then
        return true
    end

    Library.SecondaryActionLocks[Holder] = nil
    return false
end

function Library:ConnectSecondaryAction(Holder: GuiObject, Callback: () -> ())
    local function Fire()
        Library.SecondaryActionLocks[Holder] = os.clock() + 0.45
        Library:SafeCallback(Callback)
    end

    Holder.MouseButton2Click:Connect(Fire)
    Holder.InputBegan:Connect(function(Input: InputObject)
        if Input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        local StartPosition = GetPointerPosition(Input)
        local Active = true
        local Changed
        Changed = Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End or Input.UserInputState == Enum.UserInputState.Cancel then
                Active = false
                if Changed and Changed.Connected then
                    Changed:Disconnect()
                end
            end
        end)

        task.delay(0.52, function()
            if not Active or Library.Unloaded or not Holder.Parent then
                return
            end

            local CurrentPosition = GetPointerPosition(Input)
            if (CurrentPosition - StartPosition).Magnitude > 12 then
                return
            end

            if not Library:MouseIsOverFrame(Holder, CurrentPosition) then
                return
            end

            Active = false
            if Changed and Changed.Connected then
                Changed:Disconnect()
            end
            Fire()
        end)
    end)
end

Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input: InputObject)
    if Library.Unloaded then
        return
    end

    if IsClickInput(Input, true) then
        local Location = Input.Position

        if
            CurrentMenu
            and not (
                Library:MouseIsOverFrame(CurrentMenu.Menu, Location)
                or Library:MouseIsOverFrame(CurrentMenu.Holder, Location)
            )
        then
            CurrentMenu:Close()
        end
    end
end))

--// Tooltip \\--
local TooltipLabel = New("TextLabel", {
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundColor3 = "BackgroundColor",
    TextSize = 14,
    TextWrapped = true,
    Visible = false,
    ZIndex = 20,
    Parent = ScreenGui,
})
New("UIPadding", {
    PaddingBottom = UDim.new(0, 2),
    PaddingLeft = UDim.new(0, 4),
    PaddingRight = UDim.new(0, 4),
    PaddingTop = UDim.new(0, 2),
    Parent = TooltipLabel,
})
table.insert(
    Library.Scales,
    New("UIScale", {
        Parent = TooltipLabel,
    })
)
New("UIStroke", {
    Color = "OutlineColor",
    Parent = TooltipLabel,
})
table.insert(
    Library.Corners,
    New("UICorner", {
        CornerRadius = UDim.new(0, Library.CornerRadius / 2),
        Parent = TooltipLabel,
    })
)
TooltipLabel:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
    if Library.Unloaded then
        return
    end

    local X, _ = Library:GetTextBounds(
        TooltipLabel.Text,
        TooltipLabel.FontFace,
        TooltipLabel.TextSize,
        (workspace.CurrentCamera.ViewportSize.X - TooltipLabel.AbsolutePosition.X - 8) / Library.DPIScale
    )

    TooltipLabel.Size = UDim2.fromOffset(X + 8)
end)

local CurrentHoverInstance
function Library:AddTooltip(InfoStr: string, DisabledInfoStr: string, HoverInstance: GuiObject)
    local TooltipTable = {
        Disabled = false,
        Hovering = false,
        Signals = {},
    }

    local function DoHover()
        if
            CurrentHoverInstance == HoverInstance
            or Library.ActiveDialog
            or (CurrentMenu and Library:MouseIsOverFrame(CurrentMenu.Menu, Mouse))
            or (TooltipTable.Disabled and typeof(DisabledInfoStr) ~= "string")
            or (not TooltipTable.Disabled and typeof(InfoStr) ~= "string")
        then
            return
        end
        CurrentHoverInstance = HoverInstance

        local ParentGui = HoverInstance:FindFirstAncestorOfClass("ScreenGui")
        if ParentGui ~= ScreenGui and (Library.ActiveLoading and ParentGui ~= Library.ActiveLoading.ScreenGui) then
            ParentGui = ScreenGui
        end
        TooltipLabel.Parent = ParentGui

        TooltipLabel.Text = TooltipTable.Disabled and DisabledInfoStr or InfoStr
        TooltipLabel.Visible = true

        while
            (Library.Toggled or Library.ActiveLoading)
            and not Library.ActiveDialog
            and Library:MouseIsOverFrame(HoverInstance, Mouse)
            and not (CurrentMenu and Library:MouseIsOverFrame(CurrentMenu.Menu, Mouse))
        do
            TooltipLabel.Position = UDim2.fromOffset(
                Mouse.X + (Library.ShowCustomCursor and 8 or 14),
                Mouse.Y + (Library.ShowCustomCursor and 8 or 12)
            )

            RunService.RenderStepped:Wait()
        end

        TooltipLabel.Visible = false
        CurrentHoverInstance = nil
    end

    local function GiveSignal(Connection: RBXScriptConnection | RBXScriptSignal)
        local ConnectionType = typeof(Connection)
        if Connection and (ConnectionType == "RBXScriptConnection" or ConnectionType == "RBXScriptSignal") then
            table.insert(TooltipTable.Signals, Connection)
        end

        return Connection
    end

    GiveSignal(HoverInstance.MouseEnter:Connect(DoHover))
    GiveSignal(HoverInstance.MouseMoved:Connect(DoHover))
    GiveSignal(HoverInstance.MouseLeave:Connect(function()
        if CurrentHoverInstance ~= HoverInstance then
            return
        end

        TooltipLabel.Visible = false
        CurrentHoverInstance = nil
    end))

    function TooltipTable:Destroy()
        for Index = #TooltipTable.Signals, 1, -1 do
            local Connection = table.remove(TooltipTable.Signals, Index)
            if Connection and Connection.Connected then
                Connection:Disconnect()
            end
        end

        if CurrentHoverInstance == HoverInstance then
            if TooltipLabel then
                TooltipLabel.Visible = false
            end

            CurrentHoverInstance = nil
        end
    end

    table.insert(Tooltips, TooltipLabel)
    return TooltipTable
end

function Library:OnUnload(Callback)
    table.insert(Library.UnloadSignals, Callback)
end

function Library:Unload()
    for Index = #Library.Signals, 1, -1 do
        local Connection = table.remove(Library.Signals, Index)
        if Connection and Connection.Connected then
            Connection:Disconnect()
        end
    end

    for _, Callback in Library.UnloadSignals do
        Library:SafeCallback(Callback)
    end

    if Library.RainbowConnection then
        Library.RainbowConnection:Disconnect()
        Library.RainbowConnection = nil
    end
    table.clear(Library.RainbowStrokes)

    for _, ActionName in Library.KeybindCAS do
        pcall(ContextActionService.UnbindAction, ContextActionService, ActionName)
    end
    table.clear(Library.KeybindCAS)

    for _, Tooltip in Tooltips do
        Library:SafeCallback(Tooltip.Destroy, Tooltip)
    end

    Library.Unloaded = true

    if Library.ActiveLoading then
        Library.ActiveLoading:Destroy()
    end

    if ScreenGui then
        ScreenGui:Destroy()
    end

    if FloatingSpritesGui then
        FloatingSpritesGui:Destroy()
    end

    getgenv().Library = nil
end

local CheckIcon = Library:GetIcon("check")
local ArrowIcon = Library:GetIcon("chevron-up")
local ResizeIcon = Library:GetIcon("maximize-2")
local KeyIcon = Library:GetIcon("key")
local MoveIcon = Library:GetIcon("move")
local EllipsisIcon = Library:GetIcon("ellipsis")

function Library:SetIconModule(module: IconModule)
    FetchIcons = true
    Icons = module

    -- Top ten fixes 🚀
    CheckIcon = Library:GetIcon("check")
    ArrowIcon = Library:GetIcon("chevron-up")
    ResizeIcon = Library:GetIcon("maximize-2")
    KeyIcon = Library:GetIcon("key")
    MoveIcon = Library:GetIcon("move")
    EllipsisIcon = Library:GetIcon("ellipsis")
end

local BaseAddons = {}
do
    local Funcs = {}

    function Funcs:AddKeyPicker(Idx, Info)
        Info = Library:Validate(Info, Templates.KeyPicker)

        local ParentObj = self
        local ToggleLabel = ParentObj.TextLabel
        local AddonParent = ParentObj.AddonHolder or ToggleLabel

        local KeyPicker = {
            Text = Info.Text,
            Value = Info.Default, -- Key
            Modifiers = Info.DefaultModifiers, -- Modifiers
            DisplayValue = Info.Default, -- Picker Text

            Blacklisted = Info.Blacklisted,
            BlacklistedModifiers = Info.BlacklistedModifiers,
            Whitelisted = Info.Whitelisted,
            WhitelistedModifiers = Info.WhitelistedModifiers,

            Toggled = false,
            Mode = Info.Mode,
            SyncToggleState = Info.SyncToggleState,

            Callback = Info.Callback,
            ChangedCallback = Info.ChangedCallback,
            Changed = Info.Changed,
            Clicked = Info.Clicked,

            Type = "KeyPicker",
        }

        if KeyPicker.Mode == "Press" then
            assert(ParentObj.Type == "Label", "KeyPicker with the mode 'Press' can be only applied on Labels.")

            KeyPicker.SyncToggleState = false
            Info.Modes = { "Press" }
            Info.Mode = "Press"
        end

        if KeyPicker.SyncToggleState then
            Info.Modes = { "Toggle", "Hold" }

            if not table.find(Info.Modes, Info.Mode) then
                Info.Mode = "Toggle"
            end
        end

        local Picking = false

        -- Special Keys
        local SpecialKeys = {
            ["MB1"] = Enum.UserInputType.MouseButton1,
            ["MB2"] = Enum.UserInputType.MouseButton2,
            ["MB3"] = Enum.UserInputType.MouseButton3,
        }

        local SpecialKeysInput = {
            [Enum.UserInputType.MouseButton1] = "MB1",
            [Enum.UserInputType.MouseButton2] = "MB2",
            [Enum.UserInputType.MouseButton3] = "MB3",
        }

        -- Modifiers
        local Modifiers = {
            ["LAlt"] = Enum.KeyCode.LeftAlt,
            ["RAlt"] = Enum.KeyCode.RightAlt,

            ["LCtrl"] = Enum.KeyCode.LeftControl,
            ["RCtrl"] = Enum.KeyCode.RightControl,

            ["LShift"] = Enum.KeyCode.LeftShift,
            ["RShift"] = Enum.KeyCode.RightShift,

            ["Tab"] = Enum.KeyCode.Tab,
            ["CapsLock"] = Enum.KeyCode.CapsLock,
        }

        local ModifiersInput = {
            [Enum.KeyCode.LeftAlt] = "LAlt",
            [Enum.KeyCode.RightAlt] = "RAlt",

            [Enum.KeyCode.LeftControl] = "LCtrl",
            [Enum.KeyCode.RightControl] = "RCtrl",

            [Enum.KeyCode.LeftShift] = "LShift",
            [Enum.KeyCode.RightShift] = "RShift",

            [Enum.KeyCode.Tab] = "Tab",
            [Enum.KeyCode.CapsLock] = "CapsLock",
        }

        local IsModifierInput = function(Input)
            return Input.UserInputType == Enum.UserInputType.Keyboard and ModifiersInput[Input.KeyCode] ~= nil
        end

        local GetActiveModifiers = function()
            local ActiveModifiers = {}

            for Name, Input in Modifiers do
                if table.find(ActiveModifiers, Name) then
                    continue
                end
                if not UserInputService:IsKeyDown(Input) then
                    continue
                end

                table.insert(ActiveModifiers, Name)
            end

            return ActiveModifiers
        end

        local AreModifiersHeld = function(Required)
            if not (typeof(Required) == "table" and GetTableSize(Required) > 0) then
                return true
            end

            local ActiveModifiers = GetActiveModifiers()
            local Holding = true

            for _, Name in Required do
                if table.find(ActiveModifiers, Name) then
                    continue
                end

                Holding = false
                break
            end

            return Holding
        end

        local IsInputDown = function(Input)
            if not Input then
                return false
            end

            if SpecialKeysInput[Input.UserInputType] ~= nil then
                return UserInputService:IsMouseButtonPressed(Input.UserInputType)
                    and not UserInputService:GetFocusedTextBox()
            elseif Input.UserInputType == Enum.UserInputType.Keyboard then
                return UserInputService:IsKeyDown(Input.KeyCode) and not UserInputService:GetFocusedTextBox()
            else
                return false
            end
        end

        local ConvertToInputModifiers = function(CurrentModifiers)
            local InputModifiers = {}

            for _, name in CurrentModifiers do
                table.insert(InputModifiers, Modifiers[name])
            end

            return InputModifiers
        end

        local VerifyModifiers = function(CurrentModifiers)
            if typeof(CurrentModifiers) ~= "table" then
                return {}
            end

            local ValidModifiers = {}

            for _, name in CurrentModifiers do
                if not Modifiers[name] then
                    continue
                end

                table.insert(ValidModifiers, name)
            end

            return ValidModifiers
        end

        KeyPicker.Modifiers = VerifyModifiers(KeyPicker.Modifiers)

        local function InputMatchesKeybind(Input: InputObject): boolean
            local Key = KeyPicker.Value
            if not Key or Key == "Unknown" or Key == "None" then
                return false
            end
            if not AreModifiersHeld(KeyPicker.Modifiers) then
                return false
            end

            return SpecialKeysInput[Input.UserInputType] == Key
                or (Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Key)
        end

        local function ShouldUseDesktopKeyboardCAS(): boolean
            return false
        end

        local function UpdateKeyPickerCAS()
            local ActionName = Library.KeybindCAS[Idx]
            if ActionName then
                pcall(ContextActionService.UnbindAction, ContextActionService, ActionName)
                Library.KeybindCAS[Idx] = nil
            end

            if Info.NoUI or not ShouldUseDesktopKeyboardCAS() then
                return
            end

            local KeyCode = Enum.KeyCode[KeyPicker.Value]
            ActionName = "ObsidianKeybind_" .. tostring(Idx)
            Library.KeybindCAS[Idx] = ActionName

            ContextActionService:BindAction(ActionName, function(_, State: Enum.UserInputState)
                if Library.Unloaded or UserInputService:GetFocusedTextBox() then
                    return Enum.ContextActionResult.Pass
                end
                if not AreModifiersHeld(KeyPicker.Modifiers) then
                    return Enum.ContextActionResult.Pass
                end

                if KeyPicker.Mode == "Press" and State == Enum.UserInputState.Begin then
                    KeyPicker:DoClick()
                elseif KeyPicker.Mode == "Toggle" and State == Enum.UserInputState.Begin then
                    KeyPicker.Toggled = not KeyPicker.Toggled
                    KeyPicker:DoClick()
                elseif KeyPicker.Mode == "Hold" then
                    if State == Enum.UserInputState.Begin and not KeyPicker.Toggled then
                        KeyPicker.Toggled = true
                        KeyPicker:DoClick()
                    elseif State == Enum.UserInputState.End and KeyPicker.Toggled then
                        KeyPicker.Toggled = false
                        KeyPicker:DoClick()
                    end
                end

                return Enum.ContextActionResult.Pass
            end, false, KeyCode)
        end

        local Picker = New("TextButton", {
            BackgroundColor3 = "MainColor",
            Size = UDim2.fromOffset(18, 18),
            Text = KeyPicker.Value,
            TextSize = 14,
            Parent = AddonParent,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = Picker,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Picker,
            })
        )

        local KeybindsToggle = { Normal = KeyPicker.Mode ~= "Toggle" }
        do
            local Holder = New("TextButton", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Size = UDim2.new(1, 0, 0, GetMobileHitSize(24)),
                Text = "",
                Visible = not Info.NoUI,
                Parent = Library.KeybindContainer,
            })

            local Label = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextSize = 14,
                TextTransparency = 0.5,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = Holder,
            })

            local Track = New("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = "MainColor",
                BackgroundTransparency = 0.2,
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromOffset(40, 20),
                Parent = Holder,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Track,
                })
            )
            Library:AddOutline(Track, {
                Color = "AccentColor",
                Transparency = 0.55,
                ShadowTransparency = 1,
            })
            Library:AddGradient(Track, {
                Rotation = 0,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.55),
                    NumberSequenceKeypoint.new(1, 0.92),
                }),
            })

            local Knob = New("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = "WhiteColor",
                Position = UDim2.new(0, 4, 0.5, 0),
                Size = UDim2.fromOffset(12, 12),
                Parent = Track,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(1, 0),
                    Parent = Knob,
                })
            )

            local KnobGlow = New("UIStroke", {
                Color = "FontColor",
                Transparency = 0.75,
                Parent = Knob,
            })

            function KeybindsToggle:Display(State)
                TweenService:Create(Track, Library.TweenInfo, {
                    BackgroundColor3 = State and Library.Scheme.AccentColor or Library.Scheme.MainColor,
                    BackgroundTransparency = State and 0.04 or 0.2,
                }):Play()
                TweenService:Create(Knob, Library.TweenInfo, {
                    Position = State and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 4, 0.5, 0),
                }):Play()
                KnobGlow.Transparency = State and 0.25 or 0.75
                Label.TextTransparency = State and 0 or 0.5
            end

            function KeybindsToggle:SetText(Text)
                Label.Text = Text
            end

            function KeybindsToggle:SetVisibility(Visibility)
                Holder.Visible = Visibility
            end

            function KeybindsToggle:SetNormal(Normal)
                KeybindsToggle.Normal = Normal

                Holder.Active = not Normal
                Label.Position = Normal and UDim2.fromOffset(0, 0) or UDim2.fromOffset(48, 0)
                Label.Size = Normal and UDim2.fromScale(1, 1) or UDim2.new(1, -48, 1, 0)
                Track.Visible = not Normal
            end

            KeyPicker.DoClick = function(...) end --// make luau lsp shut up
            Holder.MouseButton1Click:Connect(function()
                if KeybindsToggle.Normal then
                    return
                end

                -- Press mode: do not manually change Toggled because DoClick already manages it internally.
                if KeyPicker.Mode == "Press" then
                    KeyPicker:DoClick()
                else
                    KeyPicker.Toggled = not KeyPicker.Toggled
                    KeyPicker:DoClick()
                end
            end)

            KeybindsToggle.Holder = Holder
            KeybindsToggle.Label = Label
            KeybindsToggle.Checkbox = Track
            KeybindsToggle.Track = Track
            KeybindsToggle.Knob = Knob
            KeybindsToggle.Loaded = true
            table.insert(Library.KeybindToggles, KeybindsToggle)
        end

        local MenuTable = Library:AddContextMenu(Picker, UDim2.fromOffset(62, 0), function()
            return { Picker.AbsoluteSize.X + 1.5, 0.5 }
        end, 1, nil, true)
        KeyPicker.Menu = MenuTable

        local ModeButtons = {}
        for _, Mode in Info.Modes do
            local ModeButton = {}

            local Button = New("TextButton", {
                BackgroundColor3 = "MainColor",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, GetMobileHitSize(21)),
                Text = Mode,
                TextSize = 14,
                TextTransparency = 0.5,
                Parent = MenuTable.Menu,
            })

            function ModeButton:Select()
                for _, Button in ModeButtons do
                    Button:Deselect()
                end

                KeyPicker.Mode = Mode

                Button.BackgroundTransparency = 0
                Button.TextTransparency = 0

                MenuTable:Close()
            end

            function ModeButton:Deselect()
                KeyPicker.Mode = nil

                Button.BackgroundTransparency = 1
                Button.TextTransparency = 0.5
            end

            Button.MouseButton1Click:Connect(function()
                ModeButton:Select()
            end)

            if KeyPicker.Mode == Mode then
                ModeButton:Select()
            end

            ModeButtons[Mode] = ModeButton
        end

        function KeyPicker:Display(PickerText)
            if Library.Unloaded then
                return
            end

            local X, Y = Library:GetTextBounds(
                PickerText or KeyPicker.DisplayValue,
                Picker.FontFace,
                Picker.TextSize,
                ToggleLabel.AbsoluteSize.X
            )
            Picker.Text = PickerText or KeyPicker.DisplayValue
            Picker.Size = UDim2.fromOffset((X + 9), math.max(18, Y + 4))
        end

        function KeyPicker:Update()
            KeyPicker:Display()

            if Info.NoUI then
                return
            end

            if KeyPicker.Mode == "Toggle" and ParentObj.Type == "Toggle" and ParentObj.Disabled then
                KeybindsToggle:SetVisibility(false)
                return
            end

            local State = KeyPicker:GetState()
            local ShowToggle = Library.ShowToggleFrameInKeybinds and KeyPicker.Mode == "Toggle"

            if KeyPicker.SyncToggleState and ParentObj.Value ~= State then
                ParentObj:SetValue(State)
            end

            if KeybindsToggle.Loaded then
                if ShowToggle then
                    KeybindsToggle:SetNormal(false)
                else
                    KeybindsToggle:SetNormal(true)
                end

                KeybindsToggle:SetText(("[%s] %s (%s)"):format(KeyPicker.DisplayValue, KeyPicker.Text, KeyPicker.Mode))
                KeybindsToggle:SetVisibility(true)
                KeybindsToggle:Display(State)
            end
        end

        function KeyPicker:GetState()
            if KeyPicker.Mode == "Always" then
                return true
            elseif KeyPicker.Mode == "Hold" then
                local Key = KeyPicker.Value
                if Key == "None" then
                    return false
                end

                if not AreModifiersHeld(KeyPicker.Modifiers) then
                    return false
                end

                if SpecialKeys[Key] ~= nil then
                    return UserInputService:IsMouseButtonPressed(SpecialKeys[Key])
                        and not UserInputService:GetFocusedTextBox()
                else
                    return UserInputService:IsKeyDown(Enum.KeyCode[Key]) and not UserInputService:GetFocusedTextBox()
                end
            else
                return KeyPicker.Toggled
            end
        end

        function KeyPicker:OnChanged(Func)
            KeyPicker.Changed = Func
        end

        function KeyPicker:OnClick(Func)
            KeyPicker.Clicked = Func
        end

        function KeyPicker:DoClick()
            if KeyPicker.Mode == "Press" then
                if KeyPicker.Toggled and Info.WaitForCallback == true then
                    return
                end

                KeyPicker.Toggled = true
            end

            if KeyPicker.SyncToggleState and ParentObj.SetValue and ParentObj.Value ~= KeyPicker.Toggled then
                ParentObj:SetValue(KeyPicker.Toggled)
            end

            Library:SafeCallback(KeyPicker.Callback, KeyPicker.Toggled)
            Library:SafeCallback(KeyPicker.Clicked, KeyPicker.Toggled)

            if KeyPicker.Mode == "Press" then
                KeyPicker.Toggled = false
            end
        end

        function KeyPicker:SetValue(Data)
            local Key, Mode, Modifiers = Data[1], Data[2], Data[3]

            local IsKeyValid, KeyCode = pcall(function()
                if Key == "None" then
                    Key = nil
                    return nil
                end

                if SpecialKeys[Key] == nil then
                    return Enum.KeyCode[Key]
                end

                return SpecialKeys[Key]
            end)

            if Key == nil then
                KeyPicker.Value = "None"
            elseif IsKeyValid then
                KeyPicker.Value = Key
            else
                KeyPicker.Value = "Unknown"
            end

            KeyPicker.Modifiers =
                VerifyModifiers(if typeof(Modifiers) == "table" then Modifiers else KeyPicker.Modifiers)
            KeyPicker.DisplayValue = if GetTableSize(KeyPicker.Modifiers) > 0
                then (table.concat(KeyPicker.Modifiers, " + ") .. " + " .. KeyPicker.Value)
                else KeyPicker.Value

            if ModeButtons[Mode] then
                ModeButtons[Mode]:Select()
            end

            local NewModifiers = ConvertToInputModifiers(KeyPicker.Modifiers)
            Library:SafeCallback(KeyPicker.ChangedCallback, KeyCode, NewModifiers)
            Library:SafeCallback(KeyPicker.Changed, KeyCode, NewModifiers)

            KeyPicker:Update()
            UpdateKeyPickerCAS()
        end

        function KeyPicker:SetText(Text)
            KeybindsToggle:SetText(Text)
            KeyPicker:Update()
        end

        Picker.MouseButton1Click:Connect(function()
            if not UserInputService.KeyboardEnabled then
                return
            end

            if Picking then
                return
            end

            Picking = true

            Picker.Text = "..."
            Picker.Size = UDim2.fromOffset(29, 18)

            -- Wait for an non modifier key --
            local Input
            local ActiveModifiers = {}

            local GetInput = nil
            GetInput = function()
                Input = UserInputService.InputBegan:Wait()
                if UserInputService:GetFocusedTextBox() ~= nil then
                    return true
                end

                if Input.KeyCode == Enum.KeyCode.Escape then
                    return false
                end

                local IsMod = IsModifierInput(Input)
                local KeyName
                if SpecialKeysInput[Input.UserInputType] ~= nil then
                    KeyName = SpecialKeysInput[Input.UserInputType]
                elseif Input.UserInputType == Enum.UserInputType.Keyboard then
                    if IsMod then
                        KeyName = ModifiersInput[Input.KeyCode]
                    else
                        KeyName = Input.KeyCode.Name
                    end
                end

                if KeyName then
                    if IsMod then
                        if
                            KeyPicker.WhitelistedModifiers
                            and #KeyPicker.WhitelistedModifiers > 0
                            and not table.find(KeyPicker.WhitelistedModifiers, KeyName)
                        then
                            return GetInput()
                        end

                        if KeyPicker.BlacklistedModifiers and table.find(KeyPicker.BlacklistedModifiers, KeyName) then
                            return GetInput()
                        end
                    else
                        if
                            KeyPicker.Whitelisted
                            and #KeyPicker.Whitelisted > 0
                            and not table.find(KeyPicker.Whitelisted, KeyName)
                        then
                            return GetInput()
                        end

                        if KeyPicker.Blacklisted and table.find(KeyPicker.Blacklisted, KeyName) then
                            return GetInput()
                        end
                    end
                end

                return false
            end

            repeat
                task.wait()

                -- Wait for any input --
                Picker.Text = "..."
                Picker.Size = UDim2.fromOffset(29, 18)

                if GetInput() then
                    Picking = false
                    KeyPicker:Update()
                    return
                end

                -- Escape --
                if Input.KeyCode == Enum.KeyCode.Escape then
                    break
                end

                -- Handle modifier keys --
                if IsModifierInput(Input) then
                    local StopLoop = false

                    repeat
                        task.wait()
                        if UserInputService:IsKeyDown(Input.KeyCode) then
                            task.wait(0.075)

                            if UserInputService:IsKeyDown(Input.KeyCode) then
                                -- Add modifier to the key list --
                                if not table.find(ActiveModifiers, ModifiersInput[Input.KeyCode]) then
                                    ActiveModifiers[#ActiveModifiers + 1] = ModifiersInput[Input.KeyCode]
                                    KeyPicker:Display(table.concat(ActiveModifiers, " + ") .. " + ...")
                                end

                                -- Wait for another input --
                                if GetInput() then
                                    StopLoop = true
                                    break -- Invalid Input
                                end

                                -- Escape --
                                if Input.KeyCode == Enum.KeyCode.Escape then
                                    break
                                end

                                -- Stop loop if its a normal key --
                                if not IsModifierInput(Input) then
                                    break
                                end
                            else
                                if not table.find(ActiveModifiers, ModifiersInput[Input.KeyCode]) then
                                    break -- Modifier is meant to be used as a normal key --
                                end
                            end
                        end
                    until false

                    if StopLoop then
                        Picking = false
                        KeyPicker:Update()
                        return
                    end
                end

                break -- Input found, end loop
            until false

            local Key = "Unknown"
            if SpecialKeysInput[Input.UserInputType] ~= nil then
                Key = SpecialKeysInput[Input.UserInputType]
            elseif Input.UserInputType == Enum.UserInputType.Keyboard then
                Key = Input.KeyCode == Enum.KeyCode.Escape and "None" or Input.KeyCode.Name
            end

            ActiveModifiers = if Input.KeyCode == Enum.KeyCode.Escape or Key == "Unknown" then {} else ActiveModifiers

            KeyPicker.Toggled = false
            KeyPicker:SetValue({ Key, KeyPicker.Mode, ActiveModifiers })

            -- RunService.RenderStepped:Wait()
            repeat
                task.wait()
            until not IsInputDown(Input) or UserInputService:GetFocusedTextBox()
            Picking = false
        end)
        Picker.MouseButton2Click:Connect(MenuTable.Toggle)

        Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input: InputObject)
            if Library.Unloaded then
                return
            end

            if
                KeyPicker.Mode == "Always"
                or KeyPicker.Value == "Unknown"
                or KeyPicker.Value == "None"
                or Picking
                or UserInputService:GetFocusedTextBox()
            then
                return
            end

            if ShouldUseDesktopKeyboardCAS() and Input.UserInputType == Enum.UserInputType.Keyboard then
                return
            end

            if not InputMatchesKeybind(Input) then
                return
            end

            if KeyPicker.Mode == "Toggle" then
                KeyPicker.Toggled = not KeyPicker.Toggled
                KeyPicker:DoClick()
            elseif KeyPicker.Mode == "Press" then
                KeyPicker:DoClick()
            elseif KeyPicker.Mode == "Hold" and not KeyPicker.Toggled then
                KeyPicker.Toggled = true
                KeyPicker:DoClick()
            end

            KeyPicker:Update()
        end))

        Library:GiveSignal(UserInputService.InputEnded:Connect(function(Input: InputObject)
            if Library.Unloaded then
                return
            end

            if
                KeyPicker.Value == "Unknown"
                or KeyPicker.Value == "None"
                or Picking
                or UserInputService:GetFocusedTextBox()
            then
                return
            end

            if ShouldUseDesktopKeyboardCAS() and Input.UserInputType == Enum.UserInputType.Keyboard then
                return
            end

            if KeyPicker.Mode == "Hold" and KeyPicker.Toggled and InputMatchesKeybind(Input) then
                KeyPicker.Toggled = false
                KeyPicker:DoClick()
            end

            KeyPicker:Update()
        end))

        KeyPicker:Update()
        UpdateKeyPickerCAS()

        if ParentObj.Addons then
            table.insert(ParentObj.Addons, KeyPicker)
        end

        KeyPicker.Default = KeyPicker.Value
        KeyPicker.DefaultModifiers = table.clone(KeyPicker.Modifiers or {})

        Options[Idx] = KeyPicker

        return self
    end

    local HueSequenceTable = {}
    for Hue = 0, 1, 0.1 do
        table.insert(HueSequenceTable, ColorSequenceKeypoint.new(Hue, Color3.fromHSV(Hue, 1, 1)))
    end
    function Funcs:AddColorPicker(Idx, Info)
        Info = Library:Validate(Info, Templates.ColorPicker)

        local ParentObj = self
        local ToggleLabel = ParentObj.TextLabel
        local AddonParent = ParentObj.AddonHolder or ToggleLabel

        local ColorPicker = {
            Value = Info.Default,

            Transparency = Info.Transparency or 0,
            Title = Info.Title,

            Callback = Info.Callback,
            Changed = Info.Changed,

            Type = "ColorPicker",
        }
        ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = ColorPicker.Value:ToHSV()

        local Holder = New("TextButton", {
            BackgroundColor3 = ColorPicker.Value,
            Size = UDim2.fromOffset(18, 18),
            Text = "",
            Parent = AddonParent,
        })

        local HolderStroke = New("UIStroke", {
            Color = Library:GetDarkerColor(ColorPicker.Value),
            Parent = Holder,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Holder,
            })
        )

        local HolderTransparency = New("ImageLabel", {
            Image = CustomImageManager.GetAsset("TransparencyTexture"),
            ImageTransparency = (1 - ColorPicker.Transparency),
            ScaleType = Enum.ScaleType.Tile,
            Position = UDim2.new(0, -1, 0, -1),
            Size = UDim2.new(1, 2, 1, 2),
            TileSize = UDim2.fromOffset(9, 9),
            Parent = Holder,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = HolderTransparency,
            })
        )

        --// Color Menu \\--
        local ColorMenu = Library:AddContextMenu(
            Holder,
            UDim2.fromOffset(Info.Transparency and 256 or 234, 0),
            function()
                return { 0.5, Holder.AbsoluteSize.Y + 1.5 }
            end,
            1
        )
        ColorMenu.List.Padding = UDim.new(0, 8)
        ColorPicker.ColorMenu = ColorMenu

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
            PaddingTop = UDim.new(0, 6),
            Parent = ColorMenu.Menu,
        })

        if typeof(ColorPicker.Title) == "string" then
            New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 8),
                Text = ColorPicker.Title,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ColorMenu.Menu,
            })
        end

        local ColorHolder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 200),
            Parent = ColorMenu.Menu,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 6),
            Parent = ColorHolder,
        })

        --// Sat Map
        local SatVipMap = New("ImageButton", {
            BackgroundColor3 = ColorPicker.Value,
            Image = CustomImageManager.GetAsset("SaturationMap"),
            Size = UDim2.fromOffset(200, 200),
            Parent = ColorHolder,
        })

        local SatVibCursor = New("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = "WhiteColor",
            Size = UDim2.fromOffset(6, 6),
            Parent = SatVipMap,
        })
        New("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = SatVibCursor,
        })
        New("UIStroke", {
            Color = "DarkColor",
            Parent = SatVibCursor,
        })

        --// Hue
        local HueSelector = New("TextButton", {
            Size = UDim2.fromOffset(16, 200),
            Text = "",
            Parent = ColorHolder,
        })
        New("UIGradient", {
            Color = ColorSequence.new(HueSequenceTable),
            Rotation = 90,
            Parent = HueSelector,
        })

        local HueCursor = New("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = "WhiteColor",
            BorderColor3 = "DarkColor",
            BorderSizePixel = 1,
            Position = UDim2.fromScale(0.5, ColorPicker.Hue),
            Size = UDim2.new(1, 2, 0, 1),
            Parent = HueSelector,
        })

        --// Alpha
        local TransparencySelector, TransparencyColor, TransparencyCursor
        if Info.Transparency then
            TransparencySelector = New("ImageButton", {
                Image = CustomImageManager.GetAsset("TransparencyTexture"),
                ScaleType = Enum.ScaleType.Tile,
                Size = UDim2.fromOffset(16, 200),
                TileSize = UDim2.fromOffset(8, 8),
                Parent = ColorHolder,
            })

            TransparencyColor = New("Frame", {
                BackgroundColor3 = ColorPicker.Value,
                Size = UDim2.fromScale(1, 1),
                Parent = TransparencySelector,
            })
            New("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1),
                }),
                Parent = TransparencyColor,
            })

            TransparencyCursor = New("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = "WhiteColor",
                BorderColor3 = "DarkColor",
                BorderSizePixel = 1,
                Position = UDim2.fromScale(0.5, ColorPicker.Transparency),
                Size = UDim2.new(1, 2, 0, 1),
                Parent = TransparencySelector,
            })
        end

        local InfoHolder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 20),
            Parent = ColorMenu.Menu,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0, 8),
            Parent = InfoHolder,
        })

        local HueBox = New("TextBox", {
            BackgroundColor3 = "MainColor",
            ClearTextOnFocus = false,
            Size = UDim2.fromScale(1, 1),
            Text = "#??????",
            TextSize = 14,
            Parent = InfoHolder,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = HueBox,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = HueBox,
            })
        )

        local RgbBox = New("TextBox", {
            BackgroundColor3 = "MainColor",
            ClearTextOnFocus = false,
            Size = UDim2.fromScale(1, 1),
            Text = "?, ?, ?",
            TextSize = 14,
            Parent = InfoHolder,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = RgbBox,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = RgbBox,
            })
        )

        --// Context Menu \\--
        local ContextMenu = Library:AddContextMenu(Holder, UDim2.fromOffset(93, 0), function()
            return { Holder.AbsoluteSize.X + 1.5, 0.5 }
        end, 1)
        ColorPicker.ContextMenu = ContextMenu
        ContextMenu.List.Padding = UDim.new(0, 6)
        do
            local function CreateButton(Text, Func)
                local Button = New("TextButton", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, GetMobileHitSize(21)),
                    Text = Text,
                    TextSize = 14,
                    Parent = ContextMenu.Menu,
                })

                Button.MouseButton1Click:Connect(function()
                    Library:SafeCallback(Func)
                    ContextMenu:Close()
                end)
            end

            CreateButton("Copy color", function()
                Library.CopiedColor = { ColorPicker.Value, ColorPicker.Transparency }
            end)

            ColorPicker.SetValueRGB = function(...) end --// make luau lsp shut up
            CreateButton("Paste color", function()
                ColorPicker:SetValueRGB(Library.CopiedColor[1], Library.CopiedColor[2])
            end)

            if setclipboard then
                CreateButton("Copy Hex", function()
                    setclipboard(tostring(ColorPicker.Value:ToHex()))
                end)

                CreateButton("Copy RGB", function()
                    setclipboard(table.concat({
                        math.floor(ColorPicker.Value.R * 255),
                        math.floor(ColorPicker.Value.G * 255),
                        math.floor(ColorPicker.Value.B * 255),
                    }, ", "))
                end)
            end
        end

        --// End \\--
        function ColorPicker:SetHSVFromRGB(Color)
            ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color:ToHSV()
        end

        function ColorPicker:Display()
            if Library.Unloaded then
                return
            end

            ColorPicker.Value = Color3.fromHSV(ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib)

            Holder.BackgroundColor3 = ColorPicker.Value
            HolderStroke.Color = Library:GetDarkerColor(ColorPicker.Value)
            HolderTransparency.ImageTransparency = (1 - ColorPicker.Transparency)

            SatVipMap.BackgroundColor3 = Color3.fromHSV(ColorPicker.Hue, 1, 1)
            if TransparencyColor then
                TransparencyColor.BackgroundColor3 = ColorPicker.Value
            end

            SatVibCursor.Position = UDim2.fromScale(ColorPicker.Sat, 1 - ColorPicker.Vib)
            HueCursor.Position = UDim2.fromScale(0.5, ColorPicker.Hue)
            if TransparencyCursor then
                TransparencyCursor.Position = UDim2.fromScale(0.5, ColorPicker.Transparency)
            end

            HueBox.Text = "#" .. ColorPicker.Value:ToHex()
            RgbBox.Text = table.concat({
                math.floor(ColorPicker.Value.R * 255),
                math.floor(ColorPicker.Value.G * 255),
                math.floor(ColorPicker.Value.B * 255),
            }, ", ")
        end

        function ColorPicker:Update()
            ColorPicker:Display()

            Library:SafeCallback(ColorPicker.Callback, ColorPicker.Value)
            Library:SafeCallback(ColorPicker.Changed, ColorPicker.Value)
        end

        function ColorPicker:OnChanged(Func)
            ColorPicker.Changed = Func
        end

        function ColorPicker:SetValue(HSV, Transparency)
            if typeof(HSV) == "Color3" then
                ColorPicker:SetValueRGB(HSV, Transparency)
                return
            end

            local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3])
            ColorPicker.Transparency = Info.Transparency and Transparency or 0
            ColorPicker:SetHSVFromRGB(Color)
            ColorPicker:Update()
        end

        function ColorPicker:SetValueRGB(Color, Transparency)
            ColorPicker.Transparency = Info.Transparency and Transparency or 0
            ColorPicker:SetHSVFromRGB(Color)
            ColorPicker:Update()
        end

        Holder.MouseButton1Click:Connect(function()
            if Library:IsSecondaryActionLocked(Holder) then
                return
            end

            ColorMenu:Toggle()
        end)
        Library:ConnectSecondaryAction(Holder, ContextMenu.Toggle)

        SatVipMap.InputBegan:Connect(function(Input: InputObject)
            while IsDragInput(Input) do
                local PointerPosition = GetPointerPosition(Input)
                local MinX = SatVipMap.AbsolutePosition.X
                local MaxX = MinX + SatVipMap.AbsoluteSize.X
                local LocationX = math.clamp(PointerPosition.X, MinX, MaxX)

                local MinY = SatVipMap.AbsolutePosition.Y
                local MaxY = MinY + SatVipMap.AbsoluteSize.Y
                local LocationY = math.clamp(PointerPosition.Y, MinY, MaxY)

                local OldSat = ColorPicker.Sat
                local OldVib = ColorPicker.Vib
                ColorPicker.Sat = (LocationX - MinX) / (MaxX - MinX)
                ColorPicker.Vib = 1 - ((LocationY - MinY) / (MaxY - MinY))

                if ColorPicker.Sat ~= OldSat or ColorPicker.Vib ~= OldVib then
                    ColorPicker:Update()
                end

                RunService.RenderStepped:Wait()
            end
        end)
        HueSelector.InputBegan:Connect(function(Input: InputObject)
            while IsDragInput(Input) do
                local PointerPosition = GetPointerPosition(Input)
                local Min = HueSelector.AbsolutePosition.Y
                local Max = Min + HueSelector.AbsoluteSize.Y
                local Location = math.clamp(PointerPosition.Y, Min, Max)

                local OldHue = ColorPicker.Hue
                ColorPicker.Hue = (Location - Min) / (Max - Min)

                if ColorPicker.Hue ~= OldHue then
                    ColorPicker:Update()
                end

                RunService.RenderStepped:Wait()
            end
        end)
        if TransparencySelector then
            TransparencySelector.InputBegan:Connect(function(Input: InputObject)
                while IsDragInput(Input) do
                    local PointerPosition = GetPointerPosition(Input)
                    local Min = TransparencySelector.AbsolutePosition.Y
                    local Max = TransparencySelector.AbsolutePosition.Y + TransparencySelector.AbsoluteSize.Y
                    local Location = math.clamp(PointerPosition.Y, Min, Max)

                    local OldTransparency = ColorPicker.Transparency
                    ColorPicker.Transparency = (Location - Min) / (Max - Min)

                    if ColorPicker.Transparency ~= OldTransparency then
                        ColorPicker:Update()
                    end

                    RunService.RenderStepped:Wait()
                end
            end)
        end

        HueBox.FocusLost:Connect(function(Enter)
            if not Enter then
                return
            end

            local Success, Color = pcall(Color3.fromHex, HueBox.Text)
            if Success and typeof(Color) == "Color3" then
                ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color:ToHSV()
            end

            ColorPicker:Update()
        end)
        RgbBox.FocusLost:Connect(function(Enter)
            if not Enter then
                return
            end

            local R, G, B = RgbBox.Text:match("(%d+),%s*(%d+),%s*(%d+)")
            if R and G and B then
                ColorPicker:SetHSVFromRGB(Color3.fromRGB(R, G, B))
            end

            ColorPicker:Update()
        end)

        ColorPicker:Display()

        if ParentObj.Addons then
            table.insert(ParentObj.Addons, ColorPicker)
        end

        ColorPicker.Default = ColorPicker.Value

        Options[Idx] = ColorPicker

        return self
    end

    BaseAddons.__index = Funcs
    BaseAddons.__namecall = function(_, Key, ...)
        return Funcs[Key](...)
    end
end

local BaseGroupbox = {}
do
    local Funcs = {}

    local function CreateAddonHolder(Parent: GuiObject, TextLabel: TextLabel, RightOffset: number?)
        local BaseSize = TextLabel.Size
        local Offset = RightOffset or 0
        local Height = 18

        local AddonHolder = New("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.new(1, Offset, 0.5, 0),
            Size = UDim2.fromOffset(0, Height),
            Parent = Parent,
        })

        local AddonList = New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0, 6),
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Parent = AddonHolder,
        })

        local function Update()
            local Width = AddonList.AbsoluteContentSize.X / Library.DPIScale
            local Gap = Width > 0 and 8 or 0

            AddonHolder.Size = UDim2.fromOffset(Width, Height)
            TextLabel.Size = UDim2.new(BaseSize.X.Scale, BaseSize.X.Offset - Width - Gap, BaseSize.Y.Scale, BaseSize.Y.Offset)
        end

        AddonList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(Update)
        task.defer(Update)

        return AddonHolder
    end

    local function ResolveKeybindMenuText(Element, Info)
        local OverrideText = Info and Info.KeybindMenuText
        if typeof(OverrideText) == "string" and OverrideText ~= "" then
            return OverrideText
        end

        return tostring(Element.Text or Element.KeybindMenuText or "Action")
    end

    local function SyncKeybindMenuEntry(Element)
        local Entry = Element.KeybindMenuEntry
        if not Entry then
            return
        end

        if Entry.SetText then
            Entry:SetText(ResolveKeybindMenuText(Element, Element.KeybindMenuInfo))
        end
        if Entry.SetDisabled and Element.Disabled ~= nil then
            Entry:SetDisabled(Element.Disabled == true)
        end
        if Entry.Type == "KeybindMenuToggle" then
            Entry.Value = Element.Value == true
            Entry:Display()
        end
    end

    local function RemoveElementFromKeybindMenu(Element)
        local Entry = Element.KeybindMenuEntry
        if not Entry then
            return
        end

        if Entry.SetVisible then
            Entry:SetVisible(false)
        end
        Element.KeybindMenuVisible = false
    end

    local function AddElementToKeybindMenu(Element, Info)
        if Element.Type ~= "Toggle" then
            return nil
        end

        Info = Info or Element.KeybindMenuInfo or {}
        Element.KeybindMenuInfo = Info
        Element.KeybindMenuText = ResolveKeybindMenuText(Element, Info)

        if Element.KeybindMenuEntry then
            Element.KeybindMenuVisible = true
            if Element.KeybindMenuEntry.SetVisible then
                Element.KeybindMenuEntry:SetVisible(true)
            end
            SyncKeybindMenuEntry(Element)
            return Element.KeybindMenuEntry
        end

        local ToggleInfo = {
            Text = Element.KeybindMenuText,
            Default = Element.Value == true,
            Disabled = Element.Disabled == true,
            Callback = function(Value)
                if Element.SetValue and Element.Value ~= Value then
                    Element:SetValue(Value)
                end
            end,
        }
        local ExplicitIdx = Info.KeybindMenuIdx or Info.KeybindMenuId
        Element.KeybindMenuEntry = if ExplicitIdx
            then Library:AddKeybindMenuToggle(ExplicitIdx, ToggleInfo)
            else Library:AddKeybindMenuToggle(ToggleInfo)

        Element.KeybindMenuVisible = true
        SyncKeybindMenuEntry(Element)
        return Element.KeybindMenuEntry
    end

    local function CreateElementActionsMenu(Element, Info, ParentButton, Inline, SecondaryHolder)
        if not ParentButton then
            return
        end

        local MenuWidth = 214
        local MenuGap = 4

        local ActionButton = New("TextButton", {
            AnchorPoint = Inline and Vector2.zero or Vector2.new(1, 0.5),
            BackgroundColor3 = "MainColor",
            BackgroundTransparency = 0.25,
            LayoutOrder = 100000,
            Position = Inline and UDim2.fromOffset(0, 0) or UDim2.new(1, -3, 0.5, 0),
            Size = UDim2.fromOffset(18, 18),
            Text = EllipsisIcon and "" or "...",
            TextSize = 13,
            TextTransparency = 0.2,
            ZIndex = (ParentButton.ZIndex or 1) + 2,
            Parent = ParentButton,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ActionButton }))
        New("UIStroke", {
            Color = "OutlineColor",
            Transparency = 0.45,
            Parent = ActionButton,
        })
        if EllipsisIcon then
            New("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = EllipsisIcon.Url,
                ImageColor3 = "FontColor",
                ImageRectOffset = EllipsisIcon.ImageRectOffset,
                ImageRectSize = EllipsisIcon.ImageRectSize,
                ImageTransparency = 0.18,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(13, 13),
                Parent = ActionButton,
            })
        end

        local MenuTable
        local AddRemoveButton = New("TextButton", {
            BackgroundColor3 = "MainColor",
            BackgroundTransparency = 0.08,
            Size = UDim2.new(1, 0, 0, GetMobileHitSize(26)),
            Text = "",
            TextSize = 13,
            TextTransparency = 0.25,
            ZIndex = 12001,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius / 2), Parent = AddRemoveButton }))
        local AddRemoveLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(8, 0),
            Size = UDim2.new(1, -50, 1, 0),
            Text = "Show in keybinds",
            TextSize = 13,
            TextTransparency = 0.18,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 12002,
            Parent = AddRemoveButton,
        })
        local KeybindTrack = New("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = "OutlineColor",
            BackgroundTransparency = 0.18,
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(28, 16),
            ZIndex = 12002,
            Parent = AddRemoveButton,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = KeybindTrack }))
        local KeybindKnob = New("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = "WhiteColor",
            Position = UDim2.new(0, 3, 0.5, 0),
            Size = UDim2.fromOffset(10, 10),
            ZIndex = 12003,
            Parent = KeybindTrack,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = KeybindKnob }))
        local OpenButton = New("TextButton", {
            BackgroundColor3 = "MainColor",
            BackgroundTransparency = 0.08,
            Size = UDim2.new(1, 0, 0, GetMobileHitSize(24)),
            Text = "Open keybinds",
            TextSize = 13,
            TextTransparency = 0.25,
            ZIndex = 12001,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius / 2), Parent = OpenButton }))

        local function RefreshRows()
            local Enabled = Element.KeybindMenuVisible == true
            KeybindTrack.BackgroundColor3 = Enabled and Library.Scheme.AccentColor or Library.Scheme.OutlineColor
            if Library.Registry[KeybindTrack] then
                Library.Registry[KeybindTrack].BackgroundColor3 = Enabled and "AccentColor" or "OutlineColor"
            end
            KeybindKnob.Position = Enabled and UDim2.new(1, -13, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
            AddRemoveLabel.TextTransparency = Enabled and 0 or 0.18
            OpenButton.Visible = Element.KeybindMenuVisible == true
        end

        local function GetMenuOffset()
            local Scale = Library.DPIScale or 1
            local MenuPixelWidth = MenuWidth * Scale
            local MenuPixelHeight = (GetMobileHitSize(26) + (Element.KeybindMenuVisible and GetMobileHitSize(24) + 2 or 0)) * Scale
            local RightX = ActionButton.AbsolutePosition.X + ActionButton.AbsoluteSize.X + MenuGap
            local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(800, 600)
            local XOffset = ActionButton.AbsoluteSize.X + MenuGap
            local YOffset = 0

            if RightX + MenuPixelWidth + MenuGap > ViewportSize.X then
                XOffset = -MenuPixelWidth - MenuGap
                if ActionButton.AbsolutePosition.X + XOffset < MenuGap then
                    XOffset = MenuGap - ActionButton.AbsolutePosition.X
                end
            end

            if ActionButton.AbsolutePosition.Y + MenuPixelHeight + MenuGap > ViewportSize.Y then
                YOffset = ViewportSize.Y - MenuPixelHeight - MenuGap - ActionButton.AbsolutePosition.Y
                if ActionButton.AbsolutePosition.Y + YOffset < MenuGap then
                    YOffset = MenuGap - ActionButton.AbsolutePosition.Y
                end
            end

            return { XOffset, YOffset }
        end

        MenuTable = Library:AddContextMenu(ActionButton, UDim2.fromOffset(MenuWidth, 0), GetMenuOffset, 1, function(Active)
            if Active then
                RefreshRows()
            end
        end, true)
        MenuTable.Menu.ZIndex = 12000
        MenuTable.List.Padding = UDim.new(0, 2)
        AddRemoveButton.Parent = MenuTable.Menu
        OpenButton.Parent = MenuTable.Menu

        AddRemoveButton.MouseButton1Click:Connect(function()
            if Element.KeybindMenuVisible then
                RemoveElementFromKeybindMenu(Element)
            else
                AddElementToKeybindMenu(Element, Info)
            end
            RefreshRows()
            MenuTable:Close()
        end)
        OpenButton.MouseButton1Click:Connect(function()
            if Library.KeybindFrame then
                Library.KeybindFrame.Visible = true
            end
            MenuTable:Close()
        end)

        ActionButton.MouseButton1Click:Connect(function()
            if Library:IsSecondaryActionLocked(ActionButton) then
                return
            end
            MenuTable:Toggle()
        end)
        local SecondaryActionHolder = SecondaryHolder or ParentButton
        if SecondaryActionHolder and SecondaryActionHolder:IsA("GuiButton") then
            Library:ConnectSecondaryAction(SecondaryActionHolder, MenuTable.Toggle)
        end

        Element.ActionsMenu = MenuTable
        Element.ActionsButton = ActionButton
        RefreshRows()
    end

    function Funcs:AddDivider(...)
        local Params = select(1, ...)
        local Text
        local MarginTop = 0
        local MarginBottom = 0

        if typeof(Params) == "table" then
            Text = Params.Text
            MarginTop = Params.MarginTop or Params.Margin or 0
            MarginBottom = Params.MarginBottom or Params.Margin or 0
        elseif typeof(Params) == "string" then
            Text = Params
        end

        local Groupbox = self
        local Container = Groupbox.Container

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 6 + MarginTop + MarginBottom),
            Parent = Container,
        })

        local InnerHolder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingTop = UDim.new(0, MarginTop),
            PaddingBottom = UDim.new(0, MarginBottom),
            Parent = Holder,
        })

        if Text then
            local TextLabel = New("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                Text = Text,
                TextSize = 14,
                TextTransparency = 0.5,
                TextXAlignment = Enum.TextXAlignment.Center,
                Parent = InnerHolder,
            })

            local X, _ = Library:GetTextBounds(Text, TextLabel.FontFace, TextLabel.TextSize, TextLabel.AbsoluteSize.X)
            local SizeX = X // 2 + 10

            New("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = "MainColor",
                BorderColor3 = "OutlineColor",
                BorderSizePixel = 1,
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.new(0.5, -SizeX, 0, 2),
                Parent = InnerHolder,
            })
            New("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = "MainColor",
                BorderColor3 = "OutlineColor",
                BorderSizePixel = 1,
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.new(0.5, -SizeX, 0, 2),
                Parent = InnerHolder,
            })
        else
            New("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = "MainColor",
                BorderColor3 = "OutlineColor",
                BorderSizePixel = 1,
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.new(1, 0, 0, 2),
                Parent = InnerHolder,
            })
        end

        Groupbox:Resize()

        local Divider = {
            Holder = Holder,
            Text = Text,
            MarginTop = MarginTop,
            MarginBottom = MarginBottom,
            Type = "Divider",
        }

        table.insert(Groupbox.Elements, Divider)
        return Divider
    end

    function Funcs:AddLabel(...)
        local Data = {}
        local Addons = {}

        local First = select(1, ...)
        local Second = select(2, ...)

        if typeof(First) == "table" or typeof(Second) == "table" then
            local Params = typeof(First) == "table" and First or Second

            Data.Text = Params.Text or ""
            Data.DoesWrap = Params.DoesWrap or false
            Data.Size = Params.Size or 14
            Data.Visible = Params.Visible or true
            Data.Idx = typeof(Second) == "table" and First or nil
        else
            Data.Text = First or ""
            Data.DoesWrap = Second or false
            Data.Size = 14
            Data.Visible = true
            Data.Idx = select(3, ...) or nil
        end

        local Groupbox = self
        local Container = Groupbox.Container

        local Label = {
            Text = Data.Text,
            DoesWrap = Data.DoesWrap,

            Addons = Addons,

            Visible = Data.Visible,
            Type = "Label",
        }

        local Holder
        local TextLabel
        local AddonHolder

        if Label.DoesWrap then
            TextLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 18),
                Text = Label.Text,
                TextSize = Data.Size,
                TextWrapped = true,
                TextXAlignment = Groupbox.IsKeyTab and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
                Visible = Label.Visible,
                Parent = Container,
            })
            Holder = TextLabel
        else
            Holder = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 18),
                Visible = Label.Visible,
                Parent = Container,
            })

            TextLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = Label.Text,
                TextSize = Data.Size,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Groupbox.IsKeyTab and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
                Parent = Holder,
            })

            AddonHolder = CreateAddonHolder(Holder, TextLabel)
        end

        function Label:SetVisible(Visible: boolean)
            Label.Visible = Visible

            Holder.Visible = Label.Visible
            Groupbox:Resize()
        end

        function Label:SetText(Text: string)
            Label.Text = Text
            TextLabel.Text = Text

            if Label.DoesWrap then
                local _, Y =
                    Library:GetTextBounds(Label.Text, TextLabel.FontFace, TextLabel.TextSize, TextLabel.AbsoluteSize.X)
                TextLabel.Size = UDim2.new(1, 0, 0, Y + 4)
            end

            Groupbox:Resize()
        end

        if Label.DoesWrap then
            local _, Y =
                Library:GetTextBounds(Label.Text, TextLabel.FontFace, TextLabel.TextSize, TextLabel.AbsoluteSize.X)
            TextLabel.Size = UDim2.new(1, 0, 0, Y + 4)

            local Last = TextLabel.AbsoluteSize
            TextLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                if TextLabel.AbsoluteSize == Last then
                    return
                end

                local _, Y =
                    Library:GetTextBounds(Label.Text, TextLabel.FontFace, TextLabel.TextSize, TextLabel.AbsoluteSize.X)
                TextLabel.Size = UDim2.new(1, 0, 0, Y + 4)

                Last = TextLabel.AbsoluteSize
                Groupbox:Resize()
            end)
        end

        Groupbox:Resize()

        Label.TextLabel = TextLabel
        Label.AddonHolder = AddonHolder
        Label.Container = Container
        if not Data.DoesWrap then
            setmetatable(Label, BaseAddons)
        end

        Label.Holder = Holder
        table.insert(Groupbox.Elements, Label)

        if Data.Idx then
            Labels[Data.Idx] = Label
        else
            table.insert(Labels, Label)
        end

        return Label
    end

    function Funcs:AddCustomFontLabel(...)
        local Info = {}
        local First = select(1, ...)
        local Second = select(2, ...)
        local SecondIsInfo = typeof(Second) == "table" and Second.Type ~= "CustomFont"

        if typeof(First) == "table" or SecondIsInfo then
            local Params = typeof(First) == "table" and First or Second
            local TextSize = Params.TextSize or 18
            Info.Idx = SecondIsInfo and First or nil
            Info.Text = Params.Text or ""
            Info.Font = Params.Font or Library.CustomFont
            Info.Size = Params.Height or Params.Size or TextSize + 8
            Info.TextSize = TextSize
            Info.TextColor3 = Params.TextColor3 or Params.Color or Library.Scheme.FontColor
            Info.TextXAlignment = Params.TextXAlignment or Enum.TextXAlignment.Left
            Info.TextYAlignment = Params.TextYAlignment or Enum.TextYAlignment.Center
            Info.TextWrapped = Params.TextWrapped or Params.DoesWrap or false
            Info.Visible = Params.Visible ~= false
        else
            Info.Text = First or ""
            Info.Font = typeof(Second) == "table" and Second or Library.CustomFont
            Info.Size = 24
            Info.TextSize = 18
            Info.TextColor3 = Library.Scheme.FontColor
            Info.TextXAlignment = Enum.TextXAlignment.Left
            Info.TextYAlignment = Enum.TextYAlignment.Center
            Info.TextWrapped = false
            Info.Visible = true
            Info.Idx = select(3, ...) or nil
        end

        local Groupbox = self
        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Size),
            Visible = Info.Visible,
            Parent = Groupbox.Container,
        })

        local Label = Library:CreateCustomText(Holder, {
            Font = Info.Font,
            Text = Info.Text,
            TextSize = Info.TextSize,
            TextColor3 = Info.TextColor3,
            TextXAlignment = Info.TextXAlignment,
            TextYAlignment = Info.TextYAlignment,
            TextWrapped = Info.TextWrapped,
            Size = UDim2.fromScale(1, 1),
        })
        Label.Type = "CustomFontLabel"
        Label.Visible = Info.Visible

        function Label:SetVisible(Visible: boolean)
            Label.Visible = Visible
            Holder.Visible = Visible
            Groupbox:Resize()
        end

        function Label:SetHeight(Height: number)
            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        Label.Holder = Holder
        table.insert(Groupbox.Elements, Label)
        if Info.Idx then
            Labels[Info.Idx] = Label
        else
            table.insert(Labels, Label)
        end

        Groupbox:Resize()
        return Label
    end

    function Funcs:AddButton(...)
        local function GetInfo(...)
            local Info = {}

            local First = select(1, ...)
            local Second = select(2, ...)

            if typeof(First) == "table" or typeof(Second) == "table" then
                local Params = typeof(First) == "table" and First or Second

                Info.Text = Params.Text or ""
                Info.Func = Params.Func or Params.Callback or function() end
                Info.DoubleClick = Params.DoubleClick

                Info.Tooltip = Params.Tooltip
                Info.DisabledTooltip = Params.DisabledTooltip

                Info.Risky = Params.Risky or false
                Info.Disabled = Params.Disabled or false
                Info.Visible = Params.Visible or true
                Info.Idx = typeof(Second) == "table" and First or nil
            else
                Info.Text = First or ""
                Info.Func = Second or function() end
                Info.DoubleClick = false

                Info.Tooltip = nil
                Info.DisabledTooltip = nil

                Info.Risky = false
                Info.Disabled = false
                Info.Visible = true
                Info.Idx = select(3, ...) or nil
            end

            return Info
        end
        local Info = GetInfo(...)

        local Groupbox = self
        local Container = Groupbox.Container

        local Button = {
            Text = Info.Text,
            Func = Info.Func,
            DoubleClick = Info.DoubleClick,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Risky = Info.Risky,
            Disabled = Info.Disabled,
            Visible = Info.Visible,

            Tween = nil,
            Type = "Button",
        }

        local ButtonHeight = GetMobileHitSize(21)
        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, ButtonHeight),
            Parent = Container,
        })

        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0, 9),
            Parent = Holder,
        })

        local function CreateButton(Button)
            local Base = New("TextButton", {
                Active = not Button.Disabled,
                BackgroundColor3 = Button.Disabled and "BackgroundColor" or "MainColor",
                Size = UDim2.fromScale(1, 1),
                Text = Button.Text,
                TextSize = 14,
                TextTransparency = 0.4,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Visible = Button.Visible,
                Parent = Holder,
            })

            local Stroke = New("UIStroke", {
                Color = "OutlineColor",
                Transparency = Button.Disabled and 0.5 or 0,
                Parent = Base,
            })

            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                    Parent = Base,
                })
            )

            return Base, Stroke
        end

        local function InitEvents(Button)
            function Button:Trigger()
                if Button.Disabled then
                    return
                end

                Library:SafeCallback(Button.Func)
            end

            Button.Base.MouseEnter:Connect(function()
                if Button.Disabled then
                    return
                end

                Button.Tween = TweenService:Create(Button.Base, Library.TweenInfo, {
                    TextTransparency = 0,
                })
                Button.Tween:Play()
            end)
            Button.Base.MouseLeave:Connect(function()
                if Button.Disabled then
                    return
                end

                Button.Tween = TweenService:Create(Button.Base, Library.TweenInfo, {
                    TextTransparency = 0.4,
                })
                Button.Tween:Play()
            end)

            Button.Base.MouseButton1Click:Connect(function()
                if Library:IsSecondaryActionLocked(Button.Base) then
                    return
                end

                if Button.Disabled or Button.Locked then
                    return
                end

                if Button.DoubleClick then
                    Button.Locked = true

                    Button.Base.Text = "Are you sure?"
                    Button.Base.TextColor3 = Library.Scheme.AccentColor
                    Library.Registry[Button.Base].TextColor3 = "AccentColor"

                    local Clicked = WaitForEvent(Button.Base.MouseButton1Click, 0.5)

                    Button.Base.Text = Button.Text
                    Button.Base.TextColor3 = Button.Risky and Library.Scheme.RedColor or Library.Scheme.FontColor
                    Library.Registry[Button.Base].TextColor3 = Button.Risky and "RedColor" or "FontColor"

                    if Clicked then
                        Button:Trigger()
                    end

                    RunService.RenderStepped:Wait() --// Mouse Button fires without waiting (i hate roblox)
                    Button.Locked = false
                    return
                end

                Button:Trigger()
            end)
        end

        Button.Base, Button.Stroke = CreateButton(Button)
        InitEvents(Button)

        function Button:AddButton(...)
            local Info = GetInfo(...)

            local SubButton = {
                Text = Info.Text,
                Func = Info.Func,
                DoubleClick = Info.DoubleClick,

                Tooltip = Info.Tooltip,
                DisabledTooltip = Info.DisabledTooltip,
                TooltipTable = nil,

                Risky = Info.Risky,
                Disabled = Info.Disabled,
                Visible = Info.Visible,

                Tween = nil,
                Type = "SubButton",
            }

            Button.SubButton = SubButton
            SubButton.Base, SubButton.Stroke = CreateButton(SubButton)
            InitEvents(SubButton)

            function SubButton:UpdateColors()
                if Library.Unloaded then
                    return
                end

                StopTween(SubButton.Tween)

                SubButton.Base.BackgroundColor3 = SubButton.Disabled and Library.Scheme.BackgroundColor
                    or Library.Scheme.MainColor
                SubButton.Base.TextTransparency = SubButton.Disabled and 0.8 or 0.4
                SubButton.Stroke.Transparency = SubButton.Disabled and 0.5 or 0

                Library.Registry[SubButton.Base].BackgroundColor3 = SubButton.Disabled and "BackgroundColor"
                    or "MainColor"
            end

            function SubButton:SetDisabled(Disabled: boolean)
                SubButton.Disabled = Disabled

                if SubButton.TooltipTable then
                    SubButton.TooltipTable.Disabled = SubButton.Disabled
                end

                SubButton.Base.Active = not SubButton.Disabled
                SubButton:UpdateColors()
                SyncKeybindMenuEntry(SubButton)
            end

            function SubButton:SetVisible(Visible: boolean)
                SubButton.Visible = Visible

                SubButton.Base.Visible = SubButton.Visible
                Groupbox:Resize()
            end

            function SubButton:SetText(Text: string)
                SubButton.Text = Text
                SubButton.Base.Text = Text
                SyncKeybindMenuEntry(SubButton)
            end

            if typeof(SubButton.Tooltip) == "string" or typeof(SubButton.DisabledTooltip) == "string" then
                SubButton.TooltipTable =
                    Library:AddTooltip(SubButton.Tooltip, SubButton.DisabledTooltip, SubButton.Base)
                SubButton.TooltipTable.Disabled = SubButton.Disabled
            end

            if SubButton.Risky then
                SubButton.Base.TextColor3 = Library.Scheme.RedColor
                Library.Registry[SubButton.Base].TextColor3 = "RedColor"
            end

            SubButton:UpdateColors()

            if Info.Idx then
                Buttons[Info.Idx] = SubButton
            else
                table.insert(Buttons, SubButton)
            end

            return SubButton
        end

        function Button:UpdateColors()
            if Library.Unloaded then
                return
            end

            StopTween(Button.Tween)

            Button.Base.BackgroundColor3 = Button.Disabled and Library.Scheme.BackgroundColor
                or Library.Scheme.MainColor
            Button.Base.TextTransparency = Button.Disabled and 0.8 or 0.4
            Button.Stroke.Transparency = Button.Disabled and 0.5 or 0

            Library.Registry[Button.Base].BackgroundColor3 = Button.Disabled and "BackgroundColor" or "MainColor"
        end

        function Button:SetDisabled(Disabled: boolean)
            Button.Disabled = Disabled

            if Button.TooltipTable then
                Button.TooltipTable.Disabled = Button.Disabled
            end

            Button.Base.Active = not Button.Disabled
            Button:UpdateColors()
            SyncKeybindMenuEntry(Button)
        end

        function Button:SetVisible(Visible: boolean)
            Button.Visible = Visible

            Holder.Visible = Button.Visible
            Groupbox:Resize()
        end

        function Button:SetText(Text: string)
            Button.Text = Text
            Button.Base.Text = Text
            SyncKeybindMenuEntry(Button)
        end

        if typeof(Button.Tooltip) == "string" or typeof(Button.DisabledTooltip) == "string" then
            Button.TooltipTable = Library:AddTooltip(Button.Tooltip, Button.DisabledTooltip, Button.Base)
            Button.TooltipTable.Disabled = Button.Disabled
        end

        if Button.Risky then
            Button.Base.TextColor3 = Library.Scheme.RedColor
            Library.Registry[Button.Base].TextColor3 = "RedColor"
        end

        Button:UpdateColors()
        Groupbox:Resize()

        Button.Holder = Holder
        table.insert(Groupbox.Elements, Button)

        if Info.Idx then
            Buttons[Info.Idx] = Button
        else
            table.insert(Buttons, Button)
        end

        return Button
    end

    local function ParseNewElementInfo(...)
        local First = select(1, ...)
        local Second = select(2, ...)

        if typeof(First) == "table" then
            return nil, First
        elseif typeof(Second) == "table" then
            return First, Second
        end

        return nil, {}
    end

    function Funcs:AddGlassPanel(...)
        local Idx, Info = ParseNewElementInfo(...)
        Info = Info or {}

        local Groupbox = self
        local Container = Groupbox.Container
        local Accent = Info.AccentColor or "AccentColor"

        local Panel = {
            Text = Info.Title or Info.Text or "Glass Panel",
            Title = Info.Title or Info.Text or "Glass Panel",
            Description = Info.Description or Info.Desc or "",
            Visible = Info.Visible ~= false,
            Type = "GlassPanel",
        }

        local Holder = New("Frame", {
            BackgroundColor3 = Info.BackgroundColor or "MainColor",
            BackgroundTransparency = Info.Transparency or 0.18,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, Info.Height or 76),
            Visible = Panel.Visible,
            Parent = Container,
        })
        RegisterBackgroundImageSurface(Holder, Info.Transparency or 0.18, "Panel")
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Info.CornerRadius or Library.CornerRadius),
                Parent = Holder,
            })
        )
        Library:AddOutline(Holder, {
            Color = Info.StrokeColor or Accent,
            Thickness = Info.StrokeThickness or 1,
            Transparency = Info.StrokeTransparency or 0.35,
            ShadowTransparency = Info.ShadowTransparency or 0.45,
            Rainbow = Info.RainbowBorder,
            RainbowTarget = "Cards",
        })
        if Info.Gradient ~= false then
            Library:AddGradient(Holder, {
                Color = Info.GradientColorSequence
                    or ColorSequence.new({
                        ColorSequenceKeypoint.new(
                            0,
                            typeof(Accent) == "Color3" and Accent or Library.Scheme.AccentColor
                        ),
                        ColorSequenceKeypoint.new(1, Library.Scheme.MainColor),
                    }),
                Rotation = Info.GradientRotation or 25,
                Transparency = Info.GradientTransparency or NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.72),
                    NumberSequenceKeypoint.new(1, 0.96),
                }),
            })
        end
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingTop = UDim.new(0, 10),
            Parent = Holder,
        })

        local Icon
        local ParsedIcon = Info.Icon and Library:GetCustomIcon(Info.Icon)
        if ParsedIcon then
            Icon = New("ImageLabel", {
                BackgroundTransparency = 1,
                Image = ParsedIcon.Url,
                ImageColor3 = Info.IconColor or Accent,
                ImageRectOffset = ParsedIcon.ImageRectOffset,
                ImageRectSize = ParsedIcon.ImageRectSize,
                Position = UDim2.fromOffset(0, 2),
                Size = UDim2.fromOffset(24, 24),
                Parent = Holder,
            })
        end

        local BadgeReserved = Info.Badge and 68 or 0
        local Title = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(Icon and 32 or 0, 0),
            Size = UDim2.new(1, (Icon and -32 or 0) - BadgeReserved, 0, 20),
            Text = Panel.Title,
            TextSize = Info.TitleSize or 16,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextWrapped = false,
            Parent = Holder,
        })
        local Description = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(Icon and 32 or 0, 24),
            Size = UDim2.new(1, Icon and -32 or 0, 1, -24),
            Text = Panel.Description,
            TextSize = Info.DescriptionSize or 13,
            TextTransparency = 0.25,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            Parent = Holder,
        })

        if Info.Badge then
            local Badge = New("TextLabel", {
                AnchorPoint = Vector2.new(1, 0),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Accent,
                BackgroundTransparency = 0.25,
                Position = UDim2.new(1, 0, 0, 0),
                Size = UDim2.fromOffset(0, 18),
                Text = tostring(Info.Badge),
                TextSize = 12,
                Parent = Holder,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 7),
                PaddingRight = UDim.new(0, 7),
                Parent = Badge,
            })
            table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Badge }))
        end

        function Panel:SetTitle(Text)
            Panel.Title = tostring(Text)
            Panel.Text = Panel.Title
            Title.Text = Panel.Title
        end

        function Panel:SetDescription(Text)
            Panel.Description = tostring(Text)
            Description.Text = Panel.Description
        end

        function Panel:SetVisible(Visible)
            Panel.Visible = Visible
            Holder.Visible = Visible
            Groupbox:Resize()
        end

        Panel.Holder = Holder
        table.insert(Groupbox.Elements, Panel)
        if Idx then
            Options[Idx] = Panel
        end
        Groupbox:Resize()
        return Panel
    end

    local function CreateNewElementButton(Groupbox, Info, Variant)
        Info = Info or {}
        local Container = Groupbox.Container
        local Accent = Info.AccentColor or "AccentColor"
        local Button = {
            Text = Info.Text or (Variant == "ShinyButton" and "Shiny Button" or "Highlight Button"),
            Func = Info.Func or Info.Callback or function() end,
            Disabled = Info.Disabled or false,
            Visible = Info.Visible ~= false,
            Type = Variant,
        }

        local Holder = New("TextButton", {
            Active = not Button.Disabled,
            BackgroundColor3 = Info.BackgroundColor or "MainColor",
            BackgroundTransparency = Info.Transparency or 0.08,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, Info.Height or 30),
            Text = "",
            Visible = Button.Visible,
            Parent = Container,
        })
        RegisterBackgroundImageSurface(Holder, Info.Transparency or 0.08, "Panel")
        table.insert(
            Library.Corners,
            New("UICorner", { CornerRadius = UDim.new(0, Info.CornerRadius or Library.CornerRadius), Parent = Holder })
        )
        Library:AddOutline(Holder, {
            Color = Info.StrokeColor or Accent,
            Thickness = Info.StrokeThickness or 1,
            Transparency = Info.StrokeTransparency or 0.25,
            ShadowTransparency = Info.ShadowTransparency or 0.35,
            Rainbow = Info.RainbowBorder,
            RainbowTarget = "Cards",
        })
        Library:AddGradient(Holder, {
            Color = Info.GradientColorSequence
                or ColorSequence.new({
                    ColorSequenceKeypoint.new(0, typeof(Accent) == "Color3" and Accent or Library.Scheme.AccentColor),
                    ColorSequenceKeypoint.new(1, Library.Scheme.MainColor),
                }),
            Rotation = Info.GradientRotation or 0,
            Transparency = Info.GradientTransparency or NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.45),
                NumberSequenceKeypoint.new(1, 0.9),
            }),
        })

        local ParsedIcon = Info.Icon and Library:GetCustomIcon(Info.Icon)
        if ParsedIcon then
            New("ImageLabel", {
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Image = ParsedIcon.Url,
                ImageColor3 = Info.IconColor or Accent,
                ImageRectOffset = ParsedIcon.ImageRectOffset,
                ImageRectSize = ParsedIcon.ImageRectSize,
                Position = UDim2.new(0, 10, 0.5, 0),
                Size = UDim2.fromOffset(16, 16),
                ZIndex = 2,
                Parent = Holder,
            })
        end

        local Label = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = ParsedIcon and UDim2.fromOffset(34, 0) or UDim2.fromOffset(0, 0),
            Size = ParsedIcon and UDim2.new(1, -44, 1, 0) or UDim2.fromScale(1, 1),
            Text = Button.Text,
            TextSize = Info.TextSize or 14,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 2,
            Parent = Holder,
        })

        local Shine
        if Variant == "ShinyButton" or Variant == "LiquidGlassButton" or Info.Shine then
            Shine = New("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = CustomImageManager.GetAsset("ShinyEffect"),
                ImageColor3 = Info.ShineColor or "WhiteColor",
                ImageTransparency = Info.ShineTransparency or 0,
                Position = UDim2.fromScale(-0.25, 0.5),
                ScaleType = Enum.ScaleType.Stretch,
                Size = UDim2.new(0, Info.ShineWidth or 74, 1, 0),
                ZIndex = 1,
                Parent = Holder,
            })
        end

        local function PlayShine()
            if not Shine then
                return
            end

            Shine.Position = UDim2.fromScale(-0.25, 0.5)
            TweenService:Create(Shine, TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.fromScale(1.25, 0.5),
            }):Play()
        end

        if Shine and Variant == "ShinyButton" then
            task.spawn(function()
                while Holder and Holder.Parent do
                    if Button.Visible and not Button.Disabled then
                        PlayShine()
                    end

                    task.wait(1.8)
                end
            end)
        end

        Holder.MouseEnter:Connect(function()
            if Button.Disabled then
                return
            end
            TweenService:Create(Holder, Library.TweenInfo, {
                BackgroundTransparency = GetBackgroundImageSurfaceTransparency(Info.HoverTransparency or 0, "Panel"),
            }):Play()
            TweenService:Create(Label, Library.TweenInfo, { TextTransparency = 0 }):Play()
            PlayShine()
        end)
        Holder.MouseLeave:Connect(function()
            if Button.Disabled then
                return
            end
            TweenService:Create(Holder, Library.TweenInfo, {
                BackgroundTransparency = GetBackgroundImageSurfaceTransparency(Info.Transparency or 0.08, "Panel"),
            }):Play()
            TweenService:Create(Label, Library.TweenInfo, { TextTransparency = 0.1 }):Play()
        end)
        Holder.MouseButton1Click:Connect(function()
            if Button.Disabled then
                return
            end
            Library:SafeCallback(Button.Func, Button)
        end)

        function Button:SetText(Text)
            Button.Text = tostring(Text)
            Label.Text = Button.Text
        end

        function Button:SetDisabled(Disabled)
            Button.Disabled = Disabled
            Holder.Active = not Disabled
            Label.TextTransparency = Disabled and 0.75 or 0
        end

        function Button:SetVisible(Visible)
            Button.Visible = Visible
            Holder.Visible = Visible
            Groupbox:Resize()
        end

        Button.Holder = Holder
        table.insert(Groupbox.Elements, Button)
        Groupbox:Resize()
        return Button
    end

    function Funcs:AddHighlightButton(Info)
        Info = Info or {}
        Info.Transparency = Info.Transparency or 0.02
        Info.HoverTransparency = Info.HoverTransparency or 0
        local Button = CreateNewElementButton(self, Info, "HighlightButton")
        local Holder = Button.Holder
        task.spawn(function()
            while Holder and Holder.Parent do
                TweenService:Create(Holder, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    BackgroundTransparency = GetBackgroundImageSurfaceTransparency(Info.Transparency + 0.06, "Panel"),
                }):Play()
                task.wait(0.9)
                TweenService:Create(Holder, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    BackgroundTransparency = GetBackgroundImageSurfaceTransparency(Info.Transparency, "Panel"),
                }):Play()
                task.wait(0.9)
            end
        end)
        return Button
    end

    function Funcs:AddShinyButton(Info)
        Info = Info or {}
        Info.Shine = true
        return CreateNewElementButton(self, Info, "ShinyButton")
    end

    function Funcs:AddLiquidGlassButton(Info)
        Info = Info or {}
        Info.Shine = true
        Info.Transparency = Info.Transparency or 0.18
        Info.HoverTransparency = Info.HoverTransparency or 0.04
        return CreateNewElementButton(self, Info, "LiquidGlassButton")
    end

    function Funcs:AddLiquidGlassToggle(Idx, Info)
        Info = Library:Validate(Info, Templates.Toggle)
        Info.ActionsMenu = Info.ActionsMenu == true or Info.ActionMenu == true
        Info.KeybindMenuIdx = Info.KeybindMenuIdx or Info.KeybindMenuId

        local Groupbox = self
        local Container = Groupbox.Container
        local Toggle = {
            Text = Info.Text,
            Value = Info.Default,
            Callback = Info.Callback,
            Changed = Info.Changed,
            Disabled = Info.Disabled,
            Visible = Info.Visible,
            Type = "Toggle",
            KeybindMenuInfo = Info,
        }

        local Holder = New("TextButton", {
            Active = not Toggle.Disabled,
            BackgroundColor3 = "MainColor",
            BackgroundTransparency = 0.2,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, 32),
            Text = "",
            Visible = Toggle.Visible,
            Parent = Container,
        })
        RegisterBackgroundImageSurface(Holder, 0.2, "Panel")
        table.insert(
            Library.Corners,
            New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = Holder })
        )
        Library:AddOutline(Holder, { Color = "AccentColor", Transparency = 0.45, ShadowTransparency = 0.5 })
        Library:AddGradient(Holder, {
            Rotation = 12,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.55),
                NumberSequenceKeypoint.new(1, 0.95),
            }),
        })
        local TextLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(10, 0),
            Size = UDim2.new(1, -58, 1, 0),
            Text = Toggle.Text,
            TextSize = 14,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Holder,
        })
        local AddonHolder = CreateAddonHolder(Holder, TextLabel, -54)
        local Pill = New("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = "OutlineColor",
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(38, 18),
            Parent = Holder,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Pill }))
        local Dot = New("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = "WhiteColor",
            Position = UDim2.new(0, 3, 0.5, 0),
            Size = UDim2.fromOffset(12, 12),
            Parent = Pill,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Dot }))

        function Toggle:Display()
            TweenService
                :Create(Pill, Library.TweenInfo, {
                    BackgroundColor3 = Toggle.Value and Library.Scheme.AccentColor or Library.Scheme.OutlineColor,
                })
                :Play()
            TweenService
                :Create(Dot, Library.TweenInfo, {
                    Position = Toggle.Value and UDim2.new(1, -15, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
                })
                :Play()
        end

        function Toggle:SetValue(Value)
            if Toggle.Disabled then
                return
            end
            Toggle.Value = Value == true
            Toggle:Display()
            SyncKeybindMenuEntry(Toggle)
            Library:SafeCallback(Toggle.Callback, Toggle.Value)
            Library:SafeCallback(Toggle.Changed, Toggle.Value)
        end

        function Toggle:OnChanged(Func)
            Toggle.Changed = Func
        end

        function Toggle:SetDisabled(Disabled)
            Toggle.Disabled = Disabled
            Holder.Active = not Disabled
            TextLabel.TextTransparency = Disabled and 0.75 or 0
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:SetVisible(Visible)
            Toggle.Visible = Visible
            Holder.Visible = Visible
            Groupbox:Resize()
        end

        function Toggle:SetText(Text)
            Toggle.Text = tostring(Text)
            TextLabel.Text = Toggle.Text
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:AddToKeybindMenu(KeybindInfo)
            return AddElementToKeybindMenu(Toggle, KeybindInfo or Toggle.KeybindMenuInfo)
        end

        function Toggle:RemoveFromKeybindMenu()
            RemoveElementFromKeybindMenu(Toggle)
        end

        function Toggle:AddActionsMenu(KeybindInfo)
            Toggle.KeybindMenuInfo = KeybindInfo or Toggle.KeybindMenuInfo
            if not Toggle.ActionsMenu then
                CreateElementActionsMenu(Toggle, Toggle.KeybindMenuInfo, AddonHolder, true, Holder)
            end
            return Toggle.ActionsMenu
        end

        Holder.MouseButton1Click:Connect(function()
            if Library:IsSecondaryActionLocked(Holder) then
                return
            end

            Toggle:SetValue(not Toggle.Value)
        end)

        Toggle:Display()
        if Info.ActionsMenu or Info.KeybindMenu then
            CreateElementActionsMenu(Toggle, Info, AddonHolder, true, Holder)
        end
        if Info.KeybindMenu then
            AddElementToKeybindMenu(Toggle, Info)
        end
        Toggle.Holder = Holder
        Toggle.TextLabel = TextLabel
        Toggle.AddonHolder = AddonHolder
        table.insert(Groupbox.Elements, Toggle)
        Toggles[Idx] = Toggle
        Options[Idx] = Toggle
        Groupbox:Resize()
        return Toggle
    end

    function Funcs:AddCheckbox(Idx, Info)
        Info = Library:Validate(Info, Templates.Toggle)
        Info.ActionsMenu = Info.ActionsMenu == true or Info.ActionMenu == true
        Info.KeybindMenuIdx = Info.KeybindMenuIdx or Info.KeybindMenuId

        local Groupbox = self
        local Container = Groupbox.Container

        local Toggle = {
            Text = Info.Text,
            Value = Info.Default,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Callback = Info.Callback,
            Changed = Info.Changed,

            Risky = Info.Risky,
            Disabled = Info.Disabled,
            Visible = Info.Visible,
            Addons = {},

            Variant = "Checkbox",
            Type = "Toggle",
            KeybindMenuInfo = Info,
        }

        local Button = New("TextButton", {
            Active = not Toggle.Disabled,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Text = "",
            Visible = Toggle.Visible,
            Parent = Container,
        })

        local Label = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(26, 0),
            Size = UDim2.new(1, -26, 1, 0),
            Text = Toggle.Text,
            TextSize = 14,
            TextTransparency = 0.4,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Button,
        })

        local AddonHolder = CreateAddonHolder(Button, Label)

        local Checkbox = New("Frame", {
            BackgroundColor3 = "MainColor",
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Parent = Button,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Checkbox,
            })
        )

        local CheckboxStroke = New("UIStroke", {
            Color = "OutlineColor",
            Parent = Checkbox,
        })

        local CheckImage = New("ImageLabel", {
            Image = CheckIcon and CheckIcon.Url or "",
            ImageColor3 = "FontColor",
            ImageRectOffset = CheckIcon and CheckIcon.ImageRectOffset or Vector2.zero,
            ImageRectSize = CheckIcon and CheckIcon.ImageRectSize or Vector2.zero,
            ImageTransparency = 1,
            Position = UDim2.fromOffset(2, 2),
            Size = UDim2.new(1, -4, 1, -4),
            Parent = Checkbox,
        })

        function Toggle:UpdateColors()
            Toggle:Display()
        end

        function Toggle:Display()
            if Library.Unloaded then
                return
            end

            CheckboxStroke.Transparency = Toggle.Disabled and 0.5 or 0

            if Toggle.Disabled then
                Label.TextTransparency = 0.8
                CheckImage.ImageTransparency = Toggle.Value and 0.8 or 1

                Checkbox.BackgroundColor3 = Library.Scheme.BackgroundColor
                Library.Registry[Checkbox].BackgroundColor3 = "BackgroundColor"

                return
            end

            TweenService:Create(Label, Library.TweenInfo, {
                TextTransparency = Toggle.Value and 0 or 0.4,
            }):Play()
            TweenService:Create(CheckImage, Library.TweenInfo, {
                ImageTransparency = Toggle.Value and 0 or 1,
            }):Play()

            Checkbox.BackgroundColor3 = Library.Scheme.MainColor
            Library.Registry[Checkbox].BackgroundColor3 = "MainColor"
        end

        function Toggle:OnChanged(Func)
            Toggle.Changed = Func
        end

        function Toggle:SetValue(Value)
            if Toggle.Disabled then
                return
            end

            Toggle.Value = Value
            Toggle:Display()

            for _, Addon in Toggle.Addons do
                if Addon.Type == "KeyPicker" and Addon.SyncToggleState then
                    Addon.Toggled = Toggle.Value
                    Addon:Update()
                end
            end
            SyncKeybindMenuEntry(Toggle)

            Library:UpdateDependencyBoxes()
            Library:SafeCallback(Toggle.Callback, Toggle.Value)
            Library:SafeCallback(Toggle.Changed, Toggle.Value)
        end

        function Toggle:SetDisabled(Disabled: boolean)
            Toggle.Disabled = Disabled

            if Toggle.TooltipTable then
                Toggle.TooltipTable.Disabled = Toggle.Disabled
            end

            for _, Addon in Toggle.Addons do
                if Addon.Type == "KeyPicker" and Addon.SyncToggleState then
                    Addon:Update()
                end
            end

            Button.Active = not Toggle.Disabled
            Toggle:Display()
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:SetVisible(Visible: boolean)
            Toggle.Visible = Visible

            Button.Visible = Toggle.Visible
            Groupbox:Resize()
        end

        function Toggle:SetText(Text: string)
            Toggle.Text = Text
            Label.Text = Text
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:AddToKeybindMenu(KeybindInfo)
            return AddElementToKeybindMenu(Toggle, KeybindInfo or Toggle.KeybindMenuInfo)
        end

        function Toggle:RemoveFromKeybindMenu()
            RemoveElementFromKeybindMenu(Toggle)
        end

        function Toggle:AddActionsMenu(KeybindInfo)
            Toggle.KeybindMenuInfo = KeybindInfo or Toggle.KeybindMenuInfo
            if not Toggle.ActionsMenu then
                CreateElementActionsMenu(Toggle, Toggle.KeybindMenuInfo, AddonHolder, true, Button)
            end
            return Toggle.ActionsMenu
        end

        Button.MouseButton1Click:Connect(function()
            if Library:IsSecondaryActionLocked(Button) then
                return
            end

            if Toggle.Disabled then
                return
            end

            Toggle:SetValue(not Toggle.Value)
        end)

        if typeof(Toggle.Tooltip) == "string" or typeof(Toggle.DisabledTooltip) == "string" then
            Toggle.TooltipTable = Library:AddTooltip(Toggle.Tooltip, Toggle.DisabledTooltip, Button)
            Toggle.TooltipTable.Disabled = Toggle.Disabled
        end

        if Toggle.Risky then
            Label.TextColor3 = Library.Scheme.RedColor
            Library.Registry[Label].TextColor3 = "RedColor"
        end

        Toggle:Display()
        if Info.ActionsMenu or Info.KeybindMenu then
            CreateElementActionsMenu(Toggle, Info, AddonHolder, true, Button)
        end
        if Info.KeybindMenu then
            AddElementToKeybindMenu(Toggle, Info)
        end
        Groupbox:Resize()

        Toggle.TextLabel = Label
        Toggle.AddonHolder = AddonHolder
        Toggle.Container = Container
        setmetatable(Toggle, BaseAddons)

        Toggle.Holder = Button
        table.insert(Groupbox.Elements, Toggle)

        Toggle.Default = Toggle.Value

        Toggles[Idx] = Toggle

        return Toggle
    end

    function Funcs:AddToggle(Idx, Info)
        if Library.ForceCheckbox then
            return Funcs.AddCheckbox(self, Idx, Info)
        end

        Info = Library:Validate(Info, Templates.Toggle)
        Info.ActionsMenu = Info.ActionsMenu == true or Info.ActionMenu == true
        Info.KeybindMenuIdx = Info.KeybindMenuIdx or Info.KeybindMenuId

        local Groupbox = self
        local Container = Groupbox.Container

        local Toggle = {
            Text = Info.Text,
            Value = Info.Default,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Callback = Info.Callback,
            Changed = Info.Changed,

            Risky = Info.Risky,
            Disabled = Info.Disabled,
            Visible = Info.Visible,
            Addons = {},

            Variant = "Switch",
            Type = "Toggle",
            KeybindMenuInfo = Info,
        }

        local Button = New("TextButton", {
            Active = not Toggle.Disabled,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Text = "",
            Visible = Toggle.Visible,
            Parent = Container,
        })

        local Label = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -40, 1, 0),
            Text = Toggle.Text,
            TextSize = 14,
            TextTransparency = 0.4,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Button,
        })

        local AddonHolder = CreateAddonHolder(Button, Label, -40)

        local Switch = New("Frame", {
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = "MainColor",
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromOffset(32, 18),
            Parent = Button,
        })
        New("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = Switch,
        })
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 2),
            PaddingTop = UDim.new(0, 2),
            Parent = Switch,
        })
        local SwitchStroke = New("UIStroke", {
            Color = "OutlineColor",
            Parent = Switch,
        })

        local Ball = New("Frame", {
            BackgroundColor3 = "FontColor",
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Parent = Switch,
        })
        New("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = Ball,
        })

        function Toggle:UpdateColors()
            Toggle:Display()
        end

        function Toggle:Display()
            if Library.Unloaded then
                return
            end

            local Offset = Toggle.Value and 1 or 0

            Switch.BackgroundTransparency = Toggle.Disabled and 0.75 or 0
            SwitchStroke.Transparency = Toggle.Disabled and 0.75 or 0

            Switch.BackgroundColor3 = Toggle.Value and Library.Scheme.AccentColor or Library.Scheme.MainColor
            SwitchStroke.Color = Toggle.Value and Library.Scheme.AccentColor or Library.Scheme.OutlineColor

            Library.Registry[Switch].BackgroundColor3 = Toggle.Value and "AccentColor" or "MainColor"
            Library.Registry[SwitchStroke].Color = Toggle.Value and "AccentColor" or "OutlineColor"

            if Toggle.Disabled then
                Label.TextTransparency = 0.8
                Ball.AnchorPoint = Vector2.new(Offset, 0)
                Ball.Position = UDim2.fromScale(Offset, 0)

                Ball.BackgroundColor3 = Library:GetDarkerColor(Library.Scheme.FontColor)
                Library.Registry[Ball].BackgroundColor3 = function()
                    return Library:GetDarkerColor(Library.Scheme.FontColor)
                end

                return
            end

            TweenService:Create(Label, Library.TweenInfo, {
                TextTransparency = Toggle.Value and 0 or 0.4,
            }):Play()
            TweenService:Create(Ball, Library.TweenInfo, {
                AnchorPoint = Vector2.new(Offset, 0),
                Position = UDim2.fromScale(Offset, 0),
            }):Play()

            Ball.BackgroundColor3 = Library.Scheme.FontColor
            Library.Registry[Ball].BackgroundColor3 = "FontColor"
        end

        function Toggle:OnChanged(Func)
            Toggle.Changed = Func
        end

        function Toggle:SetValue(Value)
            if Toggle.Disabled then
                return
            end

            Toggle.Value = Value
            Toggle:Display()

            for _, Addon in Toggle.Addons do
                if Addon.Type == "KeyPicker" and Addon.SyncToggleState then
                    Addon.Toggled = Toggle.Value
                    Addon:Update()
                end
            end
            SyncKeybindMenuEntry(Toggle)

            Library:UpdateDependencyBoxes()
            Library:SafeCallback(Toggle.Callback, Toggle.Value)
            Library:SafeCallback(Toggle.Changed, Toggle.Value)
        end

        function Toggle:SetDisabled(Disabled: boolean)
            Toggle.Disabled = Disabled

            if Toggle.TooltipTable then
                Toggle.TooltipTable.Disabled = Toggle.Disabled
            end

            for _, Addon in Toggle.Addons do
                if Addon.Type == "KeyPicker" and Addon.SyncToggleState then
                    Addon:Update()
                end
            end

            Button.Active = not Toggle.Disabled
            Toggle:Display()
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:SetVisible(Visible: boolean)
            Toggle.Visible = Visible

            Button.Visible = Toggle.Visible
            Groupbox:Resize()
        end

        function Toggle:SetText(Text: string)
            Toggle.Text = Text
            Label.Text = Text
            SyncKeybindMenuEntry(Toggle)
        end

        function Toggle:AddToKeybindMenu(KeybindInfo)
            return AddElementToKeybindMenu(Toggle, KeybindInfo or Toggle.KeybindMenuInfo)
        end

        function Toggle:RemoveFromKeybindMenu()
            RemoveElementFromKeybindMenu(Toggle)
        end

        function Toggle:AddActionsMenu(KeybindInfo)
            Toggle.KeybindMenuInfo = KeybindInfo or Toggle.KeybindMenuInfo
            if not Toggle.ActionsMenu then
                CreateElementActionsMenu(Toggle, Toggle.KeybindMenuInfo, AddonHolder, true, Button)
            end
            return Toggle.ActionsMenu
        end

        Button.MouseButton1Click:Connect(function()
            if Library:IsSecondaryActionLocked(Button) then
                return
            end

            if Toggle.Disabled then
                return
            end

            Toggle:SetValue(not Toggle.Value)
        end)

        if typeof(Toggle.Tooltip) == "string" or typeof(Toggle.DisabledTooltip) == "string" then
            Toggle.TooltipTable = Library:AddTooltip(Toggle.Tooltip, Toggle.DisabledTooltip, Button)
            Toggle.TooltipTable.Disabled = Toggle.Disabled
        end

        if Toggle.Risky then
            Label.TextColor3 = Library.Scheme.RedColor
            Library.Registry[Label].TextColor3 = "RedColor"
        end

        Toggle:Display()
        if Info.ActionsMenu or Info.KeybindMenu then
            CreateElementActionsMenu(Toggle, Info, AddonHolder, true, Button)
        end
        if Info.KeybindMenu then
            AddElementToKeybindMenu(Toggle, Info)
        end
        Groupbox:Resize()

        Toggle.TextLabel = Label
        Toggle.AddonHolder = AddonHolder
        Toggle.Container = Container
        setmetatable(Toggle, BaseAddons)

        Toggle.Holder = Button
        table.insert(Groupbox.Elements, Toggle)

        Toggle.Default = Toggle.Value

        Toggles[Idx] = Toggle

        return Toggle
    end

    function Funcs:AddInput(Idx, Info)
        if typeof(Info) == "table" and (typeof(Info.VerifyValue) == "function" and Info.Finished ~= true) then
            Info.Finished = true
        end

        Info = Library:Validate(Info, Templates.Input)

        local Groupbox = self
        local Container = Groupbox.Container

        local Input = {
            Text = Info.Text,
            Value = Info.Default,

            Finished = Info.Finished,
            Numeric = Info.Numeric,
            ClearTextOnFocus = Info.ClearTextOnFocus,
            ClearTextOnBlur = Info.ClearTextOnBlur,
            Placeholder = Info.Placeholder,
            AllowEmpty = Info.AllowEmpty,
            EmptyReset = Info.EmptyReset,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Callback = Info.Callback,
            Changed = Info.Changed,
            VerifyValue = Info.VerifyValue,

            Disabled = Info.Disabled,
            Visible = Info.Visible,

            Type = "Input",
        }

        local InputHeight = GetMobileHitSize(21)
        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, InputHeight + 18),
            Visible = Input.Visible,
            Parent = Container,
        })

        local Label = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 14),
            Text = Input.Text,
            TextSize = 14,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Holder,
        })

        local Box = New("TextBox", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            ClearTextOnFocus = not Input.Disabled and Input.ClearTextOnFocus,
            PlaceholderText = Input.Placeholder,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, InputHeight),
            Text = Input.Value,
            TextEditable = not Input.Disabled,
            TextScaled = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            Parent = Box,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = Box,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Box,
            })
        )

        function Input:UpdateColors()
            if Library.Unloaded then
                return
            end

            Label.TextTransparency = Input.Disabled and 0.8 or 0
            Box.TextTransparency = Input.Disabled and 0.8 or 0
        end

        function Input:OnChanged(Func)
            Input.Changed = Func
        end

        function Input:SetValue(Text)
            if not Input.AllowEmpty and Trim(Text) == "" then
                Text = Input.EmptyReset
            end

            if Info.MaxLength and #Text > Info.MaxLength then
                Text = Text:sub(1, Info.MaxLength)
            end

            if Input.Numeric then
                if #tostring(Text) > 0 and not tonumber(Text) then
                    Text = Input.Value
                end
            end

            if
                typeof(Info.VerifyValue) == "function" and (Text ~= Input.EmptyReset and Info.VerifyValue(Text) ~= true)
            then
                Text = Input.EmptyReset
            end

            Input.Value = Text
            Box.Text = Text

            if not Input.Disabled then
                Library:SafeCallback(Input.Callback, Input.Value)
                Library:SafeCallback(Input.Changed, Input.Value)
            end
        end

        function Input:SetDisabled(Disabled: boolean)
            Input.Disabled = Disabled

            if Input.TooltipTable then
                Input.TooltipTable.Disabled = Input.Disabled
            end

            Box.ClearTextOnFocus = not Input.Disabled and Input.ClearTextOnFocus
            Box.TextEditable = not Input.Disabled
            Input:UpdateColors()
        end

        function Input:SetVisible(Visible: boolean)
            Input.Visible = Visible

            Holder.Visible = Input.Visible
            Groupbox:Resize()
        end

        function Input:SetText(Text: string)
            Input.Text = Text
            Label.Text = Text
        end

        if Input.Finished then
            Box.FocusLost:Connect(function(Enter)
                if not Enter then
                    if Input.ClearTextOnBlur then
                        Box.Text = Input.Value
                    end

                    return
                end

                Input:SetValue(Box.Text)
            end)
        else
            Box:GetPropertyChangedSignal("Text"):Connect(function()
                if Box.Text == Input.Value then
                    return
                end

                Input:SetValue(Box.Text)
            end)
        end

        if typeof(Input.Tooltip) == "string" or typeof(Input.DisabledTooltip) == "string" then
            Input.TooltipTable = Library:AddTooltip(Input.Tooltip, Input.DisabledTooltip, Box)
            Input.TooltipTable.Disabled = Input.Disabled
        end

        Groupbox:Resize()

        Input.Holder = Holder
        table.insert(Groupbox.Elements, Input)

        Input.Default = Input.Value
        if
            typeof(Info.VerifyValue) == "function"
            and (Input.Default ~= Input.EmptyReset and Info.VerifyValue(Input.Default) ~= true)
        then
            Input:SetValue(Input.EmptyReset)
            Input.Default = Input.EmptyReset
        end

        Options[Idx] = Input

        return Input
    end

    function Funcs:AddSlider(Idx, Info)
        Info = Library:Validate(Info, Templates.Slider)

        local Groupbox = self
        local Container = Groupbox.Container

        local Slider = {
            Text = Info.Text,
            Value = Info.Default,

            Min = Info.Min,
            Max = Info.Max,

            Prefix = Info.Prefix,
            Suffix = Info.Suffix,
            Compact = Info.Compact,
            Rounding = Info.Rounding,
            HideMax = Info.HideMax,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Callback = Info.Callback,
            Changed = Info.Changed,

            Disabled = Info.Disabled,
            Visible = Info.Visible,

            Type = "Slider",
        }

        local SliderBarHeight = GetMobileHitSize(15)
        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Compact and SliderBarHeight or SliderBarHeight + 18),
            Visible = Slider.Visible,
            Parent = Container,
        })

        local SliderLabel
        if not Info.Compact then
            SliderLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 14),
                Text = Slider.Text,
                TextSize = 14,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = Holder,
            })
        end

        local Bar = New("TextButton", {
            Active = not Slider.Disabled,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, SliderBarHeight),
            Text = "",
            Parent = Holder,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = Bar,
        })

        local DisplayLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            TextSize = 14,
            ZIndex = 2,
            Parent = Bar,
        })
        New("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = "DarkColor",
            LineJoinMode = Enum.LineJoinMode.Miter,
            Parent = DisplayLabel,
        })

        local Fill = New("Frame", {
            BackgroundColor3 = "AccentColor",
            Size = UDim2.fromScale(0.5, 1),
            Parent = Bar,
        })

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Bar,
            })
        )

        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                Parent = Fill,
            })
        )

        function Slider:UpdateColors()
            if Library.Unloaded then
                return
            end

            if SliderLabel then
                SliderLabel.TextTransparency = Slider.Disabled and 0.8 or 0
            end
            DisplayLabel.TextTransparency = Slider.Disabled and 0.8 or 0

            Fill.BackgroundColor3 = Slider.Disabled and Library.Scheme.OutlineColor or Library.Scheme.AccentColor
            Library.Registry[Fill].BackgroundColor3 = Slider.Disabled and "OutlineColor" or "AccentColor"
        end

        function Slider:Display()
            if Library.Unloaded then
                return
            end

            local CustomDisplayText = nil
            if Info.FormatDisplayValue then
                CustomDisplayText = Info.FormatDisplayValue(Slider, Slider.Value)
            end

            if CustomDisplayText then
                DisplayLabel.Text = tostring(CustomDisplayText)
            else
                if Info.Compact then
                    DisplayLabel.Text =
                        string.format("%s: %s%s%s", Slider.Text, Slider.Prefix, Slider.Value, Slider.Suffix)
                elseif Info.HideMax then
                    DisplayLabel.Text = string.format("%s%s%s", Slider.Prefix, Slider.Value, Slider.Suffix)
                else
                    DisplayLabel.Text = string.format(
                        "%s%s%s/%s%s%s",
                        Slider.Prefix,
                        Slider.Value,
                        Slider.Suffix,
                        Slider.Prefix,
                        Slider.Max,
                        Slider.Suffix
                    )
                end
            end

            local X = (Slider.Value - Slider.Min) / (Slider.Max - Slider.Min)
            Fill.Size = UDim2.fromScale(X, 1)
        end

        function Slider:OnChanged(Func)
            Slider.Changed = Func
        end

        function Slider:SetMax(Value)
            assert(Value > Slider.Min, "Max value cannot be less than the current min value.")

            Slider:SetValue(math.clamp(Slider.Value, Slider.Min, Value))
            Slider.Max = Value
            Slider:Display()
        end

        function Slider:SetMin(Value)
            assert(Value < Slider.Max, "Min value cannot be greater than the current max value.")

            Slider:SetValue(math.clamp(Slider.Value, Value, Slider.Max))
            Slider.Min = Value
            Slider:Display()
        end

        function Slider:SetValue(Str)
            if Slider.Disabled then
                return
            end

            local Num = tonumber(Str)
            if not Num or Num == Slider.Value then
                return
            end

            Num = math.clamp(Num, Slider.Min, Slider.Max)

            Slider.Value = Num
            Slider:Display()

            Library:SafeCallback(Slider.Callback, Slider.Value)
            Library:SafeCallback(Slider.Changed, Slider.Value)
        end

        function Slider:SetDisabled(Disabled: boolean)
            Slider.Disabled = Disabled

            if Slider.TooltipTable then
                Slider.TooltipTable.Disabled = Slider.Disabled
            end

            Bar.Active = not Slider.Disabled
            Slider:UpdateColors()
        end

        function Slider:SetVisible(Visible: boolean)
            Slider.Visible = Visible

            Holder.Visible = Slider.Visible
            Groupbox:Resize()
        end

        function Slider:SetText(Text: string)
            Slider.Text = Text
            if SliderLabel then
                SliderLabel.Text = Text
                return
            end
            Slider:Display()
        end

        function Slider:SetPrefix(Prefix: string)
            Slider.Prefix = Prefix
            Slider:Display()
        end

        function Slider:SetSuffix(Suffix: string)
            Slider.Suffix = Suffix
            Slider:Display()
        end

        Bar.InputBegan:Connect(function(Input: InputObject)
            if not IsClickInput(Input) or Slider.Disabled then
                return
            end

            if Library.ActiveTab then
                for _, Side in Library.ActiveTab.Sides do
                    Side.ScrollingEnabled = false
                end
            end

            if Library.ActiveLoading and Library.ActiveLoading.Sidebar then
                Library.ActiveLoading.Sidebar.Container.ScrollingEnabled = false
            end

            while IsDragInput(Input) do
                local Location = GetPointerPosition(Input).X
                local Scale = math.clamp((Location - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)

                local OldValue = Slider.Value
                Slider.Value = Round(Slider.Min + ((Slider.Max - Slider.Min) * Scale), Slider.Rounding)

                Slider:Display()
                if Slider.Value ~= OldValue then
                    Library:SafeCallback(Slider.Callback, Slider.Value)
                    Library:SafeCallback(Slider.Changed, Slider.Value)
                end

                RunService.RenderStepped:Wait()
            end

            if Library.ActiveTab then
                for _, Side in Library.ActiveTab.Sides do
                    Side.ScrollingEnabled = true
                end
            end

            if Library.ActiveLoading and Library.ActiveLoading.Sidebar then
                Library.ActiveLoading.Sidebar.Container.ScrollingEnabled = true
            end
        end)

        if typeof(Slider.Tooltip) == "string" or typeof(Slider.DisabledTooltip) == "string" then
            Slider.TooltipTable = Library:AddTooltip(Slider.Tooltip, Slider.DisabledTooltip, Bar)
            Slider.TooltipTable.Disabled = Slider.Disabled
        end

        Slider:UpdateColors()
        Slider:Display()
        Groupbox:Resize()

        Slider.Holder = Holder
        table.insert(Groupbox.Elements, Slider)

        Slider.Default = Slider.Value

        Options[Idx] = Slider

        return Slider
    end

    function Funcs:AddDropdown(Idx, Info)
        Info = Library:Validate(Info, Templates.Dropdown)

        local Groupbox = self
        local Container = Groupbox.Container

        if Info.SpecialType == "Player" then
            Info.Values = GetPlayers(Info.ExcludeLocalPlayer)
            Info.AllowNull = true
        elseif Info.SpecialType == "Team" then
            Info.Values = GetTeams()
            Info.AllowNull = true
        end

        local Dropdown = {
            Text = typeof(Info.Text) == "string" and Info.Text or nil,

            Value = Info.Multi and {} or nil,
            Values = Info.Values,
            DisabledValues = Info.DisabledValues,
            ValueImages = Info.ValueImages,
            Cards = Info.Cards,

            Multi = Info.Multi,
            CardDropdown = Info.CardDropdown,
            CardHeight = Info.CardHeight,

            SpecialType = Info.SpecialType,
            ExcludeLocalPlayer = Info.ExcludeLocalPlayer,
            EnablePlayerImages = Info.EnablePlayerImages,

            Tooltip = Info.Tooltip,
            DisabledTooltip = Info.DisabledTooltip,
            TooltipTable = nil,

            Callback = Info.Callback,
            Changed = Info.Changed,

            Disabled = Info.Disabled,
            Visible = Info.Visible,

            Type = "Dropdown",
        }

        local DropdownHeight = GetMobileHitSize(21)
        local DropdownIconY = math.max(0, math.floor((DropdownHeight - 16) / 2))
        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Dropdown.Text and DropdownHeight + 18 or DropdownHeight),
            Visible = Dropdown.Visible,
            Parent = Container,
        })

        local Label = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 14),
            Text = Dropdown.Text,
            TextSize = 14,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Visible = not not Info.Text,
            ZIndex = 3,
            Parent = Holder,
        })

        local DisplayContainer = New("TextButton", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, DropdownHeight),
            Text = "",
            TextTransparency = 1,
            ZIndex = 2,
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingLeft = UDim.new(0, 0),
            PaddingRight = UDim.new(0, 0),
            Parent = DisplayContainer,
        })

        New("UIStroke", {
            Color = "OutlineColor",
            Parent = DisplayContainer,
        })

        if Library.CornerRadiusDropdown == true then
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                    Parent = DisplayContainer,
                })
            )
        end

        local DisplayImage = New("ImageLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(8, DropdownIconY),
            Size = UDim2.fromOffset(16, 16),
            Image = "",
            ImageTransparency = 1,
            Visible = false,
            ZIndex = 2,
            Parent = DisplayContainer,
        })

        local DisplayButton = New("TextButton", {
            Active = not Dropdown.Disabled,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(8, 0),
            Size = UDim2.new(1, -34, 0, DropdownHeight),
            Text = "---",
            TextSize = 14,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 2,
            Parent = DisplayContainer,
        })

        -- Dropdowns cant currently use corner radius since the button is supposed to be connected with the menu
        -- This can be done properly without some random frames and overlaying textlabel over the button after Roblox adds UICorner with specific corner radiuses

        local ArrowImage = New("ImageLabel", {
            AnchorPoint = Vector2.new(1, 0.5),
            Image = ArrowIcon and ArrowIcon.Url or "",
            ImageColor3 = "FontColor",
            ImageRectOffset = ArrowIcon and ArrowIcon.ImageRectOffset or Vector2.zero,
            ImageRectSize = ArrowIcon and ArrowIcon.ImageRectSize or Vector2.zero,
            ImageTransparency = 0.5,
            Position = UDim2.new(1, -6, 0.5, 0),
            Size = UDim2.fromOffset(16, 16),
            Parent = DisplayContainer,
        })

        local SearchBox
        if Info.Searchable then
            SearchBox = New("TextBox", {
                BackgroundTransparency = 1,
                PlaceholderText = "Search...",
                Size = UDim2.fromScale(1, 1),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Visible = false,
                Parent = DisplayButton,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 8),
                Parent = SearchBox,
            })
        end

        local ResolveImage = function(Image)
            if not Image then
                return nil
            end

            if typeof(Image) == "table" then
                return Image
            end

            return Library:GetCustomIcon(tostring(Image))
                or {
                    Url = tostring(Image),
                    ImageRectOffset = Vector2.zero,
                    ImageRectSize = Vector2.zero,
                }
        end

        local GetValueImage = function(Value)
            if not Value then
                return nil
            end

            local ValueImage = nil
            if Dropdown.SpecialType == "Player" and Dropdown.EnablePlayerImages == true then
                if typeof(Value) == "Instance" and Value:IsA("Player") then
                    ValueImage = {
                        Url = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=48&h=48", tostring(Value.UserId)),
                    }
                end
            else
                if Dropdown.ValueImages and Dropdown.ValueImages[Value] then
                    ValueImage = ResolveImage(Dropdown.ValueImages[Value])
                end
            end

            return ValueImage
        end

        local GetCardInfo = function(Value)
            local Card = Dropdown.Cards and Dropdown.Cards[Value]
            if typeof(Card) ~= "table" then
                Card = {}
            end

            Card.Text = Card.Text or (Info.FormatListValue and tostring(Info.FormatListValue(Value)) or tostring(Value))
            Card.Description = Card.Description or Card.Desc
            Card.Thumbnail = ResolveImage(Card.Thumbnail or Card.BackgroundImage or Card.Image)
            Card.Icon = ResolveImage(Card.Icon or (Dropdown.ValueImages and Dropdown.ValueImages[Value]))
            Card.BottomBarTransparency = Card.BottomBarTransparency or Info.CardBottomBarTransparency
            Card.ImageTransparency = Card.ImageTransparency or Info.CardImageTransparency
            Card.GradientColorSequence = Card.GradientColorSequence or Card.Gradient or Card.PreviewGradient
            Card.GradientTransparency = Card.GradientTransparency or Card.PreviewGradientTransparency
            Card.GradientRotation = Card.GradientRotation or Card.PreviewGradientRotation
            Card.PreviewBackgroundColor = Card.PreviewBackgroundColor or Card.BackgroundColor
            Card.PreviewMainColor = Card.PreviewMainColor or Card.MainColor
            Card.PreviewAccentColor = Card.PreviewAccentColor or Card.AccentColor
            Card.PreviewOutlineColor = Card.PreviewOutlineColor or Card.OutlineColor
            Card.PreviewFontColor = Card.PreviewFontColor or Card.FontColor

            return Card
        end

        local MenuTable = Library:AddContextMenu(
            DisplayContainer,
            function()
                return UDim2.fromOffset((DisplayContainer.AbsoluteSize.X / Library.DPIScale) + 1, 0)
            end,
            function()
                return { 0.5, DisplayContainer.AbsoluteSize.Y + 1.5 }
            end,
            2,
            function(Active: boolean)
                DisplayButton.TextTransparency = (Active and SearchBox) and 1 or 0
                ArrowImage.ImageTransparency = Active and 0 or 0.5
                ArrowImage.Rotation = Active and 180 or 0
                if SearchBox then
                    SearchBox.Text = ""
                    SearchBox.Visible = Active
                end
            end,
            true
        )
        Dropdown.Menu = MenuTable

        function Dropdown:RecalculateListSize(Count)
            local ItemHeight = Dropdown.CardDropdown and Dropdown.CardHeight or DropdownHeight
            local Y = math.clamp(
                (Count or GetTableSize(Dropdown.Values)) * ItemHeight,
                0,
                Info.MaxVisibleDropdownItems * ItemHeight
            )

            MenuTable:SetSize(function()
                return UDim2.fromOffset((DisplayContainer.AbsoluteSize.X / Library.DPIScale) + 1, Y)
            end)
        end

        function Dropdown:UpdateColors()
            if Library.Unloaded then
                return
            end

            Label.TextTransparency = Dropdown.Disabled and 0.8 or 0
            DisplayButton.TextTransparency = Dropdown.Disabled and 0.8 or 0
            DisplayImage.ImageTransparency = DisplayImage.Visible and (Dropdown.Disabled and 0.8 or 0) or 1
            ArrowImage.ImageTransparency = Dropdown.Disabled and 0.8 or MenuTable.Active and 0 or 0.5
        end

        function Dropdown:Display()
            if Library.Unloaded then
                return
            end

            local Str = ""
            local ValueImage = nil

            if Info.Multi then
                for _, Value in Dropdown.Values do
                    if Dropdown.Value[Value] then
                        if not ValueImage then
                            ValueImage = GetValueImage(Value)
                        end

                        local Card = Dropdown.CardDropdown and GetCardInfo(Value) or nil
                        Str = Str
                            .. (Card and Card.Text or Info.FormatDisplayValue and tostring(
                                Info.FormatDisplayValue(Value)
                            ) or tostring(Value))
                            .. ", "
                    end
                end

                Str = Str:sub(1, #Str - 2)
            else
                ValueImage = GetValueImage(Dropdown.Value)
                local Card = Dropdown.CardDropdown and GetCardInfo(Dropdown.Value) or nil
                Str = Dropdown.Value and (Card and Card.Text or tostring(Dropdown.Value)) or ""

                if Str ~= "" and Info.FormatDisplayValue and not Card then
                    Str = tostring(Info.FormatDisplayValue(Str))
                end
            end

            DisplayButton.Text = (Str == "" and "---" or Str)

            if ValueImage then
                DisplayImage.Image = ValueImage.Url
                DisplayImage.ImageRectOffset = ValueImage.ImageRectOffset or Vector2.zero
                DisplayImage.ImageRectSize = ValueImage.ImageRectSize or Vector2.zero
                DisplayImage.ImageTransparency = 0
                DisplayImage.Visible = true
            else
                DisplayImage.Image = ""
                DisplayImage.ImageTransparency = 1
                DisplayImage.Visible = false
            end

            DisplayButton.Position = ValueImage and UDim2.fromOffset(30, 0) or UDim2.fromOffset(8, 0)
            DisplayButton.Size = ValueImage and UDim2.new(1, -56, 0, DropdownHeight) or UDim2.new(1, -34, 0, DropdownHeight)
        end

        function Dropdown:OnChanged(Func)
            Dropdown.Changed = Func
        end

        function Dropdown:GetActiveValues()
            if Info.Multi then
                local Table = {}

                for Value, _ in Dropdown.Value do
                    table.insert(Table, Value)
                end

                return Table
            end

            return Dropdown.Value and 1 or 0
        end

        local Buttons = {}
        function Dropdown:BuildDropdownList()
            local Values = Dropdown.Values
            local DisabledValues = Dropdown.DisabledValues

            for Button, _ in Buttons do
                Button.Parent:Destroy()
            end
            table.clear(Buttons)

            local Count = 0
            for _, Value in Values do
                local CardInfo = Dropdown.CardDropdown and GetCardInfo(Value) or nil
                local FormattedValue = CardInfo and CardInfo.Text
                    or tostring(Info.FormatListValue and Info.FormatListValue(Value) or Value)
                local SearchValue = FormattedValue .. " " .. (CardInfo and tostring(CardInfo.Description or "") or "")
                if SearchBox and not SearchValue:lower():match(SearchBox.Text:lower()) then
                    continue
                end

                Count += 1

                local IsDisabled = table.find(DisabledValues, Value)
                local Table = {}
                local ValueImage = GetValueImage(Value)
                local Image
                local Button
                local TitleLabel
                local DescLabel
                local BottomBar

                local Container = New("Frame", {
                    BackgroundColor3 = "MainColor",
                    BackgroundTransparency = 1,
                    ClipsDescendants = Dropdown.CardDropdown,
                    LayoutOrder = IsDisabled and 1 or 0,
                    Size = UDim2.new(1, 0, 0, Dropdown.CardDropdown and Dropdown.CardHeight or DropdownHeight),
                    Parent = MenuTable.Menu,
                })

                if Dropdown.CardDropdown then
                    table.insert(
                        Library.Corners,
                        New("UICorner", {
                            CornerRadius = UDim.new(0, math.max(2, Library.CornerRadius - 1)),
                            Parent = Container,
                        })
                    )
                    Library:AddOutline(Container, {
                        Color = CardInfo.StrokeColor or "OutlineColor",
                        Thickness = CardInfo.StrokeThickness or 1,
                        Transparency = CardInfo.StrokeTransparency or 0.35,
                        ShadowTransparency = 1,
                    })

                    local HasPreviewCard = not CardInfo.Thumbnail
                        and (
                            CardInfo.GradientColorSequence
                            or CardInfo.PreviewBackgroundColor
                            or CardInfo.PreviewMainColor
                            or CardInfo.PreviewAccentColor
                            or CardInfo.PreviewSwatches
                        )

                    if HasPreviewCard then
                        local ResolvePreviewColor = function(Color, Default)
                            local SchemeColor = GetSchemeValue(Color)
                            if SchemeColor then
                                return SchemeColor
                            end

                            if typeof(Color) == "Color3" then
                                return Color
                            end

                            return GetSchemeValue(Default) or Library.Scheme[Default]
                        end

                        local PreviewBackgroundColor = ResolvePreviewColor(CardInfo.PreviewBackgroundColor, "BackgroundColor")
                        local PreviewMainColor = ResolvePreviewColor(CardInfo.PreviewMainColor, "MainColor")
                        local PreviewAccentColor = ResolvePreviewColor(CardInfo.PreviewAccentColor, "AccentColor")
                        local PreviewOutlineColor = ResolvePreviewColor(CardInfo.PreviewOutlineColor, "OutlineColor")
                        local PreviewFontColor = ResolvePreviewColor(CardInfo.PreviewFontColor, "FontColor")

                        Container.BackgroundColor3 = PreviewBackgroundColor
                        Container.BackgroundTransparency = 0.15

                        if CardInfo.GradientColorSequence then
                            Library:AddGradient(Container, {
                                Color = CardInfo.GradientColorSequence,
                                Rotation = CardInfo.GradientRotation or 35,
                                Transparency = CardInfo.GradientTransparency or NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 0.05),
                                    NumberSequenceKeypoint.new(1, 0.35),
                                }),
                            })
                        end

                        local PreviewPanel = New("Frame", {
                            BackgroundColor3 = PreviewMainColor,
                            BackgroundTransparency = 0.16,
                            Position = UDim2.fromOffset(8, 8),
                            Size = UDim2.new(1, -16, 0, math.max(26, Dropdown.CardHeight - 47)),
                            Parent = Container,
                        })
                        table.insert(
                            Library.Corners,
                            New("UICorner", {
                                CornerRadius = UDim.new(0, math.max(2, Library.CornerRadius - 1)),
                                Parent = PreviewPanel,
                            })
                        )
                        Library:AddOutline(PreviewPanel, {
                            Color = PreviewOutlineColor,
                            Transparency = 0.45,
                            ShadowTransparency = 1,
                        })

                        local AccentPill = New("Frame", {
                            BackgroundColor3 = PreviewAccentColor,
                            BackgroundTransparency = 0,
                            Position = UDim2.fromOffset(7, 7),
                            Size = UDim2.fromOffset(34, 6),
                            Parent = PreviewPanel,
                        })
                        table.insert(
                            Library.Corners,
                            New("UICorner", {
                                CornerRadius = UDim.new(1, 0),
                                Parent = AccentPill,
                            })
                        )

                        for Index = 1, 2 do
                            local TextLine = New("Frame", {
                                BackgroundColor3 = PreviewFontColor,
                                BackgroundTransparency = Index == 1 and 0.2 or 0.55,
                                Position = UDim2.new(0, 7, 0, 15 + (Index * 7)),
                                Size = UDim2.new(Index == 1 and 0.72 or 0.52, -7, 0, 4),
                                Parent = PreviewPanel,
                            })
                            table.insert(
                                Library.Corners,
                                New("UICorner", {
                                    CornerRadius = UDim.new(1, 0),
                                    Parent = TextLine,
                                })
                            )
                        end

                        local Swatches = CardInfo.PreviewSwatches
                            or {
                                PreviewBackgroundColor,
                                PreviewMainColor,
                                PreviewAccentColor,
                                PreviewOutlineColor,
                                PreviewFontColor,
                            }
                        local SwatchHolder = New("Frame", {
                            AnchorPoint = Vector2.new(1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, -7, 0, 7),
                            Size = UDim2.fromOffset(52, 8),
                            Parent = PreviewPanel,
                        })
                        New("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            Padding = UDim.new(0, 3),
                            Parent = SwatchHolder,
                        })

                        for _, SwatchColor in ipairs(Swatches) do
                            local Swatch = New("Frame", {
                                BackgroundColor3 = ResolvePreviewColor(SwatchColor, "AccentColor"),
                                BackgroundTransparency = 0,
                                Size = UDim2.fromOffset(8, 8),
                                Parent = SwatchHolder,
                            })
                            table.insert(
                                Library.Corners,
                                New("UICorner", {
                                    CornerRadius = UDim.new(1, 0),
                                    Parent = Swatch,
                                })
                            )
                            Library:AddOutline(Swatch, {
                                Color = PreviewOutlineColor,
                                Transparency = 0.45,
                                ShadowTransparency = 1,
                            })
                        end
                    end

                    Image = CardInfo.Thumbnail
                        and New("ImageLabel", {
                            BackgroundColor3 = "BackgroundColor",
                            BackgroundTransparency = 0,
                            Image = CardInfo.Thumbnail.Url,
                            ImageRectOffset = CardInfo.Thumbnail.ImageRectOffset or Vector2.zero,
                            ImageRectSize = CardInfo.Thumbnail.ImageRectSize or Vector2.zero,
                            ImageTransparency = CardInfo.ImageTransparency or 0,
                            ScaleType = CardInfo.ScaleType or Enum.ScaleType.Crop,
                            Size = UDim2.fromScale(1, 1),
                            Parent = Container,
                        })

                    BottomBar = New("Frame", {
                        AnchorPoint = Vector2.new(0, 1),
                        BackgroundColor3 = CardInfo.BottomBarColor or "DarkColor",
                        BackgroundTransparency = CardInfo.BottomBarTransparency or 0.2,
                        Position = UDim2.fromScale(0, 1),
                        Size = UDim2.new(1, 0, 0, math.clamp(CardInfo.BottomBarHeight or 35, 24, Dropdown.CardHeight)),
                        Parent = Container,
                    })

                    local CardIcon = CardInfo.Icon
                    if CardIcon then
                        New("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = CardIcon.Url,
                            ImageRectOffset = CardIcon.ImageRectOffset or Vector2.zero,
                            ImageRectSize = CardIcon.ImageRectSize or Vector2.zero,
                            ImageTransparency = 0,
                            Position = UDim2.fromOffset(7, 7),
                            Size = UDim2.fromOffset(20, 20),
                            Parent = BottomBar,
                        })
                    end

                    TitleLabel = New("TextLabel", {
                        BackgroundTransparency = 1,
                        Position = UDim2.fromOffset(CardIcon and 33 or 8, 3),
                        Size = UDim2.new(1, CardIcon and -39 or -14, 0, CardInfo.Description and 15 or 28),
                        Text = FormattedValue,
                        TextSize = 14,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        TextWrapped = false,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Parent = BottomBar,
                    })

                    if CardInfo.Description then
                        DescLabel = New("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.fromOffset(CardIcon and 33 or 8, 18),
                            Size = UDim2.new(1, CardIcon and -39 or -14, 0, 14),
                            Text = tostring(CardInfo.Description),
                            TextSize = 12,
                            TextTransparency = 0.25,
                            TextTruncate = Enum.TextTruncate.AtEnd,
                            TextWrapped = false,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = BottomBar,
                        })
                    end

                    Button = New("TextButton", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Text = "",
                        Parent = Container,
                    })
                else
                    Image = ValueImage
                        and New("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = ValueImage.Url,
                            ImageRectOffset = ValueImage.ImageRectOffset or Vector2.zero,
                            ImageRectSize = ValueImage.ImageRectSize or Vector2.zero,
                            ImageTransparency = 0.5,
                            Size = UDim2.fromOffset(16, 16),
                            Position = UDim2.fromOffset(4, DropdownIconY),
                            Parent = Container,
                        })

                    Button = New("TextButton", {
                        BackgroundTransparency = 1,
                        Size = ValueImage and UDim2.new(1, -18, 0, DropdownHeight) or UDim2.new(1, 0, 0, DropdownHeight),
                        Position = ValueImage and UDim2.fromOffset(18, 0) or UDim2.fromOffset(0, 0),
                        Text = FormattedValue,
                        TextSize = 14,
                        TextTransparency = 0.5,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Parent = Container,
                    })
                    New("UIPadding", {
                        PaddingLeft = UDim.new(0, 7),
                        PaddingRight = UDim.new(0, 7),
                        Parent = Button,
                    })
                end

                local Selected
                if Info.Multi then
                    Selected = Dropdown.Value[Value]
                else
                    Selected = Dropdown.Value == Value
                end

                function Table:UpdateButton()
                    if Info.Multi then
                        Selected = Dropdown.Value[Value]
                    else
                        Selected = Dropdown.Value == Value
                    end

                    Container.BackgroundTransparency = Selected and 0 or 1
                    if Dropdown.CardDropdown then
                        Container.BackgroundTransparency = Selected and 0 or 0.15
                        if BottomBar then
                            BottomBar.BackgroundTransparency = IsDisabled and 0.6
                                or Selected and 0.05
                                or (CardInfo.BottomBarTransparency or 0.2)
                        end
                        if Image then
                            Image.ImageTransparency = IsDisabled and 0.45 or (CardInfo.ImageTransparency or 0)
                        end
                        if TitleLabel then
                            TitleLabel.TextTransparency = IsDisabled and 0.8 or Selected and 0 or 0.05
                        end
                        if DescLabel then
                            DescLabel.TextTransparency = IsDisabled and 0.85 or Selected and 0.15 or 0.3
                        end
                    else
                        Button.TextTransparency = IsDisabled and 0.8 or Selected and 0 or 0.5

                        if Image then
                            Image.ImageTransparency = IsDisabled and 0.8 or Selected and 0 or 0.5
                        end
                    end
                end

                if not IsDisabled then
                    Button.MouseButton1Click:Connect(function()
                        local Try = not Selected

                        if not (Dropdown:GetActiveValues() == 1 and not Try and not Info.AllowNull) then
                            Selected = Try
                            if Info.Multi then
                                Dropdown.Value[Value] = Selected and true or nil
                            else
                                Dropdown.Value = Selected and Value or nil
                            end

                            for _, OtherButton in Buttons do
                                OtherButton:UpdateButton()
                            end
                        end

                        Table:UpdateButton()
                        Dropdown:Display()

                        Library:UpdateDependencyBoxes()
                        Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
                        Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
                    end)
                end

                Table:UpdateButton()
                Dropdown:Display()

                Buttons[Button] = Table
            end

            Dropdown:RecalculateListSize(Count)
        end

        function Dropdown:SetValue(Value)
            if Info.Multi then
                local Table = {}

                for Val, Active in Value or {} do
                    if typeof(Active) ~= "boolean" then
                        Table[Active] = true
                    elseif Active and table.find(Dropdown.Values, Val) then
                        Table[Val] = true
                    end
                end

                Dropdown.Value = Table
            else
                if table.find(Dropdown.Values, Value) then
                    Dropdown.Value = Value
                elseif not Value then
                    Dropdown.Value = nil
                end
            end

            Dropdown:Display()
            for _, Button in Buttons do
                Button:UpdateButton()
            end

            if not Dropdown.Disabled then
                Library:UpdateDependencyBoxes()
                Library:SafeCallback(Dropdown.Callback, Dropdown.Value)
                Library:SafeCallback(Dropdown.Changed, Dropdown.Value)
            end
        end

        function Dropdown:SetValues(Values)
            Dropdown.Values = Values
            Dropdown:BuildDropdownList()
        end

        function Dropdown:AddValues(Values)
            if typeof(Values) == "table" then
                for _, val in Values do
                    table.insert(Dropdown.Values, val)
                end
            elseif typeof(Values) == "string" then
                table.insert(Dropdown.Values, Values)
            else
                return
            end

            Dropdown:BuildDropdownList()
        end

        function Dropdown:SetDisabledValues(DisabledValues)
            Dropdown.DisabledValues = DisabledValues
            Dropdown:BuildDropdownList()
        end

        function Dropdown:AddDisabledValues(DisabledValues)
            if typeof(DisabledValues) == "table" then
                for _, val in DisabledValues do
                    table.insert(Dropdown.DisabledValues, val)
                end
            elseif typeof(DisabledValues) == "string" then
                table.insert(Dropdown.DisabledValues, DisabledValues)
            else
                return
            end

            Dropdown:BuildDropdownList()
        end

        function Dropdown:SetValueImages(ValueImages)
            if typeof(ValueImages) ~= "table" then
                return
            end

            Dropdown.ValueImages = ValueImages
            Dropdown:BuildDropdownList()
        end

        function Dropdown:SetCards(Cards)
            if typeof(Cards) ~= "table" then
                return
            end

            Dropdown.Cards = Cards
            Info.Cards = Cards
            Dropdown:BuildDropdownList()
        end

        function Dropdown:AddCards(Cards)
            if typeof(Cards) ~= "table" then
                return
            end

            for key, val in Cards do
                Dropdown.Cards[key] = val
            end

            Dropdown:BuildDropdownList()
        end

        function Dropdown:AddValueImages(ValueImages)
            if typeof(ValueImages) ~= "table" then
                return
            end

            for key, val in ValueImages do
                Dropdown.ValueImages[key] = val
            end

            Dropdown:BuildDropdownList()
        end

        function Dropdown:SetDisabled(Disabled: boolean)
            Dropdown.Disabled = Disabled

            if Dropdown.TooltipTable then
                Dropdown.TooltipTable.Disabled = Dropdown.Disabled
            end

            MenuTable:Close()
            DisplayButton.Active = not Dropdown.Disabled
            Dropdown:UpdateColors()
        end

        function Dropdown:SetVisible(Visible: boolean)
            Dropdown.Visible = Visible

            Holder.Visible = Dropdown.Visible
            Groupbox:Resize()
        end

        function Dropdown:SetText(Text: string)
            Dropdown.Text = Text
            Holder.Size = UDim2.new(1, 0, 0, Text and DropdownHeight + 18 or DropdownHeight)

            Label.Text = Text and Text or ""
            Label.Visible = not not Text
        end

        local ToggleDropdown = function()
            if Dropdown.Disabled then
                return
            end

            MenuTable:Toggle()
        end

        DisplayContainer.MouseButton1Click:Connect(ToggleDropdown)
        DisplayButton.MouseButton1Click:Connect(ToggleDropdown)

        if SearchBox then
            SearchBox:GetPropertyChangedSignal("Text"):Connect(Dropdown.BuildDropdownList)
        end

        local Defaults = {}
        if typeof(Info.Default) == "string" then
            local Index = table.find(Dropdown.Values, Info.Default)
            if Index then
                table.insert(Defaults, Index)
            end
        elseif typeof(Info.Default) == "table" then
            for _, Value in next, Info.Default do
                local Index = table.find(Dropdown.Values, Value)
                if Index then
                    table.insert(Defaults, Index)
                end
            end
        elseif Dropdown.Values[Info.Default] ~= nil then
            table.insert(Defaults, Info.Default)
        end

        if next(Defaults) then
            for i = 1, #Defaults do
                local Index = Defaults[i]
                if Info.Multi then
                    Dropdown.Value[Dropdown.Values[Index]] = true
                else
                    Dropdown.Value = Dropdown.Values[Index]
                end

                if not Info.Multi then
                    break
                end
            end
        end

        if typeof(Dropdown.Tooltip) == "string" or typeof(Dropdown.DisabledTooltip) == "string" then
            Dropdown.TooltipTable = Library:AddTooltip(Dropdown.Tooltip, Dropdown.DisabledTooltip, DisplayContainer)
            Dropdown.TooltipTable.Disabled = Dropdown.Disabled
        end

        Dropdown:UpdateColors()
        Dropdown:Display()
        Dropdown:BuildDropdownList()
        Groupbox:Resize()

        Dropdown.Holder = Holder
        table.insert(Groupbox.Elements, Dropdown)

        Dropdown.Default = Defaults
        Dropdown.DefaultValues = Dropdown.Values

        Options[Idx] = Dropdown

        return Dropdown
    end

    function Funcs:AddViewport(Idx, Info)
        Info = Library:Validate(Info, Templates.Viewport)

        local Groupbox = self
        local Container = Groupbox.Container

        local Dragging, Pinching = false, false
        local LastMousePos, LastPinchDist = nil, 0

        local ViewportObject = Info.Object
        if Info.Clone and typeof(Info.Object) == "Instance" then
            if Info.Object.Archivable then
                ViewportObject = ViewportObject:Clone()
            else
                Info.Object.Archivable = true
                ViewportObject = ViewportObject:Clone()
                Info.Object.Archivable = false
            end
        end

        local Viewport = {
            Object = ViewportObject,
            Camera = if not Info.Camera then Instance.new("Camera") else Info.Camera,
            Interactive = Info.Interactive,
            AutoFocus = Info.AutoFocus,
            Visible = Info.Visible,
            Type = "Viewport",
        }

        assert(
            typeof(Viewport.Object) == "Instance" and (Viewport.Object:IsA("BasePart") or Viewport.Object:IsA("Model")),
            "Instance must be a BasePart or Model."
        )

        assert(
            typeof(Viewport.Camera) == "Instance" and Viewport.Camera:IsA("Camera"),
            "Camera must be a valid Camera instance."
        )

        local function GetModelSize(model)
            if model:IsA("BasePart") then
                return model.Size
            end

            return select(2, model:GetBoundingBox())
        end

        local function FocusCamera()
            local ModelSize = GetModelSize(Viewport.Object)
            local MaxExtent = math.max(ModelSize.X, ModelSize.Y, ModelSize.Z)
            local CameraDistance = MaxExtent * 2
            local ModelPosition = Viewport.Object:GetPivot().Position

            Viewport.Camera.CFrame =
                CFrame.new(ModelPosition + Vector3.new(0, MaxExtent / 2, CameraDistance), ModelPosition)
        end

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Height),
            Visible = Viewport.Visible,
            Parent = Container,
        })

        local Box = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            BorderColor3 = "OutlineColor",
            BorderSizePixel = 1,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 1),
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            Parent = Box,
        })

        local ViewportFrame = New("ViewportFrame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Parent = Box,
            CurrentCamera = Viewport.Camera,
            Active = Viewport.Interactive,
        })

        ViewportFrame.MouseEnter:Connect(function()
            if not Viewport.Interactive then
                return
            end

            for _, Side in Groupbox.Tab.Sides do
                Side.ScrollingEnabled = false
            end
        end)

        ViewportFrame.MouseLeave:Connect(function()
            if not Viewport.Interactive then
                return
            end

            for _, Side in Groupbox.Tab.Sides do
                Side.ScrollingEnabled = true
            end
        end)

        ViewportFrame.InputBegan:Connect(function(input)
            if not Viewport.Interactive then
                return
            end

            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                Dragging = true
                LastMousePos = input.Position
            elseif
                input.UserInputType == Enum.UserInputType.MouseButton1
                and Library.IsDesktop
                and Library.ViewportDragWithM1
            then
                Dragging = true
                LastMousePos = input.Position
            elseif input.UserInputType == Enum.UserInputType.Touch and not Pinching then
                Dragging = true
                LastMousePos = input.Position
            end
        end)

        Library:GiveSignal(UserInputService.InputEnded:Connect(function(input)
            if Library.Unloaded then
                return
            end

            if not Viewport.Interactive then
                return
            end

            if
                input.UserInputType == Enum.UserInputType.MouseButton2
                or (
                    input.UserInputType == Enum.UserInputType.MouseButton1
                    and Library.IsDesktop
                    and Library.ViewportDragWithM1
                )
            then
                Dragging = false
            elseif input.UserInputType == Enum.UserInputType.Touch then
                Dragging = false
            end
        end))

        Library:GiveSignal(UserInputService.InputChanged:Connect(function(input)
            if Library.Unloaded then
                return
            end

            if not Viewport.Interactive or not Dragging or Pinching then
                return
            end

            if
                input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch
            then
                local MouseDelta = input.Position - LastMousePos
                LastMousePos = input.Position

                local Position = Viewport.Object:GetPivot().Position
                local Camera = Viewport.Camera

                local RotationY = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), -MouseDelta.X * 0.01)
                Camera.CFrame = CFrame.new(Position) * RotationY * CFrame.new(-Position) * Camera.CFrame

                local RotationX = CFrame.fromAxisAngle(Camera.CFrame.RightVector, -MouseDelta.Y * 0.01)
                local PitchedCFrame = CFrame.new(Position) * RotationX * CFrame.new(-Position) * Camera.CFrame

                if PitchedCFrame.UpVector.Y > 0.1 then
                    Camera.CFrame = PitchedCFrame
                end
            end
        end))

        ViewportFrame.InputChanged:Connect(function(input)
            if not Viewport.Interactive then
                return
            end

            if input.UserInputType == Enum.UserInputType.MouseWheel then
                local ZoomAmount = input.Position.Z * 2
                Viewport.Camera.CFrame += Viewport.Camera.CFrame.LookVector * ZoomAmount
            end
        end)

        Library:GiveSignal(UserInputService.TouchPinch:Connect(function(touchPositions, scale, velocity, state)
            if Library.Unloaded then
                return
            end

            if not Viewport.Interactive or not Library:MouseIsOverFrame(ViewportFrame, touchPositions[1]) then
                return
            end

            if state == Enum.UserInputState.Begin then
                Pinching = true
                Dragging = false
                LastPinchDist = (touchPositions[1] - touchPositions[2]).Magnitude
            elseif state == Enum.UserInputState.Change then
                local currentDist = (touchPositions[1] - touchPositions[2]).Magnitude
                local delta = (currentDist - LastPinchDist) * 0.1
                LastPinchDist = currentDist
                Viewport.Camera.CFrame += Viewport.Camera.CFrame.LookVector * delta
            elseif state == Enum.UserInputState.End or state == Enum.UserInputState.Cancel then
                Pinching = false
            end
        end))

        Viewport.Object.Parent = ViewportFrame
        if Viewport.AutoFocus then
            FocusCamera()
        end

        function Viewport:SetObject(Object: Instance, Clone: boolean?)
            assert(Object, "Object cannot be nil.")

            if Clone then
                Object = Object:Clone()
            end

            if Viewport.Object then
                Viewport.Object:Destroy()
            end

            Viewport.Object = Object
            Viewport.Object.Parent = ViewportFrame

            Groupbox:Resize()
        end

        function Viewport:SetHeight(Height: number)
            assert(Height > 0, "Height must be greater than 0.")

            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        function Viewport:Focus()
            if not Viewport.Object then
                return
            end

            FocusCamera()
        end

        function Viewport:SetCamera(Camera: Instance)
            assert(
                Camera and typeof(Camera) == "Instance" and Camera:IsA("Camera"),
                "Camera must be a valid Camera instance."
            )

            Viewport.Camera = Camera
            ViewportFrame.CurrentCamera = Camera
        end

        function Viewport:SetInteractive(Interactive: boolean)
            Viewport.Interactive = Interactive
            ViewportFrame.Active = Interactive
        end

        function Viewport:SetVisible(Visible: boolean)
            Viewport.Visible = Visible

            Holder.Visible = Viewport.Visible
            Groupbox:Resize()
        end

        Groupbox:Resize()

        Viewport.Holder = Holder
        table.insert(Groupbox.Elements, Viewport)

        Options[Idx] = Viewport

        return Viewport
    end

    function Funcs:AddImage(Idx, Info)
        Info = Library:Validate(Info, Templates.Image)

        local Groupbox = self
        local Container = Groupbox.Container

        local Image = {
            Image = Info.Image,
            Color = Info.Color,
            RectOffset = Info.RectOffset,
            RectSize = Info.RectSize,
            Height = Info.Height,
            ScaleType = Info.ScaleType,
            Transparency = Info.Transparency,
            BackgroundTransparency = Info.BackgroundTransparency,

            Visible = Info.Visible,
            Type = "Image",
        }

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Height),
            Visible = Image.Visible,
            Parent = Container,
        })

        local Box = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            BorderColor3 = "OutlineColor",
            BorderSizePixel = 1,
            BackgroundTransparency = Image.BackgroundTransparency,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 1),
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            Parent = Box,
        })

        local ImageProperties = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = Image.Image,
            ImageTransparency = Image.Transparency,
            ImageColor3 = Image.Color,
            ImageRectOffset = Image.RectOffset,
            ImageRectSize = Image.RectSize,
            ScaleType = Image.ScaleType,
            Parent = Box,
        }

        local Icon = Library:GetCustomIcon(ImageProperties.Image)
        if Icon then
            ImageProperties.Image = Icon.Url
            ImageProperties.ImageRectOffset = Icon.ImageRectOffset
            ImageProperties.ImageRectSize = Icon.ImageRectSize
        elseif IsValidCustomIcon(ImageProperties.Image) or IsHttpUrl(ImageProperties.Image) then
            ImageProperties.Image = Library:DownloadImage(ImageProperties.Image, {
                AssetName = "GroupboxImage_" .. HashString(ImageProperties.Image),
                Extension = "png",
            })
        else
            warn(
                string.format(
                    "[Obsidian] AddImage: invalid image %q. Use rbxassetid, URL, or lucide icon.",
                    tostring(ImageProperties.Image)
                )
            )
            ImageProperties.Image = ""
        end

        local ImageLabel = New("ImageLabel", ImageProperties)

        function Image:SetHeight(Height: number)
            assert(Height > 0, "Height must be greater than 0.")

            Image.Height = Height
            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        function Image:SetImage(NewImage: string)
            assert(typeof(NewImage) == "string", "Image must be a string.")

            local Icon = Library:GetCustomIcon(NewImage)
            assert(Icon, "Image must be a valid Roblox asset or a valid URL or a valid lucide icon.")

            NewImage = Icon.Url
            Image.RectOffset = Icon.ImageRectOffset
            Image.RectSize = Icon.ImageRectSize

            ImageLabel.Image = NewImage
            Image.Image = NewImage
        end

        function Image:SetColor(Color: Color3)
            assert(typeof(Color) == "Color3", "Color must be a Color3 value.")

            ImageLabel.ImageColor3 = Color
            Image.Color = Color
        end

        function Image:SetRectOffset(RectOffset: Vector2)
            assert(typeof(RectOffset) == "Vector2", "RectOffset must be a Vector2 value.")

            ImageLabel.ImageRectOffset = RectOffset
            Image.RectOffset = RectOffset
        end

        function Image:SetRectSize(RectSize: Vector2)
            assert(typeof(RectSize) == "Vector2", "RectSize must be a Vector2 value.")

            ImageLabel.ImageRectSize = RectSize
            Image.RectSize = RectSize
        end

        function Image:SetScaleType(ScaleType: Enum.ScaleType)
            assert(
                typeof(ScaleType) == "EnumItem" and ScaleType:IsA("ScaleType"),
                "ScaleType must be a valid Enum.ScaleType."
            )

            ImageLabel.ScaleType = ScaleType
            Image.ScaleType = ScaleType
        end

        function Image:SetTransparency(Transparency: number)
            assert(typeof(Transparency) == "number", "Transparency must be a number between 0 and 1.")
            assert(Transparency >= 0 and Transparency <= 1, "Transparency must be between 0 and 1.")

            ImageLabel.ImageTransparency = Transparency
            Image.Transparency = Transparency
        end

        function Image:SetVisible(Visible: boolean)
            Image.Visible = Visible

            Holder.Visible = Image.Visible
            Groupbox:Resize()
        end

        Groupbox:Resize()

        Image.Holder = Holder
        table.insert(Groupbox.Elements, Image)

        Options[Idx] = Image

        return Image
    end

    function Funcs:AddVideo(Idx, Info)
        Info = Library:Validate(Info, Templates.Video)

        local Groupbox = self
        local Container = Groupbox.Container

        local function ResolveVideoAsset(VideoUrl: string, FileName: string?)
            if IsHttpUrl(VideoUrl) then
                return Library:DownloadVideo(VideoUrl, {
                    FileName = FileName or Info.FileName or tostring(Idx),
                    Folder = Info.Folder,
                    Extension = Info.Extension,
                    ForceRedownload = Info.ForceRedownload,
                })
            end

            return VideoUrl
        end

        local Video = {
            Video = ResolveVideoAsset(Info.Video, Info.FileName),
            SourceUrl = Info.Video,
            Looped = Info.Looped,
            Playing = Info.Playing,
            Volume = Info.Volume,
            Height = Info.Height,
            Visible = Info.Visible,

            Type = "Video",
        }

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Height),
            Visible = Video.Visible,
            Parent = Container,
        })

        local Box = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            BorderColor3 = "OutlineColor",
            BorderSizePixel = 1,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 1),
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            Parent = Box,
        })

        local VideoFrameInstance = New("VideoFrame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Video = Video.Video,
            Looped = Video.Looped,
            Volume = Video.Volume,
            Parent = Box,
        })

        VideoFrameInstance.Playing = Video.Playing

        function Video:SetHeight(Height: number)
            assert(Height > 0, "Height must be greater than 0.")

            Video.Height = Height
            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        function Video:SetVideo(NewVideo: string, FileName: string?)
            assert(typeof(NewVideo) == "string", "Video must be a string.")

            local ResolvedVideo = ResolveVideoAsset(NewVideo, FileName)
            VideoFrameInstance.Video = ResolvedVideo
            Video.Video = ResolvedVideo
            Video.SourceUrl = NewVideo
        end

        function Video:SetLooped(Looped: boolean)
            assert(typeof(Looped) == "boolean", "Looped must be a boolean.")

            VideoFrameInstance.Looped = Looped
            Video.Looped = Looped
        end

        function Video:SetVolume(Volume: number)
            assert(typeof(Volume) == "number", "Volume must be a number between 0 and 10.")

            VideoFrameInstance.Volume = Volume
            Video.Volume = Volume
        end

        function Video:SetPlaying(Playing: boolean)
            assert(typeof(Playing) == "boolean", "Playing must be a boolean.")

            VideoFrameInstance.Playing = Playing
            Video.Playing = Playing
        end

        function Video:Play()
            VideoFrameInstance.Playing = true
            Video.Playing = true
        end

        function Video:Pause()
            VideoFrameInstance.Playing = false
            Video.Playing = false
        end

        function Video:SetVisible(Visible: boolean)
            Video.Visible = Visible

            Holder.Visible = Video.Visible
            Groupbox:Resize()
        end

        Groupbox:Resize()

        Video.Holder = Holder
        Video.VideoFrame = VideoFrameInstance
        table.insert(Groupbox.Elements, Video)

        Options[Idx] = Video

        return Video
    end

    function Funcs:AddSprite(Idx, Info)
        Info = Library:Validate(Info, Templates.Sprite)

        local Groupbox = self
        local Container = Groupbox.Container

        local Sprite = {
            Image = Info.Image,
            Frames = Info.Frames,
            FrameSize = Info.FrameSize,
            FrameCount = Info.FrameCount,
            Columns = Info.Columns,
            Fps = Info.Fps or Info.FPS,
            Loop = Info.Loop,
            Playing = Info.Playing,
            Height = Info.Height,
            Transparency = Info.Transparency,
            BackgroundTransparency = Info.BackgroundTransparency,
            Color = Info.Color,
            ScaleType = Info.ScaleType,
            Visible = Info.Visible,
            Type = "Sprite",
        }

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Sprite.Height),
            Visible = Sprite.Visible,
            Parent = Container,
        })

        local Box = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = "MainColor",
            BackgroundTransparency = Sprite.BackgroundTransparency,
            BorderColor3 = "OutlineColor",
            BorderSizePixel = 1,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 1),
            Parent = Holder,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
            Parent = Box,
        })

        local ImageLabel = New("ImageLabel", {
            BackgroundTransparency = 1,
            ImageColor3 = Sprite.Color,
            ImageTransparency = Sprite.Transparency,
            ScaleType = Sprite.ScaleType,
            Size = UDim2.fromScale(1, 1),
            Parent = Box,
        })

        local function ApplyImage(NewImage: string)
            local Icon = Library:GetCustomIcon(NewImage)
            if Icon then
                ImageLabel.Image = Icon.Url
                ImageLabel.ImageRectOffset = Icon.ImageRectOffset or Vector2.zero
                ImageLabel.ImageRectSize = Icon.ImageRectSize or Vector2.zero
            elseif IsHttpUrl(NewImage) then
                ImageLabel.Image = Library:DownloadSprite(NewImage, {
                    FileName = Info.FileName or tostring(Idx),
                    Folder = Info.Folder,
                    ForceRedownload = Info.ForceRedownload,
                })
            else
                ImageLabel.Image = NewImage
            end
        end

        function Sprite:Play()
            Sprite.Playing = true
            Library:AnimateIconSprite(ImageLabel, {
                Image = Sprite.Image,
                FileName = Info.FileName or tostring(Idx),
                Folder = Info.Folder,
                ForceRedownload = Info.ForceRedownload,
                Frames = Sprite.Frames,
                FrameSize = Sprite.FrameSize,
                FrameCount = Sprite.FrameCount,
                Columns = Sprite.Columns,
                Fps = Sprite.Fps,
                Loop = Sprite.Loop,
            })
        end

        function Sprite:Stop()
            Sprite.Playing = false
            Library:StopIconSpriteAnimation(ImageLabel)
        end

        function Sprite:SetHeight(Height: number)
            assert(Height > 0, "Height must be greater than 0.")

            Sprite.Height = Height
            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        function Sprite:SetImage(NewImage: string)
            assert(typeof(NewImage) == "string", "Image must be a string.")

            Sprite.Image = NewImage
            ApplyImage(NewImage)
            if Sprite.Playing then
                Sprite:Play()
            end
        end

        function Sprite:SetColor(Color: Color3)
            assert(typeof(Color) == "Color3", "Color must be a Color3 value.")

            ImageLabel.ImageColor3 = Color
            Sprite.Color = Color
        end

        function Sprite:SetTransparency(Transparency: number)
            assert(typeof(Transparency) == "number", "Transparency must be a number between 0 and 1.")
            assert(Transparency >= 0 and Transparency <= 1, "Transparency must be between 0 and 1.")

            ImageLabel.ImageTransparency = Transparency
            Sprite.Transparency = Transparency
        end

        function Sprite:SetVisible(Visible: boolean)
            Sprite.Visible = Visible
            Holder.Visible = Sprite.Visible
            Groupbox:Resize()
        end

        ApplyImage(Sprite.Image)
        if Sprite.Playing then
            Sprite:Play()
        end

        Groupbox:Resize()

        Sprite.Holder = Holder
        Sprite.ImageLabel = ImageLabel
        table.insert(Groupbox.Elements, Sprite)

        Options[Idx] = Sprite

        return Sprite
    end

    function Funcs:AddUIPassthrough(Idx, Info)
        Info = Library:Validate(Info, Templates.UIPassthrough)

        local Groupbox = self
        local Container = Groupbox.Container

        assert(Info.Instance, "Instance must be provided.")
        assert(
            typeof(Info.Instance) == "Instance" and Info.Instance:IsA("GuiBase2d"),
            "Instance must inherit from GuiBase2d."
        )
        assert(typeof(Info.Height) == "number" and Info.Height > 0, "Height must be a number greater than 0.")

        local Passthrough = {
            Instance = Info.Instance,
            Height = Info.Height,
            Visible = Info.Visible,

            Type = "UIPassthrough",
        }

        local Holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, Info.Height),
            Visible = Passthrough.Visible,
            Parent = Container,
        })

        Passthrough.Instance.Parent = Holder

        Groupbox:Resize()

        function Passthrough:SetHeight(Height: number)
            assert(typeof(Height) == "number" and Height > 0, "Height must be a number greater than 0.")

            Passthrough.Height = Height
            Holder.Size = UDim2.new(1, 0, 0, Height)
            Groupbox:Resize()
        end

        function Passthrough:SetInstance(Instance: Instance)
            assert(Instance, "Instance must be provided.")
            assert(
                typeof(Instance) == "Instance" and Instance:IsA("GuiBase2d"),
                "Instance must inherit from GuiBase2d."
            )

            if Passthrough.Instance then
                Passthrough.Instance.Parent = nil
            end

            Passthrough.Instance = Instance
            Passthrough.Instance.Parent = Holder
        end

        function Passthrough:SetVisible(Visible: boolean)
            Passthrough.Visible = Visible

            Holder.Visible = Passthrough.Visible
            Groupbox:Resize()
        end

        Passthrough.Holder = Holder
        table.insert(Groupbox.Elements, Passthrough)

        Options[Idx] = Passthrough

        return Passthrough
    end

    function Funcs:AddCanvas(Idx, Info)
        if typeof(Idx) == "table" then
            Info = Idx
            Idx = Info.Idx
        end
        Info = Info or {}

        local Groupbox = self
        local Container = Groupbox.Container
        local Height = math.max(32, tonumber(Info.Height) or 160)

        local Canvas = {
            Height = Height,
            Visible = Info.Visible ~= false,
            Drawings = {},
            Type = "Canvas",
        }

        local Holder = New("Frame", {
            BackgroundColor3 = Info.BackgroundColor3 or Info.Color or "MainColor",
            BackgroundTransparency = Info.BackgroundTransparency or Info.Transparency or 0.12,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, Height),
            Visible = Canvas.Visible,
            Parent = Container,
        })
        RegisterBackgroundImageSurface(Holder, Info.BackgroundTransparency or Info.Transparency or 0.12, "Panel")
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, Info.CornerRadius or math.max(4, Library.CornerRadius)),
                Parent = Holder,
            })
        )
        if Info.Outline ~= false then
            Library:AddOutline(Holder, {
                Color = Info.StrokeColor or "OutlineColor",
                Thickness = Info.StrokeThickness or 1,
                Transparency = Info.StrokeTransparency or 0.15,
                ShadowTransparency = Info.ShadowTransparency or 1,
            })
        end
        if typeof(Info.Gradient) == "table" then
            Library:AddGradient(Holder, Info.Gradient)
        end

        local Layer = New("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1),
            Parent = Holder,
        })

        local function ResolveCanvasImage(Image)
            if tonumber(Image) then
                return string.format("rbxassetid://%s", tostring(Image))
            elseif IsHttpUrl(Image) then
                return Library:DownloadImage(Image, {
                    AssetName = "CanvasImage_" .. HashString(Image),
                    Extension = "png",
                })
            end

            return tostring(Image or "")
        end

        local function AddCorner(Drawing, Radius)
            Radius = tonumber(Radius) or 0
            if Radius > 0 then
                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, Radius),
                        Parent = Drawing,
                    })
                )
            end
        end

        local function Track(Drawing)
            table.insert(Canvas.Drawings, Drawing)
            return Drawing
        end

        function Canvas:AddFrame(DrawingInfo)
            DrawingInfo = DrawingInfo or {}
            local Drawing = New("Frame", {
                Name = DrawingInfo.Name or "CanvasFrame",
                AnchorPoint = DrawingInfo.AnchorPoint or Vector2.zero,
                BackgroundColor3 = DrawingInfo.BackgroundColor3 or DrawingInfo.Color or "AccentColor",
                BackgroundTransparency = math.clamp(
                    tonumber(DrawingInfo.BackgroundTransparency or DrawingInfo.Transparency) or 0.2,
                    0,
                    1
                ),
                BorderSizePixel = 0,
                Position = DrawingInfo.Position or UDim2.fromScale(0, 0),
                Rotation = tonumber(DrawingInfo.Rotation) or 0,
                Size = DrawingInfo.Size or UDim2.fromOffset(20, 20),
                Visible = DrawingInfo.Visible ~= false,
                ZIndex = tonumber(DrawingInfo.ZIndex) or 1,
                Parent = Layer,
            })
            AddCorner(Drawing, DrawingInfo.CornerRadius or DrawingInfo.Radius)
            if DrawingInfo.Stroke or DrawingInfo.StrokeColor or DrawingInfo.StrokeThickness then
                Library:AddOutline(Drawing, {
                    Color = DrawingInfo.StrokeColor or "OutlineColor",
                    Thickness = DrawingInfo.StrokeThickness or 1,
                    Transparency = DrawingInfo.StrokeTransparency or 0.35,
                    ShadowTransparency = 1,
                })
            end
            if typeof(DrawingInfo.Gradient) == "table" then
                Library:AddGradient(Drawing, DrawingInfo.Gradient)
            end
            return Track(Drawing)
        end

        function Canvas:AddLine(DrawingInfo)
            DrawingInfo = DrawingInfo or {}
            DrawingInfo.Size = DrawingInfo.Size or UDim2.new(1, 0, 0, DrawingInfo.Thickness or 1)
            DrawingInfo.BackgroundColor3 = DrawingInfo.BackgroundColor3 or DrawingInfo.Color or "OutlineColor"
            DrawingInfo.BackgroundTransparency = DrawingInfo.BackgroundTransparency or DrawingInfo.Transparency or 0
            return Canvas:AddFrame(DrawingInfo)
        end

        function Canvas:AddText(DrawingInfo)
            DrawingInfo = DrawingInfo or {}
            local Drawing = New("TextLabel", {
                Name = DrawingInfo.Name or "CanvasText",
                AnchorPoint = DrawingInfo.AnchorPoint or Vector2.zero,
                BackgroundTransparency = DrawingInfo.BackgroundTransparency or 1,
                Position = DrawingInfo.Position or UDim2.fromScale(0, 0),
                Rotation = tonumber(DrawingInfo.Rotation) or 0,
                Size = DrawingInfo.Size or UDim2.fromOffset(120, 18),
                Text = tostring(DrawingInfo.Text or ""),
                TextColor3 = DrawingInfo.TextColor3 or DrawingInfo.Color or "FontColor",
                TextSize = DrawingInfo.TextSize or 14,
                TextTransparency = DrawingInfo.TextTransparency or DrawingInfo.Transparency or 0,
                TextTruncate = DrawingInfo.TextTruncate or Enum.TextTruncate.AtEnd,
                TextWrapped = DrawingInfo.TextWrapped == true,
                TextXAlignment = DrawingInfo.TextXAlignment or Enum.TextXAlignment.Left,
                TextYAlignment = DrawingInfo.TextYAlignment or Enum.TextYAlignment.Center,
                Visible = DrawingInfo.Visible ~= false,
                ZIndex = tonumber(DrawingInfo.ZIndex) or 2,
                Parent = Layer,
            })
            return Track(Drawing)
        end

        function Canvas:AddImage(DrawingInfo)
            DrawingInfo = typeof(DrawingInfo) == "table" and DrawingInfo or { Image = DrawingInfo }
            local Drawing = New("ImageLabel", {
                Name = DrawingInfo.Name or "CanvasImage",
                AnchorPoint = DrawingInfo.AnchorPoint or Vector2.zero,
                BackgroundColor3 = DrawingInfo.BackgroundColor3 or "BackgroundColor",
                BackgroundTransparency = DrawingInfo.BackgroundTransparency or 1,
                BorderSizePixel = 0,
                Image = ResolveCanvasImage(DrawingInfo.Image or DrawingInfo.Texture or DrawingInfo.Url or DrawingInfo.URL),
                ImageColor3 = DrawingInfo.ImageColor3 or DrawingInfo.Color or "WhiteColor",
                ImageRectOffset = DrawingInfo.ImageRectOffset or DrawingInfo.RectOffset or Vector2.zero,
                ImageRectSize = DrawingInfo.ImageRectSize or DrawingInfo.RectSize or Vector2.zero,
                ImageTransparency = DrawingInfo.ImageTransparency or DrawingInfo.Transparency or 0,
                Position = DrawingInfo.Position or UDim2.fromScale(0, 0),
                Rotation = tonumber(DrawingInfo.Rotation) or 0,
                ScaleType = DrawingInfo.ScaleType or (DrawingInfo.TileSize and Enum.ScaleType.Tile or Enum.ScaleType.Crop),
                Size = DrawingInfo.Size or UDim2.fromOffset(44, 44),
                TileSize = DrawingInfo.TileSize,
                Visible = DrawingInfo.Visible ~= false,
                ZIndex = tonumber(DrawingInfo.ZIndex) or 1,
                Parent = Layer,
            })
            AddCorner(Drawing, DrawingInfo.CornerRadius or DrawingInfo.Radius)
            if typeof(DrawingInfo.Gradient) == "table" then
                Library:AddGradient(Drawing, DrawingInfo.Gradient)
            end
            return Track(Drawing)
        end

        function Canvas:AddGradient(Target, GradientInfo)
            local Gradient
            if typeof(Target) == "Instance" and Target:IsA("GuiObject") then
                Gradient = Library:AddGradient(Target, GradientInfo or {})
            else
                Gradient = Library:AddGradient(Layer, Target or GradientInfo or {})
            end

            return Track(Gradient)
        end

        function Canvas:Clear()
            for _, Drawing in Canvas.Drawings do
                if typeof(Drawing) == "Instance" and Drawing.Parent then
                    Drawing:Destroy()
                end
            end
            table.clear(Canvas.Drawings)
        end

        function Canvas:SetHeight(NewHeight)
            Canvas.Height = math.max(32, tonumber(NewHeight) or Canvas.Height)
            Holder.Size = UDim2.new(1, 0, 0, Canvas.Height)
            Groupbox:Resize()
        end

        function Canvas:SetVisible(Visible)
            Canvas.Visible = Visible == true
            Holder.Visible = Canvas.Visible
            Groupbox:Resize()
        end

        function Canvas:SetBackgroundTransparency(Transparency)
            Holder.BackgroundTransparency = math.clamp(tonumber(Transparency) or Holder.BackgroundTransparency, 0, 1)
        end

        Canvas.Holder = Holder
        Canvas.Layer = Layer

        for _, DrawingInfo in Info.Drawings or {} do
            if typeof(DrawingInfo) ~= "table" then
                continue
            end

            local DrawingType = tostring(DrawingInfo.Type or DrawingInfo.Kind or (DrawingInfo.Image and "Image" or "Frame"))
                :lower()
            if DrawingType == "text" or DrawingType == "label" then
                Canvas:AddText(DrawingInfo)
            elseif DrawingType == "image" or DrawingType == "texture" then
                Canvas:AddImage(DrawingInfo)
            elseif DrawingType == "line" then
                Canvas:AddLine(DrawingInfo)
            elseif DrawingType == "gradient" then
                Canvas:AddGradient(DrawingInfo)
            else
                Canvas:AddFrame(DrawingInfo)
            end
        end

        table.insert(Groupbox.Elements, Canvas)
        Groupbox:Resize()

        if Idx then
            Options[Idx] = Canvas
        end

        return Canvas
    end

    function Funcs:AddGraph(Idx, Info)
        if typeof(Idx) == "table" then
            Info = Idx
            Idx = Info.Idx
        end
        Info = Info or {}

        local LineThickness = Info.LineThickness or 3
        local PointSize = Info.PointSize or 5
        local GlowThickness = Info.GlowThickness or LineThickness + 5
        local UseGlow = Info.Glow == true
        local UseArea = Info.Area == true
        local UseSmoothing = Info.Smooth == true

        local Canvas = self:AddCanvas({
            Height = Info.Height or 150,
            BackgroundTransparency = Info.BackgroundTransparency or 0.08,
            CornerRadius = Info.CornerRadius,
            StrokeColor = Info.StrokeColor,
            StrokeTransparency = Info.StrokeTransparency,
            Gradient = Info.Gradient,
        })
        local Graph = {
            Canvas = Canvas,
            Values = typeof(Info.Values) == "table" and table.clone(Info.Values) or {},
            Type = "Graph",
        }

        local function DrawGraph()
            local Values = Graph.Values
            Canvas:Clear()

            Canvas:AddText({
                Text = Info.Title or "Graph",
                Position = UDim2.fromOffset(10, 7),
                Size = UDim2.new(1, -20, 0, 18),
                TextSize = Info.TitleSize or 14,
                TextTransparency = 0.05,
                ZIndex = 3,
            })

            local Size = Canvas.Layer.AbsoluteSize
            if Size.X <= 1 or Size.Y <= 1 then
                return
            end

            local Padding = Info.Padding or 14
            local TopPadding = Padding + 18
            local Width = math.max(1, Size.X - Padding * 2)
            local Height = math.max(1, Size.Y - TopPadding - Padding)
            local GridLines = math.max(2, Info.GridLines or 4)
            local VerticalGridLines = math.max(0, Info.VerticalGridLines or math.min(6, math.max(0, #Values - 1)))

            for Index = 0, GridLines do
                local Alpha = Index / GridLines
                Canvas:AddLine({
                    BackgroundColor3 = Info.GridColor or "OutlineColor",
                    BackgroundTransparency = Index == GridLines and (Info.BaselineTransparency or 0.34)
                        or (Info.GridTransparency or 0.76),
                    Position = UDim2.fromOffset(Padding, TopPadding + Height * Alpha),
                    Size = UDim2.fromOffset(Width, 1),
                    ZIndex = 1,
                })
            end

            if VerticalGridLines > 0 then
                for Index = 0, VerticalGridLines do
                    local Alpha = Index / VerticalGridLines
                    Canvas:AddLine({
                        BackgroundColor3 = Info.GridColor or "OutlineColor",
                        BackgroundTransparency = Info.VerticalGridTransparency or 0.88,
                        Position = UDim2.fromOffset(Padding + Width * Alpha, TopPadding),
                        Size = UDim2.fromOffset(1, Height),
                        ZIndex = 1,
                    })
                end
            end

            if #Values == 0 then
                Canvas:AddText({
                    Text = Info.EmptyText or "No graph data",
                    Position = UDim2.fromOffset(10, TopPadding + 12),
                    Size = UDim2.new(1, -20, 0, 20),
                    TextTransparency = 0.45,
                    TextXAlignment = Enum.TextXAlignment.Center,
                })
                return
            end

            local MinValue = tonumber(Info.Min)
            local MaxValue = tonumber(Info.Max)
            for _, Value in Values do
                Value = tonumber(Value) or 0
                MinValue = MinValue and math.min(MinValue, Value) or Value
                MaxValue = MaxValue and math.max(MaxValue, Value) or Value
            end
            if MinValue == MaxValue then
                MinValue -= 1
                MaxValue += 1
            end

            local PlotValues = table.clone(Values)
            if UseSmoothing and #PlotValues >= 3 then
                for Index, Value in Values do
                    local Previous = tonumber(Values[Index - 1]) or tonumber(Value) or 0
                    local Current = tonumber(Value) or 0
                    local Next = tonumber(Values[Index + 1]) or Current
                    PlotValues[Index] = (Previous + Current * 2 + Next) / 4
                end
            end

            local Points = {}
            for Index, Value in PlotValues do
                local Normalized = ((tonumber(Value) or 0) - MinValue) / (MaxValue - MinValue)
                Normalized = math.clamp(Normalized, 0, 1)
                local X = Padding + ((Index - 1) / math.max(1, #Values - 1)) * Width
                local Y = TopPadding + (1 - Normalized) * Height
                Points[Index] = Vector2.new(X, Y)
            end

            if UseArea then
                local BarWidth = math.max(3, Width / math.max(1, #Points) * 0.56)
                for _, Point in Points do
                    Canvas:AddFrame({
                        AnchorPoint = Vector2.new(0.5, 1),
                        BackgroundColor3 = Info.AreaColor or Info.LineColor or "AccentColor",
                        BackgroundTransparency = Info.AreaTransparency or 0.88,
                        CornerRadius = math.max(2, BarWidth / 2),
                        Position = UDim2.fromOffset(Point.X, TopPadding + Height),
                        Size = UDim2.fromOffset(BarWidth, math.max(1, TopPadding + Height - Point.Y)),
                        ZIndex = 2,
                    })
                end
            end

            for Index = 1, #Points - 1 do
                local From = Points[Index]
                local To = Points[Index + 1]
                local Delta = To - From
                local Length = Delta.Magnitude
                if UseGlow then
                    Canvas:AddLine({
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = Info.GlowColor or Info.LineColor or "AccentColor",
                        BackgroundTransparency = Info.GlowTransparency or 0.76,
                        CornerRadius = GlowThickness,
                        Position = UDim2.fromOffset(From.X, From.Y),
                        Rotation = math.deg(math.atan2(Delta.Y, Delta.X)),
                        Size = UDim2.fromOffset(Length, GlowThickness),
                        ZIndex = 2,
                    })
                end

                Canvas:AddLine({
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = Info.LineColor or "AccentColor",
                    BackgroundTransparency = Info.LineTransparency or 0,
                    CornerRadius = LineThickness,
                    Position = UDim2.fromOffset(From.X, From.Y),
                    Rotation = math.deg(math.atan2(Delta.Y, Delta.X)),
                    Size = UDim2.fromOffset(Length, LineThickness),
                    ZIndex = 3,
                })
            end

            for Index, Point in Points do
                if UseGlow then
                    Canvas:AddFrame({
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Info.GlowColor or Info.PointColor or "AccentColor",
                        BackgroundTransparency = Info.PointGlowTransparency or 0.72,
                        CornerRadius = 18,
                        Position = UDim2.fromOffset(Point.X, Point.Y),
                        Size = UDim2.fromOffset(PointSize + 9, PointSize + 9),
                        ZIndex = 3,
                    })
                end

                Canvas:AddFrame({
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Info.PointColor or "AccentColor",
                    BackgroundTransparency = Info.PointTransparency or 0,
                    CornerRadius = 12,
                    Position = UDim2.fromOffset(Point.X, Point.Y),
                    Size = UDim2.fromOffset(PointSize, PointSize),
                    ZIndex = 4,
                })

                -- Value label below each point when ShowValueLabels is not false.
                if Info.ShowValueLabels ~= false then
                    local RawValue = Values[Index]
                    local DisplayText = tostring(RawValue)
                    -- Format large integer values compactly, for example 1500 -> 1.5k.
                    local NumVal = tonumber(RawValue)
                    if NumVal and Info.CompactValueLabels ~= false then
                        if math.abs(NumVal) >= 1000000 then
                            DisplayText = string.format("%.1fm", NumVal / 1000000)
                        elseif math.abs(NumVal) >= 1000 then
                            DisplayText = string.format("%.1fk", NumVal / 1000)
                        end
                    end
                    -- Place below the point without overflowing the canvas bottom edge.
                    local LabelY = math.min(Point.Y + PointSize / 2 + 3, TopPadding + Height - 12)
                    Canvas:AddText({
                        Text = DisplayText,
                        AnchorPoint = Vector2.new(0.5, 0),
                        Position = UDim2.fromOffset(Point.X, LabelY),
                        Size = UDim2.fromOffset(56, 12),
                        TextSize = Info.ValueLabelSize or 10,
                        TextTransparency = Info.ValueLabelTransparency or 0.35,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        ZIndex = 5,
                    })
                end
            end
        end

        function Graph:SetValues(Values)
            Graph.Values = typeof(Values) == "table" and table.clone(Values) or {}
            DrawGraph()
        end

        function Graph:SetVisible(Visible)
            Canvas:SetVisible(Visible)
        end

        function Graph:SetHeight(Height)
            Canvas:SetHeight(Height)
            DrawGraph()
        end

        local HoverLabel = New("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromOffset(96, 18),
            Text = "",
            TextColor3 = "FontColor",
            TextSize = 12,
            TextTransparency = 1,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = 6,
            Parent = Canvas.Layer,
        })

        local HoverButton = New("TextButton", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            ZIndex = 5,
            Parent = Canvas.Layer,
        })

        local ActivePoint
        local function ClearHover()
            ActivePoint = nil
            HoverLabel.TextTransparency = 1
        end

        local function UpdateHover(PointerPosition: Vector2)
            local LayerPosition = Canvas.Layer.AbsolutePosition
            local Relative = PointerPosition - LayerPosition
            local ClosestIndex
            local ClosestDistance = math.huge
            local Values = Graph.Values
            local Padding = Info.Padding or 14
            local TopPadding = Padding + 18
            local Width = math.max(1, Canvas.Layer.AbsoluteSize.X - Padding * 2)

            for Index = 1, #Values do
                local X = Padding + ((Index - 1) / math.max(1, #Values - 1)) * Width
                local Distance = math.abs(Relative.X - X)
                if Distance < ClosestDistance then
                    ClosestDistance = Distance
                    ClosestIndex = Index
                end
            end

            local HitRadius = Library.IsMobile and 30 or 18
            if ClosestIndex and ClosestDistance <= HitRadius then
                ActivePoint = ClosestIndex
                HoverLabel.Text = tostring(Values[ClosestIndex])
                HoverLabel.TextTransparency = 0.1
                HoverLabel.Position = UDim2.fromOffset(
                    Padding + ((ClosestIndex - 1) / math.max(1, #Values - 1)) * Width,
                    TopPadding - 8
                )
            else
                ClearHover()
            end
        end

        HoverButton.MouseMoved:Connect(function()
            UpdateHover(GetPointerPosition())
        end)
        HoverButton.MouseLeave:Connect(ClearHover)
        HoverButton.InputBegan:Connect(function(Input: InputObject)
            if Input.UserInputType == Enum.UserInputType.Touch or IsClickInput(Input) then
                UpdateHover(GetPointerPosition(Input))
            end
        end)
        HoverButton.InputChanged:Connect(function(Input: InputObject)
            if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseMovement then
                UpdateHover(GetPointerPosition(Input))
            end
        end)
        HoverButton.InputEnded:Connect(function(Input: InputObject)
            if Input.UserInputType == Enum.UserInputType.Touch then
                task.delay(0.65, function()
                    if ActivePoint then
                        ClearHover()
                    end
                end)
            end
        end)

        Library:GiveSignal(Canvas.Layer:GetPropertyChangedSignal("AbsoluteSize"):Connect(DrawGraph))
        Library:GiveSignal(Canvas.Holder:GetPropertyChangedSignal("Visible"):Connect(DrawGraph))
        ScheduleCanvasRedraw(DrawGraph)

        if Idx then
            Options[Idx] = Graph
        end

        return Graph
    end

    function Funcs:AddPlayerCard(Idx, Info)
        if typeof(Idx) == "table" then
            Info = Idx
            Idx = Info.Idx
        end
        Info = Info or {}

        local Canvas = self:AddCanvas({
            Height = Info.Height or 112,
            BackgroundTransparency = Info.BackgroundTransparency or 0.1,
            CornerRadius = Info.CornerRadius,
            StrokeColor = Info.StrokeColor or "AccentColor",
            StrokeTransparency = Info.StrokeTransparency or 0.35,
        })
        local Card = {
            Canvas = Canvas,
            Player = Info.Player or LocalPlayer,
            Type = "PlayerCard",
        }

        local function GetPlayerThumbnail(Player)
            if typeof(Player) == "Instance" and Player:IsA("Player") then
                local Success, Thumbnail = pcall(function()
                    return Players:GetUserThumbnailAsync(
                        Player.UserId,
                        Enum.ThumbnailType.HeadShot,
                        Enum.ThumbnailSize.Size150x150
                    )
                end)
                if Success and Thumbnail then
                    return Thumbnail
                end
                return string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", Player.UserId)
            end

            local UserId = typeof(Player) == "table" and tonumber(Player.UserId or Player.userId) or nil
            if UserId then
                return string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", UserId)
            end

            return Info.Thumbnail or ""
        end

        local function ReadPlayerField(Player, Key, Default)
            if typeof(Player) == "Instance" and Player:IsA("Player") then
                return Player[Key] or Default
            elseif typeof(Player) == "table" then
                return Player[Key] or Player[Key:lower()] or Default
            end

            return Default
        end

        local function Refresh()
            local Player = Card.Player
            local Name = tostring(ReadPlayerField(Player, "Name", "Player"))
            local DisplayName = tostring(ReadPlayerField(Player, "DisplayName", Name))
            local UserId = tonumber(ReadPlayerField(Player, "UserId", 0)) or 0
            local AccountAge = tonumber(ReadPlayerField(Player, "AccountAge", 0)) or 0
            local Team = ReadPlayerField(Player, "Team", nil)
            local TeamName = Team and tostring(Team.Name or Team) or "No team"
            local HealthText = Info.HealthText

            if not HealthText and typeof(Player) == "Instance" and Player:IsA("Player") then
                local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    HealthText = string.format("%d/%d HP", Humanoid.Health, Humanoid.MaxHealth)
                end
            end

            Canvas:Clear()
            Canvas:AddFrame({
                BackgroundColor3 = "AccentColor",
                BackgroundTransparency = 0.9,
                Position = UDim2.fromOffset(-24, -34),
                Size = UDim2.fromOffset(130, 130),
                CornerRadius = 90,
                Gradient = {
                    Rotation = 20,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.78),
                        NumberSequenceKeypoint.new(1, 1),
                    }),
                },
            })
            Canvas:AddImage({
                Image = GetPlayerThumbnail(Player),
                Position = UDim2.fromOffset(12, 16),
                Size = UDim2.fromOffset(64, 64),
                CornerRadius = 12,
                BackgroundTransparency = 0,
                ImageTransparency = 0,
                ZIndex = 3,
            })
            local BadgeText = Info.Badge or Info.Tag or Info.Rank
            local BadgeWidth = 0
            if BadgeText ~= nil and tostring(BadgeText) ~= "" then
                BadgeText = tostring(BadgeText)
                BadgeWidth = math.clamp((#BadgeText * 7) + 22, 54, 104)
                Canvas:AddFrame({
                    BackgroundColor3 = Info.BadgeColor or "AccentColor",
                    BackgroundTransparency = Info.BadgeTransparency or 0.12,
                    Position = UDim2.new(1, -BadgeWidth - 12, 0, 14),
                    Size = UDim2.fromOffset(BadgeWidth, 20),
                    CornerRadius = 999,
                    ZIndex = 4,
                })
                Canvas:AddText({
                    Text = BadgeText,
                    Position = UDim2.new(1, -BadgeWidth - 12, 0, 14),
                    Size = UDim2.fromOffset(BadgeWidth, 20),
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    ZIndex = 5,
                })
            end
            Canvas:AddText({
                Text = DisplayName,
                Position = UDim2.fromOffset(88, 14),
                Size = UDim2.new(1, -(BadgeWidth > 0 and BadgeWidth + 112 or 100), 0, 20),
                TextSize = 16,
                ZIndex = 3,
            })
            Canvas:AddText({
                Text = "@" .. Name .. "  |  " .. tostring(UserId),
                Position = UDim2.fromOffset(88, 36),
                Size = UDim2.new(1, -112, 0, 16),
                TextSize = 13,
                TextTransparency = 0.38,
                ZIndex = 3,
            })
            Canvas:AddText({
                Text = string.format("%s   %d days%s", TeamName, AccountAge, HealthText and ("   " .. HealthText) or ""),
                Position = UDim2.fromOffset(88, 58),
                Size = UDim2.new(1, -112, 0, 16),
                TextSize = 13,
                TextTransparency = 0.2,
                ZIndex = 3,
            })
            Canvas:AddLine({
                BackgroundColor3 = "AccentColor",
                BackgroundTransparency = 0.48,
                Position = UDim2.new(0, 88, 1, -19),
                Size = UDim2.new(1, -108, 0, 1),
                ZIndex = 3,
            })
            Canvas:AddText({
                Text = tostring(Info.Footer or "Player detail card"),
                Position = UDim2.new(0, 88, 1, -17),
                Size = UDim2.new(1, -112, 0, 14),
                TextSize = 12,
                TextTransparency = 0.5,
                ZIndex = 3,
            })
        end

        function Card:SetPlayer(Player)
            Card.Player = Player
            Refresh()
        end

        function Card:Refresh()
            Refresh()
        end

        function Card:SetVisible(Visible)
            Canvas:SetVisible(Visible)
        end

        Library:GiveSignal(Canvas.Layer:GetPropertyChangedSignal("AbsoluteSize"):Connect(Refresh))
        Library:GiveSignal(Canvas.Holder:GetPropertyChangedSignal("Visible"):Connect(Refresh))
        ScheduleCanvasRedraw(Refresh)

        if Idx then
            Options[Idx] = Card
        end

        return Card
    end

    function Funcs:AddTopUserBox(Idx, Info)
        if typeof(Idx) == "table" then
            Info = Idx
            Idx = Info.Idx
        end
        Info = Info or {}

        local Users = typeof(Info.Users) == "table" and table.clone(Info.Users) or GetPlayers(false)
        local RowHeight = Info.RowHeight or 34
        local MaxUsers = Info.MaxUsers or math.min(5, #Users)
        local Canvas = self:AddCanvas({
            Height = Info.Height or (44 + RowHeight * math.max(1, MaxUsers)),
            BackgroundTransparency = Info.BackgroundTransparency or 0.1,
            CornerRadius = Info.CornerRadius,
            StrokeColor = Info.StrokeColor or "AccentColor",
            StrokeTransparency = Info.StrokeTransparency or 0.4,
        })
        local Box = {
            Canvas = Canvas,
            Users = Users,
            Type = "TopUserBox",
        }
        local RowButtons = {}

        local function ReadUser(User, Key, Default)
            if typeof(User) == "Instance" and User:IsA("Player") then
                if Key == "Score" then
                    return Default
                end
                return User[Key] or Default
            elseif typeof(User) == "table" then
                return User[Key] or User[Key:lower()] or Default
            end

            return Default
        end

        local DefaultAvatar = "rbxassetid://6031094678"

        local function UserThumbnail(User)
            local Thumbnail = ReadUser(User, "Thumbnail", nil)
            if Thumbnail and tostring(Thumbnail) ~= "" then
                return Thumbnail
            end
            local UserId = tonumber(ReadUser(User, "UserId", 0)) or 0
            if UserId > 0 then
                local Success, LoadedThumbnail = pcall(function()
                    return Players:GetUserThumbnailAsync(
                        UserId,
                        Enum.ThumbnailType.HeadShot,
                        Enum.ThumbnailSize.Size48x48
                    )
                end)
                if Success and LoadedThumbnail and LoadedThumbnail ~= "" then
                    return LoadedThumbnail
                end
                return string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", UserId)
            end
            return DefaultAvatar
        end

        local function Refresh()
            for _, RowButton in RowButtons do
                if RowButton and RowButton.Parent then
                    RowButton:Destroy()
                end
            end
            table.clear(RowButtons)

            local Sorted = table.clone(Box.Users)
            table.sort(Sorted, function(A, B)
                return (tonumber(ReadUser(A, "Score", 0)) or 0) > (tonumber(ReadUser(B, "Score", 0)) or 0)
            end)

            Canvas:Clear()
            Canvas:AddText({
                Text = Info.Title or "Top Users",
                Position = UDim2.fromOffset(10, 8),
                Size = UDim2.new(1, -20, 0, 18),
                TextSize = 15,
                ZIndex = 3,
            })
            Canvas:AddText({
                Text = Info.Subtitle or "Ranked preview list",
                Position = UDim2.fromOffset(10, 26),
                Size = UDim2.new(1, -20, 0, 15),
                TextSize = 12,
                TextTransparency = 0.5,
                ZIndex = 3,
            })

            for Index = 1, math.min(MaxUsers, #Sorted) do
                local User = Sorted[Index]
                local Y = 44 + (Index - 1) * RowHeight
                local Name = tostring(ReadUser(User, "DisplayName", ReadUser(User, "Name", "Player")))
                local Score = tonumber(ReadUser(User, "Score", Info.ScoreFallback or 0)) or 0

                Canvas:AddFrame({
                    BackgroundColor3 = Index == 1 and "AccentColor" or "MainColor",
                    BackgroundTransparency = Index == 1 and 0.82 or 0.28,
                    Position = UDim2.fromOffset(8, Y),
                    Size = UDim2.new(1, -16, 0, RowHeight - 5),
                    CornerRadius = 8,
                    ZIndex = 2,
                })
                Canvas:AddText({
                    Text = tostring(Index),
                    Position = UDim2.fromOffset(14, Y),
                    Size = UDim2.fromOffset(20, RowHeight - 5),
                    TextSize = 13,
                    TextTransparency = 0.25,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    ZIndex = 3,
                })
                Canvas:AddImage({
                    Image = UserThumbnail(User),
                    Position = UDim2.fromOffset(38, Y + 4),
                    Size = UDim2.fromOffset(RowHeight - 13, RowHeight - 13),
                    CornerRadius = 6,
                    ZIndex = 3,
                })
                Canvas:AddText({
                    Text = Name,
                    Position = UDim2.fromOffset(38 + RowHeight - 7, Y),
                    Size = UDim2.new(1, -145, 0, RowHeight - 5),
                    TextSize = 13,
                    TextTransparency = 0.08,
                    ZIndex = 3,
                })
                Canvas:AddText({
                    Text = tostring(Score),
                    Position = UDim2.new(1, -76, 0, Y),
                    Size = UDim2.fromOffset(64, RowHeight - 5),
                    TextSize = 13,
                    TextColor3 = Index == 1 and "AccentColor" or "FontColor",
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 3,
                })

                if Library.IsDesktop or Info.OnUserClick then
                    local RowButton = New("TextButton", {
                        AutoButtonColor = false,
                        BackgroundColor3 = "AccentColor",
                        BackgroundTransparency = 1,
                        Position = UDim2.fromOffset(8, Y),
                        Size = UDim2.new(1, -16, 0, RowHeight - 5),
                        Text = "",
                        ZIndex = 4,
                        Parent = Canvas.Layer,
                    })
                    table.insert(
                        Library.Corners,
                        New("UICorner", {
                            CornerRadius = UDim.new(0, 8),
                            Parent = RowButton,
                        })
                    )
                    if Library.IsDesktop then
                        RowButton.MouseEnter:Connect(function()
                            TweenService:Create(RowButton, Library.TweenInfo, {
                                BackgroundTransparency = 0.88,
                            }):Play()
                        end)
                        RowButton.MouseLeave:Connect(function()
                            TweenService:Create(RowButton, Library.TweenInfo, {
                                BackgroundTransparency = 1,
                            }):Play()
                        end)
                    end
                    if Info.OnUserClick then
                        RowButton.Activated:Connect(function()
                            Library:SafeCallback(Info.OnUserClick, User, Index)
                        end)
                    end
                    table.insert(RowButtons, RowButton)
                end
            end
        end

        function Box:SetUsers(NewUsers)
            Box.Users = typeof(NewUsers) == "table" and table.clone(NewUsers) or {}
            Refresh()
        end

        function Box:Refresh()
            Refresh()
        end

        function Box:SetVisible(Visible)
            Canvas:SetVisible(Visible)
        end

        Library:GiveSignal(Canvas.Layer:GetPropertyChangedSignal("AbsoluteSize"):Connect(Refresh))
        Library:GiveSignal(Canvas.Holder:GetPropertyChangedSignal("Visible"):Connect(Refresh))
        ScheduleCanvasRedraw(Refresh)

        if Idx then
            Options[Idx] = Box
        end

        return Box
    end

    function Funcs:AddTabbox(...)
        local Params = select(1, ...)
        local Info = if typeof(Params) == "table" then Params else { Name = Params }

        local Groupbox = self
        local Container = Groupbox.Container
        local CornerRadius = math.max(3, math.floor(Library.CornerRadius * 0.65))
        local ButtonCornerRadius = 0

        Groupbox.Tabboxes = Groupbox.Tabboxes or {}

        local TabboxHolder = New("Frame", {
            BackgroundColor3 = "BackgroundColor",
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 0),
            Visible = Info.Visible ~= false,
            Parent = Container,
        })
        RegisterBackgroundImageSurface(TabboxHolder, 0, "Panel")
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, CornerRadius),
                Parent = TabboxHolder,
            })
        )
        Library:AddOutline(TabboxHolder, {
            Rainbow = Info.RainbowBorder,
            RainbowTarget = "Tabboxes",
        })

        local TabboxButtons = New("Frame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 0, 34),
            Parent = TabboxHolder,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Parent = TabboxButtons,
        })

        local TotalButtons, TotalTabs = 0, 1
        local Tabbox = {
            ActiveTab = nil,
            BoxHolder = TabboxHolder,
            Holder = TabboxHolder,
            Tabs = {},
            Text = Info.Name,
            Type = "Tabbox",
            Visible = Info.Visible ~= false,
        }

        function Tabbox:Resize()
            if Tabbox.ActiveTab then
                Tabbox.ActiveTab:Resize()
            else
                TabboxHolder.Size = UDim2.new(1, 0, 0, 34)
                Groupbox:Resize()
            end
        end

        function Tabbox:SetVisible(Visible: boolean)
            Tabbox.Visible = Visible
            TabboxHolder.Visible = Visible
            Groupbox:Resize()
        end

        function Tabbox:UpdateCorners()
            for _, Tab in Tabbox.Tabs do
                Tab:UpdateCorners()
            end
        end

        function Tabbox:AddTab(Name, IconName)
            local TabIndex = TotalTabs

            TotalButtons += 1
            TotalTabs += 1

            local BoxIcon = Library:GetCustomIcon(IconName)

            local Button = New("TextButton", {
                BackgroundColor3 = "MainColor",
                BackgroundTransparency = 0,
                Size = UDim2.fromOffset(0, 34),
                Text = "",
                Parent = TabboxButtons,
            })

            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, ButtonCornerRadius),
                    Parent = Button,
                })
            )

            local BottomCover = New("Frame", {
                Name = "BottomCover",
                BackgroundColor3 = "MainColor",
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, -ButtonCornerRadius),
                Size = UDim2.new(1, 0, 0, ButtonCornerRadius),
                Visible = false,
                Parent = Button,
            })

            local LeftCover = New("Frame", {
                Name = "LeftCover",
                BackgroundColor3 = "MainColor",
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(0, ButtonCornerRadius, 1, 0),
                Visible = false,
                Parent = Button,
            })

            local RightCover = New("Frame", {
                Name = "RightCover",
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = "MainColor",
                BorderSizePixel = 0,
                Position = UDim2.new(1, 0, 0, 0),
                Size = UDim2.new(0, ButtonCornerRadius, 1, 0),
                Visible = false,
                Parent = Button,
            })

            local ButtonContent = New("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, -12, 0, 16),
                Parent = Button,
            })

            local ButtonIcon
            if BoxIcon then
                ButtonIcon = New("ImageLabel", {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Image = BoxIcon.Url,
                    ImageColor3 = BoxIcon.Custom and "WhiteColor" or "AccentColor",
                    ImageRectOffset = BoxIcon.ImageRectOffset,
                    ImageRectSize = BoxIcon.ImageRectSize,
                    ImageTransparency = 0.5,
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromOffset(16, 16),
                    Parent = ButtonContent,
                })
            end

            local ButtonLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Position = BoxIcon and UDim2.fromOffset(24, 0) or UDim2.fromOffset(0, 0),
                Size = BoxIcon and UDim2.new(1, -24, 1, 0) or UDim2.fromScale(1, 1),
                Text = Name,
                TextSize = 15,
                TextTransparency = 0.5,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = BoxIcon and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
                Parent = ButtonContent,
            })

            local Line = Library:MakeLine(Button, {
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.new(0, 0, 1, 1),
                Size = UDim2.new(1, 0, 0, 1),
            })

            local TabContainer = New("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(0, 35),
                Size = UDim2.new(1, 0, 1, -35),
                Visible = false,
                Parent = TabboxHolder,
            })
            local List = New("UIListLayout", {
                Padding = UDim.new(0, 8),
                Parent = TabContainer,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 7),
                PaddingLeft = UDim.new(0, 7),
                PaddingRight = UDim.new(0, 7),
                PaddingTop = UDim.new(0, 7),
                Parent = TabContainer,
            })

            local Tab = {
                ButtonHolder = Button,
                Container = TabContainer,

                ButtonCovers = {
                    BottomCover = BottomCover,
                    LeftCover = LeftCover,
                    RightCover = RightCover,
                },

                Tab = Groupbox.Tab,
                Elements = {},
                DependencyBoxes = {},
                Tabboxes = {},
            }

            function Tab:Show()
                if Tabbox.ActiveTab then
                    Tabbox.ActiveTab:Hide()
                end

                Button.BackgroundTransparency = 1
                BottomCover.BackgroundTransparency = 1
                LeftCover.BackgroundTransparency = 1
                RightCover.BackgroundTransparency = 1

                ButtonLabel.TextTransparency = 0
                if ButtonIcon then
                    ButtonIcon.ImageTransparency = 0
                end
                Line.Visible = false

                TabContainer.Visible = true

                Tabbox.ActiveTab = Tab
                Tab:Resize()
            end

            function Tab:Hide()
                Button.BackgroundTransparency = 0
                BottomCover.BackgroundTransparency = 0
                LeftCover.BackgroundTransparency = 0
                RightCover.BackgroundTransparency = 0

                ButtonLabel.TextTransparency = 0.5
                if ButtonIcon then
                    ButtonIcon.ImageTransparency = 0.5
                end
                Line.Visible = true
                TabContainer.Visible = false

                Tabbox.ActiveTab = nil
            end

            function Tab:Resize()
                if Tabbox.ActiveTab ~= Tab then
                    return
                end

                TabboxHolder.Size = UDim2.new(1, 0, 0, (List.AbsoluteContentSize.Y / Library.DPIScale) + 49)
                Groupbox:Resize()
            end

            function Tab:UpdateCorners()
                BottomCover.Visible = false
                LeftCover.Visible = false
                RightCover.Visible = false

                BottomCover.Position = UDim2.new(0, 0, 1, -ButtonCornerRadius)
                BottomCover.Size = UDim2.new(1, 0, 0, ButtonCornerRadius)

                LeftCover.Size = UDim2.new(0, ButtonCornerRadius, 1, 0)
                RightCover.Size = UDim2.new(0, ButtonCornerRadius, 1, 0)
            end

            if not Tabbox.ActiveTab then
                Tab:Show()
            end

            Button.MouseButton1Click:Connect(Tab.Show)

            setmetatable(Tab, BaseGroupbox)

            Tabbox.Tabs[Name] = Tab
            Tabbox:UpdateCorners()

            return Tab
        end

        Tabbox:Resize()
        table.insert(Groupbox.Elements, Tabbox)

        if Info.Name then
            Groupbox.Tabboxes[Info.Name] = Tabbox
        else
            table.insert(Groupbox.Tabboxes, Tabbox)
        end

        return Tabbox
    end

    function Funcs:AddDependencyBox()
        local Groupbox = self
        local Container = Groupbox.Container

        local DepboxContainer
        local DepboxList

        do
            DepboxContainer = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Visible = false,
                Parent = Container,
            })

            DepboxList = New("UIListLayout", {
                Padding = UDim.new(0, 8),
                Parent = DepboxContainer,
            })
        end

        local Depbox = {
            Visible = false,
            Dependencies = {},

            Holder = DepboxContainer,
            Container = DepboxContainer,

            Elements = {},
            DependencyBoxes = {},
            Tabboxes = {},
        }

        function Depbox:Resize()
            DepboxContainer.Size = UDim2.new(1, 0, 0, DepboxList.AbsoluteContentSize.Y / Library.DPIScale)
            Groupbox:Resize()
        end

        function Depbox:Update(CancelSearch)
            for _, Dependency in Depbox.Dependencies do
                local Element = Dependency[1]
                local Value = Dependency[2]

                if Element.Type == "Toggle" and Element.Value ~= Value then
                    DepboxContainer.Visible = false
                    Depbox.Visible = false
                    return
                elseif Element.Type == "Dropdown" then
                    if typeof(Element.Value) == "table" then
                        if not Element.Value[Value] then
                            DepboxContainer.Visible = false
                            Depbox.Visible = false
                            return
                        end
                    else
                        if Element.Value ~= Value then
                            DepboxContainer.Visible = false
                            Depbox.Visible = false
                            return
                        end
                    end
                end
            end

            Depbox.Visible = true
            DepboxContainer.Visible = true
            if not Library.Searching then
                task.defer(function()
                    Depbox:Resize()
                end)
            elseif not CancelSearch then
                Library:UpdateSearch(Library.SearchText)
            end
        end

        DepboxList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not Depbox.Visible then
                return
            end

            Depbox:Resize()
        end)

        function Depbox:SetupDependencies(Dependencies)
            for _, Dependency in Dependencies do
                assert(typeof(Dependency) == "table", "Dependency should be a table.")
                assert(Dependency[1] ~= nil, "Dependency is missing element.")
                assert(Dependency[2] ~= nil, "Dependency is missing expected value.")
            end

            Depbox.Dependencies = Dependencies
            Depbox:Update()
        end

        DepboxContainer:GetPropertyChangedSignal("Visible"):Connect(function()
            Depbox:Resize()
        end)

        setmetatable(Depbox, BaseGroupbox)

        table.insert(Groupbox.DependencyBoxes, Depbox)
        table.insert(Library.DependencyBoxes, Depbox)

        return Depbox
    end

    function Funcs:AddDependencyGroupbox()
        local Groupbox = self
        local Tab = Groupbox.Tab
        local BoxHolder = Groupbox.BoxHolder

        local DepGroupboxContainer
        local DepGroupboxContent
        local DepGroupboxList
        local CollapseArrow
        local HeaderButton
        local HeaderLine

        do
            DepGroupboxContainer = New("Frame", {
                BackgroundColor3 = "BackgroundColor",
                Size = UDim2.fromScale(1, 0),
                Visible = false,
                Parent = BoxHolder,
            })
            RegisterBackgroundImageSurface(DepGroupboxContainer, 0, "Panel")
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius),
                    Parent = DepGroupboxContainer,
                })
            )
            Library:AddOutline(DepGroupboxContainer, {
                RainbowTarget = "DependencyGroupboxes",
            })

            HeaderButton = New("TextButton", {
                AutoButtonColor = false,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 24),
                Text = "",
                Parent = DepGroupboxContainer,
            })

            CollapseArrow = New("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundTransparency = 1,
                Image = ArrowIcon and ArrowIcon.Url or "",
                ImageColor3 = "FontColor",
                ImageRectOffset = ArrowIcon and ArrowIcon.ImageRectOffset or Vector2.zero,
                ImageRectSize = ArrowIcon and ArrowIcon.ImageRectSize or Vector2.zero,
                ImageTransparency = 0.55,
                Position = UDim2.new(1, -8, 0.5, 0),
                Size = UDim2.fromOffset(14, 14),
                Parent = HeaderButton,
            })

            HeaderLine = Library:MakeLine(DepGroupboxContainer, {
                Position = UDim2.fromOffset(0, 24),
                Size = UDim2.new(1, 0, 0, 1),
            })

            DepGroupboxContent = New("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(0, 25),
                Size = UDim2.new(1, 0, 1, -25),
                Parent = DepGroupboxContainer,
            })

            DepGroupboxList = New("UIListLayout", {
                Padding = UDim.new(0, 8),
                Parent = DepGroupboxContent,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 7),
                PaddingLeft = UDim.new(0, 7),
                PaddingRight = UDim.new(0, 7),
                PaddingTop = UDim.new(0, 7),
                Parent = DepGroupboxContent,
            })
        end

        local DepGroupbox = {
            Visible = false,
            Dependencies = {},

            BoxHolder = BoxHolder,
            Holder = DepGroupboxContainer,
            Container = DepGroupboxContent,

            Tab = Tab,
            Elements = {},
            DependencyBoxes = {},
            Tabboxes = {},
            Collapsed = false,
            SearchExpanded = false,
        }

        function DepGroupbox:Resize()
            local IsCollapsed = DepGroupbox.Collapsed and not DepGroupbox.SearchExpanded

            DepGroupboxContent.Visible = not IsCollapsed
            HeaderLine.Visible = not IsCollapsed
            CollapseArrow.Rotation = IsCollapsed and 180 or 0
            CollapseArrow.ImageTransparency = IsCollapsed and 0.65 or 0.55

            if IsCollapsed then
                DepGroupboxContainer.Size = UDim2.new(1, 0, 0, 25)
            else
                DepGroupboxContainer.Size =
                    UDim2.new(1, 0, 0, (DepGroupboxList.AbsoluteContentSize.Y / Library.DPIScale) + 39)
            end

            if Tab and typeof(Tab.RefreshSides) == "function" then
                Tab:RefreshSides()
            elseif typeof(Groupbox.Resize) == "function" then
                Groupbox:Resize()
            end
        end

        function DepGroupbox:SetCollapsed(Collapsed: boolean)
            DepGroupbox.Collapsed = Collapsed == true
            DepGroupbox:Resize()
        end

        function DepGroupbox:ToggleCollapsed()
            DepGroupbox:SetCollapsed(not DepGroupbox.Collapsed)
        end

        function DepGroupbox:Update(CancelSearch)
            for _, Dependency in DepGroupbox.Dependencies do
                local Element = Dependency[1]
                local Value = Dependency[2]

                if Element.Type == "Toggle" and Element.Value ~= Value then
                    DepGroupboxContainer.Visible = false
                    DepGroupbox.Visible = false
                    return
                elseif Element.Type == "Dropdown" then
                    if typeof(Element.Value) == "table" then
                        if not Element.Value[Value] then
                            DepGroupboxContainer.Visible = false
                            DepGroupbox.Visible = false
                            return
                        end
                    else
                        if Element.Value ~= Value then
                            DepGroupboxContainer.Visible = false
                            DepGroupbox.Visible = false
                            return
                        end
                    end
                end
            end

            DepGroupbox.Visible = true
            if not Library.Searching then
                DepGroupboxContainer.Visible = true
                DepGroupbox:Resize()
            elseif not CancelSearch then
                Library:UpdateSearch(Library.SearchText)
            end
        end

        function DepGroupbox:SetupDependencies(Dependencies)
            for _, Dependency in Dependencies do
                assert(typeof(Dependency) == "table", "Dependency should be a table.")
                assert(Dependency[1] ~= nil, "Dependency is missing element.")
                assert(Dependency[2] ~= nil, "Dependency is missing expected value.")
            end

            DepGroupbox.Dependencies = Dependencies
            DepGroupbox:Update()
        end

        HeaderButton.MouseButton1Click:Connect(function()
            DepGroupbox:ToggleCollapsed()
        end)

        setmetatable(DepGroupbox, BaseGroupbox)

        table.insert(Tab.DependencyGroupboxes, DepGroupbox)
        table.insert(Library.DependencyBoxes, DepGroupbox)

        return DepGroupbox
    end

    BaseGroupbox.__index = Funcs
    BaseGroupbox.__namecall = function(_, Key, ...)
        return Funcs[Key](...)
    end
end

function Library:ApplyNewElements(Target)
    -- New elements are installed into every groupbox/tab through the base groupbox API.
    -- This helper exists for scripts that want an explicit opt-in call before using them.
    return Target or Library
end

Library.ApplyNewElments = Library.ApplyNewElements
Library.ApplyNewElement = Library.ApplyNewElements
Library.applynewelments = Library.ApplyNewElements
Library.applynewelements = Library.ApplyNewElements

function Library:SetFont(FontFace)
    if typeof(FontFace) == "table" and FontFace.Type == "CustomFont" then
        return Library:SetCustomFont(FontFace)
    end

    if typeof(FontFace) == "EnumItem" then
        FontFace = Font.fromEnum(FontFace)
    end

    Library.Scheme.Font = FontFace
    Library:UpdateColorsUsingRegistry()
end

function Library:SetNotifySide(Side: string)
    Library.NotifySide = Side

    if Side:lower() == "left" then
        NotificationArea.AnchorPoint = Vector2.new(0, 0)
        NotificationArea.Position = UDim2.fromOffset(6, 6)
        NotificationList.HorizontalAlignment = Enum.HorizontalAlignment.Left
    else
        NotificationArea.AnchorPoint = Vector2.new(1, 0)
        NotificationArea.Position = UDim2.new(1, -6, 0, 6)
        NotificationList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    end
end

local NotificationVariants = {
    Info = {
        Icon = "info",
        BigIcon = "info",
        Color = Color3.fromRGB(59, 130, 246),
    },
    Success = {
        Icon = "circle-check",
        BigIcon = "circle-check",
        Color = Color3.fromRGB(34, 197, 94),
    },
    Warning = {
        Icon = "triangle-alert",
        BigIcon = "triangle-alert",
        Color = Color3.fromRGB(245, 158, 11),
    },
    Error = {
        Icon = "circle-x",
        BigIcon = "circle-x",
        Color = Color3.fromRGB(239, 68, 68),
    },
}

local function ApplyNotificationVariant(Data)
    local RawVariant = tostring(Data.Type or Data.Variant or ""):lower()
    local VariantName = RawVariant:sub(1, 1):upper() .. RawVariant:sub(2)
    local Variant = NotificationVariants[VariantName]
    if not Variant then
        return
    end

    Data.Type = VariantName
    Data.Title = Data.Title or VariantName
    Data.Icon = Data.Icon or Variant.Icon
    Data.BigIcon = Data.BigIcon or Variant.BigIcon
    Data.IconColor = Data.IconColor or Variant.Color
    Data.AccentColor = Data.AccentColor or Variant.Color
end

local function NormalizeNotificationData(...)
    local Data = {}
    local Info = select(1, ...)

    if typeof(Info) == "table" then
        Data.Title = Info.Title and tostring(Info.Title) or nil
        Data.Description = Info.Description and tostring(Info.Description) or nil
        Data.Time = Info.Time or 5
        Data.SoundId = Info.SoundId
        Data.Steps = Info.Steps
        Data.Persist = Info.Persist
        Data.Icon = Info.Icon
        Data.BigIcon = Info.BigIcon
        Data.IconColor = Info.IconColor
        Data.AccentColor = Info.AccentColor
        Data.Type = Info.Type
        Data.Variant = Info.Variant
        Data.Progress = Info.Progress
        Data.Actions = Info.Actions
        Data.CloseButton = Info.CloseButton
        Data.Dismissible = Info.Dismissible
    else
        Data.Title = "Notification"
        Data.Description = tostring(Info)
        Data.Time = select(2, ...) or 5
        Data.SoundId = select(3, ...)
    end

    ApplyNotificationVariant(Data)
    Data.Title = Data.Title or "Notification"
    Data.Destroyed = false
    return Data
end

function Library:Notify(...)
    local Data = NormalizeNotificationData(...)

    local DeletedInstance = false
    local DeleteConnection = nil
    if typeof(Data.Time) == "Instance" then
        DeleteConnection = Data.Time.Destroying:Connect(function()
            DeletedInstance = true

            DeleteConnection:Disconnect()
            DeleteConnection = nil
        end)
    end

    local FakeBackground = New("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        Visible = false,
        Parent = NotificationArea,
    })

    local Holder = New("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = "MainColor",
        Position = Library.NotifySide:lower() == "left" and UDim2.new(-1, -8, 0, -2) or UDim2.new(1, 8, 0, -2),
        Size = UDim2.fromScale(1, 1),
        ZIndex = 5,
        Parent = FakeBackground,
    })
    table.insert(
        Library.Corners,
        New("UICorner", {
            CornerRadius = UDim.new(0, Library.CornerRadius),
            Parent = Holder,
        })
    )
    New("UIListLayout", {
        Padding = UDim.new(0, 4),
        Parent = Holder,
    })
    New("UIPadding", {
        PaddingBottom = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8),
        Parent = Holder,
    })
    Library:AddOutline(Holder)

    local ContentContainer = New("Frame", {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(1, 0),
        Parent = Holder,
    })

    local CloseButton
    if Data.CloseButton ~= false and Data.Dismissible ~= false then
        CloseButton = New("TextButton", {
            AnchorPoint = Vector2.new(1, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(1, 2, 0, -3),
            Size = UDim2.fromOffset(18, 18),
            Text = "×",
            TextSize = 16,
            TextTransparency = 0.25,
            ZIndex = 6,
            Parent = Holder,
        })

        Library:GiveSignal(CloseButton.MouseEnter:Connect(function()
            TweenService:Create(CloseButton, Library.TweenInfo, {
                TextTransparency = 0,
            }):Play()
        end))
        Library:GiveSignal(CloseButton.MouseLeave:Connect(function()
            TweenService:Create(CloseButton, Library.TweenInfo, {
                TextTransparency = 0.25,
            }):Play()
        end))
        Library:GiveSignal(CloseButton.MouseButton1Click:Connect(function()
            if not Data.Destroyed then
                Data:Destroy()
            end
        end))
    end

    if Data.BigIcon then
        New("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Parent = ContentContainer,
        })
    end

    local BigIconLabel
    if Data.BigIcon then
        local ParsedIcon = Library:GetCustomIcon(Data.BigIcon)
        if ParsedIcon then
            BigIconLabel = New("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(24, 24),
                Image = ParsedIcon.Url,
                ImageColor3 = Data.IconColor or "AccentColor",
                ImageRectOffset = ParsedIcon.ImageRectOffset,
                ImageRectSize = ParsedIcon.ImageRectSize,
                Parent = ContentContainer,
            })
        end
    end

    local TextContainer = New("Frame", {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 0),
        Parent = ContentContainer,
    })
    New("UIListLayout", {
        Padding = UDim.new(0, 4),
        Parent = TextContainer,
    })

    local TitleContainer
    if Data.Title then
        TitleContainer = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 0),
            Parent = TextContainer,
        })
    end

    local IconLabel
    if Data.Icon and TitleContainer then
        local ParsedIcon = Library:GetCustomIcon(Data.Icon)
        if ParsedIcon then
            IconLabel = New("ImageLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 0, 0.5, 1),
                Size = UDim2.fromOffset(15, 15),
                Image = ParsedIcon.Url,
                ImageColor3 = Data.IconColor or "FontColor",
                ImageRectOffset = ParsedIcon.ImageRectOffset,
                ImageRectSize = ParsedIcon.ImageRectSize,
                Parent = TitleContainer,
            })
        end
    end

    local Title
    local Desc
    local TitleX = 0
    local DescX = 0

    local TimerFill

    if Data.Title then
        Title = New("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, (Data.Icon and 21 or 0), 0.5, 0),
            Size = UDim2.fromScale(0, 0),
            Text = Data.Title,
            TextSize = 15,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextWrapped = false,
            Parent = TitleContainer,
        })
    end

    if Data.Description then
        Desc = New("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 0),
            Text = Data.Description,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Parent = TextContainer,
        })
    end

    local ActionContainer
    if typeof(Data.Actions) == "table" and #Data.Actions > 0 then
        ActionContainer = New("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            Parent = Holder,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0, 6),
            Parent = ActionContainer,
        })

        for _, Action in ipairs(Data.Actions) do
            if typeof(Action) ~= "table" then
                continue
            end

            local Button = New("TextButton", {
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Action.Risky and "DestructiveColor" or "BackgroundColor",
                Size = UDim2.fromOffset(0, 24),
                Text = tostring(Action.Text or "Action"),
                TextSize = 13,
                Parent = ActionContainer,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                Parent = Button,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, math.max(2, Library.CornerRadius - 1)),
                    Parent = Button,
                })
            )
            Library:AddOutline(Button)

            Library:GiveSignal(Button.MouseButton1Click:Connect(function()
                Library:SafeCallback(Action.Callback or Action.Func, Data)

                if Action.CloseOnClick ~= false and not Data.Destroyed then
                    Data:Destroy()
                end
            end))
        end
    end

    function Data:Resize()
        local ExtraWidth = BigIconLabel and 32 or 0
        local IconWidth = IconLabel and 21 or 0
        local CloseWidth = CloseButton and 18 or 0
        local MaxTextWidth =
            math.max(48, (NotificationArea.AbsoluteSize.X / Library.DPIScale) - 24 - ExtraWidth - CloseWidth)
        local MaxTitleWidth = math.max(48, MaxTextWidth - IconWidth)

        if Title then
            local X, Y = Library:GetTextBounds(Title.Text, Title.FontFace, Title.TextSize, MaxTitleWidth)
            X = math.min(X, MaxTitleWidth)
            Title.Size = UDim2.fromOffset(X, math.max(Y, 18))
            TitleX = X + IconWidth
            TitleContainer.Size = UDim2.fromOffset(TitleX, math.max(Y, IconLabel and 16 or 0, 18))
        end

        if Desc then
            local X, Y = Library:GetTextBounds(Desc.Text, Desc.FontFace, Desc.TextSize, MaxTextWidth)
            Desc.Size = UDim2.fromOffset(X, Y)
            DescX = X
        end

        FakeBackground.Size = UDim2.fromOffset(math.max(TitleX, DescX) + 24 + ExtraWidth + CloseWidth, 0)
    end

    function Data:ChangeTitle(Text)
        if Title then
            Data.Title = tostring(Text)
            Title.Text = Data.Title
            Data:Resize()
        end
    end

    function Data:ChangeDescription(Text)
        if Desc then
            Data.Description = tostring(Text)
            Desc.Text = Data.Description
            Data:Resize()
        end
    end

    function Data:ChangeStep(NewStep)
        if TimerFill and Data.Steps then
            NewStep = math.clamp(NewStep or 0, 0, Data.Steps)
            TimerFill.Size = UDim2.fromScale(NewStep / Data.Steps, 1)
        end
    end

    function Data:SetProgress(Progress)
        if TimerFill then
            Data.Progress = math.clamp(Progress or 0, 0, 1)
            TimerFill.Size = UDim2.fromScale(Data.Progress, 1)
        end
    end

    function Data:Destroy()
        Data.Destroyed = true

        if typeof(Data.Time) == "Instance" then
            pcall(Data.Time.Destroy, Data.Time)
        end

        if DeleteConnection then
            DeleteConnection:Disconnect()
        end

        TweenService
            :Create(Holder, Library.NotifyTweenInfo, {
                Position = Library.NotifySide:lower() == "left" and UDim2.new(-1, -8, 0, -2) or UDim2.new(1, 8, 0, -2),
            })
            :Play()

        task.delay(Library.NotifyTweenInfo.Time, function()
            Library.Notifications[FakeBackground] = nil
            FakeBackground:Destroy()
        end)
    end

    Data:Resize()

    local TimerHolder = New("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 7),
        Visible = (Data.Persist ~= true and typeof(Data.Time) ~= "Instance")
            or typeof(Data.Steps) == "number"
            or typeof(Data.Progress) == "number",
        Parent = Holder,
    })
    local TimerBar = New("Frame", {
        BackgroundColor3 = "BackgroundColor",
        BorderColor3 = "OutlineColor",
        BorderSizePixel = 1,
        Position = UDim2.fromOffset(0, 3),
        Size = UDim2.new(1, 0, 0, 2),
        Parent = TimerHolder,
    })
    TimerFill = New("Frame", {
        BackgroundColor3 = Data.AccentColor or "AccentColor",
        Size = UDim2.fromScale(1, 1),
        Parent = TimerBar,
    })

    if typeof(Data.Progress) == "number" then
        Data:SetProgress(Data.Progress)
    elseif typeof(Data.Time) == "Instance" then
        TimerFill.Size = UDim2.fromScale(0, 1)
    end
    if Data.SoundId then
        local SoundId = Data.SoundId
        if typeof(SoundId) == "number" then
            SoundId = string.format("rbxassetid://%d", SoundId)
        end

        New("Sound", {
            SoundId = SoundId,
            Volume = 3,
            PlayOnRemove = true,
            Parent = SoundService,
        }):Destroy()
    end

    Library.Notifications[FakeBackground] = Data

    FakeBackground.Visible = true
    TweenService:Create(Holder, Library.NotifyTweenInfo, {
        Position = UDim2.fromOffset(0, 0),
    }):Play()

    task.delay(Library.NotifyTweenInfo.Time, function()
        if Data.Persist then
            return
        elseif typeof(Data.Time) == "Instance" then
            repeat
                task.wait()
            until DeletedInstance or Data.Destroyed
        else
            TweenService
                :Create(TimerFill, TweenInfo.new(Data.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    Size = UDim2.fromScale(0, 1),
                })
                :Play()
            task.wait(Data.Time)
        end

        if not Data.Destroyed then
            Data:Destroy()
        end
    end)

    return Data
end

function Library:NotifyInfo(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Info"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Info",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifySuccess(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Success"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Success",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyWarning(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Warning"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Warning",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyError(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Error"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Error",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyInfo(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Info"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Info",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifySuccess(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Success"
        return Library:Notify(Info)
    end

    return Data
end

function Library:NotifyInfo(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Info"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Info",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifySuccess(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Success"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Success",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyWarning(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Warning"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Warning",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyError(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Error"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Error",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyInfo(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Info"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Info",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifySuccess(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Success"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Success",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyWarning(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Warning"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Warning",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

function Library:NotifyError(Info, Time, SoundId)
    if typeof(Info) == "table" then
        Info.Type = Info.Type or "Error"
        return Library:Notify(Info)
    end

    return Library:Notify({
        Type = "Error",
        Description = tostring(Info),
        Time = Time,
        SoundId = SoundId,
    })
end

local PopupVariants = {
    Info = {
        Icon = "info",
        Color = Color3.fromRGB(59, 130, 246),
    },
    Success = {
        Icon = "circle-check",
        Color = Color3.fromRGB(34, 197, 94),
    },
    Warning = {
        Icon = "triangle-alert",
        Color = Color3.fromRGB(245, 158, 11),
    },
    Error = {
        Icon = "circle-x",
        Color = Color3.fromRGB(239, 68, 68),
    },
}

local function ApplyPopupVariant(Data)
    local RawVariant = tostring(Data.Type or Data.Variant or ""):lower()
    local VariantName = RawVariant:sub(1, 1):upper() .. RawVariant:sub(2)
    local Variant = PopupVariants[VariantName]
    if not Variant then
        return
    end

    Data.Type = VariantName
    Data.Title = Data.Title or VariantName
    Data.Icon = Data.Icon or Variant.Icon
    Data.AccentColor = Data.AccentColor or Variant.Color
    Data.IconColor = Data.IconColor or Variant.Color
end

function Library:CreatePopup(Info, Time)
    if typeof(Info) ~= "table" then
        Info = {
            Description = tostring(Info or ""),
            Time = Time,
        }
    else
        Info = table.clone(Info)
        if Time ~= nil then
            Info.Time = Time
        end
    end

    Info = Library:Validate(Info, Templates.Popup)
    ApplyPopupVariant(Info)

    Library.PopupCounter += 1
    local PopupId = tostring(Info.Id or ("Popup_" .. Library.PopupCounter))
    local ViewportWidth = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X or 800
    local MaxWidth = math.max(260, math.min(tonumber(Info.MaxWidth) or 460, ViewportWidth - 32))
    local Width = math.clamp(tonumber(Info.Width) or 360, 260, MaxWidth)
    local Accent = Info.AccentColor or "AccentColor"
    local AccentColor = typeof(Accent) == "Color3" and Accent or Library.Scheme[Accent] or Library.Scheme.AccentColor

    local Popup = {
        Id = PopupId,
        Destroyed = false,
    }

    local PopupGui = New("ScreenGui", {
        Name = "ObsidianPopup",
        DisplayOrder = 1001,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
    })
    ParentUI(PopupGui)

    local PopupParent = PopupGui
    local Overlay
    if Info.ShowOverlay or Info.Modal then
        Overlay = New("TextButton", {
            AutoButtonColor = false,
            BackgroundColor3 = "DarkColor",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            Parent = PopupGui,
        })
        PopupParent = Overlay
        TweenService:Create(Overlay, Library.TweenInfo, {
            BackgroundTransparency = math.clamp(tonumber(Info.OverlayTransparency) or 0.74, 0, 1),
        }):Play()
    end

    local Card = New("Frame", {
        Active = true,
        AnchorPoint = Info.AnchorPoint or Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = function()
            return Library:GetBetterColor(Library.Scheme.BackgroundColor, 1)
        end,
        ClipsDescendants = true,
        Position = Info.Position or UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(Width, 0),
        ZIndex = 10000,
        Parent = PopupParent,
    })
    table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius + 2), Parent = Card }))
    Library:AddOutline(Card, {
        Color = Info.OutlineColor or "OutlineColor",
        Transparency = 0.05,
        ShadowTransparency = 0.28,
        Rainbow = Info.RainbowBorder,
        RainbowTarget = "Popups",
    })

    local CardScale = New("UIScale", {
        Scale = 0.96,
        Parent = Card,
    })
    TweenService:Create(CardScale, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Scale = 1,
    }):Play()

    local TopGlow = New("Frame", {
        BackgroundColor3 = Accent,
        BackgroundTransparency = 0.84,
        BorderSizePixel = 0,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, 32),
        ZIndex = 10001,
        Parent = Card,
    })
    Library:AddGradient(TopGlow, {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.65),
            NumberSequenceKeypoint.new(1, 1),
        }),
    })

    local Content = New("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        ZIndex = 10002,
        Parent = Card,
    })
    New("UIListLayout", {
        Padding = UDim.new(0, 9),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = Content,
    })
    New("UIPadding", {
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 12),
        Parent = Content,
    })

    local Header = New("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 24),
        ZIndex = 10002,
        Parent = Content,
    })
    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = Header,
    })

    local ParsedIcon = Info.Icon and Library:GetCustomIcon(Info.Icon)
    local IconLabel
    if ParsedIcon then
        IconLabel = New("ImageLabel", {
            BackgroundTransparency = 1,
            Image = ParsedIcon.Url,
            ImageColor3 = Info.IconColor or Accent,
            ImageRectOffset = ParsedIcon.ImageRectOffset,
            ImageRectSize = ParsedIcon.ImageRectSize,
            LayoutOrder = 1,
            Size = UDim2.fromOffset(20, 20),
            ZIndex = 10003,
            Parent = Header,
        })
    end

    local CloseButtonWidth = (Info.CloseButton ~= false and Info.Dismissible ~= false) and 28 or 0
    local TitleLabel = New("TextLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(1, -(IconLabel and 36 or 8) - CloseButtonWidth, 1, 0),
        Text = Info.Title or "Popup",
        TextColor3 = Info.TitleColor or "FontColor",
        TextSize = 18,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 10003,
        Parent = Header,
    })

    local CloseButton
    if Info.CloseButton ~= false and Info.Dismissible ~= false then
        CloseButton = New("TextButton", {
            BackgroundColor3 = "MainColor",
            LayoutOrder = 3,
            Size = UDim2.fromOffset(24, 24),
            Text = "x",
            TextSize = 14,
            TextTransparency = 0.18,
            ZIndex = 10003,
            Parent = Header,
        })
        table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = CloseButton }))
        Library:AddOutline(CloseButton, { Transparency = 0.25, ShadowTransparency = 1 })
    end

    local DescriptionLabel = New("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 0),
        Text = Info.Description or "",
        TextColor3 = Info.DescriptionColor or "FontColor",
        TextSize = 14,
        TextTransparency = Info.DescriptionColor and 0 or 0.18,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = Info.Description ~= nil and tostring(Info.Description) ~= "",
        ZIndex = 10003,
        Parent = Content,
    })

    local Actions = Info.Actions or Info.Buttons
    if typeof(Actions) == "table" and #Actions > 0 then
        local ActionsHolder = New("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0),
            ZIndex = 10003,
            Parent = Content,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Padding = UDim.new(0, 7),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Wraps = true,
            Parent = ActionsHolder,
        })

        for Order, Action in ipairs(Actions) do
            if typeof(Action) ~= "table" then
                continue
            end

            local Variant = tostring(Action.Variant or (Action.Risky and "Destructive" or "Secondary"))
            local ButtonColor = "MainColor"
            local ButtonTextColor = Library.Scheme.FontColor
            local ButtonOutlineColor = "OutlineColor"
            if Variant == "Primary" then
                ButtonColor = AccentColor
                ButtonTextColor = Color3.new(1, 1, 1)
                ButtonOutlineColor = AccentColor
            elseif Variant == "Destructive" then
                ButtonColor = "DestructiveColor"
                ButtonTextColor = Color3.new(1, 1, 1)
                ButtonOutlineColor = "DestructiveColor"
            elseif Variant == "Ghost" then
                ButtonColor = "BackgroundColor"
                ButtonOutlineColor = "BackgroundColor"
            end

            local Button = New("TextButton", {
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = ButtonColor,
                LayoutOrder = Action.Order or Order,
                Size = UDim2.fromOffset(0, 28),
                Text = tostring(Action.Title or Action.Text or "Action"),
                TextColor3 = ButtonTextColor,
                TextSize = 14,
                ZIndex = 10004,
                Parent = ActionsHolder,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                Parent = Button,
            })
            table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = Button }))
            Library:AddOutline(Button, {
                Color = ButtonOutlineColor,
                Transparency = Variant == "Ghost" and 0.85 or 0.2,
                ShadowTransparency = 1,
            })

            local BaseColor = typeof(ButtonColor) == "Color3" and ButtonColor
                or Library.Scheme[ButtonColor]
                or Library.Scheme.MainColor
            local HoverColor = Library:GetBetterColor(BaseColor, Variant == "Ghost" and 5 or 8)

            Library:GiveSignal(Button.MouseEnter:Connect(function()
                TweenService:Create(Button, Library.TweenInfo, {
                    BackgroundColor3 = HoverColor,
                }):Play()
            end))
            Library:GiveSignal(Button.MouseLeave:Connect(function()
                TweenService:Create(Button, Library.TweenInfo, {
                    BackgroundColor3 = BaseColor,
                }):Play()
            end))
            Library:GiveSignal(Button.MouseButton1Click:Connect(function()
                Library:SafeCallback(Action.Callback or Action.Func, Popup)
                if Action.CloseOnClick ~= false and not Popup.Destroyed then
                    Popup:Close()
                end
            end))
        end
    end

    local TimerFill
    local AutoDismissTime = tonumber(Info.Time) or 0
    if Info.Persist ~= true and Info.AutoDismiss ~= false and AutoDismissTime > 0 then
        local TimerTrack = New("Frame", {
            BackgroundColor3 = "OutlineColor",
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            LayoutOrder = 4,
            Size = UDim2.new(1, 0, 0, 2),
            ZIndex = 10003,
            Parent = Content,
        })
        TimerFill = New("Frame", {
            BackgroundColor3 = Accent,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 10004,
            Parent = TimerTrack,
        })
    end

    function Popup:SetTitle(Title)
        Info.Title = tostring(Title or "")
        TitleLabel.Text = Info.Title
    end

    function Popup:SetDescription(Description)
        Info.Description = tostring(Description or "")
        DescriptionLabel.Text = Info.Description
        DescriptionLabel.Visible = Info.Description ~= ""
    end

    function Popup:SetIcon(Icon)
        if not IconLabel then
            return
        end

        local NewIcon = Library:GetCustomIcon(Icon)
        if not NewIcon then
            return
        end

        IconLabel.Image = NewIcon.Url
        IconLabel.ImageRectOffset = NewIcon.ImageRectOffset
        IconLabel.ImageRectSize = NewIcon.ImageRectSize
    end

    function Popup:Close()
        if Popup.Destroyed then
            return
        end

        Popup.Destroyed = true
        Library.Popups[PopupId] = nil

        TweenService:Create(CardScale, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Scale = 0.97,
        }):Play()
        TweenService:Create(Card, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1,
        }):Play()
        if Overlay then
            TweenService:Create(Overlay, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                BackgroundTransparency = 1,
            }):Play()
        end

        task.delay(0.18, function()
            if PopupGui.Parent then
                PopupGui:Destroy()
            end
        end)
    end

    Popup.Destroy = Popup.Close
    Popup.Dismiss = Popup.Close

    if CloseButton then
        Library:GiveSignal(CloseButton.MouseButton1Click:Connect(function()
            Popup:Close()
        end))
    end

    if Overlay then
        Library:GiveSignal(Overlay.MouseButton1Click:Connect(function()
            if Info.OutsideClickDismiss ~= false and Info.Dismissible ~= false then
                Popup:Close()
            end
        end))
    end

    if TimerFill then
        TweenService:Create(TimerFill, TweenInfo.new(AutoDismissTime, Enum.EasingStyle.Linear), {
            Size = UDim2.fromScale(0, 1),
        }):Play()

        task.delay(AutoDismissTime, function()
            if not Popup.Destroyed then
                Popup:Close()
            end
        end)
    end

    Library.Popups[PopupId] = Popup
    return Popup
end

function Library:ShowPopup(Info, Time)
    return Library:CreatePopup(Info, Time)
end

Library.Popup = Library.ShowPopup
Library.AddPopup = Library.CreatePopup

function Library:ShowDialog(Info)
    if Library.Window and Library.Window.AddDialog then
        return Library.Window:AddDialog(Info)
    end

    return Library:CreatePopup(Info)
end

Library.Dialog = Library.ShowDialog
Library.CreateDialog = Library.ShowDialog

function Library:CreateWindow(WindowInfo)
    WindowInfo = Library:Validate(WindowInfo, Templates.Window)
    local ViewportSize: Vector2 = workspace.CurrentCamera.ViewportSize
    if RunService:IsStudio() and ViewportSize.X <= 5 and ViewportSize.Y <= 5 then
        repeat
            ViewportSize = workspace.CurrentCamera.ViewportSize
            task.wait()
        until ViewportSize.X > 5 and ViewportSize.Y > 5
    end

    local MaxX = ViewportSize.X - 64
    local MaxY = ViewportSize.Y - 64

    Library.OriginalMinSize =
        Vector2.new(math.min(Library.OriginalMinSize.X, MaxX), math.min(Library.OriginalMinSize.Y, MaxY))
    Library.MinSize = Library.OriginalMinSize

    WindowInfo.Size = UDim2.fromOffset(
        math.clamp(WindowInfo.Size.X.Offset, Library.MinSize.X, MaxX),
        math.clamp(WindowInfo.Size.Y.Offset, Library.MinSize.Y, MaxY)
    )
    if typeof(WindowInfo.Font) == "table" and WindowInfo.Font.Type == "CustomFont" then
        Library:SetCustomFont(WindowInfo.Font)
        WindowInfo.Font = Library.Scheme.Font
    elseif typeof(WindowInfo.Font) == "EnumItem" then
        WindowInfo.Font = Font.fromEnum(WindowInfo.Font)
    end
    WindowInfo.CornerRadius = math.min(WindowInfo.CornerRadius, 20)

    --// Old Naming \\--
    if WindowInfo.Compact ~= nil then
        WindowInfo.SidebarCompacted = WindowInfo.Compact
    end
    if WindowInfo.SidebarMinWidth ~= nil then
        WindowInfo.MinSidebarWidth = WindowInfo.SidebarMinWidth
    end
    WindowInfo.MinSidebarWidth = math.max(64, WindowInfo.MinSidebarWidth)
    WindowInfo.SidebarCompactWidth = math.max(48, WindowInfo.SidebarCompactWidth)
    WindowInfo.SidebarCollapseThreshold = math.clamp(WindowInfo.SidebarCollapseThreshold, 0.1, 0.9)
    WindowInfo.CompactWidthActivation = math.max(48, WindowInfo.CompactWidthActivation)

    Library.CornerRadius = WindowInfo.CornerRadius
    Library:SetNotifySide(WindowInfo.NotifySide)
    Library.ShowCustomCursor = WindowInfo.ShowCustomCursor
    Library.Scheme.Font = WindowInfo.Font
    Library.ToggleKeybind = WindowInfo.ToggleKeybind
    Library.ViewportDragWithM1 = WindowInfo.ViewportDragWithM1 == true
    Library.EnableEscapeToClose = WindowInfo.EnableEscapeToClose ~= false
    Library.GlobalSearch = WindowInfo.GlobalSearch
    Library.MobileHitSize = math.max(22, tonumber(WindowInfo.MobileHitSize) or 28)
    Library.RainbowBorderEnabled = WindowInfo.RainbowBorder == true
    Library.RainbowBorderTargets = Library:GetRainbowTargets(WindowInfo.RainbowBorderTargets)
    Library.RainbowBorderSpeed = math.max(0.01, tonumber(WindowInfo.RainbowBorderSpeed) or 0.12)
    Library.RainbowBorderSaturation = math.clamp(tonumber(WindowInfo.RainbowBorderSaturation) or 1, 0, 1)
    Library.RainbowBorderValue = math.clamp(tonumber(WindowInfo.RainbowBorderValue) or 1, 0, 1)
    Library.HasBackgroundImage = WindowInfo.BackgroundImage ~= nil and WindowInfo.BackgroundImage ~= ""
    Library.BackgroundImageContentTransparency = WindowInfo.BackgroundImageContentTransparency
    Library.BackgroundImagePanelTransparency = WindowInfo.BackgroundImagePanelTransparency
    local IsTopbarTabs = tostring(WindowInfo.TabsMode):lower() == "topbar"
    local IsCardTabs = tostring(WindowInfo.TabStyle):lower() == "card"
    local TabTitleMode = tostring(WindowInfo.TabTitleMode or "Active"):lower()
    if TabTitleMode ~= "active" and TabTitleMode ~= "window" and TabTitleMode ~= "hidden" then
        TabTitleMode = "active"
    end

    local IsDefaultSearchbarSize = WindowInfo.SearchbarSize == UDim2.fromScale(1, 1)
    local MainFrame
    local DividerLine
    local TitleHolder
    local WindowTitle
    local WindowIcon
    local RightWrapper
    local SearchBox
    local CurrentTabInfo
    local CurrentTabLabel
    local CurrentTabDescription
    local CurrentTabDescriptionFrame
    local ResizeButton
    local Tabs
    local Container
    local BackgroundImage
    local WindowGradient
    local MainOutlineStroke
    local MainShadowStroke
    local BottomBackground
    local TopBarBottomCover
    local FooterLabel
    local FooterLeftLabel
    local FooterRightLabel

    local InitialLeftWidth = math.ceil(WindowInfo.Size.X.Offset * 0.3)
    local TopActionReserve = WindowInfo.Resizable and 94 or 57
    local IsCompact = WindowInfo.SidebarCompacted
    local LastExpandedWidth = InitialLeftWidth

    local function GetTopbarLeftReserve(Width: number)
        local IconReserve = (WindowInfo.Icon and WindowInfo.IconSize.X.Offset or 30) + 38
        return math.max(Width, IconReserve)
    end

    local function ResolveWindowImage(Image: string?, Name: string)
        if IsHttpUrl(Image) then
            return Library:DownloadImage(Image, {
                AssetName = Name,
                FileName = Name .. ".png",
            })
        end

        return Image
    end

    do
        FullscreenBackground.Visible = WindowInfo.FullscreenBackground == true
        FullscreenBackground.BackgroundColor3 = WindowInfo.FullscreenBackgroundColor
        FullscreenBackground.BackgroundTransparency = WindowInfo.FullscreenBackgroundTransparency
        WindowInfo.FullscreenBackgroundImage = ResolveWindowImage(WindowInfo.FullscreenBackgroundImage, "WindowFullscreenBackground")
        FullscreenBackground.Image = WindowInfo.FullscreenBackgroundImage or ""
        FullscreenBackground.ImageTransparency = WindowInfo.FullscreenBackgroundImageTransparency
        FullscreenBackground.ScaleType = WindowInfo.FullscreenBackgroundImageScaleType
        if WindowInfo.FullscreenBackgroundImage and WindowInfo.FullscreenBackgroundImage ~= "" then
            FullscreenBackground.BackgroundTransparency = math.max(0.95, WindowInfo.FullscreenBackgroundTransparency)
        end

        Library.KeybindFrame, Library.KeybindContainer = Library:AddDraggableMenu("Keybinds", {
            Width = WindowInfo.KeybindMenuWidth,
            Height = WindowInfo.KeybindMenuHeight,
            MaxHeight = WindowInfo.KeybindMenuMaxHeight,
            Size = WindowInfo.KeybindMenuSize,
        })
        Library.KeybindMenuWidth = WindowInfo.KeybindMenuWidth
        Library.KeybindMenuHeight = WindowInfo.KeybindMenuHeight
        Library.KeybindMenuMaxHeight = WindowInfo.KeybindMenuMaxHeight
        Library.KeybindFrame.AnchorPoint = Vector2.new(0, 0.5)
        Library.KeybindFrame.Position = WindowInfo.KeybindMenuPosition or UDim2.new(0, 6, 0.5, 0)
        Library.KeybindFrame.Visible = false

        MainFrame = New("TextButton", {
            BackgroundColor3 = WindowInfo.BackgroundColor or function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, -1)
            end,
            Name = "Main",
            Text = "",
            Position = WindowInfo.Position,
            Size = WindowInfo.Size,
            Visible = false,
            Parent = ScreenGui,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                Parent = MainFrame,
            })
        )
        table.insert(
            Library.Scales,
            New("UIScale", {
                Parent = MainFrame,
            })
        )
        MainOutlineStroke, MainShadowStroke = Library:AddOutline(MainFrame, {
            Color = WindowInfo.BorderColor,
            Thickness = WindowInfo.BorderThickness,
            Transparency = WindowInfo.BorderTransparency,
            ShadowColor = WindowInfo.ShadowColor,
            ShadowThickness = WindowInfo.ShadowThickness,
            ShadowTransparency = WindowInfo.ShadowTransparency,
            RainbowTarget = "Window",
        })
        if WindowInfo.Gradient then
            WindowGradient = Library:AddGradient(MainFrame, {
                Color = WindowInfo.GradientColorSequence,
                Rotation = WindowInfo.GradientRotation,
                Transparency = WindowInfo.GradientTransparency,
            })
        end
        Library:MakeLine(MainFrame, {
            Position = UDim2.fromOffset(0, 48),
            Size = UDim2.new(1, 0, 0, 1),
        })

        DividerLine = New("Frame", {
            BackgroundColor3 = "OutlineColor",
            Position = IsTopbarTabs and UDim2.fromOffset(0, 88) or UDim2.fromOffset(InitialLeftWidth, 0),
            Size = IsTopbarTabs and UDim2.new(1, 0, 0, 1) or UDim2.new(0, 1, 1, -21),
            Parent = MainFrame,
        })

        local function CreateBackgroundImage(Image)
            if BackgroundImage then
                BackgroundImage.Image = Image
                BackgroundImage.Visible = Image ~= nil and Image ~= ""
                return BackgroundImage
            end

            BackgroundImage = New("ImageLabel", {
                Image = Image or "",
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(1, 1),
                ScaleType = WindowInfo.BackgroundImageScaleType,
                ZIndex = 1,
                BackgroundTransparency = 1,
                ImageTransparency = WindowInfo.BackgroundImageTransparency,
                Visible = Image ~= nil and Image ~= "",
                Parent = MainFrame,
            })

            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                    Parent = BackgroundImage,
                })
            )

            return BackgroundImage
        end

        WindowInfo.BackgroundImage = ResolveWindowImage(WindowInfo.BackgroundImage, "WindowBackground")
        Library.HasBackgroundImage = WindowInfo.BackgroundImage ~= nil and WindowInfo.BackgroundImage ~= ""
        CreateBackgroundImage(WindowInfo.BackgroundImage)

        if WindowInfo.Center then
            MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset / 2, 0.5, -MainFrame.Size.Y.Offset / 2)
        end

        --// Top Bar \\-
        local TopBar = New("Frame", {
            BackgroundColor3 = function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, 2)
            end,
            BackgroundTransparency = 0,
            Size = UDim2.new(1, 0, 0, 48),
            Parent = MainFrame,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                Parent = TopBar,
            })
        )
        RegisterBackgroundImageSurface(TopBar, 0, "Content")
        TopBarBottomCover = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, 2)
            end,
            BackgroundTransparency = 0,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, WindowInfo.CornerRadius),
            Parent = TopBar,
        })
        RegisterBackgroundImageSurface(TopBarBottomCover, 0, "Content")
        Library:MakeDraggable(MainFrame, TopBar, false, true)

        --// Title
        TitleHolder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, InitialLeftWidth, 1, 0),
            Parent = TopBar,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 6),
            Parent = TitleHolder,
        })

        if WindowInfo.Icon then
            local Icon = Library:GetCustomIcon(WindowInfo.Icon)
            WindowIcon = New("ImageLabel", {
                Image = Icon.Url,
                ImageRectOffset = Icon.ImageRectOffset,
                ImageRectSize = Icon.ImageRectSize,
                Size = WindowInfo.IconSize,
                Parent = TitleHolder,
            })
        else
            WindowIcon = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = WindowInfo.IconSize,
                Text = WindowInfo.Title:sub(1, 1),
                TextScaled = true,
                Visible = false,
                Parent = TitleHolder,
            })
        end

        local X = Library:GetTextBounds(
            WindowInfo.Title,
            Library.Scheme.Font,
            20,
            TitleHolder.AbsoluteSize.X - (WindowInfo.Icon and WindowInfo.IconSize.X.Offset + 6 or 0) - 12
        )
        WindowTitle = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, X, 1, 0),
            Text = WindowInfo.Title,
            TextSize = 20,
            Parent = TitleHolder,
        })

        --// Top Right Bar
        RightWrapper = New("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.new(0, GetTopbarLeftReserve(InitialLeftWidth), 0.5, 0),
            Size = UDim2.new(1, -GetTopbarLeftReserve(InitialLeftWidth) - TopActionReserve - 1, 1, -16),
            Parent = TopBar,
        })

        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8),
            Parent = RightWrapper,
        })

        CurrentTabInfo = New("Frame", {
            Size = UDim2.fromScale(WindowInfo.DisableSearch and 1 or 0.5, 1),
            Visible = false,
            BackgroundTransparency = 1,
            Parent = RightWrapper,
        })

        New("UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Grow,
            Parent = CurrentTabInfo,
        })

        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Parent = CurrentTabInfo,
        })

        New("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
            Parent = CurrentTabInfo,
        })

        CurrentTabLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = "",
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = CurrentTabInfo,
        })

        CurrentTabDescriptionFrame = New("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.fromScale(0, 0),
            ScrollBarThickness = 2,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Size = UDim2.new(1, 0, 1, -20),
            Parent = CurrentTabInfo,
        })
        CurrentTabDescription = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = "",
            TextWrapped = true,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 0.5,
            Parent = CurrentTabDescriptionFrame,
        })

        SearchBox = New("TextBox", {
            BackgroundColor3 = "MainColor",
            PlaceholderText = "Search",
            Size = WindowInfo.SearchbarSize,
            TextScaled = true,
            Visible = not (WindowInfo.DisableSearch or false),
            Parent = RightWrapper,
        })
        New("UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Shrink,
            Parent = SearchBox,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                Parent = SearchBox,
            })
        )
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
            Parent = SearchBox,
        })
        New("UIStroke", {
            Color = "OutlineColor",
            Parent = SearchBox,
        })

        local SearchIcon = Library:GetIcon("search")
        if SearchIcon then
            New("ImageLabel", {
                Image = SearchIcon.Url,
                ImageColor3 = "FontColor",
                ImageRectOffset = SearchIcon.ImageRectOffset,
                ImageRectSize = SearchIcon.ImageRectSize,
                ImageTransparency = 0.5,
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                Parent = SearchBox,
            })
        end

        Library:GiveSignal(MainFrame.MouseButton1Click:Connect(function()
            if SearchBox and SearchBox:IsFocused() and not Library:MouseIsOverFrame(SearchBox, Mouse) then
                SearchBox:ReleaseFocus()
            end
        end))

        local TopActionHolder = New("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.fromOffset(WindowInfo.Resizable and 66 or 30, 30),
            Parent = TopBar,
        })
        New("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 6),
            Parent = TopActionHolder,
        })

        if MoveIcon then
            New("ImageLabel", {
                BackgroundTransparency = 1,
                Image = MoveIcon.Url,
                ImageColor3 = "AccentColor",
                ImageRectOffset = MoveIcon.ImageRectOffset,
                ImageRectSize = MoveIcon.ImageRectSize,
                ImageTransparency = 0.05,
                Size = UDim2.fromOffset(30, 30),
                Parent = TopActionHolder,
            })
        end

        --// Resize Button
        if WindowInfo.Resizable then
            ResizeButton = New("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(30, 30),
                Text = "",
                Parent = TopActionHolder,
            })

            Library:MakeResizable(MainFrame, ResizeButton, function()
                for _, Tab in Library.Tabs do
                    Tab:Resize(true)
                end
            end)

            New("ImageLabel", {
                BackgroundTransparency = 1,
                Image = ResizeIcon and ResizeIcon.Url or "",
                ImageColor3 = "AccentColor",
                ImageRectOffset = ResizeIcon and ResizeIcon.ImageRectOffset or Vector2.zero,
                ImageRectSize = ResizeIcon and ResizeIcon.ImageRectSize or Vector2.zero,
                ImageTransparency = 0.05,
                Position = UDim2.fromOffset(2, 2),
                Size = UDim2.new(1, -4, 1, -4),
                Parent = ResizeButton,
            })
        end

        --// Bottom Bar \\--
        BottomBackground = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, 4)
            end,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, 20 + WindowInfo.CornerRadius),
            Parent = MainFrame,
        })
        RegisterBackgroundImageSurface(BottomBackground, 0, "Content")
        Library:MakeLine(MainFrame, {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, -20),
            Size = UDim2.new(1, 0, 0, 1),
        })

        local BottomBar = New("Frame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, 20),
            Parent = MainFrame,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                Parent = BottomBackground,
            })
        )

        --// Footer
        FooterLeftLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(8, 0),
            Size = UDim2.new(0.33, -8, 1, 0),
            Text = WindowInfo.FooterLeft or "",
            TextSize = 14,
            TextTransparency = 0.5,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = BottomBar,
        })
        FooterLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.33, 0),
            Size = UDim2.new(0.34, 0, 1, 0),
            Text = WindowInfo.Footer,
            TextSize = 14,
            TextTransparency = 0.5,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = BottomBar,
        })
        FooterRightLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -8, 0, 0),
            Size = UDim2.new(0.33, -8, 1, 0),
            Text = WindowInfo.FooterRight or "",
            TextSize = 14,
            TextTransparency = 0.5,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Right,
            Parent = BottomBar,
        })

        --// Tabs \\--
        Tabs = New("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = "BackgroundColor",
            CanvasSize = UDim2.fromScale(0, 0),
            Position = IsTopbarTabs and UDim2.fromOffset(0, 49) or UDim2.fromOffset(0, 49),
            ScrollBarThickness = 0,
            Size = IsTopbarTabs and UDim2.new(1, 0, 0, 39) or UDim2.new(0, InitialLeftWidth, 1, -70),
            Parent = MainFrame,
        })
        RegisterBackgroundImageSurface(Tabs, 0, "Content")
        New("UIListLayout", {
            FillDirection = IsTopbarTabs and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
            Parent = Tabs,
        })

        --// Container \\--
        Container = New("Frame", {
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, 1)
            end,
            Name = "Container",
            Position = IsTopbarTabs and UDim2.new(1, 0, 0, 89) or UDim2.new(1, 0, 0, 49),
            Size = IsTopbarTabs and UDim2.new(1, 0, 1, -110) or UDim2.new(1, -InitialLeftWidth - 1, 1, -70),
            Parent = MainFrame,
        })
        RegisterBackgroundImageSurface(Container, 0, "Content")
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
            PaddingTop = UDim.new(0, 0),
            Parent = Container,
        })
    end

    --// Window Table \\--
    local Window = {}

    function Window:ChangeTitle(title)
        assert(typeof(title) == "string", "Expected string for title got: " .. typeof(title))

        WindowTitle.Text = title
        WindowInfo.Title = title
    end

    function Window:SetBackgroundImage(Image: string)
        assert(typeof(Image) == "string", "Expected string for Image got: " .. typeof(Image))

        Image = ResolveWindowImage(Image, "WindowBackground")
        BackgroundImage.Image = Image
        BackgroundImage.Visible = Image ~= ""
        WindowInfo.BackgroundImage = Image
        Library.HasBackgroundImage = Image ~= ""
        UpdateBackgroundImageSurfaces()
    end

    Window.ChangeBackgroundImage = Window.SetBackgroundImage

    function Window:SetFullscreenBackgroundImage(Image: string?)
        assert(Image == nil or typeof(Image) == "string", "Expected string or nil for Image got: " .. typeof(Image))

        Image = ResolveWindowImage(Image, "WindowFullscreenBackground")
        FullscreenBackground.Image = Image or ""
        FullscreenBackground.Visible = WindowInfo.FullscreenBackground == true
            and Image ~= nil
            and Image ~= ""
        WindowInfo.FullscreenBackgroundImage = Image
        if Image and Image ~= "" then
            FullscreenBackground.BackgroundTransparency = math.max(0.95, WindowInfo.FullscreenBackgroundTransparency)
        else
            FullscreenBackground.BackgroundTransparency = WindowInfo.FullscreenBackgroundTransparency
        end
    end

    function Window:SetBackgroundImageTransparency(Transparency: number)
        assert(typeof(Transparency) == "number", "Expected number for Transparency got: " .. typeof(Transparency))

        WindowInfo.BackgroundImageTransparency = math.clamp(Transparency, 0, 1)
        BackgroundImage.ImageTransparency = WindowInfo.BackgroundImageTransparency
    end

    function Window:SetBackgroundImageSurfaceTransparency(ContentTransparency: number?, PanelTransparency: number?)
        if ContentTransparency ~= nil then
            assert(
                typeof(ContentTransparency) == "number",
                "Expected number for ContentTransparency got: " .. typeof(ContentTransparency)
            )
            WindowInfo.BackgroundImageContentTransparency = math.clamp(ContentTransparency, 0, 1)
            Library.BackgroundImageContentTransparency = WindowInfo.BackgroundImageContentTransparency
        end

        if PanelTransparency ~= nil then
            assert(
                typeof(PanelTransparency) == "number",
                "Expected number for PanelTransparency got: " .. typeof(PanelTransparency)
            )
            WindowInfo.BackgroundImagePanelTransparency = math.clamp(PanelTransparency, 0, 1)
            Library.BackgroundImagePanelTransparency = WindowInfo.BackgroundImagePanelTransparency
        elseif ContentTransparency ~= nil then
            WindowInfo.BackgroundImagePanelTransparency = math.clamp(ContentTransparency, 0, 1)
            Library.BackgroundImagePanelTransparency = WindowInfo.BackgroundImagePanelTransparency
        end

        UpdateBackgroundImageSurfaces()
    end

    Window.SetBackgroundImageLayerTransparency = Window.SetBackgroundImageSurfaceTransparency

    function Window:SetGradient(Enabled: boolean, GradientInfo)
        WindowInfo.Gradient = Enabled == true
        if GradientInfo then
            WindowInfo.GradientColorSequence = GradientInfo.Color or GradientInfo.ColorSequence or WindowInfo.GradientColorSequence
            WindowInfo.GradientRotation = GradientInfo.Rotation or WindowInfo.GradientRotation
            WindowInfo.GradientTransparency = GradientInfo.Transparency or WindowInfo.GradientTransparency
        end

        if not WindowGradient and WindowInfo.Gradient then
            WindowGradient = Library:AddGradient(MainFrame, {
                Color = WindowInfo.GradientColorSequence,
                Rotation = WindowInfo.GradientRotation,
                Transparency = WindowInfo.GradientTransparency,
            })
        elseif WindowGradient then
            WindowGradient.Enabled = WindowInfo.Gradient
        end

        if WindowGradient and GradientInfo then
            WindowGradient.Color = WindowInfo.GradientColorSequence
            WindowGradient.Rotation = WindowInfo.GradientRotation
            WindowGradient.Transparency = WindowInfo.GradientTransparency
        end
    end

    function Window:SetBorder(Info)
        Info = Info or {}

        if Info.Color then
            MainOutlineStroke.Color = GetSchemeValue(Info.Color) or Info.Color
            if typeof(Info.Color) == "string" then
                if not Library.Registry[MainOutlineStroke] then
                    Library:AddToRegistry(MainOutlineStroke, {})
                end
                Library.Registry[MainOutlineStroke].Color = Info.Color
            end
        end
        if Info.Thickness then
            MainOutlineStroke.Thickness = Info.Thickness
        end
        if Info.Transparency then
            MainOutlineStroke.Transparency = Info.Transparency
        end
        if Info.ShadowColor then
            MainShadowStroke.Color = GetSchemeValue(Info.ShadowColor) or Info.ShadowColor
            if typeof(Info.ShadowColor) == "string" then
                if not Library.Registry[MainShadowStroke] then
                    Library:AddToRegistry(MainShadowStroke, {})
                end
                Library.Registry[MainShadowStroke].Color = Info.ShadowColor
            end
        end
        if Info.ShadowThickness then
            MainShadowStroke.Thickness = Info.ShadowThickness
        end
        if Info.ShadowTransparency then
            MainShadowStroke.Transparency = Info.ShadowTransparency
        end
    end

    function Window:SetRainbowBorder(Enabled: boolean, Targets)
        WindowInfo.RainbowBorder = Enabled == true
        if Targets ~= nil then
            WindowInfo.RainbowBorderTargets = Targets
            Library.RainbowBorderTargets = Library:GetRainbowTargets(Targets)
        end

        Library.RainbowBorderEnabled = WindowInfo.RainbowBorder
        Library:RefreshRainbowStrokes()
    end

    function Window:SetTabsMode(Mode)
        local NewIsTopbar = tostring(Mode):lower() == "topbar"
        WindowInfo.TabsMode = NewIsTopbar and "Topbar" or "Sidebar"
        Library:NotifyWarning({
            Title = "Tabs mode",
            Description = "SetTabsMode requires recreating the window to fully re-layout tabs.",
            Time = 4,
        })
    end

    function Window:ChangeFooter(footer: string)
        return Window:SetFooter(footer)
    end

    function Window:SetFooter(footer: string)
        assert(typeof(footer) == "string", "Expected string for footer got: " .. typeof(footer))

        FooterLabel.Text = footer
        WindowInfo.Footer = footer
    end

    function Window:SetFooterLeft(footer: string)
        assert(typeof(footer) == "string", "Expected string for footer got: " .. typeof(footer))

        FooterLeftLabel.Text = footer
        WindowInfo.FooterLeft = footer
    end

    function Window:SetFooterRight(footer: string)
        assert(typeof(footer) == "string", "Expected string for footer got: " .. typeof(footer))

        FooterRightLabel.Text = footer
        WindowInfo.FooterRight = footer
    end

    function Window:SetFooterSections(Info)
        assert(typeof(Info) == "table", "Expected table for footer sections got: " .. typeof(Info))

        if Info.Left ~= nil then
            Window:SetFooterLeft(tostring(Info.Left))
        end
        if Info.Center ~= nil then
            Window:SetFooter(tostring(Info.Center))
        end
        if Info.Right ~= nil then
            Window:SetFooterRight(tostring(Info.Right))
        end
    end

    function Window:SetCornerRadius(Radius: number)
        assert(typeof(Radius) == "number", "Expected number for Radius got: " .. typeof(Radius))
        Radius = math.min(Radius, 20)

        for _, UICorner in Library.Corners do
            if UICorner.CornerRadius.Offset == Library.CornerRadius / 2 then
                UICorner.CornerRadius = UDim.new(0, Radius / 2)
            else
                UICorner.CornerRadius = UDim.new(0, Radius)
            end
        end

        Library.CornerRadius = Radius
        WindowInfo.CornerRadius = Radius

        BottomBackground.Size = UDim2.new(1, 0, 0, 20 + Radius)
        TopBarBottomCover.Size = UDim2.new(1, 0, 0, Radius)

        for _, Tab in Library.Tabs do
            if Tab.IsKeyTab then
                continue
            end

            for _, Tabbox in Tab.Tabboxes do
                Tabbox:UpdateCorners()
            end
        end
    end

    local function ApplyCompact()
        IsCompact = Window:GetSidebarWidth() == WindowInfo.SidebarCompactWidth
        if WindowInfo.DisableCompactingSnap then
            IsCompact = Window:GetSidebarWidth() <= WindowInfo.CompactWidthActivation
        end

        WindowTitle.Visible = not IsCompact
        if not WindowInfo.Icon then
            WindowIcon.Visible = IsCompact
        end

        for _, Button in Library.TabButtons do
            if not Button.Icon then
                continue
            end

            Button.Label.Visible = not IsCompact
            Button.Padding.PaddingBottom = UDim.new(0, IsCompact and 6 or 11)
            Button.Padding.PaddingLeft = UDim.new(0, IsCompact and 6 or 12)
            Button.Padding.PaddingRight = UDim.new(0, IsCompact and 6 or 12)
            Button.Padding.PaddingTop = UDim.new(0, IsCompact and 6 or 11)
            Button.Icon.SizeConstraint = IsCompact and Enum.SizeConstraint.RelativeXY or Enum.SizeConstraint.RelativeYY
        end
    end

    function Window:IsSidebarCompacted()
        return IsCompact
    end

    function Window:SetCompact(State)
        Window:SetSidebarWidth(State and WindowInfo.SidebarCompactWidth or LastExpandedWidth)
    end

    function Window:GetSidebarWidth()
        return Tabs.Size.X.Offset
    end

    function Window:SetSidebarWidth(Width)
        if IsTopbarTabs then
            return
        end

        Width = math.clamp(Width, 48, MainFrame.Size.X.Offset - WindowInfo.MinContainerWidth - 1)
        local TopbarLeftReserve = GetTopbarLeftReserve(Width)

        DividerLine.Position = UDim2.fromOffset(Width, 0)

        TitleHolder.Size = UDim2.new(0, Width, 1, 0)
        RightWrapper.Position = UDim2.new(0, TopbarLeftReserve, 0.5, 0)
        RightWrapper.Size = UDim2.new(1, -TopbarLeftReserve - TopActionReserve - 1, 1, -16)
        Tabs.Size = UDim2.new(0, Width, 1, -70)
        Container.Size = UDim2.new(1, -Width - 1, 1, -70)

        if WindowInfo.EnableCompacting then
            ApplyCompact()
        end
        if not IsCompact then
            LastExpandedWidth = Width
        end
    end

    function Window:ShowTabInfo(Name, Description)
        if TabTitleMode == "hidden" then
            Window:HideTabInfo()
            return
        end

        Description = Description or ""
        CurrentTabLabel.Text = Name
        CurrentTabDescription.Text = Description
        CurrentTabDescriptionFrame.Visible = Description ~= ""
        if CurrentTabDescriptionFrame then
            CurrentTabDescriptionFrame.CanvasPosition = Vector2.zero
        end

        if IsDefaultSearchbarSize then
            SearchBox.Size = UDim2.fromScale(0.5, 1)
        end
        CurrentTabInfo.Visible = true
    end
    function Window:HideTabInfo()
        CurrentTabInfo.Visible = false
        if IsDefaultSearchbarSize then
            SearchBox.Size = UDim2.fromScale(1, 1)
        end
    end

    function Window:AddTab(...)
        local Name = nil
        local Icon = nil
        local Description = nil
        local ShowInTabHolder = true
        local InitialVisible = true

        if select("#", ...) == 1 and typeof(...) == "table" then
            local Info = select(1, ...)
            Name = Info.Name or "Tab"
            Icon = Info.Icon
            Description = Info.Description
            ShowInTabHolder = Info.ShowInTabHolder ~= false and Info.Hidden ~= true
            InitialVisible = Info.Visible ~= false
        else
            Name = select(1, ...)
            Icon = select(2, ...)
            Description = select(3, ...)
        end

        local TabButton: TextButton
        local TabLabel
        local TabIcon

        local TabContainer
        local TabFull
        local TabFullList
        local TabLeft
        local TabRight

        Icon = Library:GetCustomIcon(Icon)
        do
            TabButton = New("TextButton", {
                BackgroundColor3 = "MainColor",
                BackgroundTransparency = IsCardTabs and 0.1 or 1,
                Size = IsTopbarTabs and UDim2.new(0, 140, 1, 0) or UDim2.new(1, 0, 0, 40),
                Text = "",
                Visible = ShowInTabHolder and InitialVisible,
                Parent = Tabs,
            })
            RegisterBackgroundImageSurface(TabButton, IsCardTabs and 0.1 or 1, "Panel")
            if IsCardTabs then
                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, math.max(2, WindowInfo.CornerRadius - 1)),
                        Parent = TabButton,
                    })
                )
                Library:AddOutline(TabButton, {
                    Color = "AccentColor",
                    Transparency = 0.55,
                    ShadowTransparency = 1,
                })
            end
            local ButtonPadding = New("UIPadding", {
                PaddingBottom = UDim.new(0, IsCompact and 6 or 11),
                PaddingLeft = UDim.new(0, IsCompact and 6 or 12),
                PaddingRight = UDim.new(0, IsCompact and 6 or 12),
                PaddingTop = UDim.new(0, IsCompact and 6 or 11),
                Parent = TabButton,
            })

            TabLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(30, 0),
                Size = UDim2.new(1, -30, 1, 0),
                Text = Name,
                TextSize = 16,
                TextTransparency = 0.5,
                TextXAlignment = Enum.TextXAlignment.Left,
                Visible = not IsCompact,
                Parent = TabButton,
            })

            if Icon then
                TabIcon = New("ImageLabel", {
                    Image = Icon.Url,
                    ImageColor3 = Icon.Custom and "WhiteColor" or "AccentColor",
                    ImageRectOffset = Icon.ImageRectOffset,
                    ImageRectSize = Icon.ImageRectSize,
                    ImageTransparency = 0.5,
                    ScaleType = Enum.ScaleType.Fit,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = IsCompact and Enum.SizeConstraint.RelativeXY or Enum.SizeConstraint.RelativeYY,
                    Parent = TabButton,
                })
            end

            table.insert(Library.TabButtons, {
                Label = TabLabel,
                Padding = ButtonPadding,
                Icon = TabIcon,
            })

            --// Tab Container \\--
            TabContainer = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Visible = false,
                Parent = Container,
            })

            TabFull = New("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(0, 0),
                Size = UDim2.new(1, 0, 0, 0),
                Visible = false,
                Parent = TabContainer,
            })
            TabFullList = New("UIListLayout", {
                Padding = UDim.new(0, 2),
                Parent = TabFull,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2),
                PaddingRight = UDim.new(0, 2),
                PaddingTop = UDim.new(0, 2),
                Parent = TabFull,
            })

            TabLeft = New("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                CanvasSize = UDim2.fromScale(0, 0),
                ScrollBarImageTransparency = 1,
                ScrollBarThickness = 0,
                Size = UDim2.new(0.5, -3, 1, 0),
                Parent = TabContainer,
            })
            New("UIListLayout", {
                Padding = UDim.new(0, 2),
                Parent = TabLeft,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2),
                PaddingRight = UDim.new(0, 2),
                PaddingTop = UDim.new(0, 2),
                Parent = TabLeft,
            })
            do
                New("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = -1,
                    Parent = TabLeft,
                })
                New("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Parent = TabLeft,
                })
            end

            TabRight = New("ScrollingFrame", {
                AnchorPoint = Vector2.new(1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                CanvasSize = UDim2.fromScale(0, 0),
                Position = UDim2.fromScale(1, 0),
                ScrollBarImageTransparency = 1,
                ScrollBarThickness = 0,
                Size = UDim2.new(0.5, -3, 1, 0),
                Parent = TabContainer,
            })
            New("UIListLayout", {
                Padding = UDim.new(0, 2),
                Parent = TabRight,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2),
                PaddingRight = UDim.new(0, 2),
                PaddingTop = UDim.new(0, 2),
                Parent = TabRight,
            })
            do
                New("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = -1,
                    Parent = TabRight,
                })
                New("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Parent = TabRight,
                })
            end
        end

        --// Warning Box \\--
        local WarningBoxHolder = New("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, 7),
            Size = UDim2.fromScale(1, 0),
            Visible = false,
            Parent = TabContainer,
        })

        local WarningBox
        local WarningBoxOutline
        local WarningBoxShadowOutline
        local WarningBoxScrollingFrame
        local WarningTitle
        local WarningStroke
        local WarningText
        do
            WarningBox = New("Frame", {
                BackgroundColor3 = "BackgroundColor",
                Position = UDim2.fromOffset(2, 0),
                Size = UDim2.new(1, -5, 0, 0),
                Parent = WarningBoxHolder,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                    Parent = WarningBox,
                })
            )
            WarningBoxOutline, WarningBoxShadowOutline = Library:AddOutline(WarningBox)

            WarningBoxScrollingFrame = New("ScrollingFrame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 3,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Parent = WarningBox,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
                PaddingTop = UDim.new(0, 4),
                Parent = WarningBoxScrollingFrame,
            })

            WarningTitle = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -4, 0, 14),
                Text = "",
                TextColor3 = Color3.fromRGB(255, 50, 50),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = WarningBoxScrollingFrame,
            })

            WarningStroke = New("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(169, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Miter,
                Parent = WarningTitle,
            })

            WarningText = New("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(0, 16),
                Size = UDim2.new(1, -4, 0, 0),
                Text = "",
                TextSize = 14,
                TextWrapped = true,
                Parent = WarningBoxScrollingFrame,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            })

            New("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = "DarkColor",
                LineJoinMode = Enum.LineJoinMode.Miter,
                Parent = WarningText,
            })
        end

        local HasFullContent = false

        --// Tab Table \\--
        local Tab = {
            Groupboxes = {},
            Tabboxes = {},
            DependencyGroupboxes = {},
            Description = Description,
            Sides = {
                TabLeft,
                TabRight,
            },
            WarningBox = {
                IsNormal = false,
                LockSize = false,
                Visible = false,
                Title = "WARNING",
                Text = "",
            },
            ShowInTabHolder = ShowInTabHolder,
            Visible = InitialVisible,
        }

        local function IsFullSide(Side)
            local SideText = tostring(Side):lower()
            return Side == 0
                or Side == 3
                or SideText == "full"
                or SideText == "wide"
                or SideText == "center"
                or SideText == "middle"
        end

        local function GetSideParent(Side)
            if IsFullSide(Side) then
                HasFullContent = true
                return TabFull
            end

            return Side == 1 and TabLeft or TabRight
        end

        function Tab:UpdateWarningBox(Info)
            if typeof(Info.IsNormal) == "boolean" then
                Tab.WarningBox.IsNormal = Info.IsNormal
            end
            if typeof(Info.LockSize) == "boolean" then
                Tab.WarningBox.LockSize = Info.LockSize
            end
            if typeof(Info.Visible) == "boolean" then
                Tab.WarningBox.Visible = Info.Visible
            end
            if typeof(Info.Title) == "string" then
                Tab.WarningBox.Title = Info.Title
            end
            if typeof(Info.Text) == "string" then
                Tab.WarningBox.Text = Info.Text
            end

            WarningBoxHolder.Visible = Tab.WarningBox.Visible
            WarningTitle.Text = Tab.WarningBox.Title
            WarningText.Text = Tab.WarningBox.Text
            Tab:Resize(true)

            WarningBox.BackgroundColor3 = Tab.WarningBox.IsNormal == true and Library.Scheme.BackgroundColor
                or Color3.fromRGB(127, 0, 0)

            WarningBoxShadowOutline.Color = Tab.WarningBox.IsNormal == true and Library.Scheme.DarkColor
                or Color3.fromRGB(85, 0, 0)
            WarningBoxOutline.Color = Tab.WarningBox.IsNormal == true and Library.Scheme.OutlineColor
                or Color3.fromRGB(255, 50, 50)

            WarningTitle.TextColor3 = Tab.WarningBox.IsNormal == true and Library.Scheme.FontColor
                or Color3.fromRGB(255, 50, 50)
            WarningStroke.Color = Tab.WarningBox.IsNormal == true and Library.Scheme.OutlineColor
                or Color3.fromRGB(169, 0, 0)

            if not Library.Registry[WarningBox] then
                Library:AddToRegistry(WarningBox, {})
            end
            if not Library.Registry[WarningBoxShadowOutline] then
                Library:AddToRegistry(WarningBoxShadowOutline, {})
            end
            if not Library.Registry[WarningBoxOutline] then
                Library:AddToRegistry(WarningBoxOutline, {})
            end
            if not Library.Registry[WarningTitle] then
                Library:AddToRegistry(WarningTitle, {})
            end
            if not Library.Registry[WarningStroke] then
                Library:AddToRegistry(WarningStroke, {})
            end

            Library.Registry[WarningBox].BackgroundColor3 = function()
                return Tab.WarningBox.IsNormal == true and Library.Scheme.BackgroundColor or Color3.fromRGB(127, 0, 0)
            end

            Library.Registry[WarningBoxShadowOutline].Color = function()
                return Tab.WarningBox.IsNormal == true and Library.Scheme.DarkColor or Color3.fromRGB(85, 0, 0)
            end

            Library.Registry[WarningBoxOutline].Color = function()
                return Tab.WarningBox.IsNormal == true and Library.Scheme.OutlineColor or Color3.fromRGB(255, 50, 50)
            end

            Library.Registry[WarningTitle].TextColor3 = function()
                return Tab.WarningBox.IsNormal == true and Library.Scheme.FontColor or Color3.fromRGB(255, 50, 50)
            end

            Library.Registry[WarningStroke].Color = function()
                return Tab.WarningBox.IsNormal == true and Library.Scheme.OutlineColor or Color3.fromRGB(169, 0, 0)
            end
        end

        function Tab:RefreshSides()
            local WarningOffset = WarningBoxHolder.Visible and WarningBox.Size.Y.Offset + 8 or 0
            local FullHeight = HasFullContent and (TabFullList.AbsoluteContentSize.Y / Library.DPIScale) + 4 or 0
            local Offset = WarningOffset + FullHeight

            TabFull.Visible = HasFullContent
            TabFull.Position = UDim2.fromOffset(0, WarningOffset)
            TabFull.Size = UDim2.new(1, 0, 0, FullHeight)

            for _, Side in Tab.Sides do
                Side.Position = UDim2.new(Side.Position.X.Scale, 0, 0, Offset)
                Side.Size = UDim2.new(0.5, -3, 1, -Offset)
            end
        end

        function Tab:Resize(ResizeWarningBox: boolean?)
            if ResizeWarningBox then
                local MaximumSize = math.floor(TabContainer.AbsoluteSize.Y / 3.25)
                local _, YText = Library:GetTextBounds(
                    WarningText.Text,
                    Library.Scheme.Font,
                    WarningText.TextSize,
                    WarningText.AbsoluteSize.X
                )

                local YBox = 24 + YText
                if Tab.WarningBox.LockSize == true and YBox >= MaximumSize then
                    WarningBoxScrollingFrame.CanvasSize = UDim2.fromOffset(0, YBox)
                    YBox = MaximumSize
                else
                    WarningBoxScrollingFrame.CanvasSize = UDim2.fromOffset(0, 0)
                end

                WarningText.Size = UDim2.new(1, -4, 0, YText)
                WarningBox.Size = UDim2.new(1, -5, 0, YBox + 4)
            end

            Tab:RefreshSides()
        end

        Library:GiveSignal(TabFullList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Tab:RefreshSides()
        end))

        function Tab:AddGroupbox(Info)
            Info = typeof(Info) == "table" and Info or { Name = tostring(Info or "Groupbox") }
            Info.Name = Info.Name or "Groupbox"

            local BoxHolder = New("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                Parent = GetSideParent(Info.Side),
            })
            New("UIListLayout", {
                Padding = UDim.new(0, 6),
                Parent = BoxHolder,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 4),
                PaddingTop = UDim.new(0, 4),
                Parent = BoxHolder,
            })

            local GroupboxHolder
            local GroupboxLabel

            local GroupboxContainer
            local GroupboxList
            local CollapseArrow
            local HeaderButton
            local HeaderLine

            do
                GroupboxHolder = New("Frame", {
                    BackgroundColor3 = "BackgroundColor",
                    Size = UDim2.fromScale(1, 0),
                    Parent = BoxHolder,
                })
                RegisterBackgroundImageSurface(GroupboxHolder, 0, "Panel")
                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                        Parent = GroupboxHolder,
                    })
                )
                Library:AddOutline(GroupboxHolder, {
                    Rainbow = Info.RainbowBorder,
                    RainbowTarget = "Groupboxes",
                })

                HeaderLine = Library:MakeLine(GroupboxHolder, {
                    Position = UDim2.fromOffset(0, 34),
                    Size = UDim2.new(1, 0, 0, 1),
                })

                local BoxIcon = Library:GetCustomIcon(Info.IconName)
                if BoxIcon then
                    New("ImageLabel", {
                        Image = BoxIcon.Url,
                        ImageColor3 = BoxIcon.Custom and "WhiteColor" or "AccentColor",
                        ImageRectOffset = BoxIcon.ImageRectOffset,
                        ImageRectSize = BoxIcon.ImageRectSize,
                        Position = UDim2.fromOffset(6, 6),
                        Size = UDim2.fromOffset(22, 22),
                        Parent = GroupboxHolder,
                    })
                end

                GroupboxLabel = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(BoxIcon and 24 or 0, 0),
                    Size = UDim2.new(1, BoxIcon and -58 or -34, 0, 34),
                    Text = Info.Name,
                    TextSize = 15,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Parent = GroupboxHolder,
                })
                New("UIPadding", {
                    PaddingLeft = UDim.new(0, 12),
                    PaddingRight = UDim.new(0, 12),
                    Parent = GroupboxLabel,
                })

                CollapseArrow = New("ImageLabel", {
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundTransparency = 1,
                    Image = ArrowIcon and ArrowIcon.Url or "",
                    ImageColor3 = "FontColor",
                    ImageRectOffset = ArrowIcon and ArrowIcon.ImageRectOffset or Vector2.zero,
                    ImageRectSize = ArrowIcon and ArrowIcon.ImageRectSize or Vector2.zero,
                    ImageTransparency = 0.45,
                    Position = UDim2.new(1, -10, 0, 17),
                    Size = UDim2.fromOffset(16, 16),
                    ZIndex = 2,
                    Parent = GroupboxHolder,
                })

                HeaderButton = New("TextButton", {
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 34),
                    Text = "",
                    ZIndex = 3,
                    Parent = GroupboxHolder,
                })

                GroupboxContainer = New("Frame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(0, 35),
                    Size = UDim2.new(1, 0, 1, -35),
                    Parent = GroupboxHolder,
                })

                GroupboxList = New("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    Parent = GroupboxContainer,
                })
                New("UIPadding", {
                    PaddingBottom = UDim.new(0, 7),
                    PaddingLeft = UDim.new(0, 7),
                    PaddingRight = UDim.new(0, 7),
                    PaddingTop = UDim.new(0, 7),
                    Parent = GroupboxContainer,
                })
            end

            local Groupbox = {
                BoxHolder = BoxHolder,
                Holder = GroupboxHolder,
                Container = GroupboxContainer,

                Tab = Tab,
                DependencyBoxes = {},
                Tabboxes = {},
                Elements = {},
                Collapsed = Info.Collapsed == true,
                SearchExpanded = false,
            }

            function Groupbox:Resize()
                local IsCollapsed = Groupbox.Collapsed and not Groupbox.SearchExpanded

                GroupboxContainer.Visible = not IsCollapsed
                HeaderLine.Visible = not IsCollapsed
                CollapseArrow.Rotation = IsCollapsed and 180 or 0
                CollapseArrow.ImageTransparency = IsCollapsed and 0.6 or 0.45

                if IsCollapsed then
                    GroupboxHolder.Size = UDim2.new(1, 0, 0, 35)
                else
                    GroupboxHolder.Size =
                        UDim2.new(1, 0, 0, (GroupboxList.AbsoluteContentSize.Y / Library.DPIScale) + 49)
                end
                Tab:RefreshSides()
            end

            function Groupbox:SetCollapsed(Collapsed: boolean)
                Groupbox.Collapsed = Collapsed == true
                Groupbox:Resize()
            end

            function Groupbox:ToggleCollapsed()
                Groupbox:SetCollapsed(not Groupbox.Collapsed)
            end

            HeaderButton.MouseButton1Click:Connect(function()
                Groupbox:ToggleCollapsed()
            end)

            setmetatable(Groupbox, BaseGroupbox)

            Groupbox:Resize()
            Tab.Groupboxes[Info.Name] = Groupbox

            return Groupbox
        end

        function Tab:AddLeftGroupbox(Name, IconName)
            return Tab:AddGroupbox({ Side = 1, Name = Name, IconName = IconName })
        end

        function Tab:AddRightGroupbox(Name, IconName)
            return Tab:AddGroupbox({ Side = 2, Name = Name, IconName = IconName })
        end

        function Tab:AddFullGroupbox(Name, IconName)
            return Tab:AddGroupbox({ Side = "Full", Name = Name, IconName = IconName })
        end

        function Tab:AddTabbox(Info)
            Info = typeof(Info) == "table" and Info or { Name = Info }

            local BoxHolder = New("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                Parent = GetSideParent(Info.Side),
            })
            New("UIListLayout", {
                Padding = UDim.new(0, 6),
                Parent = BoxHolder,
            })
            New("UIPadding", {
                PaddingBottom = UDim.new(0, 4),
                PaddingTop = UDim.new(0, 4),
                Parent = BoxHolder,
            })

            local TabboxHolder
            local TabboxButtons

            do
                TabboxHolder = New("Frame", {
                    BackgroundColor3 = "BackgroundColor",
                    Size = UDim2.fromScale(1, 0),
                    Parent = BoxHolder,
                })
                RegisterBackgroundImageSurface(TabboxHolder, 0, "Panel")
                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                        Parent = TabboxHolder,
                    })
                )
                Library:AddOutline(TabboxHolder, {
                    Rainbow = Info.RainbowBorder,
                    RainbowTarget = "Tabboxes",
                })

                TabboxButtons = New("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 34),
                    Parent = TabboxHolder,
                })
                New("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Parent = TabboxButtons,
                })
            end

            local TotalButtons, TotalTabs = 0, 1
            local Tabbox = {
                ActiveTab = nil,

                BoxHolder = BoxHolder,
                Holder = TabboxHolder,
                GroupTab = Tab,
                Tabs = {},
            }

            function Tabbox:UpdateCorners()
                for _, Tab in Tabbox.Tabs do
                    Tab:UpdateCorners()
                end
            end

            function Tabbox:AddTab(Name, IconName)
                local TabIndex = TotalTabs

                TotalButtons = TotalButtons + 1
                TotalTabs = TotalTabs + 1

                local BoxIcon = Library:GetCustomIcon(IconName)

                local Button = New("TextButton", {
                    BackgroundColor3 = "MainColor",
                    BackgroundTransparency = 0,
                    Size = UDim2.fromOffset(0, 34),
                    Text = "",
                    Parent = TabboxButtons,
                })

                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                        Parent = Button,
                    })
                )

                local BottomCover = New("Frame", {
                    Name = "BottomCover",
                    BackgroundColor3 = "MainColor",
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 0, 1, -WindowInfo.CornerRadius),
                    Size = UDim2.new(1, 0, 0, WindowInfo.CornerRadius),
                    Parent = Button,
                })

                local LeftCover = New("Frame", {
                    Name = "LeftCover",
                    BackgroundColor3 = "MainColor",
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(0, WindowInfo.CornerRadius, 1, 0),
                    Visible = false,
                    Parent = Button,
                })

                local RightCover = New("Frame", {
                    Name = "RightCover",
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundColor3 = "MainColor",
                    BorderSizePixel = 0,
                    Position = UDim2.new(1, 0, 0, 0),
                    Size = UDim2.new(0, WindowInfo.CornerRadius, 1, 0),
                    Visible = false,
                    Parent = Button,
                })

                local ButtonContent = New("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(1, -12, 0, 16),
                    Parent = Button,
                })

                local ButtonIcon
                if BoxIcon then
                    ButtonIcon = New("ImageLabel", {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Image = BoxIcon.Url,
                        ImageColor3 = BoxIcon.Custom and "WhiteColor" or "AccentColor",
                        ImageRectOffset = BoxIcon.ImageRectOffset,
                        ImageRectSize = BoxIcon.ImageRectSize,
                        ImageTransparency = 0.5,
                        Position = UDim2.fromScale(0, 0.5),
                        Size = UDim2.fromOffset(16, 16),
                        Parent = ButtonContent,
                    })
                end

                local ButtonLabel = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Position = BoxIcon and UDim2.fromOffset(24, 0) or UDim2.fromOffset(0, 0),
                    Size = BoxIcon and UDim2.new(1, -24, 1, 0) or UDim2.fromScale(1, 1),
                    Text = Name,
                    TextSize = 15,
                    TextTransparency = 0.5,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextXAlignment = BoxIcon and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
                    Parent = ButtonContent,
                })

                local Line = Library:MakeLine(Button, {
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.new(0, 0, 1, 1),
                    Size = UDim2.new(1, 0, 0, 1),
                })

                local Container = New("Frame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(0, 35),
                    Size = UDim2.new(1, 0, 1, -35),
                    Visible = false,
                    Parent = TabboxHolder,
                })
                local List = New("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    Parent = Container,
                })
                New("UIPadding", {
                    PaddingBottom = UDim.new(0, 7),
                    PaddingLeft = UDim.new(0, 7),
                    PaddingRight = UDim.new(0, 7),
                    PaddingTop = UDim.new(0, 7),
                    Parent = Container,
                })

                local Tab = {
                    ButtonHolder = Button,
                    Container = Container,

                    ButtonCovers = {
                        BottomCover = BottomCover,
                        LeftCover = LeftCover,
                        RightCover = RightCover,
                    },

                    Tab = Tab,
                    Elements = {},
                    DependencyBoxes = {},
                    Tabboxes = {},
                }

                function Tab:Show()
                    if Tabbox.ActiveTab then
                        Tabbox.ActiveTab:Hide()
                    end

                    Button.BackgroundTransparency = 1
                    BottomCover.BackgroundTransparency = 1
                    LeftCover.BackgroundTransparency = 1
                    RightCover.BackgroundTransparency = 1

                    ButtonLabel.TextTransparency = 0
                    if ButtonIcon then
                        ButtonIcon.ImageTransparency = 0
                    end
                    Line.Visible = false

                    Container.Visible = true

                    Tabbox.ActiveTab = Tab
                    Tab:Resize()
                end

                function Tab:Hide()
                    Button.BackgroundTransparency = 0
                    BottomCover.BackgroundTransparency = 0
                    LeftCover.BackgroundTransparency = 0
                    RightCover.BackgroundTransparency = 0

                    ButtonLabel.TextTransparency = 0.5
                    if ButtonIcon then
                        ButtonIcon.ImageTransparency = 0.5
                    end
                    Line.Visible = true
                    Container.Visible = false

                    Tabbox.ActiveTab = nil
                end

                function Tab:Resize()
                    if Tabbox.ActiveTab ~= Tab then
                        return
                    end

                    TabboxHolder.Size = UDim2.new(1, 0, 0, (List.AbsoluteContentSize.Y / Library.DPIScale) + 49)
                    Tabbox.GroupTab:RefreshSides()
                end

                function Tab:UpdateCorners()
                    LeftCover.Visible = TabIndex ~= 1
                    RightCover.Visible = TabIndex ~= TotalButtons

                    BottomCover.Position = UDim2.new(0, 0, 1, -WindowInfo.CornerRadius)
                    BottomCover.Size = UDim2.new(1, 0, 0, WindowInfo.CornerRadius)

                    LeftCover.Size = UDim2.new(0, WindowInfo.CornerRadius, 1, 0)
                    RightCover.Size = UDim2.new(0, WindowInfo.CornerRadius, 1, 0)
                end

                --// Execution \\--
                if not Tabbox.ActiveTab then
                    Tab:Show()
                end

                Button.MouseButton1Click:Connect(Tab.Show)

                setmetatable(Tab, BaseGroupbox)

                Tabbox.Tabs[Name] = Tab
                Tabbox:UpdateCorners()

                return Tab
            end

            if Info.Name then
                Tab.Tabboxes[Info.Name] = Tabbox
            else
                table.insert(Tab.Tabboxes, Tabbox)
            end

            return Tabbox
        end

        function Tab:AddLeftTabbox(Name)
            return Tab:AddTabbox({ Side = 1, Name = Name })
        end

        function Tab:AddRightTabbox(Name)
            return Tab:AddTabbox({ Side = 2, Name = Name })
        end

        function Tab:AddFullTabbox(Name)
            return Tab:AddTabbox({ Side = "Full", Name = Name })
        end

        function Tab:AddCard(Info)
            Info = Info or {}
            local FullCard = IsFullSide(Info.Side)
            local Side = Info.Side == 2 and 2 or 1
            local TargetTab = Info.TargetTab or Info.Tab
            local CardHeight = Info.Height or (FullCard and 90 or 132)
            local HoverHeight = Info.HoverHeight
                or (Info.DisableHoverGrow and CardHeight or CardHeight + (FullCard and 2 or 4))
            local HasThumbnail = Info.Thumbnail ~= nil and tostring(Info.Thumbnail) ~= ""
            local MinimumBarHeight = math.min(44, CardHeight)
            local BarHeight = math.clamp(Info.BarHeight or (HasThumbnail and 56 or CardHeight), MinimumBarHeight, CardHeight)
            local CardParent = FullCard and GetSideParent(Info.Side) or (Side == 1 and TabLeft or TabRight)
            local CardHolder = New("TextButton", {
                AutoButtonColor = false,
                BackgroundColor3 = "BackgroundColor",
                BackgroundTransparency = 0.1,
                ClipsDescendants = true,
                LayoutOrder = Info.LayoutOrder or 0,
                Size = UDim2.new(1, 0, 0, CardHeight),
                Text = "",
                Parent = CardParent,
            })
            RegisterBackgroundImageSurface(CardHolder, 0.1, "Panel")
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, math.max(4, WindowInfo.CornerRadius)),
                    Parent = CardHolder,
                })
            )
            Library:AddOutline(CardHolder, {
                Color = Info.StrokeColor or "OutlineColor",
                Thickness = Info.StrokeThickness or 1,
                Transparency = Info.StrokeTransparency or 0.2,
                ShadowTransparency = 1,
                Rainbow = Info.RainbowBorder,
                RainbowTarget = "Cards",
            })

            local Thumb = New("ImageLabel", {
                BackgroundTransparency = 1,
                Image = Info.Thumbnail or "",
                ImageTransparency = HasThumbnail and (Info.ThumbnailTransparency or 0.15) or 1,
                ScaleType = Enum.ScaleType.Crop,
                Size = UDim2.new(1, 0, 0, HasThumbnail and math.max(0, CardHeight - BarHeight + 8) or 0),
                Visible = HasThumbnail,
                Parent = CardHolder,
            })
            local Bar = New("Frame", {
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = "DarkColor",
                BackgroundTransparency = Info.BottomBarTransparency or 0.25,
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(1, 0, 0, BarHeight),
                Parent = CardHolder,
            })
            local Icon = Library:GetCustomIcon(Info.Icon)
            if Icon then
                New("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = Icon.Url,
                    ImageColor3 = Icon.Custom and "WhiteColor" or "AccentColor",
                    ImageRectOffset = Icon.ImageRectOffset,
                    ImageRectSize = Icon.ImageRectSize,
                    Position = UDim2.fromOffset(10, 8),
                    Size = UDim2.fromOffset(18, 18),
                    Parent = Bar,
                })
            end
            local Title = New("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(Icon and 34 or 10, 8),
                Size = UDim2.new(1, Icon and -42 or -12, 0, 19),
                Text = tostring(Info.Title or "Card"),
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = Bar,
            })
            New("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(Icon and 34 or 10, 25),
                Size = UDim2.new(1, Icon and -42 or -12, 0, math.max(18, BarHeight - 30)),
                Text = tostring(Info.Desc or Info.Description or ""),
                TextSize = 13,
                TextTransparency = 0.25,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                Parent = Bar,
            })

            local function SetHover(Hovering)
                TweenService:Create(CardHolder, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = GetBackgroundImageSurfaceTransparency(Hovering and 0.02 or 0.1, "Panel"),
                    Size = Hovering and UDim2.new(1, 0, 0, HoverHeight) or UDim2.new(1, 0, 0, CardHeight),
                }):Play()
                TweenService
                    :Create(Bar, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = Hovering and math.max(0, (Info.BottomBarTransparency or 0.25) - 0.08)
                            or (Info.BottomBarTransparency or 0.25),
                    })
                    :Play()
                TweenService
                    :Create(Title, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Hovering and GetSchemeValue("AccentColor") or GetSchemeValue("FontColor"),
                    })
                    :Play()
            end
            CardHolder.MouseEnter:Connect(function()
                SetHover(true)
            end)
            CardHolder.MouseLeave:Connect(function()
                SetHover(false)
            end)

            local Card = { Holder = CardHolder, TargetTab = TargetTab }
            function Card:SetTargetTab(NewTargetTab)
                Card.TargetTab = NewTargetTab
            end

            CardHolder.Activated:Connect(function()
                local NextTab = Card.TargetTab
                if typeof(NextTab) == "string" then
                    NextTab = Library.Tabs[NextTab]
                end
                if NextTab and typeof(NextTab) == "table" and NextTab.Show then
                    NextTab:Show()
                    task.defer(function()
                        if NextTab.Resize then
                            NextTab:Resize(true)
                        elseif NextTab.RefreshSides then
                            NextTab:RefreshSides()
                        end
                    end)
                elseif Info.Callback then
                    Info.Callback(Card)
                end
            end)

            task.defer(Tab.RefreshSides, Tab)

            return Card
        end

        Tab.addcard = Tab.AddCard

        function Tab:Hover(Hovering)
            if Library.ActiveTab == Tab then
                return
            end

            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = Hovering and 0.1 or (IsCardTabs and 0.2 or 0.5),
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = Hovering and 0.25 or 0.5,
                }):Play()
            end
        end

        function Tab:Show()
            if Library.ActiveTab then
                Library.ActiveTab:Hide()
            end

            TweenService:Create(TabButton, Library.TweenInfo, {
                BackgroundTransparency = GetBackgroundImageSurfaceTransparency(IsCardTabs and 0.02 or 0, "Panel"),
            }):Play()
            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = 0,
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = 0,
                }):Play()
            end

            if TabTitleMode == "active" then
                Window:ShowTabInfo(Name, Description or "")
            elseif TabTitleMode == "window" and Description then
                Window:ShowTabInfo(Name, Description)
            else
                Window:HideTabInfo()
            end

            TabContainer.Visible = true
            Tab:RefreshSides()

            Library.ActiveTab = Tab

            if Library.Searching then
                Library:UpdateSearch(Library.SearchText)
            end
        end

        function Tab:Hide()
            TweenService:Create(TabButton, Library.TweenInfo, {
                BackgroundTransparency = GetBackgroundImageSurfaceTransparency(IsCardTabs and 0.1 or 1, "Panel"),
            }):Play()
            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = 0.5,
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = 0.5,
                }):Play()
            end
            TabContainer.Visible = false

            Window:HideTabInfo()

            Library.ActiveTab = nil
        end

        function Tab:SetVisible(Visible: boolean)
            Tab.Visible = Visible == true
            TabButton.Visible = Tab.Visible and Tab.ShowInTabHolder ~= false

            if not Tab.Visible and Library.ActiveTab == Tab then
                Tab:Hide()
            end
        end

        --// Execution \\--
        if not Library.ActiveTab and ShowInTabHolder and InitialVisible then
            Tab:Show()
        end

        TabButton.MouseEnter:Connect(function()
            Tab:Hover(true)
        end)
        TabButton.MouseLeave:Connect(function()
            Tab:Hover(false)
        end)
        TabButton.MouseButton1Click:Connect(Tab.Show)

        Library.Tabs[Name] = Tab

        return Tab
    end

    function Window:AddHiddenTab(Info, Icon, Description)
        if typeof(Info) == "table" then
            Info.ShowInTabHolder = false
            Info.Hidden = true
        else
            Info = {
                Name = tostring(Info or "Hidden Tab"),
                Icon = Icon,
                Description = Description,
                ShowInTabHolder = false,
                Hidden = true,
            }
        end

        return Window:AddTab(Info)
    end

    function Window:AddDashboardTab(Info)
        Info = Info or {}

        local Dashboard = Window:AddTab({
            Name = Info.Name or "Dashboard",
            Icon = Info.Icon or "layout-dashboard",
            Description = Info.Description or "Overview, status, quick actions, and modded liquid-glass elements.",
        })

        local Overview = Dashboard:AddLeftGroupbox(Info.OverviewTitle or "Overview", "activity")
        Overview:AddGlassPanel("DashboardBanner", {
            Title = Info.HubTitle or Info.Title or (Info.HubName and (Info.HubName .. " Hub") or "Hub Overview"),
            Description = Info.HubDescription
                or Info.Text
                or "Welcome to your hub dashboard. Use this section to introduce your project, features, and community.",
            Icon = Info.HubIcon or Info.PanelIcon or "sparkles",
            Badge = Info.Badge or "LIVE",
            Height = Info.BannerHeight or 112,
            StrokeColor = Info.AccentColor or "AccentColor",
        })
        if Info.Advanced == true then
            Overview:AddPlayerCard("DashboardLocalPlayerCard", {
                Player = Info.Player or LocalPlayer,
                Footer = Info.PlayerFooter or "Local player detail",
            })
        end
        if Info.HubBanner then
            local BannerImage = Info.HubBanner
            if IsHttpUrl(BannerImage) then
                BannerImage = Library:DownloadImage(BannerImage, {
                    AssetName = "DashboardHubBanner_" .. HashString(BannerImage),
                    Extension = "png",
                })
            end

            local BannerSuccess = pcall(function()
                Overview:AddImage("DashboardHubBannerImage", {
                    Image = BannerImage,
                    ScaleType = Enum.ScaleType.Crop,
                    Size = UDim2.new(1, 0, 0, Info.HubBannerHeight or 110),
                    CornerRadius = math.max(4, Library.CornerRadius),
                })
            end)
            if not BannerSuccess then
                Overview:AddLabel({
                    Text = Info.HubBannerFallback or "Hub banner unavailable on this device.",
                    DoesWrap = true,
                })
            end
        end
        if Info.DiscordInvite then
            Overview:AddButton({
                Text = "Discord: " .. tostring(Info.DiscordInvite),
                Icon = "message-circle",
                Callback = function()
                    if setclipboard then
                        setclipboard(tostring(Info.DiscordInvite))
                        Library:NotifySuccess({
                            Title = "Copied",
                            Description = "Discord invite copied to clipboard.",
                            Time = 3,
                        })
                    else
                        Library:NotifyInfo({
                            Title = "Discord Invite",
                            Description = tostring(Info.DiscordInvite),
                            Time = 4,
                        })
                    end
                end,
            })
        end
        if typeof(Info.Socials) == "table" then
            for SocialName, SocialLink in Info.Socials do
                Overview:AddButton({
                    Text = tostring(SocialName) .. ": " .. tostring(SocialLink),
                    Icon = "link",
                    Callback = function()
                        if setclipboard then
                            setclipboard(tostring(SocialLink))
                            Library:NotifySuccess({
                                Title = "Copied",
                                Description = tostring(SocialName) .. " link copied to clipboard.",
                                Time = 3,
                            })
                        else
                            Library:NotifyInfo({
                                Title = tostring(SocialName),
                                Description = tostring(SocialLink),
                                Time = 4,
                            })
                        end
                    end,
                })
            end
        end

        local Stats = Dashboard:AddRightGroupbox(Info.StatsTitle or "Hub Stats", "bar-chart-3")
        Stats:AddGlassPanel("DashboardStats", {
            Title = "Session overview",
            Description = string.format(
                "Tabs loaded: %d\nDevice: %s\nInput: %s\nDPI scale: %d%%",
                GetTableSize(Library.Tabs),
                tostring(Library.DevicePlatform or "Unknown"),
                Library.IsHybridDevice and "Hybrid"
                    or (Library.IsMobile and "Touch" or "Mouse/Keyboard"),
                math.floor((Library.DPIScale or 1) * 100)
            ),
            Icon = "monitor",
            Height = 92,
            Badge = Library.IsHybridDevice and "HYBRID"
                or (Library.IsMobile and "MOBILE" or "DESKTOP"),
        })
        Stats:AddButton({
            Text = "Refresh hub overview",
            Callback = function()
                Options.DashboardStats:SetDescription(
                    string.format(
                        "Tabs loaded: %d\nDevice: %s\nInput: %s\nDPI scale: %d%%",
                        GetTableSize(Library.Tabs),
                        tostring(Library.DevicePlatform or "Unknown"),
                        Library.IsHybridDevice and "Hybrid"
                            or (Library.IsMobile and "Touch" or "Mouse/Keyboard"),
                        math.floor((Library.DPIScale or 1) * 100)
                    )
                )
            end,
        })
        Stats:AddButton({
            Text = "Open keybind menu",
            Icon = "key-round",
            Callback = function()
                if Library.KeybindFrame then
                    Library.KeybindFrame.Visible = true
                end
            end,
        })

        if Info.Advanced == true then
            Stats:AddGraph("DashboardActivityGraph", {
                Title = Info.GraphTitle or "Activity Graph",
                Values = Info.GraphValues or { 12, 18, 15, 26, 22, 34, 29, 41 },
                Height = Info.GraphHeight or 128,
                BackgroundTransparency = Info.GraphBackgroundTransparency or 0.08,
                GridLines = Info.GraphGridLines or 4,
                Smooth = Info.GraphSmooth ~= false,
                Area = Info.GraphArea ~= false,
                AreaTransparency = Info.GraphAreaTransparency or 0.88,
                Glow = Info.GraphGlow ~= false,
                GlowTransparency = Info.GraphGlowTransparency or 0.76,
                LineThickness = Info.GraphLineThickness or 3,
                PointSize = Info.GraphPointSize or 5,
            })

            Stats:AddTopUserBox("DashboardTopUsers", {
                Title = Info.TopUsersTitle or "Top Users",
                Subtitle = Info.TopUsersSubtitle or "Live dashboard ranking",
                Users = Info.TopUsers or {
                    { Name = LocalPlayer.Name, DisplayName = LocalPlayer.DisplayName, UserId = LocalPlayer.UserId, Score = 100 },
                },
                MaxUsers = Info.TopUsersMax or 4,
                OnUserClick = Info.OnTopUserClick
                    or function(User)
                        Library:NotifyInfo({
                            Title = tostring(User.DisplayName or User.Name or "Player"),
                            Description = string.format("Score: %s", tostring(User.Score or 0)),
                            Time = 2,
                        })
                    end,
            })

            local DetailTab = Window:AddHiddenTab({
                Name = Info.DetailTabName or "Dashboard Details",
                Icon = Info.DetailTabIcon or "panel-top-open",
                Description = Info.DetailTabDescription or "A hidden tab opened from a dashboard card.",
            })
            local DetailOverview = DetailTab:AddFullGroupbox(Info.DetailGroupTitle or "Full Detail Players", "user-round")
            DetailOverview:AddPlayerCard("DashboardDetailPlayerCard", {
                Player = Info.Player or LocalPlayer,
                Height = 120,
                Footer = "Opened from a hidden dashboard card",
            })
            DetailOverview:AddTopUserBox("DashboardDetailTopUsers", {
                Title = "Top User Box",
                Subtitle = "This tab is not shown in the tab holder",
                Users = Info.TopUsers or {
                    { Name = LocalPlayer.Name, DisplayName = LocalPlayer.DisplayName, UserId = LocalPlayer.UserId, Score = 100 },
                },
                MaxUsers = Info.TopUsersMax or 5,
            })

            Dashboard:AddCard({
                Side = Info.DetailCardSide or "Full",
                Title = Info.DetailCardTitle or "Open hidden player details",
                Desc = Info.DetailCardDescription or "Card tab index: opens a dedicated hidden tab without adding it to the tab holder.",
                Icon = "external-link",
                Height = Info.DetailCardHeight or 82,
                BarHeight = Info.DetailCardBarHeight or 82,
                BottomBarTransparency = Info.DetailCardTransparency or 0.12,
                DisableHoverGrow = true,
                LayoutOrder = Info.DetailCardLayoutOrder or -10,
                TargetTab = DetailTab,
                StrokeColor = "AccentColor",
                StrokeTransparency = 0.35,
            })
        end

        return Dashboard
    end

    function Window:AddKeyTab(...)
        local Name = nil
        local Icon = nil
        local Description = nil

        if select("#", ...) == 1 and typeof(...) == "table" then
            local Info = select(1, ...)
            Name = Info.Name or "Tab"
            Icon = Info.Icon
            Description = Info.Description
        else
            Name = select(1, ...) or "Tab"
            Icon = select(2, ...)
            Description = select(3, ...)
        end

        Icon = Icon or "key"

        local TabButton: TextButton
        local TabLabel
        local TabIcon

        local TabContainer

        Icon = if Icon == "key" then KeyIcon else Library:GetCustomIcon(Icon)
        do
            TabButton = New("TextButton", {
                BackgroundColor3 = "MainColor",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 40),
                Text = "",
                Parent = Tabs,
            })
            local ButtonPadding = New("UIPadding", {
                PaddingBottom = UDim.new(0, IsCompact and 6 or 11),
                PaddingLeft = UDim.new(0, IsCompact and 6 or 12),
                PaddingRight = UDim.new(0, IsCompact and 6 or 12),
                PaddingTop = UDim.new(0, IsCompact and 6 or 11),
                Parent = TabButton,
            })

            TabLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(30, 0),
                Size = UDim2.new(1, -30, 1, 0),
                Text = Name,
                TextSize = 16,
                TextTransparency = 0.5,
                TextXAlignment = Enum.TextXAlignment.Left,
                Visible = not IsCompact,
                Parent = TabButton,
            })

            if Icon then
                TabIcon = New("ImageLabel", {
                    Image = Icon.Url,
                    ImageColor3 = Icon.Custom and "WhiteColor" or "AccentColor",
                    ImageRectOffset = Icon.ImageRectOffset,
                    ImageRectSize = Icon.ImageRectSize,
                    ImageTransparency = 0.5,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = IsCompact and Enum.SizeConstraint.RelativeXY or Enum.SizeConstraint.RelativeYY,
                    Parent = TabButton,
                })
            end

            table.insert(Library.TabButtons, {
                Label = TabLabel,
                Padding = ButtonPadding,
                Icon = TabIcon,
            })

            --// Tab Container \\--
            TabContainer = New("ScrollingFrame", {
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                CanvasSize = UDim2.fromScale(0, 0),
                ScrollBarThickness = 0,
                Size = UDim2.fromScale(1, 1),
                Visible = false,
                Parent = Container,
            })
            New("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Parent = TabContainer,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1),
                Parent = TabContainer,
            })
        end

        --// Tab Table \\--
        local Tab = {
            Elements = {},
            Description = Description,
            IsKeyTab = true,
        }

        function Tab:AddKeyBox(...)
            local Args = { ... }
            local Info = {}
            local LegacyCallback = false

            if select("#", ...) == 1 and typeof(Args[1]) == "function" then
                Info.Callback = Args[1]
                LegacyCallback = true
            elseif select("#", ...) == 1 and typeof(Args[1]) == "table" then
                Info = Args[1]
            else
                Info.ExpectedKey = Args[1]
                Info.Callback = Args[2]
            end

            assert(typeof(Info.Callback) == "function", "Callback must be a function")

            local KeyBox = {
                ExpectedKey = Info.ExpectedKey,
                CaseSensitive = Info.CaseSensitive == true,
                AutoClear = Info.AutoClear == true,
                ClearOnSuccess = Info.ClearOnSuccess == true,
                LastKey = "",
                LastSuccess = false,
                Type = "KeyBox",
            }

            local ShowStatus = Info.ShowStatus ~= false
            local RowHeight = GetMobileHitSize(21)
            local Holder = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(0.75, 0, 0, ShowStatus and RowHeight + 22 or RowHeight),
                Parent = TabContainer,
            })

            local InputRow = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, RowHeight),
                Parent = Holder,
            })

            local Box = New("TextBox", {
                BackgroundColor3 = "MainColor",
                ClearTextOnFocus = Info.ClearTextOnFocus ~= false,
                PlaceholderText = Info.Placeholder or "Enter key",
                Size = UDim2.new(1, -71, 1, 0),
                Text = Info.Default or "",
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = InputRow,
            })
            New("UIPadding", {
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                Parent = Box,
            })
            New("UIStroke", {
                Color = "OutlineColor",
                Parent = Box,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                    Parent = Box,
                })
            )

            local Button = New("TextButton", {
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = "MainColor",
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.new(0, 63, 1, 0),
                Text = Info.ButtonText or "Execute",
                TextSize = 14,
                Parent = InputRow,
            })
            New("UIStroke", {
                Color = "OutlineColor",
                Parent = Button,
            })
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius / 2),
                    Parent = Button,
                })
            )

            local StatusLabel
            if ShowStatus then
                StatusLabel = New("TextLabel", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(0, 25),
                    Size = UDim2.new(1, 0, 0, 18),
                    Text = Info.StatusText or (Info.ExpectedKey and "Waiting for key..." or "Ready"),
                    TextColor3 = Info.StatusColor or "FontColor",
                    TextSize = 13,
                    TextTransparency = 0.25,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextWrapped = false,
                    Parent = Holder,
                })
            end

            local function NormalizeKey(Key)
                Key = tostring(Key or "")
                if KeyBox.CaseSensitive then
                    return Key
                end

                return Key:lower()
            end

            local function CheckKey(ReceivedKey)
                if KeyBox.ExpectedKey == nil or tostring(KeyBox.ExpectedKey) == "" then
                    return true
                end

                return NormalizeKey(ReceivedKey) == NormalizeKey(KeyBox.ExpectedKey)
            end

            function KeyBox:SetStatus(Text, Color)
                if not StatusLabel then
                    return
                end

                StatusLabel.Text = tostring(Text or "")
                local ResolvedColor = GetSchemeValue(Color) or Color
                if typeof(ResolvedColor) == "Color3" then
                    StatusLabel.TextColor3 = ResolvedColor
                end
            end

            function KeyBox:SetExpectedKey(ExpectedKey)
                KeyBox.ExpectedKey = ExpectedKey
                KeyBox:SetStatus(ExpectedKey and "Waiting for key..." or "Ready", Library.Scheme.FontColor)
            end

            function KeyBox:SetValue(Value)
                Box.Text = tostring(Value or "")
            end

            function KeyBox:GetValue()
                return Box.Text
            end

            function KeyBox:Submit()
                local ReceivedKey = Box.Text
                local Success = CheckKey(ReceivedKey)

                KeyBox.LastKey = ReceivedKey
                KeyBox.LastSuccess = Success

                if Success then
                    KeyBox:SetStatus(Info.SuccessText or "Key accepted", Color3.fromRGB(34, 197, 94))
                else
                    KeyBox:SetStatus(Info.FailureText or "Invalid key", Color3.fromRGB(239, 68, 68))
                end

                if LegacyCallback then
                    Library:SafeCallback(Info.Callback, ReceivedKey)
                else
                    Library:SafeCallback(Info.Callback, Success, ReceivedKey, KeyBox)
                end

                if KeyBox.AutoClear or (Success and KeyBox.ClearOnSuccess) then
                    Box.Text = ""
                end
            end

            -- MouseButton1Click is reliable on desktop and avoids coordinate issues.
            Button.MouseButton1Click:Connect(function()
                KeyBox:Submit()
            end)

            -- InputBegan apenas para Touch (mobile) -- garante compatibilidade com dispositivos touch
            Button.InputBegan:Connect(function(Input)
                if Input.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end

                if not Library:MouseIsOverFrame(Button, Input.Position) then
                    return
                end

                KeyBox:Submit()
            end)

            Box.FocusLost:Connect(function(EnterPressed)
                if EnterPressed then
                    KeyBox:Submit()
                end
            end)

            return KeyBox
        end

        function Tab:RefreshSides() end
        function Tab:Resize() end
        function Tab:UpdateCorners() end

        function Tab:Hover(Hovering)
            if Library.ActiveTab == Tab then
                return
            end

            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = Hovering and 0.25 or 0.5,
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = Hovering and 0.25 or 0.5,
                }):Play()
            end
        end

        function Tab:Show()
            if Library.ActiveTab then
                Library.ActiveTab:Hide()
            end

            TweenService:Create(TabButton, Library.TweenInfo, {
                BackgroundTransparency = 0,
            }):Play()
            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = 0,
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = 0,
                }):Play()
            end
            TabContainer.Visible = true

            if TabTitleMode == "active" then
                Window:ShowTabInfo(Name, Description or "")
            elseif TabTitleMode == "window" and Description then
                Window:ShowTabInfo(Name, Description)
            else
                Window:HideTabInfo()
            end

            Tab:RefreshSides()

            Library.ActiveTab = Tab

            if Library.Searching then
                Library:UpdateSearch(Library.SearchText)
            end
        end

        function Tab:Hide()
            TweenService:Create(TabButton, Library.TweenInfo, {
                BackgroundTransparency = 1,
            }):Play()
            TweenService:Create(TabLabel, Library.TweenInfo, {
                TextTransparency = 0.5,
            }):Play()
            if TabIcon then
                TweenService:Create(TabIcon, Library.TweenInfo, {
                    ImageTransparency = 0.5,
                }):Play()
            end
            TabContainer.Visible = false

            Window:HideTabInfo()

            Library.ActiveTab = nil
        end

        function Tab:SetVisible(Visible: boolean)
            TabButton.Visible = Visible

            if not Visible and Library.ActiveTab == Tab then
                Tab:Hide()
            end
        end

        --// Execution \\--
        if not Library.ActiveTab then
            Tab:Show()
        end

        TabButton.MouseEnter:Connect(function()
            Tab:Hover(true)
        end)
        TabButton.MouseLeave:Connect(function()
            Tab:Hover(false)
        end)
        TabButton.MouseButton1Click:Connect(Tab.Show)

        Tab.Container = TabContainer
        setmetatable(Tab, BaseGroupbox)

        Library.Tabs[Name] = Tab

        return Tab
    end

    function Window:AddDialog(Idx, Info)
        if typeof(Idx) == "table" and Info == nil then
            Info = Idx
            Idx = Info.Id
        end

        if not Idx then
            Library.DialogCounter += 1
            Idx = "Dialog_" .. tostring(Library.DialogCounter)
        end

        Info = Library:Validate(Info, Templates.Dialog)
        local OverlayTransparency = math.clamp(tonumber(Info.OverlayTransparency) or 0.5, 0, 1)

        local DialogFrame
        local DialogOverlay
        local DialogContainer
        local ButtonsHolder
        local FooterButtonsList = {}

        DialogOverlay = New("TextButton", {
            AutoButtonColor = false,
            BackgroundColor3 = "DarkColor",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            Active = false,
            ZIndex = 9000,
            Visible = true,
            Parent = MainFrame,
        })
        TweenService:Create(DialogOverlay, Library.TweenInfo, {
            BackgroundTransparency = OverlayTransparency,
        }):Play()

        DialogFrame = New("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = "BackgroundColor",
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(300, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            ClipsDescendants = true,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 9001,
            Parent = DialogOverlay,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, WindowInfo.CornerRadius),
                Parent = DialogFrame,
            })
        )
        Library:AddOutline(DialogFrame, {
            Rainbow = Info.RainbowBorder,
            RainbowTarget = "Popups",
        })

        local InnerContainer = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            ZIndex = 9002,
            Parent = DialogFrame,
        })
        local DialogScale = New("UIScale", {
            Scale = 0.95,
            Parent = DialogFrame,
        })
        TweenService:Create(DialogScale, Library.TweenInfo, {
            Scale = 1,
        }):Play()
        local _InnerPadding = New("UIPadding", {
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
            Parent = InnerContainer,
        })
        local _InnerLayout = New("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = InnerContainer,
        })

        local HeaderContainer = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = 1,
            ZIndex = 9002,
            Parent = InnerContainer,
        })
        New("UIListLayout", {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = HeaderContainer,
        })
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 5),
            Parent = HeaderContainer,
        })

        local TitleRow = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 20),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = 1,
            ZIndex = 9002,
            Parent = HeaderContainer,
        })
        New("UIListLayout", {
            Padding = UDim.new(0, 6),
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = TitleRow,
        })

        if Info.Icon then
            local ParsedIcon = Library:GetCustomIcon(Info.Icon)
            if ParsedIcon then
                local IconImg = New("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(16, 16),
                    Image = ParsedIcon.Url,
                    ImageColor3 = "FontColor",
                    ImageRectOffset = ParsedIcon.ImageRectOffset,
                    ImageRectSize = ParsedIcon.ImageRectSize,
                    LayoutOrder = 1,
                    ZIndex = 9002,
                    Parent = TitleRow,
                })
                if Info.TitleColor then
                    IconImg.ImageColor3 = Info.TitleColor
                end
            end
        end

        local TitleLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = Info.Title,
            TextSize = 18,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = 2,
            ZIndex = 9002,
            Parent = TitleRow,
        })
        if Info.TitleColor then
            TitleLabel.TextColor3 = Info.TitleColor
        end

        local DescriptionLabel = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 14),
            AutomaticSize = Enum.AutomaticSize.Y,
            Text = Info.Description,
            TextSize = 14,
            TextTransparency = Info.DescriptionColor and 0 or 0.2,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            LayoutOrder = 2,
            ZIndex = 9002,
            Parent = HeaderContainer,
        })
        if Info.DescriptionColor then
            DescriptionLabel.TextColor3 = Info.DescriptionColor
        end

        DialogContainer = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = 4,
            ZIndex = 9002,
            Parent = InnerContainer,
        })
        local _DialogContainerLayout = New("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = DialogContainer,
        })
        New("UIPadding", {
            PaddingBottom = UDim.new(0, 5),
            Parent = DialogContainer,
        })

        local _Sep2 = New("Frame", {
            BackgroundColor3 = "OutlineColor",
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 1),
            LayoutOrder = 5,
            ZIndex = 9002,
            Parent = InnerContainer,
        })

        ButtonsHolder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = 6,
            ZIndex = 9002,
            Parent = InnerContainer,
        })
        New("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            Wraps = true,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = ButtonsHolder,
        })
        New("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            Parent = ButtonsHolder,
        })

        local Dialog = {
            Elements = {},
            Container = DialogContainer,
        }

        function Dialog:Resize()
            local MaxWidth = MainFrame.AbsoluteSize.X * 0.75
            local MinWidth = 400

            local TotalButtonWidth = 0
            local ButtonCount = 0
            local HasButtons = false

            for _, BtnWrap in FooterButtonsList do
                HasButtons = true
                ButtonCount = ButtonCount + 1
                TotalButtonWidth = TotalButtonWidth + BtnWrap.Container.Size.X.Offset
            end

            local TargetWidth = MinWidth
            if HasButtons then
                local RequiredWidth = TotalButtonWidth + ((ButtonCount - 1) * 8) + 30
                TargetWidth = math.max(MinWidth, math.min(RequiredWidth, MaxWidth))
            end

            DialogFrame.Size = UDim2.fromOffset(TargetWidth, 0)

            local _DescX, DescY =
                Library:GetTextBounds(DescriptionLabel.Text, Library.Scheme.Font, 14, TargetWidth - 30)
            DescriptionLabel.Size = UDim2.new(1, 0, 0, DescY)

            local HasElements = false
            for _, v in DialogContainer:GetChildren() do
                if not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
                    HasElements = true
                    break
                end
            end
            DialogContainer.Visible = HasElements

            ButtonsHolder.Visible = HasButtons
            _Sep2.Visible = HasButtons
        end

        function Dialog:SetTitle(Title)
            TitleLabel.Text = Title
            Dialog:Resize()
        end

        function Dialog:SetDescription(Description)
            DescriptionLabel.Text = Description
            Dialog:Resize()
        end

        function Dialog:Dismiss()
            Library.ActiveDialog = nil
            local CloseTween = TweenService:Create(DialogScale, Library.TweenInfo, { Scale = 0.95 })
            TweenService:Create(DialogOverlay, Library.TweenInfo, { BackgroundTransparency = 1 }):Play()
            CloseTween:Play()

            task.delay(Library.TweenInfo.Time, function()
                DialogOverlay:Destroy()
            end)
            Library.Dialogues[Idx] = nil
        end

        DialogOverlay.MouseButton1Click:Connect(function()
            if Info.OutsideClickDismiss then
                Dialog:Dismiss()
            end
        end)

        function Dialog:RemoveFooterButton(ButtonIdx)
            if FooterButtonsList[ButtonIdx] then
                FooterButtonsList[ButtonIdx].Container:Destroy()
                FooterButtonsList[ButtonIdx] = nil
            end
        end

        function Dialog:SetButtonDisabled(ButtonIdx, Disabled)
            if FooterButtonsList[ButtonIdx] and type(FooterButtonsList[ButtonIdx].SetDisabled) == "function" then
                FooterButtonsList[ButtonIdx]:SetDisabled(Disabled)
            end
        end

        function Dialog:SetButtonOrder(ButtonIdx, Order)
            if FooterButtonsList[ButtonIdx] and FooterButtonsList[ButtonIdx].Container then
                FooterButtonsList[ButtonIdx].Container.LayoutOrder = Order
            end
        end

        function Dialog:AddFooterButton(ButtonIdx, ButtonInfo)
            Dialog:RemoveFooterButton(ButtonIdx)

            local WaitTime = ButtonInfo.WaitTime or 0

            local ButtonContainer = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(0, 26),
                LayoutOrder = ButtonInfo.Order or 0,
                ZIndex = 9002,
                Parent = ButtonsHolder,
            })

            local BtnColor = "MainColor"
            local BtnOutline = "OutlineColor"
            local Variant = ButtonInfo.Variant or "Primary"

            if Variant == "Primary" then
                BtnColor = "FontColor"
                BtnOutline = "FontColor"
            elseif Variant == "Secondary" then
                BtnColor = "MainColor"
                BtnOutline = "OutlineColor"
            elseif Variant == "Destructive" then
                BtnColor = "DestructiveColor"
                BtnOutline = "DestructiveColor"
            elseif Variant == "Ghost" then
                BtnColor = "BackgroundColor"
                BtnOutline = "BackgroundColor"
            end

            local TextBtn = New("TextButton", {
                BackgroundColor3 = BtnColor,
                BorderColor3 = BtnOutline,
                BackgroundTransparency = WaitTime > 0 and 0.5 or 0,
                Size = UDim2.fromOffset(0, 26),
                Text = "",
                AutoButtonColor = false,
                ZIndex = 9002,
                Parent = ButtonContainer,
            })
            Library:AddOutline(TextBtn)
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius),
                    Parent = TextBtn,
                })
            )

            local _BtnPadding = New("UIPadding", {
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15),
                Parent = TextBtn,
            })

            local TextColor = Library.Scheme.FontColor
            if Variant == "Primary" then
                TextColor = Library.Scheme.BackgroundColor
            elseif Variant == "Destructive" then
                TextColor = Color3.new(1, 1, 1)
            end

            local BtnLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = ButtonInfo.Title or ButtonIdx,
                TextColor3 = TextColor,
                TextTransparency = WaitTime > 0 and 0.5 or 0,
                TextSize = 14,
                ZIndex = 9002,
                Parent = TextBtn,
            })

            local LabelX, _ = Library:GetTextBounds(BtnLabel.Text, Library.Scheme.Font, 14, 250)
            ButtonContainer.Size = UDim2.fromOffset(LabelX + 30, 26)
            TextBtn.Size = UDim2.fromOffset(LabelX + 30, 26)

            local ProgressBar
            if WaitTime > 0 then
                ProgressBar = New("Frame", {
                    BackgroundColor3 = "AccentColor",
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 0, 1, -2),
                    Size = UDim2.new(0, 0, 0, 2),
                    ZIndex = 2,
                    Parent = TextBtn,
                })
                table.insert(
                    Library.Corners,
                    New("UICorner", {
                        CornerRadius = UDim.new(0, Library.CornerRadius),
                        Parent = ProgressBar,
                    })
                )
            end

            local IsActive = WaitTime <= 0

            local ButtonWrap = {
                Container = ButtonContainer,
                SetDisabled = function(self, Disabled)
                    IsActive = not Disabled
                    if Disabled then
                        TweenService:Create(TextBtn, Library.TweenInfo, { BackgroundTransparency = 0.5 }):Play()
                        TweenService:Create(BtnLabel, Library.TweenInfo, { TextTransparency = 0.5 }):Play()
                    else
                        TweenService:Create(TextBtn, Library.TweenInfo, { BackgroundTransparency = 0 }):Play()
                        TweenService:Create(BtnLabel, Library.TweenInfo, { TextTransparency = 0 }):Play()
                    end
                end,
            }

            local ActiveColor = typeof(BtnColor) == "Color3" and BtnColor or Library.Scheme[BtnColor]
            local HoverColor = Variant == "Ghost" and Library.Scheme.MainColor
                or Library:GetBetterColor(ActiveColor, 10)

            TextBtn.MouseEnter:Connect(function()
                if not IsActive then
                    return
                end
                TweenService:Create(TextBtn, Library.TweenInfo, {
                    BackgroundColor3 = HoverColor,
                }):Play()
            end)
            TextBtn.MouseLeave:Connect(function()
                if not IsActive then
                    return
                end
                TweenService:Create(TextBtn, Library.TweenInfo, {
                    BackgroundColor3 = ActiveColor,
                }):Play()
            end)

            TextBtn.MouseButton1Click:Connect(function()
                if not IsActive then
                    return
                end
                if ButtonInfo.Callback then
                    ButtonInfo.Callback(Dialog)
                end
                if Info.AutoDismiss then
                    Dialog:Dismiss()
                end
            end)

            if WaitTime > 0 then
                TweenService:Create(ProgressBar, TweenInfo.new(WaitTime, Enum.EasingStyle.Linear), {
                    Size = UDim2.new(1, 0, 0, 2),
                }):Play()

                task.delay(WaitTime, function()
                    ButtonWrap:SetDisabled(false)
                    if ProgressBar then
                        TweenService:Create(ProgressBar, Library.TweenInfo, {
                            BackgroundTransparency = 1,
                        }):Play()
                    end
                end)
            end

            FooterButtonsList[ButtonIdx] = ButtonWrap
        end

        for BIdx, BInfo in Info.FooterButtons do
            if type(BIdx) == "number" and BInfo.Id then
                BIdx = BInfo.Id
            end
            Dialog:AddFooterButton(BIdx, BInfo)
        end

        setmetatable(Dialog, BaseGroupbox)
        Library.Dialogues[Idx] = Dialog

        Dialog:Resize()

        Library.ActiveDialog = Dialog
        return Dialog
    end

    function Window:ShowDialog(Info)
        return Window:AddDialog(Info)
    end

    Window.Dialog = Window.ShowDialog

    function Window:AddPopup(Info, Time)
        return Library:CreatePopup(Info, Time)
    end

    Window.ShowPopup = Window.AddPopup
    Window.Popup = Window.AddPopup

    function Window:Toggle(Value: boolean?)
        if Library.ActiveLoading then
            if Value == true then
                return
            end

            if not Library.Toggled then
                return
            end
        end

        if typeof(Value) == "boolean" then
            Library.Toggled = Value
        else
            Library.Toggled = not Library.Toggled
        end

        MainFrame.Visible = Library.Toggled

        if SearchBox and SearchBox:IsFocused() and not Library.Toggled then
            SearchBox:ReleaseFocus()
        end

        if WindowInfo.UnlockMouseWhileOpen then
            ModalElement.Modal = Library.Toggled
        end

        if Library.Toggled and not Library.IsMobile then
            local OldMouseIconEnabled = UserInputService.MouseIconEnabled
            local ShowCursorBinding = Library.ShowCursorBinding
            pcall(function()
                RunService:UnbindFromRenderStep(ShowCursorBinding)
            end)
            RunService:BindToRenderStep(ShowCursorBinding, Enum.RenderPriority.Last.Value, function()
                UserInputService.MouseIconEnabled = not Library.ShowCustomCursor

                Cursor.Position = UDim2.fromOffset(Mouse.X, Mouse.Y)
                Cursor.Visible = Library.ShowCustomCursor

                if not (Library.Toggled and ScreenGui and ScreenGui.Parent) then
                    UserInputService.MouseIconEnabled = OldMouseIconEnabled
                    Cursor.Visible = false
                    RunService:UnbindFromRenderStep(ShowCursorBinding)
                end
            end)
        elseif not Library.Toggled then
            ReleaseFocusedTextBoxes()
            TooltipLabel.Visible = false

            for _, Option in Library.Options do
                if Option.Type == "ColorPicker" then
                    Option.ColorMenu:Close()
                    Option.ContextMenu:Close()
                elseif Option.Type == "Dropdown" or Option.Type == "KeyPicker" then
                    Option.Menu:Close()
                end
            end
        end
    end

    function Library:Toggle(Value: boolean?)
        return Window:Toggle(Value)
    end

    if WindowInfo.EnableSidebarResize then
        local Threshold = (WindowInfo.MinSidebarWidth + WindowInfo.SidebarCompactWidth)
            * WindowInfo.SidebarCollapseThreshold
        local StartPos, StartWidth
        local Dragging = false
        local Changed

        local SidebarGrabber = New("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.new(0, 8, 1, 0),
            Text = "",
            Parent = DividerLine,
        })
        SidebarGrabber.MouseEnter:Connect(function()
            TweenService:Create(DividerLine, Library.TweenInfo, {
                BackgroundColor3 = Library:GetLighterColor(Library.Scheme.OutlineColor),
            }):Play()
        end)
        SidebarGrabber.MouseLeave:Connect(function()
            if Dragging then
                return
            end
            TweenService:Create(DividerLine, Library.TweenInfo, {
                BackgroundColor3 = Library.Scheme.OutlineColor,
            }):Play()
        end)

        SidebarGrabber.InputBegan:Connect(function(Input: InputObject)
            if not IsClickInput(Input) then
                return
            end

            Library.CantDragForced = true

            StartPos = Input.Position
            StartWidth = Window:GetSidebarWidth()
            Dragging = true

            Changed = Input.Changed:Connect(function()
                if Input.UserInputState ~= Enum.UserInputState.End then
                    return
                end

                Library.CantDragForced = false
                TweenService:Create(DividerLine, Library.TweenInfo, {
                    BackgroundColor3 = Library.Scheme.OutlineColor,
                }):Play()

                Dragging = false
                if Changed and Changed.Connected then
                    Changed:Disconnect()
                    Changed = nil
                end
            end)
        end)

        Library:GiveSignal(UserInputService.InputChanged:Connect(function(Input: InputObject)
            if not Library.Toggled or not (ScreenGui and ScreenGui.Parent) then
                Dragging = false
                if Changed and Changed.Connected then
                    Changed:Disconnect()
                    Changed = nil
                end

                return
            end

            if Dragging and IsHoverInput(Input) then
                local Delta = Input.Position - StartPos
                local Width = StartWidth + Delta.X

                if WindowInfo.DisableCompactingSnap then
                    Window:SetSidebarWidth(Width)
                    return
                end

                if Width > Threshold then
                    Window:SetSidebarWidth(math.max(Width, WindowInfo.MinSidebarWidth))
                else
                    Window:SetSidebarWidth(WindowInfo.SidebarCompactWidth)
                end
            end
        end))
    end
    if WindowInfo.EnableCompacting and WindowInfo.SidebarCompacted then
        Window:SetSidebarWidth(WindowInfo.SidebarCompactWidth)
    end
    if WindowInfo.AutoShow and not Library.ActiveLoading then
        task.spawn(Library.Toggle)
    end

    if Library.IsMobile then
        Library:SetupPlatformButtons(WindowInfo, "Mobile")
    elseif Library.IsDesktop then
        Library:SetupPlatformButtons(WindowInfo, "Desktop")
    end

    --// Execution \\--
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        Library:UpdateSearch(SearchBox.Text)
    end)

    Library:GiveSignal(UserInputService.InputBegan:Connect(function(Input: InputObject)
        if Library.Unloaded then
            return
        end

        if UserInputService:GetFocusedTextBox() then
            return
        end

        if
            Library.IsDesktop
            and Library.EnableEscapeToClose
            and Input.KeyCode == Enum.KeyCode.Escape
        then
            if Library:CloseOpenMenus() then
                return
            end

            if Library.Toggled then
                Library:Toggle(false)
            end
            return
        end

        if
            (
                typeof(Library.ToggleKeybind) == "table"
                and Library.ToggleKeybind.Type == "KeyPicker"
                and Input.KeyCode.Name == Library.ToggleKeybind.Value
            ) or Input.KeyCode == Library.ToggleKeybind
        then
            Library.Toggle()
        end
    end))

    Library:GiveSignal(UserInputService.WindowFocused:Connect(function()
        Library.IsRobloxFocused = true
    end))
    Library:GiveSignal(UserInputService.WindowFocusReleased:Connect(function()
        Library.IsRobloxFocused = false
    end))

    Library.Window = Window
    table.insert(Library.Windows, Window)

    return Window
end

function Library:SetGradient(Enabled: boolean, GradientInfo)
    local Window = Library.Window
    if Window and Window.SetGradient then
        return Window:SetGradient(Enabled, GradientInfo)
    end
end

Library.SetWindowGradient = Library.SetGradient

function Library:CreateLoading(LoadingInfo)
    if Library.ActiveLoading then
        warn("Loading GUI already exists, you cannot create multiple Loading GUIs.")
        return Library.ActiveLoading
    end

    LoadingInfo = Library:Validate(LoadingInfo, Templates.Loading)
    LoadingInfo.Animated = LoadingInfo.Animated ~= false and LoadingInfo.DisableAnimation ~= true
    if LoadingInfo.AppearAnimation ~= nil then
        LoadingInfo.EntranceAnimation = LoadingInfo.AppearAnimation
    end
    if LoadingInfo.DisappearAnimation ~= nil then
        LoadingInfo.ExitAnimation = LoadingInfo.DisappearAnimation
    end
    if LoadingInfo.DisableAppearAnimation == true then
        LoadingInfo.EntranceAnimation = false
    end
    if LoadingInfo.DisableDisappearAnimation == true then
        LoadingInfo.ExitAnimation = false
    end
    local ShowLoadingIcon = LoadingInfo.ShowLoadingIcon == true
        or LoadingInfo.CenterIcon == true
        or LoadingInfo.LoadingIconVisible == true

    local Loading = {
        CurrentStep = LoadingInfo.CurrentStep,
        TotalSteps = math.max(1, LoadingInfo.TotalSteps),

        ShowSidebar = LoadingInfo.ShowSidebar,
        AutoResizeHeight = LoadingInfo.AutoResizeHeight,
        IsError = false,
        Destroyed = false,

        WindowWidth = LoadingInfo.WindowWidth,
        WindowHeight = LoadingInfo.WindowHeight,
        BaseWindowHeight = LoadingInfo.WindowHeight,
        WindowErrorHeight = LoadingInfo.WindowHeight,

        ContentWidth = LoadingInfo.ContentWidth,
        SidebarWidth = LoadingInfo.SidebarWidth,
    }

    local LoadingAnimations = {
        Tweens = {},
        Connections = {},
        Running = true,
    }

    local function TrackTween(TweenObjectInstance: Tween)
        table.insert(LoadingAnimations.Tweens, TweenObjectInstance)
        TweenObjectInstance:Play()
        return TweenObjectInstance
    end

    local function TrackConnection(Connection: RBXScriptConnection)
        table.insert(LoadingAnimations.Connections, Connection)
        return Connection
    end

    local function TweenObject(Object, Info, Properties)
        return TrackTween(TweenService:Create(Object, Info, Properties))
    end

    local function StopLoadingAnimations()
        LoadingAnimations.Running = false
        for _, TweenObjectInstance in LoadingAnimations.Tweens do
            pcall(function()
                TweenObjectInstance:Cancel()
                TweenObjectInstance:Destroy()
            end)
        end
        table.clear(LoadingAnimations.Tweens)

        for _, Connection in LoadingAnimations.Connections do
            if Connection.Connected then
                Connection:Disconnect()
            end
        end
        table.clear(LoadingAnimations.Connections)
    end

    local BackdropTransparency = math.clamp(tonumber(LoadingInfo.BackdropTransparency) or 0.35, 0, 1)
    local SurfaceTransparency = math.clamp(tonumber(LoadingInfo.SurfaceTransparency) or 0, 0, 1)
    local SurfaceFillTransparency = math.clamp(tonumber(LoadingInfo.SurfaceFillTransparency) or SurfaceTransparency, 0, 1)
    local ParticleCount = math.clamp(math.floor(tonumber(LoadingInfo.ParticleCount) or 0), 0, 48)

    local DefaultProgressTextureImage = CustomImageManager.GetAsset("LoadingBarPixelTextureV2")
    local function ResolveLoadingImageAsset(Image, Prefix, Fallback)
        if Image == nil or Image == "" then
            return Fallback
        end

        if tonumber(Image) then
            return string.format("rbxassetid://%s", tostring(Image))
        elseif IsHttpUrl(Image) then
            local DownloadedImage = Library:DownloadImage(Image, {
                AssetName = (Prefix or "LoadingImage_") .. HashString(Image),
                Extension = "png",
            })

            if IsHttpUrl(DownloadedImage) and Fallback then
                return Fallback
            end

            return DownloadedImage
        end

        return Image or Fallback
    end

    local function ResolveLoadingImageFrames(Images, Prefix, Fallback)
        local Frames = {}

        if typeof(Images) == "table" then
            for Index, Image in Images do
                local ResolvedImage = ResolveLoadingImageAsset(Image, string.format("%s%d_", Prefix or "LoadingFrame_", Index))
                if ResolvedImage and ResolvedImage ~= "" then
                    table.insert(Frames, ResolvedImage)
                end
            end
        elseif Images then
            local ResolvedImage = ResolveLoadingImageAsset(Images, Prefix or "LoadingFrame_")
            if ResolvedImage and ResolvedImage ~= "" then
                table.insert(Frames, ResolvedImage)
            end
        end

        if #Frames == 0 and Fallback then
            if typeof(Fallback) == "table" then
                for _, Image in Fallback do
                    if Image and Image ~= "" then
                        table.insert(Frames, Image)
                    end
                end
            elseif Fallback ~= "" then
                table.insert(Frames, Fallback)
            end
        end

        return Frames
    end

    local function ResolveLoadingColor(Value, Fallback)
        local SchemeValue = GetSchemeValue(Value)
        if SchemeValue then
            return SchemeValue
        end

        if typeof(Value) == "Color3" then
            return Value
        end

        return Fallback or Library.Scheme.AccentColor
    end

    local function NormalizeSequenceKeypoints(Keypoints, DefaultValue)
        if #Keypoints == 0 then
            table.insert(Keypoints, NumberSequenceKeypoint.new(0, DefaultValue or 0))
            table.insert(Keypoints, NumberSequenceKeypoint.new(1, DefaultValue or 0))
        end

        table.sort(Keypoints, function(Left, Right)
            return Left.Time < Right.Time
        end)

        if Keypoints[1].Time > 0 then
            table.insert(Keypoints, 1, NumberSequenceKeypoint.new(0, Keypoints[1].Value))
        end

        if Keypoints[#Keypoints].Time < 1 then
            table.insert(Keypoints, NumberSequenceKeypoint.new(1, Keypoints[#Keypoints].Value))
        end

        return Keypoints
    end

    local function NormalizeColorKeypoints(Keypoints)
        if #Keypoints == 0 then
            table.insert(Keypoints, ColorSequenceKeypoint.new(0, Library.Scheme.AccentColor))
            table.insert(Keypoints, ColorSequenceKeypoint.new(1, Library.Scheme.BackgroundColor))
        end

        table.sort(Keypoints, function(Left, Right)
            return Left.Time < Right.Time
        end)

        if Keypoints[1].Time > 0 then
            table.insert(Keypoints, 1, ColorSequenceKeypoint.new(0, Keypoints[1].Value))
        end

        if Keypoints[#Keypoints].Time < 1 then
            table.insert(Keypoints, ColorSequenceKeypoint.new(1, Keypoints[#Keypoints].Value))
        end

        return Keypoints
    end

    local function BuildLoadingTransparencySequence(Stops)
        if typeof(Stops) == "NumberSequence" then
            return Stops
        elseif typeof(Stops) == "number" then
            return NumberSequence.new(math.clamp(Stops, 0, 1))
        end

        local Keypoints = {}
        if typeof(Stops) == "table" then
            for Index, Stop in Stops do
                local Position = (#Stops <= 1) and 0 or ((Index - 1) / (#Stops - 1))
                local Value = 0

                if typeof(Stop) == "NumberSequenceKeypoint" then
                    Position = Stop.Time
                    Value = Stop.Value
                elseif typeof(Stop) == "table" then
                    Position = tonumber(Stop.Position or Stop.Time or Stop.Point or Stop[1]) or Position
                    Value = tonumber(Stop.Value or Stop.Transparency or Stop.Alpha or Stop[2]) or Value
                elseif tonumber(Stop) then
                    Value = tonumber(Stop) or Value
                end

                table.insert(
                    Keypoints,
                    NumberSequenceKeypoint.new(math.clamp(Position, 0, 1), math.clamp(Value, 0, 1))
                )
            end
        end

        return NumberSequence.new(NormalizeSequenceKeypoints(Keypoints, 0))
    end

    local function BuildLoadingGradientSequences(ColorStops, TransparencyStops)
        local ColorKeypoints = {}

        if typeof(ColorStops) ~= "table" or #ColorStops == 0 then
            ColorStops = {
                { 125, 85, 255, 0 },
                { 125, 85, 255, 0.22 },
                { 255, 255, 255, 0.5 },
                { 65, 210, 255, 0.78 },
                { 65, 210, 255, 1 },
            }
        end

        for Index, Stop in ColorStops do
            local Position = (#ColorStops <= 1) and 0 or ((Index - 1) / (#ColorStops - 1))
            local Color = Library.Scheme.AccentColor

            if typeof(Stop) == "table" then
                Position = tonumber(Stop.Position or Stop.Time or Stop.Point or Stop[4]) or Position

                if typeof(Stop.Color or Stop.Color3) == "Color3" then
                    Color = Stop.Color or Stop.Color3
                elseif Stop.Color or Stop.Color3 then
                    Color = ResolveLoadingColor(Stop.Color or Stop.Color3, Color)
                elseif tonumber(Stop[1]) and tonumber(Stop[2]) and tonumber(Stop[3]) then
                    Color = Color3.fromRGB(
                        math.clamp(math.floor(tonumber(Stop[1]) or 0), 0, 255),
                        math.clamp(math.floor(tonumber(Stop[2]) or 0), 0, 255),
                        math.clamp(math.floor(tonumber(Stop[3]) or 0), 0, 255)
                    )
                end
            elseif typeof(Stop) == "Color3" then
                Color = Stop
            end

            table.insert(ColorKeypoints, ColorSequenceKeypoint.new(math.clamp(Position, 0, 1), Color))
        end

        return ColorSequence.new(NormalizeColorKeypoints(ColorKeypoints)),
            BuildLoadingTransparencySequence(TransparencyStops)
    end

    local ImageFrameAnimationTokens = {}
    local function StopImageFrameAnimation(TokenKey)
        if TokenKey then
            ImageFrameAnimationTokens[TokenKey] = (ImageFrameAnimationTokens[TokenKey] or 0) + 1
        end
    end

    local function StartImageFrameAnimation(ImageObject, Frames, FrameRate, TokenKey)
        StopImageFrameAnimation(TokenKey)

        if
            not LoadingInfo.Animated
            or typeof(ImageObject) ~= "Instance"
            or not (ImageObject:IsA("ImageLabel") or ImageObject:IsA("ImageButton"))
            or typeof(Frames) ~= "table"
            or #Frames < 2
        then
            return
        end

        FrameRate = math.clamp(tonumber(FrameRate) or 30, 1, 60)
        local Token = TokenKey and ImageFrameAnimationTokens[TokenKey] or nil

        task.spawn(function()
            local Index = 1
            local FrameStep = 1 / FrameRate
            local Accumulator = 0
            ImageObject.Image = Frames[Index]

            while
                LoadingAnimations.Running
                and ImageObject.Parent
                and (not TokenKey or ImageFrameAnimationTokens[TokenKey] == Token)
            do
                Accumulator += RunService.RenderStepped:Wait()

                while Accumulator >= FrameStep do
                    Index = (Index % #Frames) + 1
                    Accumulator -= FrameStep
                end

                ImageObject.Image = Frames[Index]
            end
        end)
    end

    local UseProgressTexture = LoadingInfo.ProgressTexture or LoadingInfo.ProgressShine
        or typeof(LoadingInfo.ProgressTextureFrames) == "table"
    local ProgressTextureTransparency = math.clamp(tonumber(LoadingInfo.ProgressTextureTransparency) or 0.42, 0, 1)
    local ProgressTextureSpeed = math.max(0, tonumber(LoadingInfo.ProgressTextureSpeed) or 0)
    local ProgressTextureImage =
        ResolveLoadingImageAsset(LoadingInfo.ProgressTextureImage, "LoadingBarTexture_", DefaultProgressTextureImage)
    local ProgressTextureFrames =
        ResolveLoadingImageFrames(LoadingInfo.ProgressTextureFrames, "LoadingBarFrame_", ProgressTextureImage)
    if #ProgressTextureFrames > 0 then
        ProgressTextureImage = ProgressTextureFrames[1]
    end
    local ProgressTextureFrameRate = math.clamp(tonumber(LoadingInfo.ProgressTextureFrameRate) or 30, 1, 60)
    local ProgressTextureTileSize = LoadingInfo.ProgressTextureTileSize or UDim2.fromOffset(64, 16)
    local ProgressTextureColor = LoadingInfo.ProgressTextureColor or "WhiteColor"
    local ProgressTrackTexture = LoadingInfo.ProgressTrackTexture ~= false
    local HasCustomProgressTrackTexture = LoadingInfo.ProgressTrackTextureImage ~= nil
    local ProgressTrackTextureImage = ResolveLoadingImageAsset(
        LoadingInfo.ProgressTrackTextureImage or LoadingInfo.ProgressTextureImage,
        "LoadingBarTrackTexture_",
        ProgressTextureImage or DefaultProgressTextureImage
    )
    local ProgressTrackTextureFrames = ResolveLoadingImageFrames(
        LoadingInfo.ProgressTrackTextureFrames,
        "LoadingBarTrackFrame_",
        HasCustomProgressTrackTexture and ProgressTrackTextureImage or ProgressTextureFrames
    )
    if #ProgressTrackTextureFrames > 0 then
        ProgressTrackTextureImage = ProgressTrackTextureFrames[1]
    end
    local ProgressTrackTextureFrameRate =
        math.clamp(tonumber(LoadingInfo.ProgressTrackTextureFrameRate) or ProgressTextureFrameRate, 1, 60)
    local ProgressTrackTextureTransparency = math.clamp(
        tonumber(LoadingInfo.ProgressTrackTextureTransparency) or math.clamp(ProgressTextureTransparency + 0.28, 0, 0.9),
        0,
        1
    )
    local ProgressTrackTextureColor = LoadingInfo.ProgressTrackTextureColor or "AccentColor"
    local ProgressTrackTextureTileSize = LoadingInfo.ProgressTrackTextureTileSize or ProgressTextureTileSize
    local ProgressBarHeight = tonumber(LoadingInfo.ProgressBarHeight)
    if not ProgressBarHeight and typeof(LoadingInfo.ProgressBarSize) == "UDim2" and LoadingInfo.ProgressBarSize.Y.Offset ~= 0 then
        ProgressBarHeight = math.abs(LoadingInfo.ProgressBarSize.Y.Offset)
    end
    ProgressBarHeight = math.max(4, ProgressBarHeight or 15)
    local ProgressBarPadding = math.clamp(tonumber(LoadingInfo.ProgressBarPadding) or 0, 0, math.floor(ProgressBarHeight / 2))
    local ProgressBarSize = LoadingInfo.ProgressBarSize or UDim2.new(0.7, 0, 0, ProgressBarHeight)
    local ProgressBarTransparency = math.clamp(tonumber(LoadingInfo.ProgressBarTransparency) or 0, 0, 1)
    local ProgressFillTransparency = math.clamp(tonumber(LoadingInfo.ProgressFillTransparency) or 0, 0, 1)
    local ProgressBarColor = LoadingInfo.ProgressBarColor or "MainColor"
    local ProgressFillColor = LoadingInfo.ProgressFillColor or "AccentColor"
    local ProgressBarStrokeColor = LoadingInfo.ProgressBarStrokeColor or "OutlineColor"
    local ProgressBarStrokeTransparency = math.clamp(tonumber(LoadingInfo.ProgressBarStrokeTransparency) or 0, 0, 1)
    local ProgressBarShadowTransparency = math.clamp(tonumber(LoadingInfo.ProgressBarShadowTransparency) or 0, 0, 1)
    local UseProgressCap = LoadingInfo.ProgressCap == true
    local ProgressCapColor = LoadingInfo.ProgressCapColor or "FontColor"
    local ProgressCapTransparency = math.clamp(tonumber(LoadingInfo.ProgressCapTransparency) or 0.12, 0, 1)
    local SmoothProgress = LoadingInfo.SmoothProgress ~= false
    local SmoothProgressDuration = tonumber(LoadingInfo.SmoothProgressDuration)
    local SmoothProgressDefaultDuration =
        math.max(0.05, tonumber(LoadingInfo.SmoothProgressDefaultDuration) or 0.58)
    local SmoothProgressMinDuration = math.max(0.02, tonumber(LoadingInfo.SmoothProgressMinDuration) or 0.26)
    local SmoothProgressMaxDuration = math.max(
        SmoothProgressMinDuration,
        tonumber(LoadingInfo.SmoothProgressMaxDuration) or 1.45
    )
    local SmoothProgressCadenceScale = math.clamp(tonumber(LoadingInfo.SmoothProgressCadenceScale) or 0.86, 0.1, 2)
    local function GetTextureScrollOffset(TileSize, Fallback)
        if typeof(TileSize) == "UDim2" and TileSize.X.Offset ~= 0 then
            return math.max(1, math.abs(TileSize.X.Offset))
        end

        return Fallback
    end

    local ProgressTextureScrollOffset = math.max(
        1,
        tonumber(LoadingInfo.ProgressTextureScrollOffset) or GetTextureScrollOffset(ProgressTextureTileSize, 64)
    )
    local ProgressTrackTextureScrollOffset = math.max(
        1,
        tonumber(LoadingInfo.ProgressTrackTextureScrollOffset)
            or GetTextureScrollOffset(ProgressTrackTextureTileSize, ProgressTextureScrollOffset)
    )

    local UseLoadingDecor = LoadingInfo.Decor ~= false and LoadingInfo.DecorImage ~= nil
    local DecorImage = ResolveLoadingImageAsset(LoadingInfo.DecorImage, "LoadingDecor_")
    local DecorFrames = ResolveLoadingImageFrames(LoadingInfo.DecorFrames, "LoadingDecorFrame_", DecorImage)
    if #DecorFrames > 0 then
        DecorImage = DecorFrames[1]
    end
    local DecorFrameRate = math.clamp(tonumber(LoadingInfo.DecorFrameRate) or 30, 1, 60)
    local DecorImageTransparency = math.clamp(tonumber(LoadingInfo.DecorImageTransparency) or 0.18, 0, 1)
    local DecorHeight = math.max(0, tonumber(LoadingInfo.DecorHeight) or 92)
    local DecorPosition = tostring(LoadingInfo.DecorPosition or "Bottom"):lower()
    local DecorScaleType = typeof(LoadingInfo.DecorScaleType) == "EnumItem" and LoadingInfo.DecorScaleType
        or Enum.ScaleType.Crop

    local function GetLoadingFrameWidth()
        return Loading.ShowSidebar and (Loading.ContentWidth + Loading.SidebarWidth) or Loading.WindowWidth
    end

    --// ScreenGui \\--
    local ScreenGui = New("ScreenGui", {
        Name = "ObsidianLoading",
        DisplayOrder = 999,
        ResetOnSpawn = false,
    })
    ParentUI(ScreenGui)
    Loading.ScreenGui = ScreenGui

    ScreenGui.DescendantRemoving:Connect(function(Instance)
        Library:RemoveFromRegistry(Instance)
    end)

    local Backdrop
    if LoadingInfo.Backdrop then
        Backdrop = New("Frame", {
            BackgroundColor3 = "DarkColor",
            BackgroundTransparency = LoadingInfo.Animated and 1 or BackdropTransparency,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 0,
            Parent = ScreenGui,
        })
        if LoadingInfo.Animated then
            TweenObject(
                Backdrop,
                TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { BackgroundTransparency = BackdropTransparency }
            )
        end
    end

    --// Main Frame \\--
    local TargetScale = Library.IsMobile and 0.8 or 1
    local UseEntranceAnimation = LoadingInfo.Animated and LoadingInfo.EntranceAnimation
    local MainFrame = New("TextButton", {
        Name = "Main",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = function()
            return Library:GetBetterColor(Library.Scheme.BackgroundColor, -1)
        end,
        BackgroundTransparency = SurfaceTransparency,
        Position = UseEntranceAnimation and UDim2.new(0.5, 0, 0.5, 18) or UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(
            GetLoadingFrameWidth(),
            Loading.WindowHeight
        ),
        ClipsDescendants = true,
        Text = "",
        AutoButtonColor = false,
        Parent = ScreenGui,
    })
    Library:AddOutline(MainFrame)
    table.insert(
        Library.Corners,
        New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = MainFrame })
    )

    if LoadingInfo.SurfaceInnerStroke ~= false then
        local InnerStrokeFrame = New("Frame", {
            Name = "InnerAccentStroke",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.new(1, -8, 1, -8),
            ZIndex = 2,
            Parent = MainFrame,
        })
        table.insert(
            Library.Corners,
            New("UICorner", {
                CornerRadius = UDim.new(0, math.max(2, Library.CornerRadius - 2)),
                Parent = InnerStrokeFrame,
            })
        )
        Library:AddOutline(InnerStrokeFrame, {
            Color = LoadingInfo.SurfaceInnerStrokeColor or "AccentColor",
            Transparency = LoadingInfo.SurfaceInnerStrokeTransparency or 0.62,
            ShadowTransparency = 1,
        })
    end

    local SurfaceFill
    if LoadingInfo.SurfaceFill ~= false then
        SurfaceFill = New("Frame", {
            Name = "SurfaceFill",
            BackgroundColor3 = LoadingInfo.SurfaceFillColor or function()
                return Library:GetBetterColor(Library.Scheme.BackgroundColor, -1)
            end,
            BackgroundTransparency = SurfaceFillTransparency,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 1,
            Parent = MainFrame,
        })
        table.insert(
            Library.Corners,
            New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = SurfaceFill })
        )
    end

    local MainScale = New("UIScale", {
        Scale = UseEntranceAnimation and TargetScale * 0.94 or TargetScale,
        Parent = MainFrame,
    })
    table.insert(Library.Scales, MainScale)
    Library.ScalesOffset[MainScale] = Library.IsMobile and 0.2 or 0

    local EntranceAnimationDuration = math.max(0.18, tonumber(LoadingInfo.EntranceAnimationDuration) or 0.62)
    local ExitAnimationDuration = math.max(0.18, tonumber(LoadingInfo.ExitAnimationDuration) or 0.38)
    local TransitionOverlay
    local TransitionGradient
    local TransitionDuration = math.max(0.08, tonumber(LoadingInfo.GradientTransitionDuration) or 0.72)
    local function PlayLoadingGradientTransition(IsExit, Callback)
        if not (LoadingInfo.Animated and LoadingInfo.GradientTransition) then
            if Callback then
                Callback()
            end
            return 0
        end

        if not TransitionOverlay then
            local ColorSequenceValue, TransparencySequenceValue =
                BuildLoadingGradientSequences(
                    LoadingInfo.GradientTransitionStops,
                    LoadingInfo.GradientTransitionTransparency or LoadingInfo.GradientTransitionTransparencyStops
                )

            TransitionOverlay = New("Frame", {
                Name = "GradientTransitionOverlay",
                BackgroundColor3 = "WhiteColor",
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                Size = UDim2.fromScale(1, 1),
                Visible = false,
                ZIndex = 950,
                Parent = MainFrame,
            })
            table.insert(
                Library.Corners,
                New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = TransitionOverlay })
            )
            TransitionGradient = Library:AddGradient(TransitionOverlay, {
                Color = ColorSequenceValue,
                Rotation = LoadingInfo.GradientTransitionRotation or 45,
                Transparency = TransparencySequenceValue,
            })
        end

        local StartOffset = LoadingInfo.GradientTransitionInOffset or Vector2.new(-1.2, -1.2)
        local EndOffset = LoadingInfo.GradientTransitionOutOffset or Vector2.new(1.2, 1.2)
        if IsExit then
            StartOffset = LoadingInfo.GradientTransitionExitInOffset or StartOffset
            EndOffset = LoadingInfo.GradientTransitionExitOutOffset or EndOffset
        end

        TransitionOverlay.Visible = true
        TransitionOverlay.BackgroundTransparency = 0
        TransitionGradient.Offset = StartOffset

        local TransitionTween = TweenService:Create(
            TransitionGradient,
            TweenInfo.new(
                TransitionDuration,
                Enum.EasingStyle.Quint,
                IsExit and Enum.EasingDirection.In or Enum.EasingDirection.Out
            ),
            { Offset = EndOffset }
        )
        TransitionTween:Play()

        task.delay(TransitionDuration, function()
            if not IsExit and TransitionOverlay and TransitionOverlay.Parent then
                TransitionOverlay.Visible = false
            end

            if Callback then
                Callback()
            end
        end)

        return TransitionDuration
    end

    local DrawingLayer = New("Frame", {
        Name = "LoadingDrawingLayer",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 1,
        Parent = MainFrame,
    })
    Loading.DrawingLayer = DrawingLayer
    Loading.Drawings = {}

    local function ResolveDrawingImage(Image, Prefix)
        Image = Image or ""
        if tonumber(Image) then
            return string.format("rbxassetid://%s", tostring(Image))
        elseif IsHttpUrl(Image) then
            return Library:DownloadImage(Image, {
                AssetName = (Prefix or "LoadingDrawing_") .. HashString(Image),
                Extension = "png",
            })
        end

        return tostring(Image)
    end

    local function AddDrawingCorner(Drawing, CornerRadius)
        CornerRadius = tonumber(CornerRadius) or 0
        if CornerRadius > 0 then
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, CornerRadius),
                    Parent = Drawing,
                })
            )
        end
    end

    local function TrackDrawing(Drawing)
        table.insert(Loading.Drawings, Drawing)
        return Drawing
    end

    function Loading:AddDrawingFrame(Info)
        Info = typeof(Info) == "table" and Info or {}
        local TextureSource = Info.Image or Info.Texture or Info.Url or Info.URL or Info.Frames or Info.Images
        local HasTextureSource = TextureSource ~= nil and TextureSource ~= ""

        local Drawing = New("Frame", {
            Name = Info.Name or "DrawingFrame",
            AnchorPoint = Info.AnchorPoint or Vector2.zero,
            BackgroundColor3 = Info.BackgroundColor3 or Info.Color or "AccentColor",
            BackgroundTransparency = math.clamp(
                tonumber(Info.BackgroundTransparency or Info.Transparency) or 0.35,
                0,
                1
            ),
            BorderSizePixel = 0,
            ClipsDescendants = Info.ClipsDescendants == true or HasTextureSource,
            Position = Info.Position or UDim2.fromScale(0, 0),
            Rotation = tonumber(Info.Rotation) or 0,
            Size = Info.Size or UDim2.fromOffset(24, 24),
            Visible = Info.Visible ~= false,
            ZIndex = tonumber(Info.ZIndex) or 1,
            Parent = DrawingLayer,
        })

        AddDrawingCorner(Drawing, Info.CornerRadius or Info.Radius)

        if Info.Stroke or Info.StrokeColor or Info.StrokeThickness then
            Library:AddOutline(Drawing, {
                Color = Info.StrokeColor or "OutlineColor",
                Thickness = Info.StrokeThickness or 1,
                Transparency = Info.StrokeTransparency or 0.2,
                ShadowTransparency = 1,
            })
        end

        if typeof(Info.Gradient) == "table" then
            Library:AddGradient(Drawing, Info.Gradient)
        end

        if HasTextureSource then
            local DrawingTextureFrames = ResolveLoadingImageFrames(TextureSource, "LoadingDrawingFrame_", nil)
            local DrawingTextureImage = DrawingTextureFrames[1]

            if DrawingTextureImage then
                local ScaleType = Info.ScaleType
                if typeof(ScaleType) ~= "EnumItem" then
                    ScaleType = Info.TileSize and Enum.ScaleType.Tile or Enum.ScaleType.Stretch
                end

                local DrawingTexture = New("ImageLabel", {
                    Name = "DrawingFrameTexture",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = DrawingTextureImage,
                    ImageColor3 = Info.ImageColor3 or Info.TextureColor3 or "WhiteColor",
                    ImageRectOffset = Info.ImageRectOffset or Info.RectOffset or Vector2.zero,
                    ImageRectSize = Info.ImageRectSize or Info.RectSize or Vector2.zero,
                    ImageTransparency = math.clamp(
                        tonumber(Info.ImageTransparency or Info.TextureTransparency) or 0,
                        0,
                        1
                    ),
                    Position = UDim2.fromScale(0, 0),
                    ScaleType = ScaleType,
                    Size = UDim2.fromScale(1, 1),
                    SliceCenter = Info.SliceCenter,
                    TileSize = Info.TileSize,
                    ZIndex = tonumber(Info.TextureZIndex) or Drawing.ZIndex,
                    Parent = Drawing,
                })

                AddDrawingCorner(DrawingTexture, Info.TextureCornerRadius or Info.CornerRadius or Info.Radius)
                StartImageFrameAnimation(DrawingTexture, DrawingTextureFrames, Info.FrameRate or Info.FPS, DrawingTexture)
            end
        end

        return TrackDrawing(Drawing)
    end

    function Loading:AddDrawingImage(Info)
        Info = typeof(Info) == "table" and Info or { Image = Info }

        local ScaleType = Info.ScaleType
        if typeof(ScaleType) ~= "EnumItem" then
            ScaleType = Info.TileSize and Enum.ScaleType.Tile or Enum.ScaleType.Stretch
        end

        local Drawing = New("ImageLabel", {
            Name = Info.Name or "DrawingImage",
            AnchorPoint = Info.AnchorPoint or Vector2.zero,
            BackgroundColor3 = Info.BackgroundColor3 or "BackgroundColor",
            BackgroundTransparency = math.clamp(tonumber(Info.BackgroundTransparency) or 1, 0, 1),
            BorderSizePixel = 0,
            Image = ResolveDrawingImage(Info.Image or Info.Texture or Info.Url or Info.URL, "LoadingDrawingImage_"),
            ImageColor3 = Info.ImageColor3 or Info.Color or "WhiteColor",
            ImageRectOffset = Info.ImageRectOffset or Info.RectOffset or Vector2.zero,
            ImageRectSize = Info.ImageRectSize or Info.RectSize or Vector2.zero,
            ImageTransparency = math.clamp(tonumber(Info.ImageTransparency or Info.Transparency) or 0, 0, 1),
            Position = Info.Position or UDim2.fromScale(0, 0),
            Rotation = tonumber(Info.Rotation) or 0,
            ScaleType = ScaleType,
            Size = Info.Size or UDim2.fromOffset(64, 64),
            SliceCenter = Info.SliceCenter,
            TileSize = Info.TileSize,
            Visible = Info.Visible ~= false,
            ZIndex = tonumber(Info.ZIndex) or 1,
            Parent = DrawingLayer,
        })

        AddDrawingCorner(Drawing, Info.CornerRadius or Info.Radius)

        if typeof(Info.Gradient) == "table" then
            Library:AddGradient(Drawing, Info.Gradient)
        end

        local DrawingFrames = ResolveLoadingImageFrames(Info.Frames or Info.Images, "LoadingDrawingImageFrame_", Drawing.Image)
        StartImageFrameAnimation(Drawing, DrawingFrames, Info.FrameRate or Info.FPS, Drawing)

        return TrackDrawing(Drawing)
    end

    function Loading:AddDrawingLine(Info)
        Info = typeof(Info) == "table" and Info or {}
        Info.Size = Info.Size or UDim2.new(1, 0, 0, 1)
        Info.BackgroundColor3 = Info.BackgroundColor3 or Info.Color or "OutlineColor"
        Info.BackgroundTransparency = Info.BackgroundTransparency or Info.Transparency or 0
        return Loading:AddDrawingFrame(Info)
    end

    function Loading:AddDrawingGradient(Target, Info)
        if typeof(Target) == "Instance" and Target:IsA("GuiObject") then
            return Library:AddGradient(Target, Info or {})
        end

        return Library:AddGradient(DrawingLayer, Target or Info or {})
    end

    function Loading:ClearDrawings()
        for _, Drawing in Loading.Drawings do
            if typeof(Drawing) == "Instance" and Drawing.Parent then
                Drawing:Destroy()
            end
        end

        table.clear(Loading.Drawings)
    end

    local LoadingDecor
    local function GetDecorPlacement()
        if DecorPosition == "top" then
            return Vector2.new(0.5, 0), UDim2.new(0.5, 0, 0, 0), UDim2.new(1, 0, 0, DecorHeight)
        elseif DecorPosition == "full" then
            return Vector2.zero, UDim2.fromScale(0, 0), UDim2.fromScale(1, 1)
        end

        return Vector2.new(0.5, 1), UDim2.new(0.5, 0, 1, 0), UDim2.new(1, 0, 0, DecorHeight)
    end

    local function CreateLoadingDecor()
        if LoadingDecor or not UseLoadingDecor then
            return LoadingDecor
        end

        local AnchorPoint, Position, Size = GetDecorPlacement()
        LoadingDecor = Loading:AddDrawingImage({
            Name = "PixelLoadingDecor",
            AnchorPoint = AnchorPoint,
            Image = DecorImage,
            ImageColor3 = LoadingInfo.DecorImageColor3 or "WhiteColor",
            ImageTransparency = DecorImageTransparency,
            Position = Position,
            ScaleType = DecorScaleType,
            Size = Size,
            ZIndex = 1,
        })
        StartImageFrameAnimation(LoadingDecor, DecorFrames, DecorFrameRate, "Decor")

        return LoadingDecor
    end

    function Loading:SetDecorImage(Image)
        DecorImage = ResolveLoadingImageAsset(Image, "LoadingDecor_")
        DecorFrames = { DecorImage }
        StopImageFrameAnimation("Decor")
        UseLoadingDecor = true

        local Decor = CreateLoadingDecor()
        if Decor then
            Decor.Image = DecorImage
        end
    end

    function Loading:SetDecorFrames(Images, FrameRate)
        DecorFrames = ResolveLoadingImageFrames(Images, "LoadingDecorFrame_", DecorImage)
        DecorFrameRate = math.clamp(tonumber(FrameRate) or DecorFrameRate, 1, 60)

        if #DecorFrames > 0 then
            DecorImage = DecorFrames[1]
        end

        UseLoadingDecor = true
        local Decor = CreateLoadingDecor()
        if Decor then
            Decor.Image = DecorImage
            StartImageFrameAnimation(Decor, DecorFrames, DecorFrameRate, "Decor")
        end
    end

    function Loading:SetDecorVisible(Visible)
        local Decor = CreateLoadingDecor()
        if Decor then
            Decor.Visible = Visible ~= false
        end
    end

    function Loading:SetDecorTransparency(Transparency)
        DecorImageTransparency = math.clamp(tonumber(Transparency) or DecorImageTransparency, 0, 1)
        if LoadingDecor then
            LoadingDecor.ImageTransparency = DecorImageTransparency
        end
    end

    function Loading:SetSurfaceTransparency(Transparency)
        SurfaceTransparency = math.clamp(tonumber(Transparency) or SurfaceTransparency, 0, 1)
        MainFrame.BackgroundTransparency = SurfaceTransparency

        if SurfaceFill then
            SurfaceFillTransparency = SurfaceTransparency
            SurfaceFill.BackgroundTransparency = SurfaceFillTransparency
        end
    end

    function Loading:SetSurfaceFillTransparency(Transparency)
        SurfaceFillTransparency = math.clamp(tonumber(Transparency) or SurfaceFillTransparency, 0, 1)
        if SurfaceFill then
            SurfaceFill.BackgroundTransparency = SurfaceFillTransparency
        end
    end

    CreateLoadingDecor()

    if LoadingInfo.DrawingDecorations then
        Loading:AddDrawingLine({
            Name = "TopAccentLine",
            BackgroundColor3 = "AccentColor",
            BackgroundTransparency = 0.24,
            Position = UDim2.fromOffset(12, 0),
            Size = UDim2.new(1, -24, 0, 1),
            ZIndex = 1,
            Gradient = {
                Rotation = 0,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.18, 0.14),
                    NumberSequenceKeypoint.new(0.82, 0.14),
                    NumberSequenceKeypoint.new(1, 1),
                }),
            },
        })

        Loading:AddDrawingFrame({
            Name = "CornerBloom",
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = "AccentColor",
            BackgroundTransparency = 0.9,
            CornerRadius = 96,
            Position = UDim2.new(1, 18, 0, -42),
            Size = UDim2.fromOffset(170, 170),
            ZIndex = 1,
            Gradient = {
                Rotation = 35,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.72),
                    NumberSequenceKeypoint.new(0.45, 0.92),
                    NumberSequenceKeypoint.new(1, 1),
                }),
            },
        })
    end

    if typeof(LoadingInfo.Drawings) == "table" then
        for _, DrawingInfo in LoadingInfo.Drawings do
            if typeof(DrawingInfo) ~= "table" then
                continue
            end

            local DrawingType = tostring(DrawingInfo.Type or DrawingInfo.Kind or (DrawingInfo.Image and "Image" or "Frame"))
                :lower()
            if DrawingType == "image" or DrawingType == "texture" then
                Loading:AddDrawingImage(DrawingInfo)
            elseif DrawingType == "line" then
                Loading:AddDrawingLine(DrawingInfo)
            elseif DrawingType == "gradient" then
                Loading:AddDrawingGradient(DrawingInfo)
            else
                Loading:AddDrawingFrame(DrawingInfo)
            end
        end
    end

    if UseEntranceAnimation then
        TweenObject(
            MainFrame,
            TweenInfo.new(EntranceAnimationDuration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                Position = UDim2.fromScale(0.5, 0.5),
            }
        )
        TweenObject(
            MainScale,
            TweenInfo.new(EntranceAnimationDuration, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            { Scale = TargetScale }
        )

    end
    if UseEntranceAnimation then
        PlayLoadingGradientTransition(false)
    end

    if LoadingInfo.Animated and LoadingInfo.AmbientGradient then
        local AmbientGradient = Library:AddGradient(MainFrame, {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Library.Scheme.AccentColor),
                ColorSequenceKeypoint.new(0.52, Library:GetBetterColor(Library.Scheme.BackgroundColor, -2)),
                ColorSequenceKeypoint.new(1, Library.Scheme.MainColor),
            }),
            Rotation = 20,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.78),
                NumberSequenceKeypoint.new(0.5, 0.94),
                NumberSequenceKeypoint.new(1, 0.82),
            }),
        })
        TweenObject(
            AmbientGradient,
            TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
            { Rotation = 380 }
        )

    end

    if LoadingInfo.Animated and LoadingInfo.Particles and ParticleCount > 0 then
        local ParticleLayer = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 1,
            Parent = MainFrame,
        })
        local Particles = {}
        for Index = 1, ParticleCount do
            local Dot = New("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Index % 3 == 0 and "FontColor" or "AccentColor",
                BackgroundTransparency = 0.68,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(2 + (Index % 3), 2 + (Index % 3)),
                Parent = ParticleLayer,
            })
            table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Dot }))
            table.insert(Particles, {
                Dot = Dot,
                Angle = (Index / ParticleCount) * math.pi * 2,
                RadiusX = 0.2 + ((Index % 5) * 0.055),
                RadiusY = 0.12 + ((Index % 4) * 0.045),
                Speed = 0.25 + ((Index % 6) * 0.035),
                Phase = Index * 0.41,
            })
        end

        TrackConnection(RunService.RenderStepped:Connect(function()
            if not LoadingAnimations.Running then
                return
            end

            local Time = os.clock()
            for _, Particle in Particles do
                local Angle = Particle.Angle + (Time * Particle.Speed)
                Particle.Dot.Position = UDim2.fromScale(
                    0.5 + math.cos(Angle) * Particle.RadiusX,
                    0.52 + math.sin(Angle + Particle.Phase) * Particle.RadiusY
                )
                Particle.Dot.BackgroundTransparency = 0.58 + (math.sin(Time * 2.4 + Particle.Phase) + 1) * 0.18
            end
        end))
    end

    --// Layout Containers \\--
    local Container = New("Frame", {
        Name = "Content",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(0, Loading.ContentWidth, 1, 0),
        ZIndex = 3,
        Parent = MainFrame,
    })

    local SideBar = New("Frame", {
        Name = "SideBar",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(Loading.ContentWidth, 0),
        Size = UDim2.new(0, Loading.ShowSidebar and Loading.SidebarWidth or 0, 1, 0),
        ClipsDescendants = true,
        Visible = Loading.ShowSidebar,
        ZIndex = 3,
        Parent = MainFrame,
    })
    local SidebarCorner = New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = SideBar })
    table.insert(Library.Corners, SidebarCorner)

    Library:AddOutline(SideBar)

    local SidebarDivider = New("Frame", {
        BackgroundColor3 = "OutlineColor",
        BorderSizePixel = 0,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        Visible = Loading.ShowSidebar,
        Parent = SideBar,
    })

    --// Top Bar \\--
    local TopBar = New("Frame", {
        Name = "TopBar",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 48),
        ZIndex = 2,
        Parent = Container,
    })
    Library:MakeDraggable(MainFrame, TopBar, true, true)

    local TitleHolder = New("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Parent = TopBar,
    })
    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 6),
        Parent = TitleHolder,
    })
    New("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        Parent = TitleHolder,
    })

    if LoadingInfo.Icon then
        local Icon = Library:GetCustomIcon(LoadingInfo.Icon)
        local _WindowIcon = New("ImageLabel", {
            Image = Icon.Url,
            ImageRectOffset = Icon.ImageRectOffset,
            ImageRectSize = Icon.ImageRectSize,
            Size = LoadingInfo.IconSize,
            Parent = TitleHolder,
        })
    else
        local _WindowIcon = New("TextLabel", {
            BackgroundTransparency = 1,
            Size = LoadingInfo.IconSize,
            Text = LoadingInfo.Title:sub(1, 1),
            TextScaled = true,
            Visible = false,
            Parent = TitleHolder,
        })
    end

    local TitleX = Library:GetTextBounds(
        LoadingInfo.Title,
        Library.Scheme.Font,
        20,
        TitleHolder.AbsoluteSize.X - (LoadingInfo.Icon and (LoadingInfo.IconSize.X.Offset + 6) or 0) - 12
    )
    local _WindowTitle = New("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, TitleX, 1, 0),
        Text = LoadingInfo.Title,
        TextSize = 20,
        Parent = TitleHolder,
    })

    Library:MakeLine(Container, {
        Position = UDim2.fromOffset(0, 48),
        Size = UDim2.new(1, 0, 0, 1),
    })

    --// Loading Content Elements \\--
    local InnerContent = New("Frame", {
        Name = "InnerContent",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 49),
        Size = UDim2.new(1, 0, 1, -49),
        Parent = Container,
    })

    New("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 12),
        Parent = InnerContent,
    })

    local LoadingIcon
    local RotationTween
    if ShowLoadingIcon then
        local IconHolder = New("Frame", {
            Name = "IconHolder",
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = UDim2.fromOffset(64, 64),
            Parent = InnerContent,
        })

        if LoadingInfo.Animated and LoadingInfo.IconPulse then
            for Index = 1, 2 do
                local Ring = New("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.58, 0.58),
                    ZIndex = 2,
                    Parent = IconHolder,
                })
                table.insert(Library.Corners, New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Ring }))
                local RingStroke = New("UIStroke", {
                    Color = "AccentColor",
                    Thickness = Index == 1 and 1.5 or 1,
                    Transparency = Index == 1 and 0.28 or 0.55,
                    Parent = Ring,
                })
                local Delay = (Index - 1) * 0.45
                TweenObject(
                    Ring,
                    TweenInfo.new(1.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, Delay),
                    { Size = UDim2.fromScale(0.98, 0.98) }
                )
                TweenObject(
                    RingStroke,
                    TweenInfo.new(1.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true, Delay),
                    { Transparency = 0.94 }
                )
            end
        end

        local LoaderIcon = Library:GetCustomIcon(LoadingInfo.LoadingIcon)
        LoadingIcon = New("ImageLabel", {
            Name = "LoaderIcon",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Image = LoaderIcon.Url,
            ImageRectOffset = LoaderIcon.ImageRectOffset,
            ImageRectSize = LoaderIcon.ImageRectSize,
            ImageColor3 = LoadingInfo.LoadingIconColor
                or ((LoadingInfo.LoadingIcon == Templates.Loading.LoadingIcon) and "AccentColor" or "WhiteColor"),
            ZIndex = 3,
            Parent = IconHolder,
        })

        if LoadingInfo.Animated and LoadingInfo.IconPulse then
            TweenObject(
                LoadingIcon,
                TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                { Size = UDim2.fromScale(0.9, 0.9) }
            )
        end

        if LoadingInfo.LoadingIconTweenTime > 0 then
            RotationTween = TweenService:Create(
                LoadingIcon,
                TweenInfo.new(LoadingInfo.LoadingIconTweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
                { Rotation = 360 }
            )
            RotationTween:Play()
        end
    end

    local MessageLabel = New("TextLabel", {
        BackgroundTransparency = 1,
        AutomaticSize = Loading.AutoResizeHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY,
        Size = Loading.AutoResizeHeight and UDim2.new(1, -60, 0, 0) or UDim2.fromOffset(0, 0),
        Text = "",
        TextSize = 18,
        TextWrapped = Loading.AutoResizeHeight,
        Parent = InnerContent,
    })

    local DescriptionLabel = New("TextLabel", {
        BackgroundTransparency = 1,
        AutomaticSize = Loading.AutoResizeHeight and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY,
        Size = Loading.AutoResizeHeight and UDim2.new(1, -60, 0, 0) or UDim2.fromOffset(0, 0),
        Text = "",
        TextSize = 14,
        TextTransparency = 0.5,
        TextWrapped = Loading.AutoResizeHeight,
        Parent = InnerContent,
    })

    local function SetAnimatedText(Label, Text, RestTransparency)
        Text = tostring(Text or "")

        if LoadingInfo.Animated and Label.Text ~= Text then
            Label.TextTransparency = 1
            Label.Text = Text
            TweenService:Create(
                Label,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { TextTransparency = RestTransparency }
            ):Play()
        else
            Label.Text = Text
            Label.TextTransparency = RestTransparency
        end
    end

    --// Progress Bar \\--
    local SliderBar = New("Frame", {
        BackgroundColor3 = ProgressBarColor,
        BackgroundTransparency = ProgressBarTransparency,
        ClipsDescendants = true,
        Size = ProgressBarSize,
        Parent = InnerContent,
    })
    Library:AddOutline(SliderBar, {
        Color = ProgressBarStrokeColor,
        Transparency = ProgressBarStrokeTransparency,
        ShadowTransparency = ProgressBarShadowTransparency,
    })
    table.insert(
        Library.Corners,
        New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius / 2), Parent = SliderBar })
    )

    local SliderContent = New("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.fromOffset(ProgressBarPadding, ProgressBarPadding),
        Size = UDim2.new(1, -ProgressBarPadding * 2, 1, -ProgressBarPadding * 2),
        ZIndex = 2,
        Parent = SliderBar,
    })
    table.insert(
        Library.Corners,
        New("UICorner", {
            CornerRadius = UDim.new(0, math.max(1, (Library.CornerRadius / 2) - ProgressBarPadding)),
            Parent = SliderContent,
        })
    )

    local SliderGlow = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ProgressFillColor,
        BackgroundTransparency = 0.88,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 10, 1, 10),
        ZIndex = 1,
        Parent = SliderBar,
    })
    table.insert(
        Library.Corners,
        New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius), Parent = SliderGlow })
    )

    local TrackTexture
    if UseProgressTexture and ProgressTrackTexture and (ProgressTrackTextureImage or ProgressTextureImage) then
        local TrackTextureImage = ProgressTrackTextureImage or ProgressTextureImage
        TrackTexture = New("ImageLabel", {
            BackgroundTransparency = 1,
            Image = TrackTextureImage,
            ImageColor3 = ProgressTrackTextureColor,
            ImageTransparency = ProgressTrackTextureTransparency,
            Position = UDim2.fromOffset(0, 0),
            ScaleType = Enum.ScaleType.Tile,
            Size = UDim2.new(1, ProgressTrackTextureScrollOffset, 1, 0),
            TileSize = ProgressTrackTextureTileSize,
            ZIndex = 2,
            Parent = SliderContent,
        })

        if LoadingInfo.Animated and ProgressTextureSpeed > 0 then
            TweenObject(
                TrackTexture,
                TweenInfo.new(ProgressTextureSpeed * 1.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
                { Position = UDim2.fromOffset(-ProgressTrackTextureScrollOffset, 0) }
            )
        end
        StartImageFrameAnimation(TrackTexture, ProgressTrackTextureFrames, ProgressTrackTextureFrameRate, "ProgressTrack")
    end

    local SliderFill = New("Frame", {
        BackgroundColor3 = ProgressFillColor,
        BackgroundTransparency = ProgressFillTransparency,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(0, 1),
        ZIndex = 3,
        Parent = SliderContent,
    })
    table.insert(
        Library.Corners,
        New("UICorner", { CornerRadius = UDim.new(0, Library.CornerRadius / 2), Parent = SliderFill })
    )

    local SliderCap = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ProgressCapColor,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0, 3, 1, 2),
        Visible = false,
        ZIndex = 5,
        Parent = SliderContent,
    })
    table.insert(
        Library.Corners,
        New("UICorner", { CornerRadius = UDim.new(1, 0), Parent = SliderCap })
    )
    Library:AddGradient(SliderCap, {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.8),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(1, 0.8),
        }),
    })

    local ProgressTexture
    if UseProgressTexture and ProgressTextureImage then
        Library:AddGradient(SliderFill, {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.02),
                NumberSequenceKeypoint.new(0.55, 0.18),
                NumberSequenceKeypoint.new(1, 0.02),
            }),
        })

        ProgressTexture = New("ImageLabel", {
            BackgroundTransparency = 1,
            Image = ProgressTextureImage,
            ImageColor3 = ProgressTextureColor,
            ImageTransparency = ProgressTextureTransparency,
            Position = UDim2.fromOffset(0, 0),
            ScaleType = Enum.ScaleType.Tile,
            Size = UDim2.new(1, ProgressTextureScrollOffset, 1, 0),
            TileSize = ProgressTextureTileSize,
            ZIndex = 4,
            Parent = SliderFill,
        })

        if LoadingInfo.Animated and ProgressTextureSpeed > 0 then
            TweenObject(
                ProgressTexture,
                TweenInfo.new(ProgressTextureSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
                { Position = UDim2.fromOffset(-ProgressTextureScrollOffset, 0) }
            )
        end
        StartImageFrameAnimation(ProgressTexture, ProgressTextureFrames, ProgressTextureFrameRate, "ProgressTexture")
    end

    if LoadingInfo.ProgressShine then
        local ProgressShineWidth = math.max(8, tonumber(LoadingInfo.ProgressShineWidth) or 56)
        local ProgressShineSpeed = math.max(0.18, tonumber(LoadingInfo.ProgressShineSpeed) or 1.8)
        local ProgressShine = New("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = LoadingInfo.ProgressShineColor or "WhiteColor",
            BackgroundTransparency = math.clamp(tonumber(LoadingInfo.ProgressShineTransparency) or 0.58, 0, 1),
            BorderSizePixel = 0,
            Position = UDim2.new(0, -ProgressShineWidth, 0.5, 0),
            Rotation = tonumber(LoadingInfo.ProgressShineRotation) or 12,
            Size = UDim2.new(0, ProgressShineWidth, 1, 10),
            ZIndex = 5,
            Parent = SliderFill,
        })
        Library:AddGradient(ProgressShine, {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.32, 0.7),
                NumberSequenceKeypoint.new(0.5, 0.08),
                NumberSequenceKeypoint.new(0.68, 0.7),
                NumberSequenceKeypoint.new(1, 1),
            }),
        })

        if LoadingInfo.Animated then
            TweenObject(
                ProgressShine,
                TweenInfo.new(ProgressShineSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1),
                { Position = UDim2.new(1, ProgressShineWidth, 0.5, 0) }
            )
        end
    end

    local ProgressLabel = New("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextSize = 14,
        ZIndex = 6,
        Parent = SliderBar,
    })
    New("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        Color = "DarkColor",
        LineJoinMode = Enum.LineJoinMode.Miter,
        Parent = ProgressLabel,
    })

    local DisplayedProgress = Loading.TotalSteps > 0 and math.clamp(Loading.CurrentStep / Loading.TotalSteps, 0, 1) or 1
    local TargetProgress = DisplayedProgress
    local ProgressAnimationStart = DisplayedProgress
    local ProgressAnimationElapsed = 0
    local ProgressAnimationDuration = 0
    local ProgressAnimationActive = false
    local LastProgressStepClock

    local function EaseLoadingProgress(Alpha)
        Alpha = math.clamp(Alpha, 0, 1)
        return Alpha * Alpha * Alpha * (Alpha * (Alpha * 6 - 15) + 10)
    end

    local function ApplyDisplayedProgress(Progress)
        Progress = math.clamp(Progress, 0, 1)
        SliderFill.Size = UDim2.fromScale(Progress, 1)
        SliderCap.Visible = UseProgressCap and Progress > 0
        SliderCap.BackgroundTransparency = (UseProgressCap and Progress > 0) and ProgressCapTransparency or 1
        SliderCap.Position = UDim2.fromScale(Progress, 0.5)
    end

    local function StartProgressAnimation(Progress, Duration)
        TargetProgress = math.clamp(Progress, 0, 1)

        if
            not (LoadingInfo.Animated and SmoothProgress)
            or (tonumber(Duration) or 0) <= 0
            or math.abs(TargetProgress - DisplayedProgress) <= 0.001
        then
            DisplayedProgress = TargetProgress
            ProgressAnimationActive = false
            ApplyDisplayedProgress(DisplayedProgress)
            return
        end

        ProgressAnimationStart = DisplayedProgress
        ProgressAnimationElapsed = 0
        ProgressAnimationDuration = math.max(0.02, Duration)
        ProgressAnimationActive = true
    end

    TrackConnection(RunService.RenderStepped:Connect(function(DeltaTime)
        if not LoadingAnimations.Running or not ProgressAnimationActive then
            return
        end

        ProgressAnimationElapsed += math.clamp(DeltaTime or 0, 0, 1 / 15)
        local Alpha = math.clamp(ProgressAnimationElapsed / ProgressAnimationDuration, 0, 1)
        DisplayedProgress = ProgressAnimationStart + ((TargetProgress - ProgressAnimationStart) * EaseLoadingProgress(Alpha))
        ApplyDisplayedProgress(DisplayedProgress)

        if Alpha >= 1 then
            DisplayedProgress = TargetProgress
            ProgressAnimationActive = false
            ApplyDisplayedProgress(DisplayedProgress)
        end
    end))

    --// Sidebar Object \\--
    local SidebarScrolling = New("ScrollingFrame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = "OutlineColor",
        Parent = SideBar,
    })
    local SidebarList = New("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = SidebarScrolling,
    })
    New("UIPadding", {
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        PaddingTop = UDim.new(0, 12),
        Parent = SidebarScrolling,
    })

    local SidebarObject = {
        Elements = {},
        DependencyBoxes = {},
        Tabboxes = {},

        BoxHolder = SidebarScrolling,
        Container = SidebarScrolling,

        Resize = function(self)
            SidebarScrolling.CanvasSize = UDim2.fromOffset(0, SidebarList.AbsoluteContentSize.Y + 24)
        end,
        Tab = {
            Elements = {},
            DependencyBoxes = {},
            DependencyGroupboxes = {},
            Tabboxes = {},
        },
    }

    TrackConnection(SidebarList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        SidebarObject:Resize()
    end))

    setmetatable(SidebarObject, BaseGroupbox)
    Loading.Sidebar = SidebarObject

    --// Error Frame \\--
    local ErrorFrame = New("Frame", {
        Name = "Error",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 49),
        Size = UDim2.new(1, 0, 1, -49),
        ClipsDescendants = true,
        Visible = false,
        Parent = Container,
    })

    local _ErrorTitle = New("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(15, 15),
        Size = UDim2.new(1, -30, 0, 18),
        Text = "Error",
        TextColor3 = "RedColor",
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = ErrorFrame,
    })

    local ErrorLabel = New("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(15, 39),
        Size = UDim2.new(1, -30, 1, -90),
        Text = "Error Message",
        TextSize = 14,
        TextTransparency = 0.2,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = ErrorFrame,
    })

    local ErrorButtonsDivider = New("Frame", {
        BackgroundColor3 = "OutlineColor",
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 1, -48),
        Size = UDim2.new(1, -30, 0, 1),
        Visible = false,
        Parent = ErrorFrame,
    })

    local ErrorButtonsHolder = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.new(1, 0, 0, 42),
        Visible = false,
        Parent = ErrorFrame,
    })
    New("UIListLayout", {
        Padding = UDim.new(0, 8),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = ErrorButtonsHolder,
    })
    New("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15),
        Parent = ErrorButtonsHolder,
    })

    function Loading:UpdateLayout()
        if Loading.IsError then
            Loading:RecalculateErrorHeight()
        end

        local ShowSidebar = Loading.ShowSidebar
        local FinalWidth = ShowSidebar and (Loading.ContentWidth + Loading.SidebarWidth) or Loading.WindowWidth
        local FinalHeight = Loading.IsError and Loading.WindowErrorHeight or Loading.WindowHeight

        if ShowSidebar then
            SideBar.Visible = true
            SidebarDivider.Visible = true
        end

        TweenService:Create(MainFrame, Library.TweenInfo, { Size = UDim2.fromOffset(FinalWidth, FinalHeight) }):Play()

        TweenService:Create(SideBar, Library.TweenInfo, {
            Position = UDim2.fromOffset(Loading.ContentWidth, 0),
            Size = UDim2.new(0, ShowSidebar and Loading.SidebarWidth or 0, 1, 0),
        }):Play()
        TweenService:Create(
            Container,
            Library.TweenInfo,
            { Size = UDim2.new(0, ShowSidebar and Loading.ContentWidth or Loading.WindowWidth, 1, 0) }
        ):Play()

        if not ShowSidebar then
            task.delay(Library.TweenInfo.Time, function()
                if not Loading.ShowSidebar then
                    SideBar.Visible = false
                    SidebarDivider.Visible = false
                end
            end)
        end
    end

    --// Content Page \\--
    function Loading:RecalculateLoadingHeight()
        if not Loading.AutoResizeHeight then
            return
        end

        local RequiredHeight = 49 -- TopBar
            + 48 -- Padding
            + InnerContent.UIListLayout.AbsoluteContentSize.Y

        Loading.WindowHeight = math.max(Loading.BaseWindowHeight, RequiredHeight)
    end

    function Loading:SetMessage(Text)
        SetAnimatedText(MessageLabel, Text, 0)

        if Loading.AutoResizeHeight then
            Loading:RecalculateLoadingHeight()
            Loading:UpdateLayout()
        end
    end

    function Loading:SetDescription(Text)
        SetAnimatedText(DescriptionLabel, Text, 0.5)

        if Loading.AutoResizeHeight then
            Loading:RecalculateLoadingHeight()
            Loading:UpdateLayout()
        end
    end

    function Loading:SetLoadingIcon(Icon)
        LoadingInfo.LoadingIcon = Icon
        if not LoadingIcon then
            return
        end

        local IconData = Library:GetCustomIcon(Icon)
        LoadingIcon.Image = IconData.Url
        LoadingIcon.ImageRectOffset = IconData.ImageRectOffset
        LoadingIcon.ImageRectSize = IconData.ImageRectSize
    end

    function Loading:SetLoadingIconTweenTime(TweenTime)
        LoadingInfo.LoadingIconTweenTime = TweenTime
        if not LoadingIcon then
            return
        end

        if RotationTween then
            RotationTween:Cancel()
            RotationTween:Destroy()
        end

        if TweenTime > 0 then
            RotationTween = TweenService:Create(
                LoadingIcon,
                TweenInfo.new(TweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
                { Rotation = 360 }
            )
            RotationTween:Play()
        else
            LoadingIcon.Rotation = 0
        end
    end

    function Loading:SetLoadingIconColor(Color)
        LoadingInfo.LoadingIconColor = Color
        if LoadingIcon then
            LoadingIcon.ImageColor3 = Color
        end
    end

    function Loading:SetProgressTexture(Image)
        ProgressTextureImage = ResolveLoadingImageAsset(Image, "LoadingBarTexture_", DefaultProgressTextureImage)
        ProgressTextureFrames = { ProgressTextureImage }
        StopImageFrameAnimation("ProgressTexture")
        if ProgressTexture then
            ProgressTexture.Image = ProgressTextureImage or ""
        end

        if TrackTexture and not HasCustomProgressTrackTexture then
            TrackTexture.Image = ProgressTextureImage or ""
            ProgressTrackTextureFrames = { ProgressTextureImage }
            StopImageFrameAnimation("ProgressTrack")
        end
    end

    function Loading:SetProgressTextureFrames(Images, FrameRate)
        ProgressTextureFrames = ResolveLoadingImageFrames(Images, "LoadingBarFrame_", ProgressTextureImage)
        ProgressTextureFrameRate = math.clamp(tonumber(FrameRate) or ProgressTextureFrameRate, 1, 60)

        if #ProgressTextureFrames > 0 then
            ProgressTextureImage = ProgressTextureFrames[1]
        end

        if ProgressTexture then
            ProgressTexture.Image = ProgressTextureImage or ""
            StartImageFrameAnimation(ProgressTexture, ProgressTextureFrames, ProgressTextureFrameRate, "ProgressTexture")
        end

        if TrackTexture and not HasCustomProgressTrackTexture then
            ProgressTrackTextureFrames = ProgressTextureFrames
            ProgressTrackTextureImage = ProgressTextureImage
            TrackTexture.Image = ProgressTextureImage or ""
            StartImageFrameAnimation(TrackTexture, ProgressTrackTextureFrames, ProgressTrackTextureFrameRate, "ProgressTrack")
        end
    end

    function Loading:SetProgressTrackTexture(Image)
        HasCustomProgressTrackTexture = true
        ProgressTrackTextureImage =
            ResolveLoadingImageAsset(Image, "LoadingBarTrackTexture_", ProgressTextureImage or DefaultProgressTextureImage)
        ProgressTrackTextureFrames = { ProgressTrackTextureImage }
        StopImageFrameAnimation("ProgressTrack")
        if TrackTexture then
            TrackTexture.Image = ProgressTrackTextureImage or ProgressTextureImage or ""
        end
    end

    function Loading:SetProgressTrackTextureFrames(Images, FrameRate)
        HasCustomProgressTrackTexture = true
        ProgressTrackTextureFrames =
            ResolveLoadingImageFrames(Images, "LoadingBarTrackFrame_", ProgressTrackTextureImage or ProgressTextureImage)
        ProgressTrackTextureFrameRate = math.clamp(tonumber(FrameRate) or ProgressTrackTextureFrameRate, 1, 60)

        if #ProgressTrackTextureFrames > 0 then
            ProgressTrackTextureImage = ProgressTrackTextureFrames[1]
        end

        if TrackTexture then
            TrackTexture.Image = ProgressTrackTextureImage or ProgressTextureImage or ""
            StartImageFrameAnimation(TrackTexture, ProgressTrackTextureFrames, ProgressTrackTextureFrameRate, "ProgressTrack")
        end
    end

    function Loading:SetProgressTextureTransparency(Transparency)
        ProgressTextureTransparency = math.clamp(tonumber(Transparency) or ProgressTextureTransparency, 0, 1)
        if ProgressTexture then
            ProgressTexture.ImageTransparency = ProgressTextureTransparency
        end
    end

    function Loading:SetProgressTrackTextureTransparency(Transparency)
        ProgressTrackTextureTransparency =
            math.clamp(tonumber(Transparency) or ProgressTrackTextureTransparency, 0, 1)
        if TrackTexture then
            TrackTexture.ImageTransparency = ProgressTrackTextureTransparency
        end
    end

    function Loading:SetCurrentStep(Step, Duration)
        local PreviousTargetProgress = TargetProgress
        local Now = os.clock()
        Loading.CurrentStep = math.clamp(tonumber(Step) or 0, 0, Loading.TotalSteps)

        local Progress = Loading.TotalSteps > 0 and (Loading.CurrentStep / Loading.TotalSteps) or 1
        local ProgressDuration = 0
        if LoadingInfo.Animated and SmoothProgress then
            if tonumber(Duration) then
                ProgressDuration = math.clamp(tonumber(Duration), SmoothProgressMinDuration, SmoothProgressMaxDuration)
            elseif SmoothProgressDuration then
                ProgressDuration =
                    math.clamp(SmoothProgressDuration, SmoothProgressMinDuration, SmoothProgressMaxDuration)
            else
                local StepSize = Loading.TotalSteps > 0 and (1 / Loading.TotalSteps) or 1
                local DistanceScale = StepSize > 0
                        and math.clamp(math.abs(Progress - PreviousTargetProgress) / StepSize, 0.55, 2.2)
                    or 1
                local Cadence = LastProgressStepClock and math.max(0.05, Now - LastProgressStepClock)
                    or SmoothProgressDefaultDuration

                ProgressDuration = math.clamp(
                    Cadence * SmoothProgressCadenceScale * DistanceScale,
                    SmoothProgressMinDuration,
                    SmoothProgressMaxDuration
                )
            end
        end
        LastProgressStepClock = Now
        StartProgressAnimation(Progress, ProgressDuration)

        if LoadingInfo.Animated then
            ProgressLabel.TextTransparency = 0.35
            SliderGlow.BackgroundTransparency = 0.72
            TweenService:Create(ProgressLabel, Library.TweenInfo, { TextTransparency = 0 }):Play()
            TweenService:Create(SliderGlow, Library.TweenInfo, { BackgroundTransparency = 0.88 }):Play()
        end

        ProgressLabel.Text = string.format("%d/%d", Loading.CurrentStep, Loading.TotalSteps)
    end

    function Loading:SetTotalSteps(Steps)
        Loading.TotalSteps = math.max(1, Steps)
        Loading:SetCurrentStep(Loading.CurrentStep)
    end

    --// Size \\--
    function Loading:SetWindowHeight(Height)
        Loading.WindowHeight = Height
        Loading:UpdateLayout()
    end

    function Loading:SetWindowWidth(Width)
        Loading.WindowWidth = Width
        Loading:UpdateLayout()
    end

    function Loading:SetContentWidth(Width)
        Loading.ContentWidth = Width
        Loading:UpdateLayout()
    end

    function Loading:SetSidebarWidth(Width)
        Loading.SidebarWidth = Width
        Loading:UpdateLayout()
    end

    --// Sidebar \\--
    function Loading:ShowSidebarPage(Bool)
        Loading.ShowSidebar = Bool
        Loading:UpdateLayout()
    end

    --// Error Page \\--
    function Loading:ShowErrorPage(Enabled)
        Loading.IsError = Enabled
        InnerContent.Visible = not Enabled
        ErrorFrame.Visible = Enabled

        if Loading.ShowSidebar then
            Loading:ShowSidebarPage(not Enabled)
        else
            Loading:UpdateLayout()
        end
    end

    function Loading:RecalculateErrorHeight()
        local TargetWidth = (Loading.ShowSidebar and Loading.ContentWidth or Loading.WindowWidth) - 30
        local _, ErrorY = Library:GetTextBounds(ErrorLabel.Text, Library.Scheme.Font, 14, TargetWidth)

        ErrorLabel.Size = UDim2.new(1, -30, 0, ErrorY)

        local HasButtons = ErrorButtonsHolder.Visible
        local RequiredHeight = 49 -- TopBar
            + 15 -- Padding Top
            + 18 -- Title Height
            + 6 -- Padding between Title and Label
            + ErrorY -- Label Height
            + 15 -- Padding between Label and Buttons
            + (HasButtons and 48 or 0) -- Buttons Area

        Loading.WindowErrorHeight = RequiredHeight -- math.max(Loading.WindowHeight, RequiredHeight)
    end

    function Loading:SetErrorMessage(Text)
        ErrorLabel.Text = Text
        Loading:UpdateLayout()
    end

    function Loading:SetErrorButtons(Buttons)
        assert(typeof(Buttons) == "table", "Buttons must be a table")

        for _, button in ErrorButtonsHolder:GetChildren() do
            if button:IsA("Frame") then
                button:Destroy()
            end
        end

        local HasButtons = GetTableSize(Buttons) > 0
        ErrorButtonsHolder.Visible = HasButtons
        ErrorButtonsDivider.Visible = HasButtons

        for Idx, ButtonInfo in Buttons do
            local ButtonContainer = New("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(0, 26),
                Parent = ErrorButtonsHolder,
            })

            local BtnColor = "MainColor"
            local BtnOutline = "OutlineColor"
            local Variant = ButtonInfo.Variant or "Primary"

            if Variant == "Primary" then
                BtnColor = "FontColor"
                BtnOutline = "FontColor"
            elseif Variant == "Secondary" then
                BtnColor = "MainColor"
                BtnOutline = "OutlineColor"
            elseif Variant == "Destructive" then
                BtnColor = "DestructiveColor"
                BtnOutline = "DestructiveColor"
            elseif Variant == "Ghost" then
                BtnColor = "BackgroundColor"
                BtnOutline = "BackgroundColor"
            end

            local TextBtn = New("TextButton", {
                BackgroundColor3 = BtnColor,
                BorderColor3 = BtnOutline,
                Size = UDim2.fromOffset(0, 26),
                Text = "",
                AutoButtonColor = false,
                Parent = ButtonContainer,
            })
            Library:AddOutline(TextBtn)
            table.insert(
                Library.Corners,
                New("UICorner", {
                    CornerRadius = UDim.new(0, Library.CornerRadius),
                    Parent = TextBtn,
                })
            )

            New("UIPadding", {
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15),
                Parent = TextBtn,
            })

            local TextColor = Library.Scheme.FontColor
            if Variant == "Primary" then
                TextColor = Library.Scheme.BackgroundColor
            elseif Variant == "Destructive" then
                TextColor = Color3.new(1, 1, 1)
            end

            local BtnLabel = New("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = ButtonInfo.Title or Idx,
                TextColor3 = TextColor,
                TextSize = 14,
                Parent = TextBtn,
            })

            local LabelX, _ = Library:GetTextBounds(BtnLabel.Text, Library.Scheme.Font, 14, 250)
            ButtonContainer.Size = UDim2.fromOffset(LabelX + 30, 26)
            TextBtn.Size = UDim2.fromOffset(LabelX + 30, 26)

            local ActiveColor = typeof(BtnColor) == "Color3" and BtnColor or Library.Scheme[BtnColor]
            local HoverColor = Variant == "Ghost" and Library.Scheme.MainColor
                or Library:GetBetterColor(ActiveColor, 10)

            TextBtn.MouseEnter:Connect(function()
                TweenService:Create(TextBtn, Library.TweenInfo, {
                    BackgroundColor3 = HoverColor,
                }):Play()
            end)
            TextBtn.MouseLeave:Connect(function()
                TweenService:Create(TextBtn, Library.TweenInfo, {
                    BackgroundColor3 = ActiveColor,
                }):Play()
            end)

            TextBtn.MouseButton1Click:Connect(function()
                if ButtonInfo.Callback then
                    ButtonInfo.Callback(Loading)
                end
            end)
        end

        Loading:UpdateLayout()
    end

    --// Destroy/Continue \\--
    function Loading:Destroy()
        if Loading.Destroyed then
            return
        end

        Loading.Destroyed = true
        local ShouldRestoreLibrary = Library.ActiveLoading == Loading
        if ShouldRestoreLibrary then
            Library.ActiveLoading = nil
        end

        StopLoadingAnimations()

        if RotationTween then
            RotationTween:Cancel()
            RotationTween:Destroy()
            RotationTween = nil
        end

        local function FinishDestroy()
            if ScreenGui.Parent then
                ScreenGui:Destroy()
            end

            if
                ShouldRestoreLibrary
                and not Library.ActiveLoading
                and Library.Toggle
                and Library.Toggled == false
                and Library.Unloaded ~= true
            then
                Library:Toggle(true)
            end
        end

        if LoadingInfo.Animated and LoadingInfo.ExitAnimation and ScreenGui.Parent then
            MainFrame.Active = false
            TweenService:Create(
                MainFrame,
                TweenInfo.new(ExitAnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0.5, 14),
                }
            ):Play()
            if SurfaceFill then
                TweenService:Create(
                    SurfaceFill,
                    TweenInfo.new(ExitAnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    { BackgroundTransparency = 1 }
                ):Play()
            end
            TweenService:Create(
                MainScale,
                TweenInfo.new(ExitAnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { Scale = TargetScale * 0.96 }
            ):Play()

            if Backdrop then
                TweenService:Create(
                    Backdrop,
                    TweenInfo.new(ExitAnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    { BackgroundTransparency = 1 }
                ):Play()
            end

            local ExitTransitionDelay = math.max(ExitAnimationDuration, PlayLoadingGradientTransition(true))
            task.delay(ExitTransitionDelay, FinishDestroy)
        else
            FinishDestroy()
        end
    end

    Loading.Continue = Loading.Destroy

    if Library.Toggle and Library.Toggled and Library.Unloaded ~= true then
        Library:Toggle(false)
    end

    Loading:SetCurrentStep(Loading.CurrentStep)

    Library.ActiveLoading = Loading
    return Loading
end

local function OnPlayerChange()
    if Library.Unloaded then
        return
    end

    local PlayerList, ExcludedPlayerList = GetPlayers(), GetPlayers(true)
    for _, Dropdown in Options do
        if Dropdown.Type == "Dropdown" and Dropdown.SpecialType == "Player" then
            Dropdown:SetValues(Dropdown.ExcludeLocalPlayer and ExcludedPlayerList or PlayerList)
        end
    end
end

local function OnTeamChange()
    if Library.Unloaded then
        return
    end

    local TeamList = GetTeams()
    for _, Dropdown in Options do
        if Dropdown.Type == "Dropdown" and Dropdown.SpecialType == "Team" then
            Dropdown:SetValues(TeamList)
        end
    end
end

Library:GiveSignal(Players.PlayerAdded:Connect(OnPlayerChange))
Library:GiveSignal(Players.PlayerRemoving:Connect(OnPlayerChange))

Library:GiveSignal(Teams.ChildAdded:Connect(OnTeamChange))
Library:GiveSignal(Teams.ChildRemoved:Connect(OnTeamChange))

getgenv().Library = Library
return Library
