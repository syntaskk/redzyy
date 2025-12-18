local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local placeId = game.PlaceId

local Settings = {
    WeaponType = _G.WeaponType or "Fruit",
    FarmDistance = _G.FarmDistance or 15,
    AutoHaki = true,
    BossWaitTime = 20
}

print("[Settings] WeaponType: " .. Settings.WeaponType)
print("[Settings] FarmDistance: " .. Settings.FarmDistance)

if _G.BossFarmRunning then return end
_G.BossFarmRunning = true

local scriptCode = [[
_G.WeaponType = "]] .. Settings.WeaponType .. [["
_G.FarmDistance = ]] .. Settings.FarmDistance .. [[

loadstring(game:HttpGet"https://raw.githubusercontent.com/syntaskk/redzyy/refs/heads/main/realoneee.luau")()
]]

pcall(function() queue_on_teleport(scriptCode) end)

local CommF_ = nil
pcall(function() CommF_ = ReplicatedStorage:WaitForChild("Remotes", 10):WaitForChild("CommF_", 10) end)

local function getSeaNumber()
    if placeId == 2753915549 then return 1
    elseif placeId == 4442272183 then return 2
    elseif placeId == 7449423635 then return 3 end
    return 1
end

local MainBoss = {
    [1] = {Name = "Cyborg", Position = CFrame.new(6138, 10, 3939)},
    [2] = {Name = "Tide Keeper", Position = CFrame.new(-3711, 77, -11469)},
    [3] = {Name = "Cake Queen", Position = CFrame.new(-710, 382, -11150)}
}

local noClipConnection = nil
local currentTween = nil
local tweenGyro = nil
local tweenVelocity = nil
local hakiActivated = false
local hopRequested = false
local firstSpawn = true
local weaponEquipLoop = nil

local function CleanupBodyMovers()
    local chr = player.Character
    if chr then
        local hrp = chr:FindFirstChild("HumanoidRootPart")
        if hrp then
            for _, obj in pairs(hrp:GetChildren()) do
                if obj:IsA("BodyVelocity") or obj:IsA("BodyGyro") then
                    obj:Destroy()
                end
            end
        end
    end
    tweenGyro = nil
    tweenVelocity = nil
end

local function StopTween()
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
end

local function SetupAntiGravity()
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    CleanupBodyMovers()
    local hum = chr:FindFirstChild("Humanoid")
    if hum then
        hum.PlatformStand = false
        hum.Sit = false
    end
    tweenVelocity = Instance.new("BodyVelocity")
    tweenVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tweenVelocity.Velocity = Vector3.new(0, 0, 0)
    tweenVelocity.Parent = hrp
    tweenGyro = Instance.new("BodyGyro")
    tweenGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    tweenGyro.P = 50000
    tweenGyro.D = 1000
    tweenGyro.CFrame = hrp.CFrame
    tweenGyro.Parent = hrp
end

local function Tween(pos)
    StopTween()
    SetupAntiGravity()
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local distance = (hrp.Position - pos.Position).Magnitude
    local timeToReach = distance / 250
    if timeToReach < 0.1 then
        hrp.CFrame = pos
        return nil
    end
    currentTween = TweenService:Create(hrp, TweenInfo.new(timeToReach, Enum.EasingStyle.Linear), {CFrame = pos})
    currentTween:Play()
    return currentTween
end

local function WaitForTween(tween)
    if not tween then return end
    repeat task.wait(0.1) until tween.PlaybackState ~= Enum.PlaybackState.Playing
end

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

local function TP(pos)
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = pos end
end

local function findBossInEnemies(bossName)
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    local foundBosses = {}
    for _, enemy in pairs(enemies:GetChildren()) do
        if enemy.Name == bossName then
            local hum = enemy:FindFirstChild("Humanoid")
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 0 then
                table.insert(foundBosses, {enemy = enemy, health = hum.Health})
            end
        end
    end
    if #foundBosses > 0 then
        table.sort(foundBosses, function(a, b) return a.health > b.health end)
        return foundBosses[1].enemy
    end
    return nil
end

local function isBossAlive(bossName)
    for attempt = 1, 3 do
        local enemy = findBossInEnemies(bossName)
        if enemy then 
            local hum = enemy:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                return true, enemy
            end
        end
        if attempt < 3 then task.wait(0.3) end
    end
    return false, nil
end

local function getServers()
    local servers = {}
    pcall(function()
        for i = 1, 3 do
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
            local response = game:HttpGet(url)
            local data = HttpService:JSONDecode(response)
            if data and data.data then
                for _, server in pairs(data.data) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        table.insert(servers, server)
                    end
                end
            end
            task.wait(0.5)
        end
    end)
    return servers
end

