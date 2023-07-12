--vars
local npc = script.Parent
local h = npc:WaitForChild("Humanoid")
local targetPosition = Vector3.new(0, 0, 0)
local currentPos = nil

--main
while true do
	print("Starting walking")
	currentPos = npc.HumanoidRootPart.Position

	local randomX = math.random(-10,10)
	local randomZ = math.random(-10,10)
	targetPosition = Vector3.new(currentPos.X+randomX, 0, currentPos.Z+randomZ)

	h:MoveTo(targetPosition)
	h.MoveToFinished:Wait()
	print("Finished Route")
	task.wait(2)
end