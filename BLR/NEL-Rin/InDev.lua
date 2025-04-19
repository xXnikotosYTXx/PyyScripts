-- LICENSE.md
print(game:HttpGet("https://raw.githubusercontent.com/scriptrblxs/PyyScripts/refs/heads/main/LICENSE.md"))

local lplr = game.Players.LocalPlayer
local char = lplr.Character or lplr.CharacterAdded:Wait()

local STYLE_NAME = "NEL Rin"
local STYLE_CLRADD = Color3.new(1, 0, p)

local plrgui = lplr:FindFirstChildWhichIsA("PlayerGui")
local style = plrgui.Style.BG.Slots["1"]
style.Text.Text = STYLE_NAME
style.Color3 = style.Color3:Lerp(STYLE_CLRADD, 0.5)
local a = plrgui.InGameUI
local b = a.Bottom
local c = b.Abilities

local a1 = c["1"] local b1 = a1:Clone() b1.Name = "A1"
local a2 = c["2"] local b2 = a2:Clone() b2.Name = "A2"
local a3 = c["3"] local b3 = a3:Clone() b3.Name = "A3"

a1:Destroy() b1.Parent = c
a2:Destroy() b2.Parent = c
a3:Destroy() b3.Parent = c