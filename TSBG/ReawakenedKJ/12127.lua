
local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("1").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Reversal Red" -- put the name of the base move 1


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Consecutive-Beatdown" -- put the name of the base move 2


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("3").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Instant-Strike!" -- put the name of the base move 3


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("4").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Glorious-Uprise" -- put the name of the base move 4


local Players = game:GetService("Players")

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")


local function findGuiAndSetText()

    local screenGui = playerGui:FindFirstChild("ScreenGui")

    if screenGui then

        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")

        if magicHealthFrame then

            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")

            if textLabel then

                textLabel.Text = "Panic's Madness" -- put the name of the ult name ultimate text

            end

        end

    end

end

-- move 1

playerGui.DescendantAdded:Connect(findGuiAndSetText)

findGuiAndSetText()


local animationId = 10468665991 -- the anim that will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://13073745835" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0.2-- speed for specific


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)


    end

end

-- end of move 1

-- move 2
humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10466974800 -- the move that it will track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://12534735382" -- the specific move ur gonna replace

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- speed for the specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1.3)


    end

end

-- end of move 2

-- move 3

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10471336737 -- the anim that will track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://13294790250" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0.5 -- speed for specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)


delay(1.8, function()

    Anim:Stop()

end)


    end

end

-- end of move 3

-- move 4

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 12510170988 -- the specific anim that will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://18464372850" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 2 -- the speed for the specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)


    end

end

-- end of move 4
local tool = Instance.new("Tool")
    tool.Name = "Inhumane Speed"

    tool.Parent = game.Players.LocalPlayer.Backpack
    tool.RequiresHandle = false

    local moving = false
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    local runService = game:GetService("RunService")
    local movementSpeed = 125

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://18897115785" 
    local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    local animationTrack


    local function moveForward()
        while moving do
            local forwardDirection = humanoidRootPart.CFrame.LookVector
            humanoidRootPart.Velocity = forwardDirection * movementSpeed
            runService.Stepped:Wait()
        end
    end

    tool.Equipped:Connect(function()
        moving = true
        animationTrack = animator:LoadAnimation(animation)
        animationTrack:Play()
        moveForward()
    end)

    tool.Unequipped:Connect(function()
        moving = false
        if animationTrack then
            animationTrack:Stop()
        end
    end)
    
    local LocalPlr = game.Players.LocalPlayer
local hrp = LocalPlr.Character:WaitForChild("HumanoidRootPart", 10)

local t = Instance.new("Tool", LocalPlr.Backpack)
t.Name = "Teleport Tool"
t.RequiresHandle = false
t.Activated:Connect(function()
    local mousePos = LocalPlr:GetMouse().Hit.Position
    hrp.CFrame = CFrame.new(mousePos) * (hrp.CFrame - hrp.Position)
end)

-- ult move 1
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local animationId = 11343318134 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://12983333733" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 2 -- speed for specific anim

Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(0.5)


    end

end

-- end of ult move 1

-- wall combo

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local animationId = 15955393872 -- the anim that will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://18903642853" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 1 -- speed for the specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)
wait(0)

local Test = game.ReplicatedStorage.Resources.Sorcerer.LimitlessBarrier.Core.BarrierFX

local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character:WaitForChild("Right Leg")

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(2)
        child.Enabled = true
    end
end
wait(3)
test:Destroy()

    end

end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)
-- end of wall combo

-- serious punch

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local animationId = 12983333733 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://13073745835" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- speed of specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(0.2)


    end

end

-- end of serious punch
-- table flip

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local animationId = 11365563255 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- speed of specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(0.2)


    end

end

-- end of table flip

-- ult anim

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 12447707844 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://18435303746" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- the specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)

    end

end

-- the end of ult anim

-- front dash

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10479335397 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://14046756619" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- the specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(0.7)


delay(1.2, function()

    Anim:Stop()

end)


    end

end

-- end of front dash

-- mini uppercut

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10503381238 -- the anim will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://14900168720" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 1.3 -- the speed for specific anim


Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)


    end

end

-- end of mini upper cut

-- downslam

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local animationId = 10470104242 -- the anim that will get track


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://12684185971" -- the specific anim

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 -- the speed for specific anim


wait(0.2)

Anim:Play()

Anim:AdjustSpeed(0)

Anim.TimePosition = startTime

Anim:AdjustSpeed(1)


    end

end

-- end of downslam

-- m1's

humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local Players = game:GetService("Players")

local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")

-- the anim that will get track

local animationIdsToStop = {

    [10469493270] = true,

    [10469630950] = true,

    [10469639222] = true,

    [10469643643] = true,

}

-- the specific anim

local replacementAnimations = {

    ["10469643643"] = "rbxassetid://17889290569", -- 4th m1's dont change the [12345678910] change the rbxassetid://123..

    ["10469639222"] = "rbxassetid://17889471098",  -- 3rd m1's dont change the [12345678910] change the rbxassetid://123..

    ["10469630950"] = "rbxassetid://17889461810", -- 2nd m1's dont change the [12345678910] change the rbxassetid://123..

    ["10469493270"] = "rbxassetid://17889458563", -- 1st m1's dont change the [12345678910] change the rbxassetid://123..

}


local queue = {}

local isAnimating = false


local function playReplacementAnimation(animationId)

    if isAnimating then

        table.insert(queue, animationId)

        return

    end
    
    -- end of m1s
    
    -- ignore

   

    isAnimating = true

    local replacementAnimationId = replacementAnimations[tostring(animationId)]

    if replacementAnimationId then

        local AnimAnim = Instance.new("Animation")

        AnimAnim.AnimationId = replacementAnimationId

        local Anim = humanoid:LoadAnimation(AnimAnim)

        Anim:Play()

       

        Anim.Stopped:Connect(function()

            isAnimating = false

            if #queue > 0 then

                local nextAnimationId = table.remove(queue, 1)

                playReplacementAnimation(nextAnimationId)

            end

        end)

    else

        isAnimating = false

    end

end


local function stopSpecificAnimations()

    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do

        local animationId = tonumber(track.Animation.AnimationId:match("%d+"))

        if animationIdsToStop[animationId] then

            track:Stop()

        end

    end

end


local function onAnimationPlayed(animationTrack)

    local animationId = tonumber(animationTrack.Animation.AnimationId:match("%d+"))

    if animationIdsToStop[animationId] then

        stopSpecificAnimations()

        animationTrack:Stop()

       

        local replacementAnimationId = replacementAnimations[tostring(animationId)]

        if replacementAnimationId then

            playReplacementAnimation(animationId)

        end

    end

end


humanoid.AnimationPlayed:Connect(onAnimationPlayed)


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoidRootPart = character:WaitForChild("HumanoidRootPart")


local function onBodyVelocityAdded(bodyVelocity)

    if bodyVelocity:IsA("BodyVelocity") then

        bodyVelocity.Velocity = Vector3.new(bodyVelocity.Velocity.X, 0, bodyVelocity.Velocity.Z)

    end

end


character.DescendantAdded:Connect(onBodyVelocityAdded)


for _, descendant in pairs(character:GetDescendants()) do

    onBodyVelocityAdded(descendant)

end


player.CharacterAdded:Connect(function(newCharacter)

    character = newCharacter

    humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    character.DescendantAdded:Connect(onBodyVelocityAdded)

   

    for _, descendant in pairs(character:GetDescendants()) do

        onBodyVelocityAdded(descendant)

    end

end)
