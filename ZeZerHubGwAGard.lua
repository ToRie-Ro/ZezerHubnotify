local ZeZerHubCh = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToRie-Ro/Zezerscript/refs/heads/main/Checking.lua"))()
local ZeZerHubNotify = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToRie-Ro/Zezerscript/refs/heads/main/ZeZerHubNotify.lua"))()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToRie-Ro/Zezerscript/refs/heads/main/Save.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/ToRie-Ro/Zezerscript/refs/heads/main/Interface.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ZeZer Hub [ Beta ]",
    SubTitle = "by ZeZerover",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 390),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})


--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Plant = Window:AddTab({ Title = "Auto Plant", Icon = "" }),
    Sell = Window:AddTab({ Title = "Tab Sell", Icon = "" }),
    Player = Window:AddTab({ Title = "Local Player", Icon = "" }),
}

local Options = Fluent.Options

do



    Tabs.Sell:AddParagraph({
        Title = "Sell",
        Content = "..."
    })

        Tabs.Sell:AddButton({
        Title = "Sell All",
        Callback = function()
            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
        end,
    })

        Tabs.Sell:AddButton({
        Title = "Sell Iteam",
        Description = "Only sell you seleted iteam",
        Callback = function()
            game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Item"):FireServer()
        end,
    })
    
    local Toggle = Tabs.Plant:AddToggle("Autoplant", {Title = "Auto Plant", Default = false })

    Toggle:OnChanged(function()
        -- Function
    end)

        Tabs.Sell:AddButton({
        Title = "Hop Server",
        Description = "",
        Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        local PlaceId = game.PlaceId

        local success, response = pcall(function()
            return HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            )
        end)

        if success and response and response.data then
            for _, server in pairs(response.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(PlaceId, server.id, game.Players.LocalPlayer)
                    break
                end
            end
        else
            warn("Failed to get server list.")
        end
        end,
    })

end
-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
