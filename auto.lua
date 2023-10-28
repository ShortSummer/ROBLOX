--[[
    CustomFunctionLoader.lua
    Loads custom functions


]]
--[[
getgenv().getallfiles = function()
    local t = {}
    local currCrawlPath = "./"
    local function crawlAdd()
        for i, file in pairs(listfiles(currCrawlPath)) do
            local e = string.sub(file, string.find(file,"/workspace")+13)
            print(e)
            if pcall(function() listfiles(currCrawlPath..e) end) then
                currCrawlPath = currCrawlPath .. string.split(e, "/")[1]
                crawlAdd()
            else
                table.insert(t, e)          
            end
        end
    end
    crawlAdd()
    return t
end
]]

getgenv().getallfiles = function()
    local t = {}
    local function getfiles(folder)
        for _,file in pairs(listfiles(folder)) do
            if isfolder(file) then
                getfiles(file)
            else
                local inalr = false
                local e = string.sub(file, string.find(file,"/workspace")+13)
                for i, v in t do if v == e then inalr = true end end
                if not inalr and not string.find(file, ".DS_Store") then table.insert(t,e) end
            end
        end
    end
    getfiles("./")
    return t
end

for i,v in getallfiles() do
    print(v)
end

getgenv().obfuscate = function(toencode, keypath, sec)
        local alphabet = {
        a = "😳🔥🔥😳😳😳😳🔥",
        A = "😳🔥😳😳😳😳😳🔥",
        b = "😳🔥🔥😳😳😳🔥😳",
        B = "😳🔥😳😳😳😳🔥😳",
        c = "😳🔥🔥😳😳😳🔥🔥",
        C = "😳🔥😳😳😳😳🔥🔥",
        d = "😳🔥🔥😳😳🔥😳😳",
        D = "😳🔥😳😳😳🔥😳😳",
        e = "😳🔥🔥😳😳🔥😳🔥",
        E = "😳🔥😳😳😳🔥😳🔥",
        f = "😳🔥🔥😳😳🔥🔥😳",
        F = "😳🔥😳😳😳🔥🔥😳",
        g = "😳🔥🔥😳😳🔥🔥🔥",
        G = "😳🔥😳😳😳🔥🔥🔥",
        h = "😳🔥🔥😳🔥😳😳😳",
        H = "😳🔥😳😳🔥😳😳😳",
        i = "😳🔥🔥😳🔥😳😳🔥",
        I = "😳🔥😳😳🔥😳😳🔥",
        j = "😳🔥🔥😳🔥😳🔥😳",
        J = "😳🔥😳😳🔥😳🔥😳",
        k = "😳🔥🔥😳🔥😳🔥🔥",
        K = "😳🔥😳😳🔥😳🔥🔥",
        l = "😳🔥🔥😳🔥🔥😳😳",
        L = "😳🔥😳😳🔥🔥😳😳",
        m = "😳🔥🔥😳🔥🔥😳🔥",
        M = "😳🔥😳😳🔥🔥😳🔥",
        n = "😳🔥🔥😳🔥🔥🔥😳",
        N = "😳🔥😳😳🔥🔥🔥😳",
        o = "😳🔥🔥😳🔥🔥🔥🔥",
        O = "😳🔥😳😳🔥🔥🔥🔥",
        p = "😳🔥🔥🔥😳😳😳😳",
        P = "😳🔥😳🔥😳😳😳😳",
        q = "😳🔥🔥🔥😳😳😳🔥",
        Q = "😳🔥😳🔥😳😳😳🔥",
        r = "😳🔥🔥🔥😳😳🔥😳",
        R = "😳🔥😳🔥😳😳🔥😳",
        s = "😳🔥🔥🔥😳😳🔥🔥",
        S = "😳🔥😳🔥😳😳🔥🔥",
        t = "😳🔥🔥🔥😳🔥😳😳",
        T = "😳🔥😳🔥😳🔥😳😳",
        u = "😳🔥🔥🔥😳🔥😳🔥",
        U = "😳🔥😳🔥😳🔥😳🔥",
        v = "😳🔥🔥🔥😳🔥🔥😳",
        V = "😳🔥😳🔥😳🔥🔥😳",
        w = "😳🔥🔥🔥😳🔥🔥🔥",
        W = "😳🔥😳🔥😳🔥🔥🔥",
        x = "😳🔥🔥🔥🔥😳😳😳",
        X = "😳🔥😳🔥🔥😳😳😳",
        y = "😳🔥🔥🔥🔥😳😳🔥",
        Y = "😳🔥😳🔥🔥😳😳🔥",
        z = "😳🔥🔥🔥🔥😳🔥😳",
        Z = "😳🔥😳🔥🔥😳🔥😳",
        ["="] = "😳😳🔥🔥🔥🔥😳🔥",
        ["?"] = "😳😳🔥🔥🔥🔥🔥🔥",
        [":"] = "😳😳🔥🔥🔥😳🔥😳",
        [";"] = "😳😳🔥🔥🔥😳🔥🔥",
        [","] = "😳😳🔥😳🔥🔥😳😳",
        ["1"] = "😳😳🔥🔥😳😳😳🔥",
        ["2"] = "😳😳🔥🔥😳😳🔥😳",
        ["3"] = "😳😳🔥🔥😳😳🔥🔥",
        ["4"] = "😳😳🔥🔥😳🔥😳😳",
        ["5"] = "😳😳🔥🔥😳🔥😳🔥",
        ["6"] = "😳😳🔥🔥😳🔥🔥😳",
        ["7"] = "😳😳🔥🔥😳🔥🔥🔥",
        ["8"] = "😳😳🔥🔥🔥😳😳😳",
        ["9"] = "😳😳🔥🔥🔥😳😳🔥",
        ["0"] = "😳😳🔥🔥😳😳😳😳",
        ["+"] = "😳😳🔥😳🔥😳🔥🔥",
        ["-"] = "😳😳🔥😳🔥🔥😳🔥",
        ["/"] = "😳😳🔥😳🔥🔥🔥🔥",
        ["*"] = "😳😳🔥😳🔥😳🔥😳",
        ["%"] = "😳😳🔥😳😳🔥😳🔥",
        ["&"] = "😳😳🔥😳😳🔥🔥😳",
        ["("] = "😳😳🔥😳🔥😳😳😳",
        [")"] = "😳😳🔥😳🔥😳😳🔥",
        ["."] = "😳😳🔥😳🔥🔥🔥😳",
        ['"'] = "😳😳🔥😳😳😳🔥😳",
        ["'"] = "😳😳🔥😳😳🔥🔥🔥",
        ["["] = "😳🔥😳🔥🔥😳🔥🔥",
        ["{"] = "😳🔥🔥🔥🔥😳🔥🔥",
        ["]"] = "😳🔥😳🔥🔥🔥😳🔥",
        ["}"] = "😳🔥🔥🔥🔥🔥😳🔥",
        ["="] = "😳😳🔥🔥🔥🔥😳🔥",
        ["<"] = "😳😳🔥🔥🔥🔥😳😳",
        [">"] = "😳😳🔥🔥🔥🔥🔥😳",
        ["~"] = "😳🔥🔥🔥🔥🔥🔥😳",
        ["_"] = "😳🔥😳🔥🔥🔥🔥🔥",
        ["!"] = "😳😳🔥😳😳😳😳🔥",
        ["@"] = "😳🔥😳😳😳😳😳😳",
        ["#"] = "😳😳🔥😳😳😳🔥🔥",
        ["$"] = "😳😳🔥😳😳🔥😳😳",
        ["%"] = "😳😳🔥😳😳🔥😳🔥",
        ["^"] = "😳🔥😳🔥🔥🔥🔥😳",
        [" "] = "😳😳🔥😳😳😳😳😳"
    }
    local code = {}
    local str = string.gsub(toencode, '"', "'")
    local newstr = ""
    if sec == nil then secr = 50 else secr = sec end
    if keypath == nil then keypathr = "obfuscator.decode" else keypathr = keypath end

    if pcall(function() readfile(keypathr) end) then
        code = game:GetService("HttpService"):JSONDecode(readfile(keypathr))
    else
        for i, v in alphabet do
            code[i] = string.sub(string.gsub(game:GetService("HttpService"):GenerateGUID(false), "-", ""), 1, secr)
        end
        writefile(keypathr, game:GetService("HttpService"):JSONEncode(code))
    end

    for i=1, string.len(toencode) do
        newstr = newstr .. code[string.sub(str, i, i)]
    end

    return newstr,code
