local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

_G.SyntaskkSettings = _G.SyntaskkSettings or {
	speed = false,
	dash = false,
	esp = false,
	autoAttack = false
}

local function initializeUI()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	if player:FindFirstChild("PlayerGui"):FindFirstChild("SyntaskkPVP") then
		player.PlayerGui.SyntaskkPVP:Destroy()
	end

	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "SyntaskkPVP"
	gui.ResetOnSpawn = false

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 180, 0, 222)
	main.Position = UDim2.new(0, 10, 0.5, -111)
	main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	main.BorderSizePixel = 0
	main.Active = true
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

	local stroke = Instance.new("UIStroke", main)
	stroke.Color = Color3.fromRGB(100, 100, 255)
	stroke.Thickness = 1.5
	stroke.Transparency = 0.5

	local title = Instance.new("TextLabel", main)
	title.Size = UDim2.new(1, 0, 0, 30)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.Text = "Syntaskk's PVP"
	title.Font = Enum.Font.GothamBold
	title.TextSize = 14
	title.TextColor3 = Color3.fromRGB(150, 150, 255)
	title.BackgroundTransparency = 1

	local speedEnabled = _G.SyntaskkSettings.speed
	local dashEnabled = _G.SyntaskkSettings.dash
	local playerEspEnabled = _G.SyntaskkSettings.esp
	local autoAttackEnabled = _G.SyntaskkSettings.autoAttack
	local autoAttackConnection = nil
	local espTextObjects = {}
	local defaultSpeed = 16
	local customSpeed = 150

	local function createToggle(name, yPos, defaultState, callback)
		local container = Instance.new("Frame", main)
		container.Size = UDim2.new(1, -20, 0, 32)
		container.Position = UDim2.new(0, 10, 0, yPos)
		container.BackgroundTransparency = 1

		local label = Instance.new("TextLabel", container)
		label.Size = UDim2.new(0.65, 0, 1, 0)
		label.Text = name
		label.Font = Enum.Font.Gotham
		label.TextSize = 13
		label.TextColor3 = Color3.new(1, 1, 1)
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.BackgroundTransparency = 1

		local toggleBg = Instance.new("Frame", container)
		toggleBg.Size = UDim2.new(0, 44, 0, 22)
		toggleBg.Position = UDim2.new(1, -44, 0.5, -11)
		toggleBg.BackgroundColor3 = defaultState and Color3.fromRGB(50, 180, 80) or Color3.fromRGB(60, 60, 60)
		Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)

		local toggleCircle = Instance.new("Frame", toggleBg)
		toggleCircle.Size = UDim2.new(0, 18, 0, 18)
		toggleCircle.Position = defaultState and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
		toggleCircle.BackgroundColor3 = defaultState and Color3.new(1, 1, 1) or Color3.fromRGB(180, 180, 180)
		Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0)

		local btn = Instance.new("TextButton", toggleBg)
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.BackgroundTransparency = 1
		btn.Text = ""

		local enabled = defaultState

		btn.MouseButton1Click:Connect(function()
			enabled = not enabled
			if enabled then
				toggleBg.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
				toggleCircle.Position = UDim2.new(1, -20, 0.5, -9)
				toggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
			else
				toggleBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				toggleCircle.Position = UDim2.new(0, 2, 0.5, -9)
				toggleCircle.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
			end
			callback(enabled)
		end)

		if defaultState then
			task.spawn(function()
				callback(true)
			end)
		end

		return btn
	end

	local ijContainer = Instance.new("Frame", main)
	ijContainer.Size = UDim2.new(1, -20, 0, 32)
	ijContainer.Position = UDim2.new(0, 10, 0, 38)
	ijContainer.BackgroundTransparency = 1

	local ijLabel = Instance.new("TextLabel", ijContainer)
	ijLabel.Size = UDim2.new(0.65, 0, 1, 0)
	ijLabel.Text = "Inf Jump"
	ijLabel.Font = Enum.Font.Gotham
	ijLabel.TextSize = 13
	ijLabel.TextColor3 = Color3.new(1, 1, 1)
	ijLabel.TextXAlignment = Enum.TextXAlignment.Left
	ijLabel.BackgroundTransparency = 1

	local ijStatus = Instance.new("TextLabel", ijContainer)
	ijStatus.Size = UDim2.new(0, 44, 0, 22)
	ijStatus.Position = UDim2.new(1, -44, 0.5, -11)
	ijStatus.Text = "ON"
	ijStatus.Font = Enum.Font.GothamBold
	ijStatus.TextSize = 12
	ijStatus.TextColor3 = Color3.new(1, 1, 1)
	ijStatus.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
	Instance.new("UICorner", ijStatus).CornerRadius = UDim.new(1, 0)

	createToggle("Speed", 75, _G.SyntaskkSettings.speed, function(enabled)
		speedEnabled = enabled
		_G.SyntaskkSettings.speed = enabled
		if not enabled then
			local h = player.Character and player.Character:FindFirstChild("Humanoid")
			if h then h.WalkSpeed = defaultSpeed end
		end
	end)

	createToggle("Dash Length", 112, _G.SyntaskkSettings.dash, function(enabled)
		dashEnabled = enabled
		_G.SyntaskkSettings.dash = enabled
		local c = player.Character
		if c then
			if enabled then
				c:SetAttribute("DashLength", 100)
				c:SetAttribute("DashSpeed", 100)
			else
				c:SetAttribute("DashLength", nil)
				c:SetAttribute("DashSpeed", nil)
			end
		end
	end)

	local function setupESP()
		local Camera = workspace.CurrentCamera
		local localPlayer = player

		local function createESPText(character, plr)
			if not character or not character:FindFirstChild("Head") then return end
			
			local nameText = Drawing.new("Text")
			nameText.Visible = false
			nameText.Center = true
			nameText.Outline = true
			nameText.Color = Color3.fromRGB(0, 255, 0)
			nameText.Size = 18
			nameText.Font = 2
			
			local connection
			connection = RunService.RenderStepped:Connect(function()
				if not playerEspEnabled or not character or not character:FindFirstChild("Head") or
				   not character:FindFirstChild("Humanoid") or character.Humanoid.Health <= 0 or
				   not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
					nameText:Remove()
					connection:Disconnect()
					espTextObjects[plr.UserId] = nil
					return
				end
				
				local head = character.Head
				local localHrp = localPlayer.Character.HumanoidRootPart
				local distance = (localHrp.Position - head.Position).Magnitude
				
				local headPos = head.Position + Vector3.new(0, 2, 0)
				local headVector, onScreen = Camera:WorldToViewportPoint(headPos)
				
				if onScreen then
					nameText.Position = Vector2.new(headVector.X, headVector.Y)
					nameText.Text = plr.Name .. " [" .. math.floor(distance) .. "m]"
					nameText.Visible = true
					
					local hp = character.Humanoid.Health / character.Humanoid.MaxHealth
					nameText.Color = hp > 0.4 and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
				else
					nameText.Visible = false
				end
			end)
			
			espTextObjects[plr.UserId] = {connection = connection, nameText = nameText}
		end

		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= localPlayer and plr.Character then
				createESPText(plr.Character, plr)
			end
		end

		Players.PlayerAdded:Connect(function(plr)
			plr.CharacterAdded:Connect(function(c)
				task.wait(0.5)
				if playerEspEnabled then createESPText(c, plr) end
			end)
		end)
	end

	createToggle("Player ESP", 149, _G.SyntaskkSettings.esp, function(enabled)
		playerEspEnabled = enabled
		_G.SyntaskkSettings.esp = enabled
		
		if enabled then
			setupESP()
		else
			for _, data in pairs(espTextObjects) do
				if data.connection then data.connection:Disconnect() end
				if data.nameText then data.nameText:Remove() end
			end
			espTextObjects = {}
		end
	end)

	local function startAutoAttack()
		if autoAttackConnection then
			autoAttackConnection:Disconnect()
			autoAttackConnection = nil
		end
		
		_G.FastAttack = true
		
		local function SafeWaitForChild(parent, childName)
			local success, result = pcall(function()
				return parent:WaitForChild(childName, 5)
			end)
			return success and result or nil
		end
		
		local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
		local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
		local Net = Modules and SafeWaitForChild(Modules, "Net")
		
		local RegisterAttack = Net and SafeWaitForChild(Net, "RE/RegisterAttack")
		local RegisterHit = Net and SafeWaitForChild(Net, "RE/RegisterHit")
		local Enemies = workspace:FindFirstChild("Enemies")
		local Characters = workspace:FindFirstChild("Characters")
		
		local Distance = 100
		
		local function IsAlive(character)
			return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
		end
		
		local function ProcessEnemies(OthersEnemies, Folder)
			if not Folder then return nil end
			local BasePart = nil
			for _, Enemy in Folder:GetChildren() do
				local Head = Enemy:FindFirstChild("Head")
				if Head and IsAlive(Enemy) and player:DistanceFromCharacter(Head.Position) < Distance then
					if Enemy ~= player.Character then
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
			
			local character = player.Character
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
			elseif #OthersEnemies > 0 and RegisterAttack and RegisterHit then
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
				local character = player.Character
				if character and IsAlive(character) then
					local equippedWeapon = character:FindFirstChildOfClass("Tool")
					if not equippedWeapon or (equippedWeapon and equippedWeapon.ToolTip ~= "Gun") then
						AttackNearest()
					end
				end
			end
		end)
	end

	createToggle("Auto Attack", 186, _G.SyntaskkSettings.autoAttack, function(enabled)
		autoAttackEnabled = enabled
		_G.SyntaskkSettings.autoAttack = enabled
		_G.FastAttack = enabled
		
		if enabled then
			startAutoAttack()
		else
			if autoAttackConnection then
				autoAttackConnection:Disconnect()
				autoAttackConnection = nil
			end
		end
	end)

	local jumpConn
	jumpConn = UIS.JumpRequest:Connect(function()
		local c = player.Character
		if c and c:FindFirstChild("Humanoid") then
			c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	local renderConn
	renderConn = RunService.RenderStepped:Connect(function()
		if speedEnabled then
			local h = player.Character and player.Character:FindFirstChild("Humanoid")
			if h then h.WalkSpeed = customSpeed end
		end
		if dashEnabled then
			local c = player.Character
			if c then
				c:SetAttribute("DashLength", 150)
				c:SetAttribute("DashSpeed", 150)
			end
		end
	end)

	humanoid.Died:Connect(function()
		for _, data in pairs(espTextObjects) do
			if data.connection then data.connection:Disconnect() end
			if data.nameText then data.nameText:Remove() end
		end
		espTextObjects = {}
		
		if autoAttackConnection then
			autoAttackConnection:Disconnect()
			autoAttackConnection = nil
		end
	end)

	gui.Destroying:Connect(function()
		if renderConn then renderConn:Disconnect() end
		if jumpConn then jumpConn:Disconnect() end
		if autoAttackConnection then autoAttackConnection:Disconnect() end
		for _, data in pairs(espTextObjects) do
			if data.connection then data.connection:Disconnect() end
			if data.nameText then data.nameText:Remove() end
		end
	end)

	local dragging, dragStart, startPos
	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	main.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

player.CharacterAdded:Connect(function()
	wait(0.5)
	initializeUI()
end)

initializeUI()
