--// Servisler
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

-- Anti-AFK
player.Idled:connect(function()
	VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Global değişkenler
local guiInitialized = false

local speedEnabled = false
local speedValue = 100
local infiniteJump = false
local dashEnabled = false
local noClipEnabled = false

local playerEspEnabled = false
local fruitEspEnabled = false
local chestEspEnabled = false
local islandEspEnabled = false

local autoCollectEnabled = false
local autoStoreEnabled = false
local autoRollEnabled = false
local autoChestEnabled = false

local fastAttackEnabled = false

local currentChestTween = nil
local currentTeleportTween = nil

-- Auto Chest Variables (FROM PROVIDED CODE)
local ChestModels = workspace:WaitForChild("ChestModels")
local Map = workspace:WaitForChild("Map")
local MOVEMENT_SPEED = 350
local CHEST_TOUCH_DISTANCE = 1
local ISLAND_TOUCH_DISTANCE = 10
local WAIT_AT_CHEST = 0.2
local WAIT_AT_ISLAND = 1.5
local CHECK_INTERVAL = 0.5
local CHEST_TYPES = {"Chest1", "Chest2", "Chest3"}

local visitedChests = {}
local visitedIslands = {}
local currentTarget = nil
local isTweening = false
local loopRunning = false

-- Sea Detection
local Sea1 = false
local Sea2 = false
local Sea3 = false

if game.PlaceId == 2753915549 then
    Sea1 = true
elseif game.PlaceId == 4442272183 then
    Sea2 = true
elseif game.PlaceId == 7449423635 then
    Sea3 = true
end

-- ESP Objects
local playerEspObjects = {}
local fruitEspObjects = {}
local chestEspObjects = {}
local islandEspObjects = {}

-- Connections
local connections = {}

-- CommF_ Remote
local CommF_ = nil
pcall(function()
	CommF_ = ReplicatedStorage:WaitForChild("Remotes", 10):WaitForChild("CommF_", 10)
end)

-- ==========================================
-- FAST ATTACK (FROM PROVIDED CODE)
-- ==========================================

_G.FastAttack = false

local FastAttackModule = nil

local function InitializeFastAttack()
    local _ENV = (getgenv or getrenv or getfenv)()

    local function SafeWaitForChild(parent, childName)
        local success, result = pcall(function()
            return parent:WaitForChild(childName)
        end)
        if not success or not result then
            warn("Could not find: " .. childName)
        end
        return result
    end

    local VirtualInputManager = game:GetService("VirtualInputManager")
    local CollectionService = game:GetService("CollectionService")

    local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
    if not Remotes then return end

    local Validator = SafeWaitForChild(Remotes, "Validator")
    local CommF = SafeWaitForChild(Remotes, "CommF_")
    local CommE = SafeWaitForChild(Remotes, "CommE")

    local Characters = SafeWaitForChild(workspace, "Characters")
    local Enemies = SafeWaitForChild(workspace, "Enemies")

    local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
    local Net = SafeWaitForChild(Modules, "Net")

    local Settings = {
        AutoClick = false,
        ClickDelay = 0
    }

    local FastAttack = {
        Distance = 100,
        attackMobs = true,
        attackPlayers = true,
        Equipped = nil
    }

    local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
    local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

    local function IsAlive(character)
        return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
    end

    local function ProcessEnemies(OthersEnemies, Folder)
        local BasePart = nil
        for _, Enemy in Folder:GetChildren() do
            local Head = Enemy:FindFirstChild("Head")
            if Head and IsAlive(Enemy) and player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                if Enemy ~= player.Character then
                    table.insert(OthersEnemies, { Enemy, Head })
                    BasePart = Head
                end
            end
        end
        return BasePart
    end

    function FastAttack:Attack(BasePart, OthersEnemies)
        if not BasePart or #OthersEnemies == 0 then return end
        RegisterAttack:FireServer(Settings.ClickDelay or 0)
        RegisterHit:FireServer(BasePart, OthersEnemies)
    end

    function FastAttack:AttackNearest()
        local OthersEnemies = {}
        local Part1 = ProcessEnemies(OthersEnemies, Enemies)
        local Part2 = ProcessEnemies(OthersEnemies, Characters)

        local character = player.Character
        if not character then return end
        local equippedWeapon = character:FindFirstChildOfClass("Tool")

        if equippedWeapon and equippedWeapon:FindFirstChild("LeftClickRemote") then
            for _, enemyData in ipairs(OthersEnemies) do
                local enemy = enemyData[1]
                local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
                pcall(function()
                    equippedWeapon.LeftClickRemote:FireServer(direction, 1)
                end)
            end
        elseif #OthersEnemies > 0 then
            self:Attack(Part1 or Part2, OthersEnemies)
        else
            task.wait(0)
        end
    end

    function FastAttack:BladeHits()
        local Equipped = IsAlive(player.Character) and player.Character:FindFirstChildOfClass("Tool")
        if Equipped and Equipped.ToolTip ~= "Gun" then
            self:AttackNearest()
        else
            task.wait(0)
        end
    end

    function FastAttack:Start()
        Settings.AutoClick = true
    end

    function FastAttack:Stop()
        Settings.AutoClick = false
    end

    task.spawn(function()
        while task.wait(Settings.ClickDelay) do
            if Settings.AutoClick and _G.FastAttack then
                FastAttack:BladeHits()
            end
        end
    end)

    FastAttackModule = FastAttack
end

pcall(InitializeFastAttack)

-- ==========================================
-- TELEPORT FUNCTIONS
-- ==========================================

local function BTP(P1)
	repeat wait()
		game.Players.LocalPlayer.Character.Head:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
		task.wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P1
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
	until (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end

local function topos(targetCFrame)
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	
	local distance = (hrp.Position - targetCFrame.Position).Magnitude
	
	if distance < 250 then
		hrp.CFrame = targetCFrame
	elseif distance < 2000 then
		local tweenTime = distance / 350
		local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear)
		local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
		tween:Play()
		currentTeleportTween = tween
	else
		BTP(targetCFrame)
	end
end

-- ==========================================
-- FRUIT FUNCTIONS
-- ==========================================

local function isValidFruit(obj)
	if not obj or not obj.Parent then return false end
	if not obj:IsA("Tool") then return false end
	if not string.find(obj.Name, "Fruit", 1, true) then return false end
	if not obj:FindFirstChild("Handle") then return false end
	local parent = obj.Parent
	if parent:IsA("Backpack") or parent:FindFirstChild("Humanoid") then return false end
	return true
end

-- ==========================================
-- CHEST FUNCTIONS (FROM PROVIDED CODE)
-- ==========================================

local function calculateDuration(startPos, endPos)
    local distance = (endPos - startPos).Magnitude
    return distance / MOVEMENT_SPEED
end

local function disableCollision(model)
    pcall(function()
        for _, part in pairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function getDistanceTo(targetPos)
	local char = player.Character
	if not char then return math.huge end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return math.huge end
	return (targetPos - hrp.Position).Magnitude
end

local function isValidChest(obj)
    if not obj or not obj:IsA("Model") or not obj.Parent then return false end
    for _, chestType in ipairs(CHEST_TYPES) do
        if obj.Name == chestType then
            return true
        end
    end
    return false
end

local function isValidIsland(obj)
    return obj and obj:IsA("Model") and obj.Parent == Map
end

local function hasUnvisitedChest()
    for _, chest in pairs(ChestModels:GetChildren()) do
        if isValidChest(chest) and not visitedChests[chest] then
            return true
        end
    end
    return false
end

local function findNearestChest()
    local nearestChest = nil
    local nearestDistance = math.huge
    
    for _, chest in pairs(ChestModels:GetChildren()) do
        if isValidChest(chest) and not visitedChests[chest] then
            local distance = getDistanceTo(chest:GetPivot().Position)
            if distance < nearestDistance then
                nearestDistance = distance
                nearestChest = chest
            end
        end
    end
    
    return nearestChest, nearestDistance
end

local function getRandomIslandPartPosition(island)
    local parts = {}
    
    for _, obj in pairs(island:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Size.Magnitude > 5 then
            table.insert(parts, obj)
        end
    end
    
    if #parts > 0 then
        local randomPart = parts[math.random(1, #parts)]
        return randomPart.Position + Vector3.new(0, randomPart.Size.Y/2 + 3, 0)
    else
        return island:GetPivot().Position
    end
end

local function findNearestIsland()
    local nearestIsland = nil
    local nearestDistance = math.huge
    
    for _, island in pairs(Map:GetChildren()) do
        if isValidIsland(island) and not visitedIslands[island] then
            local distance = getDistanceTo(island:GetPivot().Position)
            if distance < nearestDistance then
                nearestDistance = distance
                nearestIsland = island
            end
        end
    end
    
    return nearestIsland
end

local function getChestTouchPosition(chest)
    local success, result = pcall(function()
        local chestPrimaryPart = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
        if chestPrimaryPart then
            return chestPrimaryPart.Position
        end
        return chest:GetPivot().Position
    end)
    
    if success then
        return result
    else
        return chest:GetPivot().Position
    end
end

local function isActuallyTouchingChest(chest)
	local char = player.Character
	if not char or not chest or not chest.Parent then return false end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return false end
    
    local success, result = pcall(function()
        for _, characterPart in pairs(char:GetDescendants()) do
            if characterPart:IsA("BasePart") then
                for _, chestPart in pairs(chest:GetDescendants()) do
                    if chestPart:IsA("BasePart") then
                        local distance = (characterPart.Position - chestPart.Position).Magnitude
                        local combinedSize = (characterPart.Size.Magnitude + chestPart.Size.Magnitude) / 2
                        
                        if distance <= combinedSize + 1.5 then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end)
    
    return success and result
end

local function stopCurrentTween()
    isTweening = false
    if currentChestTween then
        pcall(function()
            currentChestTween:Cancel()
        end)
        currentChestTween = nil
    end
end

local function flyToTarget(targetPos, touchDistance, isChest, targetObject, onCollected)
	local char = player.Character
	if not char then return false end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChild("Humanoid")
	if not hrp or not hum or not autoChestEnabled then return false end
    if not targetObject or not targetObject.Parent then return false end
    
    currentTarget = targetObject
    
    local startPosition = hrp.CFrame.Position
    local duration = calculateDuration(startPosition, targetPos)
    
    if hum then
        hum.PlatformStand = true
    end
    
    local tweenInfo = TweenInfo.new(
        duration,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        0,
        false,
        0
    )
    
    local targetCFrame = CFrame.new(targetPos)
    
    currentChestTween = TweenService:Create(
        hrp,
        tweenInfo,
        {CFrame = targetCFrame}
    )
    
    isTweening = true
    currentChestTween:Play()
    
    local tweenCompleted = false
    local collected = false
    local lastCheckTime = tick()
    
    local connection
    connection = currentChestTween.Completed:Connect(function(playbackState)
        tweenCompleted = true
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end)
    
    local heartbeatConnection
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if not autoChestEnabled or not isTweening then
            tweenCompleted = true
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            return
        end
        
        if not targetObject or not targetObject.Parent then
            tweenCompleted = true
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            return
        end
        
        if isChest then
            if tick() - lastCheckTime > CHECK_INTERVAL then
                lastCheckTime = tick()
                
                local nearestChest, nearestDistance = findNearestChest()
                
                if nearestChest and nearestChest ~= targetObject then
                    local currentDistance = getDistanceTo(getChestTouchPosition(targetObject))
                    
                    if nearestDistance < currentDistance - 30 then
                        tweenCompleted = true
                        if heartbeatConnection then
                            heartbeatConnection:Disconnect()
                            heartbeatConnection = nil
                        end
                        return
                    end
                end
            end
            
            if isActuallyTouchingChest(targetObject) and not collected then
                collected = true
                if onCollected then
                    pcall(onCollected)
                end
            end
        else
            local distance = getDistanceTo(targetPos)
            if distance <= touchDistance and not collected then
                collected = true
                if onCollected then
                    pcall(onCollected)
                end
            end
        end
    end)
    
    local startTime = tick()
    local maxWaitTime = duration + 5
    
    while not tweenCompleted and autoChestEnabled and isTweening do
        task.wait(0.1)
        
        if tick() - startTime > maxWaitTime then
            tweenCompleted = true
            break
        end
        
        if not targetObject or not targetObject.Parent then
            tweenCompleted = true
            break
        end
    end
    
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
    
    if autoChestEnabled and not collected and targetObject and targetObject.Parent then
        if isChest and isActuallyTouchingChest(targetObject) and onCollected then
            pcall(onCollected)
            collected = true
        elseif not isChest then
            local finalDistance = getDistanceTo(targetPos)
            if finalDistance <= touchDistance and onCollected then
                pcall(onCollected)
                collected = true
            end
        end
    end
    
    isTweening = false
    
    return collected
end

local function goToChest(chest)
    if not chest or not chest.Parent or visitedChests[chest] then return false end
    
    disableCollision(chest)
    
    local chestPos = getChestTouchPosition(chest)
    
    local collected = flyToTarget(
        chestPos,
        CHEST_TOUCH_DISTANCE,
        true,
        chest,
        function()
            visitedChests[chest] = true
        end
    )
    
    if collected then
        task.wait(WAIT_AT_CHEST)
    end
    
    currentTarget = nil
    
    return collected
end

local function goToIsland(island)
    if not island or not island.Parent or visitedIslands[island] then return false end
    
    local targetPos = getRandomIslandPartPosition(island)
    
    flyToTarget(
        targetPos,
        ISLAND_TOUCH_DISTANCE,
        false,
        island,
        function()
            visitedIslands[island] = true
        end
    )
    
    task.wait(WAIT_AT_ISLAND)
    
    currentTarget = nil
    
    return true
end

local function mainLoop()
    loopRunning = true
    
    while autoChestEnabled and loopRunning do
        local success = pcall(function()
            if hasUnvisitedChest() then
                local chest = findNearestChest()
                if chest and chest.Parent then
                    goToChest(chest)
                end
            else
                local island = findNearestIsland()
                if island and island.Parent then
                    goToIsland(island)
                else
                    task.wait(1)
                end
            end
        end)
        
        if not success then
            currentTarget = nil
            stopCurrentTween()
            task.wait(0.5)
        end
        
        task.wait(0.1)
    end
    
    loopRunning = false
    
	local char = player.Character
	if char then
		local hum = char:FindFirstChild("Humanoid")
		if hum then
			hum.PlatformStand = false
		end
	end
    currentTarget = nil
    stopCurrentTween()
end

ChestModels.ChildAdded:Connect(function(chest)
    task.wait(0.1)
    if isValidChest(chest) and autoChestEnabled then
        if isTweening and currentTarget then
            local newDistance = getDistanceTo(getChestTouchPosition(chest))
            local currentDistance = getDistanceTo(getChestTouchPosition(currentTarget))
            
            if newDistance < currentDistance - 20 then
                stopCurrentTween()
                currentTarget = nil
            end
        end
    end
end)

-- ==========================================
-- UI INITIALIZATION
-- ==========================================

local function initializeUI()
	if guiInitialized then return end
	guiInitialized = true
	
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "SyntaskkHubUI"
	gui.ResetOnSpawn = false

	-- Ana Frame
	local main = Instance.new("Frame", gui)
	main.Name = "MainFrame"
	main.Size = UDim2.new(0, 550, 0, 400)
	main.Position = UDim2.new(0.5, -275, 0.5, -200)
	main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
	main.Active = true
	main.BorderSizePixel = 0
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

	local mainStroke = Instance.new("UIStroke", main)
	mainStroke.Color = Color3.fromRGB(100, 50, 150)
	mainStroke.Thickness = 2
	mainStroke.Transparency = 0.3

	local gradient = Instance.new("UIGradient", main)
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 20, 40)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
	})
	gradient.Rotation = 45

	-- Title Bar
	local titleBar = Instance.new("Frame", main)
	titleBar.Size = UDim2.new(1, 0, 0, 50)
	titleBar.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
	titleBar.BorderSizePixel = 0
	Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

	local titleFix = Instance.new("Frame", titleBar)
	titleFix.Size = UDim2.new(1, 0, 0, 20)
	titleFix.Position = UDim2.new(0, 0, 1, -20)
	titleFix.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
	titleFix.BorderSizePixel = 0

	local logoFrame = Instance.new("Frame", titleBar)
	logoFrame.Size = UDim2.new(0, 35, 0, 35)
	logoFrame.Position = UDim2.new(0, 10, 0.5, -17)
	logoFrame.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
	Instance.new("UICorner", logoFrame).CornerRadius = UDim.new(0, 8)

	local logoText = Instance.new("TextLabel", logoFrame)
	logoText.Size = UDim2.new(1, 0, 1, 0)
	logoText.Text = "S"
	logoText.Font = Enum.Font.GothamBlack
	logoText.TextSize = 20
	logoText.TextColor3 = Color3.new(1, 1, 1)
	logoText.BackgroundTransparency = 1

	local title = Instance.new("TextLabel", titleBar)
	title.Size = UDim2.new(1, -120, 1, 0)
	title.Position = UDim2.new(0, 55, 0, 0)
	title.Text = "Syntaskk Hub"
	title.Font = Enum.Font.GothamBlack
	title.TextSize = 22
	title.TextColor3 = Color3.fromRGB(200, 150, 255)
	title.BackgroundTransparency = 1
	title.TextXAlignment = Enum.TextXAlignment.Left

	local versionTag = Instance.new("TextLabel", titleBar)
	versionTag.Size = UDim2.new(0, 50, 0, 20)
	versionTag.Position = UDim2.new(0, 180, 0.5, -10)
	versionTag.Text = "v1"
	versionTag.Font = Enum.Font.Gotham
	versionTag.TextSize = 12
	versionTag.TextColor3 = Color3.fromRGB(100, 200, 150)
	versionTag.BackgroundColor3 = Color3.fromRGB(30, 60, 40)
	versionTag.BackgroundTransparency = 0.5
	Instance.new("UICorner", versionTag).CornerRadius = UDim.new(0, 6)

	local closeBtn = Instance.new("TextButton", titleBar)
	closeBtn.Size = UDim2.new(0, 35, 0, 35)
	closeBtn.Position = UDim2.new(1, -45, 0.5, -17)
	closeBtn.Text = "✕"
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 16
	closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	closeBtn.BorderSizePixel = 0
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

	local minimizeBtn = Instance.new("TextButton", titleBar)
	minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
	minimizeBtn.Position = UDim2.new(1, -85, 0.5, -17)
	minimizeBtn.Text = "─"
	minimizeBtn.Font = Enum.Font.GothamBold
	minimizeBtn.TextSize = 16
	minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 60, 120)
	minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
	minimizeBtn.BorderSizePixel = 0
	Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

	-- Mini Box
	local miniBox = Instance.new("TextButton", gui)
	miniBox.Size = UDim2.new(0, 70, 0, 70)
	miniBox.Position = UDim2.new(0, 20, 0.5, -35)
	miniBox.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
	miniBox.Text = "S"
	miniBox.TextColor3 = Color3.new(1, 1, 1)
	miniBox.Font = Enum.Font.GothamBlack
	miniBox.TextSize = 28
	miniBox.Visible = false
	miniBox.Active = true
	miniBox.BorderSizePixel = 0
	Instance.new("UICorner", miniBox).CornerRadius = UDim.new(0, 16)
	Instance.new("UIStroke", miniBox).Color = Color3.fromRGB(200, 150, 255)

	-- Sidebar
	local sidebar = Instance.new("Frame", main)
	sidebar.Size = UDim2.new(0, 130, 1, -60)
	sidebar.Position = UDim2.new(0, 5, 0, 55)
	sidebar.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
	sidebar.BorderSizePixel = 0
	Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

	local sidebarLayout = Instance.new("UIListLayout", sidebar)
	sidebarLayout.Padding = UDim.new(0, 5)
	sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
	Instance.new("UIPadding", sidebar).PaddingTop = UDim.new(0, 8)

	local function createSidebarButton(name, icon, order)
		local btn = Instance.new("TextButton", sidebar)
		btn.Name = name .. "Btn"
		btn.Size = UDim2.new(0.9, 0, 0, 38)
		btn.Text = icon .. " " .. name
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 12
		btn.TextColor3 = Color3.fromRGB(180, 180, 200)
		btn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
		btn.BorderSizePixel = 0
		btn.LayoutOrder = order
		btn.TextXAlignment = Enum.TextXAlignment.Left
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
		Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0, 10)
		return btn
	end

	local playerBtn = createSidebarButton("Player", "👤", 1)
	local espBtn = createSidebarButton("ESP", "👁️", 2)
	local fruitBtn = createSidebarButton("Devil Fruit", "🍎", 3)
	local combatBtn = createSidebarButton("Combat", "⚔️", 4)
	local teleportBtn = createSidebarButton("Teleport", "🌍", 5)
	local miscBtn = createSidebarButton("Misc", "⚙️", 6)

	-- Content Area
	local contentArea = Instance.new("Frame", main)
	contentArea.Size = UDim2.new(1, -150, 1, -65)
	contentArea.Position = UDim2.new(0, 145, 0, 55)
	contentArea.BackgroundColor3 = Color3.fromRGB(25, 22, 38)
	contentArea.BorderSizePixel = 0
	Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 12)

	local function createPage(name)
		local page = Instance.new("ScrollingFrame", contentArea)
		page.Name = name .. "Page"
		page.Size = UDim2.new(1, -10, 1, -10)
		page.Position = UDim2.new(0, 5, 0, 5)
		page.BackgroundTransparency = 1
		page.Visible = false
		page.ScrollBarThickness = 4
		page.ScrollBarImageColor3 = Color3.fromRGB(100, 50, 150)
		page.CanvasSize = UDim2.new(0, 0, 0, 0)
		page.AutomaticCanvasSize = Enum.AutomaticSize.Y
		
		local layout = Instance.new("UIListLayout", page)
		layout.Padding = UDim.new(0, 8)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		Instance.new("UIPadding", page).PaddingTop = UDim.new(0, 5)
		return page
	end

	local function createToggle(parent, text, order, currentState)
		local container = Instance.new("Frame", parent)
		container.Size = UDim2.new(1, -10, 0, 45)
		container.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
		container.BorderSizePixel = 0
		container.LayoutOrder = order
		Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

		local label = Instance.new("TextLabel", container)
		label.Size = UDim2.new(0.65, 0, 1, 0)
		label.Position = UDim2.new(0, 15, 0, 0)
		label.Text = text
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.TextColor3 = Color3.fromRGB(200, 200, 220)
		label.BackgroundTransparency = 1
		label.TextXAlignment = Enum.TextXAlignment.Left

		local toggleBG = Instance.new("Frame", container)
		toggleBG.Size = UDim2.new(0, 50, 0, 25)
		toggleBG.Position = UDim2.new(1, -65, 0.5, -12)
		toggleBG.BackgroundColor3 = currentState and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		Instance.new("UICorner", toggleBG).CornerRadius = UDim.new(1, 0)

		local toggleCircle = Instance.new("Frame", toggleBG)
		toggleCircle.Size = UDim2.new(0, 19, 0, 19)
		toggleCircle.Position = currentState and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		toggleCircle.BackgroundColor3 = Color3.new(1, 1, 1)
		Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0)

		local toggleBtn = Instance.new("TextButton", toggleBG)
		toggleBtn.Size = UDim2.new(1, 0, 1, 0)
		toggleBtn.BackgroundTransparency = 1
		toggleBtn.Text = ""

		return toggleBtn, toggleBG, toggleCircle, container
	end

	local function createSlider(parent, text, order, minVal, maxVal, currentVal, callback)
		local container = Instance.new("Frame", parent)
		container.Size = UDim2.new(1, -10, 0, 60)
		container.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
		container.BorderSizePixel = 0
		container.LayoutOrder = order
		Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

		local label = Instance.new("TextLabel", container)
		label.Size = UDim2.new(1, -20, 0, 22)
		label.Position = UDim2.new(0, 10, 0, 5)
		label.Text = text .. ": " .. currentVal
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.TextColor3 = Color3.fromRGB(200, 200, 220)
		label.BackgroundTransparency = 1
		label.TextXAlignment = Enum.TextXAlignment.Left

		local sliderBG = Instance.new("Frame", container)
		sliderBG.Size = UDim2.new(1, -30, 0, 10)
		sliderBG.Position = UDim2.new(0, 15, 0, 35)
		sliderBG.BackgroundColor3 = Color3.fromRGB(50, 45, 65)
		Instance.new("UICorner", sliderBG).CornerRadius = UDim.new(1, 0)

		local initialPercent = (currentVal - minVal) / (maxVal - minVal)
		
		local sliderFill = Instance.new("Frame", sliderBG)
		sliderFill.Size = UDim2.new(initialPercent, 0, 1, 0)
		sliderFill.BackgroundColor3 = Color3.fromRGB(130, 80, 200)
		Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)

		local knob = Instance.new("Frame", sliderBG)
		knob.Size = UDim2.new(0, 16, 0, 16)
		knob.Position = UDim2.new(initialPercent, -8, 0.5, -8)
		knob.BackgroundColor3 = Color3.new(1, 1, 1)
		Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

		local dragging = false

		local function updateSlider(x)
			local relX = math.clamp(x - sliderBG.AbsolutePosition.X, 0, sliderBG.AbsoluteSize.X)
			local percent = relX / sliderBG.AbsoluteSize.X
			local value = math.floor(minVal + (maxVal - minVal) * percent)
			sliderFill.Size = UDim2.new(percent, 0, 1, 0)
			knob.Position = UDim2.new(percent, -8, 0.5, -8)
			label.Text = text .. ": " .. value
			if callback then callback(value) end
		end

		sliderBG.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				updateSlider(input.Position.X)
			end
		end)

		knob.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
			end
		end)

		UIS.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				updateSlider(input.Position.X)
			end
		end)

		return container, label
	end

	local function createButton(parent, text, order, callback)
		local btn = Instance.new("TextButton", parent)
		btn.Size = UDim2.new(1, -10, 0, 40)
		btn.BackgroundColor3 = Color3.fromRGB(80, 60, 120)
		btn.Text = text
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 14
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.BorderSizePixel = 0
		btn.LayoutOrder = order
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
		btn.MouseButton1Click:Connect(callback)
		return btn
	end

	-- Pages
	local playerPage = createPage("Player")
	playerPage.Visible = true
	local espPage = createPage("ESP")
	local fruitPage = createPage("Fruit")
	local combatPage = createPage("Combat")
	local teleportPage = createPage("Teleport")
	local miscPage = createPage("Misc")

	-- ==========================================
	-- PLAYER PAGE
	-- ==========================================
	
