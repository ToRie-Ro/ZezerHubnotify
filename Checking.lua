local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("Starting ZeZer Hub loader...")

-- Simulated loading stages
local loadingStages = {
    "Loading..."
}

for i, stage in ipairs(loadingStages) do
    print("" .. stage)
    wait(1.5) -- simulate loading time
end

print("ZeZer Hub loaded successfully!")
