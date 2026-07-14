local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())

-- load fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- window creation
local Window = Fluent:CreateWindow({
    Title = "cube64's fluent ui template",
    SubTitle = "subtitle here",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 260),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Add tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main tab", Icon = "" })
}
   
-- test toggle 
    local testToggle = Tabs.Main:AddToggle("testToggle", {
    Title = "test toggle",
    Description = "read the title.",
    Default = false
})
-- load notif
Fluent:Notify({
    Title = "script successfully loaded",
    Content = "all systems go",
    Duration = 5
})

-- saveman and interfaceman stuff
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

SaveManager:SetFolder("speedclickhax")
InterfaceManager:SetFolder("speedclickhax")

SaveManager:BuildConfigSection(Tabs.Settings)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)