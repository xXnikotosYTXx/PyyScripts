local player = game.Players.LocalPlayer
if player:GetAttribute("Character") ~= "Hunter" then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Auto-Kyoto",
        Text = "❌ Hero Hunter is needed!",
    })
    return
end

if getgenv().AutoKyoto then return end
getgenv().AutoKyoto = true

local refs = {}

refs.__namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    local isRunningOnExecutor = checkcaller()

    if not isRunningOnExecutor and tostring(self) == "Communicate" and method == "FireServer" then
        local data = args[1]
        if typeof(data) == "table" and data.Tool and data.Goal == "Console Move" then
            local tool = data.Tool
            if tool.Name == "Flowing Water" then
                task.delay(1, function()
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and workspace.CurrentCamera then
                        local humanoid = char:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                                if track.Animation and track.Animation.AnimationId == "rbxassetid://12273188754" then
                                    task.wait(1.15)
                                    -- Move forward
                                    local hrp = char.HumanoidRootPart
                                    local originalCFrame = hrp.CFrame
                                    hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -25.5)

                                    -- Invert camera offset
                                    local cam = workspace.CurrentCamera
                                    cam.CFrame = CFrame.new((hrp.CFrame * CFrame.new(0, 0, 15)).Position, originalCFrame.Position)

                                    -- Use Lethal Whirlwind Stream
                                    local whirlwind = player.Backpack:FindFirstChild("Lethal Whirlwind Stream") or player.Character:FindFirstChild("Lethal Whirlwind Stream")
                                    if whirlwind then
                                        player.Character.Communicate:FireServer({
                                            Tool = whirlwind,
                                            Goal = "Console Move"
                                        })
                                    end
                                    return -- Exit loop early
                                end
                            end
                        end
                    end
                end)
            end
        end
    end

    return refs.__namecall(self, ...)
end)