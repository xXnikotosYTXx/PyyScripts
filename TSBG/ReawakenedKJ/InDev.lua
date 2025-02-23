-- LICENSE.md
print(game:HttpGet("https://raw.githubusercontent.com/scriptrblxs/PyyScripts/refs/heads/main/LICENSE.md"))

local function notif(msg)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Reawakened KJ",
        Text = msg
    })
end

-- Premium Check
local verified = {
    "oioioibaaka828828",
}
if not table.find(verified, game.Players.LocalPlayer.Name) and not table.find(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Mukuro-Hoshimiya/Whitelist/refs/heads/main/whitelist.json")).whitelist, game.Players.LocalPlayer.Name) then
notif("Premium checking, may take a while...")
httpserv = game:GetService"HttpService"
local keypoint = "https://pyy-api.glitch.me/v1/getpremiums"
repeat task.wait(5) until game:HttpGet(keypoint)
local data = httpserv:JSONDecode(game:HttpGet(keypoint))
local isValid = false
for _, v in pairs(data) do
    local suc, id = pcall(function()
        return game.Players:GetDataFromUsernameAsync(v)
    end)
    if id == game.Players.LocalPlayer.UserId then
        isValid = true
    end
end
if not isValid then game.Players.LocalPlayer:Kick("User is detected not to be a premium user while using premium script!") end
end

local lplr = game.Players.LocalPlayer

local char = lplr.Character or lplr.CharacterAdded:Wait()

-- Object Removers (will remove vfx on the weapons, though)
local katana1 = false -- Make true if you want to remove Blade Master's katana
local katana2 = false -- Make true if you want to remove Sonic's katana
local bat = false -- Make true if you want to remove Metal Bat's baseball bat
if katana1 then char:FindFirstChild("Sheathe"):Destroy() char:FindFirstChild("#KATANAWEAPON"):Destroy() end
if katana2 then char:FindFirstChild("Sheathed"):Destroy() char:FindFirstChild("#NinjaKATANA"):Destroy() end
if bat then char:FindFirstChild("#BATWEAPON"):Destroy() end

-- Modules
local cutmod = loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptrblxs/PyyScripts/refs/heads/main/TSBG/CutsceneModule.lua"))()
local cfseq = cutmod.CFrameSequence

-- Editing names
local plrgui:PlayerGui = lplr:FindFirstChild("PlayerGui")
local gui:ScreenGui = plrgui:FindFirstChild("ScreenGui")
local ultbar:Frame = gui:FindFirstChild("MagicHealth")
local ultbarclr:Frame = ultbar:FindFirstChild("Health").Bar.Bar
local ulttext:TextButton = ultbar:FindFirstChild("TextLabel")

-- Awakening text & color
ulttext.Text = "KJ's Question"
ultbarclr.BackgroundColor3 = Color3.fromRGB(255, 35, 35) -- In RGB values (red, green, blue)

local hotbar:ScreenGui = plrgui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarf:Frame = backpack:FindFirstChild("Hotbar")
local bbb1, bbb2, bbb3, bbb4 = hotbarf["1"], hotbarf["2"], hotbarf["3"], hotbarf["4"]
local bb1, bb2, bb3, bb4 = bbb1["Base"], bbb2["Base"], bbb3["Base"], bbb4["Base"]
local b1, b2, b3, b4 = bb1["ToolName"], bb2["ToolName"], bb3["ToolName"], bb4["ToolName"]

-- Move names
local function SetMoveNames()
    b1.Text = "Dilating Strike"
    b2.Text = "Ravaging Punches"
    b3.Text = "Swift Kick"
    b4.Text = "Collapse"
end
SetMoveNames()

-- Awakening move names
local function SetAwkNames()
    b1.Text = "20 Series"
    b2.Text = "Palm of Infinity"
    b3.Text = "Infinite Modulations"
    b4.Text = "Calm Ordnance"
end

-- Animations
-- Old Animations (Animations that are currently being replaced)
local oldAnimations = {
    m1 = "10469493270", -- Replace with the old m1 animation ID
    m2 = "10469630950", -- Replace with the old m2 animation ID
    m3 = "10469639222", -- Replace with the old m3 animation ID
    m4 = "10469643643", -- Replace with the old m4 animation ID
    ds = "10470104242", -- Actually, DON'T replace this
    up = "10503381238", -- Actually, DON'T replace this
    wc = "15955393872", -- Replace with the old wall combo animation ID
    fdash = "10479335397", -- Actually, DON'T replace this
    bdash = "...", -- Actually, DON'T replace this
    ldash = "10480796021", -- Actually, DON'T replace this
    rdash = "10480793962", -- Actually, DON'T replace this
    awk = "12447707844", -- Replace with the old awakening animation ID
    move1 = "10468665991", -- Replace with the old move 1 animation ID
    move2 = "10466974800", -- Replace with the old move 2 animation ID
    move3 = "10471336737", -- Replace with the old move 3 animation ID
    move4 = "12510170988", -- Replace with the old move 4 animation ID
    amove1 = "11343318134", -- Replace with the old awakening move 1 animation ID
    amove2 = "11365563255", -- Replace with the old awakening move 2 animation ID
    amove3 = "12983333733", -- Replace with the old awakening move 3 animation ID
    amove4 = "13927612951", -- Replace with the old awakening move 4 animation ID
}

-- New Animations (Animations that will replace the old ones)
local newAnimations = {
    m1 = "17325510002", -- Replace with your new m1 animation ID
    m2 = "17325537719", -- Replace with your new m2 animation ID
    m3 = "17325522388", -- Replace with your new m3 animation ID
    m4 = "17325537719", -- Replace with your new m4 animation ID
    ds = "10470104242", -- Replace with your new downslam animation ID
    up = "10503381238", -- Replace with your new mini uppercut animation ID
    wc = "15955393872", -- Replace with your new wall combo animation ID
    fdash = "140164642047188", -- Replace with your new front dash animation ID
    bdash = "696969", -- Replace with your new back dash animation ID
    ldash = "10480796021", -- Replace with your new left dash animation ID
    rdash = "10480793962", -- Replace with your new right dash animation ID
    awk = "17140902079", -- Replace with your new awakening animation ID
    move1 = "16945550029", -- Replace with your new move 1 animation ID
    move2 = "16945550029", -- Replace with your new move 2 animation ID
    move3 = "16944265635", -- Replace with your new move 3 animation ID
    move4 = "17325254223", -- Replace with your new move 4 animation ID
    amove1 = "76530443909428", -- Replace with your new move awakening 1 animation ID
    amove2 = "11365563255", -- Replace with your new move awakening 2 animation ID
    amove3 = "77727115892579", -- Replace with your new move awakening 3 animation ID
    amove4 = "13927612951", -- Replace with your new move awakening 4 animation ID
}

-- Code/functions to use in the handlers

-- some variables for handlers
local ufwTime = 5.6

local avfx1 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit"]["EmitBatch1"]:Clone() avfx1.Parent = char.HumanoidRootPart
local avfx2 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit"]["EmitBatch2"]:Clone() avfx2.Parent = char.HumanoidRootPart
local avfx3 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit"]["EmitBatch3"]:Clone() avfx3.Parent = char.HumanoidRootPart
local function awakeningVFXBatch1()
    for _, v in pairs(avfx1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v:Emit(v:GetAttribute("EmitCount"))
        end
    end
    for _, v in pairs(avfx2:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v:Emit(v:GetAttribute("EmitCount"))
        end
    end
    for _, v in pairs(avfx3:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v:Emit(v:GetAttribute("EmitCount"))
        end
    end
end

local ivfx1 = game.ReplicatedStorage.Resources.KJEffects["fine...1OG"]["EnableBatch2"]:Clone() ivfx1.Parent = char.HumanoidRootPart
local ivfx2 = game.ReplicatedStorage.Resources.KJEffects["fine...1OG"]["REDDDD1"]:Clone() ivfx2.Parent = char.HumanoidRootPart
local ivfx3 = game.ReplicatedStorage.Resources.KJEffects["fine...1OG"]["REDDDD2"]:Clone() ivfx3.Parent = char.HumanoidRootPart
local ivfx4 = game.ReplicatedStorage.Resources.KJEffects["fine...1OG"]["REDDDD3"]:Clone() ivfx4.Parent = char["Left Arm"]
local ivfx5 = game.ReplicatedStorage.Resources.KJEffects["fine...1OG"]["REDDDD4"]:Clone() ivfx5.Parent = char["Right Arm"]
local endvfx = game.ReplicatedStorage.Resources.KJEffects["stoic bomb boom entrance"]["THEACTUALBOOM"]:Clone() endvfx.Parent = char.HumanoidRootPart
local function awakeningVFXBatch2(duration:number)
    for _, v in pairs(ivfx1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = true
        end
    end
    ivfx2.Enabled = true
    ivfx3.Enabled = true
    ivfx4.Enabled = true
    ivfx5.Enabled = true
    
    task.delay(duration, function()
        for _, v in pairs(ivfx1:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = false
            end
        end
        ivfx2.Enabled = false
        ivfx3.Enabled = false
        ivfx4.Enabled = false
        ivfx5.Enabled = false
        for _, v in pairs(endvfx:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                v:Emit(v:GetAttribute("EmitCount"))
            end
        end
    end)
end

local hrp = char:FindFirstChild("HumanoidRootPart")

local function chat(msg: string)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end
local function playAnimation(id, details)
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid or not humanoid:FindFirstChild("Animator") then
        warn("Invalid humanoid or humanoid has no Animator.")
        return
    end

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. tostring(id)

    local animator:Animator = humanoid:FindFirstChild("Animator")
    local animationTrack = animator:LoadAnimation(animation)

    animationTrack:Play()

    if details then
        if details.Priority then
            animationTrack.Priority = details.Priority
        end
        if details.Looped ~= nil then
            animationTrack.Looped = details.Looped
        end
        if details.Speed then
            animationTrack:AdjustSpeed(details.Speed)
        end
        if details.TimePosition then
            animationTrack.TimePosition = details.TimePosition
        end
        if details.Weight then
            animationTrack:AdjustWeight(details.Weight)
        end
        if details.EndTime then
            task.delay(details.EndTime, function() animationTrack:Stop() end)
        end
    end

    return animationTrack
end

-- Removing every bodyvelocity that gets added to the character Y velocity for Collapse
char.DescendantAdded:Connect(function(c)
    if c:IsA("BodyVelocity") then
        c.Velocity = Vector3.new(c.Velocity.X, 0, c.Velocity.Z)
    end
end)

-- Handlers for each m1s, the ultimate anim, and moves (if it doesnt have handlers, it would be a blank custom moveset script with no vfx, no other stuff other than custom animations)
local handlers = {
    m1 = function() end,
    m2 = function() end,
    m3 = function() end,
    m4 = function() end,
    wc = function() end,
    fdash = function() end,
    bdash = function() end,
    ldash = function() end,
    rdash = function() end,

    awk = function(tr)
        awakeningVFXBatch1()
        awakeningVFXBatch2(tr.Length - 0.9)
        local loop = true
        task.spawn(function()
            while loop do
                hotbar.Enabled = false

                char.Humanoid.WalkSpeed = 0
                char.Humanoid.JumpPower = 0

                task.wait()
            end
        end)

        local sound1 = Instance.new("Sound")
        local sound2 = Instance.new("Sound")
        sound1.Parent = char.Head
        sound2.Parent = char.Head
        sound1.SoundId = "rbxassetid://17150550559"
        sound2.SoundId = "rbxassetid://17150550302"
        sound1.Volume = 5
        sound2.Volume = 5
        sound1:Play()
        sound2:Play()

        task.wait(tr.Length)
        loop = false
        sound1:Destroy()
        sound2:Destroy()
        hotbar.Enabled = true
        char.Humanoid.WalkSpeed = 16
        char.Humanoid.JumpPower = 50
    end,

    move1 = function()

    end,

    move2 = function()

    end,

    move3 = function()
        
        task.spawn(function()
            local kj = game.ReplicatedStorage.Resources.KJEffects
            local ts = game:GetService("TweenService")
            
            local cresc = kj.FollowUpCresc:Clone()
            local sweep = kj.SweepHitMesh:Clone()
            sweep.CFrame = hrp.CFrame * CFrame.new(2.16400146484375, -2.9619998931884766, -4.4180297851562) * CFrame.Angles(0, 0, -1.5707963267948966)
            sweep.Parent = workspace.Thrown
            cresc.CFrame = hrp.CFrame * CFrame.new(0, -2.5, -2)
            cresc.Parent = workspace.Thrown
            
            ts:Create(sweep.Mesh, TweenInfo.new(0.133), {
                Scale = Vector3.new(0, 20, 0)
            }):Play()
            ts:Create(sweep, TweenInfo.new(0.133), {
                CFrame = hrp.CFrame * CFrame.new(0.5640029907226562, -2.9619998931884766, -4.41802978515625) * CFrame.Angles(0, 0, -1.5707963267948966)
            }):Play()
            
            task.delay(0.083, function()
                local hitbox = Instance.new("Part")
                hitbox.CanCollide = false
                hitbox.Transparency = 1
                hitbox.CFrame = hrp.CFrame * CFrame.new(0, 0, -2)
                hitbox.Size = Vector3.new()
                hitbox.Parent = workspace.Thrown
                task.wait(0.05)
                for _, v in pairs(workspace)
                local hit = kj.LegSweepHit.Hit:Clone()
                hit.Parent = opphrp
                hit["15"]:Emit(15)
                game:GetService("Debris"):AddItem(hit, 0.5)
            end)
        end)
        
        local hrp = char.HumanoidRootPart
        task.wait(0.135)
        local starttime = tick()
        local lowtime = 0.5
        local startcf = hrp.CFrame
        while tick() <= starttime + lowtime do
            hrp.CFrame = startcf * CFrame.new(0, -1.5, 0)
            task.wait()
        end
    end,

    move4 = function()
        task.wait(0.5)
        local vfx = game:GetService("ReplicatedStorage").Resources.Dragon.Explosion.Part.WindFast

        local vfx1 = vfx:Clone()
        vfx1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
        local vfx2 = vfx:Clone()
        vfx2.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

        for _, child in pairs(vfx1:GetChildren()) do
            if child:IsA("ParticleEmitter") then

                child.Speed = NumberRange.new(0.5)
                child.Color = ColorSequence.new(Color3.new(0.25, 0.3, 0.25))
                child.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 25),
                    NumberSequenceKeypoint.new(1, 50),
                })

                child:Emit(4)
            end
        end

        for _, child in pairs(vfx2:GetChildren()) do
            if child:IsA("ParticleEmitter") then

                child.Speed = NumberRange.new(0.5)
                child.Color = ColorSequence.new(Color3.new(1, 0, 0))
                child.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 10),
                    NumberSequenceKeypoint.new(1, 20),
                })

                child:Emit(6)
            end
        end
    end,

    amove1 = function(oldTrack)
        workspace.CurrentCamera:remove()
        wait()
        workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
        workspace.CurrentCamera.CameraType = "Custom"
        game.Players.LocalPlayer.CameraMinZoomDistance = 0.5
        game.Players.LocalPlayer.CameraMaxZoomDistance = 400
        game.Players.LocalPlayer.CameraMode = "Classic"
        game.Players.LocalPlayer.Character.Head.Anchored = false
        
        task.wait(oldTrack.Length - 0.87)
        playAnimation(140164642047188, { Weight = 10, TimePosition = 6.55})
    end,

    amove2 = function()

    end,

    amove3 = function(newTrack, oldTrack)
        task.spawn(function()
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            local CameraAnimator = cutmod.new(workspace.CurrentCamera, char.HumanoidRootPart)
            local seq = cfseq.new()
        end)

        task.spawn(function()
            task.wait(0.5)
            local image = Instance.new("ImageLabel")
            image.Visible = true
            image.BackgroundTransparency = 1
            image.Image = "rbxassetid://118021299550047"
            image.AnchorPoint = Vector2.new(0.5, 0.5)
            image.Size = UDim2.new(1, 0, 1, 0)
            image.Position = UDim2.new(0.5, 0, 0.5, 0)

            local vf = Instance.new("ViewportFrame")
            vf.Visible = true
            vf.BackgroundTransparency = 1
            vf.AnchorPoint = Vector2.new(0.5, 0.5)
            vf.Size = UDim2.new(1, 0, 1, 0)
            vf.Position = UDim2.new(0.5, 0, 0.5, 0)
            vf.CurrentCamera = workspace.CurrentCamera
            vf.Parent = image

            local ui = Instance.new("ScreenGui")
            ui.Enabled = true
            ui.IgnoreGuiInset = true
            ui.ScreenInsets = Enum.ScreenInsets.None
            ui.Parent = lplr.PlayerGui
            image.Parent = ui

            task.spawn(function()
                while true do
                    vf:ClearAllChildren()
                    local newChar = Instance.new("Model")
                    newChar.Parent = vf
                    for _, v in pairs(char:GetChildren()) do
                        if not v:IsA("BaseScript") then
                            v:Clone().Parent = newChar
                        end
                    end
                    task.wait()
                end
            end)

            task.wait(oldTrack.Length - 2.64)
            ui:Destroy()
        end)

        task.wait(oldTrack.Length - 2.64)
        playAnimation("77727115892579", {Weight = 10, TimePosition = 25.5, Speed = 1, EndTime = 2.25})
    end,

    amove4 = function()
        print("")
    end,
}

-- Table of animation data for the animations
local animDt = {
    m1 = { Speed = 1.3 },
    m2 = { Speed = 1.3 },
    m3 = { Speed = 1.3 },
    m4 = { Speed = 1.3 },
    fdash = { TimePosition = 6.55, Speed = 1.5 },
    move1 = { TimePosition = 3.8, Speed = 1.8 },
    move2 = { TimePosition = 2, EndTime = 1.25 },
    move4 = { TimePosition = 1 },
    amove3 = { Speed = 2.3, EndTime = ufwTime }
}

local hum = char:FindFirstChildOfClass("Humanoid")
local animator = hum:FindFirstChildOfClass("Animator")
for k, v in pairs(oldAnimations) do
    animator.AnimationPlayed:Connect(function(tr)
        if tr.Animation.AnimationId == "rbxassetid://" .. v and tr.Animation.AnimationId ~= "rbxassetid://" .. newAnimations[k] then
            tr:Stop()
            local trdt = animDt[k] or { Weight = 10 }
            if not trdt["Weight"] then trdt.Weight = 10 end -- Avoid bad animation
            local newtr = playAnimation(newAnimations[k], trdt)
            task.spawn(function() handlers[k](newtr, tr) end)

            if k == "awk" then
                task.wait(1.25) -- Modify for your character's ultimate animation length
                SetAwkNames()
            end
        end
    end)
end

lplr:GetAttributeChangedSignal("Ultimate"):Connect(function()
    if lplr:GetAttribute("Ultimate") == 0 then
        task.wait(0.5) SetMoveNames()
    end
end)