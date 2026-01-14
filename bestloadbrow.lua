local targetServer = _G.TargetServerName
if not targetServer then 
    print("❌ Error: _G.TargetServerName not set!")
    return 
end

local __ServerBrowser = game.ReplicatedStorage:WaitForChild("__ServerBrowser")
local adjectives = {"Big", "Small", "Large", "Strong", "Powerful", "Weak", "Overpowered", "Bad", "Odd", "Rich", "Short", "Adorable", "Alive", "Colorful", "Angry", "Good", "Beautiful", "Ugly", "Hot", "Cold", "Evil", "Famous", "Original", "Unoriginal", "Kind", "Nice", "Real", "Expensive", "Wild", "Wide", "Fake", "Proud", "Super", "Strange", "Wrong", "Right", "Talented", "Complex", "Pure", "Fancy", "Lucky", "Fresh", "Fantastic", "Dull", "Dizzy", "Eternal", "Mental", "Infinite", "Rogue"}
local nouns = {"TAWG", "Robson", "Krazy", "Fruit", "Realm", "World", "Place", "Experience", "Dog", "Cat", "Guy", "Bird", "Legion", "Gank", "Family", "Sun", "Moon", "Gun", "Sword", "Melee", "Defense", "Bomb", "Spike", "Chop", "Spring", "Smoke", "Flame", "Ice", "Sand", "Dark", "Light", "Rubber", "Barrier", "Magma", "Tiger", "Quake", "Buddha", "Spider", "Phoenix", "Rumble", "Love", "Door", "Paw", "Gravity", "Dough", "Venom", "Control", "Dragon", "Falcon", "Diamond", "Kilo", "Shark", "Human", "Angel", "Rabbit", "Spin", "Topic", "Red", "Blue", "Green", "Yellow", "Soul", "Shadow"}

local function getName(jobId)
    local r = Random.new(tonumber("0x"..jobId:gsub('-', ""):sub(1, 7)) or 0)
    return adjectives[r:NextInteger(1, #adjectives)]..' '..nouns[r:NextInteger(1, #nouns)].." #"..string.format("%04d", r:NextInteger(1, 9999))
end

print("🔍 Searching for: " .. targetServer)
print("⏳ Loading servers...")

local servers = {}
local done = 0
local maxPages = 500

for i = 1, maxPages do
    task.spawn(function()
        local s, r = pcall(function() return __ServerBrowser:InvokeServer(i) end)
        if s and r then
            for j, d in pairs(r) do
                d.Job = j
                d.Name = getName(j)
                table.insert(servers, d)
            end
        end
        done = done + 1
    end)
    if i % 20 == 0 then task.wait(0.2) end
end

repeat 
    task.wait(0.5)
    print("📊 Progress: " .. done .. "/" .. maxPages .. " pages loaded (" .. #servers .. " servers)")
until done >= maxPages

print("✅ Total servers loaded: " .. #servers)
print("🔎 Searching for target server...")

local found = false
for _, s in ipairs(servers) do
    if s.Name:lower() == targetServer:lower() then
        found = true
        print("✅ Server found!")
        print("🏷️ Name: " .. s.Name)
        print("📍 Region: " .. (s.Region or "Unknown"))
        print("👥 Players: " .. (s.Count or 0))
        print("🚀 Joining server...")
        __ServerBrowser:InvokeServer("teleport", s.Job)
        break
    end
end

if not found then
    print("❌ Server not found after checking " .. #servers .. " servers")
end
