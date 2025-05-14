local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ZeZerHubNotification"

-- Main frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

-- Image (replace with your uploaded asset ID)
local image = Instance.new("ImageLabel", frame)
image.Size = UDim2.new(0, 40, 0, 40)
image.Position = UDim2.new(0, 10, 0, 10)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://103221616248663" -- Replace with your logo’s asset ID

-- Title
local title = Instance.new("TextLabel", frame)
title.Text = "ZeZer Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Size = UDim2.new(1, -60, 0, 25)
title.Position = UDim2.new(0, 60, 0, 10)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Message
local message = Instance.new("TextLabel", frame)
message.Text = "Script has been looad..."
message.Font = Enum.Font.SourceSans
message.TextSize = 16
message.Size = UDim2.new(1, -20, 0, 20)
message.Position = UDim2.new(0, 60, 0, 35)
message.TextColor3 = Color3.fromRGB(200, 200, 200)
message.BackgroundTransparency = 1
message.TextXAlignment = Enum.TextXAlignment.Left

-- Yes button
local yesButton = Instance.new("TextButton", frame)
yesButton.Text = "Yes"
yesButton.Size = UDim2.new(0.5, -5, 0, 30)
yesButton.Position = UDim2.new(0, 5, 1, -35)
yesButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- No button
local noButton = Instance.new("TextButton", frame)
noButton.Text = "No"
noButton.Size = UDim2.new(0.5, -5, 0, 30)
noButton.Position = UDim2.new(0.5, 0, 1, -35)
noButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Button actions
yesButton.MouseButton1Click:Connect(function()
    print("User clicked Yes")
    gui:Destroy()
end)

noButton.MouseButton1Click:Connect(function()
    print("User clicked No")
    gui:Destroy()
end)
