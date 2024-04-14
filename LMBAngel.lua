local AngelM1 = require(game:GetService("ReplicatedStorage").Effect.Container.Angel.M1)
local Utils = require(game.ReplicatedStorage.Util)
local plr = game.Players.LocalPlayer
local mode = 1

local tool = Instance.new("Tool", plr.Backpack)
tool.Name = "M1"
tool.RequiresHandle = false

local M1Anims = {"AngelM1", "AngelM2", "AngelM3", "AngelM4"}

for i, v in M1Anims do
    Utils.Anims:Preload(v)
end

tool.Activated:Connect(function()
    local char = plr.Character
    local Anims = Utils.Anims:Get(char, M1Anims[mode])
    Anims:Play()
    Anims:AdjustSpeed(2)
    
    AngelM1({
        hrp = char.PrimaryPart,
        index = mode,
    })

    mode = mode % 4 + 1
end)
