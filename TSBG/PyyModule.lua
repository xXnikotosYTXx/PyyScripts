local module = {}

local lplr = game.Players.LocalPlayer

function module.KJDialogue(dialogue: string, aggro: number?)
    aggro = aggro or 0
    if aggro > 1 or aggro < 0 then error("Aggro level must be in between 0 and 1!") end

    local ufw = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
    local data = {
        {
            Text = dialogue,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 17, 17))
            }),
            TextStrokeColor = Color3.new(0, 0, 0),
            Bold = (aggro == 0) and false or true,
            Italic = (aggro == 0) and false or true,
            Shake = {
                Enabled = (aggro == 0) and false or true,
                Intensity = 5 / aggro,
                Lifetime = 1
            },
            TypeSpeed = 0.06,
        }
    }

    ufw.Speak(lplr.Character, data)
end

function module.Speak(message: string)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

function module.MangaText(text1: string, text2: string?, lifetime: number?)
    lifetime = lifetime or 1.5

    coroutine.wrap(function()
        local ts = game:GetService("TweenService")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local Dialogue = Instance.new("BillboardGui")
        local Chat1 = Instance.new("Frame")
        local Sub = Instance.new("TextLabel")
        local Chat2 = nil
        local Sub2 = nil

        Dialogue.Active = true
        Dialogue.Size = UDim2.new(15, 0, 15, 0)
        Dialogue.StudsOffset = Vector3.new(0, 0, 2)
        Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Dialogue.Name = "Dialogue"
        Dialogue.Parent = humanoidRootPart

        Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
        Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
        Chat1.BorderColor3 = Color3.new(0, 0, 0)
        Chat1.BorderSizePixel = 2
        Chat1.Position = UDim2.new(0.6, 0, 0, 0)
        Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
        Chat1.Name = "Chat1"
        Chat1.BackgroundTransparency = 1
        Chat1.Parent = Dialogue

        Sub.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
        Sub.Text = text1
        Sub.TextColor3 = Color3.new(0, 0, 0)
        Sub.TextScaled = true
        Sub.TextSize = 14
        Sub.TextWrapped = true
        Sub.AnchorPoint = Vector2.new(0.5, 0.5)
        Sub.BackgroundColor3 = Color3.new(1, 1, 1)
        Sub.TextTransparency = 1
        Sub.BackgroundTransparency = 1
        Sub.BorderColor3 = Color3.new(0, 0, 0)
        Sub.BorderSizePixel = 0
        Sub.Position = UDim2.new(0.5, 0, 0.5, 0)
        Sub.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
        Sub.Name = "Sub"
        Sub.Parent = Chat1

        if text2 and text2 ~= "" then
            Chat2 = Instance.new("Frame")
            Sub2 = Instance.new("TextLabel")

            Chat2.AnchorPoint = Vector2.new(0.5, 0.5)
            Chat2.BackgroundColor3 = Color3.new(1, 1, 1)
            Chat2.BorderColor3 = Color3.new(0, 0, 0)
            Chat2.BorderSizePixel = 2
            Chat2.Position = UDim2.new(0.4, 0, 0.2, 0)
            Chat2.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
            Chat2.Name = "Chat2"
            Chat2.BackgroundTransparency = 1
            Chat2.Parent = Dialogue

            Sub2.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
            Sub2.Text = text2
            Sub2.TextColor3 = Color3.new(0, 0, 0)
            Sub2.TextScaled = true
            Sub2.TextSize = 14
            Sub2.TextWrapped = true
            Sub2.AnchorPoint = Vector2.new(0.5, 0.5)
            Sub2.BackgroundColor3 = Color3.new(1, 1, 1)
            Sub2.TextTransparency = 1
            Sub2.BackgroundTransparency = 1
            Sub2.BorderColor3 = Color3.new(0, 0, 0)
            Sub2.BorderSizePixel = 0
            Sub2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Sub2.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
            Sub2.Name = "Sub2"
            Sub2.Parent = Chat2
        end

        -- Clean up items
        game.Debris:AddItem(Chat1, 25)
        game.Debris:AddItem(Sub, 25)
        if Chat2 then
            game.Debris:AddItem(Chat2, 25)
            game.Debris:AddItem(Sub2, 25)
        end

        -- Tweening function
        local function tweenProperty(object, properties, time)
            local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = ts:Create(object, tweenInfo, properties)
            tween:Play()
            return tween
        end

        -- Tween animations
        tweenProperty(Chat1, {BackgroundTransparency = 0}, 1)
        tweenProperty(Sub, {TextTransparency = 0}, 1)
        if Chat2 and Sub2 then
            tweenProperty(Chat2, {BackgroundTransparency = 0}, 1)
            tweenProperty(Sub2, {TextTransparency = 0}, 1)
        end
        tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 1)
        if Chat2 then
            tweenProperty(Chat2, {Position = UDim2.new(0.4, 0, 0.6, 0)}, 1)
        end
        task.wait(lifetime)
        tweenProperty(Chat1, {BackgroundTransparency = 1}, 1)
        tweenProperty(Sub, {TextTransparency = 1}, 1)
        if Chat2 and Sub2 then
            tweenProperty(Chat2, {BackgroundTransparency = 1}, 1)
            tweenProperty(Sub2, {TextTransparency = 1}, 1)
        end
    end)()
end


return module