local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())

-- load fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- get event
local Event = ReplicatedStorage:WaitForChild("IncreaseSpeed")

-- window creation
local Window = Fluent:CreateWindow({
    Title = "cube64's speed clicker farm utility",
    SubTitle = "subtitle here",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 260),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Add tabs
local Tabs = {
    Main = Window:AddTab({ Title = "the only thing here", Icon = "" }),
    Settings = Window:AddTab({ Title = "useless settings", Icon = "settings" })
}

-- toggle variable
local isspeedfarmActive = false
local connection = nil

-- farm toggle
local speedfarmToggle = Tabs.Main:AddToggle("speedfarmToggle", {
    Title = "farm speed",
    Description = "read the title.",
    Default = false
})

-- oh look toggle code
speedfarmToggle:OnChanged(function(State)
    isspeedfarmActive = State
    if isspeedfarmActive then
        -- event fire here
        connection = RunService.Heartbeat:Connect(function()
            Event:FireServer()
            task.wait(0.005) -- 5ms delay
        end)
    else
        -- no more speed farm
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end)

-- farm speed (optional)
local DelaySlider = Tabs.Main:AddSlider("DelaySlider", {
    Title = "farm delay (ms)",
    Description = "lower the ms, the faster you gain speed",
    Default = 5,
    Min = 1,
    Max = 50,
    Rounding = 1,
    Callback = function(Value)
        -- Update the delay dynamically
        if connection then
            connection:Disconnect()
            connection = RunService.Heartbeat:Connect(function()
                Event:FireServer()
                task.wait(Value / 1000) -- Convert ms to seconds
            end)
        end
    end
})

-- load notif
Fluent:Notify({
    Title = "script successfully loaded",
    Content = "now get to farmin!",
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