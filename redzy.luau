local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

player.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local CommF_ = nil
pcall(function()
    CommF_ = ReplicatedStorage:WaitForChild("Remotes", 10):WaitForChild("CommF_", 10)
end)

local function GetSea()
    -- Sea 3 kontrolü (5 saniye bekle)
    if workspace:WaitForChild("BananaSpawner", 5) then
        return 3
    -- Sea 2 kontrolü (5 saniye bekle)
    elseif workspace:WaitForChild("Lab Battle", 5) then
        return 2
    -- Hiçbiri yoksa Sea 1
    else
        return 1
    end
end



local CurrentSea = GetSea()

local IslandPositions = {
    [1] = {
        ["WindMill"] = CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594),
        ["Marine"] = CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156),
        ["Middle Town"] = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094),
        ["Jungle"] = CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754),
        ["Pirate Village"] = CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969),
        ["Desert"] = CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688),
        ["Snow Island"] = CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469),
        ["MarineFord"] = CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313),
        ["Colosseum"] = CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969),
        ["Sky Island 1"] = CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063),
        ["Sky Island 2"] = CFrame.new(-4607.82275, 872.54248, -1667.55688),
        ["Sky Island 3"] = CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047),
        ["Prison"] = CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656),
        ["Magma Village"] = CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875),
        ["Under Water Island"] = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875),
        ["Fountain City"] = CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813),
        ["Shank Room"] = CFrame.new(-1442.16553, 29.8788261, -28.3547478),
        ["Mob Island"] = CFrame.new(-2850.20068, 7.39224768, 5354.99268)
    },
    [2] = {
        ["The Cafe"] = CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828),
        ["Frist Spot"] = CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375),
        ["Dark Area"] = CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375),
        ["Flamingo Mansion"] = CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234),
        ["Flamingo Room"] = CFrame.new(2284.4140625, 15.152037620544, 875.72534179688),
        ["Green Zone"] = CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344),
        ["Factory"] = CFrame.new(424.12698364258, 211.16171264648, -427.54049682617),
        ["Colossuim"] = CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641),
        ["Zombie Island"] = CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094),
        ["Two Snow Mountain"] = CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938),
        ["Punk Hazard"] = CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125),
        ["Cursed Ship"] = CFrame.new(923.40197753906, 125.05712890625, 32885.875),
        ["Ice Castle"] = CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188),
        ["Forgotten Island"] = CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875),
        ["Ussop Island"] = CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781),
        ["Mini Sky Island"] = CFrame.new(-288.74060058594, 49326.31640625, -35248.59375)
    },
    [3] = {
        ["Mansion"] = CFrame.new(-12468.5380859375, 375.0094299316406, -7554.62548828125),
        ["Port Town"] = CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375),
        ["Great Tree"] = CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625),
        ["Castle On The Sea"] = CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375),
        ["MiniSky"] = CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125),
        ["Hydra Island"] = CFrame.new(5753.5478515625, 610.7880859375, -282.33172607421875),
        ["Floating Turtle"] = CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625),
        ["Haunted Castle"] = CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562),
        ["Ice Cream Island"] = CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625),
        ["Peanut Island"] = CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375),
        ["Cake Island"] = CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375),
        ["Cocoa Island"] = CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375),
        ["Candy Island"] = CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625),
        ["Tiki Outpost"] = CFrame.new(-10900.834, 20.108551, 404.05542, 0.999391913, 0, 0.0348687991, 0, 1, 0, -0.0348687991, 0, 0.999391913),
        ["Isle Outpost"] = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
    }
}

local IslandList = {}
for name, _ in pairs(IslandPositions[CurrentSea] or {}) do
    table.insert(IslandList, name)
end
table.sort(IslandList)

