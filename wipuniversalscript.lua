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
    Title = "cube64's universal script",
    SubTitle = "delta compatible!",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 260),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Add tabs
local Main = Window:AddTab({
	Title = "Main",
	Icon = "globe"
})
   local GameSpecific = Window:AddTab({
	Title = "Game specific",
	Icon = "globe"
})
-- Cobalt Button
Main:AddButton({
	Title = "Cobalt",
	Description = "very popular spy",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))()
	end
})

-- brainrot police
GameSpecific:AddButton({
	Title = "Brainrot Police (multi-game support)",
	Description = "by Vaehz (hes so cool gng",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IcantAffordSynapse/BrainrotPolice/refs/heads/main/src/init.lua"))()
	end
})
-- IY (even tho its in delta by default)
Main:AddButton({
	Title = "Infinite Yield",
	Description = "a true classic of exploits",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})
-- Dex
Main:AddButton({
	Title = "DexExplorer",
	Description = "the inspect element of roblox",
	Callback = function()
		loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
	end
})
-- speed clicker hax
local Running = false

GameSpecific:AddButton({
    Title = "Speed Clicker Speed Farm",
    Description = "Start/Stop Speed Farm",
    Callback = function()
        Running = not Running

        if Running then
            task.spawn(function()
                local Event = game:GetService("ReplicatedStorage").IncreaseSpeed

                while Running do
                    Event:FireServer()
                    task.wait(0.005)
                end
            end)
        end
    end
})
-- load notif
Fluent:Notify({
    Title = "script successfully loaded",
    Content = "all systems go",
    Duration = 10
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
