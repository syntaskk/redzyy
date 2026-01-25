local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local placeId = game.PlaceId
local speed = 340

local FACTORY_POSITION = CFrame.new(448.46756, 199.356781, -441.389252)
local WAIT_AFTER_CORE = 15
local EARLY_HOP_TIME = 5

local WEBHOOK_URL = "YOUR_WEBHOOK_URL_HERE"

local RareFruits = {
    "Buddha", "Love", "Spider", "Sound", "Phoenix", "Portal", "Lightning",
    "Pain", "Blizzard", "Gravity", "Mammoth", "T-Rex", "Dough", "Shadow",
    "Venom", "Gas", "Control", "Spirit", "Tiger", "Yeti", "Kitsune",
    "Dragon", "WestDragon", "EastDragon", "West Dragon", "East Dragon"
}

if _G.FruitFarmRunning then return end
_G.FruitFarmRunning = true

local hopRequested = false
local noClipConnection = nil
local antiGravityConnection = nil
local currentTween = nil
local hakiActivated = false

local CommF_ = nil
pcall(function() CommF_ = ReplicatedStorage:WaitForChild("Remotes", 10):WaitForChild("CommF_", 10) end)

local function isRareFruit(fruitName)
    for _, rare in ipairs(RareFruits) do
        if fruitName:lower():find(rare:lower()) then
            return true
        end
    end
    return false
end

local function sendWebhook(fruitName)
    if WEBHOOK_URL == "YOUR_WEBHOOK_URL_HERE" then return end
    pcall(function()
        local data = {
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "Rare Fruit Found",
                ["description"] = "**" .. fruitName .. "** has been found",
                ["color"] = 65280,
                ["fields"] = {
                    {["name"] = "Server", ["value"] = tostring(game.JobId), ["inline"] = true},
                    {["name"] = "Place", ["value"] = tostring(placeId), ["inline"] = true},
                    {["name"] = "Player", ["value"] = player.Name, ["inline"] = true},
                    {["name"] = "Time", ["value"] = os.date("%H:%M:%S"), ["inline"] = true}
                },
                ["footer"] = {["text"] = "Blox Fruits Farm"}
            }}
        }
        local jsonData = HttpService:JSONEncode(data)
        local headers = {["Content-Type"] = "application/json"}
        request({Url = WEBHOOK_URL, Method = "POST", Headers = headers, Body = jsonData})
    end)
end

player.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