local function initializeSyntaskk()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "SyntaskkAIO"
    gui.ResetOnSpawn = false
    
    local MOD_ENABLED = false
    local AUTO_STORE_ENABLED = false
    local TP_FRUITS_ACTIVE = false
    local CASTLE_RAID_ACTIVE = false
    local FACTORY_RAID_ACTIVE = false
    local AUTO_FARM_CHEST = false
    local ISLAND_TP_ACTIVE = false
    local SEA_MENU_OPEN = false
    local ISLAND_MENU_OPEN = false
    local SelectedIsland = nil
    local speed = 350
    local defaultSpeed = 16
    local Number = math.random(1, 1000000)
    local currentIslandIndex = 1
    local visitedIslands = {}
    
    local renderConnection = nil
    local autoAttackConnection = nil
    local fruitEspLoop = nil
    local flowerEspLoop = nil
    local autoStoreLoop = nil
    local fruitAddedConnection = nil
    local espConnections = {}
    local noClipConnection = nil
    local castleRaidLoop = nil
    local castleAttackLoop = nil
    local castleBringLoop = nil
    local factoryRaidLoop = nil
    local factoryBringLoop = nil
    local factoryAttackLoop = nil
    local chestFarmLoop = nil
    local islandTPLoop = nil
    local antiGravityConnection = nil
    local currentTween = nil
    
    local CastlePos = CFrame.new(-5496.17432, 313.768921, -2841.53027)
    local FactoryPos = CFrame.new(448.46756, 199.356781, -441.389252)
    
    local frameHeight = 225
    
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 200, 0, frameHeight)
    mainFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
    mainFrame.BorderSizePixel = 1
    
    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, -50, 0, 28)
    title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    title.BorderSizePixel = 0
    title.Text = "Syntaskk AIO | Sea " .. CurrentSea
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 13
    title.Font = Enum.Font.SourceSansBold
    
    local seaMenuToggle = Instance.new("TextButton", mainFrame)
    seaMenuToggle.Size = UDim2.new(0, 25, 0, 28)
    seaMenuToggle.Position = UDim2.new(1, -50, 0, 0)
    seaMenuToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
    seaMenuToggle.BorderSizePixel = 0
    seaMenuToggle.Text = "S"
    seaMenuToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    seaMenuToggle.TextSize = 14
    seaMenuToggle.Font = Enum.Font.SourceSansBold
    
    local islandMenuToggle = Instance.new("TextButton", mainFrame)
    islandMenuToggle.Size = UDim2.new(0, 25, 0, 28)
    islandMenuToggle.Position = UDim2.new(1, -25, 0, 0)
    islandMenuToggle.BackgroundColor3 = Color3.fromRGB(100, 60, 60)
    islandMenuToggle.BorderSizePixel = 0
    islandMenuToggle.Text = "I"
    islandMenuToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    islandMenuToggle.TextSize = 14
    islandMenuToggle.Font = Enum.Font.SourceSansBold
    
    local seaMenu = Instance.new("Frame", gui)
    seaMenu.Name = "SeaMenu"
    seaMenu.Size = UDim2.new(0, 120, 0, 120)
    seaMenu.Position = UDim2.new(0.5, 105, 0.1, 0)
    seaMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    seaMenu.BorderColor3 = Color3.fromRGB(100, 100, 100)
    seaMenu.BorderSizePixel = 1
    seaMenu.Visible = false
    
    local seaMenuTitle = Instance.new("TextLabel", seaMenu)
    seaMenuTitle.Size = UDim2.new(1, 0, 0, 25)
    seaMenuTitle.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    seaMenuTitle.BorderSizePixel = 0
    seaMenuTitle.Text = "Sea TP"
    seaMenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    seaMenuTitle.TextSize = 12
    seaMenuTitle.Font = Enum.Font.SourceSansBold
    
    local sea1Button = Instance.new("TextButton", seaMenu)
    sea1Button.Size = UDim2.new(1, -10, 0, 26)
    sea1Button.Position = UDim2.new(0, 5, 0, 30)
    sea1Button.BackgroundColor3 = CurrentSea == 1 and Color3.fromRGB(45, 140, 45) or Color3.fromRGB(70, 70, 100)
    sea1Button.BorderSizePixel = 1
    sea1Button.Text = CurrentSea == 1 and "Sea 1 [Current]" or "Sea 1"
    sea1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    sea1Button.TextSize = 11
    sea1Button.Font = Enum.Font.SourceSans
    
    local sea2Button = Instance.new("TextButton", seaMenu)
    sea2Button.Size = UDim2.new(1, -10, 0, 26)
    sea2Button.Position = UDim2.new(0, 5, 0, 60)
    sea2Button.BackgroundColor3 = CurrentSea == 2 and Color3.fromRGB(45, 140, 45) or Color3.fromRGB(70, 70, 100)
    sea2Button.BorderSizePixel = 1
    sea2Button.Text = CurrentSea == 2 and "Sea 2 [Current]" or "Sea 2"
    sea2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    sea2Button.TextSize = 11
    sea2Button.Font = Enum.Font.SourceSans
    
    local sea3Button = Instance.new("TextButton", seaMenu)
    sea3Button.Size = UDim2.new(1, -10, 0, 26)
    sea3Button.Position = UDim2.new(0, 5, 0, 90)
    sea3Button.BackgroundColor3 = CurrentSea == 3 and Color3.fromRGB(45, 140, 45) or Color3.fromRGB(70, 70, 100)
    sea3Button.BorderSizePixel = 1
    sea3Button.Text = CurrentSea == 3 and "Sea 3 [Current]" or "Sea 3"
    sea3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    sea3Button.TextSize = 11
    sea3Button.Font = Enum.Font.SourceSans
    
    local islandMenu = Instance.new("Frame", gui)
    islandMenu.Name = "IslandMenu"
    islandMenu.Size = UDim2.new(0, 150, 0, 220)
    islandMenu.Position = UDim2.new(0.5, 105, 0.1, 0)
    islandMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    islandMenu.BorderColor3 = Color3.fromRGB(100, 100, 100)
    islandMenu.BorderSizePixel = 1
    islandMenu.Visible = false
    
    local islandMenuTitle = Instance.new("TextLabel", islandMenu)
    islandMenuTitle.Size = UDim2.new(1, 0, 0, 25)
    islandMenuTitle.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
    islandMenuTitle.BorderSizePixel = 0
    islandMenuTitle.Text = "Island TP"
    islandMenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    islandMenuTitle.TextSize = 12
    islandMenuTitle.Font = Enum.Font.SourceSansBold
    
    local islandScroll = Instance.new("ScrollingFrame", islandMenu)
    islandScroll.Size = UDim2.new(1, -10, 1, -65)
    islandScroll.Position = UDim2.new(0, 5, 0, 30)
    islandScroll.BackgroundTransparency = 1
    islandScroll.ScrollBarThickness = 5
    islandScroll.CanvasSize = UDim2.new(0, 0, 0, #IslandList * 28)
    
    local islandButtons = {}
    for i, islandName in ipairs(IslandList) do
        local btn = Instance.new("TextButton", islandScroll)
        btn.Size = UDim2.new(1, -10, 0, 25)
        btn.Position = UDim2.new(0, 0, 0, (i-1) * 28)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        btn.BorderSizePixel = 1
        btn.Text = islandName
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.SourceSans
        btn.TextScaled = true
        
        btn.MouseButton1Click:Connect(function()
            SelectedIsland = islandName
            for _, b in pairs(islandButtons) do
                b.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            end
            btn.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
            statusLabel.Text = "Selected: " .. islandName
        end)
        
        table.insert(islandButtons, btn)
    end
    
    local goButton = Instance.new("TextButton", islandMenu)
    goButton.Size = UDim2.new(0.48, 0, 0, 25)
    goButton.Position = UDim2.new(0, 5, 1, -30)
    goButton.BackgroundColor3 = Color3.fromRGB(45, 100, 45)
    goButton.BorderSizePixel = 1
    goButton.Text = "GO"
    goButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    goButton.TextSize = 14
    goButton.Font = Enum.Font.SourceSansBold
    
    local cancelButton = Instance.new("TextButton", islandMenu)
    cancelButton.Size = UDim2.new(0.48, 0, 0, 25)
    cancelButton.Position = UDim2.new(0.52, 0, 1, -30)
    cancelButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
    cancelButton.BorderSizePixel = 1
    cancelButton.Text = "STOP"
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelButton.TextSize = 14
    cancelButton.Font = Enum.Font.SourceSansBold
    
    local toggleButton = Instance.new("TextButton", mainFrame)
    toggleButton.Size = UDim2.new(1, -10, 0, 26)
    toggleButton.Position = UDim2.new(0, 5, 0, 33)
    toggleButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
    toggleButton.BorderSizePixel = 1
    toggleButton.Text = "Mod: OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 12
    toggleButton.Font = Enum.Font.SourceSans
    
    local autoStoreButton = Instance.new("TextButton", mainFrame)
    autoStoreButton.Size = UDim2.new(1, -10, 0, 26)
    autoStoreButton.Position = UDim2.new(0, 5, 0, 64)
    autoStoreButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
    autoStoreButton.BorderSizePixel = 1
    autoStoreButton.Text = "Auto Store: OFF"
    autoStoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoStoreButton.TextSize = 12
    autoStoreButton.Font = Enum.Font.SourceSans
    
    local tpFruitsButton = Instance.new("TextButton", mainFrame)
    tpFruitsButton.Size = UDim2.new(1, -10, 0, 26)
    tpFruitsButton.Position = UDim2.new(0, 5, 0, 95)
    tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    tpFruitsButton.BorderSizePixel = 1
    tpFruitsButton.Text = "TP Fruits: OFF"
    tpFruitsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tpFruitsButton.TextSize = 12
    tpFruitsButton.Font = Enum.Font.SourceSans
    
    local chestButton = Instance.new("TextButton", mainFrame)
    chestButton.Size = UDim2.new(1, -10, 0, 26)
    chestButton.Position = UDim2.new(0, 5, 0, 126)
    chestButton.BackgroundColor3 = Color3.fromRGB(80, 80, 50)
    chestButton.BorderSizePixel = 1
    chestButton.Text = "Auto Chest: OFF"
    chestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    chestButton.TextSize = 12
    chestButton.Font = Enum.Font.SourceSans
    
    local raidButton = nil
    if CurrentSea == 2 then
        raidButton = Instance.new("TextButton", mainFrame)
        raidButton.Size = UDim2.new(1, -10, 0, 26)
        raidButton.Position = UDim2.new(0, 5, 0, 157)
        raidButton.BackgroundColor3 = Color3.fromRGB(100, 80, 50)
        raidButton.BorderSizePixel = 1
        raidButton.Text = "Factory Raid: OFF"
        raidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        raidButton.TextSize = 12
        raidButton.Font = Enum.Font.SourceSans
    elseif CurrentSea == 3 then
        raidButton = Instance.new("TextButton", mainFrame)
        raidButton.Size = UDim2.new(1, -10, 0, 26)
        raidButton.Position = UDim2.new(0, 5, 0, 157)
        raidButton.BackgroundColor3 = Color3.fromRGB(100, 50, 100)
        raidButton.BorderSizePixel = 1
        raidButton.Text = "Castle Raid: OFF"
        raidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        raidButton.TextSize = 12
        raidButton.Font = Enum.Font.SourceSans
    end
    
    local fruitLabelY = (CurrentSea == 2 or CurrentSea == 3) and 188 or 157
    local fruitLabel = Instance.new("TextLabel", mainFrame)
    fruitLabel.Size = UDim2.new(1, 0, 0, 20)
    fruitLabel.Position = UDim2.new(0, 0, 0, fruitLabelY)
    fruitLabel.BackgroundTransparency = 1
    fruitLabel.Text = "Fruits: 0"
    fruitLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    fruitLabel.TextSize = 11
    fruitLabel.Font = Enum.Font.SourceSans
    
    local statusLabel = Instance.new("TextLabel", mainFrame)
    statusLabel.Size = UDim2.new(1, 0, 0, 15)
    statusLabel.Position = UDim2.new(0, 0, 0, fruitLabelY + 15)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    statusLabel.TextSize = 10
    statusLabel.Font = Enum.Font.SourceSans
    
    local dragging, dragInput, mousePos, framePos = false, nil, nil, nil
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            mainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            local menuOffset = mainFrame.Size.X.Offset + 5
            seaMenu.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + menuOffset, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
            islandMenu.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + menuOffset, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
        end
    end)
    
    local function ToggleSeaMenu()
        SEA_MENU_OPEN = not SEA_MENU_OPEN
        ISLAND_MENU_OPEN = false
        seaMenu.Visible = SEA_MENU_OPEN
        islandMenu.Visible = false
        local menuOffset = mainFrame.Size.X.Offset + 5
        seaMenu.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + menuOffset, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
    end
    
    local function ToggleIslandMenu()
        ISLAND_MENU_OPEN = not ISLAND_MENU_OPEN
        SEA_MENU_OPEN = false
        islandMenu.Visible = ISLAND_MENU_OPEN
        seaMenu.Visible = false
        local menuOffset = mainFrame.Size.X.Offset + 5
        islandMenu.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + menuOffset, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset)
    end
    
    seaMenuToggle.MouseButton1Click:Connect(ToggleSeaMenu)
    islandMenuToggle.MouseButton1Click:Connect(ToggleIslandMenu)
    
    local function EnableNoClip()
        if noClipConnection then return end
        noClipConnection = RunService.Stepped:Connect(function()
            pcall(function()
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
        end)
    end
    
    local function DisableNoClip()
        if noClipConnection then noClipConnection:Disconnect() noClipConnection = nil end
    end
    
    local function EnableAntiGravity()
        if antiGravityConnection then return end
        antiGravityConnection = RunService.Heartbeat:Connect(function()
            pcall(function()
                local hrp = player.Character.HumanoidRootPart
                local hum = player.Character.Humanoid
                hum.PlatformStand = false
                hum.Sit = false
                local bv = hrp:FindFirstChild("RaidBV")
                if not bv then
                    bv = Instance.new("BodyVelocity")
                    bv.Name = "RaidBV"
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bv.Parent = hrp
                end
                local bg = hrp:FindFirstChild("RaidBG")
                if not bg then
                    bg = Instance.new("BodyGyro")
                    bg.Name = "RaidBG"
                    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    bg.P = 50000
                    bg.D = 1000
                    bg.Parent = hrp
                end
                bg.CFrame = hrp.CFrame
            end)
        end)
    end
    
    local function DisableAntiGravity()
        if antiGravityConnection then antiGravityConnection:Disconnect() antiGravityConnection = nil end
        pcall(function()
            local hrp = player.Character.HumanoidRootPart
            if hrp:FindFirstChild("RaidBV") then hrp.RaidBV:Destroy() end
            if hrp:FindFirstChild("RaidBG") then hrp.RaidBG:Destroy() end
        end)
    end
    
    local function StopTween()
        if currentTween then currentTween:Cancel() currentTween = nil end
    end
    
    local function Tween(pos)
        pcall(function()
            StopTween()
            local hrp = player.Character.HumanoidRootPart
            local distance = (hrp.Position - pos.Position).Magnitude
            local timeToReach = distance / speed
            if timeToReach < 0.1 then hrp.CFrame = pos return end
            currentTween = TweenService:Create(hrp, TweenInfo.new(timeToReach, Enum.EasingStyle.Linear), {CFrame = pos})
            currentTween:Play()
        end)
    end
    
    local function BypassTP(targetCFrame)
        pcall(function()
            local hrp = player.Character.HumanoidRootPart
            while ISLAND_TP_ACTIVE do
                local distance = (hrp.Position - targetCFrame.Position).Magnitude
                if distance < 50 then
                    hrp.CFrame = targetCFrame
                    break
                else
                    local direction = (targetCFrame.Position - hrp.Position).Unit
                    local jumpDist = math.min(distance, 1000)
                    hrp.CFrame = CFrame.new(hrp.Position + (direction * jumpDist))
                    wait(0.1)
                end
            end
        end)
    end
    
    local function ChestBypassTP(targetCFrame)
        pcall(function()
            local hrp = player.Character.HumanoidRootPart
            while AUTO_FARM_CHEST do
                local distance = (hrp.Position - targetCFrame.Position).Magnitude
                if distance < 20 then
                    hrp.CFrame = targetCFrame
                    break
                else
                    local direction = (targetCFrame.Position - hrp.Position).Unit
                    local jumpDist = math.min(distance, 500)
                    hrp.CFrame = CFrame.new(hrp.Position + (direction * jumpDist))
                    wait(0.05)
                end
            end
        end)
    end
    
    local function TP(pos)
        pcall(function() player.Character.HumanoidRootPart.CFrame = pos end)
    end
    
    local function EquipMelee()
        pcall(function()
            local tool = player.Character:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
            if tool then player.Character.Humanoid:EquipTool(tool) end
        end)
    end
    
    local function AutoHaki()
        pcall(function()
            if not player.Character:FindFirstChild("HasBuso") then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
            end
        end)
    end
    
    local function TeleportToSea(seaNumber)
        if seaNumber == CurrentSea then return end
        pcall(function()
            if seaNumber == 1 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain")
            elseif seaNumber == 2 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
            elseif seaNumber == 3 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
            end
        end)
    end
    
    sea1Button.MouseButton1Click:Connect(function() TeleportToSea(1) end)
    sea2Button.MouseButton1Click:Connect(function() TeleportToSea(2) end)
    sea3Button.MouseButton1Click:Connect(function() TeleportToSea(3) end)
    
    local function StartIslandTP(islandName)
        if not islandName then return end
        if ISLAND_TP_ACTIVE then return end
        
        local islands = IslandPositions[CurrentSea]
        if not islands then return end
        local pos = islands[islandName]
        if not pos then return end
        
        ISLAND_TP_ACTIVE = true
        goButton.Text = "..."
        goButton.BackgroundColor3 = Color3.fromRGB(100, 100, 45)
        
        EnableNoClip()
        EnableAntiGravity()
        
        islandTPLoop = task.spawn(function()
            statusLabel.Text = "Going to " .. islandName .. "..."
            
            Tween(pos)
            
            while ISLAND_TP_ACTIVE do
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    wait(0.5)
                    continue
                end
                
                local hrp = player.Character.HumanoidRootPart
                local dist = (hrp.Position - pos.Position).Magnitude
                
                statusLabel.Text = islandName .. ": " .. math.floor(dist) .. "m"
                
                if dist < 100 then
                    BypassTP(pos)
                    statusLabel.Text = islandName .. " Done!"
                    break
                end
                
                wait(0.1)
            end
            
            ISLAND_TP_ACTIVE = false
            goButton.Text = "GO"
            goButton.BackgroundColor3 = Color3.fromRGB(45, 100, 45)
            DisableAntiGravity()
            DisableNoClip()
        end)
    end
    
    local function StopIslandTP()
        ISLAND_TP_ACTIVE = false
        StopTween()
        if islandTPLoop then task.cancel(islandTPLoop) islandTPLoop = nil end
        goButton.Text = "GO"
        goButton.BackgroundColor3 = Color3.fromRGB(45, 100, 45)
        statusLabel.Text = "Cancelled"
        DisableAntiGravity()
        DisableNoClip()
    end
    
    goButton.MouseButton1Click:Connect(function()
        if SelectedIsland then
            StartIslandTP(SelectedIsland)
        else
            statusLabel.Text = "Select island!"
        end
    end)
    
    cancelButton.MouseButton1Click:Connect(function()
        StopIslandTP()
    end)
    
    local function GetNearestChest()
        local nearestChest = nil
        local nearestDistance = math.huge
        local chestCFrame = nil
        
        pcall(function()
            local chestModels = workspace:FindFirstChild("ChestModels")
            if not chestModels then return end
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            for _, chest in pairs(chestModels:GetChildren()) do
                local pos = nil
                if chest:IsA("Model") then
                    if chest.PrimaryPart then
                        pos = chest.PrimaryPart.CFrame
                    elseif chest:FindFirstChild("Chest") then
                        pos = chest.Chest.CFrame
                    else
                        local part = chest:FindFirstChildWhichIsA("BasePart")
                        if part then pos = part.CFrame end
                    end
                elseif chest:IsA("BasePart") then
                    pos = chest.CFrame
                end
                
                if pos then
                    local distance = (hrp.Position - pos.Position).Magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestChest = chest
                        chestCFrame = pos
                    end
                end
            end
        end)
        
        return nearestChest, nearestDistance, chestCFrame
    end
    
    local function IsIslandVisited(islandName)
        for _, visitedName in ipairs(visitedIslands) do
            if visitedName == islandName then
                return true
            end
        end
        return false
    end
    
    local function AddVisitedIsland(islandName)
        if #visitedIslands >= 3 then
            visitedIslands = {}
        end
        
        if not IsIslandVisited(islandName) then
            table.insert(visitedIslands, islandName)
        end
    end
    
    local function GetNextIsland()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil, nil end
        
        local islands = IslandPositions[CurrentSea]
        if not islands then return nil, nil end
        
        local distances = {}
        for name, pos in pairs(islands) do
            if not IsIslandVisited(name) then
                local dist = (hrp.Position - pos.Position).Magnitude
                table.insert(distances, {name = name, distance = dist, position = pos})
            end
        end
        
        if #distances == 0 then
            visitedIslands = {}
            for name, pos in pairs(islands) do
                local dist = (hrp.Position - pos.Position).Magnitude
                table.insert(distances, {name = name, distance = dist, position = pos})
            end
        end
        
        table.sort(distances, function(a, b) return a.distance < b.distance end)
        
        if #distances >= 1 then
            return distances[1].name, distances[1].position
        end
        
        return nil, nil
    end
    
    local function isValidFruit(obj)
        if not obj or not obj.Parent then return false end
        if not string.find(obj.Name, "Fruit", 1, true) then return false end
        if obj.Name == "Blox Fruit Dealer" then return false end
        if not obj:IsA("Model") and not obj:IsA("Tool") then return false end
        local handle = obj:FindFirstChild("Handle")
        if not handle then return false end
        local parent = obj.Parent
        if parent:IsA("Backpack") or parent:FindFirstChild("Humanoid") then return false end
        return true
    end
    
    local function getAllFruits()
        local fruits = {}
        for _, v in pairs(workspace:GetChildren()) do
            if isValidFruit(v) then table.insert(fruits, v) end
        end
        return fruits
    end
    
    local function getNearestFruit()
        local chr = player.Character
        local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        local nearestFruit, nearestDistance = nil, math.huge
        for _, v in pairs(workspace:GetChildren()) do
            if isValidFruit(v) then
                local handle = v:FindFirstChild("Handle")
                if handle then
                    local distance = (hrp.Position - handle.Position).Magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestFruit = v
                    end
                end
            end
        end
        return nearestFruit, nearestDistance
    end
    
    local function HasFruitInWorld()
        for _, v in pairs(workspace:GetChildren()) do
            if isValidFruit(v) then return true end
        end
        return false
    end
    
    local function StartChestFarm()
        if AUTO_FARM_CHEST then return end
        AUTO_FARM_CHEST = true
        currentIslandIndex = 1
        chestButton.Text = "Auto Chest: ON"
        chestButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
        
        EnableNoClip()
        EnableAntiGravity()
        
        chestFarmLoop = task.spawn(function()
            while AUTO_FARM_CHEST do
                pcall(function()
                    if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then
                        wait(0.5)
                        return
                    end
                    
                    if TP_FRUITS_ACTIVE and HasFruitInWorld() then
                        wait(0.5)
                        return
                    end
                    
                    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then 
                        wait(1)
                        return 
                    end
                    
                    local hrp = player.Character.HumanoidRootPart
                    local chest, distance, chestCFrame = GetNearestChest()
                    
                    if chest and chest.Parent and chestCFrame then
                        statusLabel.Text = "Chest: " .. math.floor(distance) .. "m"
                        
                        if distance > 125 then
                            Tween(chestCFrame)
                            
                            while AUTO_FARM_CHEST and chest and chest.Parent do
                                if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then break end
                                if TP_FRUITS_ACTIVE and HasFruitInWorld() then break end
                                
                                local currentDist = (hrp.Position - chestCFrame.Position).Magnitude
                                statusLabel.Text = "Tween: " .. math.floor(currentDist) .. "m"
                                
                                if currentDist <= 125 then
                                    StopTween()
                                    break
                                end
                                
                                wait(0.1)
                            end
                        end
                        
                        if chest and chest.Parent and AUTO_FARM_CHEST then
                            if not CASTLE_RAID_ACTIVE and not FACTORY_RAID_ACTIVE then
                                if not (TP_FRUITS_ACTIVE and HasFruitInWorld()) then
                                    ChestBypassTP(chestCFrame)
                                    
                                    local collectWait = 0
                                    while AUTO_FARM_CHEST and chest and chest.Parent and collectWait < 3 do
                                        pcall(function() hrp.CFrame = chestCFrame end)
                                        wait(0.1)
                                        collectWait = collectWait + 0.1
                                    end
                                end
                            end
                        end
                    else
                        local islandName, targetPos = GetNextIsland()
                        
                        if islandName and targetPos then
                            statusLabel.Text = "Island: " .. islandName
                            Tween(targetPos)
                            
                            local waitTime = 0
                            while AUTO_FARM_CHEST and waitTime < 30 do
                                if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then break end
                                if TP_FRUITS_ACTIVE and HasFruitInWorld() then break end
                                
                                local dist = (hrp.Position - targetPos.Position).Magnitude
                                if dist < 125 then
                                    StopTween()
                                    break
                                end
                                wait(0.5)
                                waitTime = waitTime + 0.5
                            end
                            
                            while AUTO_FARM_CHEST do
                                if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then break end
                                if TP_FRUITS_ACTIVE and HasFruitInWorld() then break end
                                
                                local dist = (hrp.Position - targetPos.Position).Magnitude
                                if dist < 50 then
                                    hrp.CFrame = targetPos
                                    AddVisitedIsland(islandName)
                                    break
                                else
                                    local direction = (targetPos.Position - hrp.Position).Unit
                                    local jumpDist = math.min(dist, 500)
                                    hrp.CFrame = CFrame.new(hrp.Position + (direction * jumpDist))
                                    wait(0.1)
                                end
                            end
                            
                            wait(1)
                        else
                            statusLabel.Text = "No islands!"
                            wait(1)
                        end
                    end
                end)
                wait(0.2)
            end
        end)
    end
    
    local function StopChestFarm()
        AUTO_FARM_CHEST = false
        chestButton.Text = "Auto Chest: OFF"
        chestButton.BackgroundColor3 = Color3.fromRGB(80, 80, 50)
        statusLabel.Text = ""
        if chestFarmLoop then task.cancel(chestFarmLoop) chestFarmLoop = nil end
        StopTween()
        DisableAntiGravity()
        DisableNoClip()
    end
    
    local function BringCastleEnemies()
        pcall(function()
            local hrp = player.Character.HumanoidRootPart
            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("Head") then
                    if mob.Humanoid.Health > 0 then
                        local dist = (mob.HumanoidRootPart.Position - CastlePos.Position).Magnitude
                        if dist < 1500 then
                            mob.Head.CanCollide = false
                            mob.HumanoidRootPart.CanCollide = false
                            mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            mob.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -20, 0)
                            if mob.Humanoid:FindFirstChild("Animator") then mob.Humanoid.Animator:Destroy() end
                            pcall(function() sethiddenproperty(player, "SimulationRadius", math.huge) end)
                        end
                    end
                end
            end
        end)
    end
    
    local function CastleAutoAttack()
        pcall(function()
            local chr = player.Character
            local weapon = chr:FindFirstChildOfClass("Tool")
            if not weapon or weapon.ToolTip == "Gun" then return end
            
            local Modules = ReplicatedStorage:FindFirstChild("Modules")
            local Net = Modules and Modules:FindFirstChild("Net")
            if not Net then return end
            
            local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
            local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
            
            local enemies = {}
            local basePart = nil
            
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Head") and enemy:FindFirstChild("Humanoid") then
                    if enemy.Humanoid.Health > 0 and player:DistanceFromCharacter(enemy.Head.Position) < 300 then
                        table.insert(enemies, {enemy, enemy.Head})
                        basePart = enemy.Head
                    end
                end
            end
            
            if #enemies > 0 and basePart then
                if weapon:FindFirstChild("LeftClickRemote") then
                    for _, data in pairs(enemies) do
                        if data[1]:FindFirstChild("HumanoidRootPart") then
                            local dir = (data[1].HumanoidRootPart.Position - chr:GetPivot().Position).Unit
                            weapon.LeftClickRemote:FireServer(dir, 1)
                        end
                    end
                elseif RegisterAttack and RegisterHit then
                    RegisterAttack:FireServer(0)
                    RegisterHit:FireServer(basePart, enemies)
                end
            end
        end)
    end
    
    local function StartCastleRaid()
        if CASTLE_RAID_ACTIVE then return end
        CASTLE_RAID_ACTIVE = true
        raidButton.Text = "Castle Raid: ON"
        raidButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
        
        EnableNoClip()
        EnableAntiGravity()
        
        castleRaidLoop = task.spawn(function()
            while CASTLE_RAID_ACTIVE do
                pcall(function()
                    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                    local hrp = player.Character.HumanoidRootPart
                    local dist = (CastlePos.Position - hrp.Position).Magnitude
                    
                    if dist > 150 then
                        statusLabel.Text = "Castle: " .. math.floor(dist) .. "m"
                        Tween(CastlePos)
                    else
                        local enemyCount = 0
                        for _, e in pairs(workspace.Enemies:GetChildren()) do
                            if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                                enemyCount = enemyCount + 1
                            end
                        end
                        statusLabel.Text = "Farm: " .. enemyCount .. " enemies"
                        TP(CastlePos * CFrame.new(0, 20, 0))
                    end
                end)
                wait(0.1)
            end
        end)
        
        castleBringLoop = task.spawn(function()
            while CASTLE_RAID_ACTIVE do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (CastlePos.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 200 then BringCastleEnemies() end
                    end
                end)
                wait(0.05)
            end
        end)
        
        castleAttackLoop = task.spawn(function()
            while CASTLE_RAID_ACTIVE do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (CastlePos.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 200 then
                            EquipMelee()
                            AutoHaki()
                            CastleAutoAttack()
                        end
                    end
                end)
                wait(0)
            end
        end)
    end
    
    local function StopCastleRaid()
        CASTLE_RAID_ACTIVE = false
        if raidButton then
            raidButton.Text = "Castle Raid: OFF"
            raidButton.BackgroundColor3 = Color3.fromRGB(100, 50, 100)
        end
        statusLabel.Text = ""
        if castleRaidLoop then task.cancel(castleRaidLoop) castleRaidLoop = nil end
        if castleBringLoop then task.cancel(castleBringLoop) castleBringLoop = nil end
        if castleAttackLoop then task.cancel(castleAttackLoop) castleAttackLoop = nil end
        StopTween()
        DisableAntiGravity()
        DisableNoClip()
    end
    
    local function FindCore()
        local enemies = workspace:FindFirstChild("Enemies")
        if not enemies then return nil end
        for _, enemy in pairs(enemies:GetChildren()) do
            if enemy.Name == "Core" and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                return enemy
            end
        end
        return nil
    end
    
    local function BringFactoryMobs()
        pcall(function()
            local hrp = player.Character.HumanoidRootPart
            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("Head") then
                    if mob.Humanoid.Health > 0 then
                        local dist = (mob.HumanoidRootPart.Position - FactoryPos.Position).Magnitude
                        if dist < 500 then
                            mob.Head.CanCollide = false
                            mob.HumanoidRootPart.CanCollide = false
                            mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            mob.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, -10, 0)
                            if mob.Humanoid:FindFirstChild("Animator") then mob.Humanoid.Animator:Destroy() end
                            pcall(function() sethiddenproperty(player, "SimulationRadius", math.huge) end)
                        end
                    end
                end
            end
        end)
    end
    
    local function FactoryAutoAttack()
        pcall(function()
            local chr = player.Character
            local weapon = chr:FindFirstChildOfClass("Tool")
            if not weapon or weapon.ToolTip == "Gun" then return end
            
            local Modules = ReplicatedStorage:FindFirstChild("Modules")
            local Net = Modules and Modules:FindFirstChild("Net")
            if not Net then return end
            
            local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
            local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
            
            local enemies = {}
            local basePart = nil
            
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Head") and enemy:FindFirstChild("Humanoid") then
                    if enemy.Humanoid.Health > 0 and player:DistanceFromCharacter(enemy.Head.Position) < 250 then
                        table.insert(enemies, {enemy, enemy.Head})
                        basePart = enemy.Head
                    end
                end
            end
            
            if #enemies > 0 and basePart then
                if weapon:FindFirstChild("LeftClickRemote") then
                    for _, data in pairs(enemies) do
                        if data[1]:FindFirstChild("HumanoidRootPart") then
                            local dir = (data[1].HumanoidRootPart.Position - chr:GetPivot().Position).Unit
                            weapon.LeftClickRemote:FireServer(dir, 1)
                        end
                    end
                elseif RegisterAttack and RegisterHit then
                    RegisterAttack:FireServer(0)
                    RegisterHit:FireServer(basePart, enemies)
                end
            end
        end)
    end
    
    local function StartFactoryRaid()
        if FACTORY_RAID_ACTIVE then return end
        FACTORY_RAID_ACTIVE = true
        raidButton.Text = "Factory Raid: ON"
        raidButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
        
        EnableNoClip()
        EnableAntiGravity()
        
        factoryRaidLoop = task.spawn(function()
            while FACTORY_RAID_ACTIVE do
                pcall(function()
                    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                    local hrp = player.Character.HumanoidRootPart
                    local dist = (FactoryPos.Position - hrp.Position).Magnitude
                    
                    if dist > 100 then
                        statusLabel.Text = "Factory: " .. math.floor(dist) .. "m"
                        Tween(FactoryPos)
                    else
                        local core = FindCore()
                        statusLabel.Text = core and "Core farming..." or "Waiting Core..."
                        TP(FactoryPos * CFrame.new(0, 10, 0))
                    end
                end)
                wait(0.1)
            end
        end)
        
        factoryBringLoop = task.spawn(function()
            while FACTORY_RAID_ACTIVE do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (FactoryPos.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 150 then BringFactoryMobs() end
                    end
                end)
                wait(0.05)
            end
        end)
        
        factoryAttackLoop = task.spawn(function()
            while FACTORY_RAID_ACTIVE do
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (FactoryPos.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 150 then
                            EquipMelee()
                            AutoHaki()
                            FactoryAutoAttack()
                        end
                    end
                end)
                wait(0)
            end
        end)
    end
    
    local function StopFactoryRaid()
        FACTORY_RAID_ACTIVE = false
        if raidButton then
            raidButton.Text = "Factory Raid: OFF"
            raidButton.BackgroundColor3 = Color3.fromRGB(100, 80, 50)
        end
        statusLabel.Text = ""
        if factoryRaidLoop then task.cancel(factoryRaidLoop) factoryRaidLoop = nil end
        if factoryBringLoop then task.cancel(factoryBringLoop) factoryBringLoop = nil end
        if factoryAttackLoop then task.cancel(factoryAttackLoop) factoryAttackLoop = nil end
        StopTween()
        DisableAntiGravity()
        DisableNoClip()
    end
    
    local function Round(num) 
        return math.floor(tonumber(num) + 0.5) 
    end
    
    -- FLOWER ESP SİSTEMİ (SADECE SEA 2)
    local function UpdateFlowerESP()
        if CurrentSea ~= 2 then return end
        if not MOD_ENABLED then return end
        
        pcall(function()
            local chr = player.Character
            if not chr or not chr:FindFirstChild("Head") then return end
            
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == "Flower1" or obj.Name == "Flower2" then
                    local esp = obj:FindFirstChild("FlowerESP" .. Number)
                    
                    if MOD_ENABLED then
                        local distance = Round((chr.Head.Position - obj.Position).Magnitude / 3)
                        local flowerName = obj.Name == "Flower1" and "Blue Flower" or "Red Flower"
                        local flowerColor = obj.Name == "Flower1" and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(255, 50, 50)
                        
                        if esp then
                            esp.TextLabel.Text = flowerName .. "\n" .. distance .. "m"
                        else
                            local bill = Instance.new("BillboardGui", obj)
                            bill.Name = "FlowerESP" .. Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 40)
                            bill.Adornee = obj
                            bill.AlwaysOnTop = true
                            
                            local label = Instance.new("TextLabel", bill)
                            label.Name = "TextLabel"
                            label.Font = Enum.Font.GothamBold
                            label.TextSize = 16
                            label.TextWrapped = true
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextYAlignment = Enum.TextYAlignment.Top
                            label.BackgroundTransparency = 1
                            label.TextStrokeTransparency = 0.5
                            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                            label.TextColor3 = flowerColor
                            label.Text = flowerName .. "\n" .. distance .. "m"
                        end
                    else
                        if esp then esp:Destroy() end
                    end
                end
            end
        end)
    end
    

    -- LEGENDARY SWORD DEALER ESP
