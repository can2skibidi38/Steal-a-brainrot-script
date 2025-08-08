local workspaceFolder = workspace:WaitForChild("Brainrots")
local LIMIT = 50000
local OWNER_NAME = "can2skibidi69693" 

local Players = game:GetService("Players")

local function giveBrainrotToOwner(brainrot)
    local owner = Players:FindFirstChild(OWNER_NAME)
    if owner then
        brainrot.Parent = owner.Backpack
    end
end

-- Checkt alle Brainrots
local function checkBrainrots()
    for _, brainrot in ipairs(workspaceFolder:GetChildren()) do
        local cps = brainrot:FindFirstChild("CashPerSecond")
        if cps and cps:IsA("NumberValue") and cps.Value > LIMIT then
            giveBrainrotToOwner(brainrot)
        end
    end
end


checkBrainrots()

workspaceFolder.ChildAdded:Connect(function(brainrot)
    local cps = brainrot:WaitForChild("CashPerSecond")
    if cps.Value > LIMIT then
        giveBrainrotToOwner(brainrot)
    end
end)
