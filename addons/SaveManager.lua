local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"))

local function GetCompat()
    local seen = {}

    local function scan(env)
        if typeof(env) ~= "table" or seen[env] then
            return nil
        end

        seen[env] = true
        local obsidianCompat = rawget(env, "ObsidianCompat")
        local moonHubCompat = rawget(env, "MoonHubCompat")
        if typeof(obsidianCompat) == "table" then
            return obsidianCompat
        elseif typeof(moonHubCompat) == "table" then
            return moonHubCompat
        end
    end

    if typeof(getgenv) == "function" then
        local ok, env = pcall(getgenv)
        if ok then
            local compat = scan(env)
            if compat then
                return compat
            end
        end
    end

    return scan(shared) or scan(_G)
end

local Compat = GetCompat()

local function safeCall(fn, ...)
    if typeof(fn) ~= "function" then
        return false, "not a function"
    end

    local results = table.pack(pcall(fn, ...))
    if not results[1] then
        return false, tostring(results[2])
    end

    return true, table.unpack(results, 2, results.n)
end

local function fsIsFolder(path)
    if Compat and typeof(Compat.isFolder) == "function" then
        return Compat.isFolder(path)
    end
    if typeof(isfolder) ~= "function" then
        return false, "isfolder unavailable"
    end

    local ok, result = safeCall(isfolder, path)
    if not ok then
        return false, result
    end

    return result == true
end

local function fsIsFile(path)
    if Compat and typeof(Compat.isFile) == "function" then
        return Compat.isFile(path)
    end
    if typeof(isfile) ~= "function" then
        return false, "isfile unavailable"
    end

    local ok, result = safeCall(isfile, path)
    if not ok then
        return false, result
    end

    return result == true
end

local function fsMakeFolder(path)
    if Compat and typeof(Compat.makeFolder) == "function" then
        return Compat.makeFolder(path)
    end
    if typeof(makefolder) ~= "function" then
        return false, "makefolder unavailable"
    end

    return safeCall(makefolder, path)
end

local function fsReadFile(path)
    if Compat and typeof(Compat.readFile) == "function" then
        return Compat.readFile(path)
    end
    if typeof(readfile) ~= "function" then
        return false, "readfile unavailable"
    end

    return safeCall(readfile, path)
end

local function fsWriteFile(path, content)
    if Compat and typeof(Compat.writeFile) == "function" then
        return Compat.writeFile(path, content)
    end
    if typeof(writefile) ~= "function" then
        return false, "writefile unavailable"
    end

    return safeCall(writefile, path, content)
end

local function fsListFiles(path)
    if Compat and typeof(Compat.listFiles) == "function" then
        return Compat.listFiles(path)
    end
    if typeof(listfiles) ~= "function" then
        return false, "listfiles unavailable"
    end

    return safeCall(listfiles, path)
end

local function fsDeleteFile(path)
    if Compat and typeof(Compat.deleteFile) == "function" then
        return Compat.deleteFile(path)
    end
    if typeof(delfile) ~= "function" then
        return false, "delfile unavailable"
    end

    return safeCall(delfile, path)
end

local function compatSpawn(fn, ...)
    local args = table.pack(...)
    local function run()
        return safeCall(fn, table.unpack(args, 1, args.n))
    end

    if Compat and typeof(Compat.spawn) == "function" then
        return Compat.spawn(run)
    end
    if typeof(task) == "table" and typeof(task.spawn) == "function" then
        return true, task.spawn(run)
    end
    if typeof(spawn) == "function" then
        return true, spawn(run)
    end

    return run()
end

local function compatWait(seconds)
    if Compat and typeof(Compat.wait) == "function" then
        return Compat.wait(seconds)
    end
    if typeof(task) == "table" and typeof(task.wait) == "function" then
        return task.wait(seconds)
    elseif typeof(wait) == "function" then
        return wait(seconds)
    end

    return 0
end

