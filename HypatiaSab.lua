-- HypatiaDz Hub for Steal a Brainrot
-- Full Features | Works on PC and PE

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3"))()
local Window = Library:CreateWindow("HypatiaDz Hub")

-- MAIN TAB
local Main = Window:CreateTab("Main")

Main:CreateButton("Auto Collect Brainrot", function()
    getgenv().autocollect = true
    while autocollect do
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v.Name == "Brainrot" and v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
        task.wait(1)
    end
end)

Main:CreateButton("Teleport to Random Player", function()
    local players = game.Players:GetPlayers()
    local random = players[math.random(1, #players)]
    game.Players.LocalPlayer.Character:MoveTo(random.Character.HumanoidRootPart.Position + Vector3.new(3, 0, 0))
end)

-- MISC TAB
local Misc = Window:CreateTab("Misc")

Misc:CreateSlider("WalkSpeed", 16, 200, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

Misc:CreateSlider("JumpPower", 50, 200, function(val)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
end)

Misc:CreateButton("Anti AFK", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