end

getgenv().deobfuscate = function(todecode, keypath)
    local alphabet = {
        a = "😳🔥🔥😳😳😳😳🔥",
        A = "😳🔥😳😳😳😳😳🔥",
        b = "😳🔥🔥😳😳😳🔥😳",
        B = "😳🔥😳😳😳😳🔥😳",
        c = "😳🔥🔥😳😳😳🔥🔥",
        C = "😳🔥😳😳😳😳🔥🔥",
        d = "😳🔥🔥😳😳🔥😳😳",
        D = "😳🔥😳😳😳🔥😳😳",
        e = "😳🔥🔥😳😳🔥😳🔥",
        E = "😳🔥😳😳😳🔥😳🔥",
        f = "😳🔥🔥😳😳🔥🔥😳",
        F = "😳🔥😳😳😳🔥🔥😳",
        g = "😳🔥🔥😳😳🔥🔥🔥",
        G = "😳🔥😳😳😳🔥🔥🔥",
        h = "😳🔥🔥😳🔥😳😳😳",
        H = "😳🔥😳😳🔥😳😳😳",
        i = "😳🔥🔥😳🔥😳😳🔥",
        I = "😳🔥😳😳🔥😳😳🔥",
        j = "😳🔥🔥😳🔥😳🔥😳",
        J = "😳🔥😳😳🔥😳🔥😳",
        k = "😳🔥🔥😳🔥😳🔥🔥",
        K = "😳🔥😳😳🔥😳🔥🔥",
        l = "😳🔥🔥😳🔥🔥😳😳",
        L = "😳🔥😳😳🔥🔥😳😳",
        m = "😳🔥🔥😳🔥🔥😳🔥",
        M = "😳🔥😳😳🔥🔥😳🔥",
        n = "😳🔥🔥😳🔥🔥🔥😳",
        N = "😳🔥😳😳🔥🔥🔥😳",
        o = "😳🔥🔥😳🔥🔥🔥🔥",
        O = "😳🔥😳😳🔥🔥🔥🔥",
        p = "😳🔥🔥🔥😳😳😳😳",
        P = "😳🔥😳🔥😳😳😳😳",
        q = "😳🔥🔥🔥😳😳😳🔥",
        Q = "😳🔥😳🔥😳😳😳🔥",
        r = "😳🔥🔥🔥😳😳🔥😳",
        R = "😳🔥😳🔥😳😳🔥😳",
        s = "😳🔥🔥🔥😳😳🔥🔥",
        S = "😳🔥😳🔥😳😳🔥🔥",
        t = "😳🔥🔥🔥😳🔥😳😳",
        T = "😳🔥😳🔥😳🔥😳😳",
        u = "😳🔥🔥🔥😳🔥😳🔥",
        U = "😳🔥😳🔥😳🔥😳🔥",
        v = "😳🔥🔥🔥😳🔥🔥😳",
        V = "😳🔥😳🔥😳🔥🔥😳",
        w = "😳🔥🔥🔥😳🔥🔥🔥",
        W = "😳🔥😳🔥😳🔥🔥🔥",
        x = "😳🔥🔥🔥🔥😳😳😳",
        X = "😳🔥😳🔥🔥😳😳😳",
        y = "😳🔥🔥🔥🔥😳😳🔥",
        Y = "😳🔥😳🔥🔥😳😳🔥",
        z = "😳🔥🔥🔥🔥😳🔥😳",
        Z = "😳🔥😳🔥🔥😳🔥😳",
        ["="] = "😳😳🔥🔥🔥🔥😳🔥",
        ["?"] = "😳😳🔥🔥🔥🔥🔥🔥",
        [":"] = "😳😳🔥🔥🔥😳🔥😳",
        [";"] = "😳😳🔥🔥🔥😳🔥🔥",
        [","] = "😳😳🔥😳🔥🔥😳😳",
        ["1"] = "😳😳🔥🔥😳😳😳🔥",
        ["2"] = "😳😳🔥🔥😳😳🔥😳",
        ["3"] = "😳😳🔥🔥😳😳🔥🔥",
        ["4"] = "😳😳🔥🔥😳🔥😳😳",
        ["5"] = "😳😳🔥🔥😳🔥😳🔥",
        ["6"] = "😳😳🔥🔥😳🔥🔥😳",
        ["7"] = "😳😳🔥🔥😳🔥🔥🔥",
        ["8"] = "😳😳🔥🔥🔥😳😳😳",
        ["9"] = "😳😳🔥🔥🔥😳😳🔥",
        ["0"] = "😳😳🔥🔥😳😳😳😳",
        ["+"] = "😳😳🔥😳🔥😳🔥🔥",
        ["-"] = "😳😳🔥😳🔥🔥😳🔥",
        ["/"] = "😳😳🔥😳🔥🔥🔥🔥",
        ["*"] = "😳😳🔥😳🔥😳🔥😳",
        ["%"] = "😳😳🔥😳😳🔥😳🔥",
        ["&"] = "😳😳🔥😳😳🔥🔥😳",
        ["("] = "😳😳🔥😳🔥😳😳😳",
        [")"] = "😳😳🔥😳🔥😳😳🔥",
        ["."] = "😳😳🔥😳🔥🔥🔥😳",
        ['"'] = "😳😳🔥😳😳😳🔥😳",
        ["'"] = "😳😳🔥😳😳🔥🔥🔥",
        ["["] = "😳🔥😳🔥🔥😳🔥🔥",
        ["{"] = "😳🔥🔥🔥🔥😳🔥🔥",
        ["]"] = "😳🔥😳🔥🔥🔥😳🔥",
        ["}"] = "😳🔥🔥🔥🔥🔥😳🔥",
        ["="] = "😳😳🔥🔥🔥🔥😳🔥",
        ["<"] = "😳😳🔥🔥🔥🔥😳😳",
        [">"] = "😳😳🔥🔥🔥🔥🔥😳",
        ["~"] = "😳🔥🔥🔥🔥🔥🔥😳",
        ["_"] = "😳🔥😳🔥🔥🔥🔥🔥",
        ["!"] = "😳😳🔥😳😳😳😳🔥",
        ["@"] = "😳🔥😳😳😳😳😳😳",
        ["#"] = "😳😳🔥😳😳😳🔥🔥",
        ["$"] = "😳😳🔥😳😳🔥😳😳",
        ["%"] = "😳😳🔥😳😳🔥😳🔥",
        ["^"] = "😳🔥😳🔥🔥🔥🔥😳",
        [" "] = "😳😳🔥😳😳😳😳😳"
    }
    local code = {}
    local str = string.gsub(todecode, '"', "'")
    local newstr = ""

    if keypath == nil then keypathr = "obfuscator.decode" else keypathr = keypath end

    if pcall(function() readfile(keypathr) end) then
        code = game:GetService("HttpService"):JSONDecode(readfile(keypathr))
    else
        return nil
    end
    local sec = string.len(code["a"])

    for i=1, string.len(todecode)/sec do
        local letter = string.sub(todecode, (sec*i)-(sec-1), (sec*i))
        for ind, v in code do
            if v == letter then
                newstr = newstr .. ind
            end
        end
    end

    return newstr
