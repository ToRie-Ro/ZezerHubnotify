local allowedHWIDs = {
    "HuOOgIEtdCzIldrADhiEPLaRgqemRlNS",  -- allowed HWID example
    "s6ozpqv2Kam0cCT9LhCX"
    "ayzG93WcQdyXiWvee9RC"
    "Zswvivi8VF0b2UHIrKGL"
    "f8vhDA61kw5YbeS8eCGB"
    "sLrmn0i4psNko0Itw0ZA"
    "nD3k2w3eIbxs9EbfD7en"
    "P2sIpoWWTIv1LADMGceG"
    "wmimZSdumwduSv9WoEP2"
    "UDhYstadp1ico2PDQHLD"
    "HwQSAMkeD2ZjG0iGUwuV"
    "lB9aBwidrMk3q8NkDptB"
    "ux5Z7n7UvXmfJzyO8Kug"
    "Qb8RHM01t3kPUVMn6VBs"
    "rBkjSnZ6GJb4we1fmpwt"
    "Uw6WW1rFDRdJeDEaWaSE"
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local hwidEvent = Instance.new("RemoteEvent")
hwidEvent.Name = "HWIDCheckEvent"
hwidEvent.Parent = ReplicatedStorage

-- Keep track of which HWIDs are currently used
local activeHWIDs = {}

local function isHWIDAllowed(hwid)
    for _, key in ipairs(allowedHWIDs) do
        if hwid == key then
            return true
        end
    end
    return false
end

hwidEvent.OnServerEvent:Connect(function(player, hwid)
    if not isHWIDAllowed(hwid) then
        player:Kick("Invalid HWID")
        return
    end

    if activeHWIDs[hwid] then
        -- Someone else is already using this HWID
        player:Kick("Report Admin Script Your HWID")
        return
    end

    -- Mark this HWID as active for this player
    activeHWIDs[hwid] = player

    print(player.Name .. " logged in with HWID: " .. hwid)

    -- Remove HWID from active list when player leaves
    player.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if activeHWIDs[hwid] == player then
                activeHWIDs[hwid] = nil
                print("HWID " .. hwid .. " released as player left")
            end
        end
    end)
end)
