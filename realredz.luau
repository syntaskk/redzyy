-- ts file was generated at discord.gg/25ms


local v1 = nil
local vu2 = getgenv and getgenv() or {}
local vu3
if redzHubModule then
    vu3 = redzHubModule
else
    vu3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/Functions.Lua"))()
    vu2.redzHubModule = vu3
end
local vu4 = vu3.FireRemote
local vu5 = vu3.ServerHop
local vu6 = vu3.VerifyNPC
local vu7 = vu3.ActiveHaki
local vu8 = vu3.GetEnemies
local vu9 = vu3.IsAlive
local vu10 = vu3.KillAura
local vu11 = vu3.BringNPC
local _ = vu3.BladeHitAttack
local vu12 = vu3.GetEnemiesList
local _ = vu3.requestClick
local vu13 = vu3.PlayerClick
local vu14 = vu3.AimBotPart
local vu15 = vu3.WaitPart
local v16 = vu3.FarmCheck
local vu17 = v16.VerifyFactory
local vu18 = v16.VerifyRaidPirate
local v19 = vu3.Inventory
local vu20 = v19.GetMaterial
local vu21 = v19.ItemMastery
local vu22 = v19.VerifyItem
local vu23 = vu3.TweenBlock
local vu24 = game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
local vu25 = game:GetService("TweenService")
local vu26 = game:GetService("VirtualUser")
game:GetService("HttpService")
local vu27 = game:GetService("RunService")
local vu28 = game:GetService("Lighting")
local vu29 = game:GetService("Players")
vu24:WaitForChild("Remotes", 9000000000):WaitForChild("CommF_", 9000000000)
local vu30 = workspace:WaitForChild("SeaBeasts", 9000000000)
local vu31 = workspace:WaitForChild("Enemies", 9000000000)
local vu32 = workspace:WaitForChild("Boats", 9000000000)
local vu33 = workspace:WaitForChild("NPCs", 9000000000)
local vu34 = workspace:WaitForChild("Map", 9000000000)
local _ = workspace.CurrentCamera
local vu35 = vu29.LocalPlayer
vu35:GetMouse()
local vu36 = vu15(vu35, "Data", "Level")
local v37 = vu35.UserId == 2764978820
local vu38 = vu3.MaxLevel or 2550
local vu39 = {}
local v40 = game.PlaceId
local v41 = v40 == 2753915549
local v42 = v40 == 4442272183
local vu43 = v40 == 7449423635
local vu44 = v42
local vu45 = v41
vu2.FarmPos = Vector3.new(0, 15, 15)
vu2.FarmDistance = 20
vu2.TweenSpeed = 200
vu2.BringMobsDistance = 250
vu2.AutoClickDelay = 0.2
vu2.Team = _G.Team or (vu2.Team or "Pirates")
local vu46 = vu15(vu35, "PlayerGui", "Main")
local vu47 = {
    "Activated",
    "MouseButton1Click",
    "MouseButton1Down",
    "MouseButton1Up"
}
local function vu57(p48)
	-- upvalues: (ref) vu47
    local v49 = next
    local v50 = vu47
    local v51 = nil
    while true do
        local v52
        v51, v52 = v49(v50, v51)
        if v51 == nil then
            break
        end
        local v53 = next
        local v54, v55 = getconnections(p48[v52])
        while true do
            local v56
            v55, v56 = v53(v54, v55)
            if v55 == nil then
                break
            end
            pcall(v56.Function)
        end
    end
end
if vu46:FindFirstChild("ChooseTeam") then
    for _ = 1, 25 do
        task.wait()
        pcall(function()
			-- upvalues: (ref) vu2, (ref) vu57, (ref) vu46
            if vu2.Team:lower():find("pirate") then
                vu57(vu46.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton)
            else
                vu57(vu46.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton)
            end
        end)
    end