end

getgenv().getGlobals = function()
    local funcs = {}
    for i, v in getgenv() do
        if v ~= null then
            funcs[i] = v
        end
    end
    return funcs
end

getgenv().runCode = function(url)
    local args = loadstring(game:HttpGet(url))()
    return args
end

getgenv().newGui = function(...)
    local args = ...
    if not args[1] then
        local gui = Instance.new("ScreenGui")
        gui.Parent = game:GetService("CoreGui")
        return gui
    else
        local e = Instance.new(type)
        e.Parent = args[2]
        return e
    end
end

getgenv().enableGuiDrag = function(object)
        local UserInputService = game:GetService("UserInputService")

        local gui = object
        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
        	local delta = input.Position - dragStart
        	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        gui.InputBegan:Connect(function(input)
        	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        		dragging = true
        		dragStart = input.Position
        		startPos = gui.Position
        		
        		input.Changed:Connect(function()
        			if input.UserInputState == Enum.UserInputState.End then
        				dragging = false
        			end
        		end)
        	end
        end)

        gui.InputChanged:Connect(function(input)
        	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        		dragInput = input
        	end
        end)

        UserInputService.InputChanged:Connect(function(input)
        	if input == dragInput and dragging then
        		update(input)
        	end
        end)
end

getgenv().notifyChat = function(text, color, size)
    if not color then colour = Color3.new(255,255,255) else colour = color end
    if not size then textsize = Enum.FontSize.Size24 else textsize = Enum.FontSize["Size"..size] end
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text,
        Color = colour,
        Font = Enum.Font.SourceSans,
        FontSize = textSize,
    })
