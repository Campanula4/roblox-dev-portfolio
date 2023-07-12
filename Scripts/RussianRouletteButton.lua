local click = script.Parent.ClickDetector
local part = script.Parent
local tweenService = game:GetService("TweenService")

click.MouseClick:Connect(function(plr)
    
    -- Explode with a 1/6 chance
    local chance = math.random(0,7)
    if chance == 6 then do
            part.BrickColor = BrickColor.new(255,0,0)
            task.spawn(function()
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                local pos = plr.Character:FindFirstChild("Head").Position
                local e = Instance.new("Explosion")
                e.Parent = workspace
                e.Position = plr.Character:FindFirstChild("HumanoidRootPart").Position
            end)
        end
        else part.BrickColor = BrickColor.new(0,255,0)
    end
    
    -- VFX
    
    local effect = Instance.new("Part")
    effect.Parent = script.Parent
    effect.Position = part.Position
    effect.Size = Vector3.new(1,3,3)
    effect.BrickColor = part.BrickColor
    effect.Anchored = true
    effect.CanCollide = false
    effect.Transparency = 0.7
    
    local sizeY = effect.Size.Y+3
    
    local info = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local properties = {
        Size = Vector3.new(1.5,3.5,3.5)
    }
    local tween = tweenService:Create(effect, info, properties)
    tween:Play()
    tween.Completed:Wait()
    effect:Destroy()
end)

click.MaxActivationDistance = 999