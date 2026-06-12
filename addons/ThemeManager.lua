local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local clonefunction = (clonefunction or copyfunction or function(func) 
    return func 
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local isfolder, isfile, listfiles = isfolder, isfile, listfiles

if typeof(clonefunction) == "function" then
    -- Fix is_____ functions for shitsploits, those functions should never error, only return a boolean.

    local
        isfolder_copy,
        isfile_copy,
        listfiles_copy = clonefunction(isfolder), clonefunction(isfile), clonefunction(listfiles)

    local isfolder_success, isfolder_error = pcall(function()
        return isfolder_copy("test" .. tostring(math.random(1000000, 9999999)))
    end)

    if isfolder_success == false or typeof(isfolder_error) ~= "boolean" then
        isfolder = function(folder)
            local success, data = pcall(isfolder_copy, folder)
            return (if success then data else false)
        end

        isfile = function(file)
            local success, data = pcall(isfile_copy, file)
            return (if success then data else false)
        end

        listfiles = function(folder)
            local success, data = pcall(listfiles_copy, folder)
            return (if success then data else {})
        end
    end
end

local ThemeManager = {}
do
    local ThemeFields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
    local ThemeColorFields = {}
    for _, Field in ThemeFields do
        ThemeColorFields[Field] = true
    end

    ThemeManager.Folder = "ObsidianLibSettings"
    -- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

    ThemeManager.Library = nil
    ThemeManager.AppliedToTab = false
    ThemeManager.ThemeGradients = true
    ThemeManager.BuiltInThemes = {
        ["Default"] = {
            1,
            { FontColor = "ffffff", MainColor = "191919", AccentColor = "7d55ff", BackgroundColor = "0f0f0f", OutlineColor = "282828" },
        },
        ["BBot"] = {
            2,
            { FontColor = "ffffff", MainColor = "1e1e1e", AccentColor = "7e48a3", BackgroundColor = "232323", OutlineColor = "141414" },
        },
        ["Fatality"] = {
            3,
            { FontColor = "ffffff", MainColor = "1e1842", AccentColor = "c50754", BackgroundColor = "191335", OutlineColor = "3c355d" },
        },
        ["Jester"] = {
            4,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "db4467", BackgroundColor = "1c1c1c", OutlineColor = "373737" },
        },
        ["Mint"] = {
            5,
            { FontColor = "ffffff", MainColor = "242424", AccentColor = "3db488", BackgroundColor = "1c1c1c", OutlineColor = "373737" },
        },
        ["Tokyo Night"] = {
            6,
            { FontColor = "ffffff", MainColor = "191925", AccentColor = "6759b3", BackgroundColor = "16161f", OutlineColor = "323232" },
        },
        ["Ubuntu"] = {
            7,
            { FontColor = "ffffff", MainColor = "3e3e3e", AccentColor = "e2581e", BackgroundColor = "323232", OutlineColor = "191919" },
        },
        ["Quartz"] = {
            8,
            { FontColor = "ffffff", MainColor = "232330", AccentColor = "426e87", BackgroundColor = "1d1b26", OutlineColor = "27232f" },
        },
        ["Nord"] = {
            9,
            { FontColor = "eceff4", MainColor = "3b4252", AccentColor = "88c0d0", BackgroundColor = "2e3440", OutlineColor = "4c566a" },
        },
        ["Dracula"] = {
            10,
            { FontColor = "f8f8f2", MainColor = "44475a", AccentColor = "ff79c6", BackgroundColor = "282a36", OutlineColor = "6272a4" },
        },
        ["Monokai"] = {
            11,
            { FontColor = "f8f8f2", MainColor = "272822", AccentColor = "f92672", BackgroundColor = "1e1f1c", OutlineColor = "49483e" },
        },
        ["Gruvbox"] = {
            12,
            { FontColor = "ebdbb2", MainColor = "3c3836", AccentColor = "fb4934", BackgroundColor = "282828", OutlineColor = "504945" },
        },
        ["Solarized"] = {
            13,
            { FontColor = "839496", MainColor = "073642", AccentColor = "cb4b16", BackgroundColor = "002b36", OutlineColor = "586e75" },
        },
        ["Catppuccin"] = {
            14,
            { FontColor = "d9e0ee", MainColor = "302d41", AccentColor = "f5c2e7", BackgroundColor = "1e1e2e", OutlineColor = "575268" },
        },
        ["One Dark"] = {
            15,
            { FontColor = "abb2bf", MainColor = "282c34", AccentColor = "c678dd", BackgroundColor = "21252b", OutlineColor = "5c6370" },
        },
        ["Cyberpunk"] = {
            16,
            { FontColor = "f9f9f9", MainColor = "262335", AccentColor = "00ff9f", BackgroundColor = "1a1a2e", OutlineColor = "413c5e" },
        },
        ["Oceanic Next"] = {
            17,
            { FontColor = "d8dee9", MainColor = "1b2b34", AccentColor = "6699cc", BackgroundColor = "16232a", OutlineColor = "343d46" },
        },
        ["Material"] = {
            18,
            { FontColor = "eeffff", MainColor = "212121", AccentColor = "82aaff", BackgroundColor = "151515", OutlineColor = "424242" },
        },
        ["Gradient Violet Storm"] = {
            19,
            { FontColor = "ffffff", MainColor = "21182f", AccentColor = "9b5cff", BackgroundColor = "100b1a", OutlineColor = "4d3a73", GradientColor1 = "9b5cff", GradientColor2 = "120c28", GradientRotation = 35 },
        },
        ["Gradient Aurora"] = {
            20,
            { FontColor = "f4fff8", MainColor = "102522", AccentColor = "42f5b3", BackgroundColor = "071514", OutlineColor = "236b62", GradientColor1 = "42f5b3", GradientColor2 = "2d7dff", GradientRotation = 25 },
        },
        ["Gradient Sunset"] = {
            21,
            { FontColor = "fff8f0", MainColor = "2b181d", AccentColor = "ff8a5b", BackgroundColor = "140b12", OutlineColor = "704057", GradientColor1 = "ff8a5b", GradientColor2 = "a855f7", GradientRotation = 32 },
        },
        ["Gradient Ocean"] = {
            22,
            { FontColor = "eaf8ff", MainColor = "102033", AccentColor = "38bdf8", BackgroundColor = "07111f", OutlineColor = "24577a", GradientColor1 = "38bdf8", GradientColor2 = "2563eb", GradientRotation = 42 },
        },
        ["Gradient Emerald"] = {
            23,
            { FontColor = "ecfdf5", MainColor = "12261d", AccentColor = "34d399", BackgroundColor = "08150f", OutlineColor = "27694b", GradientColor1 = "34d399", GradientColor2 = "0f766e", GradientRotation = 28 },
        },
        ["Gradient Crimson"] = {
            24,
            { FontColor = "fff1f2", MainColor = "2a1418", AccentColor = "fb7185", BackgroundColor = "13070a", OutlineColor = "74323e", GradientColor1 = "fb7185", GradientColor2 = "dc2626", GradientRotation = 38 },
        },
        ["Gradient Cyber Lime"] = {
            25,
            { FontColor = "f7ffe5", MainColor = "1c2513", AccentColor = "a3e635", BackgroundColor = "0c1208", OutlineColor = "556f20", GradientColor1 = "a3e635", GradientColor2 = "06b6d4", GradientRotation = 20 },
        },
        ["Gradient Sakura"] = {
            26,
            { FontColor = "fff7fb", MainColor = "2d1b27", AccentColor = "f9a8d4", BackgroundColor = "140b12", OutlineColor = "7a4562", GradientColor1 = "f9a8d4", GradientColor2 = "f472b6", GradientRotation = 34 },
        },
        ["Gradient Royal"] = {
            27,
            { FontColor = "f5f3ff", MainColor = "1d1b35", AccentColor = "8b5cf6", BackgroundColor = "0e0b1f", OutlineColor = "5546a0", GradientColor1 = "8b5cf6", GradientColor2 = "3b82f6", GradientRotation = 45 },
        },
        ["Gradient Ice"] = {
            28,
            { FontColor = "f8fbff", MainColor = "172435", AccentColor = "93c5fd", BackgroundColor = "0b1320", OutlineColor = "496987", GradientColor1 = "93c5fd", GradientColor2 = "67e8f9", GradientRotation = 18 },
        },
        ["Gradient Amber"] = {
            29,
            { FontColor = "fffbeb", MainColor = "2b2112", AccentColor = "f59e0b", BackgroundColor = "151006", OutlineColor = "72501d", GradientColor1 = "f59e0b", GradientColor2 = "ef4444", GradientRotation = 30 },
        },
        ["Gradient Matrix"] = {
            30,
            { FontColor = "dcfce7", MainColor = "101c12", AccentColor = "22c55e", BackgroundColor = "050c07", OutlineColor = "276749", GradientColor1 = "22c55e", GradientColor2 = "14532d", GradientRotation = 22 },
        },
        ["Gradient Galaxy"] = {
            31,
            { FontColor = "f5f5ff", MainColor = "1b1734", AccentColor = "c084fc", BackgroundColor = "090819", OutlineColor = "53427a", GradientColor1 = "c084fc", GradientColor2 = "312e81", GradientRotation = 48 },
        },
        ["Gradient Lava"] = {
            32,
            { FontColor = "fff7ed", MainColor = "2c1910", AccentColor = "fb923c", BackgroundColor = "160a05", OutlineColor = "7c3a17", GradientColor1 = "fb923c", GradientColor2 = "b91c1c", GradientRotation = 36 },
        },
        ["Gradient Minty"] = {
            33,
            { FontColor = "f0fdfa", MainColor = "13221f", AccentColor = "5eead4", BackgroundColor = "071311", OutlineColor = "2b7169", GradientColor1 = "5eead4", GradientColor2 = "14b8a6", GradientRotation = 26 },
        },
        ["Gradient Candy"] = {
            34,
            { FontColor = "fff7ff", MainColor = "29172a", AccentColor = "f0abfc", BackgroundColor = "130812", OutlineColor = "7a3f7d", GradientColor1 = "f0abfc", GradientColor2 = "fb7185", GradientRotation = 40 },
        },
        ["Gradient Midnight"] = {
            35,
            { FontColor = "e0f2fe", MainColor = "111827", AccentColor = "60a5fa", BackgroundColor = "030712", OutlineColor = "334155", GradientColor1 = "60a5fa", GradientColor2 = "7c3aed", GradientRotation = 46 },
        },
    }

    local function CleanHex(Value, Fallback)
        local Hex = tostring(Value or Fallback or "ffffff"):gsub("#", "")
        return Hex ~= "" and Hex or tostring(Fallback or "ffffff")
    end

    local function ColorFromHex(Value, Fallback)
        local Success, Color = pcall(Color3.fromHex, CleanHex(Value, Fallback))
        if Success then
            return Color
        end

        return Color3.fromHex(CleanHex(Fallback, "ffffff"))
    end

    local function NumberFrom(Value, Fallback)
        return tonumber(Value) or Fallback
    end

    local function ThemeUsesGradient(Scheme)
        if Scheme.Gradient == false or Scheme.Gradient == "false" then
            return false
        end

        return true
    end

    local function BuildThemeGradient(Scheme, Preview)
        if not ThemeUsesGradient(Scheme) then
            return nil
        end

        local FromColor = ColorFromHex(Scheme.GradientColor1 or Scheme.GradientFromColor or Scheme.AccentColor, Scheme.AccentColor)
        local ToColor = ColorFromHex(Scheme.GradientColor2 or Scheme.GradientToColor or Scheme.BackgroundColor, Scheme.BackgroundColor)
        local StartTransparency = Preview and 0.05
            or NumberFrom(Scheme.GradientTransparencyStart or Scheme.GradientTransparency0, 0.84)
        local EndTransparency = Preview and 0.32
            or NumberFrom(Scheme.GradientTransparencyEnd or Scheme.GradientTransparency1, 0.98)

        return {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, FromColor),
                ColorSequenceKeypoint.new(1, ToColor),
            }),
            Rotation = NumberFrom(Scheme.GradientRotation, 35),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, math.clamp(StartTransparency, 0, 1)),
                NumberSequenceKeypoint.new(1, math.clamp(EndTransparency, 0, 1)),
            }),
        }
    end

    local function BuildThemeCard(Name, Scheme)
        local Gradient = BuildThemeGradient(Scheme, true)

        return {
            Text = Name,
            Description = string.format("Accent #%s / Main #%s", CleanHex(Scheme.AccentColor), CleanHex(Scheme.MainColor)),
            Icon = "paintbrush",
            BottomBarTransparency = 0.16,
            StrokeColor = ColorFromHex(Scheme.AccentColor, "7d55ff"),
            StrokeTransparency = 0.25,
            PreviewBackgroundColor = ColorFromHex(Scheme.BackgroundColor, "0f0f0f"),
            PreviewMainColor = ColorFromHex(Scheme.MainColor, "191919"),
            PreviewAccentColor = ColorFromHex(Scheme.AccentColor, "7d55ff"),
            PreviewOutlineColor = ColorFromHex(Scheme.OutlineColor, "282828"),
            PreviewFontColor = ColorFromHex(Scheme.FontColor, "ffffff"),
            PreviewSwatches = {
                ColorFromHex(Scheme.BackgroundColor, "0f0f0f"),
                ColorFromHex(Scheme.MainColor, "191919"),
                ColorFromHex(Scheme.AccentColor, "7d55ff"),
                ColorFromHex(Scheme.OutlineColor, "282828"),
                ColorFromHex(Scheme.FontColor, "ffffff"),
            },
            GradientColorSequence = Gradient and Gradient.Color or nil,
            GradientRotation = Gradient and Gradient.Rotation or nil,
            GradientTransparency = Gradient and Gradient.Transparency or nil,
        }
    end

    function ThemeManager:SetLibrary(library)
        self.Library = library
    end

    --// Folders \\--
    function ThemeManager:GetPaths()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            paths[#paths + 1] = table.concat(parts, "/", 1, idx)
        end

        paths[#paths + 1] = self.Folder .. "/themes"

        return paths
    end

    function ThemeManager:BuildFolderTree()
        local paths = self:GetPaths()

        for i = 1, #paths do
            local str = paths[i]
            if isfolder(str) then
                continue
            end
            makefolder(str)
        end
    end

    function ThemeManager:CheckFolderTree()
        if isfolder(self.Folder) then
            return
        end
        self:BuildFolderTree()

        task.wait(0.1)
    end

    function ThemeManager:SetFolder(folder)
        self.Folder = folder
        self:BuildFolderTree()
    end

    --// Apply, Update theme \\--
    function ThemeManager:ApplyTheme(theme)
        local customThemeData = self:GetCustomTheme(theme)
        local data = self.BuiltInThemes[theme]
        local scheme = customThemeData or (data and data[2])

        if not scheme then
            return
        end

        for idx, val in pairs(scheme) do
            if idx == "VideoLink" then
                continue
            elseif idx == "FontFace" then
                self.Library:SetFont(Enum.Font[val])

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValue(val)
                end
            elseif ThemeColorFields[idx] then
                local Color = ColorFromHex(val, ThemeManager.BuiltInThemes["Default"][2][idx])
                self.Library.Scheme[idx] = Color

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValueRGB(Color)
                end
            end
        end

        if self.ThemeGradients and self.Library.SetGradient then
            local Gradient = BuildThemeGradient(scheme)
            if Gradient then
                self.Library:SetGradient(true, Gradient)
            else
                self.Library:SetGradient(false)
            end
        end

        self:ThemeUpdate()
    end

    function ThemeManager:ThemeUpdate()
        for i, field in ThemeFields do
            if self.Library.Options and self.Library.Options[field] then
                self.Library.Scheme[field] = self.Library.Options[field].Value
            end
        end

        self.Library:UpdateColorsUsingRegistry()
    end

    --// Get, Load, Save, Delete, Refresh \\--
    function ThemeManager:GetCustomTheme(file)
        local path = self.Folder .. "/themes/" .. file .. ".json"
        if not isfile(path) then
            return nil
        end

        local data = readfile(path)
        local success, decoded = pcall(HttpService.JSONDecode, HttpService, data)

        if not success then
            return nil
        end

        return decoded
    end

    function ThemeManager:LoadDefault()
        local theme = "Default"
        local content = isfile(self.Folder .. "/themes/default.txt") and readfile(self.Folder .. "/themes/default.txt")

        local isDefault = true
        if content then
            if self.BuiltInThemes[content] then
                theme = content
            elseif self:GetCustomTheme(content) then
                theme = content
                isDefault = false
            end
        elseif self.BuiltInThemes[self.DefaultTheme] then
            theme = self.DefaultTheme
        end

        if isDefault then
            self.Library.Options.ThemeManager_ThemeList:SetValue(theme)
        else
            self:ApplyTheme(theme)
        end
    end

    function ThemeManager:SaveDefault(theme)
        writefile(self.Folder .. "/themes/default.txt", theme)
    end

    function ThemeManager:SetDefaultTheme(theme)
        assert(self.Library, "Must set ThemeManager.Library first!")
        assert(not self.AppliedToTab, "Cannot set default theme after applying ThemeManager to a tab!")

        local FinalTheme = {}
        local LibraryScheme = {}
        for _, field in ThemeFields do
            if typeof(theme[field]) == "Color3" then
                FinalTheme[field] = "#" .. theme[field]:ToHex()
                LibraryScheme[field] = theme[field]

            elseif typeof(theme[field]) == "string" then
                FinalTheme[field] = if theme[field]:sub(1, 1) == "#" then theme[field] else ("#" .. theme[field])
                LibraryScheme[field] = Color3.fromHex(theme[field])

            else
                FinalTheme[field] = ThemeManager.BuiltInThemes["Default"][2][field]
                LibraryScheme[field] = Color3.fromHex(ThemeManager.BuiltInThemes["Default"][2][field])
            end
        end

        if typeof(theme["FontFace"]) == "EnumItem" then
            FinalTheme["FontFace"] = theme["FontFace"].Name
            LibraryScheme["Font"] = Font.fromEnum(theme["FontFace"])

        elseif typeof(theme["FontFace"]) == "string" then
            FinalTheme["FontFace"] = theme["FontFace"]
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font[theme["FontFace"]])

        else
            FinalTheme["FontFace"] = "Code"
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font.Code)
        end

        for _, field in { "RedColor", "DarkColor", "WhiteColor" } do
            LibraryScheme[field] = self.Library.Scheme[field]
        end

        self.Library.Scheme = LibraryScheme
        self.BuiltInThemes["Default"] = { 1, FinalTheme }

        self.Library:UpdateColorsUsingRegistry()
    end

    function ThemeManager:SaveCustomTheme(file)
        if file:gsub(" ", "") == "" then
            self.Library:Notify("Invalid file name for theme (empty)", 3)
            return
        end

        local theme = {}
        for _, field in ThemeFields do
            theme[field] = self.Library.Options[field].Value:ToHex()
        end
        theme["FontFace"] = self.Library.Options["FontFace"].Value

        writefile(self.Folder .. "/themes/" .. file .. ".json", HttpService:JSONEncode(theme))
    end

    function ThemeManager:Delete(name)
        if not name then
            return false, "no config file is selected"
        end

        local file = self.Folder .. "/themes/" .. name .. ".json"
        if not isfile(file) then
            return false, "invalid file"
        end

        local success = pcall(delfile, file)
        if not success then
            return false, "delete file error"
        end

        return true
    end

    function ThemeManager:ReloadCustomThemes()
        local list = listfiles(self.Folder .. "/themes")

        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == ".json" then
                -- i hate this but it has to be done ...

                local pos = file:find(".json", 1, true)
                local start = pos

                local char = file:sub(pos, pos)
                while char ~= "/" and char ~= "\\" and char ~= "" do
                    pos = pos - 1
                    char = file:sub(pos, pos)
                end

                if char == "/" or char == "\\" then
                    table.insert(out, file:sub(pos + 1, start - 1))
                end
            end
        end

        return out
    end

    --// GUI \\--
    function ThemeManager:CreateThemeManager(groupbox)
        groupbox
            :AddLabel("Background color")
            :AddColorPicker("BackgroundColor", { Default = self.Library.Scheme.BackgroundColor })
        groupbox:AddLabel("Main color"):AddColorPicker("MainColor", { Default = self.Library.Scheme.MainColor })
        groupbox:AddLabel("Accent color"):AddColorPicker("AccentColor", { Default = self.Library.Scheme.AccentColor })
        groupbox
            :AddLabel("Outline color")
            :AddColorPicker("OutlineColor", { Default = self.Library.Scheme.OutlineColor })
        groupbox:AddLabel("Font color"):AddColorPicker("FontColor", { Default = self.Library.Scheme.FontColor })
        groupbox:AddDropdown("FontFace", {
            Text = "Font Face",
            Default = "Code",
            Values = { "BuilderSans", "Code", "Fantasy", "Gotham", "Jura", "Roboto", "RobotoMono", "SourceSans" },
        })

        local ThemesArray = {}
        local ThemeCards = {}
        local ThemeValueImages = {}
        for Name, Theme in pairs(self.BuiltInThemes) do
            table.insert(ThemesArray, Name)
            ThemeCards[Name] = BuildThemeCard(Name, Theme[2])
            ThemeValueImages[Name] = "paintbrush"
        end

        table.sort(ThemesArray, function(a, b)
            return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1]
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown("ThemeManager_ThemeList", {
            Text = "Theme",
            Values = ThemesArray,
            Default = 1,
            Searchable = true,
            CardDropdown = true,
            CardHeight = 88,
            MaxVisibleDropdownItems = 4,
            ValueImages = ThemeValueImages,
            Cards = ThemeCards,
        })
        groupbox:AddButton("Set as default", function()
            self:SaveDefault(self.Library.Options.ThemeManager_ThemeList.Value)
            self.Library:Notify(
                string.format("Set default theme to %q", self.Library.Options.ThemeManager_ThemeList.Value)
            )
        end)

        self.Library.Options.ThemeManager_ThemeList:OnChanged(function()
            self:ApplyTheme(self.Library.Options.ThemeManager_ThemeList.Value)
        end)

        groupbox:AddDivider()

        groupbox:AddInput("ThemeManager_CustomThemeName", { Text = "Custom theme name" })
        groupbox:AddButton("Create theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeName.Value

            if name:gsub(" ", "") == "" then
                self.Library:Notify("Invalid theme name (empty)", 2)
                return
            end

            self:SaveCustomTheme(name)

            self.Library:Notify(string.format("Created theme %q", name))
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown(
            "ThemeManager_CustomThemeList",
            { Text = "Custom themes", Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 }
        )
        groupbox:AddButton("Load theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:ApplyTheme(name)
            self.Library:Notify(string.format("Loaded theme %q", name))
        end)
        groupbox:AddButton("Overwrite theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:SaveCustomTheme(name)
            self.Library:Notify(string.format("Overwrote config %q", name))
        end)
        groupbox:AddButton("Delete theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:Delete(name)
            if not success then
                self.Library:Notify("Failed to delete theme: " .. err)
                return
            end

            self.Library:Notify(string.format("Deleted theme %q", name))
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Refresh list", function()
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Set as default", function()
            if
                self.Library.Options.ThemeManager_CustomThemeList.Value ~= nil
                and self.Library.Options.ThemeManager_CustomThemeList.Value ~= ""
            then
                self:SaveDefault(self.Library.Options.ThemeManager_CustomThemeList.Value)
                self.Library:Notify(
                    string.format("Set default theme to %q", self.Library.Options.ThemeManager_CustomThemeList.Value)
                )
            end
        end)
        groupbox:AddButton("Reset default", function()
            local success = pcall(delfile, self.Folder .. "/themes/default.txt")
            if not success then
                self.Library:Notify("Failed to reset default: delete file error")
                return
            end

            self.Library:Notify("Set default theme to nothing")
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        self:LoadDefault()
        self.AppliedToTab = true

        local function UpdateTheme()
            self:ThemeUpdate()
        end

        self.Library.Options.BackgroundColor:OnChanged(UpdateTheme)
        self.Library.Options.MainColor:OnChanged(UpdateTheme)
        self.Library.Options.AccentColor:OnChanged(UpdateTheme)
        self.Library.Options.OutlineColor:OnChanged(UpdateTheme)
        self.Library.Options.FontColor:OnChanged(UpdateTheme)
        self.Library.Options.FontFace:OnChanged(function(Value)
            self.Library:SetFont(Enum.Font[Value])
            self.Library:UpdateColorsUsingRegistry()
        end)
    end

    function ThemeManager:CreateGroupBox(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        return tab:AddLeftGroupbox("Themes", "paintbrush")
    end

    function ThemeManager:ApplyToTab(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        local groupbox = self:CreateGroupBox(tab)
        self:CreateThemeManager(groupbox)
    end

    function ThemeManager:ApplyToGroupbox(groupbox)
        assert(self.Library, "Must set ThemeManager.Library first!")
        self:CreateThemeManager(groupbox)
    end

    ThemeManager:BuildFolderTree()
end

getgenv().ObsidianThemeManager = ThemeManager
return ThemeManager