end

getgenv().notify = function(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {Title=title; Text=text; Duration=duration;})
end

--[[
    BasicCommands.lua
    Universal commands for any game


]]

local HttpService = game:GetService('HttpService')

local commands = {
    rejoin = true,
    die = true,
    load = true,
    copy = true
    }
local Defaults = commands

function getLen(arr)
    local count = 0
    for i, v in arr do
        count += 1
    end
    return count
end

function Settings()
    local settings
    if not pcall(function() readfile("settings/basicCmd.setting") end) then
        writefile("settings/basicCmd.setting", HttpService:JSONEncode(Defaults))
        return nil
    else
        settings = HttpService:JSONDecode(readfile("settings/basicCmd.setting"))
        if getLen(settings) ~= 1 then
            for i, v in settings do
                commands[i] = settings[i]
            end
        else
            for i, v in commands do
                commands[i] = settings[1]
            end
        end
        return settings
    end
end

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
	else
		messagebox('Clipboard',"Your exploit doesn't have the ability to use the clipboard.")
	end
end

function notify(text, color, size)
    if not color then colour = Color3.new(255,255,255) else colour = color end
    if not size then textsize = Enum.FontSize.Size24 else textsize = Enum.FontSize["Size"..size] end
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text,
        Color = colour,
        Font = Enum.Font.SourceSans,
        FontSize = textSize,
    })
