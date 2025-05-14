local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ZeZerHubNotification"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(1, -310, 1, -110)
frame.AnchorPoint = Vector2.new(1, 1)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Name = "NotificationFrame"

local image = Instance.new("ImageLabel", frame)
image.Size = UDim2.new(0, 80, 0, 80)
image.Position = UDim2.new(0, 10, 0.5, -40)
image.Image = "rbxassetid://103221616248663"
image.BackgroundTransparency = 1

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(0, 100, 0, 10)
title.Text = "ZeZer Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold

local message = Instance.new("TextLabel", frame)
message.Size = UDim2.new(0, 200, 0, 50)
message.Position = UDim2.new(0, 100, 0, 40)
message.Text = "Script has been loaad..."
message.TextColor3 = Color3.new(1, 1, 1)
message.TextScaled = true
message.BackgroundTransparency = 1
message.Font = Enum.Font.Gotham

-- Auto remove after 10 seconds
task.delay(10, function()
    gui:Destroy()
end)
