-- AutoLoopDash.lua by python.aerial on Discord or scriptrblxs on GitHub
-- dont skid or i delete ball permission

local lplr = game.Players.LocalPlayer
local char = lplr.Character

local button = Instance.new("TextButton")
button.Text = "Loop"
button.TextScaled = true
button.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
button.Size = UDim2.new(0.083, 0, 0.153, 0)
button.Position = UDim2.new(0.035, 0, 0.369, 0)
button.BorderSizePixel = 5

local restraint = Instance.new("UIAspectRatioConstraint")
restraint.AspectRatio = 1
restraint.AspectType = Enum.AspectType.FitWithinMaxSize
restraint.DominantAxis = Enum.DominantAxis.Width
restraint.Parent = button

button.Parent = lplr.PlayerGui



button.Activated:Connect(function()
    local hum = char:FindFirstAncestorWhichIsA("Humanoid")

    char.Communicate:FireServer({
        Dash = Enum.KeyCode.W,
        Key = Enum.KeyCode.Q,
        Goal = "KeyPress"
    })

    local dashEvent = hum.AnimationPlayed:Connect(function(tr)
        if tr.Animation.AnimationId == "rbxassetid://10479335397" then
            local bvEvent = char.DescendantAdded:Connect(function(d)
                if d:IsA("BodyVelocity") then
                    while true do
                        d.Velocity = Vector3.new(0, d.Velocity.Y, 0)
                        task.wait()
                    end
                end
            end)
            task.delay(0.5, function()
                bvEvent:Disconnect()
            end)
        end
    end)
    task.delay(0.5, function()
        dashEvent:Disconnect()
    end)
end)