end

local settings = Settings()
if not settings then settings = {true} else commands = settings end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
	if msg == "!rejoin" then
            if commands["rejoin"] then
            if #(game:GetService("Players"):GetPlayers()) <= 1 then
                game:GetService("Players").LocalPlayer:Kick("\nRejoining...")
                task.wait()
                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
            else
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
            end
        end
	end
    if msg == "!die" then
        if commands["die"] then
            game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
        end
    end
    if string.find(msg, "!load ") then -- kinda complex who cares
        if commands["load"] then
            if pcall(function() loadfile(("scripts/" .. (string.gsub(msg, "!load ", "") ) .. ".lua")) end) then
                loadfile(("scripts/" .. (string.gsub(msg, "!load ", "")) .. ".lua"))()
                task.wait(1)
                game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0 -- some scripts require characteradded
            end
        end
    end
    if string.find(msg, "!copy ") then -- kinda complex who cares
        if commands["copy"] then
            if pcall(function() readfile(((string.gsub(msg, "!copy ", "") ) .. ".lua")) end) then
                toClipboard(readfile(("scripts/".. (string.gsub(msg, "!copy ", "")) .. ".lua")))
            end
        end
    end
    if string.find(msg, "!settings") then
        for i, v in commands[i] do
            if getLen(settings) ~= 1 then
                notify((i..": "..tostring(commands[i])))
            else
                notify((i..": ".. tostring(settings[1])))
            end
        end
    end
    if string.find(msg, "!toggle ") then
        local totog = string.gsub(msg, "!toggle ", "")
        for i, v in commands do
            if i == totog then
                if getLen(settings) ~= 1 then
                    commands[i] = not commands[i]
                    notify((i.." set to "..tostring(commands[i])))
                end
            end
        end
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function(plr)
    if plr.Name == game:GetService("Players").LocalPlayer.Name then
        writefile("settings/basicCmd.setting", HttpService:JSONEncode(commands))
    end
end)