local function serverHop()
    if hopRequested then return end
    hopRequested = true
    print("[Hop] Searching server...")
    while true do
        pcall(function()
            local servers = getServers()
            if #servers == 0 then
                TeleportService:Teleport(placeId, player)
            else
                local randomServer = servers[math.random(1, #servers)]
                print("[Hop] Found: " .. tostring(randomServer.playing) .. "/" .. tostring(randomServer.maxPlayers))
                TeleportService:TeleportToPlaceInstance(placeId, randomServer.id, player)
            end
        end)
        task.wait(2)
    end
end

local function selectTeam()
    for i = 1, 50 do
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end)
        local exists = false
        pcall(function() exists = player.PlayerGui["Main (minimal)"].ChooseTeam.Visible end)
        if not exists then
            print("[Team] Pirates")
            return true
        end
        task.wait(0.2)
    end
    return false
end

local function Equip(ToolSe)
    local Tool
    if player.Backpack:FindFirstChild(ToolSe) then
        Tool = player.Backpack:FindFirstChild(ToolSe)
    elseif player.Character and player.Character:FindFirstChild(ToolSe) then
        Tool = player.Character:FindFirstChild(ToolSe)
    end
    if Tool and player.Character then
        Tool.Parent = player.Character
    end
end

local function GetToolByType(toolType)
    local targetToolTip
    if toolType == "Melee" then
        targetToolTip = "Melee"
    elseif toolType == "Fruit" then
        targetToolTip = "BloxFruit"
    elseif toolType == "Sword" then
        targetToolTip = "Sword"
    else
        return nil
    end
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.ToolTip == targetToolTip then
            return tool.Name
        end
    end
    if player.Character then
        for _, tool in pairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == targetToolTip then
                return tool.Name
            end
        end
    end
    return nil
end

local function equipWeapon()
    local chr = player.Character
    if not chr then return false end
    local toolName = GetToolByType(Settings.WeaponType)
    if not toolName then return false end
    local currentTool = chr:FindFirstChildOfClass("Tool")
    if currentTool and currentTool.Name == toolName then return true end
    Equip(toolName)
    return true
end

local function activateHaki()
    if not Settings.AutoHaki then return end
    if hakiActivated then return end
    pcall(function()
        if CommF_ then
            CommF_:InvokeServer("Buso")
            hakiActivated = true
        end
    end)
end

local function startWeaponEquipLoop()
    if weaponEquipLoop then return end
    weaponEquipLoop = task.spawn(function()
        while true do
            pcall(function()
                equipWeapon()
                activateHaki()
            end)
            task.wait(0.5)
        end
    end)
end

task.spawn(function()
    while true do
        pcall(function()
            local chr = player.Character
            local backpack = player:FindFirstChild("Backpack")
            local function storeFruit(item)
                if item:IsA("Tool") and string.find(item.Name, "Fruit") then
                    if item.ToolTip ~= "BloxFruit" then
                        local fruitName = item.Name:gsub(" Fruit", "")
                        if CommF_ then
                            CommF_:InvokeServer("StoreFruit", fruitName .. "-" .. fruitName, item)
                        end
                    end
                end
            end
            if chr then
                for _, item in pairs(chr:GetChildren()) do storeFruit(item) end
            end
            if backpack then
                for _, item in pairs(backpack:GetChildren()) do storeFruit(item) end
            end
        end)
        task.wait(0.5)
    end
end)

local function startFastAttack()
    local Enemies = workspace:FindFirstChild("Enemies")
    task.spawn(function()
        while true do
            pcall(function()
                local chr = player.Character
                local tool = chr and chr:FindFirstChildOfClass("Tool")
                if tool and tool.ToolTip ~= "Gun" then
                    local Modules = ReplicatedStorage:FindFirstChild("Modules")
                    local Net = Modules and Modules:FindFirstChild("Net")
                    local RegisterAttack = Net and Net:FindFirstChild("RE/RegisterAttack")
                    local RegisterHit = Net and Net:FindFirstChild("RE/RegisterHit")
                    local OthersEnemies = {}
                    local BasePart = nil
                    if Enemies then
                        for _, enemy in pairs(Enemies:GetChildren()) do
                            local head = enemy:FindFirstChild("Head")
                            local hum = enemy:FindFirstChild("Humanoid")
                            if head and hum and hum.Health > 0 then
                                if player:DistanceFromCharacter(head.Position) < 300 then
                                    table.insert(OthersEnemies, {enemy, head})
                                    BasePart = head
                                end
                            end
                        end
                    end
                    if #OthersEnemies > 0 and RegisterAttack and RegisterHit then
                        RegisterAttack:FireServer(0)
                        RegisterHit:FireServer(BasePart, OthersEnemies)
                    end
                    if tool:FindFirstChild("LeftClickRemote") then
                        for _, data in pairs(OthersEnemies) do
                            local enemy = data[1]
                            local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
                            if enemyHRP then
                                local dir = (enemyHRP.Position - chr:GetPivot().Position).Unit
                                tool.LeftClickRemote:FireServer(dir, 1)
                            end
                        end
                    end
                end
            end)
            task.wait(0)
        end
    end)
end

task.spawn(function()
    while true do
        pcall(function()
            local chr = player.Character
            local hum = chr and chr:FindFirstChild("Humanoid")
            if hum and (hum.Sit or hum:GetState() == Enum.HumanoidStateType.Seated) then
                hum.Jump = true
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        task.wait(0.1)
    end
end)

player.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local function farmBoss(bossData)
    SetupAntiGravity()
    local lastBossCheck = tick()
    local bossLostTime = nil
    while true do
        if tick() - lastBossCheck >= 2 then
            local alive = isBossAlive(bossData.Name)
            if not alive then
                if not bossLostTime then
                    bossLostTime = tick()
                    print("[Boss] Lost, waiting 3s...")
                end
                if tick() - bossLostTime >= 3 then
                    print("[Boss] Dead confirmed")
                    return true
                end
            else
                bossLostTime = nil
            end
            lastBossCheck = tick()
        end
        local bossObj = findBossInEnemies(bossData.Name)
        if bossObj then
            local bossHRP = bossObj:FindFirstChild("HumanoidRootPart")
            if bossHRP then
                TP(CFrame.new(bossHRP.Position + Vector3.new(0, Settings.FarmDistance, 0)))
            end
        else
            TP(bossData.Position * CFrame.new(0, Settings.FarmDistance, 0))
        end
        task.wait(0.1)
    end
end

local function mainLoop()
    local seaNumber = getSeaNumber()
    local bossData = MainBoss[seaNumber]
    print("[Sea " .. seaNumber .. "] Boss: " .. bossData.Name)
    local tween = Tween(bossData.Position * CFrame.new(0, Settings.FarmDistance, 0))
    WaitForTween(tween)
    SetupAntiGravity()
    TP(bossData.Position * CFrame.new(0, Settings.FarmDistance, 0))
    task.wait(1)
    local alive = isBossAlive(bossData.Name)
    if alive then
        print("[Boss] Alive, farming...")
        farmBoss(bossData)
        print("[Boss] Dead, hopping...")
        task.wait(1)
        serverHop()
    else
        print("[Wait] No boss, waiting " .. Settings.BossWaitTime .. "s...")
        local waitStartTime = tick()
        while tick() - waitStartTime < Settings.BossWaitTime do
            local remainingTime = math.ceil(Settings.BossWaitTime - (tick() - waitStartTime))
            alive = isBossAlive(bossData.Name)
            if alive then
                print("[Boss] Spawned, farming...")
                farmBoss(bossData)
                print("[Boss] Dead, hopping...")
                task.wait(1)
                serverHop()
                return
            end
            if remainingTime % 5 == 0 then
                print("[Wait] " .. remainingTime .. "s left...")
            end
            TP(bossData.Position * CFrame.new(0, Settings.FarmDistance, 0))
            task.wait(1)
        end
        print("[Timeout] No boss, hopping...")
        serverHop()
    end
end

task.spawn(function()
    repeat task.wait(0.5) until game:IsLoaded()
    task.wait(2)
    print("[Start] Boss Farm")
    selectTeam()
    task.wait(1)
    pcall(function() if CommF_ then CommF_:InvokeServer("Cousin", "Buy") end end)
    repeat task.wait(0.5) until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    EnableNoClip()
    SetupAntiGravity()
    startFastAttack()
    startWeaponEquipLoop()
    task.wait(0.5)
    equipWeapon()
    while true do
        pcall(function() mainLoop() end)
        task.wait(1)
    end
end)

player.CharacterAdded:Connect(function(char)
    local hrp = char:WaitForChild("HumanoidRootPart", 10)
    local hum = char:WaitForChild("Humanoid", 10)
    if not hrp or not hum then return end
    task.wait(1)
    if hum then
        hum.PlatformStand = false
        hum.Sit = false
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Freefall) end)
    end
    StopTween()
    CleanupBodyMovers()
    task.wait(0.5)
    if firstSpawn then
        firstSpawn = false
    else
        hakiActivated = false
    end
    EnableNoClip()
    task.wait(0.2)
    SetupAntiGravity()
    task.wait(0.3)
    weaponEquipLoop = nil
    startWeaponEquipLoop()
    task.wait(0.3)
    equipWeapon()
    task.wait(0.2)
    activateHaki()
    print("[Respawn] Ready")
end)

print("[Init] Ready")
