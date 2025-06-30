-- HypatiaDz Hub (Rayfield UI)
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "HypatiaDz Hub - Steal a Brainrot",
	LoadingTitle = "HypatiaDz Loading...",
	LoadingSubtitle = "by HypatiaDz",
	ConfigurationSaving = {
		Enabled = false,
	},
})

local Main = Window:CreateTab("Main", 4483362458)
Main:CreateButton({
	Name = "Auto Collect Brainrot",
	Callback = function()
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
	end
})

Main:CreateButton({
	Name = "Teleport to Random Player",
	Callback = function()
		local players = game.Players:GetPlayers()
		local random = players[math.random(1, #players)]
		game.Players.LocalPlayer.Character:MoveTo(random.Character.HumanoidRootPart.Position + Vector3.new(3, 0, 0))
	end
})

local Misc = Window:CreateTab("Misc", 4483362458)

Misc:CreateSlider({
	Name = "WalkSpeed",
	Range = {16, 200},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(val)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
})

Misc:CreateSlider({
	Name = "JumpPower",
	Range = {50, 200},
	Increment = 1,
	CurrentValue = 50,
	Callback = function(val)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
	end
})

Misc:CreateButton({
	Name = "Anti AFK",
	Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			task.wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end
})
