-- LICENSE.md
v1=function() print("-- CutsceneModule.lua --\n" .. game:HttpGet("https://raw.githubusercontent.com/scriptrblxs/PyyScripts/refs/heads/main/LICENSE.md"))end
if v1 then v1()end

-- CFrameSequenceKeypoint
local CFrameSequenceKeypoint = {}
CFrameSequenceKeypoint.__index = CFrameSequenceKeypoint

function CFrameSequenceKeypoint.new(alpha, offset)
    return setmetatable({ Alpha = alpha, Offset = offset }, CFrameSequenceKeypoint)
end

-- CFrameSequence
local CFrameSequence = {}
CFrameSequence.__index = CFrameSequence

function CFrameSequence.new()
    return setmetatable({ Keypoints = {} }, CFrameSequence)
end

function CFrameSequence:AddKeypoint(alpha, offset)
    table.insert(self.Keypoints, CFrameSequenceKeypoint.new(alpha, offset))
    table.sort(self.Keypoints, function(a, b) return a.Alpha < b.Alpha end)
end

function CFrameSequence:GetKeypoints()
    return self.Keypoints
end

-- CameraAnimator
local CameraAnimator = {}
CameraAnimator.__index = CameraAnimator

-- Add CFrameSequence to module for use
CameraAnimator.CFrameSequence = CFrameSequence

function CameraAnimator.new(camera, origin)
    return setmetatable({ Camera = camera, Origin = origin, Sequence = nil, Playing = false, StartTime = 0 }, CameraAnimator)
end

function CameraAnimator:Play(sequence, duration)
    if not sequence or #sequence.Keypoints < 2 then return end
    
    self.Sequence = sequence
    self.Playing = true
    self.StartTime = tick()
    self.Duration = duration or 1 -- Use 1 since alpha is normalized
    
    task.spawn(function()
        while self.Playing do
            self.Camera.CameraType = Enum.CameraType.Scriptable
            local elapsed = (tick() - self.StartTime) / self.Duration
            if elapsed >= 1 then
                self.Camera.CFrame = self.Origin * sequence.Keypoints[#sequence.Keypoints].Offset
                self.Playing = false
                break
            end
            
            self.Camera.CFrame = self:Interpolate(elapsed)
            task.wait()
        end
    end)
end

function CameraAnimator:Interpolate(alpha)
    local keypoints = self.Sequence.Keypoints
    for i, kp in ipairs(keypoints) do
        local k1, k2 = keypoints[i], keypoints[i + 1]
        if not k1.Offset then error("Keypoint 1 offset is missing! Value: " .. k1.Offset) end
        if not k2.Offset then error("Keypoint 2 offset is missing! Value: " .. k2.Offset) end
        if alpha >= k1.Alpha and alpha <= k2.Alpha then
            local t = (alpha - k1.Alpha) / (k2.Alpha - k1.Alpha)
            print("K1 Offset: " .. tostring(k1.Offset))
            print("K2 Offset: " .. tostring(k2.Offset))
            return self.Origin * k1.Offset:Lerp(k2.Offset, t)
        end
    end
    return self.Origin * keypoints[#keypoints].Offset
end

function CameraAnimator:Stop()
    self.Playing = false
end

return CameraAnimator

-- [[Example Use]]
-- local CameraAnimator = loadstring(INSERT-HTTPGET-HERE)()
-- local CFrameSequence = CameraAnimator.CFrameSequence
--
-- local camera = workspace.CurrentCamera
-- local rootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
-- local origin = rootPart and rootPart.CFrame or CFrame.new()
--
-- local sequence = CFrameSequence.new()
-- sequence:AddKeypoint(0, CFrame.new(0, 5, 10))
-- sequence:AddKeypoint(0.5, CFrame.new(10, 5, 0))
-- sequence:AddKeypoint(1, CFrame.new(0, 5, -10))
--
-- local animator = CameraAnimator.new(camera, origin)
-- animator:Play(sequence, 2) -- Play the animation in 2 seconds
