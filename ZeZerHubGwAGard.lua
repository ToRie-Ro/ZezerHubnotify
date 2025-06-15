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
    Shop = Window:AddTab({ Title = "Tab Shop", Icon = "" }),
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

    Toggle:OnChanged(function(value)
        -- Function
    end)

        Tabs.Player:AddButton({
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

        Tabs.Shop:AddButton({
        Title = "Gear Shop",
        Description = "",
        Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local gearShopUI = playerGui:WaitForChild("Gear_Shop")
        local frame = gearShopUI:WaitForChild("Frame")
        
        -- Ensure visibility
        gearShopUI.Enabled = true
        frame.Visible = true
        
        -- Optional: make scrolling frame elements load
        local scrollingFrame = frame:WaitForChild("ScrollingFrame")
        
        local elements = {
        	scrollingFrame:FindFirstChild("Watering Can_Padding"),
        	scrollingFrame:FindFirstChild("Advanced Sprinkler"),
        	scrollingFrame:FindFirstChild("Basic Sprinkler"),
        	scrollingFrame:FindFirstChild("Cleaning Spray"),
        	scrollingFrame:FindFirstChild("Favorite Tool"),
        	scrollingFrame:FindFirstChild("Friendship Pot"),
        	scrollingFrame:FindFirstChild("Godly Sprinkler"),
        	scrollingFrame:FindFirstChild("Harvest Tool"),
        	scrollingFrame:FindFirstChild("ItemPadding"),
        	scrollingFrame:FindFirstChild("Lightning Rod"),
        	scrollingFrame:FindFirstChild("Master Sprinkler"),
        	scrollingFrame:FindFirstChild("Recall Wrench"),
        	scrollingFrame:FindFirstChild("Trowel"),
        	scrollingFrame:FindFirstChild("Watering Can"),
        }

        end,
    })

        Tabs.Shop:AddButton({
        Title = "Seed Shop",
        Description = "",
        Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local seedShopUI = playerGui:WaitForChild("Seed_Shop")
        local frame = seedShopUI:WaitForChild("Frame")
        
        -- Show the UI
        seedShopUI.Enabled = true
        frame.Visible = true
        
        local scrollingFrame = frame:WaitForChild("ScrollingFrame")
        
        -- Optional: Access UI elements
        local elements = {
        	frame:FindFirstChild("UIAspectRatioConstraint"),
        	frame:FindFirstChild("Frame"),
        	frame:FindFirstChild("Frame") and frame.Frame:FindFirstChild("ExitButton"),
        	frame:FindFirstChild("Frame") and frame.Frame:FindFirstChild("Restock"),
        	frame:FindFirstChild("Frame") and frame.Frame:FindFirstChild("Timer"),
        	scrollingFrame:FindFirstChild("UIListLayout"),
        	scrollingFrame:FindFirstChild("Apple"),
        	scrollingFrame:FindFirstChild("Apple_Padding"),
        	scrollingFrame:FindFirstChild("Bamboo"),
        	scrollingFrame:FindFirstChild("Bamboo_Padding"),
        	scrollingFrame:FindFirstChild("Beanstalk"),
        	scrollingFrame:FindFirstChild("Beanstalk_Padding"),
        	scrollingFrame:FindFirstChild("Blueberry"),
        	scrollingFrame:FindFirstChild("Blueberry_Padding"),
        	scrollingFrame:FindFirstChild("Cacao"),
        	scrollingFrame:FindFirstChild("Cacao_Padding"),
        	scrollingFrame:FindFirstChild("Cactus"),
        	scrollingFrame:FindFirstChild("Cactus_Padding"),
        	scrollingFrame:FindFirstChild("Carrot"),
        	scrollingFrame:FindFirstChild("Carrot_Padding"),
        	scrollingFrame:FindFirstChild("Coconut"),
        	scrollingFrame:FindFirstChild("Coconut_Padding"),
        	scrollingFrame:FindFirstChild("Corn"),
        	scrollingFrame:FindFirstChild("Corn_Padding"),
        	scrollingFrame:FindFirstChild("Daffodil"),
        	scrollingFrame:FindFirstChild("Daffodil_Padding"),
        	scrollingFrame:FindFirstChild("Dragon Fruit"),
        	scrollingFrame:FindFirstChild("Dragon Fruit_Padding"),
        	scrollingFrame:FindFirstChild("Ember Lily"),
        	scrollingFrame:FindFirstChild("Ember Lily_Padding"),
        	scrollingFrame:FindFirstChild("Grape"),
        	scrollingFrame:FindFirstChild("Grape_Padding"),
        	scrollingFrame:FindFirstChild("ItemPadding"),
        	scrollingFrame:FindFirstChild("Mango"),
        	scrollingFrame:FindFirstChild("Mango_Padding"),
        	scrollingFrame:FindFirstChild("Mushroom"),
        	scrollingFrame:FindFirstChild("Mushroom_Padding"),
        	scrollingFrame:FindFirstChild("Orange Tulip"),
        	scrollingFrame:FindFirstChild("Orange Tulip_Padding"),
        	scrollingFrame:FindFirstChild("Pepper"),
        	scrollingFrame:FindFirstChild("Pepper_Padding"),
        	scrollingFrame:FindFirstChild("Pumpkin"),
        	scrollingFrame:FindFirstChild("Pumpkin_Padding"),
        	scrollingFrame:FindFirstChild("Strawberry"),
        	scrollingFrame:FindFirstChild("Strawberry_Padding"),
        	scrollingFrame:FindFirstChild("Sugar Apple"),
        	scrollingFrame:FindFirstChild("Sugar Apple_Padding"),
        	scrollingFrame:FindFirstChild("Tomato"),
        	scrollingFrame:FindFirstChild("Tomato_Padding"),
        	scrollingFrame:FindFirstChild("Watermelon"),
        	scrollingFrame:FindFirstChild("Watermelon_Padding"),
        }

        end,
    })

        Tabs.Shop:AddButton({
        Title = "Event Shop",
        Description = "",
        Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local honeyUI = playerGui:WaitForChild("HoneyEventShop_UI")
        local frame = honeyUI:WaitForChild("Frame")
        
        -- Show UI
        honeyUI.Enabled = true
        frame.Visible = true
        
        local scrollingFrame = frame:WaitForChild("ScrollingFrame")
        
        -- Optional: Access UI elements
        local elements = {
        	scrollingFrame:FindFirstChild("Pollen Radar_Padding"),
        	honeyUI,
        	frame,
        	frame:FindFirstChild("UIAspectRatioConstraint"),
        	frame:FindFirstChild("UIStroke"),
        	frame:FindFirstChild("Detail"),
        	frame.Detail:FindFirstChild("EventImage"),
        	frame.Detail:FindFirstChild("InletTexture"),
        	frame:FindFirstChild("Frame"),
        	frame.Frame:FindFirstChild("Detail"),
        	frame.Frame:FindFirstChild("ExitButton"),
        	frame.Frame:FindFirstChild("Restock"),
        	frame.Frame:FindFirstChild("Timer"),
        	frame.Frame:FindFirstChild("Title"),
        	scrollingFrame,
        	scrollingFrame:FindFirstChild("Item_Size"),
        	scrollingFrame:FindFirstChild("UIListLayout"),
        	scrollingFrame:FindFirstChild("Bee Chair"),
        	scrollingFrame:FindFirstChild("Bee Chair_Padding"),
        	scrollingFrame:FindFirstChild("Bee Crate"),
        	scrollingFrame:FindFirstChild("Bee Crate_Padding"),
        	scrollingFrame:FindFirstChild("Bee Egg"),
        	scrollingFrame:FindFirstChild("Bee Egg_Padding"),
        	scrollingFrame:FindFirstChild("Flower Seed Pack"),
        	scrollingFrame:FindFirstChild("Flower Seed Pack_Padding"),
        	scrollingFrame:FindFirstChild("Hive Fruit"),
        	scrollingFrame:FindFirstChild("Hive Fruit_Padding"),
        	scrollingFrame:FindFirstChild("Honey Comb"),
        	scrollingFrame:FindFirstChild("Honey Comb_Padding"),
        	scrollingFrame:FindFirstChild("Honey Sprinkler"),
        	scrollingFrame:FindFirstChild("Honey Sprinkler_Padding"),
        	scrollingFrame:FindFirstChild("Honey Torch"),
        	scrollingFrame:FindFirstChild("Honey Torch_Padding"),
        	scrollingFrame:FindFirstChild("Honey Walkway"),
        	scrollingFrame:FindFirstChild("Honey Walkway_Padding"),
        	scrollingFrame:FindFirstChild("ItemPadding"),
        	scrollingFrame:FindFirstChild("Lavender"),
        	scrollingFrame:FindFirstChild("Lavender_Padding"),
        	scrollingFrame:FindFirstChild("Nectar Staff"),
        	scrollingFrame:FindFirstChild("Nectar Staff_Padding"),
        	scrollingFrame:FindFirstChild("Nectarine"),
        	scrollingFrame:FindFirstChild("Nectarine_Padding"),
        	scrollingFrame:FindFirstChild("Nectarshade"),
        	scrollingFrame:FindFirstChild("Nectarshade_Padding"),
        	scrollingFrame:FindFirstChild("Pollen Radar"),
        }

        end,
    })       
    
end
-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