end
task.spawn(function()
	-- upvalues: (ref) vu35, (ref) vu23, (ref) vu2
    repeat
        task.wait()
    until vu35.Character and vu35.Character.PrimaryPart
    vu23.CFrame = vu35.Character.PrimaryPart.CFrame
    while task.wait(0.1) do
        if vu2.FarmingNearest or (vu2.TeleportToIsland or (vu2.FinishTrial or (vu2.MiragePuzzle or (vu2.KillTrialPlayers or (vu2.AFruitDealer or (vu2.AutoWoodPlanks or (vu2.AutoFarm_Level or (vu2.FarmingSea or (vu2.TrainRace or (vu2.AutoFarmSea or (vu2.EliteHunter or (vu2.PiratesSea or (vu2.FarmingBossSelected or (vu2.UnlockRengoku or (vu2.TeleportingToFruit or (vu2.FarmingFactory or (vu2.BartiloQuest or (vu2.FarmingRaid or (vu2.Sea2_AutoFarmSea or (vu2.RaceV2 or (vu2.RaceV3 or (vu2.AutoCakePrince or (vu2.AutoDoughKing or (vu2.RipIndraLegendaryHaki or (vu2.RipIndra or (vu2.UnlockSaber or (vu2.AutoSawBoss or (vu2.AutoEnelBossPole or (vu2.CitizenQuest or (vu2.AutoFarmKen or (vu2.AutoFarmBone or (vu2.CursedCaptain or (vu2.AutoFarmEctoplasm or (vu2.AutoKitsuneIsland or (vu2.SoulReaper or (vu2.TeleportGear or (vu2.SoulGuitar or (vu2.CursedDualKatana or (vu2.TeleportToMirage or (vu2.FarmingSecondSea or (vu2.AutoThirdSea or (vu2.FarmingDarkbeard or (vu2.FarmingLawBoss or (vu2.AutoChestTween or (vu2.AutoRainbowHaki or (vu2.AutoFarmMaterial or (vu2.AutoSharkmanKarate or (vu2.AutoKillDonSwan or (vu2.AutoDeathStep or (vu2.AutoDragonTalon or (vu2.AutoElectricClaw or (vu2.AutoSuperhuman or (vu2.AutoGodHuman or (vu2.UnlockTushita or (vu2.AutoFarmMastery or (vu2.NPCtween or (vu2.HutingPlayer or (vu2.FarmingAllBosses or (vu2.RaceDoor or (vu2.FinishTrial or vu2.AutoDummy)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
            vu2.OnFarm = true
        else
            vu2.OnFarm = false
        end
    end
end)
local vu58 = {
    ["rbxassetid://15060012861"] = "Rocket-Rocket",
    ["rbxassetid://15057683975"] = "Spin-Spin",
    ["rbxassetid://15104782377"] = "Chop-Chop",
    ["rbxassetid://15105281957"] = "Spring-Spring",
    ["rbxassetid://15116740364"] = "Bomb-Bomb",
    ["rbxassetid://15116696973"] = "Smoke-Smoke",
    ["rbxassetid://15107005807"] = "Spike-Spike",
    ["rbxassetid://15111584216"] = "Flame-Flame",
    ["rbxassetid://15112469964"] = "Falcon-Falcon",
    ["rbxassetid://15100433167"] = "Ice-Ice",
    ["rbxassetid://15111517529"] = "Sand-Sand",
    ["rbxassetid://15111553409"] = "Dark-Dark",
    ["rbxassetid://15112600534"] = "Diamond-Diamond",
    ["rbxassetid://15100283484"] = "Light-Light",
    ["rbxassetid://15104817760"] = "Rubber-Rubber",
    ["rbxassetid://15100485671"] = "Barrier-Barrier",
    ["rbxassetid://15112333093"] = "Ghost-Ghost",
    ["rbxassetid://15105350415"] = "Magma-Magma",
    ["rbxassetid://15057718441"] = "Quake-Quake",
    ["rbxassetid://15100313696"] = "Buddha-Buddha",
    ["rbxassetid://15116730102"] = "Love-Love",
    ["rbxassetid://15116967784"] = "Spider-Spider",
    ["rbxassetid://14661873358"] = "Sound-Sound",
    ["rbxassetid://15100246632"] = "Phoenix-Phoenix",
    ["rbxassetid://15112215862"] = "Portal-Portal",
    ["rbxassetid://15116747420"] = "Rumble-Rumble",
    ["rbxassetid://15116721173"] = "Pain-Pain",
    ["rbxassetid://15100384816"] = "Blizzard-Blizzard",
    ["rbxassetid://15100299740"] = "Gravity-Gravity",
    ["rbxassetid://14661837634"] = "Mammoth-Mammoth",
    ["rbxassetid://15708895165"] = "T-Rex-T-Rex",
    ["rbxassetid://15100273645"] = "Dough-Dough",
    ["rbxassetid://15112263502"] = "Shadow-Shadow",
    ["rbxassetid://15100184583"] = "Control-Control",
    ["rbxassetid://15106768588"] = "Leopard-Leopard",
    ["rbxassetid://15482881956"] = "Kitsune-Kitsune",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10395893751"] = "Venom-Venom",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10537896371"] = "Dragon-Dragon"
}
local vu59 = {}
local function vu64(p60)
	-- upvalues: (ref) vu59, (ref) vu15, (ref) vu58
    if p60.Name ~= "Fruit " then
        return p60.Name
    end
    if vu59[p60] then
        return vu59[p60]
    end
    local v61 = vu15(p60, "Fruit", "Fruit")
    if v61 and v61:IsA("MeshPart") then
        local v62 = vu58[tostring(v61.MeshId)]
        if v62 and type(v62) == "string" then
            local v63 = "Fruit [ " .. v62 .. " ]"
            vu59[p60] = v63
            return v63
        end
    end
    vu59[p60] = "Fruit [ ??? ]"
    return "Fruit [ ??? ]"
end
vu2.GetRealFruitName = vu64
local vu76 = {
    ["GetNPC"] = function(_, p65)
		-- upvalues: (ref) vu33
        local v66 = getnilinstances()
        local v67 = vu33
        local v68, v69, v70 = pairs(v67:GetChildren())
        while true do
            local v71
            v70, v71 = v68(v69, v70)
            if v70 == nil then
                break
            end
            if v71.Name == p65 then
                return v71
            end
        end
        local v72, v73, v74 = pairs(v66)
        while true do
            local v75
            v74, v75 = v72(v73, v74)
            if v74 == nil then
                break
            end
            if v75.Name == p65 then
                return v75
            end
        end
    end,
    [v1] = {
        ["Saber Expert"] = {
            ["NoQuest"] = true,
            ["Position"] = CFrame.new(- 1461, 30, - 51)
        },
        ["The Saw"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(- 690, 15, 1583)
        },
        ["Greybeard"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(- 4807, 21, 4360)
        },
        ["The Gorilla King"] = {
            ["IsBoss"] = true,
            ["Level"] = 20,
            ["Position"] = CFrame.new(- 1128, 6, - 451),
            ["Quest"] = {
                "JungleQuest",
                CFrame.new(- 1598, 37, 153)
            }
        },
        ["Bobby"] = {
            ["IsBoss"] = true,
            ["Level"] = 55,
            ["Position"] = CFrame.new(- 1131, 14, 4080),
            ["Quest"] = {
                "BuggyQuest1",
                CFrame.new(- 1140, 4, 3829)
            }
        },
        ["Yeti"] = {
            ["IsBoss"] = true,
            ["Level"] = 105,
            ["Position"] = CFrame.new(1185, 106, - 1518),
            ["Quest"] = {
                "SnowQuest",
                CFrame.new(1385, 87, - 1298)
            }
        },
        ["Vice Admiral"] = {
            ["IsBoss"] = true,
            ["Level"] = 130,
            ["Position"] = CFrame.new(- 4807, 21, 4360),
            ["Quest"] = {
                "MarineQuest2",
                CFrame.new(- 5035, 29, 4326),
                2
            }
        },
        ["Swan"] = {
            ["IsBoss"] = true,
            ["Level"] = 240,
            ["Position"] = CFrame.new(5230, 4, 749),
            ["Quest"] = {
                "ImpelQuest",
                CFrame.new(5191, 4, 692)
            }
        },
        ["Chief Warden"] = {
            ["IsBoss"] = true,
            ["Level"] = 230,
            ["Position"] = CFrame.new(5230, 4, 749),
            ["Quest"] = {
                "ImpelQuest",
                CFrame.new(5191, 4, 692),
                2
            }
        },
        ["Warden"] = {
            ["IsBoss"] = true,
            ["Level"] = 220,
            ["Position"] = CFrame.new(5230, 4, 749),
            ["Quest"] = {
                "ImpelQuest",
                CFrame.new(5191, 4, 692),
                1
            }
        },
        ["Magma Admiral"] = {
            ["IsBoss"] = true,
            ["Level"] = 350,
            ["Position"] = CFrame.new(- 5694, 18, 8735),
            ["Quest"] = {
                "MagmaQuest",
                CFrame.new(- 5319, 12, 8515)
            }
        },
        ["Fishman Lord"] = {
            ["IsBoss"] = true,
            ["Level"] = 425,
            ["Position"] = CFrame.new(61350, 31, 1095),
            ["Quest"] = {
                "FishmanQuest",
                CFrame.new(61122, 18, 1567)
            }
        },
        ["Wysper"] = {
            ["IsBoss"] = true,
            ["Level"] = 500,
            ["Position"] = CFrame.new(- 7927, 5551, - 637),
            ["Quest"] = {
                "SkyExp1Quest",
                CFrame.new(- 7861, 5545, - 381)
            }
        },
        ["Thunder God"] = {
            ["IsBoss"] = true,
            ["Level"] = 575,
            ["Position"] = CFrame.new(- 7751, 5607, - 2315),
            ["Quest"] = {
                "SkyExp2Quest",
                CFrame.new(- 7903, 5636, - 1412)
            }
        },
        ["Cyborg"] = {
            ["IsBoss"] = true,
            ["Level"] = 675,
            ["Position"] = CFrame.new(6138, 10, 3939),
            ["Quest"] = {
                "FountainQuest",
                CFrame.new(5258, 39, 4052)
            }
        },
        ["Don Swan"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(2289, 15, 808)
        },
        ["Cursed Captain"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(912, 186, 33591)
        },
        ["Darkbeard"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(3695, 13, - 3599)
        },
        ["Diamond"] = {
            ["IsBoss"] = true,
            ["Level"] = 750,
            ["Position"] = CFrame.new(- 1569, 199, - 31),
            ["Quest"] = {
                "Area1Quest",
                CFrame.new(- 427, 73, 1835)
            }
        },
        ["Jeremy"] = {
            ["IsBoss"] = true,
            ["Level"] = 850,
            ["Position"] = CFrame.new(2316, 449, 787),
            ["Quest"] = {
                "Area2Quest",
                CFrame.new(635, 73, 919)
            }
        },
        ["Fajita"] = {
            ["IsBoss"] = true,
            ["Level"] = 925,
            ["Position"] = CFrame.new(- 2086, 73, - 4208),
            ["Quest"] = {
                "MarineQuest3",
                CFrame.new(- 2441, 73, - 3219)
            }
        },
        ["Smoke Admiral"] = {
            ["IsBoss"] = true,
            ["Level"] = 1150,
            ["Position"] = CFrame.new(- 5078, 24, - 5352),
            ["Quest"] = {
                "IceSideQuest",
                CFrame.new(- 6061, 16, - 4904)
            }
        },
        ["Awakened Ice Admiral"] = {
            ["IsBoss"] = true,
            ["Level"] = 1400,
            ["Position"] = CFrame.new(6473, 297, - 6944),
            ["Quest"] = {
                "FrostQuest",
                CFrame.new(5668, 28, - 6484)
            }
        },
        ["Tide Keeper"] = {
            ["IsBoss"] = true,
            ["Level"] = 1475,
            ["Position"] = CFrame.new(- 3711, 77, - 11469),
            ["Quest"] = {
                "ForgottenQuest",
                CFrame.new(- 3056, 240, - 10145)
            }
        },
        ["Cake Prince"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(- 2103, 70, - 12165)
        },
        ["Dough King"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(- 2103, 70, - 12165)
        },
        ["rip_indra True Form"] = {
            ["RaidBoss"] = true,
            ["Position"] = CFrame.new(- 5333, 424, - 2673)
        },
        ["Stone"] = {
            ["IsBoss"] = true,
            ["Level"] = 1550,
            ["Position"] = CFrame.new(- 1049, 40, 6791),
            ["Quest"] = {
                "PiratePortQuest",
                CFrame.new(- 291, 44, 5580)
            }
        },
        ["Island Empress"] = {
            ["IsBoss"] = true,
            ["Level"] = 1675,
            ["Position"] = CFrame.new(5730, 602, 199),
            ["Quest"] = {
                "AmazonQuest2",
                CFrame.new(5448, 602, 748)
            }
        },
        ["Kilo Admiral"] = {
            ["IsBoss"] = true,
            ["Level"] = 1750,
            ["Position"] = CFrame.new(2889, 424, - 7233),
            ["Quest"] = {
                "MarineTreeIsland",
                CFrame.new(2180, 29, - 6738)
            }
        },
        ["Captain Elephant"] = {
            ["IsBoss"] = true,
            ["Level"] = 1875,
            ["Position"] = CFrame.new(- 13393, 319, - 8423),
            ["Quest"] = {
                "DeepForestIsland",
                CFrame.new(- 13233, 332, - 7626)
            }
        },
        ["Beautiful Pirate"] = {
            ["IsBoss"] = true,
            ["Level"] = 1950,
            ["Position"] = CFrame.new(5241, 23, 129),
            ["Quest"] = {
                "DeepForestIsland2",
                CFrame.new(- 12682, 391, - 9901)
            }
        },
        ["Cake Queen"] = {
            ["IsBoss"] = true,
            ["Level"] = 2175,
            ["Position"] = CFrame.new(- 710, 382, - 11150),
            ["Quest"] = {
                "IceCreamIslandQuest",
                CFrame.new(- 818, 66, - 10964)
            }
        },
        ["Longma"] = {
            ["NoQuest"] = true,
            ["Position"] = CFrame.new(- 10218, 333, - 9444)
        }
    },
    ["BossList"] = {}
}
local v77 = next
local v78 = vu76[v1]
local v79 = nil
while true do
    local v80
    v79, v80 = v77(v78, v79)
    if v79 == nil then
        break
    end
    table.insert(vu76.BossList, v79)
end
function vu76.GetBoss(p81)
	-- upvalues: (ref) vu76
    return vu76.Bosses[p81]
end
local vu82 = vu76.BossList
local vu83 = vu76.GetBoss
local vu84 = nil
local vu85 = nil
local vu86 = {}
local v87 = {}
local vu88
if vu45 then
    vu88 = {
        ["Sky Island 1"] = Vector3.new(- 4652, 873, - 1754),
        ["Sky Island 2"] = Vector3.new(- 7895, 5547, - 380),
        ["Under Water Island"] = Vector3.new(61164, 5, 1820),
        ["Under Water Island Entrace"] = Vector3.new(3865, 5, - 1926)
    }
elseif vu44 then
    vu88 = {
        ["Flamingo Mansion"] = Vector3.new(- 317, 331, 597),
        ["Flamingo Room"] = Vector3.new(2283, 15, 867),
        ["Cursed Ship"] = Vector3.new(923, 125, 32853),
        ["Zombie Island"] = Vector3.new(- 6509, 83, - 133)
    }
else
    vu88 = vu43 and {
        ["Mansion"] = Vector3.new(- 12471, 374, - 7551),
        ["Hydra Island"] = Vector3.new(5756, 610, - 282),
        ["Beautiful Pirate"] = Vector3.new(5319, 23, - 93),
        ["Temple of Time"] = Vector3.new(28286, 14897, 103),
        ["Floating Turtle"] = Vector3.new(- 12001, 332, - 8861),
        ["Castle on the Sea"] = Vector3.new(- 5092, 315, - 3130),
        ["Great Tree"] = Vector3.new(2953, 2282, - 7217)
    } or v87
end
function vu86.NPCTalk(_, p89, ...)
	-- upvalues: (ref) vu35, (ref) vu4
    local v90 = vu35.Character
    if v90 then
        v90 = vu35.Character.PrimaryPart
    end
    if v90 and (v90.Position - p89.p).Magnitude < 5 then
        vu4(...)
        task.wait(1)
    end
end
function vu86.GetNearestPortal(_, p91)
	-- upvalues: (ref) vu88
    local v92 = math.huge
    local v93 = next
    local v94 = vu88
    local v95 = nil
    local v96 = nil
    local v97 = ""
    while true do
        local v98
        v95, v98 = v93(v94, v95)
        if v95 == nil then
            break
        end
        local v99 = (v98 - p91).Magnitude
        if v99 <= v92 then
            v97 = v95
            v96 = v98
            v92 = v99
        end
    end
    return {
        ["Pos"] = v96,
        ["Name"] = v97
    }
end
function vu86.TeleportToPortal(_, p100)
	-- upvalues: (ref) vu4
    if typeof(p100) == "CFrame" then
        p100 = p100.p
    end
    vu4("requestEntrance", p100)
    task.wait(0.5)
end
function vu86.TeleportToGreatTree(_)
	-- upvalues: (ref) vu86
    vu86.Player(CFrame.new(28610, 14897, 105), nil, true)
    vu86:NPCTalk(CFrame.new(28610, 14897, 105), "RaceV4Progress", "TeleportBack")
end
function vu86.Player(p101, p102, p103)
	-- upvalues: (ref) vu9, (ref) vu35, (ref) vu23, (ref) vu85, (ref) vu86, (ref) vu43, (ref) vu2
    if vu9(vu35.Character) then
        if vu23 then
            local v104 = p101.p
            if not p103 then
                vu85 = v104
            end
            local v105 = vu35.Character
            if v105 then
                v105 = vu35.Character.PrimaryPart
            end
            if v105 then
                local v106 = (v105.Position - v104).Magnitude
                local v107 = vu86:GetNearestPortal(v104)
                local v108 = (v104 - v107.Pos).Magnitude + 300
                if v108 and v108 < v106 then
                    if vu43 and v107.Name == "Great Tree" then
                        vu86:TeleportToGreatTree()
                    elseif (v104 - v107.Pos).Magnitude >= 100 then
                        vu86:TeleportToPortal(v107.Pos)
                    else
                        vu86:TeleportToPortal(v104)
                    end
                elseif p102 then
                    vu86.new({
                        vu23,
                        "CFrame",
                        p101,
                        v106 / TweenSpeed
                    })
                else
                    local v109 = vu2.TweenSpeed or 180
                    if v106 < 75 then
                        vu23.CFrame = p101
                    else
                        local v110 = vu23.Position
                        local v111 = Vector3.new(v110.X, v104.Y, v110.Z)
                        if (v110 - v111).Magnitude > 100 then
                            vu86.new({
                                vu23,
                                "CFrame",
                                vu23.CFrame,
                                0,
                                true
                            })
                            task.wait()
                            v105.CFrame = CFrame.new(v111)
                            vu23.CFrame = CFrame.new(v111)
                            task.wait()
                        end
                        if v106 < 350 then
                            vu86.new({
                                vu23,
                                "CFrame",
                                p101,
                                v106 / (v109 * 1.8)
                            })
                        else
                            vu86.new({
                                vu23,
                                "CFrame",
                                p101,
                                v106 / (v109 * 1)
                            })
                        end
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end
function vu86.new(p112)
	-- upvalues: (ref) vu25
    local v113 = p112[1] or p112.Instance
    local v114 = p112[2] or p112.Prop
    local v115 = p112[3] or p112.NewVal
    local v116 = p112[4] or (p112.Time or 0.5)
    local v117 = vu25:Create(v113, TweenInfo.new(v116, Enum.EasingStyle.Linear), {
        [v114] = v115
    })
    v117:Play()
    return v117
end
local vu118 = 1
local vu119 = nil
function vu86.NPCs(_, p120)
	-- upvalues: (ref) vu119, (ref) vu86, (ref) vu118, (ref) vu23, (ref) vu84
    if typeof(p120) == "Vector3" then
        p120 = CFrame.new(p120)
    end
    local v121 = typeof(p120) == "CFrame" and {
        p120
    } or p120
    if not vu119 then
        if # v121 >= 1 then
            if vu118 > # v121 then
                vu118 = 1
            end
            local v122 = v121[vu118]
            if v122 and (vu23.Position - v122.p).Magnitude < 5 then
                vu118 = vu118 + 1
                task.spawn(function()
					-- upvalues: (ref) vu119
                    vu119 = true
                    task.wait(1)
                    vu119 = false
                end)
                task.wait()
            else
                vu84(v122)
            end
        elseif v121[1] then
            vu86.Player(v121[1])
        end
    end
end
local vu123 = vu86.Player
local vu124 = {}
local vu125 = {
    "BartiloQuest",
    "MarineQuest",
    "CitizenQuest"
}
local vu126 = {}
local vu127 = {}
local vu128 = {}
local vu129 = require(vu15(vu24, "GuideModule"))
local vu130 = require(vu15(vu24, "Quests"))
local function v135()
	-- upvalues: (ref) vu129, (ref) vu127
    local v131, v132, v133 = pairs(vu129.Data.NPCList)
    while true do
        local v134
        v133, v134 = v131(v132, v133)
        if v133 == nil then
            break
        end
        vu127[v134.NPCName] = CFrame.new(v134.Position)
    end
end
local function v145()
	-- upvalues: (ref) vu3, (ref) vu126
    local v136 = next
    local v137 = vu3.EnemySpawns
    local v138 = nil
    while true do
        local v139, v140 = v136(v137, v138)
        if v139 == nil then
            break
        end
        local v141 = next
        v138 = v139
        local v142 = nil
        local v143 = {}
        while true do
            local v144
            v142, v144 = v141(v140, v142)
            if v142 == nil then
                break
            end
            table.insert(v143, v144)
        end
        vu126[v139] = v143
    end
end
local function vu147(p146)
	-- upvalues: (ref) vu126
    return vu126[p146] or {}
end
local function vu160(p148)
	-- upvalues: (ref) vu147
    local v149, v150, v151 = pairs(p148.Task)
    local v152 = {}
    local v153 = {}
    while true do
        local v154
        v151, v154 = v149(v150, v151)
        if v151 == nil then
            break
        end
        table.insert(v152, v151)
        local v155 = vu147(v151)
        if v155 then
            local v156, v157, v158 = pairs(v155)
            while true do
                local v159
                v158, v159 = v156(v157, v158)
                if v158 == nil then
                    break
                end
                table.insert(v153, v159)
            end
        end
    end
    return v152, v153
end
local function v175()
	-- upvalues: (ref) vu45, (ref) vu44, (ref) vu43, (ref) vu130, (ref) vu125, (ref) vu160, (ref) vu128
    local v161 = vu45 and {
        0,
        700
    } or vu44 and {
        700,
        1500
    }
    if not v161 then
        local v162 = vu43
        v161 = v162 and {
            1500,
            math.huge
        } or v162
    end
    local v163 = next
    local v164 = vu130
    local v165 = nil
    while true do
        local v166
        v165, v166 = v163(v164, v165)
        if v165 == nil then
            break
        end
        if not table.find(vu125, v165) then
            local v167, v168, v169 = pairs(v166)
            local v170 = v165
            while true do
                local v171
                v169, v171 = v167(v168, v169)
                if v169 == nil then
                    break
                end
                local v172 = v171.LevelReq or math.huge
                if v161[1] <= v172 and v172 < v161[2] then
                    local v173, v174 = vu160(v171)
                    if # v173 > 0 then
                        table.insert(vu128, {
                            ["Quest"] = {
                                ["Name"] = v170,
                                ["Count"] = v169
                            },
                            ["Enemie"] = {
                                ["Name"] = v173,
                                ["Level"] = v172,
                                ["Position"] = v174
                            }
                        })
                    end
                end
            end
        end
    end
end
task.spawn(v135)
task.spawn(v145)
task.spawn(v175)
function vu124.GetQuestPosition(_)
	-- upvalues: (ref) vu127, (ref) vu129
    return vu127[vu129.Data.LastClosestNPC]
end
function vu124.GetMission(p176)
	-- upvalues: (ref) vu128, (ref) vu76, (ref) vu6
    local v177, v178, v179 = pairs(vu128)
    local v180 = nil
    while true do
        local v181
        v179, v181 = v177(v178, v179)
        if v179 == nil then
            break
        end
        if v181.Enemie.Level > p176 then
            return v180
        end
        local v182 = v181.Enemie.Name
        if vu76.GetBoss(v182[1]) then
            if vu6(v182[1]) then
                v180 = v181
            end
        else
            v180 = v181
        end
    end
    return v180
end
local vu183 = vu15(vu35, "PlayerGui", "Main", "Quest")
local vu184 = vu15(vu183, "Container", "QuestTitle", "Title")
function vu124.VerifyQuest(_, p185)
	-- upvalues: (ref) vu183, (ref) vu184
    if vu183.Visible then
        p185:gsub("-", ""):lower()
        local _ = vu184.Text:gsub("-", ""):lower().find
    end
end
function vu124.VerifyQuests(_, p186)
	-- upvalues: (ref) vu183, (ref) vu184
    if vu183.Visible then
        local v187, v188, v189 = pairs(p186)
        while true do
            local v190
            v189, v190 = v187(v188, v189)
            if v189 == nil then
                break
            end
            local v191 = v190:gsub("-", ""):lower()
            if vu184.Text:gsub("-", ""):lower():find(v191) then
                return v191
            end
        end
    end
end
table.sort(vu128, function(p192, p193)
    return p192.Enemie.Level < p193.Enemie.Level
end)
local vu194 = vu147
GetMission = GetMission
local vu195 = {}
local vu196 = vu15(workspace, "_WorldOrigin", "Locations")
local vu197 = vu15(vu35, "PlayerGui", "Main", "Timer")
local vu198 = nil
task.spawn(function()
	-- upvalues: (ref) vu44, (ref) vu198, (ref) vu15, (ref) vu34, (ref) vu43
    if vu44 then
        vu198 = vu15(vu34, "CircleIsland", "RaidSummon2", "Button", "Main")
    elseif vu43 then
        vu198 = vu15(vu34, "Boat Castle", "RaidSummon2", "Button", "Main")
    end
end)
function vu195.GetLastIsland(_)
	-- upvalues: (ref) vu196, (ref) vu35
    local v199 = vu196
    local v200, v201, v202 = pairs(v199:GetChildren())
    local v203 = {}
    while true do
        local v204
        v202, v204 = v200(v201, v202)
        if v202 == nil then
            break
        end
        if vu35:DistanceFromCharacter(v204.Position) < 3000 then
            v203[v204.Name] = v204
        end
    end
    return v203["Island 5"] or (v203["Island 4"] or v203["Island 3"] or (v203["Island 2"] or v203["Island 1"]))
end
function vu195.CheckTimer(_)
	-- upvalues: (ref) vu197
    return vu197.Visible
end
function vu195.InRaid(_)
	-- upvalues: (ref) vu2, (ref) vu35
    local v205 = vu2.AutoFarmRaid
    if v205 then
        v205 = vu35:GetAttribute("IslandRaiding")
    end
    return v205
end
function vu195.Start(p206)
	-- upvalues: (ref) vu198
    if not p206:InRaid() and vu198 and vu198:FindFirstChild("ClickDetector") then
        fireclickdetector(vu198.ClickDetector)
        task.wait(1)
    end
end
local vu207 = vu15(vu35, "PlayerGui", "Main", "Dialogue")
local function vu208()
	-- upvalues: (ref) vu207
    return vu207.Visible
end
local vu209 = {
    ["Elite"] = {
        "Urban",
        "Deandre",
        "Diablo"
    },
    ["Bones"] = {
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy"
    },
    ["CakePrince"] = {
        "Head Baker",
        "Baking Staff",
        "Cake Guard",
        "Cookie Crafter"
    },
    ["Ectoplasm"] = {
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer"
    }
}
local function vu214(p210, p211)
	-- upvalues: (ref) vu2, (ref) vu25
    if p210 and p210.PrimaryPart then
        local v212 = (p210.PrimaryPart.Position - p211.p).Magnitude
        local v213 = vu2.SeaBoatSpeed or 200
        vu25:Create(p210.PrimaryPart, TweenInfo.new(v212 / v213, Enum.EasingStyle.Linear), {
            ["CFrame"] = p211
        }):Play()
    end
end
local function vu216(p215)
    if p215 and p215.Parent then
        if p215.Parent:FindFirstChild("Humanoid") then
            return p215.Parent.PrimaryPart
        elseif p215:FindFirstChild("Handle") then
            return p215.Handle
        else
            return p215
        end
    else
        return
    end
end
local function vu231(pu217, p218)
	-- upvalues: (ref) vu35, (ref) vu216, (ref) vu64, (ref) vu27
    if not (pu217 and pu217:FindFirstChild("ESP_REDzHUB")) then
        local vu219 = Instance.new("BoxHandleAdornment", pu217)
        vu219.Size = Vector3.new(1, 0, 1, 0)
        vu219.Name = "ESP_REDzHUB"
        vu219.AlwaysOnTop = true
        vu219.ZIndex = 10
        vu219.Transparency = 0
        local v220 = Instance.new("BillboardGui", vu219)
        v220.Adornee = pu217
        v220.Size = UDim2.new(0, 100, 0, 150)
        v220.StudsOffset = Vector3.new(0, 1, 0)
        v220.AlwaysOnTop = true
        local vu221 = Instance.new("TextLabel", v220)
        vu221.BackgroundTransparency = 1
        vu221.Position = UDim2.new(0, 0, 0, - 50)
        vu221.Size = UDim2.new(0, 100, 0, 100)
        vu221.TextSize = 10
        vu221.TextColor3 = Color3.new(1, 1, 1)
        vu221.TextStrokeTransparency = 0
        vu221.TextYAlignment = Enum.TextYAlignment.Bottom
        vu221.Text = "..."
        vu221.ZIndex = 15
        vu221.RichText = true
        vu221.TextColor3 = p218 or Color3.fromRGB(255, 255, 0)
        local vu222 = nil
        local function vu223()
			-- upvalues: (ref) vu222
            if vu222 then
                vu222:Disconnect()
            end
        end
        local function v230()
			-- upvalues: (ref) pu217, (ref) vu219, (ref) vu223, (ref) vu35, (ref) vu216, (ref) vu221, (ref) vu64
            if pu217 and vu219 then
                local v224 = vu35.Character
                if v224 then
                    v224 = vu35.Character.PrimaryPart
                end
                local v225 = v224 and vu216(pu217)
                if v225 then
                    local v226 = math.floor((v224.Position - v225.Position).Magnitude / 5)
                    local v227 = pu217.Parent:FindFirstChild("Humanoid")
                    if v227 then
                        local v228 = "<font color=\'rgb(25, 240, 25)\'>" .. ("[ " .. tostring(math.floor(v227.Health)) .. "/" .. tostring(math.floor(v227.MaxHealth)) .. " ]") .. "</font>"
                        local v229 = "<font color=\'rgb(160, 160, 160)\'> [ " .. tostring(v226) .. "m ]</font>"
                        vu221.Text = pu217.Parent.Name .. v229 .. "\n" .. v228
                    elseif pu217.Name ~= "Handle" then
                        vu221.Text = ("%s < %i >"):format(pu217.Name, v226)
                    else
                        vu221.Text = ("%s < %i >"):format(vu64(pu217.Parent), v226)
                    end
                end
            else
                vu223()
            end
        end
        vu222 = vu27.Stepped:Connect(v230)
    end
end
local function vu233(p232)
    if p232 and p232:FindFirstChild("ESP_REDzHUB") then
        p232.ESP_REDzHUB:Destroy()
    end
end
local function vu242()
	-- upvalues: (ref) vu2, (ref) vu35, (ref) vu231, (ref) vu233
    while vu2.EspPlayer do
        task.wait()
        local v234, v235, v236 = pairs(game:GetService("Players"):GetPlayers())
        while true do
            local v237
            v236, v237 = v234(v235, v236)
            if v236 == nil then
                break
            end
            if v237.Name ~= vu35.Name and v237.Character and v237.Character:FindFirstChild("HumanoidRootPart") then
                vu231(v237.Character.HumanoidRootPart, Color3.fromRGB(220, 220, 220))
            end
        end
    end
    local v238, v239, v240 = pairs(game:GetService("Players"):GetPlayers())
    while true do
        local v241
        v240, v241 = v238(v239, v240)
        if v240 == nil then
            break
        end
        if v241.Character and v241.Character:FindFirstChild("HumanoidRootPart") then
            vu233(v241.Character.HumanoidRootPart)
        end
    end
end
local function vu251()
	-- upvalues: (ref) vu2, (ref) vu231, (ref) vu233
    while vu2.EspFlowers do
        task.wait()
        local v243, v244, v245 = pairs(workspace:GetChildren())
        while true do
            local v246
            v245, v246 = v243(v244, v245)
            if v245 == nil then
                break
            end
            if v246 and (v246:IsA("BasePart") and v246.Name == "Flower1") then
                vu231(v246, v246.Color)
            end
        end
    end
    local v247, v248, v249 = pairs(workspace:GetChildren())
    while true do
        local v250
        v249, v250 = v247(v248, v249)
        if v249 == nil then
            break
        end
        if v250 and (v250:IsA("BasePart") and (v250.Name == "Flower1" or v250.Name == "Flower2")) then
            vu233(v250)
        end
    end
end
local function vu260()
	-- upvalues: (ref) vu2, (ref) vu231, (ref) vu64, (ref) vu233
    while vu2.EspFruits do
        task.wait()
        local v252, v253, v254 = pairs(workspace:GetChildren())
        while true do
            local v255
            v254, v255 = v252(v253, v254)
            if v254 == nil then
                break
            end
            if v255 and (v255:IsA("Tool") and v255:FindFirstChild("Handle")) or v255 and (v255.Name:find("Fruit") and v255:FindFirstChild("Handle")) then
                vu231(v255.Handle, Color3.fromRGB(255, 0, 0), vu64(v255))
            end
        end
    end
    local v256, v257, v258 = pairs(workspace:GetChildren())
    while true do
        local v259
        v258, v259 = v256(v257, v258)
        if v258 == nil then
            break
        end
        if v259 and v259:FindFirstChild("Handle") then
            vu233(v259.Handle)
        end
    end
end
local function vu271()
	-- upvalues: (ref) vu2, (ref) vu231, (ref) vu233
    while vu2.EspIslands do
        task.wait()
        local v261 = workspace:WaitForChild("_WorldOrigin", 9000000000):WaitForChild("Locations", 9000000000)
        local v262, v263, v264 = pairs(v261:GetChildren())
        while true do
            local v265
            v264, v265 = v262(v263, v264)
            if v264 == nil then
                break
            end
            if v265 then
                vu231(v265, Color3.fromRGB(0, 255, 255))
            end
        end
    end
    local v266 = workspace:WaitForChild("_WorldOrigin", 9000000000):WaitForChild("Locations", 9000000000)
    local v267, v268, v269 = pairs(v266:GetChildren())
    while true do
        local v270
        v269, v270 = v267(v268, v269)
        if v269 == nil then
            break
        end
        if v270 then
            vu233(v270)
        end
    end
end
local function vu296()
	-- upvalues: (ref) vu34, (ref) vu2, (ref) vu231, (ref) vu233
    local v272 = vu34
    local v273, v274, v275 = pairs(v272:GetDescendants())
    local v276 = 0
    local v277 = {}
    while true do
        local v278
        v275, v278 = v273(v274, v275)
        if v275 == nil then
            break
        end
        if v278.Name:find("Chest") and v278:IsA("BasePart") then
            v276 = v276 + 1
            if v276 > 10 then
                task.wait()
                v276 = 0
            end
            table.insert(v277, v278)
        end
    end
    while vu2.EspChests do
        task.wait()
        local v279 = workspace:GetChildren()
        local v280, v281, v282 = pairs(v277)
        while true do
            local v283
            v282, v283 = v280(v281, v282)
            if v282 == nil then
                break
            end
            table.insert(v279, v283)
        end
        local v284, v285, v286 = pairs(v279)
        while true do
            local v287
            v286, v287 = v284(v285, v286)
            if v286 == nil then
                break
            end
            if v287 then
                if v287.Name ~= "Chest3" then
                    if v287.Name ~= "Chest2" then
                        if v287.Name == "Chest1" then
                            vu231(v287, Color3.fromRGB(150, 150, 150))
                        end
                    else
                        vu231(v287, Color3.fromRGB(255, 255, 0))
                    end
                else
                    vu231(v287, Color3.fromRGB(0, 255, 255))
                end
            end
        end
    end
    local v288, v289, v290 = pairs(v277)
    while true do
        local v291
        v290, v291 = v288(v289, v290)
        if v290 == nil then
            break
        end
        vu233(v291)
    end
    local v292, v293, v294 = pairs(workspace:GetChildren())
    while true do
        local v295
        v294, v295 = v292(v293, v294)
        if v294 == nil then
            break
        end
        if v295 and (v295.Name == "Chest3" or (v295.Name == "Chest2" or v295.Name == "Chest1")) then
            vu233(v295)
        end
    end
end
local function vu298(p297)
	-- upvalues: (ref) vu28
    return vu28.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=" .. p297
end
local function vu302(p299)
	-- upvalues: (ref) vu35
    local v300 = vu35
    if v300 then
        v300 = vu35.Character
    end
    local v301 = vu35
    if v301 then
        v301 = vu35:FindFirstChild("Backpack")
    end
    if v300 and v301 then
        return v300:FindFirstChild(p299) or v301:FindFirstChild(p299)
    end
end
local function vu314(p303)
	-- upvalues: (ref) vu35
    local v304 = vu35
    if v304 then
        v304 = vu35.Character
    end
    local v305 = vu35
    if v305 then
        v305 = vu35.Backpack
    end
    local v306, v307, v308 = pairs(v305:GetChildren())
    while true do
        local v309
        v308, v309 = v306(v307, v308)
        if v308 == nil then
            break
        end
        if v309 and (v309:IsA("Tool") and v309.ToolTip == p303) then
            return v309
        end
    end
    if v304 then
        local v310, v311, v312 = pairs(v304:GetChildren())
        while true do
            local v313
            v312, v313 = v310(v311, v312)
            if v312 == nil then
                break
            end
            if v313 and (v313:IsA("Tool") and v313.ToolTip == p303) then
                return v313
            end
        end
    end
end
local function vu317(p315)
	-- upvalues: (ref) vu302
    local v316 = vu302(p315)
    if v316 and v316:FindFirstChild("Level") then
        return v316.Level.Value
    end
end
local function vu321(p318)
	-- upvalues: (ref) vu35
    local v319 = vu35.Backpack
    local v320 = vu35.Character
    if v320 then
        v320 = v320:FindFirstChild("Humanoid")
    end
    if v319 and (v320 and v319:FindFirstChild(p318)) then
        v320:EquipTool(v319[p318])
    end
end
local function vu324(p322)
    local v323 = game:GetService("VirtualInputManager")
    v323:SendKeyEvent(true, p322, false, game)
    v323:SendKeyEvent(false, p322, false, game)
end
local function vu331(p325)
	-- upvalues: (ref) vu35, (ref) vu321
    local v326 = vu35.Backpack
    local v327, v328, v329 = pairs(v326:GetChildren())
    while true do
        local v330
        v329, v330 = v327(v328, v329)
        if v329 == nil then
            break
        end
        if v330 and v330.ToolTip == p325 then
            vu321(v330.Name)
            return
        end
    end
end
local function vu336()
	-- upvalues: (ref) vu35, (ref) vu2, (ref) vu321
    local v332, v333, v334 = pairs(vu35.Backpack:GetChildren())
    while true do
        local v335
        v334, v335 = v332(v333, v334)
        if v334 == nil then
            break
        end
        if v335 and v335.ToolTip == vu2.FarmTool then
            vu321(v335.Name)
        end
    end
end
local function vu341()
	-- upvalues: (ref) vu35
    if vu35.Character then
        local v337, v338, v339 = pairs(vu35.Character:GetChildren())
        while true do
            local v340
            v339, v340 = v337(v338, v339)
            if v339 == nil then
                break
            end
            if v340:IsA("Tool") then
                v340.Parent = vu35.Backpack
            end
        end
    end
end
local function vu350()
	-- upvalues: (ref) vu35
    local v342 = math.huge
    local v343, v344, v345 = pairs(workspace:GetChildren())
    local v346 = nil
    while true do
        local v347
        v345, v347 = v343(v344, v345)
        if v345 == nil then
            break
        end
        local v348 = v347:FindFirstChild("Handle")
        if v348 and v348.Position.Y > 0 then
            if v347.Name == "Fruit " then
                return v348
            end
            if v347:IsA("Tool") then
                local v349 = vu35.Character
                if v349 then
                    v349 = vu35.Character.PrimaryPart
                end
                if v349 and (v349.Position - v348.Position).Magnitude <= v342 then
                    v342 = (v349.Position - v348.Position).Magnitude
                    v346 = v348
                end
            end
        end
    end
    return v346
end
local function vu352(p351)
	-- upvalues: (ref) vu4
    vu4(p351, true)
    vu4(p351)
end
local function vu357(p353, p354, p355)
	-- upvalues: (ref) vu4, (ref) vu35, (ref) vu123
    if p355 then
        local v356 = vu35.Character
        if v356 then
            v356 = vu35.Character.PrimaryPart
        end
        if v356 and (v356.Position - p355.p).Magnitude <= 3 then
            task.wait(0.5)
            vu4("StartQuest", p353, p354)
            task.wait(0.5)
        else
            vu123(p355)
        end
    else
        vu4("StartQuest", p353, p354)
    end
end
local function vu359()
	-- upvalues: (ref) vu124, (ref) vu36, (ref) vu39
    local v358 = vu124.GetMission(vu36.Value)
    vu39 = v358
    return v358
end
local function vu361()
	-- upvalues: (ref) vu35
    local v360 = vu35.PlayerGui.Main.Quest
    if not v360.Visible then
        vu35.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text = ""
    end
    return v360.Visible
end
local vu362 = loadstring("return function()local Chests={}task.spawn(function()local Map=workspace:WaitForChild(\"Map\")for _,chest in pairs(Map:GetDescendants())do if chest:IsA(\"BasePart\")and(chest.Name:find(\"Chest\"))then table.insert(Chests,chest)task.wait()end;end;end)return Chests end")()
vu36.Changed:Connect(vu359)
task.spawn(function()
	-- upvalues: (ref) vu359
    while task.wait(1) do
        pcall(vu359)
    end
end)
vu359()
local function vu368()
	-- upvalues: (ref) vu34
    local v363 = vu34["Boat Castle"].Summoner:FindFirstChild("Circle")
    if v363 then
        local v364, v365, v366 = pairs(v363:GetChildren())
        while true do
            local v367
            v366, v367 = v364(v365, v366)
            if v366 == nil then
                break
            end
            if v367 and (v367.Name == "Part" and (v367:FindFirstChild("Part") and v367.Part.BrickColor ~= BrickColor.new("Lime green"))) then
                return v367.Part
            end
        end
    end
end
local vu369 = {
    ["RaceDoor"] = {
        ["Human"] = CFrame.new(29231, 14890, - 205),
        ["Fishman"] = CFrame.new(28228, 14890, - 212),
        ["Cyborg"] = CFrame.new(28496, 14895, - 422),
        ["Ghoul"] = CFrame.new(28673, 14890, 454),
        ["Skypiea"] = CFrame.new(28962, 14919, 234),
        ["Mink"] = CFrame.new(29014, 14890, - 378)
    },
    ["TrialNames"] = {
        "MinkTrial",
        "SkyTrial",
        "CyborgTrial",
        "FishmanTrial",
        "GhoulTrial",
        "HumanTrial"
    }
}
vu15(vu35, "PlayerGui", "Main", "Timer")
function vu369.CheckTrial(_)
	-- upvalues: (ref) vu34, (ref) vu369, (ref) vu35
    local v370 = vu34
    local v371, v372, v373 = pairs(v370:GetChildren())
    while true do
        local v374
        v373, v374 = v371(v372, v373)
        if v373 == nil then
            break
        end
        if table.find(vu369.TrialNames, v374.Name) and vu35:DistanceFromCharacter(v374.WorldPivot.p) <= 1000 then
            return true
        end
    end
end
function vu369.GetPlayerRace(_)
	-- upvalues: (ref) vu15, (ref) vu35
    return vu15(vu35, "Data", "Race").Value
end
function vu369.CheckLevelBones(_, p375)
	-- upvalues: (ref) vu2, (ref) vu36, (ref) vu38
    if p375 == 1 then
        local v376 = vu2.AutoFarmBone
        if v376 then
            v376 = vu38 <= vu36.Value
        end
        return v376
    end
    if p375 == 2 then
        local v377 = vu2.AutoFarm_Level
        if v377 then
            v377 = vu36.Value < vu38
        end
        return v377
    end
end
function vu369.Quests(_)
	-- upvalues: (ref) vu2, (ref) vu36
    return vu2.CitizenQuest or vu2.BartiloQuest or (vu2.UnlockSaber or vu2.FarmingSecondSea or (vu2.CursedDualKatana or vu2.SoulGuitar) or (vu2.AutoThirdSea and vu36.Value >= 1500 and true or (vu2.UnlockTushita or (vu2.RaceV2 or vu2.UnlockRengoku))))
end
vu369[v1] = function(_)
	-- upvalues: (ref) vu2
    return vu2.FarmingBossSelected or vu2.FarmingAllBosses
end
function vu369.FastLevel(_)
	-- upvalues: (ref) vu2
    return vu2.HutingPlayer or vu2.FarmingSkyPiea
end
function vu369.PirateRaid(_)
	-- upvalues: (ref) vu18
    return vu18()
end
function vu369.Factory(_)
	-- upvalues: (ref) vu17
    return vu17()
end
function vu369.EliteHunter(_)
	-- upvalues: (ref) vu2, (ref) vu8, (ref) vu209
    local v378 = vu2.AutoEliteHunter
    if v378 then
        v378 = vu8(vu209.Elite)
    end
    return v378
end
function vu369.Fruits(_)
	-- upvalues: (ref) vu2, (ref) vu350
    local v379 = vu2.TeleportToFruit
    if v379 then
        v379 = vu350()
    end
    return v379
end
function vu369.GetBosses(_)
	-- upvalues: (ref) vu6
    return {
        ["Rip Indra"] = vu6("rip_indra True Form"),
        ["Cake Prince"] = vu6("Cake Prince"),
        ["Dough King"] = vu6("Dough King"),
        ["Darkbeard"] = vu6("Darkbeard"),
        ["Cursed Captain"] = vu6("Cursed Captain")
    }
end
function vu369.GetTools(_)
	-- upvalues: (ref) vu302
    return {
        ["God Chalice"] = vu302("God\'s Chalice"),
        ["Sweet Chalice"] = vu302("Sweet Chalice"),
        ["Fist of Darkness"] = vu302("Fist of Darkness"),
        ["Hallow Essence"] = vu302("Hallow Essence")
    }
end
function vu369.Check(_, p380)
	-- upvalues: (ref) vu2, (ref) vu6, (ref) vu302
    if p380 == "Rip Indra" then
        local v381 = not (vu2.AutoRipIndra and vu6("rip_indra True Form")) and vu2.AutoRipIndra
        if v381 then
            v381 = vu302("God\'s Chalice")
        end
        return v381
    end
    if p380 == "Hallow Boss" then
        local v382 = not (vu2.AutoSoulReaper and vu6("Soul Reaper")) and vu2.AutoSoulReaper
        if v382 then
            v382 = vu302("Hallow Essence")
        end
        return v382
    end
    if p380 == "Darkbeard" then
        local v383 = not (vu2.AutoDarkbeard and vu6("Darkbeard")) and vu2.AutoDarkbeard
        if v383 then
            v383 = vu302("Fist of Darkness")
        end
        return v383
    end
    if p380 == "Dough King" then
        local v384 = not (vu2.AutoDoughKing and vu6("Dough King")) and (not (vu2.AutoDoughKing and vu302("God\'s Chalice")) and vu2.AutoDoughKing)
        if v384 then
            v384 = vu302("Sweet Chalice")
        end
        return v384
    end
    if p380 == "Cake Prince" then
        local v385 = vu2.AutoCakePrince
        if v385 then
            v385 = vu6("Cake Prince")
        end
        return v385
    end
    if p380 == "Cursed Captain" then
        local v386 = vu2.AutoCursedCaptain
        if v386 then
            v386 = vu6("Cursed Captain")
        end
        return v386
    end
end
local function vu390(p387)
	-- upvalues: (ref) vu369, (ref) vu195, (ref) vu2, (ref) vu6
    if p387 then
        if p387 == "Level" then
            if vu369:Fruits() or (vu195:InRaid() or (vu369:EliteHunter() or (vu369:Factory() or (vu369:PirateRaid() or (vu369:FastLevel() or (vu369:Bosses() or (vu369:Quests() or (vu369:CheckLevelBones(1) or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Cursed Captain") or vu369:Check("Darkbeard")))))))))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Ectoplasm" then
            if vu369:Check("Cursed Captain") or (vu195:InRaid() or (vu369:Check("Darkbeard") or (vu369:Quests() or (vu369:Bosses() or vu369:Fruits())))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Bone" then
            if vu369:Fruits() or (vu195:InRaid() or (vu369:EliteHunter() or (vu369:Factory() or (vu369:PirateRaid() or (vu369:Bosses() or (vu369:Quests() or (vu369:CheckLevelBones(2) or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or vu369:Check("Darkbeard")))))))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Hallow Boss" then
            if vu369:Check("Hallow Boss") and not (vu195:InRaid() or (vu369:Fruits() or (vu369:PirateRaid() or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or vu369:Check("Cake Prince")))))) then
                return false
            else
                return task.wait(0.1)
            end
        elseif p387 == "Elite Hunter" then
            if vu369:Fruits() or (vu195:InRaid() or (vu369:PirateRaid() or (vu369:Quests() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or not vu369:EliteHunter()))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Raid Pirate" then
            if vu369:Quests() or (vu195:InRaid() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or not vu369:PirateRaid()))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Fruit" then
            if vu369:Quests() or (vu195:InRaid() or (vu369:Factory() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Darkbeard") or not vu369:Fruits()))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Factory" then
            if vu369:Check("Darkbeard") or (vu195:InRaid() or not vu369:Factory()) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Cursed Captain" then
            if vu369:Factory() or (vu195:InRaid() or not vu369:Check("Cursed Captain")) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "All Boss" then
            if vu369:Factory() or (vu195:InRaid() or (vu369:PirateRaid() or (vu369:Fruits() or (vu369:EliteHunter() or (vu369:Quests() or (vu369:FastLevel() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Cursed Captain") or (vu369:Check("Darkbeard") or not vu369:Bosses())))))))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Farm Boss" then
            if vu2.KillAllBosses or (vu195:InRaid() or (vu369:Factory() or (vu369:PirateRaid() or (vu369:Fruits() or (vu369:EliteHunter() or (vu369:Quests() or (vu369:FastLevel() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Cursed Captain") or (vu369:Check("Darkbeard") or not vu369:Bosses()))))))))))))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Farm Sea" then
            if vu369:Bosses() or (vu195:InRaid() or (vu369:Fruits() or (vu369:Check("Darkbeard") or (vu369:Quests() or vu369:Factory())))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Rip Indra" then
            if vu2.AutoDoughKing or (vu195:InRaid() or vu2.UnlockTushita or not vu369:Check("Rip Indra")) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Dough King" then
            local v388 = vu369:Check("Dough King")
            if vu369:Quests() or vu2.UnlockTushita or (vu195:InRaid() or not v388 and vu369:PirateRaid()) or (not v388 and vu369:EliteHunter() or (not v388 and vu369:Fruits() or (not v388 and vu369:Check("Hallow Boss") or not v388 and vu369:Bosses()))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Dough King 2" then
            if vu2.AutoFarm_Level or (vu195:InRaid() or vu2.AutoFarmBone) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Cake Prince" then
            local v389 = vu6("Cake Prince")
            if vu2.AutoDoughKing or (vu195:InRaid() or vu2.UnlockTushita or (vu369:Check("Rip Indra") or not v389 and vu369:PirateRaid())) or (not v389 and vu369:EliteHunter() or (not v389 and vu369:Fruits() or (not v389 and vu369:Check("Hallow Boss") or not v389 and vu369:Bosses()))) then
                return task.wait(0.1)
            else
                return false
            end
        elseif p387 == "Chests" then
            if vu369:Bosses() or (vu195:InRaid() or vu2.UnlockTushita or (vu369:Factory() or (vu369:PirateRaid() or (vu369:Fruits() or (vu369:EliteHunter() or (vu369:Quests() or (vu369:FastLevel() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Cursed Captain") or vu369:Check("Darkbeard"))))))))))))) then
                return task.wait(0.1)
            else
                return false
            end
        else
            if p387 == "Raid" then
                if not vu369:Quests() and (vu195:InRaid() or not (vu369:Bosses() or (vu369:Factory() or (vu369:PirateRaid() or (vu369:Fruits() or (vu369:EliteHunter() or (vu369:FastLevel() or (vu369:Check("Hallow Boss") or (vu369:Check("Dough King") or (vu369:Check("Rip Indra") or (vu369:Check("Cake Prince") or (vu369:Check("Cursed Captain") or vu369:Check("Darkbeard"))))))))))))) then
                    return false
                end
                local _ = task.wait
            end
            return
        end
    else
        return
    end
end
local function vu395(p391, p392, p393)
	-- upvalues: (ref) vu2, (ref) vu9, (ref) vu390
    local v394 = vu2[p391] and vu9(p393)
    if v394 then
        v394 = not vu390(p392)
    end
    return v394
end
local function vu409()
	-- upvalues: (ref) vu2, (ref) vu362, (ref) vu23, (ref) vu390, (ref) vu35, (ref) vu123
    if vu2.AutoChestTween then
        local vu396 = vu362()
        local function v407()
			-- upvalues: (ref) vu23, (ref) vu396
            local v397 = math.huge
            local v398, v399, v400 = pairs(workspace:GetChildren())
            local v401 = nil
            while true do
                local v402
                v400, v402 = v398(v399, v400)
                if v400 == nil then
                    break
                end
                if v402.Name:find("Chest") and (v402:IsA("BasePart") and (v402.Position - vu23.Position).Magnitude <= v397) then
                    v397 = (v402.Position - vu23.Position).Magnitude
                    v401 = v402
                end
            end
            local v403, v404, v405 = pairs(vu396)
            while true do
                local v406
                v405, v406 = v403(v404, v405)
                if v405 == nil then
                    break
                end
                if v406 and (v406.Parent and (v406.Position - vu23.Position).Magnitude <= v397) then
                    v397 = (v406.Position - vu23.Position).Magnitude
                    v401 = v406
                end
            end
            return v401
        end
        while vu2.AutoChestTween do
            task.wait()
            if not vu390("Chests") then
                local v408 = v407()
                if v408 then
                    if vu35:DistanceFromCharacter(v408.Position) >= 10 then
                        vu123(v408.CFrame)
                    else
                        vu123(v408.CFrame * CFrame.new(0, math.random(0, 1) * 3, 0))
                    end
                end
            end
        end
    end
end
local function vu414()
	-- upvalues: (ref) vu2, (ref) vu36, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoFarmSkyPiea do
        task.wait()
        if vu2.AutoFarm_Level then
            local v410 = vu36.Value
            if v410 >= 90 then
                vu2.FarmingSkyPiea = false
            elseif v410 >= 55 then
                local vu411 = vu8({
                    "Shanda"
                })
                if vu411 and vu411:FindFirstChild("HumanoidRootPart") then
                    vu123(vu411.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu411
                        vu7()
                        vu336()
                        vu11(vu411)
                    end)
                else
                    vu123(CFrame.new(- 7759, 5581, - 482))
                end
                vu2.FarmingSkyPiea = true
            elseif v410 >= 40 then
                local vu412 = vu8({
                    "God\'s Guard"
                })
                if vu412 and vu412:FindFirstChild("HumanoidRootPart") then
                    vu123(vu412.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu412
                        vu7()
                        vu336()
                        vu11(vu412)
                    end)
                else
                    vu123(CFrame.new(- 4716, 853, - 1932))
                end
                vu2.FarmingSkyPiea = true
            elseif v410 >= 25 then
                local vu413 = vu8({
                    "Sky Bandit"
                })
                if vu413 and vu413:FindFirstChild("HumanoidRootPart") then
                    vu123(vu413.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu413
                        vu7()
                        vu336()
                        vu11(vu413)
                    end)
                else
                    vu123(CFrame.new(- 4955, 296, - 2900))
                end
                vu2.FarmingSkyPiea = true
            end
        else
            vu2.FarmingSkyPiea = false
        end
    end
    vu2.FarmingSkyPiea = false
end
local function vu425()
	-- upvalues: (ref) vu29, (ref) vu35, (ref) vu124, (ref) vu324, (ref) vu2, (ref) vu36, (ref) vu9, (ref) vu4, (ref) vu123, (ref) vu13, (ref) vu7, (ref) vu336
    local function v420()
		-- upvalues: (ref) vu29, (ref) vu35, (ref) vu124
        local v415 = vu29
        local v416, v417, v418 = pairs(v415:GetPlayers())
        while true do
            local v419
            v418, v419 = v416(v417, v418)
            if v418 == nil then
                break
            end
            if v419 ~= vu35 and vu124:VerifyQuest(v419.Name) then
                return v419
            end
        end
    end
    local function vu421()
		-- upvalues: (ref) vu324
        vu324("Z")
        vu324("X")
        vu324("C")
        vu324("V")
        vu324("F")
    end
    while vu2.AutoPlayerHunter do
        task.wait()
        if vu2.AutoFarm_Level then
            if vu36.Value < 90 or vu36.Value > 625 then
                vu2.HutingPlayer = false
            else
                local vu422 = v420()
                if vu422 and vu9(vu422.Character) then
                    vu2.HutingPlayer = true
                    pcall(function()
						-- upvalues: (ref) vu35, (ref) vu4, (ref) vu422, (ref) vu123, (ref) vu13, (ref) vu7, (ref) vu336, (ref) vu421
                        if vu35.PlayerGui.Main.PvpDisabled.Visible then
                            vu4("EnablePvp")
                        elseif vu422.Data.Level.Value < 20 or vu422.Data.Level.Value > 700 then
                            vu4("AbandonQuest")
                            task.wait(1)
                            vu4("PlayerHunter")
                        else
                            local v423 = vu422.Character
                            if v423 then
                                v423 = vu422.Character.PrimaryPart
                            end
                            if v423 then
                                vu123(v423.CFrame * CFrame.new(math.random(6), 6, math.random(6)))
                                pcall(function()
									-- upvalues: (ref) vu13, (ref) vu7, (ref) vu336
                                    vu13()
                                    vu7()
                                    vu336()
                                end)
                                local v424 = vu35.Character
                                if v424 then
                                    v424 = vu35.Character.PrimaryPart
                                end
                                if v424 and (v424.Position - v423.Position).Magnitude < 40 then
                                    vu421()
                                end
                            end
                        end
                    end)
                else
                    vu4("PlayerHunter")
                    vu2.HutingPlayer = false
                    task.wait(1)
                end
            end
        else
            vu2.HutingPlayer = false
        end
    end
    vu2.HutingPlayer = false
end
local function vu430()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu39, (ref) vu124, (ref) vu357, (ref) vu8, (ref) vu395, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu86
    while vu2.AutoFarm_Level do
        task.wait()
        local v426 = not vu390("Level") and (not vu2.FarmingSkyPiea and vu39)
        if v426 then
            local v427 = v426.Enemie.Name
            if vu124:VerifyQuests(v427) then
                local vu428 = vu8(v427)
                if vu428 then
                    while vu395("AutoFarm_Level", "Level", vu428) and vu124:VerifyQuests(v427) do
                        task.wait()
                        if vu428.PrimaryPart then
                            vu123(vu428.PrimaryPart.CFrame + vu2.FarmPos)
                            pcall(function()
								-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu428
                                vu7()
                                vu336()
                                vu11(vu428)
                            end)
                        end
                    end
                elseif v426.Enemie.Position then
                    vu86:NPCs(v426.Enemie.Position)
                else
                    vu123(vu124:GetQuestPosition())
                end
            else
                local v429 = vu124
                vu357(v426.Quest.Name, v426.Quest.Count, v429:GetQuestPosition())
            end
        end
    end
end
local function vu439()
	-- upvalues: (ref) vu2, (ref) vu39, (ref) vu8, (ref) vu361, (ref) vu124, (ref) vu357, (ref) vu123, (ref) vu7, (ref) vu331, (ref) vu11, (ref) vu35, (ref) vu14, (ref) vu324, (ref) vu13, (ref) vu86
    vu2.ClickRequest = false
    while vu2.AutoFarmMastery do
        task.wait()
        local v431 = vu39
        if v431 then
            local v432 = v431.Enemie.Name
            local vu433 = vu8(v432)
            vu361()
            if vu124:VerifyQuests(v432) then
                local v434 = vu2.HealthSkill
                local vu435 = vu2.ToolMastery
                if vu433 and vu433:FindFirstChild("HumanoidRootPart") then
                    local v436 = vu433 and vu433:FindFirstChild("Humanoid")
                    if v436 then
                        v436 = vu433.Humanoid.Health
                    end
                    if v436 and v436 < vu433.Humanoid.MaxHealth * v434 / 100 then
                        vu123(vu433.HumanoidRootPart.CFrame + Vector3.new(0, vu2.FarmDistance, 0))
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu331, (ref) vu435, (ref) vu11, (ref) vu433
                            vu7()
                            vu331(vu435)
                            vu11(vu433, true)
                        end)
                        if vu435 == "Gun" then
                            local v437 = vu35.Character
                            if v437 then
                                v437 = vu35.Character:FindFirstChildOfClass("Tool")
                            end
                            if v437 and v437:FindFirstChild("RemoteFunctionShoot") then
                                v437.RemoteFunctionShoot:InvokeServer(vu433.HumanoidRootPart.Position)
                            end
                        end
                        if vu2.AimBotSkill then
                            vu14(vu433.HumanoidRootPart)
                        end
                        if vu2.SkillZ then
                            vu324("Z")
                        end
                        if vu2.SkillX then
                            vu324("X")
                        end
                        if vu2.SkillC then
                            vu324("C")
                        end
                        if vu2.SkillV then
                            vu324("V")
                        end
                        if vu2.SkillF then
                            vu324("F")
                        end
                    elseif v436 and vu433.Humanoid.MaxHealth * v434 / 100 <= v436 then
                        vu123(vu433.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu13, (ref) vu7, (ref) vu331, (ref) vu11, (ref) vu433
                            vu13()
                            vu7()
                            vu331("Melee")
                            vu11(vu433)
                        end)
                    end
                elseif v431.Enemie.Position then
                    vu86:NPCs(v431.Enemie.Position)
                end
            else
                local v438 = vu124
                vu357(v431.Quest.Name, v431.Quest.Count, v438:GetQuestPosition())
            end
        end
    end
    vu2.ClickRequest = true
end
local function vu445()
	-- upvalues: (ref) vu32, (ref) vu35
    local v440 = vu32
    local v441, v442, v443 = pairs(v440:GetChildren())
    while true do
        local v444
        v443, v444 = v441(v442, v443)
        if v443 == nil then
            break
        end
        if v444:FindFirstChild("Owner") and v444.Owner.Value.Name == vu35.Name then
            v444:Destroy()
        end
    end
end
local function vu452()
	-- upvalues: (ref) vu32, (ref) vu35
    local v446 = vu32
    local v447, v448, v449 = pairs(v446:GetChildren())
    while true do
        local v450
        v449, v450 = v447(v448, v449)
        if v449 == nil then
            break
        end
        local v451 = v450:FindFirstChild("Humanoid")
        if v451 and (v451.Value > 0 and (v450:FindFirstChild("Owner") and v450.Owner.Value.Name == vu35.Name)) then
            return v450
        end
    end
end
local function vu486()
	-- upvalues: (ref) vu35, (ref) vu2, (ref) vu34, (ref) vu123, (ref) vu4, (ref) vu214
    local vu453 = nil
    local vu454 = workspace:WaitForChild("Boats", 9000000000)
    local function v460()
		-- upvalues: (ref) vu454, (ref) vu35, (ref) vu453
        local v455 = vu454
        local v456, v457, v458 = pairs(v455:GetChildren())
        while true do
            local v459
            v458, v459 = v456(v457, v458)
            if v458 == nil then
                break
            end
            if v459:FindFirstChild("Humanoid") and (v459.Humanoid.Value > 0 and (v459:FindFirstChild("Owner") and v459.Owner.Value.Name == vu35.Name)) then
                vu453 = v459
                return v459
            end
        end
    end
    local function v468()
		-- upvalues: (ref) vu35
        local v461 = math.huge
        local v462, v463, v464 = pairs(workspace:GetChildren())
        local v465 = nil
        while true do
            local v466
            v464, v466 = v462(v463, v464)
            if v464 == nil then
                break
            end
            if v466.Name == "EmberTemplate" and (v466:FindFirstChild("Part") and v466.Part.Position.Y > 0) then
                local v467 = vu35.Character
                if v467 then
                    v467 = vu35.Character.PrimaryPart
                end
                if v467 and (v467.Position - v466.Part.Position).Magnitude <= v461 then
                    v461 = (v467.Position - v466.Part.Position).Magnitude
                    v465 = v466.Part
                end
            end
        end
        return v465
    end
    local v469 = true
    local v470 = nil
    local v471 = nil
    local v472 = nil
    while vu2.AutoKitsuneIsland do
        task.wait()
        local v473 = vu35.Character
        local v474 = v460()
        if v474 then
            if not v474:FindFirstChild("BodyVelocity") then
                Instance.new("BodyVelocity", v474).Velocity = Vector3.new()
            end
            local v475, v476, v477 = pairs(v474:GetDescendants())
            while true do
                local v478
                v477, v478 = v475(v476, v477)
                if v477 == nil then
                    break
                end
                if v478:IsA("BasePart") or v478:IsA("MeshPart") and v478.Name ~= "VehicleSeat" then
                    v478.CanCollide = false
                end
            end
        end
        local v479 = vu34:FindFirstChild("KitsuneIsland")
        if v479 then
            local v480 = vu35.Character
            local v481
            if v480 then
                v481 = v480.PrimaryPart
            else
                v481 = v480
            end
            if v480 then
                v480 = v480:FindFirstChild("Humanoid")
            end
            local v482 = v479:FindFirstChild("ShrineDialogPart")
            local v483 = v468()
            if v480 and v480.Sit then
                v480.Sit = false
            end
            if v483 then
                if v483 then
                    vu123(v483.CFrame)
                else
                    vu123(v479.WorldPivot)
                end
            elseif (not v481 or (not v482 or ((v481.Position - v482.Position).Magnitude >= 5 or not v482:FindFirstChild("ProximityPrompt")))) and v482 then
                vu123(v482.CFrame)
            end
        elseif v474 then
            if v474:FindFirstChild("VehicleSeat") then
                local v484 = vu35.Character
                if v484 then
                    v484 = v484:FindFirstChild("Humanoid")
                end
                if v484 and v484.SeatPart ~= v474.VehicleSeat then
                    vu123(v474.VehicleSeat.CFrame)
                    v484.Sit = false
                    if v474.PrimaryPart then
                        vu214(v474, v474.PrimaryPart.CFrame)
                    end
                elseif v474.PrimaryPart then
                    local v485 = v474.PrimaryPart
                    if v469 then
                        vu214(v474, CFrame.new(- 43000, 21, 500))
                        if (v485.Position - Vector3.new(- 43000, 21, 500)).Magnitude < 100 then
                            v469 = false
                            v470 = true
                        end
                    elseif v470 then
                        vu214(v474, CFrame.new(- 56000, 21, 500))
                        if (v485.Position - Vector3.new(- 56000, 21, 500)).Magnitude < 100 then
                            v470 = false
                            v471 = true
                        end
                    elseif v471 then
                        vu214(v474, CFrame.new(- 56000, 21, 2000))
                        if (v485.Position - Vector3.new(- 56000, 21, 2000)).Magnitude < 100 then
                            v471 = false
                            v472 = true
                        end
                    elseif v472 then
                        vu214(v474, CFrame.new(- 43000, 21, - 1000))
                        if (v485.Position - Vector3.new(- 43000, 21, - 1000)).Magnitude < 100 then
                            v469 = true
                            v472 = false
                        end
                    end
                end
            end
        elseif (v473.PrimaryPart.Position - Vector3.new(- 6123, 16, - 2247)).Magnitude > 5 then
            vu123(CFrame.new(- 6123, 16, - 2247))
        else
            vu4("BuyBoat", "Guardian")
        end
    end
    if vu453 and vu453.PrimaryPart then
        vu214(vu453, vu453.PrimaryPart.CFrame)
    end
end
local function vu487()
	-- upvalues: (ref) vu2, (ref) vu324
    if vu2.SeaSkillZ then
        vu324("Z")
    end
    if vu2.SeaSkillX then
        vu324("X")
    end
    if vu2.SeaSkillC then
        vu324("C")
    end
    if vu2.SeaSkillV then
        vu324("V")
    end
    if vu2.SeaSkillF then
        vu324("F")
    end
end
local function vu547()
	-- upvalues: (ref) vu2, (ref) vu314, (ref) vu32, (ref) vu35, (ref) vu31, (ref) vu30, (ref) vu4, (ref) vu390, (ref) vu214, (ref) vu123, (ref) vu331, (ref) vu23, (ref) vu487, (ref) vu14
    local vu488 = nil
    local vu489 = ""
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu314, (ref) vu489
        while vu2.Sea2_AutoFarmSea do
            if vu314("Melee") then
                vu489 = "Melee"
                task.wait(2)
            end
            if vu314("Blox Fruit") then
                vu489 = "Blox Fruit"
                task.wait(3)
            end
            if vu314("Sword") then
                vu489 = "Sword"
                task.wait(2)
            end
            if vu314("Gun") then
                vu489 = "Gun"
                task.wait(2)
            end
        end
    end)
    local function v495()
		-- upvalues: (ref) vu32, (ref) vu35, (ref) vu488
        local v490 = vu32
        local v491, v492, v493 = pairs(v490:GetChildren())
        while true do
            local v494
            v493, v494 = v491(v492, v493)
            if v493 == nil then
                break
            end
            if v494:FindFirstChild("Humanoid") and (v494.Humanoid.Value > 0 and (v494:FindFirstChild("Owner") and v494.Owner.Value.Name == vu35.Name)) then
                vu488 = v494
                return v494
            end
        end
    end
    local function v505(pu496, p497)
		-- upvalues: (ref) vu488, (ref) vu31
        local vu498 = p497 or 2000
        local vu499 = nil
        local function v503(_, p500)
			-- upvalues: (ref) pu496, (ref) vu488, (ref) vu498, (ref) vu499
            if p500.Name == pu496 and (p500:FindFirstChild("Health") and p500.Health.Value > 0) then
                local v501
                if p500 then
                    v501 = p500.PrimaryPart
                else
                    v501 = p500
                end
                local v502 = vu488
                if v502 then
                    v502 = vu488.PrimaryPart
                end
                if v502 and (v501 and (v502.Position - v501.Position).Magnitude < vu498) then
                    vu498 = (v502.Position - v501.Position).Magnitude
                    vu499 = p500
                end
            end
        end
        local v504 = vu31
        table.foreach(v504:GetChildren(), v503)
        return vu499
    end
    local function v517(p506)
		-- upvalues: (ref) vu30, (ref) vu488
        local v507 = vu30
        local v508, v509, v510 = pairs(v507:GetChildren())
        local v511 = p506 or 3000
        local v512 = nil
        while true do
            local v513
            v510, v513 = v508(v509, v510)
            if v510 == nil then
                break
            end
            local v514 = v513:FindFirstChild("Health")
            if v514 and v514.Value > 0 then
                local v515 = vu488
                if v515 then
                    v515 = vu488.PrimaryPart
                end
                local v516
                if v513 then
                    v516 = v513.PrimaryPart
                else
                    v516 = v513
                end
                if v515 and (v516 and (v515.Position - v516.Position).Magnitude <= v511) then
                    v511 = (v515.Position - v516.Position).Magnitude
                    v512 = v513
                end
            end
        end
        return v512
    end
    local vu518 = Vector3.new(30, 0, 0)
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu518
        while vu2.Sea2_AutoFarmSea do
            vu518 = Vector3.new(60, 0, 0)
            task.wait(1)
            vu518 = Vector3.new(0, 0, 60)
            task.wait(1)
            vu518 = Vector3.new(- 60, 0, 0)
            task.wait(1)
            vu518 = Vector3.new(0, 0, - 60)
            task.wait(1)
            vu518 = Vector3.new(0, 0, 0)
            task.wait(1)
        end
    end)
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu488
        while vu2.Sea2_AutoFarmSea do
            task.wait()
            if vu488 then
                if not vu488:FindFirstChild("BodyVelocity") then
                    Instance.new("BodyVelocity", vu488).Velocity = Vector3.new()
                end
                local v519 = vu488
                local v520, v521, v522 = pairs(v519:GetDescendants())
                while true do
                    local v523
                    v522, v523 = v520(v521, v522)
                    if v522 == nil then
                        break
                    end
                    if v523:IsA("BasePart") or v523:IsA("MeshPart") and v523.Name ~= "VehicleSeat" then
                        v523.CanCollide = false
                    end
                end
            end
        end
    end)
    local function v525()
		-- upvalues: (ref) vu35, (ref) vu2, (ref) vu4
        local v524 = vu35.Character
        if v524 then
            v524 = vu35.Character:FindFirstChild("HasBuso")
        end
        if vu2.AutoHaki and not v524 then
            vu4("Buso")
        end
    end
    local function v527()
		-- upvalues: (ref) vu35, (ref) vu2, (ref) vu4
        local v526 = vu35.Character
        if v526 then
            v526 = vu35.Character:FindFirstChild("HasBuso")
        end
        if vu2.AutoHaki and v526 then
            vu4("Buso")
        end
    end
    local v528 = vu489
    local v529 = vu518
    local v530 = true
    local v531 = nil
    local v532 = nil
    local v533 = nil
    while vu2.Sea2_AutoFarmSea do
        task.wait()
        if vu390("Farm Sea") then
            pcall(function()
				-- upvalues: (ref) vu35
                vu35.Character.Humanoid.Sit = false
            end)
            local v534 = v495()
            if v534 and v534.PrimaryPart then
                vu214(v534, v534.PrimaryPart.CFrame)
            end
        else
            local v535 = v495()
            local v536 = v517()
            local v537 = v505("PirateBrigade")
            if vu2.PirateBrigade and v537 then
                local v538 = v537.PrimaryPart
                if v538 then
                    local v539 = v538.CFrame + vu2.FarmPos
                    vu123(v539)
                    vu331(v528)
                    if (vu23.Position - v539.p).Magnitude < 50 then
                        vu487()
                    end
                    if v535 and v535.PrimaryPart then
                        vu214(v535, v535.PrimaryPart.CFrame)
                    end
                    if vu2.SeaAimBotSkill then
                        vu14(v538)
                    end
                    v525()
                end
                pcall(function()
					-- upvalues: (ref) vu35
                    vu35.Character.Humanoid.Sit = false
                end)
            elseif vu2.KillSeaBeasts and v536 then
                local v540 = v536:FindFirstChild("HumanoidRootPart")
                if v540 then
                    local v541 = v540.Position
                    local v542 = CFrame.new(Vector3.new(v541.X, 25, v541.Z) + v529)
                    vu123(v542)
                    vu331(v528)
                    if (vu23.Position - v542.p).Magnitude < 50 then
                        vu487()
                    end
                    if v535 and v535.PrimaryPart then
                        vu214(v535, v535.PrimaryPart.CFrame)
                    end
                    if vu2.SeaAimBotSkill then
                        vu14(v540)
                    end
                    v525()
                end
                pcall(function()
					-- upvalues: (ref) vu35
                    vu35.Character.Humanoid.Sit = false
                end)
            elseif v535 then
                local v543 = vu35.Character
                if v543 then
                    v543 = v543:FindFirstChild("Humanoid")
                end
                local v544 = v535:FindFirstChild("VehicleSeat")
                if v543 and v544 then
                    if v543.SeatPart and v543.SeatPart ~= v544 then
                        v543.Sit = false
                    elseif v543.SeatPart == v544 then
                        v527()
                        local v545 = v535.PrimaryPart
                        if v545 then
                            if v530 then
                                if (v545.Position - Vector3.new(- 43, 21, 5054)).Magnitude >= 100 then
                                    vu214(v535, CFrame.new(- 43, 21, 5054))
                                else
                                    v530 = false
                                    v531 = true
                                end
                            elseif v531 then
                                if (v545.Position - Vector3.new(1744, 21, 4393)).Magnitude >= 100 then
                                    vu214(v535, CFrame.new(1744, 21, 4393))
                                else
                                    v531 = false
                                    v532 = true
                                end
                            elseif v532 then
                                if (v545.Position - Vector3.new(1003, 21, 3598)).Magnitude >= 100 then
                                    vu214(v535, CFrame.new(1003, 21, 3598))
                                else
                                    v532 = false
                                    v533 = true
                                end
                            elseif v533 then
                                if (v545.Position - Vector3.new(- 935, 21, 3813)).Magnitude >= 100 then
                                    vu214(v535, CFrame.new(- 935, 21, 3813))
                                else
                                    v530 = true
                                    v533 = false
                                end
                            end
                        end
                    else
                        vu123(v544.CFrame)
                        if v535 and v535.PrimaryPart then
                            vu214(v535, v535.PrimaryPart.CFrame)
                        end
                    end
                end
            else
                local v546 = vu35.Character
                if v546 then
                    v546 = vu35.Character.PrimaryPart
                end
                if v546 and (v546.Position - Vector3.new(94, 10, 2951)).Magnitude <= 5 then
                    vu4("BuyBoat", "Guardian")
                else
                    vu123(CFrame.new(94, 10, 2951))
                end
            end
        end
    end
    if vu488 and vu488.PrimaryPart then
        vu214(vu488, vu488.PrimaryPart.CFrame)
    end
end
local function vu607()
	-- upvalues: (ref) vu2, (ref) vu214, (ref) vu314, (ref) vu31, (ref) vu30, (ref) vu35, (ref) vu4, (ref) vu452, (ref) vu8, (ref) vu123, (ref) vu331, (ref) vu23, (ref) vu487, (ref) vu14, (ref) vu7, (ref) vu336
    local vu548 = ""
    local vu549 = nil
    local vu550 = true
    local vu551 = nil
    local vu552 = nil
    local vu553 = nil
    local function v556()
		-- upvalues: (ref) vu2, (ref) vu549, (ref) vu550, (ref) vu214, (ref) vu551, (ref) vu552, (ref) vu553
        local v554 = vu2.SeaLevelTP == "inf" and - 100000000 or (vu2.SeaLevelTP == "6" and - 42700 or (vu2.SeaLevelTP == "5" and - 38000 or (vu2.SeaLevelTP == "4" and - 34000 or (vu2.SeaLevelTP == "3" and - 30000 or (vu2.SeaLevelTP == "2" and - 26000 or (vu2.SeaLevelTP == "1" and - 22000 or nil))))))
        local v555 = vu549
        if v555 then
            v555 = vu549.PrimaryPart
        end
        if v555 then
            if vu550 then
                vu214(vu549, CFrame.new(v554, 21, 500))
                if (v555.Position - Vector3.new(v554, 21, 500)).Magnitude < 100 then
                    vu551 = true
                    vu550 = false
                end
            elseif vu551 then
                vu214(vu549, CFrame.new(v554 - 3000, 21, 500))
                if (v555.Position - Vector3.new(v554 - 3000, 21, 500)).Magnitude < 100 then
                    vu552 = true
                    vu551 = false
                end
            elseif vu552 then
                vu214(vu549, CFrame.new(v554 - 3000, 21, 2000))
                if (v555.Position - Vector3.new(v554 - 3000, 21, 2000)).Magnitude < 100 then
                    vu553 = true
                    vu552 = false
                end
            elseif vu553 then
                vu214(vu549, CFrame.new(v554, 21, - 1000))
                if (v555.Position - Vector3.new(v554, 21, - 1000)).Magnitude < 100 then
                    vu550 = true
                    vu553 = false
                end
            end
        end
    end
    local function v558()
		-- upvalues: (ref) vu549, (ref) vu214
        local v557 = vu549
        if v557 then
            v557 = vu549.PrimaryPart
        end
        if v557 then
            vu214(vu549, v557.CFrame)
        end
    end
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu314, (ref) vu548
        while vu2.AutoFarmSea do
            if vu314("Melee") then
                vu548 = "Melee"
                task.wait(2)
            end
            if vu314("Blox Fruit") then
                vu548 = "Blox Fruit"
                task.wait(3)
            end
            if vu314("Sword") then
                vu548 = "Sword"
                task.wait(2)
            end
            if vu314("Gun") then
                vu548 = "Gun"
                task.wait(2)
            end
        end
    end)
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu549
        while vu2.AutoFarmSea do
            task.wait()
            if vu549 then
                if not vu549:FindFirstChild("BodyVelocity") then
                    Instance.new("BodyVelocity", vu549).Velocity = Vector3.new()
                end
                local v559 = vu549
                local v560, v561, v562 = pairs(v559:GetDescendants())
                while true do
                    local v563
                    v562, v563 = v560(v561, v562)
                    if v562 == nil then
                        break
                    end
                    if v563:IsA("BasePart") or v563:IsA("MeshPart") and v563.Name ~= "VehicleSeat" then
                        v563.CanCollide = false
                    end
                end
            end
        end
    end)
    local function v573(pu564, p565)
		-- upvalues: (ref) vu549, (ref) vu31
        local vu566 = p565 or 2000
        local vu567 = nil
        local function v571(_, p568)
			-- upvalues: (ref) pu564, (ref) vu549, (ref) vu566, (ref) vu567
            if table.find(pu564, p568.Name) and (p568:FindFirstChild("Health") and p568.Health.Value > 0) then
                local v569
                if p568 then
                    v569 = p568.PrimaryPart
                else
                    v569 = p568
                end
                local v570 = vu549
                if v570 then
                    v570 = vu549.PrimaryPart
                end
                if v570 and (v569 and (v570.Position - v569.Position).Magnitude < vu566) then
                    vu566 = (v570.Position - v569.Position).Magnitude
                    vu567 = p568
                end
            end
        end
        local v572 = vu31
        table.foreach(v572:GetChildren(), v571)
        return vu567
    end
    local function v585(p574)
		-- upvalues: (ref) vu30, (ref) vu549
        local v575 = vu30
        local v576, v577, v578 = pairs(v575:GetChildren())
        local v579 = p574 or 3000
        local v580 = nil
        while true do
            local v581
            v578, v581 = v576(v577, v578)
            if v578 == nil then
                break
            end
            local v582 = v581:FindFirstChild("Health")
            if v582 and v582.Value > 0 then
                local v583 = vu549
                if v583 then
                    v583 = vu549.PrimaryPart
                end
                local v584
                if v581 then
                    v584 = v581.PrimaryPart
                else
                    v584 = v581
                end
                if v583 and (v584 and (v583.Position - v584.Position).Magnitude <= v579) then
                    v579 = (v583.Position - v584.Position).Magnitude
                    v580 = v581
                end
            end
        end
        return v580
    end
    local vu586 = Vector3.new(30, 0, 0)
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu586
        while vu2.AutoFarmSea do
            vu586 = Vector3.new(60, 0, 0)
            task.wait(1)
            vu586 = Vector3.new(0, 0, 60)
            task.wait(1)
            vu586 = Vector3.new(- 60, 0, 0)
            task.wait(1)
            vu586 = Vector3.new(0, 0, - 60)
            task.wait(1)
            vu586 = Vector3.new(0, 0, 0)
            task.wait(1)
        end
    end)
    local function v588()
		-- upvalues: (ref) vu35, (ref) vu2, (ref) vu4
        local v587 = vu35.Character
        if v587 then
            v587 = vu35.Character:FindFirstChild("HasBuso")
        end
        if vu2.AutoHaki and not v587 then
            vu4("Buso")
        end
    end
    local function v590()
		-- upvalues: (ref) vu35, (ref) vu2, (ref) vu4
        local v589 = vu35.Character
        if v589 then
            v589 = vu35.Character:FindFirstChild("HasBuso")
        end
        if vu2.AutoHaki and v589 then
            vu4("Buso")
        end
    end
    local v591 = vu548
    local v592 = vu586
    local v593 = vu549
    while vu2.AutoFarmSea do
        task.wait()
        vu549 = vu452()
        if vu549 then
            local v594 = vu8({
                vu2.FishCrewMember and "Fish Crew Member" or nil,
                vu2.Terrorshark and "Terrorshark" or nil,
                vu2.Piranha and "Piranha" or nil,
                vu2.Shark and "Shark" or nil
            }, 2500)
            local v595 = v573({
                vu2.PirateGrandBrigade and "PirateGrandBrigade" or nil,
                vu2.PirateBrigade and "PirateBrigade" or nil,
                vu2.FishBoat and "FishBoat" or nil
            }, 2500)
            local v596 = v585(2500)
            if v595 then
                local v597 = v595.PrimaryPart
                if v597 then
                    local v598 = v597.CFrame + vu2.FarmPos
                    vu123(v598)
                    vu331(v591)
                    if (vu23.Position - v598.p).Magnitude < 75 then
                        vu487()
                    end
                    if vu2.SeaAimBotSkill then
                        vu14(v597)
                    end
                    v588()
                    v558()
                end
                pcall(function()
					-- upvalues: (ref) vu35
                    vu35.Character.Humanoid.Sit = false
                end)
                v593 = vu549
            elseif vu2.KillSeaBeasts and v596 then
                local v599 = v596:FindFirstChild("HumanoidRootPart")
                if v599 then
                    local v600 = v599.Position
                    local v601 = CFrame.new(Vector3.new(v600.X, 25, v600.Z) + v592)
                    vu123(v601)
                    vu331(v591)
                    if (vu23.Position - v601.p).Magnitude < 50 then
                        vu487()
                    end
                    if vu2.SeaAimBotSkill then
                        vu14(v599)
                    end
                    v588()
                    v558()
                end
                pcall(function()
					-- upvalues: (ref) vu35
                    vu35.Character.Humanoid.Sit = false
                end)
                v593 = vu549
            elseif v594 then
                local v602 = v594.PrimaryPart
                if v602 then
                    vu123(v602.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336
                        vu7()
                        vu336()
                    end)
                end
                v588()
                v558()
                pcall(function()
					-- upvalues: (ref) vu35
                    vu35.Character.Humanoid.Sit = false
                end)
                v593 = vu549
            else
                local v603 = vu35.Character
                if v603 then
                    v603 = v603:FindFirstChild("Humanoid")
                end
                local v604 = vu549
                local v605 = vu549.FindFirstChild(v604, "VehicleSeat")
                if v603 and v605 then
                    if v603.SeatPart and v603.SeatPart ~= v605 then
                        v603.Sit = false
                        v558()
                        v593 = vu549
                    elseif v603.SeatPart == v605 then
                        v556()
                        v590()
                        v593 = vu549
                    else
                        vu123(v605.CFrame)
                        v558()
                        v593 = vu549
                    end
                else
                    v593 = vu549
                end
            end
        else
            local v606 = vu35.Character
            if v606 then
                v606 = vu35.Character.PrimaryPart
            end
            if v606 and (v606.Position - Vector3.new(- 6123, 16, - 2247)).Magnitude < 5 then
                vu4("BuyBoat", "Guardian")
                v593 = vu549
            else
                vu123(CFrame.new(- 6123, 16, - 2247))
                v593 = vu549
            end
        end
    end
    if v593 and v593.PrimaryPart then
        vu214(v593, v593.PrimaryPart.CFrame)
    end
end
local function vu627()
	-- upvalues: (ref) vu34, (ref) vu35, (ref) vu2, (ref) vu314, (ref) vu331, (ref) vu123, (ref) vu324, (ref) vu14
    local vu608 = vu34:WaitForChild("Boat Castle", 9000000000)
    local function vu613()
		-- upvalues: (ref) vu608
        local v609, v610, v611 = pairs(vu608.IslandModel:GetChildren())
        while true do
            local v612
            v611, v612 = v609(v610, v611)
            if v611 == nil then
                break
            end
            if v612.Name == "Model" and v612:FindFirstChild("Tree") then
                return v612
            end
        end
    end
    local function v622()
		-- upvalues: (ref) vu613, (ref) vu35
        local v614 = vu613()
        if v614 then
            local v615 = math.huge
            local v616, v617, v618 = pairs(v614:GetChildren())
            local v619 = nil
            while true do
                local v620
                v618, v620 = v616(v617, v618)
                if v618 == nil then
                    break
                end
                local v621 = vu35.Character
                if v621 then
                    v621 = vu35.Character.PrimaryPart
                end
                if v620 and (v620.PrimaryPart and (v620.PrimaryPart.Anchored and (v621 and (v621.Position - v620.PrimaryPart.Position).Magnitude < v615))) then
                    v615 = (v621.Position - v620.PrimaryPart.Position).Magnitude
                    v619 = v620
                end
            end
            return v619
        end
    end
    local vu623 = ""
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu314, (ref) vu623
        while vu2.AutoWoodPlanks do
            if vu314("Melee") then
                vu623 = "Melee"
                task.wait(2)
            end
            if vu314("Blox Fruit") then
                vu623 = "Blox Fruit"
                task.wait(3)
            end
            if vu314("Sword") then
                vu623 = "Sword"
                task.wait(2)
            end
            if vu314("Gun") then
                vu623 = "Gun"
                task.wait(2)
            end
        end
    end)
    local v624 = vu623
    while vu2.AutoWoodPlanks do
        task.wait()
        local v625 = v622()
        vu331(v624)
        if v625 and v625.PrimaryPart then
            vu123(v625.PrimaryPart.CFrame)
            local v626 = vu35.Character
            if v626 then
                v626 = vu35.Character.PrimaryPart
            end
            if v626 and (v626.Position - v625.PrimaryPart.Position).Magnitude < 10 then
                if vu2.SeaSkillZ then
                    vu324("Z")
                end
                if vu2.SeaSkillX then
                    vu324("X")
                end
                if vu2.SeaSkillC then
                    vu324("C")
                end
                if vu2.SeaSkillV then
                    vu324("V")
                end
                if vu2.SeaSkillF then
                    vu324("F")
                end
                if vu2.SeaAimBotSkill then
                    vu14(v625.PrimaryPart)
                end
            end
        end
    end
end
local function vu630()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu361, (ref) vu124, (ref) vu8, (ref) vu209, (ref) vu123, (ref) vu86, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoEliteHunter do
        task.wait()
        if vu390("Elite Hunter") then
            vu2.EliteHunter = false
        else
            vu361()
            local v628 = nil
            if vu124:VerifyQuest("Diablo") then
                v628 = "Diablo"
            elseif vu124:VerifyQuest("Deandre") then
                v628 = "Deandre"
            elseif vu124:VerifyQuest("Urban") then
                v628 = "Urban"
            elseif vu8(vu209.Elite) then
                vu123(CFrame.new(- 5417, 313, - 2822))
                vu2.EliteHunter = true
                vu86:NPCTalk(CFrame.new(- 5417, 313, - 2822), "EliteHunter")
            else
                vu2.EliteHunter = false
                task.wait(1)
            end
            if v628 then
                local vu629 = vu8({
                    v628
                }, true)
                if vu629 then
                    vu123(vu629.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu629
                        vu7()
                        vu336()
                        vu11(vu629)
                    end)
                end
                vu2.EliteHunter = true
            end
        end
    end
    vu2.EliteHunter = false
end
local function vu632()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoSawBoss do
        task.wait()
        if not vu390("Saw Boss") then
            local v631 = vu8({
                "The Saw"
            }, true)
            if v631 and v631:FindFirstChild("HumanoidRootPart") then
                vu123(v631.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 690, 15, 1583))
            end
        end
    end
end
local function vu635()
	-- upvalues: (ref) vu2, (ref) vu4, (ref) vu36, (ref) vu22, (ref) vu124, (ref) vu123, (ref) vu86, (ref) vu8, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu194, (ref) vu6
    local vu633 = {}
    local vu634 = 0
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu633, (ref) vu4, (ref) vu634
        while vu2.AutoMusketeerHat do
            task.wait(1)
            vu633 = vu4("CitizenQuestProgress")
            vu634 = vu4("CitizenQuestProgress", "Citizen")
        end
    end)
    while vu2.AutoMusketeerHat do
        task.wait()
        if vu36.Value >= 1800 then
            if vu22("Musketeer Hat", "Accessory") then
                break
            end
        else
            vu2.CitizenQuest = false
        end
    end
    vu2.CitizenQuest = false
end
local function vu637()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoEnelBossPole do
        task.wait()
        if not vu390("Enel Boss") then
            local v636 = vu8({
                "Thunder God"
            }, true)
            if v636 and v636:FindFirstChild("HumanoidRootPart") then
                vu123(v636.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 7739, 5657, - 2289))
            end
        end
    end
end
local function vu643()
	-- upvalues: (ref) vu2, (ref) vu124, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu5, (ref) vu4
    while vu2.AutoRainbowHaki do
        task.wait()
        if vu124:VerifyQuest("Stone") then
            local v638 = vu8({
                "Stone"
            }, true)
            if v638 and v638:FindFirstChild("HumanoidRootPart") then
                vu123(v638.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 1049, 40, 6791))
                if vu2.RainbowHakiHop then
                    vu5()
                end
            end
        elseif vu124:VerifyQuest("Island Empress") then
            local v639 = vu8({
                "Island Empress"
            }, true)
            if v639 and v639:FindFirstChild("HumanoidRootPart") then
                vu123(v639.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(5730, 602, 199))
                if vu2.RainbowHakiHop then
                    vu5()
                end
            end
        elseif vu124:VerifyQuest("Kilo Admiral") then
            local v640 = vu8({
                "Kilo Admiral"
            }, true)
            if v640 and v640:FindFirstChild("HumanoidRootPart") then
                vu123(v640.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(2889, 424, - 7233))
                if vu2.RainbowHakiHop then
                    vu5()
                end
            end
        elseif vu124:VerifyQuest("Captain Elephant") then
            local v641 = vu8({
                "Captain Elephant"
            }, true)
            if v641 and v641:FindFirstChild("HumanoidRootPart") then
                vu123(v641.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 13393, 319, - 8423))
                if vu2.RainbowHakiHop then
                    vu5()
                end
            end
        elseif vu124:VerifyQuest("Beautiful Pirate") then
            local v642 = vu8({
                "Beautiful Pirate"
            }, true)
            if v642 and v642:FindFirstChild("HumanoidRootPart") then
                vu123(v642.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(5241, 23, 129))
                if vu2.RainbowHakiHop then
                    vu5()
                end
            end
        else
            vu4("HornedMan", "Bet")
        end
    end
end
local function vu654()
	-- upvalues: (ref) vu15, (ref) vu34, (ref) vu2, (ref) vu302, (ref) vu22, (ref) vu4, (ref) vu36, (ref) vu6, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu321, (ref) vu35
    local vu644 = {}
    local v645 = vu15(vu34, "Jungle", "QuestPlates")
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu302, (ref) vu22, (ref) vu644, (ref) vu4
        while vu2.AutoUnlockSaber do
            task.wait()
            if not (vu302("Relic") or vu22("Saber")) then
                vu644 = vu4("ProQuestProgress")
                vu4("ProQuestProgress", "RichSon")
                vu4("ProQuestProgress", "SickMan")
            end
        end
    end)
    local v646 = vu644
    while vu2.AutoUnlockSaber do
        task.wait()
        if vu36.Value >= 200 then
            if vu22("Saber") then
                break
            end
            if v646.UsedRelic or vu34.Jungle.Final.Part.Transparency > 0 then
                if vu6("Saber Expert") then
                    local v647 = vu8({
                        "Saber Expert"
                    }, true)
                    if v647 and v647:FindFirstChild("HumanoidRootPart") then
                        vu123(v647.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                        vu2.UnlockSaber = true
                    else
                        vu123(CFrame.new(- 1461, 30, - 51))
                    end
                    vu2.UnlockSaber = true
                else
                    vu2.UnlockSaber = false
                end
            elseif v646.UsedTorch and not (v646.UsedCup or vu302("Cup")) then
                vu123(vu34.Desert.Cup.CFrame)
                vu2.UnlockSaber = true
            elseif vu302("Cup") and not v646.UsedCup then
                pcall(function()
					-- upvalues: (ref) vu321
                    vu321("Cup")
                end)
                pcall(function()
					-- upvalues: (ref) vu34, (ref) vu35
                    vu34.Ice.ParticleDrop.Water.CFrame = vu35.Character.Cup.Handle.CFrame
                end)
                vu2.UnlockSaber = true
            elseif vu302("Relic") and not v646.UsedRelic then
                vu123(CFrame.new(- 1408, 30, 3))
                vu321("Relic")
                vu2.UnlockSaber = true
            elseif vu302("Torch") and not v646.UsedTorch then
                vu123(CFrame.new(1113.69897, 4.92146635, 4350.47803, - 0.790008128, - 7.41044488e-8, - 0.613096356, - 5.52859589e-8, 1, - 4.96301915e-8, 0.613096356, - 5.31263389e-9, - 0.790008128))
                vu321("Torch")
                vu2.UnlockSaber = true
            elseif v646.UsedCup and not v646.KilledMob then
                local v648 = vu8({
                    "Mob Leader"
                }, true)
                if v648 and v648:FindFirstChild("HumanoidRootPart") then
                    vu123(v648.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336
                        vu7()
                        vu336()
                    end)
                    vu2.UnlockSaber = true
                else
                    vu2.UnlockSaber = false
                end
            elseif v645:FindFirstChild("Door") and v645.Door.CanCollide then
                local v649 = v645:FindFirstChild("Plate1")
                local v650 = v645:FindFirstChild("Plate2")
                local v651 = v645:FindFirstChild("Plate3")
                local v652 = v645:FindFirstChild("Plate4")
                local v653 = v645:FindFirstChild("Plate5")
                if v649 and (v649:FindFirstChild("Button") and v649.Button.BrickColor ~= BrickColor.new("Camo")) then
                    vu123(v649.Button.CFrame)
                elseif v650 and (v650:FindFirstChild("Button") and v650.Button.BrickColor ~= BrickColor.new("Camo")) then
                    vu123(v650.Button.CFrame)
                elseif v651 and (v651:FindFirstChild("Button") and v651.Button.BrickColor ~= BrickColor.new("Camo")) then
                    vu123(v651.Button.CFrame)
                elseif v652 and (v652:FindFirstChild("Button") and v652.Button.BrickColor ~= BrickColor.new("Camo")) then
                    vu123(v652.Button.CFrame)
                elseif v653 and (v653:FindFirstChild("Button") and v653.Button.BrickColor ~= BrickColor.new("Camo")) then
                    vu123(v653.Button.CFrame)
                end
                vu2.UnlockSaber = true
            elseif v645:FindFirstChild("Door") and not v645.Door.CanCollide then
                vu123(vu34.Jungle.Torch.CFrame)
                vu2.UnlockSaber = true
            else
                vu2.UnlockSaber = false
            end
        else
            vu2.UnlockSaber = false
        end
    end
    vu2.UnlockSaber = false
end
local function vu656()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu209, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoFarmEctoplasm do
        task.wait()
        if not vu390("Ectoplasm") then
            local vu655 = vu8(vu209.Ectoplasm)
            if vu655 then
                vu123(vu655.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu655
                    vu7()
                    vu336()
                    vu11(vu655, true)
                end)
            else
                vu123(CFrame.new(912, 186, 33591))
            end
        end
    end
end
local function vu663()
	-- upvalues: (ref) vu2, (ref) vu45, (ref) vu44, (ref) vu43, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    local vu657 = {}
    local vu658 = nil
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu45, (ref) vu657, (ref) vu658, (ref) vu44, (ref) vu43
        while vu2.AutoFarmMaterial do
            task.wait()
            local v659 = vu2.MaterialSelected
            if vu45 then
                if v659 == "Angel Wings" then
                    vu658 = CFrame.new(- 7742, 5634, - 1564)
                    vu657 = {
                        "Royal Soldier",
                        "Royal Squad"
                    }
                elseif v659 == "Leather + Scrap Metal" then
                    vu658 = CFrame.new(- 1257, 54, 4091)
                    vu657 = {
                        "Pirate",
                        "Brute"
                    }
                elseif v659 == "Magma Ore" then
                    vu658 = CFrame.new(- 5408, 11, 8456)
                    vu657 = {
                        "Military Soldier"
                    }
                elseif v659 == "Fish Tail" then
                    vu658 = CFrame.new(60931, 19, 1574)
                    vu657 = {
                        "Fishman Warrior"
                    }
                end
            elseif vu44 then
                if v659 == "Leather + Scrap Metal" then
                    vu658 = CFrame.new(- 1026, 73, 1375)
                    vu657 = {
                        "Scrap Metal"
                    }
                elseif v659 == "Magma Ore" then
                    vu658 = CFrame.new(- 5241, 50, - 4713)
                    vu657 = {
                        "Lava Pirate"
                    }
                elseif v659 == "Mystic Droplet" then
                    vu658 = CFrame.new(- 3350, 282, - 10527)
                    vu657 = {
                        "Water Fighter"
                    }
                elseif v659 == "Radiactive Material" then
                    vu658 = CFrame.new(- 73, 149, - 112)
                    vu657 = {
                        "Factory Staff"
                    }
                elseif v659 == "Vampire Fang" then
                    vu658 = CFrame.new(- 6030, 6, - 1281)
                    vu657 = {
                        "Vampire"
                    }
                end
            elseif vu43 then
                if v659 == "Leather + Scrap Metal" then
                    vu658 = CFrame.new(- 364, 116, 5692)
                    vu657 = {
                        "Pirate Millionaire"
                    }
                elseif v659 == "Fish Tail" then
                    vu658 = CFrame.new(- 10679, 398, - 8975)
                    vu657 = {
                        "Fishman Captain",
                        "Fishman Raider"
                    }
                elseif v659 == "Gunpowder" then
                    vu658 = CFrame.new(- 394, 135, 5981)
                    vu657 = {
                        "Pistol Billionaire"
                    }
                elseif v659 == "Mini Tusk" then
                    vu658 = CFrame.new(- 13510, 584, - 6986)
                    vu657 = {
                        "Mythological Pirate"
                    }
                elseif v659 == "Conjured Cocoa" then
                    vu658 = CFrame.new(400, 81, - 12257)
                    vu657 = {
                        "Cocoa Warrior",
                        "Chocolate Bar Battler"
                    }
                elseif v659 == "Dragon Scale" then
                    vu658 = CFrame.new(6689, 378, 331)
                    vu657 = {
                        "Dragon Crew Archer"
                    }
                end
            end
        end
    end)
    local v660 = vu658
    local v661 = vu657
    while vu2.AutoFarmMaterial do
        task.wait()
        if not vu390("Material") then
            local vu662 = vu8(v661)
            if vu662 and vu662:FindFirstChild("HumanoidRootPart") then
                vu123(vu662.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu662
                    vu7()
                    vu336()
                    vu11(vu662, true)
                end)
            elseif v660 then
                vu123(v660)
            end
        end
    end
end
local function vu665()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu209, (ref) vu395, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoFarmBone do
        task.wait()
        if not vu390("Bone") then
            local vu664 = vu8(vu209.Bones)
            if vu664 then
                while vu395("AutoFarmBone", "Bone", vu664) do
                    task.wait()
                    if vu664.PrimaryPart then
                        vu123(vu664.PrimaryPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu664
                            vu7()
                            vu336()
                            vu11(vu664, true)
                        end)
                    end
                end
            else
                vu123(CFrame.new(- 9513, 164, 5786))
            end
        end
    end
end
local function vu673()
	-- upvalues: (ref) vu31, (ref) vu9, (ref) vu2, (ref) vu390, (ref) vu395, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    local function v671()
		-- upvalues: (ref) vu31, (ref) vu9
        local v666 = vu31
        local v667, v668, v669 = pairs(v666:GetChildren())
        while true do
            local v670
            v669, v670 = v667(v668, v669)
            if v669 == nil then
                break
            end
            if v670.Name ~= "rip_indra True Form" and (v670.Name ~= "Blank Buddy" and (vu9(v670) and (v670.PrimaryPart and (v670.PrimaryPart.Position - Vector3.new(- 5556, 314, - 2988)).Magnitude < 700))) then
                return v670
            end
        end
    end
    while vu2.AutoPiratesSea do
        task.wait()
        if vu390("Raid Pirate") then
            vu2.PiratesSea = false
            task.wait(1)
        else
            local vu672 = v671()
            if vu672 and vu672:FindFirstChild("HumanoidRootPart") then
                while vu395("AutoPiratesSea", "Raid Pirate", vu672) do
                    task.wait()
                    if vu672.PrimaryPart then
                        vu123(vu672.PrimaryPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu672
                            vu7()
                            vu336()
                            vu11(vu672, true)
                        end)
                    end
                end
            else
                vu123(CFrame.new(- 5556, 300, - 2988))
                task.wait()
            end
            vu2.PiratesSea = true
        end
    end
    vu2.PiratesSea = false
end
local function vu674()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu6, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoFactory do
        task.wait()
        if vu390("Factory") then
            vu2.FarmingFactory = false
            task.wait(1)
        elseif vu6("Core") then
            vu123(CFrame.new(410, 200, - 414))
            pcall(function()
				-- upvalues: (ref) vu7, (ref) vu336
                vu7()
                vu336()
            end)
            vu2.FarmingFactory = true
        else
            vu2.FarmingFactory = false
        end
    end
end
local function vu679()
	-- upvalues: (ref) vu2, (ref) vu36, (ref) vu35, (ref) vu302, (ref) vu123, (ref) vu4, (ref) vu321, (ref) vu6, (ref) vu8, (ref) vu7, (ref) vu336
    local v675 = workspace:WaitForChild("Map", 9000000000):WaitForChild("Ice", 9000000000)
    while vu2.AutoSecondSea do
        task.wait()
        if vu36.Value >= 700 then
            local v676 = vu35.Character
            if v676 then
                v676 = v676.PrimaryPart
            end
            local v677 = v675:FindFirstChild("Door") and v675.Door.CanCollide
            if v677 then
                v677 = v675.Door.Transparency < 1
            end
            if vu302("Key") or not v677 then
                if vu302("Key") and v677 then
                    vu321("Key")
                    vu123(CFrame.new(1346, 37, - 1329))
                    vu2.FarmingSecondSea = true
                elseif vu6("Ice Admiral") and (v675:FindFirstChild("Door") and (not v675.Door.CanCollide and v675.Door.Transparency > 0)) then
                    local v678 = vu8({
                        "Ice Admiral"
                    }, true)
                    if v678 and v678:FindFirstChild("HumanoidRootPart") then
                        vu123(v678.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    end
                    vu2.FarmingSecondSea = true
                else
                    vu2.FarmingSecondSea = false
                    vu4("TravelDressrosa")
                end
            else
                vu123(CFrame.new(4852, 6, 719))
                if v676 and (v676.Position - Vector3.new(4852, 6, 719)).Magnitude < 5 then
                    vu4("DressrosaQuestProgress", "Detective")
                end
                vu2.FarmingSecondSea = true
            end
        else
            vu2.FarmingSecondSea = false
        end
    end
    vu2.FarmingSecondSea = false
end
local function vu693()
	-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu4, (ref) vu36, (ref) vu123, (ref) vu7, (ref) vu336
    local vu680 = 0
    local function v689()
		-- upvalues: (ref) vu35, (ref) vu31
        local v681 = 2000
        local v682 = nil
        local v683 = vu35 and vu35.Character
        if v683 then
            v683 = vu35.Character.PrimaryPart
        end
        local v684 = vu31
        local v685, v686, v687 = pairs(v684:GetChildren())
        while true do
            local v688
            v687, v688 = v685(v686, v687)
            if v687 == nil then
                break
            end
            if v688.Name == "rip_indra" and (v683 and (v688 and (v688:FindFirstChild("HumanoidRootPart") and (v683.Position - v688.HumanoidRootPart.Position).Magnitude <= v681))) then
                v681 = (v683.Position - v688.HumanoidRootPart.Position).Magnitude
                v682 = v688
            end
        end
        return v682
    end
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu680, (ref) vu4
        while vu2.AutoThirdSea do
            task.wait()
            vu680 = vu4("ZQuestProgress", "Check")
            vu4("TravelZou")
        end
    end)
    local v690 = vu680
    while vu2.AutoThirdSea do
        task.wait()
        if vu36.Value >= 1500 then
            local v691 = v689()
            if v691 and v691:FindFirstChild("HumanoidRootPart") then
                vu123(v691.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            elseif v690 == 0 then
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    vu123(boss.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336
                        vu7()
                        vu336()
                    end)
                else
                    local v692 = vu35 and vu35.Character
                    if v692 then
                        v692 = vu35.Character.PrimaryPart
                    end
                    if v692 and (v692.Position - Vector3.new(- 1926, 13, 1738)).Magnitude < 5 then
                        vu4("ZQuestProgress", "Begin")
                        task.wait(3)
                    else
                        vu123(CFrame.new(- 1926, 13, 1738))
                    end
                end
            end
        end
    end
end
local function vu699()
	-- upvalues: (ref) vu15, (ref) vu34, (ref) vu2, (ref) vu4, (ref) vu36, (ref) vu22, (ref) vu361, (ref) vu124, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu86, (ref) vu194, (ref) vu357, (ref) vu6
    local vu694 = {}
    local v695 = vu15(vu34, "Dressrosa", "BartiloPlates")
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu694, (ref) vu4
        while vu2.AutoBartiloQuest do
            task.wait()
            vu694 = vu4("BartiloQuestProgress")
            vu4("BartiloQuestProgress", "Bartilo")
        end
    end)
    local v696 = vu694
    while vu2.AutoBartiloQuest do
        task.wait()
        if vu36.Value >= 850 then
            if vu22("Warrior Helmet", "Accessory") then
                break
            end
            if v696.KilledBandits then
                if v696.KilledSpring then
                    if v696.DidPlates then
                        vu2.BartiloQuest = false
                    else
                        if v695 and (v695:FindFirstChild("Plate1") and v695.Plate1.Color.G ~= 1) then
                            vu123(v695.Plate1.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate2") and v695.Plate2.Color.G ~= 1) then
                            vu123(v695.Plate2.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate3") and v695.Plate3.Color.G ~= 1) then
                            vu123(v695.Plate3.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate4") and v695.Plate4.Color.G ~= 1) then
                            vu123(v695.Plate4.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate5") and v695.Plate5.Color.G ~= 1) then
                            vu123(v695.Plate5.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate6") and v695.Plate6.Color.G ~= 1) then
                            vu123(v695.Plate6.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate7") and v695.Plate7.Color.G ~= 1) then
                            vu123(v695.Plate7.CFrame)
                        elseif v695 and (v695:FindFirstChild("Plate8") and v695.Plate8.Color.G ~= 1) then
                            vu123(v695.Plate8.CFrame)
                        end
                        vu2.BartiloQuest = true
                    end
                elseif vu6("Jeremy") then
                    local vu697 = vu8({
                        "Jeremy"
                    }, true)
                    if vu697 and vu697:FindFirstChild("HumanoidRootPart") then
                        vu123(vu697.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu697
                            vu7()
                            vu336()
                            vu11(vu697)
                        end)
                    else
                        vu123(CFrame.new(2316, 449, 787))
                    end
                    vu2.BartiloQuest = true
                else
                    vu2.BartiloQuest = false
                end
            else
                vu361()
                if vu124:VerifyQuest("Swan Pirate") and vu124:VerifyQuest("50") then
                    local vu698 = vu8({
                        "Swan Pirate"
                    })
                    if vu698 then
                        vu123(vu698.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu698
                            vu7()
                            vu336()
                            vu11(vu698)
                        end)
                    else
                        vu86:NPCs(vu194("Swan Pirate") or {
                            CFrame.new(778, 110, 1129),
                            CFrame.new(1018, 110, 1128),
                            CFrame.new(1020, 110, 1366),
                            CFrame.new(1016, 110, 1115)
                        })
                    end
                else
                    vu357("BartiloQuest", 1, CFrame.new(- 462, 73, 300))
                end
                vu2.BartiloQuest = true
            end
        else
            vu2.BartiloQuest = false
        end
    end
    vu2.BartiloQuest = false
end
local function vu701()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu302, (ref) vu321
    while vu2.AutoRipIndra do
        task.wait()
        if vu390("Rip Indra") then
            vu2.RipIndra = false
        else
            local v700 = vu8({
                "rip_indra True Form"
            }, true)
            if v700 and v700:FindFirstChild("HumanoidRootPart") then
                vu123(v700.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
                vu2.RipIndra = true
            elseif vu302("God\'s Chalice") then
                vu321("God\'s Chalice")
                vu123(CFrame.new(- 5561, 314, - 2663))
                vu2.RipIndra = true
            else
                vu2.RipIndra = false
            end
        end
    end
end
local function vu703()
	-- upvalues: (ref) vu2, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoKillLawBoss do
        task.wait()
        local v702 = vu8({
            "Order"
        }, true)
        if v702 and v702:FindFirstChild("HumanoidRootPart") then
            vu123(v702.HumanoidRootPart.CFrame + vu2.FarmPos)
            pcall(function()
				-- upvalues: (ref) vu7, (ref) vu336
                vu7()
                vu336()
            end)
            vu2.FarmingLawBoss = true
        else
            vu2.FarmingLawBoss = false
        end
    end
    vu2.FarmingLawBoss = false
end
local function vu723()
	-- upvalues: (ref) vu35, (ref) vu31, (ref) vu9, (ref) vu7, (ref) vu336, (ref) vu341, (ref) vu123, (ref) vu2, (ref) vu4, (ref) vu22, (ref) vu36, (ref) vu298, (ref) vu86
    local function v713()
		-- upvalues: (ref) vu35, (ref) vu31, (ref) vu9, (ref) vu7, (ref) vu336, (ref) vu341, (ref) vu123
        local v704 = vu35.Character
        if v704 then
            v704 = vu35.Character.PrimaryPart
        end
        if v704 and (v704.Position - Vector3.new(- 10139, 154, 6001)).Magnitude < 5 then
            local v705 = vu31
            local v706, v707, v708 = pairs(v705:GetChildren())
            local v709 = 0
            while true do
                local v710
                v708, v710 = v706(v707, v708)
                if v708 == nil then
                    break
                end
                if v710.Name == "Living Zombie" and vu9(v710) then
                    local v711 = v710.PrimaryPart
                    if v711 then
                        v709 = v709 + 1
                        v711.CFrame = v704.CFrame * CFrame.new(0, - 15, - 15)
                        v711.CanCollide = false
                        v711.Size = Vector3.new(60, 60, 60)
                        local v712 = v710:FindFirstChild("Humanoid")
                        if v712 then
                            v712.WalkSpeed = 0
                            v712.JumpPower = 0
                            v712:ChangeState(14)
                            if v712:FindFirstChild("Animator") then
                                v712.Animator:Destroy()
                            end
                        end
                        if v710:FindFirstChild("Head") and v710.Head.CanCollide then
                            v710.Head.CanCollide = false
                        end
                        sethiddenproperty(vu35, "SimulationRadius", math.huge)
                    end
                end
            end
            if v709 > 5 then
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu341()
            end
        else
            vu123(CFrame.new(- 10139, 154, 6001))
        end
    end
    local vu714 = {}
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu714, (ref) vu4
        while vu2.AutoSoulGuitar do
            task.wait()
            vu714 = vu4("GuitarPuzzleProgress", "Check")
        end
    end)
    local v715 = vu714
    local v716 = nil
    while vu2.AutoSoulGuitar do
        task.wait()
        if vu22("Soul Guitar", "Gun") then
            break
        end
        if vu36.Value < 2300 then
            vu2.SoulGuitar = false
        elseif vu298("9709149431") then
            if v716 then
                vu714 = v715 or {}
                local v717 = vu714.Swamp
                local v718 = vu714.Gravestones
                local v719 = vu714.Ghost
                local v720 = vu714.Trophies
                local v721 = vu714.Pipes
                local _ = vu714.CraftedOnce
                if v717 then
                    if v717 and not v718 then
                        vu123(CFrame.new(- 8760, 142, 6018))
                        vu2.SoulGuitar = true
                        vu86:NPCTalk(CFrame.new(- 8760, 142, 6018), "GuitarPuzzleProgress", "Gravestones")
                        task.wait(1)
                        v715 = vu714
                    elseif v717 and (v718 and not v719) then
                        vu123(CFrame.new(- 9758, 270, 6291))
                        vu2.SoulGuitar = true
                        vu86:NPCTalk(CFrame.new(- 9758, 270, 6291), "GuitarPuzzleProgress", "Ghost")
                        task.wait(1)
                        v715 = vu714
                    elseif v717 and (v718 and (v719 and not v720)) then
                        vu123(CFrame.new(- 9529, 6, 6039))
                        vu2.SoulGuitar = true
                        vu86:NPCTalk(CFrame.new(- 9529, 6, 6039), "GuitarPuzzleProgress", "Trophies")
                        task.wait(1)
                        v715 = vu714
                    elseif v717 and (v718 and (v719 and (v720 and not v721))) then
                        vu123(CFrame.new(- 9576, 6, 6230))
                        vu2.SoulGuitar = true
                        vu86:NPCTalk(CFrame.new(- 9576, 6, 6230), "GuitarPuzzleProgress", "Pipes")
                        task.wait(1)
                        v715 = vu714
                    elseif vu22("Soul Guitar", "Gun") then
                        vu2.SoulGuitar = false
                        v715 = vu714
                    else
                        vu123(CFrame.new(- 9680, 6, 6346))
                        vu2.SoulGuitar = true
                        vu86:NPCTalk(CFrame.new(- 9680, 6, 6346), "soulGuitarBuy", true)
                        v715 = vu714
                    end
                else
                    v713()
                    vu2.SoulGuitar = true
                    v715 = vu714
                end
            else
                local v722 = vu35.Character
                if v722 then
                    v722 = vu35.Character.PrimaryPart
                end
                if v722 and (v722.Position - Vector3.new(- 8654, 141, 6169)).Magnitude < 5 then
                    vu4("gravestoneEvent", 2)
                    vu4("gravestoneEvent", 2, true)
                    v716 = true
                else
                    vu123(CFrame.new(- 8654, 141, 6169))
                    vu2.SoulGuitar = true
                end
            end
        else
            vu2.SoulGuitar = false
        end
    end
    vu2.SoulGuitar = false
end
local function vu782()
	-- upvalues: (ref) vu15, (ref) vu34, (ref) vu21, (ref) vu302, (ref) vu4, (ref) vu331, (ref) vu8, (ref) vu209, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu11, (ref) vu31, (ref) vu9, (ref) vu22, (ref) vu20, (ref) vu35, (ref) vu6, (ref) vu208, (ref) vu26, (ref) vu86, (ref) vu321, (ref) vu194, (ref) vu336, (ref) vu341, (ref) vu18, (ref) vu33, (ref) vu36
    local vu724 = vu15(vu34, "Turtle", "Cursed")
    local v725 = {}
    local function vu729()
		-- upvalues: (ref) vu21, (ref) vu302, (ref) vu4, (ref) vu331, (ref) vu8, (ref) vu209, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu11
        local v726 = vu21("Tushita")
        local v727 = vu21("Yama")
        if v726 and v726 < 350 then
            if not vu302("Tushita") then
                vu4("LoadItem", "Tushita")
            end
        else
            if not v727 or v727 >= 350 then
                return false
            end
            if not vu302("Yama") then
                vu4("LoadItem", "Yama")
            end
        end
        vu331("Sword")
        local vu728 = vu8(vu209.Bones)
        if vu728 then
            vu123(vu728.HumanoidRootPart.CFrame + vu2.FarmPos)
            pcall(function()
				-- upvalues: (ref) vu7, (ref) vu11, (ref) vu728
                vu7()
                vu11(vu728, true)
            end)
        else
            vu123(CFrame.new(- 9513, 164, 5786))
        end
        return true
    end
    local function vu734(p730)
        if p730 then
            local v731 = p730:FindFirstChild("Torch1")
            local v732 = p730:FindFirstChild("Torch2")
            local v733 = p730:FindFirstChild("Torch3")
            if v731 and (v731:FindFirstChild("ProximityPrompt") and v731.ProximityPrompt.Enabled) then
                return v731
            end
            if v732 and (v732:FindFirstChild("ProximityPrompt") and v732.ProximityPrompt.Enabled) then
                return v732
            end
            if v733 and (v733:FindFirstChild("ProximityPrompt") and v733.ProximityPrompt.Enabled) then
                return v733
            end
            local _ = p730.FindFirstChild
        end
    end
    local function vu740()
		-- upvalues: (ref) vu31, (ref) vu9
        local v735 = vu31
        local v736, v737, v738 = pairs(v735:GetChildren())
        while true do
            local v739
            v738, v739 = v736(v737, v738)
            if v738 == nil then
                break
            end
            if v739.Name ~= "rip_indra True Form" and (vu9(v739) and (v739.PrimaryPart and (v739.PrimaryPart.Position - Vector3.new(- 5556, 314, - 2988)).Magnitude < 700)) then
                return v739
            end
        end
    end
    local function vu745()
		-- upvalues: (ref) vu22, (ref) vu729, (ref) vu20, (ref) vu724, (ref) vu35, (ref) vu34, (ref) vu4
        if vu22("Cursed Dual Katana") then
            return {
                "Finished"
            }
        end
        if vu729() then
            return {
                "MasterySwords"
            }
        end
        local v741 = vu20("Alucard Fragment")
        if vu724:FindFirstChild("Breakable") then
            return {
                "OpenDoor"
            }
        end
        if vu35:FindFirstChild("QuestHaze") then
            return {
                "Yama",
                2
            }
        end
        if vu34:FindFirstChild("HellDimension") then
            return {
                "Yama",
                3
            }
        end
        if vu34:FindFirstChild("HeavenlyDimension") then
            return {
                "Tushita",
                3
            }
        end
        if v741 == 6 then
            return {
                "FinalQuest"
            }
        end
        if v741 == 0 then
            vu4("CDKQuest", "Progress", "Evil")
            vu4("CDKQuest", "StartTrial", "Evil")
            return {
                "Yama",
                1
            }
        end
        local v742 = vu4("CDKQuest", "Progress")
        local v743 = v742.Good
        local v744 = v742.Evil
        if v744 and (0 <= v744 and v744 < 3) then
            vu4("CDKQuest", "Progress", "Evil")
            vu4("CDKQuest", "StartTrial", "Evil")
            if v744 == 0 then
                return {
                    "Yama",
                    1
                }
            end
            if v744 == 1 then
                return {
                    "Yama",
                    2
                }
            end
            if v744 == 2 then
                return {
                    "Yama",
                    3
                }
            end
        elseif v743 and (0 <= v743 and v743 < 3) then
            vu4("CDKQuest", "Progress", "Good")
            vu4("CDKQuest", "StartTrial", "Good")
            if v743 == 0 then
                return {
                    "Tushita",
                    1
                }
            end
            if v743 == 1 then
                return {
                    "Tushita",
                    2
                }
            end
            if v743 == 2 then
                return {
                    "Tushita",
                    3
                }
            end
        end
    end
    function v725.OpenDoor(_)
		-- upvalues: (ref) vu35, (ref) vu4, (ref) vu724, (ref) vu123, (ref) vu2
        if vu35:DistanceFromCharacter(Vector3.new(- 12131, 578, - 6707)) >= 5 then
            vu123(CFrame.new(- 12131, 578, - 6707))
            vu2.CursedDualKatana = true
        else
            vu4("CDKQuest", "OpenDoor")
            vu4("CDKQuest", "OpenDoor", true)
            if vu724:FindFirstChild("Breakable") then
                vu724.Breakable:Destroy()
            end
        end
    end
    function v725.KillFinalBoss(_)
		-- upvalues: (ref) vu302, (ref) vu4, (ref) vu6, (ref) vu8, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu331, (ref) vu724, (ref) vu208, (ref) vu26, (ref) vu35, (ref) vu86
        if vu302("Tushita") or vu302("Yama") then
            if vu6("Cursed Skeleton Boss") then
                local v746 = vu8({
                    "Cursed Skeleton Boss"
                }, true)
                if v746 and v746:FindFirstChild("HumanoidRootPart") then
                    vu123(v746.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7
                        vu7()
                    end)
                end
                vu331("Sword")
            else
                local v747 = vu724:FindFirstChild("Pedestal1")
                local v748 = vu724:FindFirstChild("Pedestal2")
                local v749 = vu724:FindFirstChild("Pedestal3")
                local v750
                if v749 and (v749:FindFirstChild("ProximityPrompt") and v749.ProximityPrompt.Enabled) then
                    v750 = v749.ProximityPrompt
                else
                    v749 = nil
                    v750 = nil
                end
                if v748 and (v748:FindFirstChild("ProximityPrompt") and v748.ProximityPrompt.Enabled) then
                    v750 = v748.ProximityPrompt
                else
                    v748 = v749
                end
                if v747 and (v747:FindFirstChild("ProximityPrompt") and v747.ProximityPrompt.Enabled) then
                    v750 = v747.ProximityPrompt
                else
                    v747 = v748
                end
                if vu208() then
                    vu26:ClickButton1(Vector2.new(10000, 10000))
                elseif v747 then
                    local v751 = vu35.Character
                    if v751 then
                        v751 = vu35.Character.PrimaryPart
                    end
                    if v751 and (v751.Position - v747.Position).Magnitude < 10 then
                        if v750 and fireproximityprompt then
                            fireproximityprompt(v750)
                            task.wait(0.5)
                        end
                    else
                        vu123(v747.CFrame)
                    end
                else
                    vu123(CFrame.new(- 8760, 142, 6018))
                    vu86:NPCTalk(CFrame.new(- 8760, 142, 6018), "CDKQuest", "SpawnBoss")
                    task.wait(1)
                end
            end
        else
            vu4("LoadItem", "Tushita")
        end
        vu2.CursedDualKatana = true
    end
    function v725.DieGhost(_)
		-- upvalues: (ref) vu302, (ref) vu4, (ref) vu8, (ref) vu321, (ref) vu123, (ref) vu2
        if vu302("Yama") then
            local v752 = vu8({
                "Forest Pirate"
            })
            vu321("Yama")
            if v752 and v752:FindFirstChild("HumanoidRootPart") then
                vu123(v752.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2))
            else
                vu123(CFrame.new(- 13350, 332, - 7645))
            end
            vu2.CursedDualKatana = true
        else
            vu4("LoadItem", "Yama")
        end
    end
    function v725.KillHazeEnemies(_)
		-- upvalues: (ref) vu35, (ref) vu194, (ref) vu8, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu86
        local v753 = vu35:FindFirstChild("QuestHaze")
        if v753 then
            local v754 = math.huge
            local v755, v756, v757 = pairs(v753:GetChildren())
            local v758 = nil
            while true do
                local v759
                v757, v759 = v755(v756, v757)
                if v757 == nil then
                    break
                end
                if v759.Value > 0 then
                    local v760 = v759:GetAttribute("Position")
                    local v761
                    if typeof(v760) ~= "Vector3" then
                        v761 = false
                    else
                        v761 = vu35:DistanceFromCharacter(v760)
                    end
                    if v761 and v761 <= v754 then
                        v758 = {
                            ["Name"] = v759.Name,
                            ["Position"] = vu194(v759.Name) or v760
                        }
                        v754 = v761
                    end
                end
            end
            if v758 then
                local vu762 = vu8({
                    v758.Name
                })
                if vu762 and vu762:FindFirstChild("HumanoidRootPart") then
                    vu123(vu762.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu762
                        vu7()
                        vu336()
                        vu11(vu762)
                    end)
                elseif v758.Position then
                    vu86:NPCs(v758.Position)
                end
                vu2.CursedDualKatana = true
            else
                vu2.CursedDualKatana = false
                task.wait(1)
            end
        else
            vu2.CursedDualKatana = false
            task.wait(1)
        end
    end
    function v725.InvokeSoulReaper(_)
		-- upvalues: (ref) vu34, (ref) vu35, (ref) vu8, (ref) vu734, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu341, (ref) vu302, (ref) vu321, (ref) vu20, (ref) vu4, (ref) vu209
        local v763 = vu34:FindFirstChild("HellDimension")
        if v763 then
            local v764 = vu35.Character
            if v764 then
                v764 = vu35.Character.PrimaryPart
            end
            if v764 and (v764.Position - v763.WorldPivot.p).Magnitude < 2500 then
                local vu765 = vu8({
                    "Hell\'s Messenger",
                    "Cursed Skeleton"
                }, 2500)
                local v766 = vu734(v763)
                if vu765 then
                    vu123(vu765.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu765
                        vu7()
                        vu336()
                        vu11(vu765, true)
                    end)
                elseif v766 then
                    vu123(v766.CFrame)
                    if (v764.Position - v766.Position).Magnitude < 10 and (v766:FindFirstChild("ProximityPrompt") and fireproximityprompt) then
                        fireproximityprompt(v766.ProximityPrompt)
                        task.wait(0.5)
                    end
                end
                vu2.CursedDualKatana = true
            else
                vu2.CursedDualKatana = false
                task.wait(1)
            end
        else
            local v767 = vu8({
                "Soul Reaper"
            }, true)
            if v767 and v767:FindFirstChild("HumanoidRootPart") then
                vu123(v767.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0))
                vu341()
            elseif vu302("Hallow Essence") then
                vu321("Hallow Essence")
                pcall(function()
					-- upvalues: (ref) vu123, (ref) vu34
                    vu123(vu34["Haunted Castle"].Summoner.Detection.CFrame)
                end)
            else
                if vu20("Bones") >= 50 then
                    vu4("Bones", "Buy", 1, 1)
                end
                local vu768 = vu8(vu209.Bones)
                if vu768 then
                    vu123(vu768.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu768
                        vu7()
                        vu336()
                        vu11(vu768, true)
                    end)
                else
                    vu123(CFrame.new(- 9513, 164, 5786))
                end
            end
            vu2.CursedDualKatana = true
        end
    end
    function v725.PirateRaid(_)
		-- upvalues: (ref) vu18, (ref) vu740, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11
        if vu18(true) then
            local vu769 = vu740()
            if vu769 and vu769:FindFirstChild("HumanoidRootPart") then
                vu123(vu769.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu769
                    vu7()
                    vu336()
                    vu11(vu769, true)
                end)
            else
                vu123(CFrame.new(- 5556, 314, - 2988))
            end
            vu2.CursedDualKatana = true
        else
            vu2.CursedDualKatana = false
            task.wait(2.5)
        end
    end
    local vu770 = nil
    local vu771 = nil
    local vu772 = nil
    function v725.BoatDealer(_)
		-- upvalues: (ref) vu35, (ref) vu33, (ref) vu770, (ref) vu123, (ref) vu2, (ref) vu4, (ref) vu771, (ref) vu772
        local v773 = vu35.Character
        if v773 then
            v773 = vu35.Character.PrimaryPart
        end
        local v774 = vu33:FindFirstChild("Luxury Boat Dealer")
        if v773 then
            if vu770 then
                if vu771 then
                    if vu772 then
                        vu2.CursedDualKatana = false
                        task.wait(1)
                    else
                        vu123(CFrame.new(- 4602, 16, - 2880))
                        vu2.CursedDualKatana = true
                        if v774 and (v773.Position - Vector3.new(- 4602, 16, - 2880)).Magnitude < 5 then
                            vu4("CDKQuest", "BoatQuest", v774)
                            vu4("CDKQuest", "BoatQuest", v774, "Check")
                            task.wait(1)
                            vu772 = true
                        end
                    end
                else
                    vu123(CFrame.new(- 9531, 7, - 8376))
                    vu2.CursedDualKatana = true
                    if v774 and (v773.Position - Vector3.new(- 9531, 7, - 8376)).Magnitude < 5 then
                        vu4("CDKQuest", "BoatQuest", v774)
                        vu4("CDKQuest", "BoatQuest", v774, "Check")
                        task.wait(1)
                        vu771 = true
                    end
                end
            else
                vu123(CFrame.new(- 9550, 21, 4638))
                vu2.CursedDualKatana = true
                if v774 and (v773.Position - Vector3.new(- 9550, 21, 4638)).Magnitude < 5 then
                    vu4("CDKQuest", "BoatQuest", v774)
                    vu4("CDKQuest", "BoatQuest", v774, "Check")
                    task.wait(1)
                    vu770 = true
                end
            end
        end
    end
    function v725.BigMoon(_)
		-- upvalues: (ref) vu34, (ref) vu35, (ref) vu8, (ref) vu734, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu6
        local v775 = vu34:FindFirstChild("HeavenlyDimension")
        if v775 then
            local v776 = vu35.Character
            if v776 then
                v776 = vu35.Character.PrimaryPart
            end
            if v776 and (v776.Position - v775.WorldPivot.p).Magnitude < 2500 then
                local vu777 = vu8({
                    "Heaven\'s Guardian",
                    "Cursed Skeleton"
                }, 2500)
                local v778 = vu734(v775)
                if vu777 then
                    vu123(vu777.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu777
                        vu7()
                        vu336()
                        vu11(vu777, true)
                    end)
                elseif v778 then
                    vu123(v778.CFrame)
                    if (v776.Position - v778.Position).Magnitude < 10 and (v778:FindFirstChild("ProximityPrompt") and fireproximityprompt) then
                        fireproximityprompt(v778.ProximityPrompt)
                        task.wait(0.5)
                    end
                end
                vu2.CursedDualKatana = true
            else
                vu2.CursedDualKatana = false
            end
        elseif vu6("Cake Queen") then
            local v779 = vu8({
                "Cake Queen"
            }, true)
            if v779 and v779:FindFirstChild("HumanoidRootPart") then
                vu123(v779.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 710, 382, - 11150))
            end
            vu2.CursedDualKatana = true
        else
            vu2.CursedDualKatana = false
            task.wait(1)
        end
    end
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu745
        while vu2.AutoCDK do
            task.wait(1)
            local v780 = vu745()
            if v780 then
                vu2.CDK_Progress = v780
            end
        end
    end)
    while vu2.AutoCDK do
        task.wait()
        if vu36.Value >= 2200 then
            local v781 = vu2.CDK_Progress or {
                "Error"
            }
            if v781[1] == "Error" or v781[1] == "Finished" then
                vu2.CursedDualKatana = false
            elseif v781[1] ~= "MasterySwords" then
                if v781[1] ~= "OpenDoor" then
                    if v781[1] ~= "FinalQuest" then
                        if v781[1] ~= "Tushita" then
                            if v781[1] == "Yama" then
                                if v781[2] ~= 1 then
                                    if v781[2] ~= 2 then
                                        if v781[2] == 3 then
                                            v725:InvokeSoulReaper()
                                            vu2.ClickRequest = true
                                        end
                                    else
                                        v725:KillHazeEnemies()
                                        vu2.ClickRequest = true
                                    end
                                else
                                    v725:DieGhost()
                                    vu2.ClickRequest = false
                                end
                            end
                        else
                            if v781[2] ~= 1 then
                                if v781[2] ~= 2 then
                                    if v781[2] == 3 then
                                        v725:BigMoon()
                                    end
                                else
                                    v725:PirateRaid()
                                end
                            else
                                v725:BoatDealer()
                            end
                            vu2.ClickRequest = true
                        end
                    else
                        v725:KillFinalBoss()
                    end
                else
                    v725:OpenDoor()
                end
            else
                vu2.CursedDualKatana = true
            end
        end
    end
    vu2.ClickRequest = true
    vu2.CursedDualKatana = false
end
local function vu784()
	-- upvalues: (ref) vu2, (ref) vu8, (ref) vu302, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu321
    while vu2.AutoDarkbeard do
        task.wait()
        local v783 = vu8({
            "Darkbeard"
        }, true)
        if v783 or vu302("Fist of Darkness") then
            if v783 and v783:FindFirstChild("HumanoidRootPart") then
                vu123(v783.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu321("Fist of Darkness")
                vu123(CFrame.new(3779, 16, - 3500))
            end
            vu2.FarmingDarkbeard = true
        else
            vu2.FarmingDarkbeard = false
        end
    end
    vu2.FarmingDarkbeard = false
end
local function vu786()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu5
    while vu2.AutoKillDonSwan do
        task.wait()
        if not vu390("Don Swan") then
            local v785 = vu8({
                "Don Swan"
            }, true)
            if v785 and v785:FindFirstChild("HumanoidRootPart") then
                vu123(v785.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            elseif vu2.AutoDonSwanHop then
                vu5()
            else
                vu123(CFrame.new(2272, 15, 759))
            end
        end
    end
end
local function vu788()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoCursedCaptain do
        task.wait()
        if vu390("Cursed Captain") then
            vu2.CursedCaptain = false
        else
            local v787 = vu8({
                "Cursed Captain"
            }, true)
            if v787 and v787:FindFirstChild("HumanoidRootPart") then
                vu123(v787.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
                vu2.CursedCaptain = true
            else
                vu2.CursedCaptain = false
            end
        end
    end
end
local function vu792()
	-- upvalues: (ref) vu2, (ref) vu4, (ref) vu390, (ref) vu6, (ref) vu35, (ref) vu123, (ref) vu8, (ref) vu7, (ref) vu336, (ref) vu209, (ref) vu395, (ref) vu11
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu4
        while vu2.AutoCakePrince do
            task.wait(1)
            vu4("CakePrinceSpawner")
        end
    end)
    while vu2.AutoCakePrince do
        task.wait()
        if not vu390("Cake Prince") then
            if vu6("Dough King") or vu6("Cake Prince") then
                local v789 = vu35.Character
                if v789 then
                    v789 = vu35.Character.PrimaryPart
                end
                if v789 and v789.Position.Y < 3500 then
                    vu123(CFrame.new(- 2150, 70, - 12406))
                else
                    local v790 = vu8({
                        "Dough King",
                        "Cake Prince"
                    })
                    if v790 and v790:FindFirstChild("HumanoidRootPart") then
                        vu123(v790.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    end
                end
            elseif not vu390("Dough King 2") then
                local vu791 = vu8(vu209.CakePrince)
                if vu791 and vu791:FindFirstChild("HumanoidRootPart") then
                    while vu395("AutoCakePrince", "Cake Prince", vu791) and not vu390("Dough King 2") do
                        task.wait()
                        if vu791.PrimaryPart then
                            vu123(vu791.PrimaryPart.CFrame + vu2.FarmPos)
                            pcall(function()
								-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu791
                                vu7()
                                vu336()
                                vu11(vu791, true)
                            end)
                        end
                    end
                else
                    vu123(CFrame.new(- 2103, 70, - 12165))
                    task.wait(1)
                end
            end
        end
    end
end
local function vu801()
	-- upvalues: (ref) vu2, (ref) vu302, (ref) vu4, (ref) vu390, (ref) vu6, (ref) vu35, (ref) vu123, (ref) vu8, (ref) vu7, (ref) vu336, (ref) vu209, (ref) vu11, (ref) vu20, (ref) vu361, (ref) vu124, (ref) vu395
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu302, (ref) vu4
        while vu2.AutoDoughKing do
            task.wait(1)
            if vu302("Sweet Chalice") then
                vu4("CakePrinceSpawner")
            end
        end
    end)
    while vu2.AutoDoughKing do
        task.wait()
        if not vu390("Dough King") then
            if vu302("Red Key") then
                vu4("CakeScientist", "Check")
            elseif vu6("Dough King") or vu6("Cake Prince") then
                local v793 = vu35.Character
                if v793 then
                    v793 = vu35.Character.PrimaryPart
                end
                if v793 and v793.Position.Y < 3000 then
                    vu123(CFrame.new(- 2150, 70, - 12406))
                else
                    local v794 = vu8({
                        "Dough King",
                        "Cake Prince"
                    })
                    if v794 and v794:FindFirstChild("HumanoidRootPart") then
                        vu123(v794.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    end
                end
            elseif vu302("Sweet Chalice") then
                local vu795 = vu8(vu209.CakePrince)
                if vu795 and vu795:FindFirstChild("HumanoidRootPart") then
                    vu123(vu795.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu795
                        vu7()
                        vu336()
                        vu11(vu795, true)
                    end)
                else
                    vu123(CFrame.new(- 2103, 70, - 12165))
                end
            elseif vu302("God\'s Chalice") and vu20("Conjured Cocoa") >= 10 then
                local v796 = vu35.Character
                if v796 then
                    v796 = vu35.Character.PrimaryPart
                end
                if v796 and (v796.Position - Vector3.new(224, 25, - 12771)).Magnitude < 5 then
                    vu4("SweetChaliceNpc")
                else
                    vu123(CFrame.new(224, 25, - 12771))
                end
            elseif vu302("God\'s Chalice") and vu20("Conjured Cocoa") < 10 then
                local vu797 = vu8({
                    "Chocolate Bar Battler",
                    "Cocoa Warrior"
                })
                if vu797 and vu797:FindFirstChild("HumanoidRootPart") then
                    vu123(vu797.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu797
                        vu7()
                        vu336()
                        vu11(vu797, true)
                    end)
                else
                    vu123(CFrame.new(400, 81, - 12257))
                end
            else
                local v798 = nil
                vu361()
                if vu124:VerifyQuest("Diablo") then
                    v798 = "Diablo"
                elseif vu124:VerifyQuest("Deandre") then
                    v798 = "Deandre"
                elseif vu124:VerifyQuest("Urban") then
                    v798 = "Urban"
                else
                    task.spawn(vu4, "EliteHunter")
                end
                if v798 then
                    local v799 = vu8({
                        v798
                    })
                    if v799 and v799:FindFirstChild("HumanoidRootPart") then
                        vu123(v799.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    end
                elseif not vu390("Dough King 2") then
                    local vu800 = vu8(vu209.CakePrince)
                    if vu800 and vu800:FindFirstChild("HumanoidRootPart") then
                        while vu395("AutoDoughKing", "Dough King", vu800) and not vu390("Dough King 2") do
                            task.wait()
                            if vu800.PrimaryPart then
                                vu123(vu800.PrimaryPart.CFrame + vu2.FarmPos)
                                pcall(function()
									-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu800
                                    vu7()
                                    vu336()
                                    vu11(vu800, true)
                                end)
                            end
                        end
                    else
                        vu123(CFrame.new(- 2103, 70, - 12165))
                        task.wait(1)
                    end
                end
            end
        end
    end
end
local function vu811()
	-- upvalues: (ref) vu6, (ref) vu82, (ref) vu2, (ref) vu83, (ref) vu390, (ref) vu124, (ref) vu36, (ref) vu357, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    local vu802 = nil
    local function v807()
		-- upvalues: (ref) vu802, (ref) vu6, (ref) vu82
        if vu802 and vu6(vu802) then
            return vu802
        end
        local v803, v804, v805 = pairs(vu82)
        while true do
            local v806
            v805, v806 = v803(v804, v805)
            if v805 == nil then
                break
            end
            if vu6(v806) then
                vu802 = v806
                return v806
            end
        end
    end
    while vu2.KillAllBosses do
        task.wait()
        local v808 = v807() or ""
        local v809 = vu83(v808)
        if v809 then
            vu2.FarmingAllBosses = true
            if not vu390("All Boss") then
                if TakeQuestBoss and (not vu124:VerifyQuest(v808) and (v809.Quest and vu36.Value >= v809.Level)) then
                    vu357(v809.Quest[1], v809.Quest[3] or 3, v809.Quest[2])
                else
                    local v810 = vu8({
                        v808
                    }, true)
                    if v810 and v810:FindFirstChild("HumanoidRootPart") then
                        vu123(v810.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    elseif v809.Position then
                        vu123(v809.Position)
                    end
                end
            end
        else
            vu2.FarmingAllBosses = false
        end
    end
    vu2.FarmingAllBosses = false
end
local function vu815()
	-- upvalues: (ref) vu2, (ref) vu83, (ref) vu390, (ref) vu124, (ref) vu36, (ref) vu357, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336
    while vu2.AutoFarmBossSelected do
        task.wait()
        local v812 = BossSelected or ""
        local v813 = vu83(v812)
        if v813 then
            vu2.FarmingBossSelected = true
            if not vu390("Farm Boss") then
                if TakeQuestBoss and (not vu124:VerifyQuest(v812) and (v813.Quest and vu36.Value >= v813.Level)) then
                    vu357(v813.Quest[1], v813.Quest[3] or 3, v813.Quest[2])
                else
                    local v814 = vu8({
                        v812
                    }, true)
                    if v814 and v814:FindFirstChild("HumanoidRootPart") then
                        vu123(v814.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu336
                            vu7()
                            vu336()
                        end)
                    elseif v813.Position then
                        vu123(v813.Position)
                    end
                end
            end
        else
            vu2.FarmingBossSelected = false
        end
    end
    vu2.FarmingBossSelected = false
end
local function vu817()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu302, (ref) vu321, (ref) vu34
    while vu2.AutoSoulReaper do
        task.wait()
        if vu390("Hallow Boss") then
            vu2.SoulReaper = false
        else
            local v816 = vu8({
                "Soul Reaper"
            }, true)
            if v816 and v816:FindFirstChild("HumanoidRootPart") then
                vu123(v816.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
                vu2.SoulReaper = true
            elseif vu302("Hallow Essence") then
                vu321("Hallow Essence")
                vu2.SoulReaper = true
                pcall(function()
					-- upvalues: (ref) vu123, (ref) vu34
                    vu123(vu34["Haunted Castle"].Summoner.Detection.CFrame)
                end)
            else
                vu2.SoulReaper = false
            end
        end
    end
    vu2.SoulReaper = false
end
local function vu828()
	-- upvalues: (ref) vu12, (ref) vu9, (ref) vu35, (ref) vu2, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
    local function v826()
		-- upvalues: (ref) vu12, (ref) vu9, (ref) vu35
        local v818, v819, v820 = pairs(vu12())
        local v821 = 1500
        local v822 = nil
        while true do
            local v823
            v820, v823 = v818(v819, v820)
            if v820 == nil then
                break
            end
            if vu9(v823) then
                local v824 = v823.PrimaryPart
                local v825 = vu35.Character
                if v825 then
                    v825 = vu35.Character.PrimaryPart
                end
                if v824 and (v825 and (v825.Position - v824.Position).Magnitude <= v821) then
                    v821 = (v825.Position - v824.Position).Magnitude
                    v822 = v823
                end
            end
        end
        return v822
    end
    while vu2.AutoFarmNearest do
        task.wait()
        if vu2.AutoFarm_Level or (vu2.AutoFarmBone or (vu2.AutoRipIndra or vu2.AutoCakePrince)) then
            vu2.FarmingNearest = false
        else
            local vu827 = v826()
            if vu827 and vu827:FindFirstChild("HumanoidRootPart") then
                vu123(vu827.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu827
                    vu7()
                    vu336()
                    vu11(vu827, true)
                end)
                vu2.FarmingNearest = true
            else
                vu2.FarmingNearest = false
            end
        end
    end
    vu2.FarmingNearest = false
end
local function vu838()
	-- upvalues: (ref) vu15, (ref) vu35, (ref) vu2, (ref) vu4, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu86, (ref) vu194, (ref) vu390, (ref) vu302
    local vu829 = 0
    local vu830 = vu15(vu35, "Data", "Race")
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu830, (ref) vu829, (ref) vu4
        while vu2.AutoRaceV2 do
            task.wait()
            if not vu830:FindFirstChild("Evolved") then
                vu829 = vu4("Alchemist", "1")
            end
        end
    end)
    local function v832()
		-- upvalues: (ref) vu8, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu86, (ref) vu194
        local vu831 = vu8({
            "Swan Pirate"
        })
        if vu831 and vu831:FindFirstChild("HumanoidRootPart") then
            vu123(vu831.HumanoidRootPart.CFrame + vu2.FarmPos)
            pcall(function()
				-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu831
                vu7()
                vu336()
                vu11(vu831)
            end)
        else
            vu86:NPCs(vu194("Swan Pirate") or {
                CFrame.new(778, 110, 1129),
                CFrame.new(1018, 110, 1128),
                CFrame.new(1020, 110, 1366),
                CFrame.new(1016, 110, 1115)
            })
        end
    end
    local v833 = vu829
    local v834 = vu830
    local function v837(p835)
        local v836 = workspace:FindFirstChild(p835)
        if v836 then
            if workspace[p835].Transparency == 1 then
                v836 = false
            else
                v836 = workspace[p835]
            end
        end
        return v836
    end
    while vu2.AutoRaceV2 do
        task.wait()
        if vu390("Race V2") then
            vu2.RaceV2 = false
        elseif v834:FindFirstChild("Evolved") then
            vu2.RaceV2 = false
        elseif v833 == 0 then
            if vu35:DistanceFromCharacter(Vector3.new(- 2777, 73, - 3570)) >= 5 then
                vu123(CFrame.new(- 2777, 73, - 3570))
            else
                vu4("Alchemist", "2")
            end
            vu2.RaceV2 = true
        elseif v833 == 1 then
            if vu302("Flower 1") or not v837("Flower1") then
                if vu302("Flower 2") or not v837("Flower2") then
                    if vu302("Flower 3") then
                        vu2.RaceV2 = false
                    else
                        v832()
                        vu2.RaceV2 = true
                    end
                else
                    vu123(v837("Flower2").CFrame)
                    vu2.RaceV2 = true
                end
            else
                vu123(v837("Flower1").CFrame)
                vu2.RaceV2 = true
            end
        elseif v833 == 2 then
            if vu35:DistanceFromCharacter(Vector3.new(- 2777, 73, - 3570)) >= 5 then
                vu123(CFrame.new(- 2777, 73, - 3570))
            else
                vu4("Alchemist", "3")
            end
            vu2.RaceV2 = true
        else
            vu2.RaceV2 = false
        end
    end
    vu2.RaceV2 = false
end
local function vu846()
	-- upvalues: (ref) vu2, (ref) vu4, (ref) vu6, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu390, (ref) vu35, (ref) vu369
    local vu839 = 0
    task.spawn(function()
		-- upvalues: (ref) vu2, (ref) vu839, (ref) vu4
        while vu2.AutoRaceV3 do
            task.wait(0.5)
            vu839 = vu4("Wenlocktoad", "1")
        end
    end)
    local v843 = {
        ["Human"] = function(_)
			-- upvalues: (ref) vu6, (ref) vu8, (ref) vu123, (ref) vu2, (ref) vu7, (ref) vu336, (ref) vu11
            if vu6("Fajita") then
                local vu840 = vu8({
                    "Fajita"
                }, true)
                if vu840 and vu840:FindFirstChild("HumanoidRootPart") then
                    vu123(vu840.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu840
                        vu7()
                        vu336()
                        vu11(vu840)
                    end)
                end
                vu2.RaceV3 = true
            elseif vu6("Jeremy") then
                local vu841 = vu8({
                    "Jeremy"
                }, true)
                if vu841 and vu841:FindFirstChild("HumanoidRootPart") then
                    vu123(vu841.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu841
                        vu7()
                        vu336()
                        vu11(vu841)
                    end)
                end
                vu2.RaceV3 = true
            elseif vu6("Diamond") then
                local vu842 = vu8({
                    "Diamond"
                }, true)
                if vu842 and vu842:FindFirstChild("HumanoidRootPart") then
                    vu123(vu842.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu842
                        vu7()
                        vu336()
                        vu11(vu842)
                    end)
                end
                vu2.RaceV3 = true
            else
                vu2.RaceV3 = false
            end
        end
    }
    local v844 = vu839
    while vu2.AutoRaceV3 do
        task.wait()
        if vu390("Race V3") then
            vu2.RaceV3 = false
        elseif v844 == 0 then
            if vu35:DistanceFromCharacter(Vector3.new(- 1988, 124, - 70)) >= 5 then
                vu123(CFrame.new(- 1988, 124, - 70))
            else
                vu4("Wenlocktoad", "1")
                vu4("Wenlocktoad", "2")
            end
            vu2.RaceV3 = true
        elseif v844 == 1 then
            local v845 = vu369:GetPlayerRace()
            if v845 == "Human" then
                v843:Human()
            elseif v845 == "Mink" then
                v843:Mink()
            elseif v845 == "Cyborg" then
                v843:Cyborg()
            end
        elseif v844 == 2 then
            if vu35:DistanceFromCharacter(Vector3.new(- 1988, 124, - 70)) >= 5 then
                vu123(CFrame.new(- 1988, 124, - 70))
            else
                vu4("Wenlocktoad", "1")
                vu4("Wenlocktoad", "3")
            end
            vu2.RaceV3 = true
        else
            vu2.RaceV3 = false
        end
    end
    vu2.RaceV3 = false
end
local function vu849()
	-- upvalues: (ref) vu2, (ref) vu35, (ref) vu9, (ref) vu123, (ref) vu8, (ref) vu209, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoTrain do
        task.wait()
        local v847 = vu35.Character
        if vu9(v847) and v847:FindFirstChild("RaceTransformed") then
            if v847.RaceTransformed.Value then
                vu123(CFrame.new())
                task.wait(1)
            else
                local vu848 = vu8(vu209.Bones)
                if vu848 then
                    vu123(vu848.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu848
                        vu7()
                        vu336()
                        vu11(vu848, true)
                    end)
                else
                    vu123(CFrame.new(- 9513, 164, 5786))
                    task.wait(1)
                end
            end
            vu2.TrainRace = true
        else
            vu2.TrainRace = false
            task.wait(1)
        end
    end
    vu2.TrainRace = false
end
local function vu852()
	-- upvalues: (ref) vu2, (ref) vu390, (ref) vu22, (ref) vu302, (ref) vu321, (ref) vu123, (ref) vu6, (ref) vu8, (ref) vu7, (ref) vu336, (ref) vu11
    while vu2.AutoRengoku do
        task.wait()
        if vu390("Rengoku") then
            vu2.UnlockRengoku = false
        else
            if vu22("Rengoku") then
                break
            end
            if vu302("Hidden Key") then
                vu321("Hidden Key")
                vu123(CFrame.new(6571, 299, - 6968))
                vu2.UnlockRengoku = true
            elseif vu302("Library Key") then
                vu321("Library Key")
                vu123(CFrame.new(6373, 293, - 6839))
                vu2.UnlockRengoku = true
            elseif vu6("Awakened Ice Admiral") then
                local vu850 = vu8({
                    "Awakened Ice Admiral"
                }, true)
                if vu850 and vu850:FindFirstChild("HumanoidRootPart") then
                    vu123(vu850.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu850
                        vu7()
                        vu336()
                        vu11(vu850)
                    end)
                    vu2.UnlockRengoku = true
                end
            else
                local vu851 = vu8({
                    "Arctic Warrior",
                    "Snow Lurker"
                })
                if vu2.AutoFarm_Level or vu2.AutoFarmEctoplasm then
                    vu2.UnlockRengoku = false
                elseif vu851 and vu851:FindFirstChild("HumanoidRootPart") then
                    vu123(vu851.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu851
                        vu7()
                        vu336()
                        vu11(vu851, true)
                    end)
                    vu2.UnlockRengoku = true
                else
                    vu2.UnlockRengoku = false
                end
            end
        end
    end
    vu2.UnlockRengoku = false
end
local function vu866()
	-- upvalues: (ref) vu15, (ref) vu34, (ref) vu2, (ref) vu390, (ref) vu22, (ref) vu6, (ref) vu8, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu302, (ref) vu321
    local v853 = vu15(vu34, "Turtle")
    local vu854 = vu15(v853, "QuestTorches")
    local vu855 = {}
    local function v858(p856)
		-- upvalues: (ref) vu855, (ref) vu854
        if not vu855[p856] then
            local v857 = vu854:FindFirstChild(p856)
            if v857 then
                v857 = vu854[p856]:FindFirstChild("Particles")
            end
            if v857:FindFirstChild("PointLight") and v857.PointLight.Enabled then
                vu855[p856] = true
            elseif vu854:FindFirstChild(p856) then
                return vu854[p856]
            end
        end
    end
    while vu2.AutoTushita do
        task.wait()
        if vu390("Tushita") then
            vu2.UnlockTushita = false
        elseif vu22("Tushita") then
            if vu6("rip_indra True Form") then
                local v859 = vu8({
                    "rip_indra True Form"
                }, true)
                if v859 and v859:FindFirstChild("HumanoidRootPart") then
                    vu123(v859.HumanoidRootPart.CFrame + vu2.FarmPos)
                    pcall(function()
						-- upvalues: (ref) vu7, (ref) vu336
                        vu7()
                        vu336()
                    end)
                else
                    vu123(CFrame.new(- 5333, 424, - 2673))
                end
                vu2.UnlockTushita = true
            else
                vu2.UnlockTushita = false
            end
        elseif v853:FindFirstChild("TushitaGate") then
            if vu302("Holy Torch") then
                local v860 = v858("Torch5")
                local v861 = v858("Torch4")
                local v862 = v858("Torch3")
                local v863 = v858("Torch2")
                local v864 = v858("Torch1")
                if v864 then
                    vu123(v864.CFrame)
                    vu2.UnlockTushita = true
                elseif v863 then
                    vu123(v863.CFrame)
                    vu2.UnlockTushita = true
                elseif v862 then
                    vu123(v862.CFrame)
                    vu2.UnlockTushita = true
                elseif v861 then
                    vu123(v861.CFrame)
                    vu2.UnlockTushita = true
                elseif v860 then
                    vu123(v860.CFrame)
                    vu2.UnlockTushita = true
                else
                    vu2.UnlockTushita = false
                end
            elseif vu6("rip_indra True Form") then
                vu123(CFrame.new(5152, 142, 912))
                vu2.UnlockTushita = true
            elseif vu302("God\'s Chalice") then
                vu321("God\'s Chalice")
                vu123(CFrame.new(- 5561, 314, - 2663))
                vu2.UnlockTushita = true
            else
                vu2.UnlockTushita = false
            end
        elseif vu6("Longma") then
            local v865 = vu8({
                "Longma"
            }, true)
            if v865 and v865:FindFirstChild("HumanoidRootPart") then
                vu123(v865.HumanoidRootPart.CFrame + vu2.FarmPos)
                pcall(function()
					-- upvalues: (ref) vu7, (ref) vu336
                    vu7()
                    vu336()
                end)
            else
                vu123(CFrame.new(- 10218, 333, - 9444))
            end
            vu2.UnlockTushita = true
        else
            vu2.UnlockTushita = false
        end
    end
    vu2.UnlockTushita = false
end
local function vu880()
	-- upvalues: (ref) vu24, (ref) vu34, (ref) vu35, (ref) vu29
    local function v873(_)
		-- upvalues: (ref) vu24
        local v867 = require(vu24.DialoguesList)
        local v868 = require(vu24.DialogueController)
        local v869, v870, v871 = pairs(v867)
        while true do
            local v872
            v871, v872 = v869(v870, v871)
            if v871 == nil then
                break
            end
            if tostring(v871) == "EatFruit" then
                v868:Start(v872)
            end
        end
    end
    local v874, v875, v876 = pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren())
    while true do
        local vu877
        v876, vu877 = v874(v875, v876)
        if v876 == nil then
            break
        end
        vu877.Parent = vu34
        vu877:MoveTo(vu35.Character.PrimaryPart.Position + Vector3.new(math.random(- 50, 50), 50, math.random(- 50, 50)))
        local function v879(p878)
			-- upvalues: (ref) vu877, (ref) vu29
            if p878.Parent:FindFirstChild("Humanoid") then
                vu877.Parent = vu29[p878.Parent.Name].Backpack
            end
        end
        vu877:WaitForChild("Handle").Touched:Connect(v879)
        vu877.Activated:Connect(v873)
        pcall(function()
			-- upvalues: (ref) vu877
            vu877.Fruit.AnimationController:LoadAnimation(vu877.Fruit.Idle):Play()
        end)
        task.wait()
    end
end
local function v887()
	-- upvalues: (ref) vu15, (ref) vu24, (ref) vu35, (ref) vu29
    local v881 = require(vu15(vu24, "Notification"))
    vu15(vu35, "leaderstats", "Bounty/Honor")
    local v882 = "Earned <Color=" .. (vu35.Team.Name == "Red" and true or "Cyan") .. ">%i Bounty<Color=/> form killing %s!"
    local v883 = {}
    for _ = 1, 50 do
        task.wait(0.2)
        local v884 = tostring(math.random(9000, 17500))
        local v885 = vu29:GetPlayers()
        local v886 = v885[math.random(# v885)]
        while v886 == vu35 and # v885 > 0 do
            v886 = v885[math.random(# v885)]
        end
        if not v883[v886] then
            v883[v886] = 0
        end
        v883[v886] = math.clamp(v883[v886] + 1, 1, 3)
        v881.new(v882:format(v884, v886.Name)):Display()
        v881.new(("Score: %i/3"):format(v883[v886])):Display()
    end
end
local vu888 = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local v889 = vu888
local vu890 = vu888.MakeWindow(v889, {
    ["Title"] = "redz Hub : Blox Fruits",
    ["SubTitle"] = "by redz9999",
    ["SaveFolder"] = "redzHub-BloxFruits.json"
})
vu890:AddMinimizeButton({
    ["Button"] = {
        ["Image"] = "rbxassetid://15298567397",
        ["BackgroundTransparency"] = 0
    },
    ["Corner"] = {
        ["CornerRadius"] = UDim.new(0, 6)
    }
})
local v891 = {
    ["Discord"] = vu890:MakeTab({
        "Discord",
        "Info"
    }),
    ["MainFarm"] = vu890:MakeTab({
        "Farm",
        "Home"
    }),
    ["AutoSea"] = vu890:MakeTab({
        "Sea",
        "Waves"
    }),
    ["RaceV4"] = vu890:MakeTab({
        "Race-V4",
        ""
    }),
    ["Items"] = vu890:MakeTab({
        "Quests/Items",
        "Swords"
    }),
    ["FruitRaid"] = vu890:MakeTab({
        "Fruit/Raid",
        "Cherry"
    }),
    ["Stats"] = vu890:MakeTab({
        "Stats",
        "Signal"
    }),
    ["Teleport"] = vu890:MakeTab({
        "Teleport",
        "Locate"
    }),
    ["Visual"] = vu890:MakeTab({
        "Visual",
        "User"
    }),
    ["Shop"] = vu890:MakeTab({
        "Shop",
        "ShoppingCart"
    }),
    ["Misc"] = vu890:MakeTab({
        "Misc",
        "Settings"
    })
}
local vu892 = {}
vu890:SelectTab(v891.MainFarm)
v891.Discord:AddDiscordInvite({
    ["Name"] = "redz Hub | Community",
    ["Description"] = "Join our discord community to receive information about the next update",
    ["Logo"] = "rbxassetid://17382040552",
    ["Invite"] = "https://discord.gg/7aR7kNVt4g"
})
v891.MainFarm:AddDropdown({
    ["Name"] = "Farm Tool",
    ["Options"] = {
        "Melee",
        "Sword",
        "Blox Fruit"
    },
    ["Default"] = {
        "Melee"
    },
    ["Flag"] = "Main/FarmTool",
    ["Callback"] = function(p893)
		-- upvalues: (ref) vu2
        vu2.FarmTool = p893
    end
})
v891.MainFarm:AddDropdown({
    ["Name"] = "UI Scale",
    ["Options"] = {
        "Small",
        "Medium",
        "Large"
    },
    ["Default"] = {
        "Large"
    },
    ["Flag"] = "Misc/UIScale",
    ["Callback"] = function(p894)
		-- upvalues: (ref) vu888
        if p894 == "Large" then
            vu888:SetScale(450)
        elseif p894 == "Medium" then
            vu888:SetScale(620)
        else
            vu888:SetScale(760)
        end
    end
})
if vu38 <= vu36.Value and vu43 then
    v891.MainFarm:AddToggle({
        ["Name"] = "Start Multi Farm < BETA >",
        ["Callback"] = function(pu895)
			-- upvalues: (ref) vu892
            table.foreach(vu892, function(_, pu896)
				-- upvalues: (ref) pu895
                task.spawn(function()
					-- upvalues: (ref) pu896, (ref) pu895
                    pu896:Set(pu895)
                end)
            end)
        end
    })
end
v891.MainFarm:AddSection({
    "Farm"
})
v891.MainFarm:AddToggle({
    ["Desc"] = "Level Farm",
    "Auto Farm Level",
    false,
    function(p897)
		-- upvalues: (ref) vu2, (ref) vu430
        vu2.AutoFarm_Level = p897
        vu430()
    end,
    "Farm/Level"
})
v891.MainFarm:AddToggle({
    ["Desc"] = "Farm Nearst Mobs",
    "Auto Farm Nearest",
    false,
    function(p898)
		-- upvalues: (ref) vu2, (ref) vu828
        vu2.AutoFarmNearest = p898
        vu828()
    end,
    "Farm/Nearest"
})
if vu43 then
    table.insert(vu892, v891.MainFarm:AddToggle({
        ["Desc"] = "Auto Kill Pirates of Sea",
        "Auto Pirates Sea",
        false,
        function(p899)
			-- upvalues: (ref) vu2, (ref) vu673
            vu2.AutoPiratesSea = p899
            vu673()
        end,
        "Farm/PiratesSea"
    }))
elseif vu44 then
    v891.MainFarm:AddToggle({
        "Auto Factory",
        false,
        function(p900)
			-- upvalues: (ref) vu2, (ref) vu674
            vu2.AutoFactory = p900
            vu674()
        end,
        "Farm/Factory"
    })
elseif vu45 then
    v891.MainFarm:AddSection({
        "Farm-Level"
    })
    v891.MainFarm:AddToggle({
        "Sky Piea Farm",
        false,
        function(p901)
			-- upvalues: (ref) vu2, (ref) vu414
            vu2.AutoFarmSkyPiea = p901
            vu414()
        end,
        "Farm/SkyFarm"
    })
    v891.MainFarm:AddToggle({
        "Player Hunter Quest",
        false,
        function(p902)
			-- upvalues: (ref) vu2, (ref) vu425
            vu2.AutoPlayerHunter = p902
            vu425()
        end,
        "Farm/PlayerHunter"
    })
end
if vu43 then
    v891.MainFarm:AddSection({
        "Bone"
    })
    table.insert(vu892, v891.MainFarm:AddToggle({
        "Auto Farm Bone",
        false,
        function(p903)
			-- upvalues: (ref) vu2, (ref) vu665
            vu2.AutoFarmBone = p903
            vu665()
        end,
        "Farm/Bone"
    }))
    table.insert(vu892, v891.MainFarm:AddToggle({
        "Auto Hallow Scythe",
        false,
        function(p904)
			-- upvalues: (ref) vu2, (ref) vu817
            vu2.AutoSoulReaper = p904
            vu817()
        end,
        "Farm/HallowBoss"
    }))
    table.insert(vu892, v891.MainFarm:AddToggle({
        "Auto Trade Bone",
        false,
        function(p905)
			-- upvalues: (ref) vu2, (ref) vu20, (ref) vu4
            vu2.AutoTradeBone = p905
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu20, (ref) vu4
                while vu2.AutoTradeBone do
                    task.wait()
                    if vu20("Bones") >= 50 then
                        vu4("Bones", "Buy", 1, 1)
                    end
                end
            end)
        end,
        "Farm/TradeBone"
    }))
elseif vu44 then
    v891.MainFarm:AddSection({
        "Ectoplasm"
    })
    v891.MainFarm:AddToggle({
        "Auto Farm Ectoplasm",
        false,
        function(p906)
			-- upvalues: (ref) vu2, (ref) vu656
            vu2.AutoFarmEctoplasm = p906
            vu656()
        end,
        "Farm/Ectoplasm"
    })
end
v891.MainFarm:AddSection({
    "Chest"
})
v891.MainFarm:AddToggle({
    "Auto Chest < Tween >",
    false,
    function(p907)
		-- upvalues: (ref) vu2, (ref) vu409
        vu2.AutoChestTween = p907
        vu409()
    end
})
v891.MainFarm:AddSection({
    "Bosses"
})
local v908 = v891.MainFarm:AddButton({
    "Update Boss List"
})
local vu910 = v891.MainFarm:AddDropdown({
    ["Name"] = "Boss List",
    ["Options"] = {},
    ["Callback"] = function(p909)
		-- upvalues: (ref) vu2
        vu2.BossSelected = p909
    end
})
function UpdateBossList()
	-- upvalues: (ref) vu82, (ref) vu6, (ref) vu910
    local v911, v912, v913 = pairs(vu82)
    local v914 = {}
    while true do
        local v915
        v913, v915 = v911(v912, v913)
        if v913 == nil then
            break
        end
        if vu6(v915) then
            table.insert(v914, v915)
        end
    end
    vu910:Set(v914)
end
v908:Callback(UpdateBossList)
UpdateBossList()
v891.MainFarm:AddToggle({
    ["Desc"] = "Kill the Selected Boss",
    "Auto Farm Boss Selected",
    false,
    function(p916)
		-- upvalues: (ref) vu2, (ref) vu815
        vu2.AutoFarmBossSelected = p916
        vu815()
    end,
    "Farm/BossSelected"
})
v891.MainFarm:AddToggle({
    ["Desc"] = "Kill all Spawned Bosses",
    "Auto Farm All Boss",
    false,
    function(p917)
		-- upvalues: (ref) vu2, (ref) vu811
        vu2.KillAllBosses = p917
        vu811()
    end,
    "Farm/AllBosses"
})
v891.MainFarm:AddToggle({
    "Take Quest",
    true,
    function(p918)
		-- upvalues: (ref) vu2
        vu2.TakeQuestBoss = p918
    end,
    "Farm/BossQuest"
})
v891.MainFarm:AddButton({
    "Server HOP",
    vu5
})
v891.MainFarm:AddSection({
    "Material"
})
v891.MainFarm:AddDropdown({
    ["Name"] = "Material List",
    ["Options"] = vu45 and {
        "Leather + Scrap Metal",
        "Magma Ore",
        "Fish Tail",
        "Angel Wings"
    } or (vu44 and {
        "Leather + Scrap Metal",
        "Magma Ore",
        "Mystic Droplet",
        "Radiactive Material",
        "Vampire Fang"
    } or (vu43 and {
        "Leather + Scrap Metal",
        "Fish Tail",
        "Gunpowder",
        "Mini Tusk",
        "Conjured Cocoa",
        "Dragon Scale"
    } or {})),
    ["Flag"] = "Material/Selected",
    ["Callback"] = function(p919)
		-- upvalues: (ref) vu2
        vu2.MaterialSelected = p919
    end
})
v891.MainFarm:AddToggle({
    ["Desc"] = "Select the Material before activating this option",
    "Auto Farm Material",
    false,
    function(p920)
		-- upvalues: (ref) vu2, (ref) vu663
        vu2.AutoFarmMaterial = p920
        vu663()
    end
})
v891.MainFarm:AddSection({
    "Mastery"
})
v891.MainFarm:AddSlider({
    "Select Health",
    10,
    50,
    1,
    25,
    function(p921)
		-- upvalues: (ref) vu2
        vu2.HealthSkill = p921
    end,
    "Farm/MasteryHealth"
})
v891.MainFarm:AddDropdown({
    ["Name"] = "Select Tool",
    ["Options"] = {
        "Blox Fruit"
    },
    ["Default"] = {
        "Blox Fruit"
    },
    ["Callback"] = function(p922)
		-- upvalues: (ref) vu2
        vu2.ToolMastery = p922
    end
})
v891.MainFarm:AddToggle({
    "Auto Farm Mastery",
    false,
    function(p923)
		-- upvalues: (ref) vu2, (ref) vu439
        vu2.AutoFarmMastery = p923
        vu439()
    end
})
v891.MainFarm:AddSection({
    "Skill"
})
v891.MainFarm:AddToggle({
    "AimBot Skill Enemie",
    true,
    function(p924)
		-- upvalues: (ref) vu2
        vu2.AimBotSkill = p924
    end,
    "Sea/Aimbot"
})
v891.MainFarm:AddToggle({
    "Skill Z",
    true,
    function(p925)
		-- upvalues: (ref) vu2
        vu2.SkillZ = p925
    end,
    "Sea/Z"
})
v891.MainFarm:AddToggle({
    "Skill X",
    true,
    function(p926)
		-- upvalues: (ref) vu2
        vu2.SkillX = p926
    end,
    "Sea/X"
})
v891.MainFarm:AddToggle({
    "Skill C",
    true,
    function(p927)
		-- upvalues: (ref) vu2
        vu2.SkillC = p927
    end,
    "Sea/C"
})
v891.MainFarm:AddToggle({
    "Skill V",
    true,
    function(p928)
		-- upvalues: (ref) vu2
        vu2.SkillV = p928
    end,
    "Sea/V"
})
v891.MainFarm:AddToggle({
    "Skill F",
    false,
    function(p929)
		-- upvalues: (ref) vu2
        vu2.SkillF = p929
    end,
    "Sea/F"
})
if vu43 then
    v891.AutoSea:AddSection({
        "Kitsune"
    })
    local vu930 = v891.AutoSea:AddParagraph({
        "Kitsune Island : not spawn"
    })
    v891.AutoSea:AddSlider({
        ["Desc"] = "Select quantity to start trading <font color=\'rgb(88, 101, 242)\'>Azure Ember</font> for rewards",
        "Trade Azure Ember Amount",
        10,
        25,
        5,
        20,
        function(p931)
			-- upvalues: (ref) vu2
            vu2.TradeAzureAmount = p931
        end,
        "Sea/AzureAmount"
    })
    v891.AutoSea:AddToggle({
        ["Name"] = "Auto Trade Azure Ember",
        ["Callback"] = function(p932)
			-- upvalues: (ref) vu2, (ref) vu24, (ref) vu20
            vu2.TradeAzureEmber = p932
            task.spawn(function()
				-- upvalues: (ref) vu24, (ref) vu2, (ref) vu20
                local v933 = vu24:WaitForChild("Modules", 9000000000):WaitForChild("Net", 9000000000):WaitForChild("RF/KitsuneStatuePray", 9000000000)
                while vu2.TradeAzureEmber do
                    task.wait(0.5)
                    if (vu2.TradeAzureAmount or 20) <= vu20("Azure Ember") then
                        v933:InvokeServer()
                    end
                end
            end)
        end,
        ["Desc"] = "If you reach the selected amount of <font color=\'rgb(88, 101, 242)\'>Azure Ember</font>, you will trade automatically"
    })
    v891.AutoSea:AddToggle({
        ["Name"] = "Auto Kitsune Island",
        ["Callback"] = function(p934)
			-- upvalues: (ref) vu2, (ref) vu486
            vu2.AutoKitsuneIsland = p934
            vu486()
        end,
        ["Desc"] = "Auto Find Kitsune Island + Auto Collect <font color=\'rgb(88, 101, 242)\'>Azure Ember</font>"
    })
    task.spawn(function()
		-- upvalues: (ref) vu34, (ref) vu35, (ref) vu930
        while task.wait() do
            if vu34:FindFirstChild("KitsuneIsland") then
                local v935 = vu35.Character
                if v935 then
                    v935 = vu35.Character.PrimaryPart
                end
                if v935 then
                    vu930:SetTitle("Kitsune Island : Spawned | Distance : " .. tostring(math.floor((v935.Position - vu34.KitsuneIsland.WorldPivot.p).Magnitude / 5)))
                end
            else
                vu930:SetTitle("Kitsune Island : not Spawn")
            end
        end
    end)
    v891.AutoSea:AddSection({
        "Sea"
    })
    v891.AutoSea:AddToggle({
        "Auto Farm Sea",
        false,
        function(p936)
			-- upvalues: (ref) vu2, (ref) vu607
            vu2.AutoFarmSea = p936
            vu607()
        end
    })
    v891.AutoSea:AddButton({
        ["Name"] = "Buy New Boat",
        ["Callback"] = function()
			-- upvalues: (ref) vu445
            vu445()
        end
    })
    v891.AutoSea:AddSection({
        "Material"
    })
    v891.AutoSea:AddToggle({
        "Auto Wood Planks",
        false,
        function(p937)
			-- upvalues: (ref) vu2, (ref) vu627
            vu2.AutoWoodPlanks = p937
            vu627()
        end
    })
    v891.AutoSea:AddSection({
        "Farm Select"
    })
    v891.AutoSea:AddParagraph({
        "Fish"
    })
    v891.AutoSea:AddToggle({
        "Sea Beast",
        true,
        function(p938)
			-- upvalues: (ref) vu2
            vu2.KillSeaBeasts = p938
        end,
        "Sea/SeaBeasts"
    })
    v891.AutoSea:AddToggle({
        "Terrorshark",
        true,
        function(p939)
			-- upvalues: (ref) vu2
            vu2.Terrorshark = p939
        end,
        "Sea/Terrorshark"
    })
    v891.AutoSea:AddToggle({
        "Piranha",
        true,
        function(p940)
			-- upvalues: (ref) vu2
            vu2.Piranha = p940
        end,
        "Sea/Piranha"
    })
    v891.AutoSea:AddToggle({
        "Fish Crew Member",
        true,
        function(p941)
			-- upvalues: (ref) vu2
            vu2.FishCrewMember = p941
        end,
        "Sea/FishCrewMember"
    })
    v891.AutoSea:AddToggle({
        "Fish Boat",
        true,
        function(p942)
			-- upvalues: (ref) vu2
            vu2.Shark = p942
        end,
        "Sea/Shark"
    })
    v891.AutoSea:AddParagraph({
        "Boats"
    })
    v891.AutoSea:AddToggle({
        "Pirate Brigade",
        true,
        function(p943)
			-- upvalues: (ref) vu2
            vu2.PirateBrigade = p943
        end,
        "Sea/PirateBrigade"
    })
    v891.AutoSea:AddToggle({
        "Pirate Grand Brigade",
        true,
        function(p944)
			-- upvalues: (ref) vu2
            vu2.PirateGrandBrigade = p944
        end,
        "Sea/PirateGrandBrigade"
    })
    v891.AutoSea:AddToggle({
        "Fish Boat",
        true,
        function(p945)
			-- upvalues: (ref) vu2
            vu2.FishBoat = p945
        end,
        "Sea/FishBoat"
    })
    v891.AutoSea:AddSection({
        "Skill"
    })
    v891.AutoSea:AddToggle({
        "Aimbot Skill",
        true,
        function(p946)
			-- upvalues: (ref) vu2
            vu2.SeaAimBotSkill = p946
        end,
        "SeaSkill/Aimbot"
    })
    v891.AutoSea:AddToggle({
        "Skill Z",
        true,
        function(p947)
			-- upvalues: (ref) vu2
            vu2.SeaSkillZ = p947
        end,
        "SeaSkill/Z"
    })
    v891.AutoSea:AddToggle({
        "Skill X",
        true,
        function(p948)
			-- upvalues: (ref) vu2
            vu2.SeaSkillX = p948
        end,
        "SeaSkill/X"
    })
    v891.AutoSea:AddToggle({
        "Skill C",
        true,
        function(p949)
			-- upvalues: (ref) vu2
            vu2.SeaSkillC = p949
        end,
        "SeaSkill/C"
    })
    v891.AutoSea:AddToggle({
        "Skill V",
        true,
        function(p950)
			-- upvalues: (ref) vu2
            vu2.SeaSkillV = p950
        end,
        "SeaSkill/V"
    })
    v891.AutoSea:AddToggle({
        "Skill F",
        false,
        function(p951)
			-- upvalues: (ref) vu2
            vu2.SeaSkillF = p951
        end,
        "SeaSkill/F"
    })
    v891.AutoSea:AddSection({
        "Configs"
    })
    v891.AutoSea:AddDropdown({
        ["Name"] = "Tween Sea Level",
        ["Options"] = {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "inf"
        },
        ["Default"] = {
            "6"
        },
        ["Flag"] = "Sea/SeaLevel",
        ["Callback"] = function(p952)
			-- upvalues: (ref) vu2
            vu2.SeaLevelTP = p952
        end
    })
    v891.AutoSea:AddSlider({
        "Boat Tween Speed",
        100,
        300,
        10,
        250,
        function(p953)
			-- upvalues: (ref) vu2
            vu2.SeaBoatSpeed = p953
        end,
        "Sea/BoatSpeed"
    })
    v891.AutoSea:AddSection({
        "NPCs"
    })
    local vu954 = nil
    v891.AutoSea:AddDropdown({
        ["Name"] = "Select NPC",
        ["Options"] = {
            "Shipwright Teacher",
            "Shark Hunter",
            "Beast Hunter",
            "Spy"
        },
        ["Default"] = "Spy",
        ["Callback"] = function(p955)
			-- upvalues: (ref) vu954
            if p955 == "Shipwright Teacher" then
                vu954 = CFrame.new(- 16526, 76, 309)
            elseif p955 == "Shark Hunter" then
                vu954 = CFrame.new(- 16526, 108, 752)
            elseif p955 == "Beast Hunter" then
                vu954 = CFrame.new(- 16281, 73, 263)
            elseif p955 == "Spy" then
                vu954 = CFrame.new(- 16471, 528, 539)
            end
        end
    })
    local vu957 = v891.AutoSea:AddToggle({
        "Teleport To NPC",
        false,
        function(p956)
			-- upvalues: (ref) vu2, (ref) vu954, (ref) vu123
            vu2.NPCtween = p956
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu954, (ref) vu123
                while vu2.NPCtween do
                    task.wait()
                    if vu954 then
                        vu123(vu954)
                    end
                end
            end)
        end
    })
    local v958 = vu957
    vu957.Callback(v958, function(p959)
		-- upvalues: (ref) vu35, (ref) vu954, (ref) vu2, (ref) vu957
        if not p959 then
            return
        end
        local v960 = math.huge
        while true do
            task.wait()
            local v961 = vu35.Character
            if v961 then
                v961 = vu35.Character.PrimaryPart
            end
            if v961 and vu954 then
                v960 = (vu954.p - v961.Position).Magnitude
            end
            if not vu2.NPCtween or v960 < 10 then
                vu957:Set(false, true)
                return
            end
        end
    end)
elseif vu44 then
    v891.AutoSea:AddSection({
        "Farm"
    })
    v891.AutoSea:AddToggle({
        "Auto Farm Sea",
        false,
        function(p962)
			-- upvalues: (ref) vu2, (ref) vu547
            vu2.Sea2_AutoFarmSea = p962
            vu547()
        end
    })
    v891.AutoSea:AddButton({
        ["Name"] = "Buy New Boat",
        ["Callback"] = function()
			-- upvalues: (ref) vu445
            vu445()
        end
    })
    v891.AutoSea:AddSection({
        "Select Farm"
    })
    v891.AutoSea:AddToggle({
        "Sea Beasts",
        true,
        function(p963)
			-- upvalues: (ref) vu2
            vu2.KillSeaBeasts = p963
        end,
        "Sea/SeaBeasts"
    })
    v891.AutoSea:AddToggle({
        "Pirate Brigade",
        true,
        function(p964)
			-- upvalues: (ref) vu2
            vu2.PirateBrigade = p964
        end,
        "Sea/PirateBrigade"
    })
    v891.AutoSea:AddSection({
        "Skill"
    })
    v891.AutoSea:AddToggle({
        "Aimbot Skill",
        true,
        function(p965)
			-- upvalues: (ref) vu2
            vu2.SeaAimBotSkill = p965
        end,
        "SeaSkill/Aimbot"
    })
    v891.AutoSea:AddToggle({
        "Skill Z",
        true,
        function(p966)
			-- upvalues: (ref) vu2
            vu2.SeaSkillZ = p966
        end,
        "SeaSkill/Z"
    })
    v891.AutoSea:AddToggle({
        "Skill X",
        true,
        function(p967)
			-- upvalues: (ref) vu2
            vu2.SeaSkillX = p967
        end,
        "SeaSkill/X"
    })
    v891.AutoSea:AddToggle({
        "Skill C",
        true,
        function(p968)
			-- upvalues: (ref) vu2
            vu2.SeaSkillC = p968
        end,
        "SeaSkill/C"
    })
    v891.AutoSea:AddToggle({
        "Skill V",
        true,
        function(p969)
			-- upvalues: (ref) vu2
            vu2.SeaSkillV = p969
        end,
        "SeaSkill/V"
    })
    v891.AutoSea:AddToggle({
        "Skill F",
        false,
        function(p970)
			-- upvalues: (ref) vu2
            vu2.SeaSkillF = p970
        end,
        "SeaSkill/F"
    })
    v891.AutoSea:AddSection({
        "Configs"
    })
    v891.AutoSea:AddSlider({
        "Boat Tween Speed",
        100,
        300,
        10,
        250,
        "Sea/BoatSpeed",
        function(p971)
			-- upvalues: (ref) vu2
            vu2.SeaBoatSpeed = p971
        end
    })
else
    v891.AutoSea:Destroy()
end
if vu43 then
    v891.RaceV4:AddSection({
        "Mirage"
    })
    v891.RaceV4:AddToggle({
        "Teleport To Gear",
        false,
        function(p972)
			-- upvalues: (ref) vu2, (ref) vu34, (ref) vu123
            vu2.TeleportToGear = p972
            task.spawn(function()
				-- upvalues: (ref) vu34, (ref) vu2, (ref) vu123
                local function v978()
					-- upvalues: (ref) vu34
                    local v973 = vu34:FindFirstChild("MysticIsland")
                    if v973 then
                        local v974, v975, v976 = pairs(v973:GetChildren())
                        while true do
                            local v977
                            v976, v977 = v974(v975, v976)
                            if v976 == nil then
                                break
                            end
                            if v977:IsA("MeshPart") and v977.MeshId == "rbxassetid://10153114969" then
                                return v977
                            end
                        end
                    end
                end
                while vu2.TeleportToGear do
                    task.wait()
                    if vu34:FindFirstChild("MysticIsland") then
                        local v979 = v978()
                        if v979 and v979.Transparency < 1 then
                            vu123(v979.CFrame)
                            vu2.TeleportGear = true
                        else
                            vu2.TeleportGear = false
                        end
                    else
                        vu2.TeleportGear = false
                    end
                end
                vu2.TeleportGear = false
            end)
        end
    })
    v891.RaceV4:AddToggle({
        "Teleport To Mirage",
        false,
        function(p980)
			-- upvalues: (ref) vu2, (ref) vu34, (ref) vu123
            vu2.AutoMiragePuzzle = p980
            task.spawn(function()
				-- upvalues: (ref) vu34, (ref) vu2, (ref) vu123
                local function v986()
					-- upvalues: (ref) vu34
                    local v981 = vu34:FindFirstChild("MysticIsland")
                    local v982, v983, v984 = pairs(v981:GetChildren())
                    while true do
                        local v985
                        v984, v985 = v982(v983, v984)
                        if v984 == nil then
                            break
                        end
                        if v985:FindFirstChild("dbz_map1_Cube.012") then
                            return v985["dbz_map1_Cube.012"]
                        end
                    end
                end
                while vu2.AutoMiragePuzzle do
                    task.wait()
                    if vu2.TeleportGear then
                        vu2.MiragePuzzle = false
                    elseif vu34:FindFirstChild("MysticIsland") then
                        local v987 = v986()
                        if v987 then
                            vu123(v987.CFrame * CFrame.new(0, 211.8, 0))
                        end
                        vu2.MiragePuzzle = true
                    else
                        vu2.MiragePuzzle = false
                    end
                end
                vu2.MiragePuzzle = false
            end)
        end
    })
    v891.RaceV4:AddToggle({
        "Teleport To Fruit Dealer",
        false,
        function(p988)
			-- upvalues: (ref) vu2, (ref) vu33, (ref) vu34, (ref) vu123
            vu2.TeleportToFruitDeler = p988
            task.spawn(function()
				-- upvalues: (ref) vu33, (ref) vu2, (ref) vu34, (ref) vu123
                local vu989 = nil
                local function v1000()
					-- upvalues: (ref) vu989, (ref) vu33
                    if vu989 then
                        return vu989
                    end
                    local v990 = getnilinstances()
                    local v991 = vu33
                    local v992, v993, v994 = pairs(v991:GetChildren())
                    while true do
                        local v995
                        v994, v995 = v992(v993, v994)
                        if v994 == nil then
                            break
                        end
                        table.insert(v990, v995)
                    end
                    local v996, v997, v998 = pairs(v990)
                    while true do
                        local v999
                        v998, v999 = v996(v997, v998)
                        if v998 == nil then
                            break
                        end
                        if v999.Name == "Advanced Fruit Dealer" then
                            vu989 = v999
                            return v999
                        end
                    end
                end
                while vu2.TeleportToFruitDeler do
                    task.wait()
                    if vu34:FindFirstChild("MysticIsland") then
                        local v1001 = v1000()
                        if v1001 then
                            if v1001:FindFirstChild("HumanoidRootPart") then
                                vu123(v1001.HumanoidRootPart.CFrame)
                            end
                            vu2.AFruitDealer = true
                        else
                            vu2.AFruitDealer = false
                        end
                    else
                        vu2.AFruitDealer = false
                    end
                end
                vu2.AFruitDealer = false
            end)
        end
    })
    v891.RaceV4:AddSection({
        "Trial"
    })
    v891.RaceV4:AddToggle({
        "Teleport To Race Door",
        false,
        function(p1002)
			-- upvalues: (ref) vu2, (ref) vu369, (ref) vu35, (ref) vu123
            vu2.AutoTpRaceDoor = p1002
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu369, (ref) vu35, (ref) vu123
                while vu2.AutoTpRaceDoor do
                    task.wait()
                    if not vu369:CheckTrial() then
                        local v1003 = vu369
                        local v1004 = vu369.RaceDoor[v1003:GetPlayerRace()]
                        if v1004 then
                            if vu35:DistanceFromCharacter(v1004.p) < 25 then
                                vu2.RaceDoor = false
                            else
                                vu123(v1004)
                                vu2.RaceDoor = true
                            end
                        else
                            vu2.RaceDoor = false
                        end
                    end
                end
            end)
        end
    })
    v891.RaceV4:AddToggle({
        ["Desc"] = "report bugs on our discord [ redz Hub | Community ]",
        "Auto Finish Trial [ BETA ]",
        false,
        function(p1005)
			-- upvalues: (ref) vu2, (ref) vu15, (ref) vu314, (ref) vu31, (ref) vu35, (ref) vu30, (ref) vu369, (ref) vu195, (ref) vu34, (ref) vu10, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu487, (ref) vu331
            vu2.AutoFinishTrial = p1005
            task.spawn(function()
				-- upvalues: (ref) vu15, (ref) vu2, (ref) vu314, (ref) vu31, (ref) vu35, (ref) vu30, (ref) vu369, (ref) vu195, (ref) vu34, (ref) vu10, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu487, (ref) vu331
                local v1006 = vu15(workspace, "_WorldOrigin", "Locations")
                local vu1007 = {
                    ["CyborgCFrame"] = CFrame.new(28286, 14896, 102),
                    ["FarmRotation"] = CFrame.new(60, 0, 0),
                    ["RandomTool"] = "Melee"
                }
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu1007
                    while vu2.AutoFinishTrial do
                        vu1007.FarmRotation = Vector3.new(60, 0, 0)
                        task.wait(1)
                        vu1007.FarmRotation = Vector3.new(0, 0, 60)
                        task.wait(1)
                        vu1007.FarmRotation = Vector3.new(- 60, 0, 0)
                        task.wait(1)
                        vu1007.FarmRotation = Vector3.new(0, 0, - 60)
                        task.wait(1)
                        vu1007.FarmRotation = Vector3.new(0, 0, 0)
                        task.wait(1)
                    end
                end)
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu314, (ref) vu1007
                    while vu2.AutoFinishTrial do
                        if vu314("Melee") then
                            vu1007.RandomTool = "Melee"
                            task.wait(2)
                            FarmRotation = CFr
                        end
                        if vu314("Blox Fruit") then
                            vu1007.RandomTool = "Blox Fruit"
                            task.wait(3)
                        end
                        if vu314("Sword") then
                            vu1007.RandomTool = "Sword"
                            task.wait(2)
                        end
                        if vu314("Gun") then
                            vu1007.RandomTool = "Gun"
                            task.wait(2)
                        end
                    end
                end)
                local function v1015()
					-- upvalues: (ref) vu31, (ref) vu35
                    local v1008 = vu31
                    local v1009, v1010, v1011 = pairs(v1008:GetChildren())
                    local v1012 = 1000
                    local v1013 = nil
                    while true do
                        local v1014
                        v1011, v1014 = v1009(v1010, v1011)
                        if v1011 == nil then
                            break
                        end
                        if v1014.PrimaryPart and vu35:DistanceFromCharacter(v1014.PrimaryPart.Position) <= v1012 then
                            v1012 = vu35:DistanceFromCharacter(v1014.PrimaryPart.Position)
                            v1013 = v1014
                        end
                    end
                    return v1013
                end
                local function v1023()
					-- upvalues: (ref) vu30, (ref) vu35
                    local v1016 = vu30
                    local v1017, v1018, v1019 = pairs(v1016:GetChildren())
                    while true do
                        local v1020
                        v1019, v1020 = v1017(v1018, v1019)
                        if v1019 == nil then
                            break
                        end
                        local v1021 = v1020:FindFirstChild("Health")
                        if v1021 and v1021.Value > 0 then
                            local v1022 = v1020.PrimaryPart
                            if v1022 then
                                v1022 = vu35:DistanceFromCharacter(v1020.PrimaryPart.Position)
                            end
                            if v1022 and v1022 <= 1000 then
                                return v1020
                            end
                        end
                    end
                end
                local v1024 = vu1007
                while vu2.AutoFinishTrial do
                    task.wait()
                    local v1025 = vu369:GetPlayerRace()
                    if v1025 and vu195:CheckTimer() then
                        if v1025 == "Human" then
                            if v1006:FindFirstChild("Trial of Strength") and vu34:FindFirstChild("HumanTrial") then
                                if vu35:DistanceFromCharacter(v1006["Trial of Strength"].Position) > 500 then
                                    vu2.FinishTrial = false
                                else
                                    vu10(350)
                                    local v1026 = v1015()
                                    if v1026 and v1026:FindFirstChild("HumanoidRootPart") then
                                        vu123(v1026.HumanoidRootPart.CFrame + vu2.FarmPos)
                                        pcall(function()
											-- upvalues: (ref) vu7, (ref) vu336
                                            vu7()
                                            vu336()
                                        end)
                                        vu2.FinishTrial = true
                                    else
                                        vu2.FinishTrial = false
                                    end
                                end
                            else
                                vu2.FinishTrial = false
                            end
                        elseif v1025 == "Ghoul" then
                            if v1006:FindFirstChild("Trial of Carnage") and vu34:FindFirstChild("GhoulTrial") then
                                if vu35:DistanceFromCharacter(v1006["Trial of Carnage"].Position) > 500 then
                                    vu2.FinishTrial = false
                                else
                                    vu10(350)
                                    local v1027 = v1015()
                                    if v1027 and v1027:FindFirstChild("HumanoidRootPart") then
                                        vu123(v1027.HumanoidRootPart.CFrame + vu2.FarmPos)
                                        pcall(function()
											-- upvalues: (ref) vu7, (ref) vu336
                                            vu7()
                                            vu336()
                                        end)
                                        vu2.FinishTrial = true
                                    else
                                        vu2.FinishTrial = false
                                    end
                                end
                            else
                                vu2.FinishTrial = false
                            end
                        elseif v1025 == "Fishman" then
                            if v1006:FindFirstChild("Trial of Water") and vu34:FindFirstChild("FishmanTrial") then
                                if vu35:DistanceFromCharacter(v1006["Trial of Water"].Position) > 1000 then
                                    vu2.FinishTrial = false
                                else
                                    local v1028 = v1023()
                                    if v1028 and v1028:FindFirstChild("HumanoidRootPart") then
                                        local v1029 = v1028.HumanoidRootPart.Position
                                        local v1030 = CFrame.new(v1029.X, 25, v1029.Y) * v1024.FarmRotation
                                        vu123(v1030)
                                        if vu35:DistanceFromCharacter(v1030.p) <= 50 then
                                            vu487()
                                            vu331(v1024.RandomTool)
                                        end
                                        vu7()
                                        vu2.FinishTrial = true
                                    else
                                        vu2.FinishTrial = false
                                    end
                                end
                            else
                                vu2.FinishTrial = false
                            end
                        elseif v1025 == "Cyborg" then
                            if v1006:FindFirstChild("Trial of the Machine") and vu34:FindFirstChild("CyborgTrial") then
                                if vu35:DistanceFromCharacter(v1006["Trial of the Machine"].Position) > 1000 then
                                    vu2.FinishTrial = false
                                else
                                    vu123(CFrame.new(28286, 14896, 102))
                                    vu2.FinishTrial = true
                                end
                            else
                                vu2.FinishTrial = false
                            end
                        elseif v1025 == "Skypiea" then
                            if v1006:FindFirstChild("Trial of the King") and (vu34:FindFirstChild("SkyTrial") and vu35:DistanceFromCharacter(v1006["Trial of the King"].Position) <= 600) then
                                local v1031, v1032, v1033 = pairs(vu34.SkyTrial:GetChildren())
                                while true do
                                    local v1034
                                    v1033, v1034 = v1031(v1032, v1033)
                                    if v1033 == nil then
                                        break
                                    end
                                    if v1034:FindFirstChild("FinishPart") and v1034.FinishPart:FindFirstChild("TouchInterest") then
                                        local v1035 = vu35.Character
                                        if v1035 then
                                            v1035 = vu35.Character.PrimaryPart
                                        end
                                        if v1035 then
                                            firetouchinterest(v1035, v1034.FinishPart, 0)
                                            task.wait(0.1)
                                            firetouchinterest(v1035, v1034.FinishPart, 1)
                                        end
                                    end
                                end
                            end
                            vu2.FinishTrial = false
                        elseif v1025 == "Mink" then
                            if v1006:FindFirstChild("Trial of Speed") and (vu34:FindFirstChild("MinkTrial") and vu35:DistanceFromCharacter(v1006["Trial of Speed"].Position) <= 600) then
                                local v1036 = workspace:FindFirstChild("StartPoint")
                                if v1036 and v1036:FindFirstChild("TouchInterest") then
                                    local v1037 = vu35.Character
                                    if v1037 then
                                        v1037 = vu35.Character.PrimaryPart
                                    end
                                    if v1037 then
                                        firetouchinterest(v1037, v1036, 0)
                                        task.wait(0.1)
                                        firetouchinterest(v1037, v1036, 1)
                                    end
                                end
                            end
                            vu2.FinishTrial = false
                        else
                            vu2.FinishTrial = false
                        end
                    end
                end
            end)
        end
    })
    if v37 then
        v891.RaceV4:AddSection({
            "Race"
        })
        v891.RaceV4:AddToggle({
            "Auto Train",
            false,
            function(p1038)
				-- upvalues: (ref) vu2, (ref) vu849
                vu2.AutoTrain = p1038
                vu849()
            end
        })
    end
else
    v891.RaceV4:Destroy()
end
if vu36.Value >= vu38 then
    v891.Stats:Destroy()
else
    local vu1039 = 1
    local vu1040 = nil
    local vu1041 = nil
    local vu1042 = nil
    local vu1043 = nil
    local vu1044 = nil
    local function vu1047()
		-- upvalues: (ref) vu35, (ref) vu1039, (ref) vu4, (ref) vu2, (ref) vu1040, (ref) vu1041, (ref) vu1042, (ref) vu1043, (ref) vu1044
        local function v1046(p1045)
			-- upvalues: (ref) vu35, (ref) vu1039, (ref) vu4
            if vu35.Data.Points.Value >= 1 then
                vu4("AddPoint", p1045, (math.clamp(vu1039, 1, vu35.Data.Points.Value)))
            end
        end
        while vu2.AutoStats do
            task.wait()
            if vu1040 then
                v1046("Melee")
            end
            if vu1041 then
                v1046("Defense")
            end
            if vu1042 then
                v1046("Sword")
            end
            if vu1043 then
                v1046("Gun")
            end
            if vu1044 then
                v1046("Demon Fruit")
            end
        end
    end
    v891.Stats:AddToggle({
        "Auto Stats",
        false,
        function(p1048)
			-- upvalues: (ref) vu2, (ref) vu1047
            vu2.AutoStats = p1048
            vu1047()
        end,
        "Stats/AutoStats"
    })
    v891.Stats:AddSlider({
        "Select Points",
        1,
        100,
        1,
        1,
        function(p1049)
			-- upvalues: (ref) vu1039
            vu1039 = p1049
        end,
        "Stats/SelectPoints"
    })
    v891.Stats:AddSection({
        "Select Stats"
    })
    v891.Stats:AddToggle({
        ["Name"] = "Melee",
        ["Flag"] = "Stats/SelectMelee",
        ["Callback"] = function(p1050)
			-- upvalues: (ref) vu1040
            vu1040 = p1050
        end
    })
    v891.Stats:AddToggle({
        ["Name"] = "Defense",
        ["Flag"] = "Stats/SelectDefense",
        ["Callback"] = function(p1051)
			-- upvalues: (ref) vu1041
            vu1041 = p1051
        end
    })
    v891.Stats:AddToggle({
        ["Name"] = "Sword",
        ["Flag"] = "Stats/SelectSword",
        ["Callback"] = function(p1052)
			-- upvalues: (ref) vu1042
            vu1042 = p1052
        end
    })
    v891.Stats:AddToggle({
        ["Name"] = "Gun",
        ["Flag"] = "Stats/SelectGun",
        ["Callback"] = function(p1053)
			-- upvalues: (ref) vu1043
            vu1043 = p1053
        end
    })
    v891.Stats:AddToggle({
        ["Name"] = "Demon Fruit",
        ["Flag"] = "Stats/SelectDemonFruit",
        ["Callback"] = function(p1054)
			-- upvalues: (ref) vu1044
            vu1044 = p1054
        end
    })
end
v891.FruitRaid:AddSection({
    "Fruits"
})
v891.FruitRaid:AddToggle({
    "Auto Store Fruits",
    false,
    function(p1055)
		-- upvalues: (ref) vu2, (ref) vu35, (ref) vu4
        vu2.AutoStoreFruits = p1055
        task.spawn(function()
			-- upvalues: (ref) vu35, (ref) vu4, (ref) vu2
            local vu1056 = vu35.Data.FruitCap
            local function vu1064(p1057)
				-- upvalues: (ref) vu35, (ref) vu1056
                local v1058 = require(vu35.PlayerGui.Main.UIController.Inventory)
                local v1059, v1060, v1061 = pairs(v1058.Items)
                while true do
                    local v1062
                    v1061, v1062 = v1059(v1060, v1061)
                    if v1061 == nil then
                        break
                    end
                    local v1063 = v1062.details
                    if v1063.Type == "Blox Fruit" and v1063.Name == p1057 then
                        return v1063.Count < vu1056.Value
                    end
                end
                return true
            end
            local function v1068(p1065)
				-- upvalues: (ref) vu1064, (ref) vu4
                if p1065:FindFirstChild("Fruit") then
                    local v1066 = p1065.Name:gsub(" Fruit", "")
                    local v1067 = v1066 .. "-" .. v1066
                    if vu1064(v1067) then
                        vu4("StoreFruit", v1067, p1065)
                        return true
                    end
                end
                return false
            end
            while vu2.AutoStoreFruits do
                task.wait()
                local v1069 = vu35.Character
                if v1069 then
                    local v1070, v1071, v1072 = pairs(v1069:GetChildren())
                    local v1073 = nil
                    while true do
                        local v1074
                        v1072, v1074 = v1070(v1071, v1072)
                        if v1072 == nil then
                            break
                        end
                        if v1068(v1074) then
                            v1073 = true
                        end
                    end
                    local v1075, v1076, v1077 = pairs(vu35.Backpack:GetChildren())
                    while true do
                        local v1078
                        v1077, v1078 = v1075(v1076, v1077)
                        if v1077 == nil then
                            break
                        end
                        if v1068(v1078) then
                            v1073 = true
                        end
                    end
                    if vu2.AutoBuyRaidChip and (not v1073 and SelectRaidChip) then
                        vu4("RaidsNpc", "Select", SelectRaidChip)
                        task.wait(1)
                    end
                end
            end
        end)
    end,
    "Fruits/AutoStore"
})
table.insert(vu892, v891.FruitRaid:AddToggle({
    ["Name"] = "Teleport to Fruits",
    ["Flag"] = "Fruits/Teleport",
    ["Callback"] = function(p1079)
		-- upvalues: (ref) vu2, (ref) vu390, (ref) vu350, (ref) vu123
        vu2.TeleportToFruit = p1079
        task.spawn(function()
			-- upvalues: (ref) vu2, (ref) vu390, (ref) vu350, (ref) vu123
            while vu2.TeleportToFruit do
                task.wait()
                if vu390("Fruit") then
                    vu2.TeleportingToFruit = false
                else
                    local v1080 = vu350()
                    if v1080 then
                        vu123(v1080.CFrame)
                        vu2.TeleportingToFruit = true
                    else
                        vu2.TeleportingToFruit = false
                    end
                end
            end
            vu2.TeleportingToFruit = false
        end)
    end
}))
v891.FruitRaid:AddToggle({
    "Auto Random Fruit",
    false,
    function(p1081)
		-- upvalues: (ref) vu2, (ref) vu4
        vu2.AutoRandomFruit = p1081
        task.spawn(function()
			-- upvalues: (ref) vu2, (ref) vu4
            while vu2.AutoRandomFruit do
                local v1082 = vu4("Cousin", "Buy")
                if type(v1082) ~= "string" then
                    task.wait(7200)
                else
                    task.wait(5)
                end
            end
        end)
    end,
    "Fruits/AutoRandom"
})
v891.FruitRaid:AddSection({
    "Raid"
})
if vu45 then
    v891.FruitRaid:AddParagraph({
        "Only on Sea 2 and 3"
    })
elseif vu44 or vu43 then
    Raids_Chip = {}
    local v1083 = require(vu24.Raids)
    table.foreach(v1083.advancedRaids, function(_, p1084)
        table.insert(Raids_Chip, p1084)
    end)
    table.foreach(v1083.raids, function(_, p1085)
        table.insert(Raids_Chip, p1085)
    end)
    v891.FruitRaid:AddDropdown({
        ["Name"] = "Select Raid",
        ["Options"] = Raids_Chip,
        ["Flag"] = "Raid/SelectedChip",
        ["Callback"] = function(p1086)
			-- upvalues: (ref) vu2
            vu2.SelectRaidChip = p1086
        end
    })
    v891.FruitRaid:AddToggle({
        "Auto Farm Raid",
        false,
        function(p1087)
			-- upvalues: (ref) vu2, (ref) vu4, (ref) vu390, (ref) vu195, (ref) vu123, (ref) vu336, (ref) vu10, (ref) vu302
            vu2.AutoFarmRaid = p1087
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu4, (ref) vu390, (ref) vu195, (ref) vu123, (ref) vu336, (ref) vu10, (ref) vu302
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu4
                    while vu2.AutoFarmRaid do
                        task.wait(0.5)
                        if vu2.SelectRaidChip == "Rumble" then
                            vu4("ThunderGodTalk", true)
                            vu4("ThunderGodTalk")
                        end
                        local v1088 = vu4("Awakener", "Check")
                        if type(v1088) ~= "table" then
                            if v1088 == nil then
                                vu4("Awakener", "Teleport")
                            end
                        else
                            vu4("Awakener", "Awaken")
                        end
                    end
                end)
                while vu2.AutoFarmRaid do
                    task.wait()
                    if vu390("Raid") then
                        vu2.FarmingRaid = false
                    else
                        local v1089 = vu195:GetLastIsland()
                        if v1089 then
                            if vu195:CheckTimer() then
                                vu123(v1089.CFrame + Vector3.new(0, 70, 0))
                                vu336()
                                vu10()
                                vu2.FarmingRaid = true
                            else
                                vu2.FarmingRaid = false
                            end
                        else
                            if vu302("Special Microchip") then
                                vu195:Start()
                            end
                            vu2.FarmingRaid = false
                        end
                    end
                end
                vu2.FarmingRaid = false
            end)
        end
    })
    v891.FruitRaid:AddToggle({
        "Auto Buy Chip",
        false,
        function(p1090)
			-- upvalues: (ref) vu2, (ref) vu302, (ref) vu4
            vu2.AutoBuyRaidChip = p1090
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu302, (ref) vu4
                while vu2.AutoBuyRaidChip do
                    task.wait()
                    if not vu302("Special Microchip") and (SelectRaidChip and not vu2.AutoStoreFruits) then
                        vu4("RaidsNpc", "Select", SelectRaidChip)
                        task.wait(1)
                    end
                end
            end)
        end
    })
end
if vu45 then
    v891.Items:AddSection({
        "Second Sea"
    })
    v891.Items:AddToggle({
        ["Desc"] = "Unlocks and teleports to the new world automatically",
        "Auto Second Sea",
        false,
        function(p1091)
			-- upvalues: (ref) vu2, (ref) vu679
            vu2.AutoSecondSea = p1091
            vu679()
        end,
        "Quests/SecondSea"
    })
    v891.Items:AddSection({
        "Saber"
    })
    v891.Items:AddToggle({
        ["Desc"] = "If you reach level 200, the script will automatically get Shanks Sword",
        "Auto Unlock Saber",
        false,
        function(p1092)
			-- upvalues: (ref) vu2, (ref) vu654
            vu2.AutoUnlockSaber = p1092
            vu654()
        end,
        "Quests/Saber"
    })
    v891.Items:AddSection({
        "God Boss"
    })
    v891.Items:AddToggle({
        "Auto Pole V1",
        false,
        function(p1093)
			-- upvalues: (ref) vu2, (ref) vu637
            vu2.AutoEnelBossPole = p1093
            vu637()
        end
    })
    v891.Items:AddSection({
        "The Saw"
    })
    v891.Items:AddToggle({
        "Auto Saw Sword",
        false,
        function(p1094)
			-- upvalues: (ref) vu2, (ref) vu632
            vu2.AutoSawBoss = p1094
            vu632()
        end
    })
elseif vu44 then
    v891.Items:AddSection({
        "Third Sea"
    })
    v891.Items:AddToggle({
        "Auto Third Sea",
        false,
        function(p1095)
			-- upvalues: (ref) vu2, (ref) vu693
            vu2.AutoThirdSea = p1095
            vu693()
        end
    })
    v891.Items:AddToggle({
        "Auto Kill Don Swan",
        false,
        function(p1096)
			-- upvalues: (ref) vu2, (ref) vu786
            vu2.AutoKillDonSwan = p1096
            vu786()
        end
    })
    v891.Items:AddToggle({
        "Auto Don Swan Hop",
        false,
        function(p1097)
			-- upvalues: (ref) vu2
            vu2.AutoDonSwanHop = p1097
        end
    })
    v891.Items:AddSection({
        "Bartilo Quest"
    })
    v891.Items:AddToggle({
        "Auto Bartilo Quest",
        false,
        function(p1098)
			-- upvalues: (ref) vu2, (ref) vu699
            vu2.AutoBartiloQuest = p1098
            vu699()
        end
    })
    v891.Items:AddSection({
        "Rengoku"
    })
    v891.Items:AddToggle({
        "Auto Rengoku",
        false,
        function(p1099)
			-- upvalues: (ref) vu2, (ref) vu852
            vu2.AutoRengoku = p1099
            vu852()
        end
    })
    v891.Items:AddToggle({
        "Auto Rengoku Hop",
        false,
        function(p1100)
			-- upvalues: (ref) vu2
            vu2.AutoRengokuHop = p1100
        end
    })
    v891.Items:AddSection({
        "Legendary Sword"
    })
    v891.Items:AddToggle({
        "Auto Buy Legendary Sword",
        false,
        function(p1101)
			-- upvalues: (ref) vu2, (ref) vu4
            vu2.AutoLegendarySword = p1101
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu4
                while vu2.AutoLegendarySword do
                    task.wait(0.5)
                    vu4("LegendarySwordDealer", "1")
                    vu4("LegendarySwordDealer", "2")
                    vu4("LegendarySwordDealer", "3")
                end
            end)
        end,
        "Buy/LegendarySword"
    })
    v891.Items:AddToggle({
        "Auto Buy True Triple Katana",
        false,
        function(p1102)
			-- upvalues: (ref) vu2, (ref) vu4
            vu2.AutoTTK = p1102
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu4
                while vu2.AutoTTK do
                    task.wait()
                    vu4("MysteriousMan", "1")
                    vu4("MysteriousMan", "2")
                    vu4("MysteriousMan", "3")
                end
            end)
        end,
        "Buy/TTK"
    })
    v891.Items:AddSection({
        "Race"
    })
    v891.Items:AddToggle({
        "Auto Evo Race V2",
        false,
        function(p1103)
			-- upvalues: (ref) vu2, (ref) vu838
            vu2.AutoRaceV2 = p1103
            vu838()
        end
    })
    if v37 then
        v891.Items:AddToggle({
            "Auto Evo Race V3",
            false,
            function(p1104)
				-- upvalues: (ref) vu2, (ref) vu846
                vu2.AutoRaceV3 = p1104
                vu846()
            end
        })
    end
    v891.Items:AddSection({
        "Cursed Captain"
    })
    v891.Items:AddToggle({
        "Auto Cursed Captain",
        false,
        function(p1105)
			-- upvalues: (ref) vu2, (ref) vu788
            vu2.AutoCursedCaptain = p1105
            vu788()
        end
    })
    v891.Items:AddSection({
        "Dark Beard"
    })
    v891.Items:AddToggle({
        "Auto Dark Beard",
        false,
        function(p1106)
			-- upvalues: (ref) vu2, (ref) vu784
            vu2.AutoDarkbeard = p1106
            vu784()
        end,
        "Boss/Darkbeard"
    })
    v891.Items:AddSection({
        "Law"
    })
    v891.Items:AddToggle({
        "Auto Buy Law Chip",
        false,
        function(p1107)
			-- upvalues: (ref) vu2, (ref) vu6, (ref) vu302, (ref) vu4
            vu2.AutoBuyLawChip = p1107
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu6, (ref) vu302, (ref) vu4
                while vu2.AutoBuyLawChip do
                    task.wait()
                    if not (vu6("Order") or vu302("Microchip")) then
                        vu4("BlackbeardReward", "Microchip", "2")
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        "Auto Start Law Raid",
        false,
        function(p1108)
			-- upvalues: (ref) vu2, (ref) vu6, (ref) vu302, (ref) vu34
            vu2.AutoStartLawRaid = p1108
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu6, (ref) vu302, (ref) vu34
                while vu2.AutoStartLawRaid do
                    task.wait()
                    if not vu6("Order") and vu302("Microchip") then
                        pcall(function()
							-- upvalues: (ref) vu34
                            fireclickdetector(vu34.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                        end)
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        "Auto Kill Law Boss",
        false,
        function(p1109)
			-- upvalues: (ref) vu2, (ref) vu703
            vu2.AutoKillLawBoss = p1109
            vu703()
        end
    })
elseif vu43 then
    v891.Items:AddSection({
        "Elite Hunter"
    })
    local vu1110 = v891.Items:AddParagraph({
        "Elite Stats : not Spawn"
    })
    local vu1111 = v891.Items:AddParagraph({
        "Elite Hunter progress : 0"
    })
    task.spawn(function()
		-- upvalues: (ref) vu6, (ref) vu1110
        while task.wait(0.1) do
            if vu6("Urban") or (vu6("Deandre") or vu6("Diablo")) then
                vu1110:SetTitle("Elite Stats : Spawned")
            else
                vu1110:SetTitle("Elite Stats : not Spawn")
            end
        end
    end)
    if not v37 then
        task.spawn(function()
			-- upvalues: (ref) vu1111, (ref) vu4
            while task.wait(1) do
                vu1111:SetTitle("Elite Hunter progress : " .. vu4("EliteHunter", "Progress"))
            end
        end)
    end
    table.insert(vu892, v891.Items:AddToggle({
        "Auto Elite Hunter",
        false,
        function(p1112)
			-- upvalues: (ref) vu2, (ref) vu630
            vu2.AutoEliteHunter = p1112
            vu630()
        end,
        "Farm/EliteHunter"
    }))
    if not vu22("Yama") then
        table.insert(vu892, v891.Items:AddToggle({
            "Auto Collect Yama < Need 30 >",
            false,
            function(p1113)
				-- upvalues: (ref) vu2, (ref) vu4, (ref) vu34
                vu2.AutoCollectYama = p1113
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu4, (ref) vu34
                    while vu2.AutoCollectYama do
                        task.wait()
                        pcall(function()
							-- upvalues: (ref) vu4, (ref) vu34
                            if vu4("EliteHunter", "Progress") >= 30 then
                                fireclickdetector(vu34.Waterfall.SealedKatana.Handle.ClickDetector)
                            end
                        end)
                    end
                end)
            end,
            "Collect/Yama"
        }))
    end
    v891.Items:AddToggle({
        "Auto Elite Hunter Hop",
        false,
        function(p1114)
			-- upvalues: (ref) vu2
            vu2.AutoEliteHunterHop = p1114
        end,
        "Farm/EliteHunterHop"
    })
    v891.Items:AddSection({
        "Tushita"
    })
    local vu1115 = v891.Items:AddParagraph({
        "Rip Indra Stats : not Spawn"
    })
    task.spawn(function()
		-- upvalues: (ref) vu6, (ref) vu1115
        while task.wait(0.5) do
            if vu6("rip_indra True Form") then
                vu1115:SetTitle("Rip Indra Stats : Spawned")
            else
                vu1115:SetTitle("Rip Indra Stats : not Spawn")
            end
        end
    end)
    v891.Items:AddToggle({
        ["Name"] = "Auto Tushita",
        ["Callback"] = function(p1116)
			-- upvalues: (ref) vu2, (ref) vu866
            vu2.AutoTushita = p1116
            vu866()
        end
    })
    v891.Items:AddSection({
        "Cake Prince + Dough King"
    })
    local vu1117 = v891.Items:AddParagraph({
        "Stats : 0"
    })
    if not v37 then
        task.spawn(function()
			-- upvalues: (ref) vu6, (ref) vu1117, (ref) vu4
            while task.wait(1) do
                if vu6("Dough King") then
                    vu1117:SetTitle("Stats : Spawned | Dough King")
                elseif vu6("Cake Prince") then
                    vu1117:SetTitle("Stats : Spawned | Cake Prince")
                else
                    local v1118 = vu4("CakePrinceSpawner", true)
                    vu1117:SetTitle("Stats : " .. string.gsub(tostring(v1118), "%D", ""))
                    task.wait(5)
                end
            end
        end)
    end
    v891.Items:AddToggle({
        "Auto Cake Prince",
        false,
        function(p1119)
			-- upvalues: (ref) vu2, (ref) vu792
            vu2.AutoCakePrince = p1119
            vu792()
        end,
        "Farm/CakePrince"
    })
    v891.Items:AddToggle({
        "Auto Dough King",
        false,
        function(p1120)
			-- upvalues: (ref) vu2, (ref) vu801
            vu2.AutoDoughKing = p1120
            vu801()
        end,
        "Farm/DoughKing"
    })
    v891.Items:AddSection({
        "Rip Indra"
    })
    local vu1123 = v891.Items:AddToggle({
        "Auto Active Button Haki Color",
        false,
        function(p1121)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu4, (ref) vu368, (ref) vu123
            vu2.RipIndraLegendaryHaki = p1121
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu35, (ref) vu4
                while vu2.RipIndraLegendaryHaki do
                    task.wait()
                    local v1122 = vu35 and vu35.Character
                    if v1122 then
                        v1122 = vu35.Character.PrimaryPart
                    end
                    if (v1122.Position - Vector3.new(- 5415, 314, - 2212)).Magnitude >= 5 then
                        if (v1122.Position - Vector3.new(- 4972, 336, - 3720)).Magnitude >= 5 then
                            if (v1122.Position - Vector3.new(- 5420, 1089, - 2667)).Magnitude < 5 then
                                vu4("activateColor", "Winter Sky")
                            end
                        else
                            vu4("activateColor", "Snow White")
                        end
                    else
                        vu4("activateColor", "Pure Red")
                    end
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu368, (ref) vu123
                while vu2.RipIndraLegendaryHaki do
                    task.wait()
                    if not (vu2.AutoFarm_Level or (vu2.AutoFarmBone or vu2.AutoCakePrince)) then
                        if vu368() then
                            vu123(vu368().CFrame)
                        elseif not (vu368() or vu2.AutoRipIndra) then
                            vu123(CFrame.new(- 5119, 315, - 2964))
                        end
                    end
                end
            end)
        end
    })
    local vu1125 = v891.Items:AddToggle({
        "Auto Rip Indra",
        false,
        function(p1124)
			-- upvalues: (ref) vu2, (ref) vu701
            vu2.AutoRipIndra = p1124
            vu701()
        end
    })
    local v1126 = vu1125
    vu1125.Callback(v1126, function()
		-- upvalues: (ref) vu1123
        vu1123:Set(false)
    end)
    local v1127 = vu1123
    vu1123.Callback(v1127, function()
		-- upvalues: (ref) vu1125
        vu1125:Set(false)
    end)
    v891.Items:AddSection({
        "Citizen Quest"
    })
    v891.Items:AddToggle({
        "Auto Citizen Quest",
        false,
        function(p1128)
			-- upvalues: (ref) vu2, (ref) vu635
            vu2.AutoMusketeerHat = p1128
            vu635()
        end
    })
end
if vu44 or vu43 then
    v891.Items:AddSection({
        "Fighting Style"
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto Death Step",
        ["Callback"] = function(p1129)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu31, (ref) vu302, (ref) vu317, (ref) vu43, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
            vu2.AutoDeathStep = p1129
            task.spawn(function()
				-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu302, (ref) vu317, (ref) vu43, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu336, (ref) vu11
                local function v1138()
					-- upvalues: (ref) vu35, (ref) vu31
                    local v1130 = math.huge
                    local v1131 = nil
                    local v1132 = vu35 and vu35.Character
                    if v1132 then
                        v1132 = vu35.Character.PrimaryPart
                    end
                    local v1133 = vu31
                    local v1134, v1135, v1136 = pairs(v1133:GetChildren())
                    while true do
                        local v1137
                        v1136, v1137 = v1134(v1135, v1136)
                        if v1136 == nil then
                            break
                        end
                        if (v1137.Name == "Reborn Skeleton" or (v1137.Name == "Living Zombie" or (v1137.Name == "Demonic Soul" or (v1137.Name == "Posessed Mummy" or v1137.Name == "Water Fighter")))) and (v1132 and (v1137 and (v1137:FindFirstChild("HumanoidRootPart") and (v1132.Position - v1137.HumanoidRootPart.Position).Magnitude <= v1130))) then
                            v1130 = (v1132.Position - v1137.HumanoidRootPart.Position).Magnitude
                            v1131 = v1137
                        end
                    end
                    return v1131
                end
                local v1139 = 0
                local v1140 = false
                while vu2.AutoDeathStep do
                    task.wait()
                    if vu302("Black Leg") then
                        v1139 = vu317("Black Leg")
                    end
                    if 400 <= v1139 and vu43 then
                        vu4("TravelDressrosa")
                    end
                    if v1140 then
                        vu4("BuyDeathStep")
                    end
                    if vu302("Death Step") then
                        vu321("Death Step")
                    elseif v1139 >= 400 then
                        local v1141 = vu31:FindFirstChild("Awakened Ice Admiral")
                        if vu302("Library Key") then
                            vu321("Library Key")
                            vu123(CFrame.new(6373, 293, - 6839))
                            v1140 = true
                        elseif v1141 and v1141:FindFirstChild("HumanoidRootPart") then
                            vu123(v1141.HumanoidRootPart.CFrame + vu2.FarmPos)
                            pcall(function()
								-- upvalues: (ref) vu7, (ref) vu336
                                vu7()
                                vu336()
                            end)
                        else
                            vu123(CFrame.new(6473, 297, - 6944))
                        end
                    elseif vu302("Black Leg") or v1139 >= 400 then
                        if vu302("Black Leg") and v1139 < 400 then
                            vu321("Black Leg")
                            local vu1142 = v1138()
                            if vu1142 and vu1142:FindFirstChild("HumanoidRootPart") then
                                vu123(vu1142.HumanoidRootPart.CFrame + vu2.FarmPos)
                                pcall(function()
									-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1142
                                    vu7()
                                    vu11(vu1142)
                                end)
                            elseif vu43 then
                                vu123(CFrame.new(- 9513, 164, 5786))
                            else
                                vu123(CFrame.new(- 3350, 282, - 10527))
                            end
                        end
                    else
                        vu4("BuyBlackLeg")
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto Electric Claw <BETA>",
        ["Callback"] = function(p1143)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu31, (ref) vu302, (ref) vu317, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
            vu2.AutoElectricClaw = p1143
            task.spawn(function()
				-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu302, (ref) vu317, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
                local function v1152()
					-- upvalues: (ref) vu35, (ref) vu31
                    local v1144 = math.huge
                    local v1145 = nil
                    local v1146 = vu35 and vu35.Character
                    if v1146 then
                        v1146 = vu35.Character.PrimaryPart
                    end
                    local v1147 = vu31
                    local v1148, v1149, v1150 = pairs(v1147:GetChildren())
                    while true do
                        local v1151
                        v1150, v1151 = v1148(v1149, v1150)
                        if v1150 == nil then
                            break
                        end
                        if (v1151.Name == "Reborn Skeleton" or (v1151.Name == "Living Zombie" or (v1151.Name == "Demonic Soul" or (v1151.Name == "Posessed Mummy" or v1151.Name == "Water Fighter")))) and (v1146 and (v1151 and (v1151:FindFirstChild("HumanoidRootPart") and (v1146.Position - v1151.HumanoidRootPart.Position).Magnitude <= v1144))) then
                            v1144 = (v1146.Position - v1151.HumanoidRootPart.Position).Magnitude
                            v1145 = v1151
                        end
                    end
                    return v1145
                end
                local v1153 = 0
                local v1154 = 0
                while vu2.AutoElectricClaw do
                    task.wait()
                    if vu302("Electro") then
                        v1153 = vu317("Electro")
                    elseif vu302("Electric Claw") then
                        v1154 = vu317("Electric Claw")
                    end
                    if v1153 < 400 then
                        if vu302("Electro") then
                            vu321("Electro")
                        else
                            vu4("BuyElectro")
                        end
                    elseif v1154 < 600 then
                        if vu302("Electric Claw") then
                            vu321("Electric Claw")
                        else
                            vu4("BuyElectricClaw")
                        end
                    end
                    local vu1155 = v1152()
                    if vu1155 and vu1155:FindFirstChild("HumanoidRootPart") then
                        vu123(vu1155.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1155
                            vu7()
                            vu11(vu1155)
                        end)
                    elseif vu43 then
                        vu123(CFrame.new(- 9513, 164, 5786))
                    else
                        vu123(CFrame.new(- 3350, 282, - 10527))
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto Sharkman Karate",
        ["Callback"] = function(p1156)
			-- upvalues: (ref) vu2, (ref) vu4, (ref) vu302, (ref) vu317, (ref) vu321, (ref) vu31, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu86, (ref) vu336
            vu2.AutoSharkmanKarate = p1156
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu4, (ref) vu302, (ref) vu317, (ref) vu321, (ref) vu31, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu86, (ref) vu336
                local v1157 = 0
                local vu1158 = 0
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu1158, (ref) vu4
                    while vu2.AutoSharkmanKarate do
                        task.wait()
                        vu1158 = vu4("BuySharkmanKarate", true)
                    end
                end)
                local v1159 = vu1158
                while vu2.AutoSharkmanKarate do
                    task.wait()
                    if vu302("Fishman Karate") then
                        v1157 = vu317("Fishman Karate")
                    elseif vu302("Sharkman Karate") then
                        vu317("Sharkman Karate")
                    end
                    if v1159 == 1 then
                        vu4("BuySharkmanKarate")
                    elseif vu302("Sharkman Karate") then
                        vu321("Sharkman Karate")
                        local vu1160 = vu31:FindFirstChild("Water Fighter")
                        if vu1160 and vu1160:FindFirstChild("HumanoidRootPart") then
                            vu123(vu1160.HumanoidRootPart.CFrame + vu2.FarmPos)
                            pcall(function()
								-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1160
                                vu7()
                                vu11(vu1160, true)
                            end)
                        else
                            vu86:NPCs({
                                CFrame.new(- 3339, 290, - 10412),
                                CFrame.new(- 3518, 290, - 10419),
                                CFrame.new(- 3536, 290, - 10607),
                                CFrame.new(- 3345, 280, - 10667)
                            })
                        end
                    elseif vu302("Water Key") and 400 <= v1157 then
                        vu4("BuySharkmanKarate", true)
                    elseif vu302("Water Key") or 400 > v1157 then
                        if vu302("Fishman Karate") or v1157 >= 400 then
                            if vu302("Fishman Karate") and v1157 < 400 then
                                vu321("Fishman Karate")
                                local vu1161 = vu31:FindFirstChild("Water Fighter")
                                if vu1161 and vu1161:FindFirstChild("HumanoidRootPart") then
                                    vu123(vu1161.HumanoidRootPart.CFrame + vu2.FarmPos)
                                    pcall(function()
										-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1161
                                        vu7()
                                        vu11(vu1161, true)
                                    end)
                                else
                                    vu86:NPCs({
                                        CFrame.new(- 3339, 290, - 10412),
                                        CFrame.new(- 3518, 290, - 10419),
                                        CFrame.new(- 3536, 290, - 10607),
                                        CFrame.new(- 3345, 280, - 10667)
                                    })
                                end
                            end
                        else
                            vu4("BuyFishmanKarate")
                        end
                    else
                        local vu1162 = vu31:FindFirstChild("Water Fighter")
                        if vu1162 and vu1162:FindFirstChild("HumanoidRootPart") then
                            vu123(vu1162.HumanoidRootPart.CFrame + vu2.FarmPos)
                            pcall(function()
								-- upvalues: (ref) vu7, (ref) vu336, (ref) vu11, (ref) vu1162
                                vu7()
                                vu336()
                                vu11(vu1162, true)
                            end)
                        else
                            vu86:NPCs({
                                CFrame.new(- 3339, 290, - 10412),
                                CFrame.new(- 3518, 290, - 10419),
                                CFrame.new(- 3536, 290, - 10607),
                                CFrame.new(- 3345, 280, - 10667)
                            })
                        end
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto Dragon Talon",
        ["Callback"] = function(p1163)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu31, (ref) vu302, (ref) vu4, (ref) vu317, (ref) vu44, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
            vu2.AutoDragonTalon = p1163
            task.spawn(function()
				-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu302, (ref) vu4, (ref) vu317, (ref) vu44, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
                local v1164 = 0
                local vu1165 = false
                local function v1174()
					-- upvalues: (ref) vu35, (ref) vu31
                    local v1166 = math.huge
                    local v1167 = nil
                    local v1168 = vu35 and vu35.Character
                    if v1168 then
                        v1168 = vu35.Character.PrimaryPart
                    end
                    local v1169 = vu31
                    local v1170, v1171, v1172 = pairs(v1169:GetChildren())
                    while true do
                        local v1173
                        v1172, v1173 = v1170(v1171, v1172)
                        if v1172 == nil then
                            break
                        end
                        if (v1173.Name == "Reborn Skeleton" or (v1173.Name == "Living Zombie" or (v1173.Name == "Demonic Soul" or (v1173.Name == "Posessed Mummy" or v1173.Name == "Water Fighter")))) and (v1168 and (v1173 and (v1173:FindFirstChild("HumanoidRootPart") and (v1168.Position - v1173.HumanoidRootPart.Position).Magnitude <= v1166))) then
                            v1166 = (v1168.Position - v1173.HumanoidRootPart.Position).Magnitude
                            v1167 = v1173
                        end
                    end
                    return v1167
                end
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu302, (ref) vu4, (ref) vu1165
                    while vu2.AutoDragonTalon do
                        task.wait()
                        if vu302("Fire Essence") then
                            vu4("BuyDragonTalon", true)
                            vu1165 = true
                        else
                            vu4("Bones", "Buy", 1, 1)
                        end
                    end
                end)
                local v1175 = vu1165
                while vu2.AutoDragonTalon do
                    task.wait()
                    if vu302("Dragon Claw") then
                        v1164 = vu317("Dragon Claw")
                    end
                    if 400 <= v1164 and vu44 then
                        vu4("TravelZou")
                    end
                    if v1175 and 400 <= v1164 then
                        vu4("BuyDragonTalon")
                    elseif (vu302("Dragon Claw") or v1164 >= 400) and (v1175 or vu302("Dragon Claw")) then
                        if vu302("Dragon Claw") and v1164 < 400 or not v1175 and vu302("Dragon Claw") then
                            vu321("Dragon Claw")
                            local vu1176 = v1174()
                            if vu1176 and vu1176:FindFirstChild("HumanoidRootPart") then
                                vu123(vu1176.HumanoidRootPart.CFrame + vu2.FarmPos)
                                pcall(function()
									-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1176
                                    vu7()
                                    vu11(vu1176)
                                end)
                            elseif vu43 then
                                vu123(CFrame.new(- 9513, 164, 5786))
                            else
                                vu123(CFrame.new(- 3350, 282, - 10527))
                            end
                        end
                    else
                        vu4("BlackbeardReward", "DragonClaw", "1")
                        vu4("BlackbeardReward", "DragonClaw", "2")
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto Superhuman",
        ["Callback"] = function(p1177)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu31, (ref) vu302, (ref) vu317, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
            vu2.AutoSuperhuman = p1177
            task.spawn(function()
				-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu302, (ref) vu317, (ref) vu4, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11, (ref) vu43
                local function v1186()
					-- upvalues: (ref) vu35, (ref) vu31
                    local v1178 = math.huge
                    local v1179 = nil
                    local v1180 = vu35 and vu35.Character
                    if v1180 then
                        v1180 = vu35.Character.PrimaryPart
                    end
                    local v1181 = vu31
                    local v1182, v1183, v1184 = pairs(v1181:GetChildren())
                    while true do
                        local v1185
                        v1184, v1185 = v1182(v1183, v1184)
                        if v1184 == nil then
                            break
                        end
                        if (v1185.Name == "Reborn Skeleton" or (v1185.Name == "Living Zombie" or (v1185.Name == "Demonic Soul" or (v1185.Name == "Posessed Mummy" or v1185.Name == "Water Fighter")))) and (v1180 and (v1185 and (v1185:FindFirstChild("HumanoidRootPart") and (v1180.Position - v1185.HumanoidRootPart.Position).Magnitude <= v1178))) then
                            v1178 = (v1180.Position - v1185.HumanoidRootPart.Position).Magnitude
                            v1179 = v1185
                        end
                    end
                    return v1179
                end
                local v1187 = 0
                local v1188 = 0
                local v1189 = 0
                local v1190 = 0
                local v1191 = 0
                while vu2.AutoSuperhuman do
                    task.wait()
                    if vu302("Black Leg") then
                        v1187 = vu317("Black Leg")
                    elseif vu302("Electro") then
                        v1188 = vu317("Electro")
                    elseif vu302("Fishman Karate") then
                        v1189 = vu317("Fishman Karate")
                    elseif vu302("Dragon Claw") then
                        v1190 = vu317("Dragon Claw")
                    elseif vu302("Superhuman") then
                        v1191 = vu317("Superhuman")
                    end
                    if v1187 < 300 then
                        if vu302("Black Leg") then
                            vu321("Black Leg")
                        else
                            vu4("BuyBlackLeg")
                        end
                    elseif v1188 < 300 then
                        if vu302("Electro") then
                            vu321("Electro")
                        else
                            vu4("BuyElectro")
                        end
                    elseif v1189 < 300 then
                        if vu302("Fishman Karate") then
                            vu321("Fishman Karate")
                        else
                            vu4("BuyFishmanKarate")
                        end
                    elseif v1190 < 300 then
                        if vu302("Dragon Claw") then
                            vu321("Dragon Claw")
                        else
                            vu4("BlackbeardReward", "DragonClaw", "1")
                            vu4("BlackbeardReward", "DragonClaw", "2")
                        end
                    elseif v1191 < 600 then
                        if vu302("Superhuman") then
                            vu321("Superhuman")
                        else
                            vu4("BuySuperhuman")
                        end
                    end
                    local vu1192 = v1186()
                    if vu1192 and vu1192:FindFirstChild("HumanoidRootPart") then
                        vu123(vu1192.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1192
                            vu7()
                            vu11(vu1192)
                        end)
                    elseif vu43 then
                        vu123(CFrame.new(- 9513, 164, 5786))
                    else
                        vu123(CFrame.new(- 3350, 282, - 10527))
                    end
                end
            end)
        end
    })
    v891.Items:AddToggle({
        ["Name"] = "Auto God Human",
        ["Callback"] = function(p1193)
			-- upvalues: (ref) vu2, (ref) vu35, (ref) vu31, (ref) vu44, (ref) vu4, (ref) vu302, (ref) vu317, (ref) vu352, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11
            vu2.AutoGodHuman = p1193
            task.spawn(function()
				-- upvalues: (ref) vu35, (ref) vu31, (ref) vu2, (ref) vu44, (ref) vu4, (ref) vu302, (ref) vu317, (ref) vu352, (ref) vu321, (ref) vu123, (ref) vu7, (ref) vu11
                local function v1202()
					-- upvalues: (ref) vu35, (ref) vu31
                    local v1194 = math.huge
                    local v1195 = nil
                    local v1196 = vu35 and vu35.Character
                    if v1196 then
                        v1196 = vu35.Character.PrimaryPart
                    end
                    local v1197 = vu31
                    local v1198, v1199, v1200 = pairs(v1197:GetChildren())
                    while true do
                        local v1201
                        v1200, v1201 = v1198(v1199, v1200)
                        if v1200 == nil then
                            break
                        end
                        if (v1201.Name == "Reborn Skeleton" or (v1201.Name == "Living Zombie" or (v1201.Name == "Demonic Soul" or v1201.Name == "Posessed Mummy"))) and (v1196 and (v1201 and (v1201:FindFirstChild("HumanoidRootPart") and (v1196.Position - v1201.HumanoidRootPart.Position).Magnitude <= v1194))) then
                            v1194 = (v1196.Position - v1201.HumanoidRootPart.Position).Magnitude
                            v1195 = v1201
                        end
                    end
                    return v1195
                end
                local v1203 = 0
                local v1204 = 0
                local v1205 = 0
                local v1206 = 0
                local v1207 = 0
                local v1208 = 0
                local v1209 = 0
                local v1210 = 0
                local v1211 = 0
                while vu2.AutoGodHuman do
                    task.wait()
                    if vu44 then
                        vu4("TravelZou")
                    end
                    if vu302("Black Leg") then
                        v1207 = vu317("Black Leg")
                    elseif vu302("Electro") then
                        v1208 = vu317("Electro")
                    elseif vu302("Fishman Karate") then
                        v1209 = vu317("Fishman Karate")
                    elseif vu302("Dragon Claw") then
                        v1210 = vu317("Dragon Claw")
                    elseif vu302("Superhuman") then
                        v1211 = vu317("Superhuman")
                    elseif vu302("Death Step") then
                        v1203 = vu317("Death Step")
                    elseif vu302("Electric Claw") then
                        v1204 = vu317("Electric Claw")
                    elseif vu302("Sharkman Karate") then
                        v1205 = vu317("Sharkman Karate")
                    elseif vu302("Dragon Talon") then
                        v1206 = vu317("Dragon Talon")
                    elseif vu302("Godhuman") then
                        vu317("Godhuman")
                    end
                    if v1207 < 400 then
                        if vu302("Black Leg") then
                            vu321("Black Leg")
                        else
                            vu352("BuyBlackLeg")
                        end
                    elseif v1208 < 400 then
                        if vu302("Electro") then
                            vu321("Electro")
                        else
                            vu352("BuyElectro")
                        end
                    elseif v1209 < 400 then
                        if vu302("Fishman Karate") then
                            vu321("Fishman Karate")
                        else
                            vu352("BuyFishmanKarate")
                        end
                    elseif v1210 < 400 then
                        if vu302("Dragon Claw") then
                            vu321("Dragon Claw")
                        else
                            vu4("BlackbeardReward", "DragonClaw", "1")
                            vu4("BlackbeardReward", "DragonClaw", "2")
                        end
                    elseif v1211 < 400 then
                        if vu302("Superhuman") then
                            vu321("Superhuman")
                        else
                            vu352("BuySuperhuman")
                        end
                    elseif v1203 < 400 then
                        if vu302("Death Step") then
                            vu321("Death Step")
                        else
                            vu352("BuyDeathStep")
                        end
                    elseif v1204 < 400 then
                        if vu302("Electric Claw") then
                            vu321("Electric Claw")
                        else
                            vu352("BuyElectricClaw")
                        end
                    elseif v1205 < 400 then
                        if vu302("Sharkman Karate") then
                            vu321("Sharkman Karate")
                        else
                            vu352("BuySharkmanKarate")
                        end
                    elseif v1206 < 400 then
                        if vu302("Dragon Talon") then
                            vu321("Dragon Talon")
                        else
                            vu352("BuyDragonTalon")
                        end
                    elseif vu302("Godhuman") then
                        vu321("Godhuman")
                    else
                        vu352("BuyGodhuman")
                    end
                    local vu1212 = v1202()
                    if vu1212 and vu1212:FindFirstChild("HumanoidRootPart") then
                        vu123(vu1212.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu7, (ref) vu11, (ref) vu1212
                            vu7()
                            vu11(vu1212)
                        end)
                    else
                        vu123(CFrame.new(- 9513, 164, 5786))
                    end
                end
            end)
        end
    })
end
if vu43 then
    v891.Items:AddSection({
        "Auto Mastery All"
    })
    v891.Items:AddSlider({
        ["Flag"] = "FMastery/Selected",
        "Select Mastery",
        100,
        600,
        5,
        600,
        function(p1213)
			-- upvalues: (ref) vu2
            vu2.AutoMasteryValue = p1213
        end
    })
    table.insert(vu892, v891.Items:AddToggle({
        ["Name"] = "Auto Mastery All Fighting Style",
        ["Flag"] = "AutoMastery/FightStyle",
        ["Callback"] = function(p1214)
			-- upvalues: (ref) vu2, (ref) vu302, (ref) vu317, (ref) vu352, (ref) vu321, (ref) vu4
            vu2.AutoMasteryFightingStyle = p1214
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu302, (ref) vu317, (ref) vu352, (ref) vu321, (ref) vu4
                local v1215 = 0
                local v1216 = 0
                local v1217 = 0
                local v1218 = 0
                local v1219 = 0
                local v1220 = 0
                local v1221 = 0
                local v1222 = 0
                local v1223 = 0
                local v1224 = 0
                local v1225 = 0
                while vu2.AutoMasteryFightingStyle do
                    task.wait()
                    local v1226 = vu2.AutoMasteryValue
                    if vu302("Black Leg") then
                        v1219 = vu317("Black Leg")
                    elseif vu302("Electro") then
                        v1220 = vu317("Electro")
                    elseif vu302("Fishman Karate") then
                        v1221 = vu317("Fishman Karate")
                    elseif vu302("Dragon Claw") then
                        v1222 = vu317("Dragon Claw")
                    elseif vu302("Superhuman") then
                        v1223 = vu317("Superhuman")
                    elseif vu302("Death Step") then
                        v1224 = vu317("Death Step")
                    elseif vu302("Electric Claw") then
                        v1225 = vu317("Electric Claw")
                    elseif vu302("Sharkman Karate") then
                        v1215 = vu317("Sharkman Karate")
                    elseif vu302("Dragon Talon") then
                        v1216 = vu317("Dragon Talon")
                    elseif vu302("Godhuman") then
                        v1217 = vu317("Godhuman")
                    elseif vu302("Sanguine Art") then
                        v1218 = vu317("Sanguine Art")
                    end
                    if v1219 < v1226 then
                        if vu302("Black Leg") then
                            vu321("Black Leg")
                        else
                            vu352("BuyBlackLeg")
                        end
                    elseif v1220 < v1226 then
                        if vu302("Electro") then
                            vu321("Electro")
                        else
                            vu352("BuyElectro")
                        end
                    elseif v1221 < v1226 then
                        if vu302("Fishman Karate") then
                            vu321("Fishman Karate")
                        else
                            vu352("BuyFishmanKarate")
                        end
                    elseif v1222 < v1226 then
                        if vu302("Dragon Claw") then
                            vu321("Dragon Claw")
                        else
                            vu4("BlackbeardReward", "DragonClaw", "1")
                            vu4("BlackbeardReward", "DragonClaw", "2")
                        end
                    elseif v1223 < v1226 then
                        if vu302("Superhuman") then
                            vu321("Superhuman")
                        else
                            vu352("BuySuperhuman")
                        end
                    elseif v1224 < v1226 then
                        if vu302("Death Step") then
                            vu321("Death Step")
                        else
                            vu352("BuyDeathStep")
                        end
                    elseif v1225 < v1226 then
                        if vu302("Electric Claw") then
                            vu321("Electric Claw")
                        else
                            vu352("BuyElectricClaw")
                        end
                    elseif v1215 < v1226 then
                        if vu302("Sharkman Karate") then
                            vu321("Sharkman Karate")
                        else
                            vu352("BuySharkmanKarate")
                        end
                    elseif v1216 < v1226 then
                        if vu302("Dragon Talon") then
                            vu321("Dragon Talon")
                        else
                            vu352("BuyDragonTalon")
                        end
                    elseif v1217 < v1226 then
                        if vu302("Godhuman") then
                            vu321("Godhuman")
                        else
                            vu352("BuyGodhuman")
                        end
                    elseif v1218 < v1226 then
                        if vu302("Sanguine Art") then
                            vu321("Sanguine Art")
                        else
                            vu352("BuySanguineArt")
                        end
                    elseif vu302("Divine Art") then
                        vu321("Divine Art")
                    else
                        vu352("BuyDivineArt")
                    end
                end
            end)
        end
    }))
    table.insert(vu892, v891.Items:AddToggle({
        "Auto Mastery All Swords",
        false,
        function(p1227)
			-- upvalues: (ref) vu2, (ref) vu15, (ref) vu35, (ref) vu302, (ref) vu4
            vu2.AutoMasteryAllSwords = p1227
            task.spawn(function()
				-- upvalues: (ref) vu15, (ref) vu35, (ref) vu2, (ref) vu302, (ref) vu4
                local vu1228 = require(vu15(vu35, "PlayerGui", "Main", "UIController", "Inventory"))
                local function v1244()
					-- upvalues: (ref) vu1228
                    local v1229 = AutoMasteryValue
                    local v1230 = vu1228.Items
                    local v1231, v1232, v1233 = pairs(v1230)
                    local v1234 = {}
                    while true do
                        local v1235
                        v1233, v1235 = v1231(v1232, v1233)
                        if v1233 == nil then
                            break
                        end
                        local v1236 = v1235.details
                        if v1236.Type == "Sword" then
                            table.insert(v1234, v1236)
                        end
                    end
                    table.sort(v1234, function(p1237, p1238)
                        return p1237.Mastery > p1238.Mastery
                    end)
                    local v1239, v1240, v1241 = pairs(v1234)
                    local v1242 = nil
                    while true do
                        local v1243
                        v1241, v1243 = v1239(v1240, v1241)
                        if v1241 == nil then
                            break
                        end
                        v1242 = {
                            ["Mastery"] = v1243.Mastery,
                            ["Name"] = v1243.Name
                        }
                        if v1242.Mastery < v1229 then
                            return v1242
                        end
                    end
                    return v1242
                end
                while vu2.AutoMasteryAllSwords do
                    task.wait()
                    local v1245 = v1244()
                    if v1245 and not vu302(v1245.Name) then
                        vu4("LoadItem", v1245.Name)
                    end
                end
            end)
        end,
        "AutoMastery/Swords"
    }))
end
if vu43 then
    v891.Items:AddSection({
        "Training Dummy"
    })
    v891.Items:AddToggle({
        "Auto Training Dummy",
        false,
        function(p1246)
			-- upvalues: (ref) vu2, (ref) vu124, (ref) vu4, (ref) vu8, (ref) vu123, (ref) vu336, (ref) vu7, (ref) vu11
            vu2.AutoDummy = p1246
            task.spawn(function()
				-- upvalues: (ref) vu2, (ref) vu124, (ref) vu4, (ref) vu8, (ref) vu123, (ref) vu336, (ref) vu7, (ref) vu11
                task.spawn(function()
					-- upvalues: (ref) vu2, (ref) vu124, (ref) vu4
                    while vu2.AutoDummy do
                        task.wait(1)
                        if not vu124:VerifyQuest("Training Dummy") then
                            vu4("ArenaTrainer")
                        end
                    end
                end)
                while vu2.AutoDummy do
                    task.wait()
                    local vu1247 = vu8({
                        "Training Dummy"
                    })
                    if vu1247 and vu1247:FindFirstChild("HumanoidRootPart") then
                        vu123(vu1247.HumanoidRootPart.CFrame + vu2.FarmPos)
                        pcall(function()
							-- upvalues: (ref) vu336, (ref) vu7, (ref) vu11, (ref) vu1247
                            vu336()
                            vu7()
                            vu11(vu1247)
                        end)
                    else
                        vu123(CFrame.new(3664, 91, 264))
                    end
                end
            end)
        end
    })
end
v891.Items:AddSection({
    "Haki Color"
})
table.insert(vu892, v891.Items:AddToggle({
    ["Name"] = "Auto Buy Haki Color",
    ["Flag"] = "Buy/HakiColor",
    ["Callback"] = function(p1248)
		-- upvalues: (ref) vu2, (ref) vu4
        vu2.AutoBuyHakiColor = p1248
        task.spawn(function()
			-- upvalues: (ref) vu2, (ref) vu4
            while vu2.AutoBuyHakiColor do
                task.wait(0.5)
                pcall(function()
					-- upvalues: (ref) vu4
                    vu4("ColorsDealer", "1")
                    vu4("ColorsDealer", "2")
                end)
            end
        end)
    end
}))
if vu43 then
    v891.Items:AddToggle({
        ["Name"] = "Auto Rainbow Haki",
        ["Callback"] = function(p1249)
			-- upvalues: (ref) vu2, (ref) vu643
            vu2.AutoRainbowHaki = p1249
            vu643()
        end
    })
    v891.Items:AddSection({
        "BETA"
    })
    v891.Items:AddToggle({
        "Auto Soul Guitar",
        false,
        function(p1250)
			-- upvalues: (ref) vu2, (ref) vu723
            vu2.AutoSoulGuitar = p1250
            vu723()
        end
    })
    v891.Items:AddToggle({
        "Auto CDK",
        false,
        function(p1251)
			-- upvalues: (ref) vu2, (ref) vu782
            vu2.AutoCDK = p1251
            vu782()
        end
    })
end
v891.Teleport:AddSection({
    "Teleport to Sea"
})
v891.Teleport:AddButton({
    "Teleport to Sea 1",
    function()
		-- upvalues: (ref) vu4
        vu4("TravelMain")
    end
})
v891.Teleport:AddButton({
    "Teleport to Sea 2",
    function()
		-- upvalues: (ref) vu4
        vu4("TravelDressrosa")
    end
})
v891.Teleport:AddButton({
    "Teleport to Sea 3",
    function()
		-- upvalues: (ref) vu4
        vu4("TravelZou")
    end
})
v891.Teleport:AddSection({
    "Islands"
})
v891.Teleport:AddDropdown({
    ["Name"] = "Select Island",
    ["Options"] = vu45 and {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City"
    } or (vu44 and {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island"
    } or (vu43 and {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Candy Cane Island",
        "Tiki Outpost"
    } or {})),
    ["Default"] = "",
    ["Callback"] = function(p1252)
		-- upvalues: (ref) vu2
        vu2.TeleportIslandSelect = p1252
    end
})
local vu1255 = v891.Teleport:AddToggle({
    "Teleport To Island",
    false,
    function(p1253)
		-- upvalues: (ref) vu2, (ref) vu45, (ref) vu123, (ref) vu44, (ref) vu43
        vu2.TeleportToIsland = p1253
        task.spawn(function()
			-- upvalues: (ref) vu2, (ref) vu45, (ref) vu123, (ref) vu44, (ref) vu43
            while vu2.TeleportToIsland do
                task.wait()
                local v1254 = vu2.TeleportIslandSelect
                if vu45 then
                    if v1254 == "Middle Town" then
                        vu123(CFrame.new(- 688, 15, 1585))
                    elseif v1254 == "MarineFord" then
                        vu123(CFrame.new(- 4810, 21, 4359))
                    elseif v1254 == "Marine" then
                        vu123(CFrame.new(- 2728, 25, 2056))
                    elseif v1254 == "WindMill" then
                        vu123(CFrame.new(889, 17, 1434))
                    elseif v1254 == "Desert" then
                        vu123(CFrame.new(1054, 53, 4490))
                    elseif v1254 == "Snow Island" then
                        vu123(CFrame.new(1298, 87, - 1344))
                    elseif v1254 == "Pirate Village" then
                        vu123(CFrame.new(- 1173, 45, 3837))
                    elseif v1254 == "Jungle" then
                        vu123(CFrame.new(- 1614, 37, 146))
                    elseif v1254 == "Prison" then
                        vu123(CFrame.new(4870, 6, 736))
                    elseif v1254 == "Under Water Island" then
                        vu123(CFrame.new(61164, 5, 1820))
                    elseif v1254 == "Colosseum" then
                        vu123(CFrame.new(- 1535, 7, - 3014))
                    elseif v1254 == "Magma Village" then
                        vu123(CFrame.new(- 5290, 9, 8349))
                    elseif v1254 == "Sky Island 1" then
                        vu123(CFrame.new(- 4814, 718, - 2551))
                    elseif v1254 == "Sky Island 2" then
                        vu123(CFrame.new(- 4652, 873, - 1754))
                    elseif v1254 == "Sky Island 3" then
                        vu123(CFrame.new(- 7895, 5547, - 380))
                    elseif v1254 == "Fountain City" then
                        vu123(CFrame.new(5041, 1, 4101))
                    end
                elseif vu44 then
                    if v1254 == "The Cafe" then
                        vu123(CFrame.new(- 382, 73, 290))
                    elseif v1254 == "Frist Spot" then
                        vu123(CFrame.new(- 11, 29, 2771))
                    elseif v1254 == "Dark Area" then
                        vu123(CFrame.new(3494, 13, - 3259))
                    elseif v1254 == "Flamingo Mansion" then
                        vu123(CFrame.new(- 317, 331, 597))
                    elseif v1254 == "Flamingo Room" then
                        vu123(CFrame.new(2285, 15, 905))
                    elseif v1254 == "Green Zone" then
                        vu123(CFrame.new(- 2258, 73, - 2696))
                    elseif v1254 == "Zombie Island" then
                        vu123(CFrame.new(- 5552, 194, - 776))
                    elseif v1254 == "Two Snow Mountain" then
                        vu123(CFrame.new(752, 408, - 5277))
                    elseif v1254 == "Punk Hazard" then
                        vu123(CFrame.new(- 5897, 18, - 5096))
                    elseif v1254 == "Cursed Ship" then
                        vu123(CFrame.new(919, 125, 32869))
                    elseif v1254 == "Ice Castle" then
                        vu123(CFrame.new(5505, 40, - 6178))
                    elseif v1254 == "Forgotten Island" then
                        vu123(CFrame.new(- 3050, 240, - 10178))
                    elseif v1254 == "Ussop Island" then
                        vu123(CFrame.new(4816, 8, 2863))
                    end
                elseif vu43 then
                    if v1254 == "Mansion" then
                        vu123(CFrame.new(- 12471, 374, - 7551))
                    elseif v1254 == "Port Town" then
                        vu123(CFrame.new(- 334, 7, 5300))
                    elseif v1254 == "Castle On The Sea" then
                        vu123(CFrame.new(- 5073, 315, - 3153))
                    elseif v1254 == "Hydra Island" then
                        vu123(CFrame.new(5756, 610, - 282))
                    elseif v1254 == "Great Tree" then
                        vu123(CFrame.new(2681, 1682, - 7190))
                    elseif v1254 == "Floating Turtle" then
                        vu123(CFrame.new(- 12528, 332, - 8658))
                    elseif v1254 == "Haunted Castle" then
                        vu123(CFrame.new(- 9517, 142, 5528))
                    elseif v1254 == "Ice Cream Island" then
                        vu123(CFrame.new(- 902, 79, - 10988))
                    elseif v1254 == "Peanut Island" then
                        vu123(CFrame.new(- 2062, 50, - 10232))
                    elseif v1254 == "Cake Island" then
                        vu123(CFrame.new(- 1897, 14, - 11576))
                    elseif v1254 == "Candy Cane Island" then
                        vu123(CFrame.new(- 1038, 10, - 14076))
                    elseif v1254 == "Tiki Outpost" then
                        vu123(CFrame.new(- 16224, 9, 439))
                    end
                end
            end
        end)
    end
})
local v1256 = vu1255
vu1255.Callback(v1256, function(p1257)
	-- upvalues: (ref) vu85, (ref) vu35, (ref) vu2, (ref) vu1255
    if p1257 then
        local v1258 = math.huge
        while true do
            task.wait()
            if vu85 then
                v1258 = vu35:DistanceFromCharacter(vu85)
            end
            if not vu2.TeleportToIsland or v1258 < 15 then
                vu1255:Set(false, true)
				-- goto l3
            end
        end
    else
		-- ::l3::
        return
    end
end)
if vu43 then
    v891.Teleport:AddSection({
        "Race V4"
    })
    v891.Teleport:AddButton({
        "Teleport To Temple of Time",
        function()
			-- upvalues: (ref) vu35
            for _ = 1, 8 do
                task.wait()
                vu35.Character:SetPrimaryPartCFrame(CFrame.new(28286, 14897, 103))
            end
        end
    })
end
if v37 then
    v891.Misc:AddSection({
        "Executor"
    })
    v891.Misc:AddButton({
        "Execute Clipboard",
        function()
            loadstring((getclipboard or fromclipboard)())()
        end
    })
end
v891.Misc:AddSection({
    "Join Server"
})
local vu1259 = ""
v891.Misc:AddTextBox({
    ["Name"] = "Input Job Id",
    ["Default"] = "",
    ["PlaceholderText"] = "Job ID",
    ["Callback"] = function(p1260)
		-- upvalues: (ref) vu1259
        vu1259 = p1260
    end
})
v891.Misc:AddButton({
    "Join Server",
    function()
		-- upvalues: (ref) vu2, (ref) vu1259
        vu2.ServerTP(vu1259)
    end
})
v891.Misc:AddButton({
    "Join Clipboard",
    function()
		-- upvalues: (ref) vu2
        local v1261 = (getclipboard or fromclipboard)()
        if type(v1261) == "string" then
            vu2.ServerTP(v1261)
        end
    end
})
v891.Misc:AddSection({
    "Configs"
})
v891.Misc:AddSlider({
    "Farm Distance",
    5,
    30,
    1,
    15,
    function(p1262)
		-- upvalues: (ref) vu2
        vu2.FarmPos = Vector3.new(0, p1262, p1262)
        vu2.FarmDistance = p1262
    end,
    "Misc/FarmDistance"
})
v891.Misc:AddSlider({
    "Tween Speed",
    50,
    300,
    5,
    200,
    function(p1263)
		-- upvalues: (ref) vu2
        vu2.TweenSpeed = p1263 or 250
    end,
    "Misc/TweenSpeed"
})
v891.Misc:AddSlider({
    "Bring Mobs Distance",
    50,
    500,
    10,
    200,
    function(p1264)
		-- upvalues: (ref) vu2
        vu2.BringMobsDistance = p1264 or 200
    end,
    "Misc/BringMobsDistance"
})
v891.Misc:AddSlider({
    "Auto Click Delay",
    0.1,
    1,
    0.01,
    0.201,
    function(p1265)
		-- upvalues: (ref) vu2
        vu2.AutoClickDelay = math.clamp(p1265, 0.125, 1)
    end,
    "Misc/AutoClickDelay"
})
v891.Misc:AddToggle({
    "Increase Attack Distance",
    true,
    function(p1266)
		-- upvalues: (ref) vu2
        vu2.AttackDistance = p1266
    end,
    "Misc/IncreaseAttackDistance"
})
v891.Misc:AddToggle({
    "Bring Mobs",
    true,
    function(p1267)
		-- upvalues: (ref) vu2
        vu2.BringMobs = p1267
    end,
    "Misc/BringMobs"
})
v891.Misc:AddToggle({
    "Auto Haki",
    true,
    function(p1268)
		-- upvalues: (ref) vu2
        vu2.AutoHaki = p1268
    end,
    "Misc/AutoHaki"
})
v891.Misc:AddToggle({
    "Auto Click",
    true,
    function(p1269)
		-- upvalues: (ref) vu2
        vu2.AutoClick = p1269
    end,
    "Misc/AutoClick"
})
v891.Misc:AddToggle({
    "Fast Attack",
    true,
    function(p1270)
		-- upvalues: (ref) vu2
        vu2.FastAttack = p1270
    end,
    "Misc/FastAttack"
})
v891.Misc:AddSection({
    "Codes"
})
v891.Misc:AddButton({
    "Redeem all Codes",
    function()
		-- upvalues: (ref) vu24
        local v1271 = game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/Codes.txt")
        local v1272 = next
        local v1273, v1274 = v1271:gsub("\n", ""):split(" ")
        while true do
            local v1275
            v1274, v1275 = v1272(v1273, v1274)
            if v1274 == nil then
                break
            end
            vu24.Remotes.Redeem:InvokeServer(v1275)
        end
    end
})
v891.Misc:AddSection({
    "Team"
})
v891.Misc:AddButton({
    "Join Pirates Team",
    function()
		-- upvalues: (ref) vu4
        vu4("SetTeam", "Pirates")
    end
})
v891.Misc:AddButton({
    "Join Marines Team",
    function()
		-- upvalues: (ref) vu4
        vu4("SetTeam", "Marines")
    end
})
v891.Misc:AddSection({
    "Menu"
})
v891.Misc:AddButton({
    "Devil Fruit Shop",
    function()
		-- upvalues: (ref) vu4, (ref) vu35
        vu4("GetFruits")
        vu35.PlayerGui.Main.FruitShop.Visible = true
    end
})
v891.Misc:AddButton({
    "Titles",
    function()
		-- upvalues: (ref) vu4, (ref) vu35
        vu4("getTitles")
        vu35.PlayerGui.Main.Titles.Visible = true
    end
})
v891.Misc:AddButton({
    "Haki Color",
    function()
		-- upvalues: (ref) vu35
        vu35.PlayerGui.Main.Colors.Visible = true
    end
})
v891.Misc:AddSection({
    "Local-Player"
})
local vu1276 = nil
local vu1277 = nil
v891.Misc:AddToggle({
    "Walk Speed",
    false,
    function(p1278)
		-- upvalues: (ref) vu2, (ref) vu1277, (ref) vu1276
        if p1278 then
            vu2.WalkSpeedBypass = vu1277
        else
            vu2.WalkSpeedBypass = false
        end
        vu1276 = p1278
    end,
    "Misc/ChangeWS"
})
v891.Misc:AddSlider({
    "Walk Speed",
    10,
    300,
    5,
    150,
    function(p1279)
		-- upvalues: (ref) vu1276, (ref) vu2, (ref) vu1277
        if vu1276 then
            vu2.WalkSpeedBypass = p1279
        else
            vu2.WalkSpeedBypass = false
        end
        vu1277 = p1279
    end,
    "Misc/WalkSpeedSelect"
})
v891.Misc:AddSection({
    "Visual"
})
v891.Misc:AddButton({
    "Remove Fog",
    function()
		-- upvalues: (ref) vu28
        local v1280, _ = vu28:FindFirstChild("LightingLayers")
        if v1280 then
            v1280:Destroy()
        end
    end
})
v891.Misc:AddSection({
    "More FPS"
})
v891.Misc:AddToggle({
    "Remove Damage",
    false,
    function(p1281)
		-- upvalues: (ref) vu24
        vu24.Assets.GUI.DamageCounter.Enabled = not p1281
    end,
    "Misc/RemoveDamage"
})
table.insert(vu892, v891.Misc:AddToggle({
    "Remove Notifications",
    false,
    function(p1282)
		-- upvalues: (ref) vu35
        vu35.PlayerGui.Notifications.Enabled = not p1282
    end,
    "Misc/RemoveNotifications"
}))
v891.Misc:AddSection({
    "Others"
})
v891.Misc:AddToggle({
    "Walk On Water",
    true,
    function(p1283)
		-- upvalues: (ref) vu2
        vu2.WalkOnWater = p1283
        task.spawn(function()
			-- upvalues: (ref) vu2
            local v1284 = workspace:WaitForChild("Map", 9000000000)
            while vu2.WalkOnWater do
                task.wait(0.1)
                v1284:WaitForChild("WaterBase-Plane", 9000000000).Size = Vector3.new(1000, 113, 1000)
            end
            v1284:WaitForChild("WaterBase-Plane", 9000000000).Size = Vector3.new(1000, 80, 1000)
        end)
    end,
    "Misc/WalkOnWater"
})
v891.Misc:AddToggle({
    "Anti AFK",
    true,
    function(p1285)
		-- upvalues: (ref) vu2, (ref) vu26
        vu2.AntiAFK = p1285
        task.spawn(function()
			-- upvalues: (ref) vu2, (ref) vu26
            while vu2.AntiAFK do
                vu26:CaptureController()
                vu26:ClickButton1(Vector2.new(math.huge, math.huge))
                task.wait(600)
            end
        end)
    end,
    "Misc/AntiAFK"
})
local v1286 = next
local v1287 = vu3.Shop
local v1288 = nil
while true do
    local v1289
    v1288, v1289 = v1286(v1287, v1288)
    if v1288 == nil then
        break
    end
    v891.Shop:AddSection({
        v1289[1]
    })
    local v1290, v1291, v1292 = pairs(v1289[2])
    while true do
        local vu1293
        v1292, vu1293 = v1290(v1291, v1292)
        if v1292 == nil then
            break
        end
        local v1294 = vu1293[2]
        local v1295 = type(vu1293[2]) == "table" and function()
			-- upvalues: (ref) vu4, (ref) vu1293
            vu4(unpack(vu1293[2]))
        end or v1294
        v891.Shop:AddButton({
            vu1293[1],
            v1295
        })
    end
end
local vu1296 = false
local vu1297 = 15
v891.Visual:AddSection({
    "Aimbot Nearest"
})
v891.Visual:AddToggle({
    "Aimbot Tap",
    false,
    function(p1298)
		-- upvalues: (ref) vu2
        vu2.AimbotTap = p1298
    end
})
v891.Visual:AddToggle({
    "Aimbot Skill",
    false,
    function(p1299)
		-- upvalues: (ref) vu2
        vu2.AimbotPlayer = p1299
    end
})
v891.Visual:AddSection({
    "Notifications"
})
v891.Visual:AddSlider({
    ["Name"] = "Nofication Time",
    ["Max"] = 120,
    ["Min"] = 5,
    ["Increase"] = 1,
    ["Default"] = 15,
    ["Callback"] = function(p1300)
		-- upvalues: (ref) vu1297
        vu1297 = p1300
    end,
    ["Flag"] = "Notify/Time"
})
v891.Visual:AddToggle({
    ["Name"] = "Fruit Spawn",
    ["Callback"] = function(p1301)
		-- upvalues: (ref) vu1296
        vu1296 = p1301
    end,
    ["Flag"] = "Notify/Fruit"
})
v891.Visual:AddSection({
    "ESP"
})
if vu44 then
    v891.Visual:AddToggle({
        ["Name"] = "ESP Flowers",
        ["Callback"] = function(p1302)
			-- upvalues: (ref) vu2, (ref) vu251
            vu2.EspFlowers = p1302
            vu251()
        end
    })
end
v891.Visual:AddToggle({
    ["Name"] = "ESP Players",
    ["Callback"] = function(p1303)
		-- upvalues: (ref) vu2, (ref) vu242
        vu2.EspPlayer = p1303
        vu242()
    end
})
v891.Visual:AddToggle({
    ["Name"] = "ESP Fruits",
    ["Callback"] = function(p1304)
		-- upvalues: (ref) vu2, (ref) vu260
        vu2.EspFruits = p1304
        vu260()
    end,
    ["Flag"] = "ESP/Fruits"
})
v891.Visual:AddToggle({
    ["Name"] = "ESP Chests",
    ["Callback"] = function(p1305)
		-- upvalues: (ref) vu2, (ref) vu296
        vu2.EspChests = p1305
        vu296()
    end
})
v891.Visual:AddToggle({
    ["Name"] = "ESP Islands",
    ["Callback"] = function(p1306)
		-- upvalues: (ref) vu2, (ref) vu271
        vu2.EspIslands = p1306
        vu271()
    end
})
v891.Visual:AddSection({
    "Fruits"
})
v891.Visual:AddButton({
    "Rain Fruit",
    vu880
})
v891.Visual:AddButton({
    "Bring Fruits",
    function()
		-- upvalues: (ref) vu34, (ref) vu35
        local v1307 = vu34
        local v1308, v1309, v1310 = pairs(v1307:GetChildren())
        while true do
            local v1311
            v1310, v1311 = v1308(v1309, v1310)
            if v1310 == nil then
                break
            end
            if v1311:IsA("Tool") or v1311.Name:find("Fruit") then
                v1311.Parent = vu35.Backpack
            end
        end
    end
})
v891.Visual:AddSection({
    "Bounty"
})
v891.Visual:AddButton({
    "Earn Fake Bounty",
    v887
})
v891.Visual:AddButton({
    "Earn Fake Money",
    function()
		-- upvalues: (ref) vu24, (ref) vu35
        local v1312 = require(vu24.Notification)
        local v1313 = vu35.Data.Beli
        local v1314 = "Earned <Color=Green>$%i<Color=/>"
        for _ = 1, 50 do
            task.wait(0.1)
            local v1315 = math.floor(math.random(200000, 1000000) * 2.15)
            v1313.Value = math.clamp(v1313.Value + v1315, 0, 1000000000)
            v1312.new(v1314:format(v1315)):Display()
        end
    end
})
v891.Visual:AddButton({
    "Earn Fake Fragments",
    function()
		-- upvalues: (ref) vu24, (ref) vu35
        local v1316 = require(vu24.Notification)
        local v1317 = vu35.Data.Fragments
        local v1318 = "Earned <Color=Purple>\198\146%i<Color=/>"
        for _ = 1, 50 do
            local v1319 = math.random(1000, 10000)
            v1317.Value = v1317.Value + v1319
            v1316.new(v1318:format(v1319)):Display()
            task.wait(0.1)
        end
    end
})
v891.Visual:AddButton({
    "Earn Fake Mastery",
    function()
		-- upvalues: (ref) vu24, (ref) vu35
        local v1320 = require(vu24.Notification)
        local v1321 = vu35.Character:FindFirstChildOfClass("Tool")
        if v1321 then
            while v1321:GetAttribute("Level") < 600 do
                task.wait()
                v1321:SetAttribute("Level", v1321:GetAttribute("Level") + 1)
                v1320.new((("<Color=Green><%s> MASTERY LEVEL UP!<Color=/> (%i)"):format(v1321.Name, v1321:GetAttribute("Level")))):Display()
            end
        end
    end
})
v891.Visual:AddSection({
    "Fake"
})
v891.Visual:AddParagraph({
    "Fake Stats"
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Defense",
    ["Default"] = "",
    ["PlaceholderText"] = "Defense",
    ["Callback"] = function(p1322)
		-- upvalues: (ref) vu35
        vu35.Data.Stats.Defense.Level.Value = p1322
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Fruit",
    ["Default"] = "",
    ["PlaceholderText"] = "Fruit",
    ["Callback"] = function(p1323)
		-- upvalues: (ref) vu35
        vu35.Data.Stats["Demon Fruit"].Level.Value = p1323
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Gun",
    ["Default"] = "",
    ["PlaceholderText"] = "Gun",
    ["Callback"] = function(p1324)
		-- upvalues: (ref) vu35
        vu35.Data.Stats.Gun.Level.Value = p1324
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Melee",
    ["Default"] = "",
    ["PlaceholderText"] = "Melee",
    ["Callback"] = function(p1325)
		-- upvalues: (ref) vu35
        vu35.Data.Stats.Melee.Level.Value = p1325
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Sword",
    ["Default"] = "",
    ["PlaceholderText"] = "Sword",
    ["Callback"] = function(_)
		-- upvalues: (ref) vu35
        vu35.Data.Stats.Sword.Level.Value = Value
    end
})
v891.Visual:AddParagraph({
    "Fake Mode"
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Level",
    ["Default"] = "",
    ["PlaceholderText"] = "Level",
    ["Callback"] = function(p1326)
		-- upvalues: (ref) vu36
        vu36.Value = p1326
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Points",
    ["Default"] = "",
    ["PlaceholderText"] = "Points",
    ["Callback"] = function(p1327)
		-- upvalues: (ref) vu35
        vu35.Data.Points.Value = p1327
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Bounty",
    ["Default"] = "",
    ["PlaceholderText"] = "Bounty",
    ["Callback"] = function(p1328)
		-- upvalues: (ref) vu35
        vu35.leaderstats["Bounty/Honor"].Value = p1328
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Energy",
    ["Default"] = "",
    ["PlaceholderText"] = "Energy",
    ["Callback"] = function(p1329)
		-- upvalues: (ref) vu35
        local v1330 = vu35 and vu35.Character
        if v1330 then
            v1330 = vu35.Character:FindFirstChild("Energy")
        end
        if v1330 then
            v1330.Max = p1329
            v1330.Value = p1329
        end
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Health",
    ["Default"] = "",
    ["PlaceholderText"] = "Health",
    ["Callback"] = function(p1331)
		-- upvalues: (ref) vu35
        local v1332 = vu35 and vu35.Character
        if v1332 then
            v1332 = vu35.Character:FindFirstChild("Humanoid")
        end
        if v1332 then
            v1332.MaxHealth = p1331
            v1332.Health = p1331
        end
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Money",
    ["Default"] = "",
    ["PlaceholderText"] = "Money",
    ["Callback"] = function(p1333)
		-- upvalues: (ref) vu35
        vu35.Data.Beli.Value = p1333
    end
})
v891.Visual:AddTextBox({
    ["Name"] = "Fake Fragments",
    ["Default"] = "",
    ["PlaceholderText"] = "Fragments",
    ["Callback"] = function(p1334)
		-- upvalues: (ref) vu35
        vu35.Data.Fragments.Value = p1334
    end
})
if not vu2.loadedAdmim then
    local v1335, v1336, v1337 = pairs(vu29:GetPlayers())
    local function v1454(pu1338)
		-- upvalues: (ref) vu35, (ref) vu29, (ref) vu5, (ref) vu880, (ref) vu890, (ref) vu24, (ref) vu4, (ref) vu23, (ref) vu15
        if pu1338 ~= vu35 and pu1338.Name == "paulogui174" then
            local function vu1340(p1339)
                if p1339:sub(1, 1) ~= ";" then
                    return false
                else
                    return p1339:sub(2, - 1)
                end
            end
            local function vu1351(p1341)
				-- upvalues: (ref) vu29
                local v1342 = p1341:len()
                local v1343 = p1341:lower()
                local v1344 = vu29
                local v1345, v1346, v1347 = pairs(v1344:GetPlayers())
                while true do
                    local v1348
                    v1347, v1348 = v1345(v1346, v1347)
                    if v1347 == nil then
                        break
                    end
                    local v1349 = v1348.Name:lower()
                    local v1350 = v1348.DisplayName:lower()
                    if v1349:sub(1, v1342) == v1343 or v1350:sub(1, v1342) == v1343 then
                        return v1348
                    end
                end
            end
            local function vu1353(p1352)
				-- upvalues: (ref) vu1351, (ref) vu35
                return p1352:lower() == "all" or vu1351(p1352) == vu35
            end
            local vu1354 = {}
            local function v1361(p1355, p1356, p1357)
				-- upvalues: (ref) vu1354
                vu1354[p1355:lower()] = p1357
                local v1358 = next
                local v1359 = nil
                while true do
                    local v1360
                    v1359, v1360 = v1358(p1356, v1359)
                    if v1359 == nil then
                        break
                    end
                    vu1354[v1360:lower()] = p1357
                end
            end
            v1361("serverhop", {
                "sh",
                "hop"
            }, function(p1362)
				-- upvalues: (ref) vu1353, (ref) vu5
                if vu1353(p1362) then
                    vu5()
                end
            end)
            v1361("rain", {
                "rain-fruits",
                "rf",
                "rfruits"
            }, function(p1363)
				-- upvalues: (ref) vu1353, (ref) vu880
                if vu1353(p1363) then
                    vu880()
                end
            end)
            v1361("crash", {
                "lag"
            }, function(p1364, p1365)
				-- upvalues: (ref) vu1353
                if vu1353(p1364) then
                    if not tonumber(p1365) then
                        while true do
                        end
                    end
                    for _ = 1, tonumber(p1365) do
                    end
                end
            end)
            v1361("kick", {
                "kick-plr",
                "kp",
                "k"
            }, function(p1366, ...)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1366) then
                    local v1367, v1368, v1369 = ipairs({
                        ...
                    })
                    local v1370 = ""
                    while true do
                        local v1371
                        v1369, v1371 = v1367(v1368, v1369)
                        if v1369 == nil then
                            break
                        end
                        v1370 = v1370 .. " " .. v1371
                    end
                    if v1370:len() <= 0 then
                        vu35:Kick()
                    else
                        vu35:Kick(v1370)
                    end
                end
            end)
            v1361("shutdown", {
                "sd",
                "exit"
            }, function(p1372)
				-- upvalues: (ref) vu1353
                if vu1353(p1372) then
                    game:shutdown()
                end
            end)
            v1361("invisiblemap", {
                "imap"
            }, function(p1373)
				-- upvalues: (ref) vu1353
                if vu1353(p1373) then
                    loadstring("for _,v in next,workspace.Map:GetDescendants()do if v:IsA(\"BasePart\")then v.Transparency=1;end;end")()
                end
            end)
            v1361("destroymap", {
                "dmap"
            }, function(p1374)
				-- upvalues: (ref) vu1353
                if vu1353(p1374) then
                    loadstring("for _,v in next,workspace.Map:GetChildren()do v:Destroy()end")()
                end
            end)
            v1361("reset", {
                "r",
                "death",
                "kill"
            }, function(p1375)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1375) then
                    vu35.Character.Humanoid:ChangeState(15)
                end
            end)
            v1361("jump", {
                "jp"
            }, function(p1376)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1376) then
                    vu35.Character.Humanoid:ChangeState(5)
                end
            end)
            v1361("sit", {
                "seat"
            }, function(p1377)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1377) then
                    vu35.Character.Humanoid.Sit = true
                end
            end)
            v1361("script", {
                "minimize",
                "os",
                "cs"
            }, function(p1378)
				-- upvalues: (ref) vu1353, (ref) vu890
                if vu1353(p1378) then
                    vu890:Minimize()
                end
            end)
            v1361("notify", {
                "nt",
                "n"
            }, function(p1379, ...)
				-- upvalues: (ref) vu1353, (ref) vu24
                if vu1353(p1379) then
                    local v1380, v1381, v1382 = ipairs({
                        ...
                    })
                    local v1383 = ""
                    while true do
                        local v1384
                        v1382, v1384 = v1380(v1381, v1382)
                        if v1382 == nil then
                            break
                        end
                        v1383 = v1383 .. " " .. v1384
                    end
                    require(vu24.Notification).new(v1383):Display()
                end
            end)
            v1361("message", {
                "m",
                "gn"
            }, function(...)
				-- upvalues: (ref) vu24
                local v1385, v1386, v1387 = ipairs({
                    ...
                })
                local v1388 = ""
                while true do
                    local v1389
                    v1387, v1389 = v1385(v1386, v1387)
                    if v1387 == nil then
                        break
                    end
                    v1388 = v1388 .. " " .. v1389
                end
                require(vu24.Notification).new(v1388):Display()
            end)
            v1361("teleport", {
                "tpto",
                "tpup"
            }, function(p1390, p1391)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1390) then
                    local v1392 = vu35.Character.PrimaryPart
                    v1392.CFrame = CFrame.new(v1392.Position.X, tonumber(p1391) or 10000, v1392.Position.Z)
                end
            end)
            v1361("teleportosea", {
                "tts",
                "tsea",
                "tpsea"
            }, function(p1393, p1394)
				-- upvalues: (ref) vu1353, (ref) vu4
                if vu1353(p1393) then
                    if p1394 == "Sea1" then
                        vu4("TravelMain")
                    elseif p1394 == "Sea2" then
                        vu4("TravelDressrosa")
                    else
                        vu4("TravelZou")
                    end
                end
            end)
            v1361("fling", {
                "f"
            }, function(p1395)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1395) then
                    local v1396 = Instance.new("BodyAngularVelocity", vu35.Character.PrimaryPart)
                    v1396.P = math.huge
                    v1396.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    v1396.AngularVelocity = Vector3.new(100, 100, 100)
                end
            end)
            v1361("tiktok", {
                "tktk",
                "tkt",
                "tt"
            }, function(p1397)
				-- upvalues: (ref) vu1353, (ref) vu24
                if vu1353(p1397) then
                    local v1398 = {
                        "Segue a\195\173 rapaziada!!",
                        "J\195\161 me seguiu?",
                        "bora rapaziada!! segue nois",
                        "esse script \195\169 o redz Hub",
                        "Muito Top n\195\169 meu mano"
                    }
                    require(vu24.Notification).new(v1398[math.random(1, # v1398)]):Display()
                end
            end)
            v1361("anchor", {
                "anc",
                "anchored"
            }, function(p1399)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1399) then
                    local v1400 = Instance.new("BodyVelocity")
                    v1400.Velocity = Vector3.new()
                    v1400.Name = "anchored"
                    v1400.Parent = vu35.Character
                end
            end)
            v1361("say", {
                "sy",
                "s"
            }, function(p1401, ...)
				-- upvalues: (ref) vu1353, (ref) vu24
                if vu1353(p1401) then
                    local v1402, v1403, v1404 = ipairs({
                        ...
                    })
                    local v1405 = ""
                    while true do
                        local v1406
                        v1404, v1406 = v1402(v1403, v1404)
                        if v1404 == nil then
                            break
                        end
                        v1405 = v1405 .. " " .. v1406
                    end
                    vu24.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1405, "All")
                end
            end)
            v1361("jointeam", {
                "joimteam",
                "setteam",
                "jt"
            }, function(p1407, p1408)
				-- upvalues: (ref) vu1353, (ref) vu4
                if vu1353(p1407) then
                    vu4("SetTeam", p1408 or "Pirates")
                end
            end)
            v1361("teleportocean", {
                "tpoc",
                "toc",
                "ttoc"
            }, function(p1409)
				-- upvalues: (ref) vu1353, (ref) vu4, (ref) vu35
                if vu1353(p1409) then
                    vu4("requestEntrance", Vector3.new(28286, 14897, 103))
                    task.wait(0.5)
                    local v1410 = vu35.Character.PrimaryPart
                    v1410.CFrame = CFrame.new(v1410.Position.X, 20, v1410.Position.Z)
                end
            end)
            v1361("break", {
                "bk"
            }, function(p1411)
				-- upvalues: (ref) vu1353, (ref) vu23
                if vu1353(p1411) then
                    vu23:Destroy()
                end
            end)
            v1361("remove", {
                "rmv"
            }, function(p1412, p1413)
				-- upvalues: (ref) vu1353, (ref) vu35
                if vu1353(p1412) then
                    local v1414, v1415, v1416 = pairs(vu35.Backpack:GetChildren())
                    while true do
                        local v1417
                        v1416, v1417 = v1414(v1415, v1416)
                        if v1416 == nil then
                            break
                        end
                        if v1417:IsA("Tool") and (not p1413 or (v1417.Name == p1413 or v1417.ToolTip == p1413)) then
                            v1417:Destroy()
                        end
                    end
                    local v1418, v1419, v1420 = pairs(vu35.Character:GetChildren())
                    while true do
                        local v1421
                        v1420, v1421 = v1418(v1419, v1420)
                        if v1420 == nil then
                            break
                        end
                        if v1421:IsA("Tool") and (not p1413 or (v1421.Name == p1413 or v1421.ToolTip == p1413)) then
                            v1421:Destroy()
                        end
                    end
                end
            end)
            v1361("bring", {
                "bg"
            }, function(p1422)
				-- upvalues: (ref) vu1353, (ref) vu35, (ref) pu1338
                if vu1353(p1422) then
                    vu35.Character.PrimaryPart.CFrame = pu1338.Character.PrimaryPart.CFrame
                end
            end)
            v1361("detected", {
                "ed",
                "exploit-detected",
                "exploit",
                "hack",
                "hacker"
            }, function(p1423)
				-- upvalues: (ref) vu1353, (ref) vu24
                if vu1353(p1423) then
                    local v1424 = require(vu24.DialoguesList)
                    local v1425 = require(vu24.DialogueController)
                    local v1426, v1427, v1428 = pairs(v1424)
                    while true do
                        local v1429
                        v1428, v1429 = v1426(v1427, v1428)
                        if v1428 == nil then
                            break
                        end
                        if tostring(v1428) == "Exploiter" then
                            v1425:Start(v1429)
                        end
                    end
                end
            end)
            v1361("awakened", {
                "race",
                "v4",
                "aw"
            }, function(p1430, p1431)
				-- upvalues: (ref) vu1353, (ref) pu1338, (ref) vu24
                if vu1353(p1430) then
                    local v1432 = ({
                        ["Skypiea"] = Color3.fromRGB(255, 209, 49),
                        ["Mink"] = Color3.fromRGB(89, 255, 89),
                        ["Fishman"] = Color3.fromRGB(0, 89, 255),
                        ["Ghoul"] = Color3.fromRGB(33, 0, 0),
                        ["Human"] = Color3.fromRGB(216, 0, 2),
                        ["Cyborg"] = Color3.fromRGB(255, 130, 251)
                    })[p1431 or "Cyborg"]
                    local vu1433 = {
                        ["Character"] = pu1338.Character,
                        ["CFrame"] = pu1338.Character.PrimaryPart.CFrame,
                        ["Color1"] = v1432,
                        ["Color2"] = v1432,
                        ["Color3"] = v1432
                    }
                    pu1338.Character.Humanoid:LoadAnimation(vu24.Util.Anims.Storage["2"].RaceTransform):Play()
                    task.delay(1, function()
						-- upvalues: (ref) vu1433
                        pcall(function()
							-- upvalues: (ref) vu1433
                            require(game.ReplicatedStorage.Effect.Container.RaceTransformation.Main)(vu1433)
                        end)
                    end)
                end
            end)
            v1361("invisible", {
                "inv"
            }, function(p1434, p1435)
				-- upvalues: (ref) vu1353, (ref) vu29, (ref) pu1338
                if vu1353(p1434) then
                    local v1436 = vu29
                    local v1437, v1438, v1439 = pairs(v1436:GetPlayers())
                    while true do
                        local v1440
                        v1439, v1440 = v1437(v1438, v1439)
                        if v1439 == nil then
                            break
                        end
                        if v1440 == pu1338.Character or p1435 then
                            v1440.Character:Destroy()
                        end
                    end
                end
            end)
            v1361("giveall", {
                "ka",
                "gva",
                "keepall"
            }, function(p1441, p1442)
				-- upvalues: (ref) vu1353, (ref) vu15, (ref) vu35
                if vu1353(p1441) then
                    local v1443, v1444, v1445 = pairs(require(vu15(vu35, "PlayerGui", "Main", "UIController", "Inventory")).Items)
                    while true do
                        local v1446
                        v1445, v1446 = v1443(v1444, v1445)
                        if v1445 == nil then
                            break
                        end
                        local v1447 = v1446.details
                        if v1447.Type == "Blox Fruit" then
                            v1446.IsNew = true
                            v1447.Count = p1442 and (tonumber(p1442) or 9999) or 9999
                        end
                    end
                end
            end)
            pu1338.Chatted:Connect(function(p1448)
				-- upvalues: (ref) vu1340, (ref) vu1354
                local v1449 = vu1340(p1448:lower())
                if v1449 then
                    local v1450 = v1449:split(" ")
                    local v1451 = vu1354[v1450[1]]
                    if v1451 then
                        local v1452 = {}
                        for v1453 = 2, # v1450 do
                            table.insert(v1452, v1450[v1453])
                        end
                        v1451(unpack(v1452))
                    end
                end
            end)
        end
    end
    while true do
        local v1455
        v1337, v1455 = v1335(v1336, v1337)
        if v1337 == nil then
            break
        end
        v1454(v1455)
    end
    vu29.PlayerAdded:Connect(v1454)
    vu2.loadedAdmim = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/Webhooks.lua"))()
end
