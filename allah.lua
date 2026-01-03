local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local function initializeAllahMod()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "AllahMod"
    gui.ResetOnSpawn = false
    
    local ALLAH_MOD_ENABLED = false
    local speed = 350
    local defaultSpeed = 16
    local Number = math.random(1, 1000000)
    
    local renderConnection = nil
    local autoAttackConnection = nil
    local fruitEspLoop = nil
    local espConnections = {}
    
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 180, 0, 80)
    mainFrame.Position = UDim2.new(0.5, -90, 0.1, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)
    
    local title = Instance.new("TextLabel", mainFrame)
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "Allah Mod"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    
    local toggleButton = Instance.new("TextButton", mainFrame)
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0.85, 0, 0, 30)
    toggleButton.Position = UDim2.new(0.075, 0, 0, 28)
    toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 16
    toggleButton.Font = Enum.Font.GothamBold
    Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)
    
    local fruitLabel = Instance.new("TextLabel", mainFrame)
    fruitLabel.Name = "FruitLabel"
    fruitLabel.Size = UDim2.new(1, 0, 0, 18)
    fruitLabel.Position = UDim2.new(0, 0, 1, -20)
    fruitLabel.BackgroundTransparency = 1
    fruitLabel.Text = "Fruit in Server: 0"
    fruitLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    fruitLabel.TextSize = 11
    fruitLabel.Font = Enum.Font.Gotham
    
    -- Sürüklenebilir
    local dragging = false
    local dragInput, mousePos, framePos
    
    mainFrame.InputBegan:Connect(function(input)
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
    
    mainFrame.InputChanged:Connect(function(input)
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
    
    -- Fruit Sayacı (Her zaman çalışır)
    task.spawn(function()
        while gui and gui.Parent do
            local fruitCount = 0
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name ~= "Blox Fruit Dealer" and string.find(v.Name, "Fruit") and v:IsA("Model") then
                    fruitCount = fruitCount + 1
                end
            end
            fruitLabel.Text = "Fruit in Server: " .. fruitCount
            task.wait(1)
        end
    end)
    
    -- Yardımcı Fonksiyon
    local function Round(num)
        return math.floor(tonumber(num) + 0.5)
    end
    
    -- Fruit ESP
    local function UpdateFruitEsp()
        for _, v in pairs(workspace:GetChildren()) do
            pcall(function()
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        
                        local name = Instance.new("TextLabel", bill)
                        name.Name = "TextLabel"
                        name.Font = Enum.Font.GothamBold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        name.Text = v.Name .. " \n" .. Round((player.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text = v.Name .. " \n" .. Round((player.Character.Head.Position - v.Handle.Position).Magnitude / 3) .. " M"
                    end
                end
            end)
        end
    end
    
    local function CleanupFruitEsp()
        for _, v in pairs(workspace:GetChildren()) do
            pcall(function()
                if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    local esp = v.Handle:FindFirstChild("NameEsp" .. Number)
                    if esp then esp:Destroy() end
                end
            end)
        end
    end
    
    -- Player ESP (Drawing API - Senin Yaptığın)
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
        nameText.Size = 20
        nameText.Font = 2
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not ALLAH_MOD_ENABLED or not character or not character:FindFirstChild("HumanoidRootPart") or 
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
            local headPos = head.Position + Vector3.new(0, head.Size.Y / 2 + 1.5, 0)
            local headVector, onScreen = Camera:WorldToViewportPoint(headPos)
            
            if onScreen then
                nameText.Position = Vector2.new(headVector.X, headVector.Y)
                nameText.Text = targetPlayer.Name .. " | " .. math.floor(distance) .. " M"
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
    
    -- Walk on Water (Cokka Hub - Size Değiştirme)
    local function EnableWalkWater()
        pcall(function()
            game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
        end)
    end
    
    local function DisableWalkWater()
        pcall(function()
            game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
        end)
    end
    
    -- Infinite Jump
    UIS.JumpRequest:Connect(function()
        if ALLAH_MOD_ENABLED then
            local c = player.Character
            if c and c:FindFirstChild("Humanoid") then
                c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    local function enableAllHacks()
        local character = player.Character
        if not character then return end
        local hum = character:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        
        -- Speed + Dash
        renderConnection = RunService.RenderStepped:Connect(function()
            if ALLAH_MOD_ENABLED and character and hum then
                hum.WalkSpeed = speed
                character:SetAttribute("DashLength", 100)
                character:SetAttribute("DashSpeed", 100)
            end
        end)
        
        -- Walk on Water
        EnableWalkWater()
        
        -- Auto Attack
        _G.FastAttack = true
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Modules = ReplicatedStorage:FindFirstChild("Modules")
        local Net = Modules and Modules:FindFirstChild("Net")
        if Net then
            local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
            local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
            local Enemies = workspace:FindFirstChild("Enemies")
            local Characters = workspace:FindFirstChild("Characters")
            
            if RegisterAttack and RegisterHit then
                local Distance = 100
                
                local function IsAlive(chr)
                    return chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.Health > 0
                end
                
                local function ProcessEnemies(OthersEnemies, Folder)
                    if not Folder then return nil end
                    local BasePart = nil
                    for _, Enemy in Folder:GetChildren() do
                        local Head = Enemy:FindFirstChild("Head")
                        if Head and IsAlive(Enemy) and player:DistanceFromCharacter(Head.Position) < Distance then
                            if Enemy ~= player.Character then
                                table.insert(OthersEnemies, {Enemy, Head})
                                BasePart = Head
                            end
                        end
                    end
                    return BasePart
                end
                
                autoAttackConnection = RunService.RenderStepped:Connect(function()
                    if ALLAH_MOD_ENABLED then
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
        
        -- Fruit ESP Loop
        fruitEspLoop = task.spawn(function()
            while ALLAH_MOD_ENABLED do
                UpdateFruitEsp()
                task.wait(1)
            end
        end)
        
        -- Player ESP (Drawing API)
        for _, targetPlayer in pairs(Players:GetPlayers()) do
            if targetPlayer ~= player and targetPlayer.Character then
                createPlayerESP(targetPlayer.Character, targetPlayer)
            end
        end
        
        Players.PlayerAdded:Connect(function(targetPlayer)
            targetPlayer.CharacterAdded:Connect(function(character)
                if ALLAH_MOD_ENABLED then
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
        
        _G.FastAttack = false
        
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupPlayerESP()
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        ALLAH_MOD_ENABLED = not ALLAH_MOD_ENABLED
        
        if ALLAH_MOD_ENABLED then
            toggleButton.Text = "ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
            enableAllHacks()
        else
            toggleButton.Text = "OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
            disableAllHacks()
        end
    end)
    
    humanoid.Died:Connect(function()
        local chr = player.Character
        if chr then
            chr:SetAttribute("DashLength", nil)
            chr:SetAttribute("DashSpeed", nil)
        end
        
        if autoAttackConnection then autoAttackConnection:Disconnect() autoAttackConnection = nil end
        if renderConnection then renderConnection:Disconnect() renderConnection = nil end
        if fruitEspLoop then task.cancel(fruitEspLoop) fruitEspLoop = nil end
        
        _G.FastAttack = false
        DisableWalkWater()
        CleanupFruitEsp()
        CleanupPlayerESP()
    end)
    
    gui.Destroying:Connect(function()
        disableAllHacks()
    end)
end

player.CharacterAdded:Connect(function(newChar)
    newChar:SetAttribute("DashLength", nil)
    newChar:SetAttribute("DashSpeed", nil)
    _G.FastAttack = false
    
    if player.PlayerGui:FindFirstChild("AllahMod") then
        player.PlayerGui.AllahMod:Destroy()
    end
    
    initializeAllahMod()
end)

initializeAllahMod()
