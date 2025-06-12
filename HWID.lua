local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create RemoteEvent if it doesn't exist
local hwidEvent = ReplicatedStorage:FindFirstChild("HWIDCheckEvent")
if not hwidEvent then
    hwidEvent = Instance.new("RemoteEvent")
    hwidEvent.Name = "HWIDCheckEvent"
    hwidEvent.Parent = ReplicatedStorage
end

-- Allowed HWIDs table (using keys for fast lookup)
local allowedHWIDs = {
    ["HuOOgIEtdCzIldrADhiEPLaRgqemRlNS"] = true,  
    ["s6ozpqv2Kam0cCT9LhCX"] = true,
    ["ayzG93WcQdyXiWvee9RC"] = true,
    ["Zswvivi8VF0b2UHIrKGL"] = true,
    ["f8vhDA61kw5YbeS8eCGB"] = true,
    ["sLrmn0i4psNko0Itw0ZA"] = true,
    ["nD3k2w3eIbxs9EbfD7en"] = true,
    ["P2sIpoWWTIv1LADMGceG"] = true,
    ["wmimZSdumwduSv9WoEP2"] = true,
    ["UDhYstadp1ico2PDQHLD"] = true,
    ["HwQSAMkeD2ZjG0iGUwuV"] = true,
    ["lB9aBwidrMk3q8NkDptB"] = true,
    ["ux5Z7n7UvXmfJzyO8Kug"] = true,
    ["Qb8RHM01t3kPUVMn6VBs"] = true,
    ["rBkjSnZ6GJb4we1fmpwt"] = true,
    ["Uw6WW1rFDRdJeDEaWaSE"] = true,
}

-- Track active HWIDs so no double usage
local activeHWIDs = {}

-- Function to check if HWID allowed
local function isHWIDAllowed(hwid)
    return allowedHWIDs[hwid] == true
end

hwidEvent.OnServerEvent:Connect(function(player, hwid)
    if not hwid or type(hwid) ~= "string" then
        player:Kick("Invalid HWID")
        return
    end

    if not isHWIDAllowed(hwid) then
        player:Kick("Reset HWID")
        return
    end

    if activeHWIDs[hwid] then
        player:Kick("HWID already in use")
        return
    end

    activeHWIDs[hwid] = player
    print(player.Name .. " logged in with HWID: " .. hwid)

    player.AncestryChanged:Connect(function(_, parent)
        if not parent and activeHWIDs[hwid] == player then
            activeHWIDs[hwid] = nil
            print("HWID " .. hwid .. " released as player left")
        end
    end)
end)
