-- load fluent
local Fluent = loadstring(game:HttpGet(
    "https://github.com/StyearX/Fluent-Modded/releases/download/Fluent/FluentPro"
))()
-- window creation
local Window = Fluent:CreateWindow({
    Title       = "cube64's gui",
    SubTitle    = "now with a new look!",
    TabWidth    = 160,
    Size        = UDim2.fromOffset(640, 280),
    Acrylic     = true,
    Theme       = "AMOLED",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Search      = true,
})

local Main = Window:AddTab({ Title = "Main", Icon = "solar/home-bold" })
local GameSpecific = Window:AddTab({ Title = "Game specific", Icon = "gamepad" })
local Debuggers = Window:AddTab({ Title = "Debuggers", Icon = "code" })
local Settings = Window:AddTab({ Title = "Settings (WIP)", Icon = "settings" })
-- Cobalt Button
Debuggers:AddButton({
	Title = "Cobalt",
	Description = "very popular spy",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))()
	end
})
Debuggers:AddButton({
	Title = "Debug Tab Test",
	Description = "Test",
	Callback = function()
	end
})
Settings:AddButton({
	Title = " Settings1",
	Description = "Setting 1",
	Callback = function()
	end
})
Settings:AddButton({
	Title = " Settings2",
	Description = "Setting 2",
	Callback = function()
	end
})
Settings:AddButton({
	Title = " Settings3",
	Description = "Setting 3",
	Callback = function()
	end
})
Settings:AddDropdown("MyDropdown", {
    Title                 = "Choose Theme (non-functional as of now)",
    Icon                  = "solar/list-bold",
    Values                = { "Theme1", "Theme2", "Theme3" },
    Default               = "Theme1",
    Multi                 = false,
    DropdownOutsideWindow = true,
    Callback              = function(value)
        print(value)
    end,
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
    Duration = 3
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
