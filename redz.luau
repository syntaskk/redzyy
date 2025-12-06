local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Auto Attack Fonksiyonları
local autoAttackEnabled = false
local autoAttackConnection = nil

local function initializeAutoGUI()
	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "AutoGUI"
	gui.ResetOnSpawn = false

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 220, 0, 120)
	main.Position = UDim2.new(0.5, -110, 0.5, -60)
	main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

	local title = Instance.new("TextLabel", main)
	title.Size = UDim2.new(1, -60, 0, 30)
	title.Position = UDim2.new(0, 10, 0, 5)
	title.Text = "Auto Syntaskk"
	title.Font = Enum.Font.GothamBold
	title.TextSize = 18
	title.TextColor3 = Color3.new(1, 1, 1)
	title.BackgroundTransparency = 1
	title.TextXAlignment = Enum.TextXAlignment.Left

	local closeBtn = Instance.new("TextButton", main)
	closeBtn.Size = UDim2.new(0, 25, 0, 25)
	closeBtn.Position = UDim2.new(1, -30, 0, 5)
	closeBtn.Text = "X"
	closeBtn.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

	local aaLabel = Instance.new("TextLabel", main)
	aaLabel.Size = UDim2.new(1, -20, 0, 30)
	aaLabel.Position = UDim2.new(0, 10, 0, 40)
	aaLabel.Text = "Auto Attack:"
	aaLabel.TextColor3 = Color3.new(1, 1, 1)
	aaLabel.BackgroundTransparency = 1
	aaLabel.Font = Enum.Font.Gotham
	aaLabel.TextSize = 16
	aaLabel.TextXAlignment = Enum.TextXAlignment.Left

	local aaOff = Instance.new("TextButton", main)
	aaOff.Size = UDim2.new(0, 80, 0, 35)
	aaOff.Position = UDim2.new(0, 20, 0, 75)
	aaOff.Text = "KAPAT"
	aaOff.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	aaOff.TextColor3 = Color3.new(1, 1, 1)
	aaOff.Font = Enum.Font.GothamBold
	aaOff.TextSize = 14
	Instance.new("UICorner", aaOff).CornerRadius = UDim.new(0, 6)

	local aaOn = Instance.new("TextButton", main)
	aaOn.Size = UDim2.new(0, 80, 0, 35)
	aaOn.Position = UDim2.new(1, -100, 0, 75)
	aaOn.Text = "AÇ"
	aaOn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	aaOn.TextColor3 = Color3.new(1, 1, 1)
	aaOn.Font = Enum.Font.GothamBold
	aaOn.TextSize = 14
	Instance.new("UICorner", aaOn).CornerRadius = UDim.new(0, 6)

	-- Auto Attack Fonksiyonu
	local function startAutoAttack()
		if autoAttackConnection then
			autoAttackConnection:Disconnect()
			autoAttackConnection = nil
		end
		
		_G.FastAttack = true
		
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Players = game:GetService("Players")
		local Player = Players.LocalPlayer
		
		local function SafeWaitForChild(parent, childName)
			local success, result = pcall(function()
				return parent:WaitForChild(childName, 5)
			end)
			return success and result or nil
		end
		
		local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
		if not Remotes then return end
		
		local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
		local Net = Modules and SafeWaitForChild(Modules, "Net")
		
		if not Net then return end
		
		local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
		local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")
		local Enemies = workspace:FindFirstChild("Enemies")
		local Characters = workspace:FindFirstChild("Characters")
		
		if not RegisterAttack or not RegisterHit then return end
		
		local Distance = 100
		
		local function IsAlive(character)
			return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
		end
		
		local function ProcessEnemies(OthersEnemies, Folder)
			if not Folder then return nil end
			local BasePart = nil
			for _, Enemy in Folder:GetChildren() do
				local Head = Enemy:FindFirstChild("Head")
				if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < Distance then
					if Enemy ~= Player.Character then
						table.insert(OthersEnemies, { Enemy, Head })
						BasePart = Head
					end
				end
			end
			return BasePart
		end
		
		local function AttackNearest()
			if not autoAttackEnabled then return end
			
			local OthersEnemies = {}
			local Part1 = ProcessEnemies(OthersEnemies, Enemies)
			local Part2 = ProcessEnemies(OthersEnemies, Characters)
			
			local character = Player.Character
			if not character then return end
			local equippedWeapon = character:FindFirstChildOfClass("Tool")
			
			if equippedWeapon and equippedWeapon:FindFirstChild("LeftClickRemote") then
				for _, enemyData in ipairs(OthersEnemies) do
					local enemy = enemyData[1]
					if enemy and enemy:FindFirstChild("HumanoidRootPart") then
						local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
						pcall(function()
							equippedWeapon.LeftClickRemote:FireServer(direction, 1)
						end)
					end
				end
			elseif #OthersEnemies > 0 then
				local BasePart = Part1 or Part2
				if BasePart then
					pcall(function()
						RegisterAttack:FireServer(0)
						RegisterHit:FireServer(BasePart, OthersEnemies)
					end)
				end
			end
		end
		
		autoAttackConnection = RunService.RenderStepped:Connect(function()
			if autoAttackEnabled then
				local character = Player.Character
				if character and IsAlive(character) then
					local equippedWeapon = character:FindFirstChildOfClass("Tool")
					if equippedWeapon and equippedWeapon.ToolTip ~= "Gun" then
						AttackNearest()
					end
				end
			end
		end)
	end

	-- Buton Etkileşimleri
	aaOn.MouseButton1Click:Connect(function()
		if not autoAttackEnabled then
			autoAttackEnabled = true
			aaOn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
			aaOff.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			startAutoAttack()
		end
	end)

	aaOff.MouseButton1Click:Connect(function()
		if autoAttackEnabled then
			autoAttackEnabled = false
			aaOff.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			aaOn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			
			_G.FastAttack = false
			if autoAttackConnection then
				autoAttackConnection:Disconnect()
				autoAttackConnection = nil
			end
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		-- Auto Attack'ı kapat
		autoAttackEnabled = false
		_G.FastAttack = false
		if autoAttackConnection then
			autoAttackConnection:Disconnect()
			autoAttackConnection = nil
		end
		gui:Destroy()
	end)

	-- Karakter öldüğünde auto attack'ı kapat
	player.CharacterAdded:Connect(function()
		if player.Character then
			player.Character:WaitForChild("Humanoid").Died:Connect(function()
				autoAttackEnabled = false
				_G.FastAttack = false
				if autoAttackConnection then
					autoAttackConnection:Disconnect()
					autoAttackConnection = nil
				end
			end)
		end
	end)

	-- GUI yok edildiğinde temizle
	gui.Destroying:Connect(function()
		autoAttackEnabled = false
		_G.FastAttack = false
		if autoAttackConnection then
			autoAttackConnection:Disconnect()
			autoAttackConnection = nil
		end
	end)
end

-- Karakter eklendiğinde GUI'yi başlat
player.CharacterAdded:Connect(function()
	wait(0.5)
	if player:FindFirstChild("PlayerGui"):FindFirstChild("AutoGUI") then
		player.PlayerGui.AutoGUI:Destroy()
	end
	wait(0.1)
	initializeAutoGUI()
end)

-- İlk Yüklenme
wait(1)
initializeAutoGUI()


loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/20f318386e3fbf069ee3fa797cfc9f34.lua"))()
