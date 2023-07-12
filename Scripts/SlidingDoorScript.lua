local part1 = game.Workspace["Sliding Door"].Door.Door1
local part2 = game.Workspace["Sliding Door"].Door.Door2
local click = game.Workspace["Sliding Door"].Door.ClickDetector
click.Parent = script.Parent
local part1Pos = part1.Position
local part2Pos = part2.Position
script.Parent.CanCollide = false

local closed = true
local isPlaying = false

function openDoor()
    print("opening door")
    isPlaying = true
    for i = 1, 4, 0.1 do
        part1.Position = Vector3.new(part1Pos.X + i, part1Pos.Y, part1Pos.Z)
        part2.Position = Vector3.new(part2Pos.X - i, part2Pos.Y, part2Pos.Z)
        task.wait(0.001)
        closed = false
    end
    isPlaying = false
    
    
end

function closeDoor()
    print("closing door")
    isPlaying = true
    local newPos1 = part1.Position
    local newPos2 = part2.Position
    for i = 1, 4, 0.1 do
        
        part1.Position = Vector3.new(newPos1.X - i, newPos1.Y, newPos1.Z)
        part2.Position = Vector3.new(newPos2.X + i, newPos2.Y, newPos2.Z)
        task.wait(0.001)
    end
    isPlaying = false
    closed = true
end


click.MaxActivationDistance = 999

click.MouseClick:Connect(function(p)
    if closed then
        openDoor()
        else closeDoor()
    end
end)