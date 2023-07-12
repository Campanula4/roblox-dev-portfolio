--Services

local rs = game:GetService("ReplicatedStorage")
local debris = game:GetService("Debris")

-- Vars
local remote = rs.RemoteEvent
local visualsDir = workspace.Visuals

-- Main
local function createVisual(startPos, direction)
    local center = startPos + direction /2
    local distance = direction.Magnitude
    
    local visual = Instance.new("Part")
    visual.Parent = visualsDir
    visual.Anchored = true
    visual.CanCollide = false
    visual.BrickColor = BrickColor.new("Bright yellow")
    visual.Material = Enum.Material.Neon
    visual.CFrame = CFrame.new(center, startPos)
    visual.Size = Vector3.new(.1, .1, distance)
    visual.Name = "Gunshot Visual"
    
    
    for i=0, 5, 0.35 do
        visual.Transparency = i
        task.wait(0.1)
    end
    
    debris:AddItem(visual, 0.5)
end

remote.OnServerEvent:Connect(function(player, tool, startPos, endPos)
    local maxRange = tool:GetAttribute("MaxRange")
    local damage = tool:GetAttribute("Damage")
    
    local direction = (endPos - startPos).Unit * maxRange
    
    local raycast = workspace:Raycast(startPos, direction)
    
    if raycast then
        print(raycast.Instance.Name)
        
        local hitChar = raycast.Instance.Parent
        local humanoid = hitChar:FindFirstChild("Humanoid")
        if humanoid and hitChar.Name ~= player.Character.Name then
            humanoid.Health -= damage
        end
    end    
    
    createVisual(startPos, direction)
end)