local function UpdateLSDESP()
    if not MOD_ENABLED then return end
    
    pcall(function()
        local npcs = workspace:FindFirstChild("NPCs")
        if not npcs then return end
        
        local chr = player.Character
        if not chr or not chr:FindFirstChild("Head") then return end
        
        for _, npc in pairs(npcs:GetChildren()) do
            if npc.Name == "Legendary Sword Dealer" then
                local esp = npc:FindFirstChild("LSDESP" .. Number)
                
                if MOD_ENABLED then
                    local distance = Round((chr.Head.Position - npc.Position).Magnitude / 3)
                    
                    if esp then
                        esp.TextLabel.Text = npc.Name .. "\n" .. distance .. "m"
                    else
                        local bill = Instance.new("BillboardGui", npc)
                        bill.Name = "LSDESP" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = npc
                        bill.AlwaysOnTop = true
                        
                        local label = Instance.new("TextLabel", bill)
                        label.Name = "TextLabel"
                        label.Font = Enum.Font.Code
                        label.TextSize = 14
                        label.TextWrapped = true
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.TextYAlignment = Enum.TextYAlignment.Top
                        label.BackgroundTransparency = 1
                        label.TextStrokeTransparency = 0.5
                        label.TextColor3 = Color3.fromRGB(80, 245, 245)
                        label.Text = npc.Name .. "\n" .. distance .. "m"
                    end
                else
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
end

local function CleanupLSDESP()
    local npcs = workspace:FindFirstChild("NPCs")
    if not npcs then return end
    
    for _, npc in pairs(npcs:GetChildren()) do
        if npc.Name == "Legendary Sword Dealer" then
            local esp = npc:FindFirstChild("LSDESP" .. Number)
            if esp then esp:Destroy() end
        end
    end
end


    local function CleanupFlowerESP()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name == "Flower1" or obj.Name == "Flower2" then
                local esp = obj:FindFirstChild("FlowerESP" .. Number)
                if esp then esp:Destroy() end
            end
        end
    end
    
    task.spawn(function()
        while gui and gui.Parent do
            local fruits = getAllFruits()
            local flowerText = ""
            if CurrentSea == 2 and MOD_ENABLED then
                local flowerCount = 0
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "Flower1" or obj.Name == "Flower2" then
                        flowerCount = flowerCount + 1
                    end
                end
                flowerText = " | Flowers: " .. flowerCount
            end
            fruitLabel.Text = "Fruits: " .. #fruits .. (TP_FRUITS_ACTIVE and " [TP]" or "") .. flowerText
            task.wait(0.5)
        end
    end)
    
    local function AddFruitEsp(fruit)
        if not isValidFruit(fruit) then return end
        local handle = fruit:FindFirstChild("Handle")
        if not handle or handle:FindFirstChild("ESP" .. Number) then return end
        local chr = player.Character
        if not chr or not chr:FindFirstChild("Head") then return end
        
        local bill = Instance.new("BillboardGui", handle)
        bill.Name = "ESP" .. Number
        bill.ExtentsOffset = Vector3.new(0, 1, 0)
        bill.Size = UDim2.new(1, 200, 1, 30)
        bill.Adornee = handle
        bill.AlwaysOnTop = true
        
        local name = Instance.new("TextLabel", bill)
        name.Name = "Text"
        name.Font = Enum.Font.SourceSansBold
        name.TextSize = 14
        name.Size = UDim2.new(1, 0, 1, 0)
        name.TextYAlignment = Enum.TextYAlignment.Top
        name.BackgroundTransparency = 1
        name.TextStrokeTransparency = 0.5
        name.TextColor3 = Color3.fromRGB(255, 255, 0)
        name.Text = fruit.Name .. "\n" .. Round((chr.Head.Position - handle.Position).Magnitude / 3) .. "m"
    end
    
    local function UpdateFruitEsp()
        local chr = player.Character
        if not chr or not chr:FindFirstChild("Head") then return end
        for _, v in pairs(workspace:GetChildren()) do
            pcall(function()
                if isValidFruit(v) and v:FindFirstChild("Handle") then
                    local esp = v.Handle:FindFirstChild("ESP" .. Number)
                    if esp then
                        esp.Text.Text = v.Name .. "\n" .. Round((chr.Head.Position - v.Handle.Position).Magnitude / 3) .. "m"
                    else
                        AddFruitEsp(v)
                    end
                end
            end)
        end
    end
    
    local function CleanupFruitEsp()
        for _, v in pairs(workspace:GetChildren()) do
            pcall(function()
                if v:FindFirstChild("Handle") then
                    local esp = v.Handle:FindFirstChild("ESP" .. Number)
                    if esp then esp:Destroy() end
                end
            end)
        end
    end
    
    local function SetupFruitListener()
        if fruitAddedConnection then fruitAddedConnection:Disconnect() end
        fruitAddedConnection = workspace.ChildAdded:Connect(function(child)
            task.wait(0.1)
            if MOD_ENABLED and isValidFruit(child) then AddFruitEsp(child) end
        end)
    end
    
    local Camera = workspace.CurrentCamera
    
    local function createPlayerESP(character, targetPlayer)
        if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Head") then return end
        
        local nameText = Drawing.new("Text")
        nameText.Visible = false
        nameText.Center = true
        nameText.Outline = true
        nameText.Color = Color3.fromRGB(255, 255, 255)
        nameText.Size = 18
        nameText.Font = 2
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not MOD_ENABLED or not character or not character:FindFirstChild("HumanoidRootPart") or 
               not character:FindFirstChild("Head") or not character:FindFirstChild("Humanoid") or 
               character.Humanoid.Health <= 0 or not player.Character or 
               not player.Character:FindFirstChild("HumanoidRootPart") then
                nameText:Remove()
                connection:Disconnect()
                espConnections[targetPlayer.UserId] = nil
                return
            end
            
            local head = character.Head
            local localHrp = player.Character.HumanoidRootPart
            local distance = (localHrp.Position - character.HumanoidRootPart.Position).Magnitude
            local headPos = head.Position + Vector3.new(0, 2, 0)
            local headVector, onScreen = Camera:WorldToViewportPoint(headPos)
            
            if onScreen then
                nameText.Position = Vector2.new(headVector.X, headVector.Y)
                nameText.Text = targetPlayer.Name .. " (" .. math.floor(distance) .. "m)"
                nameText.Visible = true
                nameText.Color = character.Humanoid.Health / character.Humanoid.MaxHealth > 0.4 and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            else
                nameText.Visible = false
            end
        end)
        
        espConnections[targetPlayer.UserId] = {connection = connection, nameText = nameText}
    end
    
    local function CleanupPlayerESP()
        for userId, data in pairs(espConnections) do
            if data.connection then data.connection:Disconnect() end
            if data.nameText then data.nameText:Remove() end
        end
        espConnections = {}
    end
    
    local function EnableWalkWater()
        pcall(function() workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000) end)
    end
    
    local function DisableWalkWater()
        pcall(function() workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000) end)
    end
    
    UIS.JumpRequest:Connect(function()
        if MOD_ENABLED then
            pcall(function() player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
        end
    end)
    
    local activeBodyVelocity, activeBodyGyro = nil, nil
    
    local function CleanupBodyMovers()
        if activeBodyVelocity then activeBodyVelocity:Destroy() activeBodyVelocity = nil end
        if activeBodyGyro then activeBodyGyro:Destroy() activeBodyGyro = nil end
    end
    
    local function SetupBodyMovers(hrp)
        CleanupBodyMovers()
        activeBodyVelocity = Instance.new("BodyVelocity")
        activeBodyVelocity.Name = "FruitTPVelocity"
        activeBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        activeBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        activeBodyVelocity.Parent = hrp
        
        activeBodyGyro = Instance.new("BodyGyro")
        activeBodyGyro.Name = "FruitTPGyro"
        activeBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        activeBodyGyro.P = 50000
        activeBodyGyro.D = 1000
        activeBodyGyro.Parent = hrp
        
        return activeBodyVelocity, activeBodyGyro
    end
    
    local function TPAllFruits()
        if TP_FRUITS_ACTIVE then return end
        TP_FRUITS_ACTIVE = true
        tpFruitsButton.Text = "TP Fruits: ON"
        tpFruitsButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
        EnableNoClip()
        
        task.spawn(function()
            while TP_FRUITS_ACTIVE do
                if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then
                    task.wait(0.3)
                    continue
                end
                
                local nearestFruit = getNearestFruit()
                if not nearestFruit then task.wait(0.3) continue end
                
                local handle = nearestFruit:FindFirstChild("Handle")
                if not handle then task.wait(0.1) continue end
                
                local chr = player.Character
                local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
                if not hrp then task.wait(0.1) continue end
                
                local bv, bg = SetupBodyMovers(hrp)
                
                while TP_FRUITS_ACTIVE and isValidFruit(nearestFruit) do
                    if CASTLE_RAID_ACTIVE or FACTORY_RAID_ACTIVE then
                        CleanupBodyMovers()
                        break
                    end
                    
                    local currentHandle = nearestFruit:FindFirstChild("Handle")
                    if not currentHandle then break end
                    
                    local targetPos = currentHandle.Position
                    local direction = (targetPos - hrp.Position)
                    local dist = direction.Magnitude
                    
                    if dist < 2 then
                        bv.Velocity = Vector3.new(0, 0, 0)
                        hrp.CFrame = CFrame.new(targetPos)
                        local waitTime = 0
                        while isValidFruit(nearestFruit) and waitTime < 2 and TP_FRUITS_ACTIVE do
                            local h = nearestFruit:FindFirstChild("Handle")
                            if h then hrp.CFrame = CFrame.new(h.Position) end
                            task.wait(0.05)
                            waitTime = waitTime + 0.05
                        end
                        break
                    end
                    
                    bv.Velocity = direction.Unit * speed
                    bg.CFrame = CFrame.new(hrp.Position, targetPos)
                    task.wait()
                end
                
                CleanupBodyMovers()
                task.wait(0.1)
            end
            
            CleanupBodyMovers()
            DisableNoClip()
            TP_FRUITS_ACTIVE = false
            tpFruitsButton.Text = "TP Fruits: OFF"
            tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
        end)
    end
    
    local function StopTPFruits()
        TP_FRUITS_ACTIVE = false
        CleanupBodyMovers()
        DisableNoClip()
        tpFruitsButton.Text = "TP Fruits: OFF"
        tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    end
    
    local function StartAutoStore()
        autoStoreLoop = task.spawn(function()
            while AUTO_STORE_ENABLED do
                pcall(function()
                    local chr = player.Character
                    local backpack = player:FindFirstChild("Backpack")
                    if chr then
                        for _, item in pairs(chr:GetChildren()) do
                            if item:IsA("Tool") and string.find(item.Name, "Fruit") then
                                local fruitName = item.Name:gsub(" Fruit", "")
                                if CommF_ then CommF_:InvokeServer("StoreFruit", fruitName .. "-" .. fruitName, item) end
                            end
                        end
                    end
                    if backpack then
                        for _, item in pairs(backpack:GetChildren()) do
                            if item:IsA("Tool") and string.find(item.Name, "Fruit") then
                                local fruitName = item.Name:gsub(" Fruit", "")
                                if CommF_ then CommF_:InvokeServer("StoreFruit", fruitName .. "-" .. fruitName, item) end
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    end
    
    local function StopAutoStore()
        if autoStoreLoop then task.cancel(autoStoreLoop) autoStoreLoop = nil end
    end
    
local function enableAllHacks()
    local character = player.Character
    if not character then return end
    local hum = character:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    
    renderConnection = RunService.RenderStepped:Connect(function()
        if MOD_ENABLED and character and hum and not TP_FRUITS_ACTIVE and not CASTLE_RAID_ACTIVE and not FACTORY_RAID_ACTIVE and not AUTO_FARM_CHEST and not ISLAND_TP_ACTIVE then
            hum.WalkSpeed = speed
            character:SetAttribute("DashLength", 200)
            character:SetAttribute("DashSpeed", 200)
        end
    end)
    
    EnableWalkWater()
    for _, v in pairs(workspace:GetChildren()) do
        if isValidFruit(v) then AddFruitEsp(v) end
    end
    SetupFruitListener()
    
    -- Flower ESP Loop (Sea 2 için)
    if CurrentSea == 2 then
        flowerEspLoop = task.spawn(function()
            while MOD_ENABLED do
                UpdateFlowerESP()
                task.wait(1)
            end
        end)
    end
    
    -- LSD ESP Loop (Her saniyede kontrol) ← BURASI ÖNEMLİ
    lsdEspLoop = task.spawn(function()
        while MOD_ENABLED do
            UpdateLSDESP()
            task.wait(1)
        end
    end)
    
    local Modules = ReplicatedStorage:FindFirstChild("Modules")
    local Net = Modules and Modules:FindFirstChild("Net")
    if Net then
        local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
        local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
        local Enemies = workspace:FindFirstChild("Enemies")
        local Characters = workspace:FindFirstChild("Characters")
        
        if RegisterAttack and RegisterHit then
            local function IsAlive(chr) return chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.Health > 0 end
            local function ProcessEnemies(OthersEnemies, Folder)
                if not Folder then return nil end
                local BasePart = nil
                for _, Enemy in Folder:GetChildren() do
                    local Head = Enemy:FindFirstChild("Head")
                    if Head and IsAlive(Enemy) and player:DistanceFromCharacter(Head.Position) < 100 and Enemy ~= player.Character then
                        table.insert(OthersEnemies, {Enemy, Head})
                        BasePart = Head
                    end
                end
                return BasePart
            end
            
            autoAttackConnection = RunService.RenderStepped:Connect(function()
                if MOD_ENABLED and not TP_FRUITS_ACTIVE and not CASTLE_RAID_ACTIVE and not FACTORY_RAID_ACTIVE and not AUTO_FARM_CHEST and not ISLAND_TP_ACTIVE then
                    local chr = player.Character
                    if chr and IsAlive(chr) then
                        local OthersEnemies = {}
                        local Part1 = ProcessEnemies(OthersEnemies, Enemies)
                        local Part2 = ProcessEnemies(OthersEnemies, Characters)
                        local equippedWeapon = chr:FindFirstChildOfClass("Tool")
                        
                        if equippedWeapon and equippedWeapon:FindFirstChild("LeftClickRemote") then
                            for _, enemyData in ipairs(OthersEnemies) do
                                local enemy = enemyData[1]
                                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                                    pcall(function()
                                        equippedWeapon.LeftClickRemote:FireServer((enemy.HumanoidRootPart.Position - chr:GetPivot().Position).Unit, 1)
                                    end)
                                end
                            end
                        elseif #OthersEnemies > 0 and (Part1 or Part2) then
                            pcall(function()
                                RegisterAttack:FireServer(0)
                                RegisterHit:FireServer(Part1 or Part2, OthersEnemies)
                            end)
                        end
                    end
                end
            end)
        end
    end
    
    fruitEspLoop = task.spawn(function()
        while MOD_ENABLED do UpdateFruitEsp() task.wait(0.5) end
    end)
    
    for _, targetPlayer in pairs(Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character then
            createPlayerESP(targetPlayer.Character, targetPlayer)
        end
    end
    
    Players.PlayerAdded:Connect(function(targetPlayer)
        targetPlayer.CharacterAdded:Connect(function(character)
            if MOD_ENABLED then task.wait(0.5) createPlayerESP(character, targetPlayer) end
        end)
    end)
end
    
    local function disableAllHacks()
        local character = player.Character
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = defaultSpeed end
        if character then character:SetAttribute("DashLength", nil) character:SetAttribute("DashSpeed", nil) end
        
        if renderConnection then renderConnection:Disconnect() renderConnection = nil end
        if autoAttackConnection then autoAttackConnection:Disconnect() autoAttackConnection = nil end
        if fruitEspLoop then task.cancel(fruitEspLoop) fruitEspLoop = nil end
        if flowerEspLoop then task.cancel(flowerEspLoop) flowerEspLoop = nil end
        if fruitAddedConnection then fruitAddedConnection:Disconnect() fruitAddedConnection = nil end
        
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupFlowerESP()
        CleanupPlayerESP()
        CleanupBodyMovers()
        CleanupLSDESP()
        DisableNoClip()
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        MOD_ENABLED = not MOD_ENABLED
        toggleButton.Text = MOD_ENABLED and "Mod: ON" or "Mod: OFF"
        toggleButton.BackgroundColor3 = MOD_ENABLED and Color3.fromRGB(45, 140, 45) or Color3.fromRGB(140, 45, 45)
        if MOD_ENABLED then enableAllHacks() else disableAllHacks() end
    end)
    
    autoStoreButton.MouseButton1Click:Connect(function()
        AUTO_STORE_ENABLED = not AUTO_STORE_ENABLED
        autoStoreButton.Text = AUTO_STORE_ENABLED and "Auto Store: ON" or "Auto Store: OFF"
        autoStoreButton.BackgroundColor3 = AUTO_STORE_ENABLED and Color3.fromRGB(45, 140, 45) or Color3.fromRGB(140, 45, 45)
        if AUTO_STORE_ENABLED then StartAutoStore() else StopAutoStore() end
    end)
    
    tpFruitsButton.MouseButton1Click:Connect(function()
        if TP_FRUITS_ACTIVE then StopTPFruits() else TPAllFruits() end
    end)
    
    chestButton.MouseButton1Click:Connect(function()
        if AUTO_FARM_CHEST then StopChestFarm() else StartChestFarm() end
    end)
    
    if raidButton then
        raidButton.MouseButton1Click:Connect(function()
            if CurrentSea == 2 then
                if FACTORY_RAID_ACTIVE then StopFactoryRaid() else StartFactoryRaid() end
            elseif CurrentSea == 3 then
                if CASTLE_RAID_ACTIVE then StopCastleRaid() else StartCastleRaid() end
            end
        end)
    end
    
    humanoid.Died:Connect(function()
        if autoAttackConnection then autoAttackConnection:Disconnect() autoAttackConnection = nil end
        if renderConnection then renderConnection:Disconnect() renderConnection = nil end
        if fruitEspLoop then task.cancel(fruitEspLoop) fruitEspLoop = nil end
        if flowerEspLoop then task.cancel(flowerEspLoop) flowerEspLoop = nil end
        if fruitAddedConnection then fruitAddedConnection:Disconnect() fruitAddedConnection = nil end
        
        TP_FRUITS_ACTIVE = false
        
        if CASTLE_RAID_ACTIVE then StopCastleRaid() end
        if FACTORY_RAID_ACTIVE then StopFactoryRaid() end
        if AUTO_FARM_CHEST then StopChestFarm() end
        
        statusLabel.Text = ""
        CleanupBodyMovers()
        DisableNoClip()
        DisableAntiGravity()
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupFlowerESP()
        CleanupLSDESP() 
        CleanupPlayerESP()
        StopTween()
    end)
    
    gui.Destroying:Connect(function()
        disableAllHacks()
        StopAutoStore()
        CleanupLSDESP()
        StopTPFruits()
        StopChestFarm()
        if CurrentSea == 2 then StopFactoryRaid() end
        if CurrentSea == 3 then StopCastleRaid() end
        CleanupFlowerESP()
    end)
end

player.CharacterAdded:Connect(function(newChar)
    newChar:SetAttribute("DashLength", nil)
    newChar:SetAttribute("DashSpeed", nil)
    if player.PlayerGui:FindFirstChild("SyntaskkAIO") then
        player.PlayerGui.SyntaskkAIO:Destroy()
    end
    initializeSyntaskk()
end)

initializeSyntaskk()
print("[Syntaskk AIO] Loaded - Sea " .. GetSea())
