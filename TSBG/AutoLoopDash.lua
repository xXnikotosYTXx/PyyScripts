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

button.Parent = lplr.PlayerGui.ScreenGui



button.Activated:Connect(function()
    local hum = char:FindFirstAncestorWhichIsA("Humanoid")

    char.Communicate:FireServer({
        Dash = Enum.KeyCode.W,
        Key = Enum.KeyCode.Q,
        Goal = "KeyPress"
    })

    local keepStopping = true
    task.spawn(function()
        local startcf = char.HumanoidRootPart.CFrame
        while keepStopping do
            char.HumanoidRootPart.CFrame = startcf
            task.wait()
        end
    end)
    task.wait(1.25)
    keepStopping = false
end)