local function EnableNoClip()
    if noClipConnection then return end
    noClipConnection = RunService.Stepped:Connect(function()
        pcall(function()
            local chr = player.Character
            if chr then
                for _, part in pairs(chr:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end)
end

local function EnableAntiGravity()
    if antiGravityConnection then return end
    antiGravityConnection = RunService.Heartbeat:Connect(function()
        pcall(function()
            local chr = player.Character
            if not chr then return end
            local hrp = chr:FindFirstChild("HumanoidRootPart")
            local hum = chr:FindFirstChild("Humanoid")
            if not hrp then return end
            if hum then
                hum.PlatformStand = false
                hum.Sit = false
            end
            local bv = hrp:FindFirstChild("FarmBV")
            if not bv then
                bv = Instance.new("BodyVelocity")
                bv.Name = "FarmBV"
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.zero
                bv.Parent = hrp
            end
            bv.Velocity = Vector3.zero
            local bg = hrp:FindFirstChild("FarmBG")
            if not bg then
                bg = Instance.new("BodyGyro")
                bg.Name = "FarmBG"
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.P = 50000
                bg.D = 1000
                bg.Parent = hrp
            end
            bg.CFrame = hrp.CFrame
        end)
    end)
end

local function StopTween()
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
end

local function Tween(pos)
    StopTween()
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local distance = (hrp.Position - pos.Position).Magnitude
    local timeToReach = distance / speed
    if timeToReach < 0.1 then
        hrp.CFrame = pos
        return nil
    end
    currentTween = TweenService:Create(hrp, TweenInfo.new(timeToReach, Enum.EasingStyle.Linear), {CFrame = pos})
    currentTween:Play()
    return currentTween
end

local function WaitForTween()
    if not currentTween then return end
    repeat task.wait(0.1) until currentTween.PlaybackState ~= Enum.PlaybackState.Playing
end

local function TP(pos)
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = pos end
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

local function GetMeleeTool()
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.ToolTip == "Melee" then
            return tool.Name
        end
    end
    if player.Character then
        for _, tool in pairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == "Melee" then
                return tool.Name
            end
        end
    end
    return nil
end

local function equipMelee()
    local chr = player.Character
    if not chr then return false end
    local toolName = GetMeleeTool()
    if not toolName then return false end
    local currentTool = chr:FindFirstChildOfClass("Tool")
    if currentTool and currentTool.Name == toolName then return true end
    Equip(toolName)
    return true
end

local function activateHaki()
    if hakiActivated then return end
    pcall(function()
        if CommF_ then
            CommF_:InvokeServer("Buso")
            hakiActivated = true
        end
    end)
end

task.spawn(function()
    while true do
        pcall(function()
            equipMelee()
            activateHaki()
        end)
        task.wait(0.5)
    end
end)

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
        if isValidFruit(v) then
            table.insert(fruits, v)
        end
    end
    return fruits
end

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
    return nearestFruit
end

local function findCore()
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    for _, enemy in pairs(enemies:GetChildren()) do
        if enemy.Name == "Core" then
            local hum = enemy:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                return enemy
            end
        end
    end
    return nil
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
            wait(0.5)
        end
    end)
    return servers
end

local function serverHop()
    if hopRequested then return end
    hopRequested = true
    print("[Hop] Searching...")
    while true do
        pcall(function()
            local servers = getServers()
            if #servers == 0 then
                TeleportService:Teleport(placeId, player)
            else
                local randomServer = servers[math.random(1, #servers)]
                print("[Hop] " .. randomServer.playing .. "/" .. randomServer.maxPlayers)
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

local function tryRollFruit()
    pcall(function()
        if CommF_ then CommF_:InvokeServer("Cousin", "Buy") end
    end)
end

task.spawn(function()
    while true do
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

local function startFastAttack()
    task.spawn(function()
        while true do
            pcall(function()
                local chr = player.Character
                local tool = chr and chr:FindFirstChildOfClass("Tool")
                if tool and tool.ToolTip ~= "Gun" then
                    local Enemies = workspace:FindFirstChild("Enemies")
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
                                if player:DistanceFromCharacter(head.Position) < 500 then
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
            task.wait(0.05)
        end
    end)
end

local function goToFactory()
    print("[Factory] Going...")
    Tween(FACTORY_POSITION)
    WaitForTween()
    TP(FACTORY_POSITION)
end

local function farmCore()
    local core = findCore()
    if not core then return false end
    print("[Core] Farming...")
    while findCore() do
        local currentCore = findCore()
        if currentCore then
            local coreHRP = currentCore:FindFirstChild("HumanoidRootPart")
            if coreHRP then
                TP(CFrame.new(coreHRP.Position + Vector3.new(0, 10, 0)))
            end
        end
        task.wait(0.1)
    end
    print("[Core] Dead")
    return true
end

local function collectFruit(fruit)
    local chr = player.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local handle = fruit:FindFirstChild("Handle")
    if not handle then return false end
    local fruitName = fruit.Name
    if isRareFruit(fruitName) then
        print("[RARE] " .. fruitName .. " found, sending webhook...")
        sendWebhook(fruitName)
    end
    local startTime = tick()
    while isValidFruit(fruit) do
        if tick() - startTime > 15 then break end
        if findCore() then break end
        local currentHandle = fruit:FindFirstChild("Handle")
        if not currentHandle then break end
        local targetPos = currentHandle.Position
        local dist = (hrp.Position - targetPos).Magnitude
        if dist < 3 then
            TP(CFrame.new(targetPos))
            local waitTime = 0
            while isValidFruit(fruit) and waitTime < 2 do
                local h = fruit:FindFirstChild("Handle")
                if h then TP(CFrame.new(h.Position)) end
                task.wait(0.05)
                waitTime = waitTime + 0.05
            end
            break
        end
        Tween(CFrame.new(targetPos))
        task.wait(0.1)
    end
    StopTween()
    if not isValidFruit(fruit) then
        print("[Collected] " .. fruitName)
        return true
    end
    return false
end

local function collectAllFruits()
    local collected = false
    while true do
        if findCore() then break end
        local nearestFruit = getNearestFruit()
        if not nearestFruit then break end
        if collectFruit(nearestFruit) then
            collected = true
        end
        task.wait(0.2)
    end
    return collected
end

local function mainLoop()
    local core = findCore()
    if core then
        goToFactory()
        farmCore()
        print("[Wait] " .. WAIT_AFTER_CORE .. "s fruit check...")
        local fruitFound = false
        local noFruitTime = 0
        for i = WAIT_AFTER_CORE, 1, -1 do
            if findCore() then
                print("[Core] Spawned during wait, going to factory...")
                goToFactory()
                farmCore()
                fruitFound = false
                noFruitTime = 0
            end
            local fruits = getAllFruits()
            if #fruits > 0 then
                print("[Fruit] " .. #fruits .. " found")
                collectAllFruits()
                fruitFound = true
                noFruitTime = 0
            else
                noFruitTime = noFruitTime + 1
            end
            if noFruitTime >= EARLY_HOP_TIME and not fruitFound then
                print("[Skip] No fruits for " .. EARLY_HOP_TIME .. "s, hopping...")
                break
            end
            if i % 5 == 0 then
                print("[Wait] " .. i .. "s...")
            end
            task.wait(1)
        end
        local finalFruits = getAllFruits()
        if #finalFruits > 0 then
            print("[Fruit] Final " .. #finalFruits)
            collectAllFruits()
        end
        serverHop()
    else
        local fruits = getAllFruits()
        if #fruits > 0 then
            print("[Fruit] " .. #fruits .. " found")
            collectAllFruits()
            print("[Check] 5s checking after fruit collection...")
            for i = 1, EARLY_HOP_TIME do
                if findCore() then
                    print("[Core] Found after fruit collection, going to factory...")
                    goToFactory()
                    farmCore()
                    print("[Wait] " .. WAIT_AFTER_CORE .. "s fruit check...")
                    local noFruitTime = 0
                    for j = WAIT_AFTER_CORE, 1, -1 do
                        if findCore() then
                            goToFactory()
                            farmCore()
                            noFruitTime = 0
                        end
                        local moreFruits = getAllFruits()
                        if #moreFruits > 0 then
                            collectAllFruits()
                            noFruitTime = 0
                        else
                            noFruitTime = noFruitTime + 1
                        end
                        if noFruitTime >= EARLY_HOP_TIME then break end
                        task.wait(1)
                    end
                    serverHop()
                    return
                end
                local moreFruits = getAllFruits()
                if #moreFruits > 0 then
                    collectAllFruits()
                    i = 0
                end
                task.wait(1)
            end
            serverHop()
        else
            print("[None] No fruits or core, checking...")
            local foundSomething = false
            for i = 1, EARLY_HOP_TIME do
                if findCore() then
                    print("[Core] Found, going to factory...")
                    goToFactory()
                    farmCore()
                    foundSomething = true
                    print("[Wait] " .. WAIT_AFTER_CORE .. "s fruit check...")
                    local noFruitTime = 0
                    for j = WAIT_AFTER_CORE, 1, -1 do
                        if findCore() then
                            goToFactory()
                            farmCore()
                            noFruitTime = 0
                        end
                        local moreFruits = getAllFruits()
                        if #moreFruits > 0 then
                            collectAllFruits()
                            noFruitTime = 0
                        else
                            noFruitTime = noFruitTime + 1
                        end
                        if noFruitTime >= EARLY_HOP_TIME then break end
                        task.wait(1)
                    end
                    serverHop()
                    return
                end
                local checkFruits = getAllFruits()
                if #checkFruits > 0 then
                    print("[Fruit] " .. #checkFruits .. " found")
                    collectAllFruits()
                    foundSomething = true
                    for k = 1, EARLY_HOP_TIME do
                        if findCore() then
                            goToFactory()
                            farmCore()
                            serverHop()
                            return
                        end
                        local moreCheckFruits = getAllFruits()
                        if #moreCheckFruits > 0 then
                            collectAllFruits()
                            k = 0
                        end
                        task.wait(1)
                    end
                    serverHop()
                    return
                end
                print("[Check] " .. i .. "/" .. EARLY_HOP_TIME .. "s")
                task.wait(1)
            end
            if not foundSomething then
                print("[None] Nothing spawned, hopping...")
            end
            serverHop()
        end
    end
end

task.spawn(function()
    repeat task.wait(0.5) until game:IsLoaded()
    task.wait(1)
    print("[Start] Fruit Farm + Factory")
    selectTeam()
    task.wait(2)
    repeat task.wait(0.5) until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    EnableNoClip()
    EnableAntiGravity()
    startFastAttack()
    tryRollFruit()
    task.wait(1)
    while true do
        pcall(function()
            mainLoop()
        end)
        task.wait(1)
    end
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    StopTween()
    hakiActivated = false
    EnableNoClip()
    EnableAntiGravity()
end)

print("[Init] Ready")