createSlider(playerPage, "Walk Speed", 1, 1, 250, speedValue, function(val)
	speedValue = val
end) 

	local speedToggle, speedToggleBG, speedToggleCircle = createToggle(playerPage, "Enable Speed Hack", 2, speedEnabled)
	speedToggle.MouseButton1Click:Connect(function()
		speedEnabled = not speedEnabled
		TweenService:Create(speedToggleCircle, TweenInfo.new(0.2), {
			Position = speedEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(speedToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = speedEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
	end)

	local ijToggle, ijToggleBG, ijToggleCircle = createToggle(playerPage, "Infinite Jump", 3, infiniteJump)
	ijToggle.MouseButton1Click:Connect(function()
		infiniteJump = not infiniteJump
		TweenService:Create(ijToggleCircle, TweenInfo.new(0.2), {
			Position = infiniteJump and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(ijToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = infiniteJump and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
	end)

	local dashToggle, dashToggleBG, dashToggleCircle = createToggle(playerPage, "Extended Dash", 4, dashEnabled)
	dashToggle.MouseButton1Click:Connect(function()
		dashEnabled = not dashEnabled
		TweenService:Create(dashToggleCircle, TweenInfo.new(0.2), {
			Position = dashEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(dashToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = dashEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
	end)

	local noClipToggle, noClipToggleBG, noClipToggleCircle = createToggle(playerPage, "No Clip", 5, noClipEnabled)
	noClipToggle.MouseButton1Click:Connect(function()
		noClipEnabled = not noClipEnabled
		TweenService:Create(noClipToggleCircle, TweenInfo.new(0.2), {
			Position = noClipEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(noClipToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = noClipEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
	end)

	-- ==========================================
	-- ESP PAGE
	-- ==========================================

	local playerEspToggle, playerEspToggleBG, playerEspToggleCircle = createToggle(espPage, "Player ESP", 1, playerEspEnabled)
	playerEspToggle.MouseButton1Click:Connect(function()
		playerEspEnabled = not playerEspEnabled
		TweenService:Create(playerEspToggleCircle, TweenInfo.new(0.2), {
			Position = playerEspEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(playerEspToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = playerEspEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()

		if playerEspEnabled then
			connections.playerEspUpdate = RunService.Heartbeat:Connect(function()
				if not playerEspEnabled then return end
				local localChar = player.Character
				local localHrp = localChar and localChar:FindFirstChild("HumanoidRootPart")
				if not localHrp then return end

				for _, plr in pairs(Players:GetPlayers()) do
					if plr ~= player then
						if not playerEspObjects[plr.UserId] then
							local nameText = Drawing.new("Text")
							nameText.Visible = false
							nameText.Center = true
							nameText.Outline = true
							nameText.Size = 18
							nameText.Font = 2
							playerEspObjects[plr.UserId] = nameText
						end
						
						local nameText = playerEspObjects[plr.UserId]
						local char = plr.Character
						
						if char then
							local head = char:FindFirstChild("Head")
							local hrp = char:FindFirstChild("HumanoidRootPart")
							local hum = char:FindFirstChild("Humanoid")

							if head and hrp and hum and hum.Health > 0 then
								local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 2, 0))
								if onScreen then
									local dist = (localHrp.Position - hrp.Position).Magnitude
									nameText.Position = Vector2.new(pos.X, pos.Y)
									nameText.Text = plr.Name .. " [" .. math.floor(dist) .. "m]"
									nameText.Color = hum.Health / hum.MaxHealth > 0.4 and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
									nameText.Visible = true
								else
									nameText.Visible = false
								end
							else
								nameText.Visible = false
							end
						else
							nameText.Visible = false
						end
					end
				end
			end)
		else
			if connections.playerEspUpdate then connections.playerEspUpdate:Disconnect() end
			for userId, nameText in pairs(playerEspObjects) do
				pcall(function() nameText:Remove() end)
			end
			table.clear(playerEspObjects)
		end
	end)

	local fruitEspToggle, fruitEspToggleBG, fruitEspToggleCircle = createToggle(espPage, "Fruit ESP", 2, fruitEspEnabled)
	fruitEspToggle.MouseButton1Click:Connect(function()
		fruitEspEnabled = not fruitEspEnabled
		TweenService:Create(fruitEspToggleCircle, TweenInfo.new(0.2), {
			Position = fruitEspEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(fruitEspToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = fruitEspEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()

		if fruitEspEnabled then
			connections.fruitAdded = workspace.DescendantAdded:Connect(function(obj)
				if fruitEspEnabled and obj:IsA("Tool") and string.find(obj.Name, "Fruit", 1, true) then
					task.delay(0.2, function()
						if isValidFruit(obj) and not fruitEspObjects[obj] then
							local nameText = Drawing.new("Text")
							nameText.Visible = false
							nameText.Center = true
							nameText.Outline = true
							nameText.Size = 18
							nameText.Font = 2
							nameText.Color = Color3.fromRGB(255, 200, 0)
							fruitEspObjects[obj] = nameText
						end
					end)
				end
			end)

			for _, obj in pairs(workspace:GetDescendants()) do
				if isValidFruit(obj) and not fruitEspObjects[obj] then
					local nameText = Drawing.new("Text")
					nameText.Visible = false
					nameText.Center = true
					nameText.Outline = true
					nameText.Size = 18
					nameText.Font = 2
					nameText.Color = Color3.fromRGB(255, 200, 0)
					fruitEspObjects[obj] = nameText
				end
			end

			connections.fruitEspUpdate = RunService.Heartbeat:Connect(function()
				if not fruitEspEnabled then return end
				local localChar = player.Character
				local localHrp = localChar and localChar:FindFirstChild("HumanoidRootPart")
				if not localHrp then return end

				for fruit, nameText in pairs(fruitEspObjects) do
					if not isValidFruit(fruit) then
						pcall(function() nameText:Remove() end)
						fruitEspObjects[fruit] = nil
					elseif fruit:FindFirstChild("Handle") then
						local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(fruit.Handle.Position + Vector3.new(0, 2, 0))
						if onScreen then
							local dist = (localHrp.Position - fruit.Handle.Position).Magnitude
							nameText.Position = Vector2.new(pos.X, pos.Y)
							nameText.Text = fruit.Name .. " [" .. math.floor(dist) .. "m]"
							nameText.Visible = true
						else
							nameText.Visible = false
						end
					else
						nameText.Visible = false
					end
				end
			end)
		else
			if connections.fruitAdded then connections.fruitAdded:Disconnect() end
			if connections.fruitEspUpdate then connections.fruitEspUpdate:Disconnect() end
			for fruit, nameText in pairs(fruitEspObjects) do
				pcall(function() nameText:Remove() end)
			end
			table.clear(fruitEspObjects)
		end
	end)

	local chestEspToggle, chestEspToggleBG, chestEspToggleCircle = createToggle(espPage, "Chest ESP", 3, chestEspEnabled)
	chestEspToggle.MouseButton1Click:Connect(function()
		chestEspEnabled = not chestEspEnabled
		TweenService:Create(chestEspToggleCircle, TweenInfo.new(0.2), {
			Position = chestEspEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(chestEspToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = chestEspEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()

		if chestEspEnabled then
			for _, obj in pairs(ChestModels:GetChildren()) do
				if isValidChest(obj) and not chestEspObjects[obj] then
					local nameText = Drawing.new("Text")
					nameText.Visible = false
					nameText.Center = true
					nameText.Outline = true
					nameText.Size = 16
					nameText.Font = 2
					nameText.Color = Color3.fromRGB(255, 215, 0)
					chestEspObjects[obj] = nameText
				end
			end

			connections.chestAdded = ChestModels.ChildAdded:Connect(function(obj)
				if chestEspEnabled and isValidChest(obj) then
					task.delay(0.1, function()
						if not chestEspObjects[obj] then
							local nameText = Drawing.new("Text")
							nameText.Visible = false
							nameText.Center = true
							nameText.Outline = true
							nameText.Size = 16
							nameText.Font = 2
							nameText.Color = Color3.fromRGB(255, 215, 0)
							chestEspObjects[obj] = nameText
						end
					end)
				end
			end)

			connections.chestEspUpdate = RunService.Heartbeat:Connect(function()
				if not chestEspEnabled then return end
				local localChar = player.Character
				local localHrp = localChar and localChar:FindFirstChild("HumanoidRootPart")
				if not localHrp then return end

				for chest, nameText in pairs(chestEspObjects) do
					if not chest or not chest.Parent then
						pcall(function() nameText:Remove() end)
						chestEspObjects[chest] = nil
					else
						local chestPos = getChestTouchPosition(chest)
						if chestPos then
							local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(chestPos + Vector3.new(0, 3, 0))
							if onScreen then
								local dist = (localHrp.Position - chestPos).Magnitude
								nameText.Position = Vector2.new(pos.X, pos.Y)
								nameText.Text = "💎 " .. chest.Name .. " [" .. math.floor(dist) .. "m]"
								nameText.Visible = true
							else
								nameText.Visible = false
							end
						else
							nameText.Visible = false
						end
					end
				end
			end)
		else
			if connections.chestAdded then connections.chestAdded:Disconnect() end
			if connections.chestEspUpdate then connections.chestEspUpdate:Disconnect() end
			for chest, nameText in pairs(chestEspObjects) do
				pcall(function() nameText:Remove() end)
			end
			table.clear(chestEspObjects)
		end
	end)

	local islandEspToggle, islandEspToggleBG, islandEspToggleCircle = createToggle(espPage, "Island ESP", 4, islandEspEnabled)
	islandEspToggle.MouseButton1Click:Connect(function()
		islandEspEnabled = not islandEspEnabled
		TweenService:Create(islandEspToggleCircle, TweenInfo.new(0.2), {
			Position = islandEspEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(islandEspToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = islandEspEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()

		if islandEspEnabled then
			local mapFolder = workspace:FindFirstChild("Map")
			if mapFolder then
				for _, island in pairs(mapFolder:GetChildren()) do
					if not islandEspObjects[island] then
						local nameText = Drawing.new("Text")
						nameText.Visible = false
						nameText.Center = true
						nameText.Outline = true
						nameText.Size = 20
						nameText.Font = 2
						nameText.Color = Color3.fromRGB(100, 200, 255)
						islandEspObjects[island] = nameText
					end
				end
			end

			connections.islandEspUpdate = RunService.Heartbeat:Connect(function()
				if not islandEspEnabled then return end
				local localChar = player.Character
				local localHrp = localChar and localChar:FindFirstChild("HumanoidRootPart")
				if not localHrp then return end

				for island, nameText in pairs(islandEspObjects) do
					if not island.Parent then
						pcall(function() nameText:Remove() end)
						islandEspObjects[island] = nil
					else
						local primary = island:FindFirstChildWhichIsA("BasePart")
						if primary then
							local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(primary.Position + Vector3.new(0, 100, 0))
							if onScreen then
								local dist = (localHrp.Position - primary.Position).Magnitude
								nameText.Position = Vector2.new(pos.X, pos.Y)
								nameText.Text = island.Name .. " [" .. math.floor(dist) .. "m]"
								nameText.Visible = true
							else
								nameText.Visible = false
							end
						end
					end
				end
			end)
		else
			if connections.islandEspUpdate then connections.islandEspUpdate:Disconnect() end
			for island, nameText in pairs(islandEspObjects) do
				pcall(function() nameText:Remove() end)
			end
			table.clear(islandEspObjects)
		end
	end)

	-- ==========================================
	-- DEVIL FRUIT PAGE
	-- ==========================================

	local autoCollectToggle, autoCollectToggleBG, autoCollectToggleCircle = createToggle(fruitPage, "Auto Collect Fruits", 1, autoCollectEnabled)
	autoCollectToggle.MouseButton1Click:Connect(function()
		autoCollectEnabled = not autoCollectEnabled
		TweenService:Create(autoCollectToggleCircle, TweenInfo.new(0.2), {
			Position = autoCollectEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(autoCollectToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = autoCollectEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
	end)

	local autoStoreToggle, autoStoreToggleBG, autoStoreToggleCircle = createToggle(fruitPage, "Auto Store Fruits", 2, autoStoreEnabled)
	autoStoreToggle.MouseButton1Click:Connect(function()
		autoStoreEnabled = not autoStoreEnabled
		TweenService:Create(autoStoreToggleCircle, TweenInfo.new(0.2), {
			Position = autoStoreEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(autoStoreToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = autoStoreEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
		
		if autoStoreEnabled then
			task.spawn(function()
				while autoStoreEnabled do
					pcall(function()
						local char = player.Character
						local backpack = player:FindFirstChild("Backpack")
						
						if char then
							for _, item in pairs(char:GetChildren()) do
								if item:IsA("Tool") and item:FindFirstChild("Fruit") then
									local fruitName = item.Name:gsub(" Fruit", "")
									local formattedName = fruitName .. "-" .. fruitName
									if CommF_ then
										CommF_:InvokeServer("StoreFruit", formattedName, item)
									end
								end
							end
						end
						
						if backpack then
							for _, item in pairs(backpack:GetChildren()) do
								if item:IsA("Tool") and item:FindFirstChild("Fruit") then
									local fruitName = item.Name:gsub(" Fruit", "")
									local formattedName = fruitName .. "-" .. fruitName
									if CommF_ then
										CommF_:InvokeServer("StoreFruit", formattedName, item)
									end
								end
							end
						end
					end)
					task.wait(0.5)
				end
			end)
		end
	end)

	local autoRollToggle, autoRollToggleBG, autoRollToggleCircle = createToggle(fruitPage, "Auto Roll Fruit", 3, autoRollEnabled)
	autoRollToggle.MouseButton1Click:Connect(function()
		autoRollEnabled = not autoRollEnabled
		TweenService:Create(autoRollToggleCircle, TweenInfo.new(0.2), {
			Position = autoRollEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(autoRollToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = autoRollEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
		
		if autoRollEnabled then
			task.spawn(function()
				while autoRollEnabled do
					pcall(function()
						if CommF_ then
							CommF_:InvokeServer("Cousin", "Buy")
						end
					end)
					task.wait(0.5)
				end
			end)
		end
	end)

	-- ==========================================
	-- COMBAT PAGE
	-- ==========================================

	local fastAttackToggle, fastAttackToggleBG, fastAttackToggleCircle = createToggle(combatPage, "Fast Attack", 1, fastAttackEnabled)
	fastAttackToggle.MouseButton1Click:Connect(function()
		fastAttackEnabled = not fastAttackEnabled
		_G.FastAttack = fastAttackEnabled
		
		TweenService:Create(fastAttackToggleCircle, TweenInfo.new(0.2), {
			Position = fastAttackEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(fastAttackToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = fastAttackEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
		
		if FastAttackModule then
			if fastAttackEnabled then
				FastAttackModule:Start()
			else
				FastAttackModule:Stop()
			end
		end
	end)

	-- ==========================================
	-- TELEPORT PAGE
	-- ==========================================
	
	local Islands = {}
	
	if Sea1 then
		Islands = {
			{Name = "Starter Island", CFrame = CFrame.new(1059, 16, 1547)},
			{Name = "Jungle", CFrame = CFrame.new(-1608, 37, 154)},
			{Name = "Pirate Village", CFrame = CFrame.new(-1181, 5, 3803)},
			{Name = "Desert", CFrame = CFrame.new(938, 21, 4439)},
			{Name = "Frozen Village", CFrame = CFrame.new(1208, 58, -1362)},
			{Name = "Marine Fortress", CFrame = CFrame.new(-4846, 24, 4254)},
			{Name = "Skylands", CFrame = CFrame.new(-4869, 717, -2622)},
			{Name = "Prison", CFrame = CFrame.new(4852, 6, 744)},
			{Name = "Colosseum", CFrame = CFrame.new(-1427, 8, -2797)},
			{Name = "Magma Village", CFrame = CFrame.new(-5295, 15, 8517)},
			{Name = "Underwater City", CFrame = CFrame.new(61163, 28, 1819)},
			{Name = "Fountain City", CFrame = CFrame.new(5254, 39, 4050)},
		}
	elseif Sea2 then
		Islands = {
			{Name = "Kingdom of Rose", CFrame = CFrame.new(-429, 72, 1836)},
			{Name = "Cafe", CFrame = CFrame.new(-380, 73, 297)},
			{Name = "Mansion", CFrame = CFrame.new(-12468, 375, -7551)},
			{Name = "Graveyard", CFrame = CFrame.new(-9504, 172, 6058)},
			{Name = "Snow Mountain", CFrame = CFrame.new(753, 408, -5274)},
			{Name = "Cursed Ship", CFrame = CFrame.new(923, 126, 32852)},
		}
	elseif Sea3 then
		Islands = {
			{Name = "Port Town", CFrame = CFrame.new(-290, 47, 5325)},
			{Name = "Hydra Island", CFrame = CFrame.new(5229, 407, 345)},
			{Name = "Great Tree", CFrame = CFrame.new(2177, 1129, -6569)},
			{Name = "Floating Turtle", CFrame = CFrame.new(-13274, 534, -7579)},
			{Name = "Castle on the Sea", CFrame = CFrame.new(-5097, 314, -3035)},
			{Name = "Haunted Castle", CFrame = CFrame.new(-9509, 173, 5765)},
			{Name = "Sea of Treats", CFrame = CFrame.new(-2664, 49, 11331)},
		}
	end

	local function tweenTeleport(targetCFrame)
		topos(targetCFrame)
	end

	createButton(teleportPage, "⏹️ Stop Teleport", 0, function()
		if currentTeleportTween then
			currentTeleportTween:Cancel()
			currentTeleportTween = nil
		end
	end)

	local orderCounter = 1
	for _, island in ipairs(Islands) do
		createButton(teleportPage, island.Name, orderCounter, function()
			tweenTeleport(island.CFrame)
		end)
		orderCounter = orderCounter + 1
	end

	-- ==========================================
	-- MISC PAGE - AUTO CHEST
	-- ==========================================

	local chestCountLabel
	
	local autoChestToggle, autoChestToggleBG, autoChestToggleCircle = createToggle(miscPage, "Auto Collect Chests", 1, autoChestEnabled)
	autoChestToggle.MouseButton1Click:Connect(function()
		autoChestEnabled = not autoChestEnabled
		TweenService:Create(autoChestToggleCircle, TweenInfo.new(0.2), {
			Position = autoChestEnabled and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		}):Play()
		TweenService:Create(autoChestToggleBG, TweenInfo.new(0.2), {
			BackgroundColor3 = autoChestEnabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 50, 70)
		}):Play()
		
		if not autoChestEnabled then
			if currentChestTween then
				currentChestTween:Cancel()
				currentChestTween = nil
			end
			isTweening = false
			loopRunning = false
			currentTarget = nil
		else
			if not loopRunning then
				task.spawn(mainLoop)
			end
		end
	end)

	local chestCountContainer = Instance.new("Frame", miscPage)
	chestCountContainer.Size = UDim2.new(1, -10, 0, 40)
	chestCountContainer.BackgroundColor3 = Color3.fromRGB(45, 40, 60)
	chestCountContainer.BorderSizePixel = 0
	chestCountContainer.LayoutOrder = 2
	Instance.new("UICorner", chestCountContainer).CornerRadius = UDim.new(0, 10)

	chestCountLabel = Instance.new("TextLabel", chestCountContainer)
	chestCountLabel.Size = UDim2.new(1, 0, 1, 0)
	chestCountLabel.Text = "Collected: 0"
	chestCountLabel.Font = Enum.Font.GothamBold
	chestCountLabel.TextSize = 14
	chestCountLabel.TextColor3 = Color3.fromRGB(100, 200, 150)
	chestCountLabel.BackgroundTransparency = 1
	
	-- Update chest count
	task.spawn(function()
		while task.wait(1) do
			if chestCountLabel then
				local count = 0
				for _ in pairs(visitedChests) do count = count + 1 end
				chestCountLabel.Text = "Collected: " .. count
			end
		end
	end)

	-- ==========================================
	-- PAGE NAVIGATION
	-- ==========================================
	
	local allPages = {playerPage, espPage, fruitPage, combatPage, teleportPage, miscPage}
	local allButtons = {playerBtn, espBtn, fruitBtn, combatBtn, teleportBtn, miscBtn}

	local function showPage(pageToShow, btnToHighlight)
		for _, page in pairs(allPages) do page.Visible = false end
		pageToShow.Visible = true
		for _, btn in pairs(allButtons) do
			btn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
			btn.TextColor3 = Color3.fromRGB(180, 180, 200)
		end
		btnToHighlight.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
		btnToHighlight.TextColor3 = Color3.new(1, 1, 1)
	end

	playerBtn.MouseButton1Click:Connect(function() showPage(playerPage, playerBtn) end)
	espBtn.MouseButton1Click:Connect(function() showPage(espPage, espBtn) end)
	fruitBtn.MouseButton1Click:Connect(function() showPage(fruitPage, fruitBtn) end)
	combatBtn.MouseButton1Click:Connect(function() showPage(combatPage, combatBtn) end)
	teleportBtn.MouseButton1Click:Connect(function() showPage(teleportPage, teleportBtn) end)
	miscBtn.MouseButton1Click:Connect(function() showPage(miscPage, miscBtn) end)

	playerBtn.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
	playerBtn.TextColor3 = Color3.new(1, 1, 1)

	-- ==========================================
	-- DRAGGING
	-- ==========================================
	
	local draggingMain = false
	local dragStart, startPos

	titleBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingMain = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	titleBar.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingMain = false
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if draggingMain and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	local draggingMini = false
	local miniDragStart, miniStartPos

	miniBox.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingMini = true
			miniDragStart = input.Position
			miniStartPos = miniBox.Position
		end
	end)

	miniBox.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if draggingMini then
				local delta = input.Position - miniDragStart
				if delta.Magnitude < 5 then
					main.Visible = true
					miniBox.Visible = false
				end
			end
			draggingMini = false
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if draggingMini and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - miniDragStart
			miniBox.Position = UDim2.new(miniStartPos.X.Scale, miniStartPos.X.Offset + delta.X, miniStartPos.Y.Scale, miniStartPos.Y.Offset + delta.Y)
		end
	end)

	minimizeBtn.MouseButton1Click:Connect(function()
		main.Visible = false
		miniBox.Visible = true
	end)

	-- Close
	closeBtn.MouseButton1Click:Connect(function()
		local prompt = Instance.new("Frame", gui)
		prompt.Size = UDim2.new(0, 280, 0, 120)
		prompt.Position = UDim2.new(0.5, -140, 0.5, -60)
		prompt.BackgroundColor3 = Color3.fromRGB(25, 22, 40)
		prompt.BorderSizePixel = 0
		Instance.new("UICorner", prompt).CornerRadius = UDim.new(0, 12)
		Instance.new("UIStroke", prompt).Color = Color3.fromRGB(100, 70, 150)

		local text = Instance.new("TextLabel", prompt)
		text.Size = UDim2.new(1, 0, 0, 50)
		text.Position = UDim2.new(0, 0, 0, 15)
		text.Text = "Close Syntaskk Hub?"
		text.Font = Enum.Font.GothamBold
		text.TextColor3 = Color3.new(1, 1, 1)
		text.TextSize = 18
		text.BackgroundTransparency = 1

		local yes = Instance.new("TextButton", prompt)
		yes.Size = UDim2.new(0.4, 0, 0, 35)
		yes.Position = UDim2.new(0.08, 0, 0, 70)
		yes.Text = "Yes"
		yes.Font = Enum.Font.GothamBold
		yes.TextSize = 14
		yes.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
		yes.TextColor3 = Color3.new(1, 1, 1)
		yes.BorderSizePixel = 0
		Instance.new("UICorner", yes).CornerRadius = UDim.new(0, 8)

		local no = Instance.new("TextButton", prompt)
		no.Size = UDim2.new(0.4, 0, 0, 35)
		no.Position = UDim2.new(0.52, 0, 0, 70)
		no.Text = "No"
		no.Font = Enum.Font.GothamBold
		no.TextSize = 14
		no.BackgroundColor3 = Color3.fromRGB(60, 50, 90)
		no.TextColor3 = Color3.new(1, 1, 1)
		no.BorderSizePixel = 0
		Instance.new("UICorner", no).CornerRadius = UDim.new(0, 8)

		yes.MouseButton1Click:Connect(function()
			speedEnabled = false
			infiniteJump = false
			dashEnabled = false
			noClipEnabled = false
			playerEspEnabled = false
			fruitEspEnabled = false
			chestEspEnabled = false
			islandEspEnabled = false
			autoCollectEnabled = false
			autoStoreEnabled = false
			autoRollEnabled = false
			autoChestEnabled = false
			fastAttackEnabled = false
			_G.FastAttack = false
			
			for name, conn in pairs(connections) do
				if conn then pcall(function() conn:Disconnect() end) end
			end
			table.clear(connections)
			
			for _, nameText in pairs(playerEspObjects) do pcall(function() nameText:Remove() end) end
			for _, nameText in pairs(fruitEspObjects) do pcall(function() nameText:Remove() end) end
			for _, nameText in pairs(chestEspObjects) do pcall(function() nameText:Remove() end) end
			for _, nameText in pairs(islandEspObjects) do pcall(function() nameText:Remove() end) end
			table.clear(playerEspObjects)
			table.clear(fruitEspObjects)
			table.clear(chestEspObjects)
			table.clear(islandEspObjects)
			
			if currentTeleportTween then currentTeleportTween:Cancel() end
			if currentChestTween then currentChestTween:Cancel() end
			
			if FastAttackModule then
				FastAttackModule:Stop()
			end
			
			guiInitialized = false
			gui:Destroy()
		end)

		no.MouseButton1Click:Connect(function()
			prompt:Destroy()
		end)
	end)

end

-- ==========================================
-- MAIN LOOP
-- ==========================================

task.spawn(function()
	while task.wait(0.1) do
		pcall(function()
			local char = player.Character
			if not char then return end
			local hum = char:FindFirstChild("Humanoid")
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hum or not hrp then return end
			if hum.Health <= 0 then return end
			
			-- Speed Hack
			if speedEnabled then
				char:SetAttribute("SpeedMultiplier", speedValue)
			else
				char:SetAttribute("SpeedMultiplier", 16)
			end
			
			-- Dash
			if dashEnabled then
				char:SetAttribute("DashLength", 100)
				char:SetAttribute("DashSpeed", 100)
			end
			
			-- No Clip
			if noClipEnabled then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
			
			-- Auto Collect Fruits
			if autoCollectEnabled then
				for _, obj in pairs(workspace:GetChildren()) do
					if isValidFruit(obj) then
						local handle = obj:FindFirstChild("Handle")
						if handle then
							local dist = (hrp.Position - handle.Position).Magnitude
							if dist > 3 then
								hrp.CFrame = CFrame.new(handle.Position + Vector3.new(0, 2, 0))
								task.wait(0.3)
								break
							end
						end
					end
				end
			end
		end)
	end
end)

-- Infinite Jump
task.spawn(function()
	UIS.JumpRequest:Connect(function()
		if infiniteJump and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
			player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end)

-- Initialize
initializeUI()

player.CharacterAdded:Connect(function(newChar)
	task.wait(1)
	local existingGui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("SyntaskkHubUI")
	if not existingGui then
		guiInitialized = false
		initializeUI()
	end
end)
