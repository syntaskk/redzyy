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

-- CommF_ Remote
local CommF_ = nil
pcall(function()
    CommF_ = ReplicatedStorage:WaitForChild("Remotes", 10):WaitForChild("CommF_", 10)
end)

local function initializeSyntaskk()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "SyntaskkAIO"
    gui.ResetOnSpawn = false
    
    local MOD_ENABLED = false
    local AUTO_STORE_ENABLED = false
    local TP_FRUITS_ACTIVE = false
    local speed = 350
    local defaultSpeed = 16
    local Number = math.random(1, 1000000)
    
    local renderConnection = nil
    local autoAttackConnection = nil
    local fruitEspLoop = nil
    local autoStoreLoop = nil
    local fruitAddedConnection = nil
    local espConnections = {}
    local tpLoopConnection = nil
    local noClipConnection = nil
    
    -- Ana Frame
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 200, 0, 160)
    mainFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
    mainFrame.BorderSizePixel = 1
    
    -- Title
    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 28)
    title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    title.BorderSizePixel = 0
    title.Text = "Syntaskk All in One"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 13
    title.Font = Enum.Font.SourceSansBold
    
    -- Mod Toggle
    local toggleButton = Instance.new("TextButton", mainFrame)
    toggleButton.Size = UDim2.new(1, -10, 0, 26)
    toggleButton.Position = UDim2.new(0, 5, 0, 33)
    toggleButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
    toggleButton.BorderColor3 = Color3.fromRGB(80, 80, 80)
    toggleButton.BorderSizePixel = 1
    toggleButton.Text = "Mod: OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 12
    toggleButton.Font = Enum.Font.SourceSans
    
    -- Auto Store Toggle
    local autoStoreButton = Instance.new("TextButton", mainFrame)
    autoStoreButton.Size = UDim2.new(1, -10, 0, 26)
    autoStoreButton.Position = UDim2.new(0, 5, 0, 64)
    autoStoreButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
    autoStoreButton.BorderColor3 = Color3.fromRGB(80, 80, 80)
    autoStoreButton.BorderSizePixel = 1
    autoStoreButton.Text = "Auto Store: OFF"
    autoStoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoStoreButton.TextSize = 12
    autoStoreButton.Font = Enum.Font.SourceSans
    
    -- TP Fruits Button
    local tpFruitsButton = Instance.new("TextButton", mainFrame)
    tpFruitsButton.Size = UDim2.new(1, -10, 0, 26)
    tpFruitsButton.Position = UDim2.new(0, 5, 0, 95)
    tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    tpFruitsButton.BorderColor3 = Color3.fromRGB(80, 80, 80)
    tpFruitsButton.BorderSizePixel = 1
    tpFruitsButton.Text = "TP All Fruits"
    tpFruitsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tpFruitsButton.TextSize = 12
    tpFruitsButton.Font = Enum.Font.SourceSans
    
    -- Fruit Label
    local fruitLabel = Instance.new("TextLabel", mainFrame)
    fruitLabel.Size = UDim2.new(1, 0, 0, 20)
    fruitLabel.Position = UDim2.new(0, 0, 0, 126)
    fruitLabel.BackgroundTransparency = 1
    fruitLabel.Text = "Fruits: 0"
    fruitLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    fruitLabel.TextSize = 11
    fruitLabel.Font = Enum.Font.SourceSans
    
    -- Sürükleme
    local dragging = false
    local dragInput, mousePos, framePos
    
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            mainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
    
    -- NoClip Fonksiyonları
    local function EnableNoClip()
        if noClipConnection then return end
        noClipConnection = RunService.Stepped:Connect(function()
            local chr = player.Character
            if chr then
                for _, part in pairs(chr:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
    
    local function DisableNoClip()
        if noClipConnection then
            noClipConnection:Disconnect()
            noClipConnection = nil
        end
    end
    
    -- Valid Fruit
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
    
    -- Get All Fruits
    local function getAllFruits()
        local fruits = {}
        for _, v in pairs(workspace:GetChildren()) do
            if isValidFruit(v) then
                table.insert(fruits, v)
            end
        end
        return fruits
    end
    
    -- En yakın meyve
    local function getNearestFruit()
        local chr = player.Character
        local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        
        local nearestFruit = nil
        local nearestDistance = math.huge
        
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
    
    -- Fruit Sayacı
    task.spawn(function()
        while gui and gui.Parent do
            local fruits = getAllFruits()
            local status = ""
            if TP_FRUITS_ACTIVE then
                status = " [TP]"
            end
            fruitLabel.Text = "Fruits: " .. #fruits .. status
            task.wait(0.5)
        end
    end)
    
    local function Round(num)
        return math.floor(tonumber(num) + 0.5)
    end
    
    -- Fruit ESP ekle
    local function AddFruitEsp(fruit)
        if not isValidFruit(fruit) then return end
        local handle = fruit:FindFirstChild("Handle")
        if not handle then return end
        if handle:FindFirstChild("ESP" .. Number) then return end
        
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
        name.TextWrapped = true
        name.Size = UDim2.new(1, 0, 1, 0)
        name.TextYAlignment = Enum.TextYAlignment.Top
        name.BackgroundTransparency = 1
        name.TextStrokeTransparency = 0.5
        name.TextColor3 = Color3.fromRGB(255, 255, 0)
        name.Text = fruit.Name .. "\n" .. Round((chr.Head.Position - handle.Position).Magnitude / 3) .. "m"
    end
    
    -- Fruit ESP güncelle
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
    
    -- Yeni meyve listener
    local function SetupFruitListener()
        if fruitAddedConnection then
            fruitAddedConnection:Disconnect()
        end
        
        fruitAddedConnection = workspace.ChildAdded:Connect(function(child)
            task.wait(0.1)
            if MOD_ENABLED and isValidFruit(child) then
                AddFruitEsp(child)
            end
        end)
    end
    
    -- Player ESP
    local Camera = workspace.CurrentCamera
    
    local function createPlayerESP(character, targetPlayer)
        if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Head") then
            return
        end
        
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
            local hrp = character.HumanoidRootPart
            local localHrp = player.Character.HumanoidRootPart
            
            local distance = (localHrp.Position - hrp.Position).Magnitude
            local headPos = head.Position + Vector3.new(0, 2, 0)
            local headVector, onScreen = Camera:WorldToViewportPoint(headPos)
            
            if onScreen then
                nameText.Position = Vector2.new(headVector.X, headVector.Y)
                nameText.Text = targetPlayer.Name .. " (" .. math.floor(distance) .. "m)"
                nameText.Visible = true
                
                local healthPercent = character.Humanoid.Health / character.Humanoid.MaxHealth
                if healthPercent > 0.4 then
                    nameText.Color = Color3.fromRGB(0, 255, 0)
                else
                    nameText.Color = Color3.fromRGB(255, 0, 0)
                end
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
    
    -- Walk on Water
    local function EnableWalkWater()
        pcall(function()
            workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
        end)
    end
    
    local function DisableWalkWater()
        pcall(function()
            workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
        end)
    end
    
    -- Infinite Jump
    UIS.JumpRequest:Connect(function()
        if MOD_ENABLED then
            local c = player.Character
            if c and c:FindFirstChild("Humanoid") then
                c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    -- =============================================
    -- TP FRUITS - BODYVELOCITY SİSTEMİ
    -- =============================================
    
    local activeBodyVelocity = nil
    local activeBodyGyro = nil
    
    local function CleanupBodyMovers()
        if activeBodyVelocity then
            activeBodyVelocity:Destroy()
            activeBodyVelocity = nil
        end
        if activeBodyGyro then
            activeBodyGyro:Destroy()
            activeBodyGyro = nil
        end
    end
    
    local function SetupBodyMovers(hrp)
        CleanupBodyMovers()
        
        -- BodyVelocity - hareket için
        activeBodyVelocity = Instance.new("BodyVelocity")
        activeBodyVelocity.Name = "FruitTPVelocity"
        activeBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        activeBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        activeBodyVelocity.Parent = hrp
        
        -- BodyGyro - rotasyon için
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
        tpFruitsButton.Text = "Stop TP"
        tpFruitsButton.BackgroundColor3 = Color3.fromRGB(130, 90, 40)
        
        EnableNoClip()
        
        task.spawn(function()
            while TP_FRUITS_ACTIVE do
                local nearestFruit, distance = getNearestFruit()
                
                if not nearestFruit then
                    task.wait(0.3)
                    continue
                end
                
                local handle = nearestFruit:FindFirstChild("Handle")
                if not handle then
                    task.wait(0.1)
                    continue
                end
                
                local chr = player.Character
                local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
                local hum = chr and chr:FindFirstChild("Humanoid")
                
                if not hrp or not hum then
                    task.wait(0.1)
                    continue
                end
                
                -- BodyMovers kur
                local bv, bg = SetupBodyMovers(hrp)
                
                -- Meyveye git
                while TP_FRUITS_ACTIVE and isValidFruit(nearestFruit) do
                    local currentHandle = nearestFruit:FindFirstChild("Handle")
                    if not currentHandle then break end
                    
                    local targetPos = currentHandle.Position
                    local currentPos = hrp.Position
                    local direction = (targetPos - currentPos)
                    local dist = direction.Magnitude
                    
                    -- Meyvenin içine girdik mi?
                    if dist < 2 then
                        -- Tam içinde kal
                        bv.Velocity = Vector3.new(0, 0, 0)
                        hrp.CFrame = CFrame.new(targetPos)
                        
                        -- Meyve alınana kadar bekle
                        local waitTime = 0
                        while isValidFruit(nearestFruit) and waitTime < 2 and TP_FRUITS_ACTIVE do
                            local h = nearestFruit:FindFirstChild("Handle")
                            if h then
                                hrp.CFrame = CFrame.new(h.Position)
                            end
                            task.wait(0.05)
                            waitTime = waitTime + 0.05
                        end
                        break
                    end
                    
                    -- Hedefe doğru hız ver
                    local moveDir = direction.Unit
                    bv.Velocity = moveDir * speed
                    
                    -- Yöne bak
                    bg.CFrame = CFrame.new(currentPos, targetPos)
                    
                    task.wait()
                end
                
                CleanupBodyMovers()
                task.wait(0.1)
            end
            
            CleanupBodyMovers()
            DisableNoClip()
            TP_FRUITS_ACTIVE = false
            tpFruitsButton.Text = "TP All Fruits"
            tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
        end)
    end
    
    local function StopTPFruits()
        TP_FRUITS_ACTIVE = false
        CleanupBodyMovers()
        DisableNoClip()
        tpFruitsButton.Text = "TP All Fruits"
        tpFruitsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    end
    
    -- Auto Store
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
                                if CommF_ then
                                    CommF_:InvokeServer("StoreFruit", fruitName .. "-" .. fruitName, item)
                                end
                            end
                        end
                    end
                    
                    if backpack then
                        for _, item in pairs(backpack:GetChildren()) do
                            if item:IsA("Tool") and string.find(item.Name, "Fruit") then
                                local fruitName = item.Name:gsub(" Fruit", "")
                                if CommF_ then
                                    CommF_:InvokeServer("StoreFruit", fruitName .. "-" .. fruitName, item)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
    end
    
    local function StopAutoStore()
        if autoStoreLoop then
            task.cancel(autoStoreLoop)
            autoStoreLoop = nil
        end
    end
    
    -- Enable All
    local function enableAllHacks()
        local character = player.Character
        if not character then return end
        local hum = character:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        
        renderConnection = RunService.RenderStepped:Connect(function()
            if MOD_ENABLED and character and hum and not TP_FRUITS_ACTIVE then
                hum.WalkSpeed = speed
                character:SetAttribute("DashLength", 200)
                character:SetAttribute("DashSpeed", 200)
            end
        end)
        
        EnableWalkWater()
        
        for _, v in pairs(workspace:GetChildren()) do
            if isValidFruit(v) then
                AddFruitEsp(v)
            end
        end
        
        SetupFruitListener()
        
        _G.FastAttack = true
        local Modules = ReplicatedStorage:FindFirstChild("Modules")
        local Net = Modules and Modules:FindFirstChild("Net")
        if Net then
            local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
            local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
            local Enemies = workspace:FindFirstChild("Enemies")
            local Characters = workspace:FindFirstChild("Characters")
            
            if RegisterAttack and RegisterHit then
                local function IsAlive(chr)
                    return chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.Health > 0
                end
                
                local function ProcessEnemies(OthersEnemies, Folder)
                    if not Folder then return nil end
                    local BasePart = nil
                    for _, Enemy in Folder:GetChildren() do
                        local Head = Enemy:FindFirstChild("Head")
                        if Head and IsAlive(Enemy) and player:DistanceFromCharacter(Head.Position) < 100 then
                            if Enemy ~= player.Character then
                                table.insert(OthersEnemies, {Enemy, Head})
                                BasePart = Head
                            end
                        end
                    end
                    return BasePart
                end
                
                autoAttackConnection = RunService.RenderStepped:Connect(function()
                    if MOD_ENABLED and not TP_FRUITS_ACTIVE then
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
                                        local direction = (enemy.HumanoidRootPart.Position - chr:GetPivot().Position).Unit
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
                    end
                end)
            end
        end
        
        fruitEspLoop = task.spawn(function()
            while MOD_ENABLED do
                UpdateFruitEsp()
                task.wait(0.5)
            end
        end)
        
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                createPlayerESP(targetPlayer.Character, targetPlayer)
            end
        end
        
        Players.PlayerAdded:Connect(function(targetPlayer)
            targetPlayer.CharacterAdded:Connect(function(character)
                if MOD_ENABLED then
                    task.wait(0.5)
                    createPlayerESP(character, targetPlayer)
                end
            end)
        end)
    end
    
    local function disableAllHacks()
        local character = player.Character
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        
        if hum then hum.WalkSpeed = defaultSpeed end
        if character then
            character:SetAttribute("DashLength", nil)
            character:SetAttribute("DashSpeed", nil)
        end
        
        if renderConnection then renderConnection:Disconnect() renderConnection = nil end
        if autoAttackConnection then autoAttackConnection:Disconnect() autoAttackConnection = nil end
        if fruitEspLoop then task.cancel(fruitEspLoop) fruitEspLoop = nil end
        if fruitAddedConnection then fruitAddedConnection:Disconnect() fruitAddedConnection = nil end
        
        _G.FastAttack = false
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupPlayerESP()
        CleanupBodyMovers()
        DisableNoClip()
    end
    
    -- Buton Events
    toggleButton.MouseButton1Click:Connect(function()
        MOD_ENABLED = not MOD_ENABLED
        if MOD_ENABLED then
            toggleButton.Text = "Mod: ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
            enableAllHacks()
        else
            toggleButton.Text = "Mod: OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
            disableAllHacks()
        end
    end)
    
    autoStoreButton.MouseButton1Click:Connect(function()
        AUTO_STORE_ENABLED = not AUTO_STORE_ENABLED
        if AUTO_STORE_ENABLED then
            autoStoreButton.Text = "Auto Store: ON"
            autoStoreButton.BackgroundColor3 = Color3.fromRGB(45, 140, 45)
            StartAutoStore()
        else
            autoStoreButton.Text = "Auto Store: OFF"
            autoStoreButton.BackgroundColor3 = Color3.fromRGB(140, 45, 45)
            StopAutoStore()
        end
    end)
    
    tpFruitsButton.MouseButton1Click:Connect(function()
        if TP_FRUITS_ACTIVE then
            StopTPFruits()
        else
            TPAllFruits()
        end
    end)
    
    -- Death Cleanup
    humanoid.Died:Connect(function()
        local chr = player.Character
        if chr then
            chr:SetAttribute("DashLength", nil)
            chr:SetAttribute("DashSpeed", nil)
        end
        
        if autoAttackConnection then autoAttackConnection:Disconnect() autoAttackConnection = nil end
        if renderConnection then renderConnection:Disconnect() renderConnection = nil end
        if fruitEspLoop then task.cancel(fruitEspLoop) fruitEspLoop = nil end
        if fruitAddedConnection then fruitAddedConnection:Disconnect() fruitAddedConnection = nil end
        
        _G.FastAttack = false
        TP_FRUITS_ACTIVE = false
        CleanupBodyMovers()
        DisableNoClip()
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupPlayerESP()
    end)
    
    gui.Destroying:Connect(function()
        disableAllHacks()
        StopAutoStore()
        StopTPFruits()
    end)
end

player.CharacterAdded:Connect(function(newChar)
    newChar:SetAttribute("DashLength", nil)
    newChar:SetAttribute("DashSpeed", nil)
    _G.FastAttack = false
    
    if player.PlayerGui:FindFirstChild("SyntaskkAIO") then
        player.PlayerGui.SyntaskkAIO:Destroy()
    end
    
    initializeSyntaskk()
end)

initializeSyntaskk()