local SaveManager = {}
do
    SaveManager.Folder = "ObsidianLibSettings"
    SaveManager.SubFolder = ""
    SaveManager.Ignore = {}
    SaveManager.Library = nil
    SaveManager.UseLoadingOrder = false
    SaveManager.LoadingOrder = {}
    SaveManager.Parser = {
        Toggle = {
            Save = function(idx, object)
                return { type = "Toggle", idx = idx, value = object.Value }
            end,
            Load = function(idx, data)
                local object = SaveManager.Library.Toggles[idx]
                if object and object.Value ~= data.value then
                    object:SetValue(data.value)
                end
            end,
        },
        Slider = {
            Save = function(idx, object)
                return { type = "Slider", idx = idx, value = tostring(object.Value) }
            end,
            Load = function(idx, data)
                local object = SaveManager.Library.Options[idx]
                if object and object.Value ~= data.value then
                    object:SetValue(data.value)
                end
            end,
        },
        Dropdown = {
            Save = function(idx, object)
                return { type = "Dropdown", idx = idx, value = object.Value, multi = object.Multi }
            end,
            Load = function(idx, data)
                local object = SaveManager.Library.Options[idx]
                if object and object.Value ~= data.value then
                    object:SetValue(data.value)
                end
            end,
        },
        ColorPicker = {
            Save = function(idx, object)
                return {
                    type = "ColorPicker",
                    idx = idx,
                    value = object.Value:ToHex(),
                    transparency = object.Transparency,
                }
            end,
            Load = function(idx, data)
                if SaveManager.Library.Options[idx] then
                    SaveManager.Library.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)
                end
            end,
        },
        KeyPicker = {
            Save = function(idx, object)
                return {
                    type = "KeyPicker",
                    idx = idx,
                    mode = object.Mode,
                    key = object.Value,
                    modifiers = object.Modifiers,
                }
            end,
            Load = function(idx, data)
                if SaveManager.Library.Options[idx] then
                    SaveManager.Library.Options[idx]:SetValue({ data.key, data.mode, data.modifiers })
                end
            end,
        },
        Input = {
            Save = function(idx, object)
                return { type = "Input", idx = idx, text = object.Value }
            end,
            Load = function(idx, data)
                local object = SaveManager.Library.Options[idx]
                if object and object.Value ~= data.text and type(data.text) == "string" then
                    SaveManager.Library.Options[idx]:SetValue(data.text)
                end
            end,
        },
    }

    function SaveManager:SetLibrary(library)
        self.Library = library
    end

    function SaveManager:SetLoadingOrder(enabled, order)
        self.UseLoadingOrder = enabled

        if typeof(order) == "table" then
            self.LoadingOrder = order
        end
    end

    function SaveManager:IgnoreThemeSettings()
        self:SetIgnoreIndexes({
            "BackgroundColor",
            "MainColor",
            "AccentColor",
            "OutlineColor",
            "FontColor",
            "FontFace", -- themes
            "ThemeManager_ThemeList",
            "ThemeManager_CustomThemeList",
            "ThemeManager_CustomThemeName", -- themes
        })
    end

    --// Folders \\--
    function SaveManager:CheckSubFolder(createFolder)
        if typeof(self.SubFolder) ~= "string" or self.SubFolder == "" then
            return false
        end

        if createFolder == true then
            local path = self.Folder .. "/settings/" .. self.SubFolder
            if not fsIsFolder(path) then
                local success = fsMakeFolder(path)
                if not success then
                    return false
                end
            end
        end

        return true
    end

    function SaveManager:GetPaths()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            local path = table.concat(parts, "/", 1, idx)
            if not table.find(paths, path) then
                paths[#paths + 1] = path
            end
        end

        paths[#paths + 1] = self.Folder .. "/themes"
        paths[#paths + 1] = self.Folder .. "/settings"

        if self:CheckSubFolder(false) then
            local subFolder = self.Folder .. "/settings/" .. self.SubFolder
            parts = subFolder:split("/")

            for idx = 1, #parts do
                local path = table.concat(parts, "/", 1, idx)
                if not table.find(paths, path) then
                    paths[#paths + 1] = path
                end
            end
        end

        return paths
    end

    function SaveManager:BuildFolderTree()
        local paths = self:GetPaths()

        for i = 1, #paths do
            local str = paths[i]
            local exists, existsError = fsIsFolder(str)
            if exists then
                continue
            end

            local success, errorMessage = fsMakeFolder(str)
            if not success then
                return false, existsError or errorMessage or "failed to create folder"
            end
        end

        return true
    end

    function SaveManager:CheckFolderTree()
        if fsIsFolder(self.Folder) then
            return true
        end

        local success, errorMessage = SaveManager:BuildFolderTree()
        if not success then
            return false, errorMessage
        end

        compatWait(0.1)
        return true
    end

    function SaveManager:SetIgnoreIndexes(list)
        for _, key in pairs(list) do
            self.Ignore[key] = true
        end
    end

    function SaveManager:SetFolder(folder)
        self.Folder = folder
        return self:BuildFolderTree()
    end

    function SaveManager:SetSubFolder(folder)
        self.SubFolder = folder
        return self:BuildFolderTree()
    end

    --// Save, Load, Delete, Refresh \\--
    function SaveManager:Save(name)
        if not name then
            return false, "no config file is selected"
        end
        local treeSuccess, treeError = SaveManager:CheckFolderTree()
        if not treeSuccess then
            return false, "filesystem unavailable: " .. tostring(treeError)
        end

        local fullPath = self.Folder .. "/settings/" .. name .. ".json"
        if SaveManager:CheckSubFolder(true) then
            fullPath = self.Folder .. "/settings/" .. self.SubFolder .. "/" .. name .. ".json"
        end

        local data = {
            objects = {},
        }

        for idx, toggle in pairs(self.Library.Toggles) do
            if not toggle.Type then
                continue
            end
            if not self.Parser[toggle.Type] then
                continue
            end
            if self.Ignore[idx] then
                continue
            end

            table.insert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
        end

        for idx, option in pairs(self.Library.Options) do
            if not option.Type then
                continue
            end
            if not self.Parser[option.Type] then
                continue
            end
            if self.Ignore[idx] then
                continue
            end

            table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
        end

        local success, encoded = pcall(HttpService.JSONEncode, HttpService, data)
        if not success then
            return false, "failed to encode data"
        end

        local writeSuccess, writeError = fsWriteFile(fullPath, encoded)
        if not writeSuccess then
            return false, "write file error: " .. tostring(writeError)
        end

        return true
    end

    function SaveManager:Load(name)
        if not name then
            return false, "no config file is selected"
        end
        local treeSuccess, treeError = SaveManager:CheckFolderTree()
        if not treeSuccess then
            return false, "filesystem unavailable: " .. tostring(treeError)
        end

        local file = self.Folder .. "/settings/" .. name .. ".json"
        if SaveManager:CheckSubFolder(true) then
            file = self.Folder .. "/settings/" .. self.SubFolder .. "/" .. name .. ".json"
        end

        local fileExists, fileError = fsIsFile(file)
        if not fileExists then
            return false, fileError or "invalid file"
        end

        local readSuccess, fileData = fsReadFile(file)
        if not readSuccess then
            return false, "read file error: " .. tostring(fileData)
        end

        local success, decoded = pcall(HttpService.JSONDecode, HttpService, fileData)
        if not success then
            return false, "decode error"
        end
        if typeof(decoded) ~= "table" or typeof(decoded.objects) ~= "table" then
            return false, "invalid config data"
        end

        if self.UseLoadingOrder == true and typeof(self.LoadingOrder) == "table" then
            table.sort(decoded.objects, function(a, b)
                local aIndex = table.find(self.LoadingOrder, a.type) or math.huge
                local bIndex = table.find(self.LoadingOrder, b.type) or math.huge
                return aIndex < bIndex
            end)
        end

        for _, option in decoded.objects do
            if not option.type then
                continue
            end
            if not self.Parser[option.type] then
                continue
            end
            if self.Ignore[option.idx] then
                continue
            end

            compatSpawn(self.Parser[option.type].Load, option.idx, option) -- async so the config loading wont get stuck.
        end

        return true
    end

    function SaveManager:Delete(name)
        if not name then
            return false, "no config file is selected"
        end

        local file = self.Folder .. "/settings/" .. name .. ".json"
        if SaveManager:CheckSubFolder(true) then
            file = self.Folder .. "/settings/" .. self.SubFolder .. "/" .. name .. ".json"
        end

        local fileExists, fileError = fsIsFile(file)
        if not fileExists then
            return false, fileError or "invalid file"
        end

        local success, deleteError = fsDeleteFile(file)
        if not success then
            return false, "delete file error: " .. tostring(deleteError)
        end

        return true
    end

    function SaveManager:RefreshConfigList()
        local success, data = pcall(function()
            SaveManager:CheckFolderTree()

            local list = {}
            local out = {}

            if SaveManager:CheckSubFolder(true) then
                local listSuccess
                listSuccess, list = fsListFiles(self.Folder .. "/settings/" .. self.SubFolder)
                if not listSuccess then
                    return {}
                end
            else
                local listSuccess
                listSuccess, list = fsListFiles(self.Folder .. "/settings")
                if not listSuccess then
                    return {}
                end
            end
            if typeof(list) ~= "table" then
                list = {}
            end

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
        end)

        if not success then
            if self.Library then
                self.Library:Notify("Failed to load config list: " .. tostring(data))
            else
                warn("Failed to load config list: " .. tostring(data))
            end

            return {}
        end

        return data
    end

    --// Auto Load \\--
    function SaveManager:GetAutoloadConfig()
        local treeSuccess = SaveManager:CheckFolderTree()
        if not treeSuccess then
            return "none"
        end

        local autoLoadPath = self.Folder .. "/settings/autoload.txt"
        if SaveManager:CheckSubFolder(true) then
            autoLoadPath = self.Folder .. "/settings/" .. self.SubFolder .. "/autoload.txt"
        end

        if fsIsFile(autoLoadPath) then
            local successRead, name = fsReadFile(autoLoadPath)
            if not successRead then
                return "none"
            end

            name = tostring(name)
            return if name == "" then "none" else name
        end

        return "none"
    end

    function SaveManager:LoadAutoloadConfig()
        local treeSuccess, treeError = SaveManager:CheckFolderTree()
        if not treeSuccess then
            if self.Library then
                self.Library:Notify("Failed to load autoload config: " .. tostring(treeError))
            end
            return
        end

        local autoLoadPath = self.Folder .. "/settings/autoload.txt"
        if SaveManager:CheckSubFolder(true) then
            autoLoadPath = self.Folder .. "/settings/" .. self.SubFolder .. "/autoload.txt"
        end

        if fsIsFile(autoLoadPath) then
            local successRead, name = fsReadFile(autoLoadPath)
            if not successRead then
                if self.Library then
                    self.Library:Notify("Failed to load autoload config: read file error")
                end
                return
            end

            local success, err = self:Load(name)
            if not success then
                if self.Library then
                    self.Library:Notify("Failed to load autoload config: " .. err)
                end
                return
            end

            if self.Library then
                self.Library:Notify(string.format("Auto loaded config %q", name))
            end
        end
    end

    function SaveManager:SaveAutoloadConfig(name)
        local treeSuccess, treeError = SaveManager:CheckFolderTree()
        if not treeSuccess then
            return false, "filesystem unavailable: " .. tostring(treeError)
        end

        local autoLoadPath = self.Folder .. "/settings/autoload.txt"
        if SaveManager:CheckSubFolder(true) then
            autoLoadPath = self.Folder .. "/settings/" .. self.SubFolder .. "/autoload.txt"
        end

        local success, writeError = fsWriteFile(autoLoadPath, name)
        if not success then
            return false, "write file error: " .. tostring(writeError)
        end

        return true, ""
    end

    function SaveManager:DeleteAutoLoadConfig()
        local treeSuccess, treeError = SaveManager:CheckFolderTree()
        if not treeSuccess then
            return false, "filesystem unavailable: " .. tostring(treeError)
        end

        local autoLoadPath = self.Folder .. "/settings/autoload.txt"
        if SaveManager:CheckSubFolder(true) then
            autoLoadPath = self.Folder .. "/settings/" .. self.SubFolder .. "/autoload.txt"
        end

        local success, deleteError = fsDeleteFile(autoLoadPath)
        if not success then
            return false, "delete file error: " .. tostring(deleteError)
        end

        return true, ""
    end

    --// GUI \\--
    function SaveManager:BuildConfigSection(tab)
        assert(self.Library, "Must set SaveManager.Library")

        local section = tab:AddRightGroupbox("Configuration", "folder-cog")

        section:AddInput("SaveManager_ConfigName", { Text = "Config name" })
        section:AddButton("Create config", function()
            local name = self.Library.Options.SaveManager_ConfigName.Value

            if name:gsub(" ", "") == "" then
                self.Library:Notify("Invalid config name (empty)", 2)
                return
            end

            local success, err = self:Save(name)
            if not success then
                self.Library:Notify("Failed to create config: " .. err)
                return
            end

            self.Library:Notify(string.format("Created config %q", name))
            self.Library.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            self.Library.Options.SaveManager_ConfigList:SetValue(nil)
        end)

        section:AddDivider()

        section:AddDropdown(
            "SaveManager_ConfigList",
            { Text = "Config list", Values = self:RefreshConfigList(), AllowNull = true }
        )
        section:AddButton("Load config", function()
            local name = self.Library.Options.SaveManager_ConfigList.Value

            local success, err = self:Load(name)
            if not success then
                self.Library:Notify("Failed to load config: " .. err)
                return
            end

            self.Library:Notify(string.format("Loaded config %q", name))
        end)
        section:AddButton("Overwrite config", function()
            local name = self.Library.Options.SaveManager_ConfigList.Value

            local success, err = self:Save(name)
            if not success then
                self.Library:Notify("Failed to overwrite config: " .. err)
                return
            end

            self.Library:Notify(string.format("Overwrote config %q", name))
        end)

        section:AddButton("Delete config", function()
            local name = self.Library.Options.SaveManager_ConfigList.Value

            local success, err = self:Delete(name)
            if not success then
                self.Library:Notify("Failed to delete config: " .. err)
                return
            end

            self.Library:Notify(string.format("Deleted config %q", name))
            self.Library.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            self.Library.Options.SaveManager_ConfigList:SetValue(nil)
        end)

        section:AddButton("Refresh list", function()
            self.Library.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            self.Library.Options.SaveManager_ConfigList:SetValue(nil)
        end)

        section:AddButton("Set as autoload", function()
            local name = self.Library.Options.SaveManager_ConfigList.Value

            local success, err = self:SaveAutoloadConfig(name)
            if not success then
                self.Library:Notify("Failed to set autoload config: " .. err)
                return
            end

            self.Library:Notify(string.format("Set %q to auto load", name))
            self.AutoloadConfigLabel:SetText("Current autoload config: " .. name)
        end)
        section:AddButton("Reset autoload", function()
            local success, err = self:DeleteAutoLoadConfig()
            if not success then
                self.Library:Notify("Failed to set autoload config: " .. err)
                return
            end

            self.Library:Notify("Set autoload to none")
            self.AutoloadConfigLabel:SetText("Current autoload config: none")
        end)

        self.AutoloadConfigLabel = section:AddLabel("Current autoload config: " .. self:GetAutoloadConfig(), true)

        -- self:LoadAutoloadConfig()
        self:SetIgnoreIndexes({ "SaveManager_ConfigList", "SaveManager_ConfigName" })
    end

    SaveManager:BuildFolderTree()
end

return SaveManager
