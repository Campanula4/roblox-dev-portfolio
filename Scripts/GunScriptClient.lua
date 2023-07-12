--Services
local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")

--Variables
local handle = script.Parent.Handle
local tool = script.Parent

local handlePosition = nil
local plr = plrs.LocalPlayer

local mouse = plr:GetMouse()
local remote = rs.RemoteEvent

local visualsDir = workspace.Visuals
local toolDebounce = false 
local debounceTime = tool:GetAttribute("Cooldown")

-- main
mouse.TargetFilter = visualsDir

function toolAction()
    print("Tool Fired")
    if not toolDebounce then
        toolDebounce = true
        
        local startPos = tool.Handle.Position
        local endPos = mouse.Hit.Position
        
        remote:FireServer(tool, startPos, endPos)
        task.wait(debounceTime)
        toolDebounce=false
    end
end
tool.Activated:Connect(toolAction)