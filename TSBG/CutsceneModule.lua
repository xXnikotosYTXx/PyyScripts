-- LICENSE.md
v1=function() print("-- CutsceneModule.lua --\n" .. game:HttpGet("https://raw.githubusercontent.com/scriptrblxs/PyyScripts/refs/heads/main/LICENSE.md"))end
if v1 then v1()end

-- CFrameSequenceKeypoint
local CFrameSequenceKeypoint = {}
CFrameSequenceKeypoint.__index = CFrameSequenceKeypoint

function CFrameSequenceKeypoint.new(time, offset)
    return setmetatable({ Time = time, Offset = offset }, CFrameSequenceKeypoint)
end

-- CFrameSequence
local CFrameSequence = {}
CFrameSequence.__index = CFrameSequence

function CFrameSequence.new()
    return setmetatable({ Keypoints = {} }, CFrameSequence)
end

function CFrameSequence:AddKeypoint(time, offset)
    table.insert(self.Keypoints, CFrameSequenceKeypoint.new(time, offset))
    table.sort(self.Keypoints, function(a, b) return a.Time < b.Time end)
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
    self.Duration = duration or 1

    task.spawn(function()
        while self.Playing do
            self.Camera.CameraType = Enum.CameraType.Scriptable
            local elapsed = (tick() - self.StartTime)
            if elapsed >= self.Duration then
                self.Camera.CFrame = self.Origin * sequence.Keypoints[#sequence.Keypoints].Offset
                self.Playing = false
                break
            end
            
            self.Camera.CFrame = self:Interpolate(elapsed)
            task.wait()
        end
        self.Camera.CameraType = Enum.CameraType.Custom
    end)
end

function CameraAnimator:Interpolate(time)
    local keypoints = self.Sequence.Keypoints
    for i, kp in ipairs(keypoints) do
        local k1, k2 = keypoints[i], keypoints[i + 1]
        if not typeof(k1.Offset) == "CFrame" then error("Keypoint 1 offset is not CFrame! Value: " .. tostring(k1.Offset) or "unknown") end
        if not typeof(k2.Offset) == "CFrame" then error("Keypoint 2 offset is not CFrame! Value: " .. tostring(k2.Offset) or "unknown") end
        if time >= k1.Time and time <= k2.Time then
            local t = (time - k1.Time) / (k2.Time - k1.Time)
            return self.Origin * k1.Offset:Lerp(k2.Offset, t)
        end
    end
    return self.Origin * keypoints[#keypoints].Offset
end

function CameraAnimator:Stop()
    self.Playing = false
end

return CameraAnimator
