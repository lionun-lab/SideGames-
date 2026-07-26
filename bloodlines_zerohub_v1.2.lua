task.spawn(function()
    local lp = game:GetService("Players").LocalPlayer
    while not lp.Character do
        pcall(function() game:GetService("ReplicatedStorage").requests.character.spawn:FireServer() end)
        task.wait(0.2)
    end
end)

task.spawn(function()
    local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    while true do
        task.wait(0.5)
        for _, n in ipairs({"Main Menu", "BlackScreenGui", "Logo_Loader"}) do
            local g = gui:FindFirstChild(n)
            if g then pcall(function() g:Destroy() end) end
        end
    end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/toeerolo-z/ethossuiterewrite/refs/heads/main/ethossuite.lua"))()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local HS = game:GetService("HttpService")
local TP = game:GetService("TeleportService")
local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera

if not LP.Character then LP.CharacterAdded:Wait() end

local DataFunction = game:GetService("ReplicatedStorage").Events.DataFunction
local DataEvent = game:GetService("ReplicatedStorage").Events.DataEvent

local function notify(msg, dur)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Zero Hub", Text = msg, Duration = dur or 3
        })
    end)
end

task.spawn(function()
    while true do
        task.wait(0.1)
        pcall(function() LP.GameplayPaused = false end)
    end
end)

local Window = Library:CreateWindow({
    Title = "ZERO HUB",
    Version = "v1.2.0",
})

local CatMain    = Window:AddCategory("MAIN")
local CatCombat  = Window:AddCategory("COMBAT")
local CatFarm    = Window:AddCategory("FARM")
local CatVisuals = Window:AddCategory("VISUALS")
local CatMisc    = Window:AddCategory("MISC")

local MoveTab    = CatMain:AddTab("Movement")
local CharTab    = CatMain:AddTab("Character")
local ExploitTab = CatMain:AddTab("Exploits")

local AimTab     = CatCombat:AddTab("Aimbot")
local CombatTab  = CatCombat:AddTab("Combat")

local FarmTab    = CatFarm:AddTab("Auto Farm")
local BossTab    = CatFarm:AddTab("Boss Farm")
local TailedTab  = CatFarm:AddTab("Tailed Beast")
local FruitTab   = CatFarm:AddTab("Fruit Farm")
local FarmCfgTab = CatFarm:AddTab("Farm Settings")

local PlrEspTab  = CatVisuals:AddTab("Player ESP")
local MobEspTab  = CatVisuals:AddTab("Mob ESP")
local FrtEspTab  = CatVisuals:AddTab("Fruit ESP")
local WorldTab   = CatVisuals:AddTab("World")
local EspCfgTab  = CatVisuals:AddTab("ESP Settings")

local ServerTab  = CatMisc:AddTab("Server")
local TeleTab    = CatMisc:AddTab("Teleport")
local SurvTab    = CatMisc:AddTab("Survival")
local UpgrTab    = CatMisc:AddTab("Upgrades")
local MiscTab    = CatMisc:AddTab("Misc")


local MoveBox     = MoveTab:AddGroupbox("Movement")
local TpBox       = MoveTab:AddGroupbox("Teleport")
local CharBox     = CharTab:AddGroupbox("Character")
local CharActBox  = CharTab:AddGroupbox("Actions")
local AimBox      = AimTab:AddGroupbox("Aimbot")
local AimCfgBox   = AimTab:AddGroupbox("Settings")
local CombatBox   = CombatTab:AddGroupbox("Combat")
local HitboxBox   = CombatTab:AddGroupbox("Hitbox")
local FarmBox     = FarmTab:AddGroupbox("Auto Farm")
local BossBox     = BossTab:AddGroupbox("Boss Farm")
local TailedBox   = TailedTab:AddGroupbox("Tailed Beast")
local FruitBox    = FruitTab:AddGroupbox("Fruit Farm")
local FarmSetBox  = FarmCfgTab:AddGroupbox("Position")
local RerollBox   = FarmCfgTab:AddGroupbox("Reroll")
local PanicBox    = FarmCfgTab:AddGroupbox("Panic")
local SafeBox     = FarmCfgTab:AddGroupbox("Safespot")
local SwBox       = FarmCfgTab:AddGroupbox("Switchpowder")
local MastBox     = FarmCfgTab:AddGroupbox("Mastery")
local PlrEspBox   = PlrEspTab:AddGroupbox("Player ESP")
local MobEspBox   = MobEspTab:AddGroupbox("Mob ESP")
local MobTrcBox   = MobEspTab:AddGroupbox("Tracer")
local FrtEspBox   = FrtEspTab:AddGroupbox("Fruit ESP")
local CamBox      = WorldTab:AddGroupbox("Camera")
local LightBox    = WorldTab:AddGroupbox("Lighting")
local RenderBox   = WorldTab:AddGroupbox("Rendering")
local EspSetBox   = EspCfgTab:AddGroupbox("ESP Settings")
local ServBox     = ServerTab:AddGroupbox("Server")
local JoinBox     = ServerTab:AddGroupbox("Join Server")
local SecBox      = ServerTab:AddGroupbox("Security")
local NetBox      = ServerTab:AddGroupbox("Network")
local PerfBox     = ServerTab:AddGroupbox("Performance")
local LocBox      = TeleTab:AddGroupbox("Locations")
local CpBox       = TeleTab:AddGroupbox("Chakra Points")
local HazBox      = SurvTab:AddGroupbox("Hazard")
local ProtBox     = SurvTab:AddGroupbox("Protection")
local AilBox      = SurvTab:AddGroupbox("Ailments")
local GripBox     = SurvTab:AddGroupbox("Infinite Grips")
local PickBox     = SurvTab:AddGroupbox("Pickup Aura")
local UpgBox      = UpgrTab:AddGroupbox("Upgrades")
local SellBox     = UpgrTab:AddGroupbox("Sell")
local VilBox      = UpgrTab:AddGroupbox("Village")
local MiscVfxBox  = MiscTab:AddGroupbox("Visuals")
local MiscWBox    = MiscTab:AddGroupbox("Weather")
local MiscClothBox= MiscTab:AddGroupbox("Clothing")
local MiscShopBox = MiscTab:AddGroupbox("Shops")
local MiscChatBox = MiscTab:AddGroupbox("Auto Chat")
local MiscNotBox  = MiscTab:AddGroupbox("Notifications")
local MiscStatBox = MiscTab:AddGroupbox("Display")
local CoolBox     = ExploitTab:AddGroupbox("Cooldowns")
local ChakraBox   = ExploitTab:AddGroupbox("Chakra")
local AwareBox    = ExploitTab:AddGroupbox("Awareness")
local ExplMoveBox = ExploitTab:AddGroupbox("Movement")

local speed = 100
local infJumpH = 50
local flySpeed = 100
local flyFrame = nil
local aimbotFOV = 45
local aimbotSens = 1
local aimbotX = 0
local aimbotY = 0
local aimbotActive = false
local aimbotEnabled = false
local aimbotMode = "Toggle"
local aimbotMethod = "Camera"
local teamCheck = false
local visibleOnly = false
local targetPlayers = true
local freecamSens = 5
local freecamSpeed = 1
local camFOV = 70
local brightness = 2
local autoChatMsg = "gg"
local autoChatDelay = 30
local hitboxSize = 5
local hitboxTrans = 0.9
local autoRejoin = false
local farmOffX = 0
local farmOffY = 0
local farmOffZ = 6.5

local function tweenTo(cf)
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.Velocity = Vector3.zero
    hrp.AssemblyLinearVelocity = Vector3.zero
    local dist = (hrp.Position - cf.Position).Magnitude
    if dist <= 10 then hrp.CFrame = cf return end
    local start = hrp.Position
    local dur = dist / math.max(Library.Options.TweenSpeed and Library.Options.TweenSpeed.Value or 100, 1)
    local t0 = tick()
    while tick() - t0 < dur do
        hrp.CFrame = CFrame.new(start:Lerp(cf.Position, (tick() - t0) / dur))
        hrp.Velocity = Vector3.zero
        task.wait()
    end
    hrp.CFrame = cf
end

local function serverHop(minP)
    minP = tonumber(minP) or 0
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local cursor, found = nil, nil
    repeat
        local ok, res = pcall(function() return HS:JSONDecode(game:HttpGet(url .. (cursor and "&cursor=" .. cursor or ""))) end)
        if not ok or not res then break end
        for _, s in ipairs(res.data or {}) do
            if s.playing >= minP and s.playing < s.maxPlayers and s.id ~= game.JobId then
                found = s
                break
            end
        end
        cursor = res.nextPageCursor
    until found or not cursor
    if found then TP:TeleportToPlaceInstance(game.PlaceId, found.id, LP)
    else notify("No server found", 4) end
end

local function farmPosition(mobPos, root, mode, offX, offY, offZ)
    mode = mode or "Above"
    if mode == "Above" then return Vector3.new(mobPos.X + offX, mobPos.Y + offZ + offY, mobPos.Z)
    elseif mode == "Below" then return Vector3.new(mobPos.X + offX, mobPos.Y - offZ + offY, mobPos.Z)
    elseif mode == "In Front" then return mobPos + root.CFrame.LookVector * offZ + Vector3.new(offX, offY, 0)
    elseif mode == "Behind" then return mobPos - root.CFrame.LookVector * offZ + Vector3.new(offX, offY, 0)
    end
    return Vector3.new(mobPos.X + offX, mobPos.Y + offZ + offY, mobPos.Z)
end

local function getFarmMode()
    local v = Library.Options.FarmMode and Library.Options.FarmMode.Value
    return (type(v) == "table" and next(v) or v) or "Above"
end

local function dropVal(opt)
    if not opt then return nil end
    local v = opt.Value
    return type(v) == "table" and next(v) or v
end

do
    TpBox:AddInput("Coordinates", { Tooltip = "Enter X, Y, Z coordinates", Default = "", Numeric = false, Finished = false, Text = "Coordinates", Placeholder = "X, Y, Z" })
    TpBox:AddSlider("TweenSpeed", { Tooltip = "Speed of the teleport tween", Text = "Tween Speed", Default = 100, Min = 10, Max = 2000, Decimals = 0 })
    TpBox:AddButton({ Tooltip = "Smoothly move to the coordinates", Text = "Tween To", Func = function()
        local s = Library.Options.Coordinates.Value
        local x, y, z = s:match("([%-%d%.]+)%s*,%s*([%-%d%.]+)%s*,%s*([%-%d%.]+)")
        if x then tweenTo(CFrame.new(tonumber(x), tonumber(y), tonumber(z))) else notify("Use format: X, Y, Z") end
    end })
    TpBox:AddButton({ Tooltip = "Copy your current position to clipboard", Text = "Copy Position", Func = function()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then setclipboard(tostring(hrp.Position)); notify("Copied!") end
    end })
end

do
    local speedConn
    local SpeedToggle = MoveBox:AddToggle("Speedhack", { Tooltip = "Increases your movement speed", Text = "Speed", Default = false,
        Callback = function(p)
            if p then
                RunService:BindToRenderStep("ZHSpeed", Enum.RenderPriority.Input.Value, function(dt)
                    local c = LP.Character
                    if not c then return end
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    local hum = c:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 and hum.MoveDirection.Magnitude > 0 then
                        hrp.CFrame = hrp.CFrame + hum.MoveDirection * speed * dt
                    end
                end)
            else RunService:UnbindFromRenderStep("ZHSpeed") end
        end,
    })
    SpeedToggle:AddKeybind({ Default = Enum.KeyCode.N, Mode = "Toggle" })
    MoveBox:AddSlider("SpeedVal", { Tooltip = "How fast you move", Text = "Speed", Default = 100, Min = 0, Max = 5000, Decimals = 0, Callback = function(v) speed = v end })
    MoveBox:AddDivider()

    local ijConn
    local IJToggle = MoveBox:AddToggle("InfiniteJump", { Tooltip = "Jump unlimited times in mid-air", Text = "Inf Jump", Default = false,
        Callback = function(p)
            if ijConn then ijConn:Disconnect(); ijConn = nil end
            if p then
                ijConn = UIS.JumpRequest:Connect(function()
                    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.Velocity = Vector3.new(hrp.Velocity.X, infJumpH, hrp.Velocity.Z) end
                end)
            end
        end,
    })
    IJToggle:AddKeybind({ Default = Enum.KeyCode.H, Mode = "Toggle" })
    MoveBox:AddSlider("InfJumpHeight", { Tooltip = "Height of each jump", Text = "Jump Height", Default = 50, Min = 0, Max = 1000, Decimals = 0, Callback = function(v) infJumpH = v end })
    MoveBox:AddDivider()

    local noclipConn
    local NoclipToggle = MoveBox:AddToggle("Noclip", { Tooltip = "Walk through walls and objects", Text = "Noclip", Default = false,
        Callback = function(p)
            if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
            if p then
                local cached = {}
                local lastChar = nil
                noclipConn = RunService.Heartbeat:Connect(function()
                    local c = LP.Character
                    if c ~= lastChar then
                        cached = {}
                        lastChar = c
                        if c then for _, d in ipairs(c:GetDescendants()) do if d:IsA("BasePart") then cached[#cached + 1] = d end end end
                    end
                    for _, part in ipairs(cached) do if part.Parent then part.CanCollide = false end end
                end)
            end
        end,
    })
    NoclipToggle:AddKeybind({ Default = Enum.KeyCode.T, Mode = "Toggle" })
    MoveBox:AddDivider()

    local FlyToggle = MoveBox:AddToggle("Fly", { Tooltip = "Fly freely around the map", Text = "Fly", Default = false,
        Callback = function(p)
            if p then
                flyFrame = nil
                RunService:BindToRenderStep("ZHFly", Enum.RenderPriority.Input.Value, function(dt)
                    local c = LP.Character
                    if not c then return end
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    if not flyFrame then flyFrame = hrp.CFrame end
                    local cf = Cam.CFrame
                    local mv = Vector3.zero
                    local fwd = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit
                    local rgt = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z).Unit
                    if UIS:IsKeyDown(Enum.KeyCode.W) then mv = mv + fwd end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then mv = mv - fwd end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then mv = mv - rgt end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then mv = mv + rgt end
                    if UIS:IsKeyDown(Enum.KeyCode.Space) then mv = mv + Vector3.yAxis end
                    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then mv = mv - Vector3.yAxis end
                    if mv.Magnitude > 0 then flyFrame = flyFrame + mv.Unit * flySpeed * dt end
                    local fwd3 = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
                    if fwd3.Magnitude > 0 then flyFrame = CFrame.new(flyFrame.Position, flyFrame.Position + fwd3.Unit) end
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.CFrame = flyFrame
                end)
            else RunService:UnbindFromRenderStep("ZHFly"); flyFrame = nil end
        end,
    })
    FlyToggle:AddKeybind({ Default = Enum.KeyCode.Y, Mode = "Toggle" })
    MoveBox:AddSlider("FlySpeed", { Tooltip = "How fast you fly", Text = "Fly Speed", Default = 100, Min = 1, Max = 2000, Decimals = 0, Callback = function(v) flySpeed = v end })
end

do
    local noAnimsThread
    CharBox:AddToggle("NoAnims", { Tooltip = "Stops all character animations", Text = "No Anims", Default = false,
        Callback = function(p)
            if noAnimsThread then task.cancel(noAnimsThread); noAnimsThread = nil end
            if not p then return end
            local c = LP.Character
            if not c then return end
            local hum = c:FindFirstChildOfClass("Humanoid")
            local anim = hum and hum:FindFirstChildOfClass("Animator")
            if not anim then return end
            local blank = Instance.new("Animation")
            blank.AnimationId = "rbxassetid://10921272275"
            noAnimsThread = task.spawn(function()
                while p and anim and anim.Parent do
                    for _, t in pairs(anim:GetPlayingAnimationTracks()) do
                        if t.Animation.AnimationId ~= blank.AnimationId then pcall(function() t:Stop(); t:Destroy() end) end
                    end
                    if #anim:GetPlayingAnimationTracks() == 0 then
                        pcall(function() local t = anim:LoadAnimation(blank); t.Priority = Enum.AnimationPriority.Core; t:AdjustSpeed(0); t:Play() end)
                    end
                    task.wait(0.1)
                end
            end)
        end,
    })

    CharBox:AddToggle("AntiAFK", { Tooltip = "Prevent auto-kick for being idle", Text = "Anti AFK", Default = false,
        Callback = function(p)
            if p then LP.Idled:Connect(function()
                VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                task.wait()
                VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end) end
        end,
    })

    CharActBox:AddButton({ Tooltip = "Set your health to zero", Text = "Kill Yourself", Func = function()
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end })
end

do
    local function getTargets()
        local r = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and targetPlayers then
                if teamCheck and LP.Team and plr.Team == LP.Team then continue end
                table.insert(r, plr.Character)
            end
        end
        return r
    end

    local function getAimPart(char)
        local v = Library.Options.AimPart and Library.Options.AimPart.Value or "Head"
        if v == "Head" then return char:FindFirstChild("Head") end
        if v == "Torso" then return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") end
        local parts = {}
        for _, n in ipairs({"Head", "HumanoidRootPart"}) do local p = char:FindFirstChild(n) if p then table.insert(parts, p) end end
        return parts[math.random(1, #parts)]
    end

    local function isVisible(part)
        if not (part and part.Parent) then return false end
        local c = LP.Character
        if not c then return false end
        local ray = Ray.new(Cam.CFrame.Position, (part.Position - Cam.CFrame.Position).Unit * 1000)
        local hit = workspace:FindPartOnRayWithIgnoreList(ray, {c, Cam})
        return hit and hit:IsDescendantOf(part.Parent)
    end

    local function getBestTarget()
        local mouse = UIS:GetMouseLocation()
        local best, bestDist = nil, math.huge
        for _, char in ipairs(getTargets()) do
            local part = getAimPart(char)
            if not (part and part:IsA("BasePart")) then continue end
            local sp, onScreen = Cam:WorldToViewportPoint(part.Position)
            if not onScreen then continue end
            local angle = math.deg(math.acos(math.clamp(Cam.CFrame.LookVector:Dot((part.Position - Cam.CFrame.Position).Unit), -1, 1)))
            if angle > aimbotFOV / 2 then continue end
            if visibleOnly and not isVisible(part) then continue end
            local d = (mouse - Vector2.new(sp.X, sp.Y)).Magnitude
            if d < bestDist then bestDist = d; best = part end
        end
        return best
    end

    local fovCircle
    local function getFOVScale() return math.tan(math.rad(1)) * (Cam.ViewportSize.Y / 2) end
    local function updateFOVCircle()
        if fovCircle then
            fovCircle.Position = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
            fovCircle.Radius = aimbotFOV * getFOVScale()
        end
    end
    Cam:GetPropertyChangedSignal("ViewportSize"):Connect(updateFOVCircle)
    Cam:GetPropertyChangedSignal("FieldOfView"):Connect(updateFOVCircle)

    AimBox:AddDropdown("AimbotMode", { Tooltip = "Toggle, hold key, or always active", Text = "Mode", Default = "Toggle", Values = {"Toggle", "Hold", "Always"}, Callback = function(v) aimbotMode = v; if v == "Always" then aimbotActive = true end end })
    AimBox:AddDropdown("AimbotMethod", { Tooltip = "Camera lock or mouse movement", Text = "Method", Default = "Camera", Values = {"Camera", "mousemoverel"}, Callback = function(v) aimbotMethod = v end })
    AimBox:AddDropdown("AimPart", { Tooltip = "Which body part to aim at", Text = "Aim Part", Default = "Head", Values = {"Head", "Torso", "Random"} })

    local aimbotConn
    local aimbotAccum = Vector2.zero
    local aimbotHoldConns = {}

    AimBox:AddToggle("Aimbot", { Tooltip = "Automatically aims at nearby players", Text = "Aimbot", Default = false,
        Callback = function(p)
            aimbotEnabled = p
            if not p then aimbotActive = false end
            if p and aimbotMode == "Always" then aimbotActive = true end
            for _, c in pairs(aimbotHoldConns) do c:Disconnect() end
            aimbotHoldConns = {}
            if p then
                local function checkKey(inp, down)
                    local kt = Library.Options.AimbotKeybind and Library.Options.AimbotKeybind.Value
                    if not kt then return end
                    if kt == Enum.KeyCode.Unknown then return end
                    if inp.KeyCode == kt then
                        if aimbotMode == "Hold" then aimbotActive = down
                        elseif aimbotMode == "Toggle" and down then aimbotActive = not aimbotActive end
                    end
                end
                table.insert(aimbotHoldConns, UIS.InputBegan:Connect(function(inp, gpe) if not gpe then checkKey(inp, true) end end))
                table.insert(aimbotHoldConns, UIS.InputEnded:Connect(function(inp) checkKey(inp, false) end))
            end
            if aimbotConn then aimbotConn:Disconnect(); aimbotConn = nil end
            if p then
                aimbotAccum = Vector2.zero
                aimbotConn = RunService.RenderStepped:Connect(function()
                    if not aimbotActive then return end
                    local target = getBestTarget()
                    if not target then return end
                    local pos = target.Position + Vector3.new(aimbotX, aimbotY, 0)
                    if aimbotMethod == "Camera" then
                        local lv = Cam.CFrame.LookVector:Lerp((pos - Cam.CFrame.Position).Unit, math.clamp(aimbotSens * 0.1, 0.01, 1))
                        Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lv)
                    else
                        local sp = Cam:WorldToViewportPoint(pos)
                        local mouse = UIS:GetMouseLocation()
                        aimbotAccum = aimbotAccum + (Vector2.new(sp.X, sp.Y) - mouse) * aimbotSens
                        local clamped = Vector2.new(math.clamp(aimbotAccum.X, -10, 10), math.clamp(aimbotAccum.Y, -10, 10))
                        mousemoverel(clamped.X, clamped.Y)
                        aimbotAccum = aimbotAccum - clamped
                    end
                end)
            end
        end,
    })

    AimBox:AddDivider()
    AimCfgBox:AddToggle("TargetPlayers", { Tooltip = "Include players as targets", Text = "Target Players", Default = true, Callback = function(v) targetPlayers = v end })
    AimCfgBox:AddToggle("VisibleOnly", { Tooltip = "Only aim at visible targets", Text = "Visible Only", Default = false, Callback = function(v) visibleOnly = v end })
    AimCfgBox:AddToggle("TeamCheck", { Tooltip = "Skip teammates when aiming", Text = "Team Check", Default = false, Callback = function(v) teamCheck = v end })
    AimCfgBox:AddSlider("AimbotSens", { Tooltip = "How quickly the aim snaps", Text = "Sensitivity", Default = 1, Min = 0.1, Max = 5, Decimals = 2, Callback = function(v) aimbotSens = v end })
    AimCfgBox:AddSlider("AimbotXOffset", { Tooltip = "Horizontal aim offset", Text = "X Offset", Default = 0, Min = -300, Max = 300, Decimals = 0, Callback = function(v) aimbotX = v end })
    AimCfgBox:AddSlider("AimbotYOffset", { Tooltip = "Vertical aim offset", Text = "Y Offset", Default = 0, Min = -300, Max = 300, Decimals = 0, Callback = function(v) aimbotY = v end })
    AimCfgBox:AddSlider("AimbotFOV", { Tooltip = "Field of view cone for targeting", Text = "Aimbot FOV", Default = 45, Min = 1, Max = 120, Decimals = 0,
        Callback = function(v) aimbotFOV = v; if fovCircle then fovCircle.Radius = v * getFOVScale() end end })
    AimCfgBox:AddToggle("ShowFOV", { Tooltip = "Draw the FOV circle on screen", Text = "Show FOV",
        Callback = function(p)
            if p then
                if not fovCircle then fovCircle = Drawing.new("Circle"); fovCircle.Thickness = 1; fovCircle.NumSides = 100; fovCircle.Filled = false; fovCircle.Color = Color3.fromRGB(255, 255, 255) end
                fovCircle.Radius = aimbotFOV * getFOVScale()
                fovCircle.Position = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
                fovCircle.Visible = true
            elseif fovCircle then fovCircle.Visible = false end
        end,
    })
end

do
    local gripConn
    CombatBox:AddToggle("AutoGrip", { Tooltip = "Automatically grips nearby enemies", Text = "Auto Grip", Default = false,
        Callback = function(p)
            if gripConn then gripConn:Disconnect(); gripConn = nil end
            if not p then return end
            local gt = 0
            gripConn = RunService.Heartbeat:Connect(function(dt)
                gt = gt + dt
                if gt < 0.5 then return end
                gt = 0
                pcall(function() DataEvent:FireServer("Grip") end)
            end)
        end,
    })

    local killAuraConn
    CombatBox:AddToggle("KillAura", { Tooltip = "Hits all nearby enemies automatically", Text = "Kill Aura", Default = false,
        Callback = function(p)
            if killAuraConn then killAuraConn:Disconnect(); killAuraConn = nil end
            if not p then return end
            killAuraConn = RunService.Heartbeat:Connect(function()
                pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end)
            end)
        end,
    })

    local autoCritConn
    CombatBox:AddToggle("AutoHeavy", { Tooltip = "Spam heavy attacks automatically", Text = "Auto Heavy", Default = false,
        Callback = function(p)
            if autoCritConn then autoCritConn:Disconnect(); autoCritConn = nil end
            if not p then return end
            autoCritConn = RunService.Heartbeat:Connect(function()
                pcall(function() DataEvent:FireServer("CheckMeleeHit", "Ground", "HeavyAttack") end)
            end)
        end,
    })

    local plrFarmConn
    CombatBox:AddDropdown("PlrFarmTarget", { Tooltip = "Select a player to farm", Text = "Target Player", Default = "-- None --", Values = {"-- None --"} })
    task.spawn(function()
        while true do
            task.wait(3)
            local names = {"-- None --"}
            for _, p in ipairs(Players:GetPlayers()) do if p ~= LP then table.insert(names, p.Name) end end
            if Library.Options.PlrFarmTarget then Library.Options.PlrFarmTarget:SetValues(names) end
        end
    end)
    CombatBox:AddToggle("PlayerFarm", { Tooltip = "Teleport to and attack a player", Text = "Player Farm", Default = false,
        Callback = function(p)
            if plrFarmConn then plrFarmConn:Disconnect(); plrFarmConn = nil end
            if not p then pcall(function() if sethiddenproperty then local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end end); return end
            local at = 0
            plrFarmConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local sel = dropVal(Library.Options.PlrFarmTarget)
                if not sel or sel == "-- None --" then return end
                local target = Players:FindFirstChild(sel)
                if not target or not target.Character then return end
                local root = target.Character:FindFirstChild("HumanoidRootPart")
                local hum = target.Character:FindFirstChildOfClass("Humanoid")
                if not root or not hum or hum.Health <= 0 then return end
                local fpos = farmPosition(root.Position, root, getFarmMode(), farmOffX, farmOffY, farmOffZ)
                hrp.CFrame = CFrame.lookAt(fpos, root.Position)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", root) end; root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end)
                at = at + dt
                if at >= 0.1 then at = 0; pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end) end
            end)
        end,
    })

    local hitboxConn
    HitboxBox:AddToggle("HitboxExpander", { Tooltip = "Enlarges enemy hitboxes", Text = "Hitbox Expander", Default = false,
        Callback = function(p)
            if hitboxConn then hitboxConn:Disconnect(); hitboxConn = nil end
            if p then
                hitboxConn = RunService.Heartbeat:Connect(function()
                    local sz = Library.Options.HitboxSize and Library.Options.HitboxSize.Value or 5
                    local tr = Library.Options.HitboxTrans and Library.Options.HitboxTrans.Value or 0.9
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LP and plr.Character then
                            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then hrp.Size = Vector3.one * sz; hrp.Transparency = tr; hrp.CanCollide = false; hrp.LocalTransparencyModifier = 0 end
                        end
                    end
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
                            local hrp = obj:FindFirstChild("HumanoidRootPart")
                            if hrp then hrp.Size = Vector3.one * sz; hrp.Transparency = tr; hrp.CanCollide = false end
                        end
                    end
                end)
            else
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LP and plr.Character then local hrp = plr.Character:FindFirstChild("HumanoidRootPart") if hrp then hrp.Size = Vector3.new(2, 2, 1); hrp.Transparency = 1 end end
                end
            end
        end,
    })
    HitboxBox:AddSlider("HitboxSize", { Tooltip = "Size of expanded hitboxes", Text = "Hitbox Size", Default = 5, Min = 0, Max = 20, Decimals = 0 })
    HitboxBox:AddSlider("HitboxTrans", { Tooltip = "Visibility of expanded hitboxes", Text = "Transparency", Default = 0.9, Min = 0, Max = 1, Decimals = 1 })
end

do
    local mobCache = {}
    local function rebuildMobCache()
        mobCache = {}
        for _, obj in ipairs(workspace:GetChildren()) do
            if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
                local hum = obj:FindFirstChildOfClass("Humanoid")
                local hrp = obj:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 0 then table.insert(mobCache, obj) end
            end
        end
    end
    workspace.ChildAdded:Connect(function(obj)
        if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
            local hum = obj:FindFirstChildOfClass("Humanoid")
            local hrp = obj:FindFirstChild("HumanoidRootPart")
            if hum and hrp then
                table.insert(mobCache, obj)
                obj.AncestryChanged:Connect(function(_, p)
                    if not p then for i, v in ipairs(mobCache) do if v == obj then table.remove(mobCache, i); break end end end
                end)
            end
        end
    end)
    rebuildMobCache()

    local function getMobs()
        local t = {}
        for _, obj in ipairs(mobCache) do
            local hum = obj:FindFirstChildOfClass("Humanoid")
            if obj.Parent and hum and hum.Health > 0 then table.insert(t, obj) else end
        end
        return t
    end

    local farmConn
    local farmTargetList = {"-- None --"}
    local farmTargetMap = {}

    local function scanFarmTargets()
        farmTargetList = {"-- None --", ">> Nearest Mob <<"}
        farmTargetMap = {}
        for _, obj in ipairs(getMobs()) do
            local hum = obj:FindFirstChildOfClass("Humanoid")
            local root = obj:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and root then
                local label = obj.Name
                local n = 0
                local base = label
                while farmTargetMap[label] do n = n + 1; label = base .. " (" .. n .. ")" end
                table.insert(farmTargetList, label)
                farmTargetMap[label] = root
            end
        end
        if Library.Options.FarmTarget then Library.Options.FarmTarget:SetValues(farmTargetList); Library.Options.FarmTarget:SetValue("-- None --") end
    end

    FarmBox:AddButton({ Tooltip = "Rescan for available mobs", Text = "Refresh Mobs", Func = scanFarmTargets })
    FarmBox:AddDropdown("FarmTarget", { Tooltip = "Select a mob to farm", Text = "Target", Values = farmTargetList, Default = "-- None --" })
    FarmBox:AddToggle("AutoFarm", { Tooltip = "Teleport to and attack selected mob", Text = "Auto Farm", Default = false,
        Callback = function(p)
            if farmConn then farmConn:Disconnect(); farmConn = nil end
            if not p then pcall(function() if sethiddenproperty then local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end end); return end
            local at = 0
            farmConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local sel = dropVal(Library.Options.FarmTarget)
                if not sel or sel == "-- None --" then return end
                local root
                if sel == ">> Nearest Mob <<" then
                    local best, bestDist = nil, math.huge
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
                            local h = obj:FindFirstChildOfClass("Humanoid")
                            local r = obj:FindFirstChild("HumanoidRootPart")
                            if h and h.Health > 0 and r then
                                local d = (r.Position - hrp.Position).Magnitude
                                if d < bestDist then best = r; bestDist = d end
                            end
                        end
                    end
                    root = best
                else
                    root = farmTargetMap[sel]
                    if not root or not root.Parent then farmTargetMap[sel] = nil; return end
                end
                if not root then return end
                local hum = root.Parent:FindFirstChildOfClass("Humanoid")
                if not hum or hum.Health <= 0 then return end
                local fpos = farmPosition(root.Position, root, getFarmMode(), farmOffX, farmOffY, farmOffZ)
                hrp.CFrame = CFrame.lookAt(fpos, root.Position)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", root) end; root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end)
                at = at + dt
                if at >= 0.1 then at = 0; pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end) end
            end)
        end,
    })

    local bossNames = {"Wooden Golem", "Chakra Knight", "Hyuga Boss", "Barbarit The Rose", "Tairock", "Lavarossa", "Manda", "Haku Boss"}
    local bossConn, allBossThread, allBossActive, allBossIdx

    BossBox:AddDropdown("BossTarget", { Tooltip = "Select which boss to farm", Text = "Boss", Values = bossNames, Default = "Wooden Golem" })
    BossBox:AddToggle("AllBossFarm", { Tooltip = "Cycle through all bosses automatically", Text = "Farm All Bosses", Default = false,
        Callback = function(p)
            allBossActive = p
            if allBossThread then task.cancel(allBossThread); allBossThread = nil end
            if not p then if Library.Options.BossFarm then Library.Options.BossFarm:SetValue(false) end; return end
            allBossIdx = 1
            allBossThread = task.spawn(function()
                while allBossActive do
                    local bossName = bossNames[allBossIdx]
                    if not bossName then allBossIdx = 1; continue end
                    if Library.Options.BossTarget then Library.Options.BossTarget:SetValue(bossName) end
                    if Library.Options.BossFarm and not Library.Options.BossFarm.Value then Library.Options.BossFarm:SetValue(true) end
                    local waited = 0
                    local maxWait = Library.Options.AllBossTimeout and Library.Options.AllBossTimeout.Value or 120
                    repeat
                        task.wait(1); waited = waited + 1
                        local boss = workspace:FindFirstChild(bossName)
                        local hum = boss and boss:FindFirstChildOfClass("Humanoid")
                        if not boss or (hum and hum.Health <= 0) then break end
                    until waited >= maxWait or not allBossActive
                    if Library.Options.BossFarm then Library.Options.BossFarm:SetValue(false) end
                    task.wait(1)
                    allBossIdx = allBossIdx + 1
                    if allBossIdx > #bossNames then allBossIdx = 1 end
                end
            end)
        end,
    })
    BossBox:AddSlider("AllBossTimeout", { Tooltip = "Max seconds to spend on each boss", Text = "Per-Boss Timeout (s)", Default = 120, Min = 30, Max = 300, Decimals = 0 })

    local bossHopConn
    BossBox:AddToggle("BossAutoHop", { Tooltip = "Hop servers if boss is dead", Text = "Server Hop if No Boss", Default = false,
        Callback = function(p)
            if bossHopConn then bossHopConn:Disconnect(); bossHopConn = nil end
            if not p then return end
            local ht = 0
            bossHopConn = RunService.Heartbeat:Connect(function(dt)
                ht = ht + dt; if ht < 2 then return end; ht = 0
                local sel = dropVal(Library.Options.BossTarget)
                if not sel then return end
                local boss = workspace:FindFirstChild(sel)
                local hum = boss and boss:FindFirstChildOfClass("Humanoid")
                if not boss or (hum and hum.Health <= 0) then
                    local delay = Library.Options.BossHopDelay and Library.Options.BossHopDelay.Value or 10
                    bossHopConn:Disconnect(); bossHopConn = nil
                    task.wait(delay)
                    task.spawn(function()
                        local tried = {}
                        while true do
                            local servers = game:GetService("ReplicatedStorage"):FindFirstChild("Servers")
                            if servers then
                                for _, sv in ipairs(servers:GetChildren()) do
                                    local parts = string.split(sv.Value, " ")
                                    local jobId = parts[1]
                                    if jobId and jobId ~= game.JobId and not sv:FindFirstChild("Current") and not tried[jobId] then
                                        tried[jobId] = true
                                        pcall(function() DataEvent:FireServer("ServerTeleport", jobId, 14) end)
                                        task.wait(5)
                                    end
                                end
                            end
                            serverHop(0); task.wait(8); tried = {}
                        end
                    end)
                end
            end)
        end,
    })
    BossBox:AddSlider("BossHopDelay", { Tooltip = "Wait before hopping servers", Text = "Hop Delay (s)", Default = 10, Min = 3, Max = 60, Decimals = 0 })

    BossBox:AddToggle("BossFarm", { Tooltip = "Teleport to and attack selected boss", Text = "Boss Farm", Default = false,
        Callback = function(p)
            if bossConn then bossConn:Disconnect(); bossConn = nil end
            if not p then pcall(function() if sethiddenproperty then local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end end); return end
            local at = 0
            bossConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local sel = dropVal(Library.Options.BossTarget)
                if not sel then return end
                local boss = workspace:FindFirstChild(sel)
                if not boss then pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end); return end
                local hum = boss:FindFirstChildOfClass("Humanoid")
                local root = boss:FindFirstChild("HumanoidRootPart")
                if not hum or hum.Health <= 0 or not root then pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end); return end
                local fpos = farmPosition(root.Position, root, getFarmMode(), farmOffX, farmOffY, farmOffZ)
                hrp.CFrame = CFrame.lookAt(fpos, root.Position)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", root) end; root.AssemblyLinearVelocity = Vector3.zero; root.AssemblyAngularVelocity = Vector3.zero end)
                at = at + dt
                if at >= 0.1 then
                    at = 0
                    if hum.Health <= 1 then pcall(function() DataEvent:FireServer("Grip") end)
                    else pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end) end
                end
            end)
        end,
    })

    local tailedNames = {"Isobu", "Shukaku", "Matatabi"}
    local tailedConn, tailedHopConn

    local function getNearestTailed()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        local best, bestDist = nil, math.huge
        for _, name in ipairs(tailedNames) do
            local tb = workspace:FindFirstChild(name)
            local hum = tb and tb:FindFirstChildOfClass("Humanoid")
            local tbHRP = tb and tb:FindFirstChild("HumanoidRootPart")
            if tb and hum and tbHRP and hum.Health > 0 then
                local d = (tbHRP.Position - hrp.Position).Magnitude
                if d < bestDist then bestDist = d; best = tb end
            end
        end
        return best
    end

    TailedBox:AddDropdown("TailedTarget", { Tooltip = "Select a tailed beast to farm", Text = "Tailed Beast", Values = {"Any (Closest)", "Isobu", "Shukaku", "Matatabi"}, Default = "Any (Closest)" })
    TailedBox:AddToggle("TailedBeastFarm", { Tooltip = "Teleport to and attack tailed beast", Text = "Tailed Beast Farm", Default = false,
        Callback = function(p)
            if tailedConn then tailedConn:Disconnect(); tailedConn = nil end
            if not p then return end
            local at = 0
            tailedConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local sel = dropVal(Library.Options.TailedTarget)
                local tb
                if not sel or sel == "Any (Closest)" then tb = getNearestTailed()
                else
                    tb = workspace:FindFirstChild(sel)
                    local hum = tb and tb:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health <= 0 then tb = nil end
                end
                if not tb then pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", nil) end end); return end
                local tbHRP = tb:FindFirstChild("HumanoidRootPart")
                if not tbHRP then return end
                local offZ = Library.Options.FarmOffsetZ and Library.Options.FarmOffsetZ.Value or 6.5
                local fpos = farmPosition(tbHRP.Position, tbHRP, getFarmMode(), farmOffX, farmOffY, offZ)
                hrp.CFrame = CFrame.lookAt(fpos, tbHRP.Position)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", tbHRP) end; tbHRP.AssemblyLinearVelocity = Vector3.zero; tbHRP.AssemblyAngularVelocity = Vector3.zero end)
                at = at + dt
                if at >= 0.1 then
                    at = 0
                    local bHum = tb:FindFirstChildOfClass("Humanoid")
                    if bHum and bHum.Health <= 1 then pcall(function() DataEvent:FireServer("Grip") end)
                    else pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end) end
                end
            end)
        end,
    })
    TailedBox:AddToggle("TailedBeastHop", { Tooltip = "Hop servers if no beast found", Text = "Server Hop if No Beast", Default = false,
        Callback = function(p)
            if tailedHopConn then tailedHopConn:Disconnect(); tailedHopConn = nil end
            if not p then return end
            local ht = 0
            tailedHopConn = RunService.Heartbeat:Connect(function(dt)
                ht = ht + dt; if ht < 5 then return end; ht = 0
                local sel = dropVal(Library.Options.TailedTarget)
                local found = false
                if not sel or sel == "Any (Closest)" then found = getNearestTailed() ~= nil
                else local tb = workspace:FindFirstChild(sel); local hum = tb and tb:FindFirstChildOfClass("Humanoid"); found = tb ~= nil and hum ~= nil and hum.Health > 0 end
                if not found then
                    local delay = Library.Options.BossHopDelay and Library.Options.BossHopDelay.Value or 10
                    tailedHopConn:Disconnect(); tailedHopConn = nil; task.wait(delay)
                    task.spawn(function()
                        local tried = {}
                        while true do
                            local servers = game:GetService("ReplicatedStorage"):FindFirstChild("Servers")
                            if servers then for _, sv in ipairs(servers:GetChildren()) do
                                local parts = string.split(sv.Value, " "); local jobId = parts[1]
                                if jobId and jobId ~= game.JobId and not sv:FindFirstChild("Current") and not tried[jobId] then
                                    tried[jobId] = true; pcall(function() DataEvent:FireServer("ServerTeleport", jobId, 14) end); task.wait(5)
                                end
                            end end
                            serverHop(0); task.wait(8); tried = {}
                        end
                    end)
                end
            end)
        end,
    })

    local fruitThread
    local fruitSpeed = 1.5
    local fruitDropList = {"-- None --"}

    local function refreshFruits()
        fruitDropList = {"-- None --"}
        local seen = {}
        for _, obj in ipairs(workspace:GetChildren()) do
            if obj:IsA("Model") and obj.Name:sub(1, 4) == "Tree" then
                local ft = obj:FindFirstChild("FruitType")
                if ft and not seen[ft.Value] then seen[ft.Value] = true; table.insert(fruitDropList, ft.Value) end
            end
        end
        table.sort(fruitDropList, function(a, b) return a < b end)
        if Library.Options.FruitType then Library.Options.FruitType:SetValues(fruitDropList) end
    end

    FruitBox:AddButton({ Tooltip = "Rescan for available fruit trees", Text = "Refresh Fruits", Func = refreshFruits })
    FruitBox:AddDropdown("FruitType", { Tooltip = "Select fruit types to collect", Text = "Fruit", Values = fruitDropList, Default = {}, Multi = true })
    FruitBox:AddSlider("FruitSpeed", { Tooltip = "Delay between fruit pickups", Text = "TP Interval (s)", Default = 1.5, Min = 0.5, Max = 10, Decimals = 1, Callback = function(v) fruitSpeed = v end })
    FruitBox:AddToggle("FruitFarm", { Tooltip = "Auto collect fruits from trees", Text = "Fruit Farm", Default = false,
        Callback = function(p)
            if fruitThread then task.cancel(fruitThread); fruitThread = nil end
            if not p then return end
            fruitThread = task.spawn(function()
                while true do
                    local val = Library.Options.FruitType and Library.Options.FruitType.Value
                    local selectedFruits = {}
                    if type(val) == "table" then for fn, is in pairs(val) do if is then table.insert(selectedFruits, fn) end end
                    elseif type(val) == "string" and val ~= "-- None --" then table.insert(selectedFruits, val) end
                    if #selectedFruits == 0 then task.wait(1) continue end
                    for _, tree in ipairs(workspace:GetChildren()) do
                        if not (tree:IsA("Model") and tree.Name:sub(1, 4) == "Tree") then continue end
                        local ft = tree:FindFirstChild("FruitType")
                        if not ft then continue end
                        local matched = false
                        for _, sf in ipairs(selectedFruits) do if ft.Value == sf then matched = true; break end end
                        if not matched then continue end
                        local spawns = tree:FindFirstChild("FruitSpawns")
                        if not spawns then continue end
                        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        if not hrp then break end
                        hrp.CFrame = CFrame.new(spawns:GetPivot().Position + Vector3.new(0, 3, 0))
                        local fruit, waited = nil, 0
                        repeat task.wait(0.1); waited = waited + 0.1; fruit = workspace:FindFirstChild(ft.Value) until fruit or waited >= 5
                        if fruit and fruit:IsA("BasePart") then
                            hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = CFrame.new(fruit.Position + Vector3.new(0, 3, 0))
                                local idVal = fruit:FindFirstChild("ID")
                                if idVal then pcall(function() DataEvent:FireServer("PickUp", idVal.Value) end)
                                else pcall(function() DataEvent:FireServer("PickUp") end) end
                            end
                        end
                        task.wait(fruitSpeed)
                    end
                    task.wait(0.1)
                end
            end)
        end,
    })

    FarmSetBox:AddDropdown("FarmMode", { Tooltip = "Position relative to the target", Text = "Mode", Values = {"Above", "Below", "In Front", "Behind"}, Default = "Above" })
    FarmSetBox:AddSlider("FarmOffsetX", { Tooltip = "Horizontal farm position offset", Text = "X Offset", Default = 0, Min = -50, Max = 50, Decimals = 1, Callback = function(v) farmOffX = v end })
    FarmSetBox:AddSlider("FarmOffsetY", { Tooltip = "Vertical farm position offset", Text = "Y Offset", Default = 0, Min = -50, Max = 50, Decimals = 1, Callback = function(v) farmOffY = v end })
    FarmSetBox:AddSlider("FarmOffsetZ", { Tooltip = "Distance from target", Text = "Z Offset", Default = 6.5, Min = 0, Max = 50, Decimals = 1, Callback = function(v) farmOffZ = v end })

    local rerollThread, rerollActive
    RerollBox:AddInput("RerollTargetTraits", { Tooltip = "Comma-separated trait names", Text = "Target Traits", Default = "", Placeholder = "trait1, trait2" })
    RerollBox:AddDropdown("RerollStopAt", { Tooltip = "How many traits to match before stopping", Text = "Stop If", Values = {"1 Trait", "2 Traits", "3 Traits", "Any Match"}, Default = "1 Trait" })
    RerollBox:AddToggle("AutoRerollTraits", { Tooltip = "Reroll traits until target found", Text = "Auto Reroll Traits", Default = false,
        Callback = function(p)
            rerollActive = p
            if rerollThread then task.cancel(rerollThread); rerollThread = nil end
            if not p then return end
            rerollThread = task.spawn(function()
                while rerollActive do
                    pcall(function() DataEvent:FireServer("TraitReshuffle") end)
                    task.wait(0.5)
                    local targetStr = Library.Options.RerollTargetTraits and Library.Options.RerollTargetTraits.Value or ""
                    if targetStr ~= "" then
                        local targets = {}
                        for t in targetStr:gmatch("[^,]+") do table.insert(targets, t:match("^%s*(.-)%s*$"):lower()) end
                        local stopVal = dropVal(Library.Options.RerollStopAt) or "1 Trait"
                        local stopCount = tonumber(stopVal:match("%d+")) or 1
                        local matchCount = 0
                        pcall(function()
                            local settings = game:GetService("ReplicatedStorage"):FindFirstChild("Settings")
                            local myS = settings and settings:FindFirstChild(LP.Name)
                            if myS then for _, child in ipairs(myS:GetChildren()) do local v = tostring(child.Value):lower(); for _, tgt in ipairs(targets) do if v:find(tgt, 1, true) then matchCount = matchCount + 1; break end end end end
                        end)
                        if matchCount >= stopCount then rerollActive = false; if Library.Options.AutoRerollTraits then Library.Options.AutoRerollTraits:SetValue(false) end; return end
                    end
                    task.wait(0.3)
                end
            end)
        end,
    })

    local safespotPos = Vector3.new(-3613.2, 422.7, -2603.6)
    local panicConn
    PanicBox:AddToggle("PanicMode", { Tooltip = "Teleport to safety when HP is low", Text = "Enable Panic", Default = false,
        Callback = function(p)
            if panicConn then panicConn:Disconnect(); panicConn = nil end
            if not p then return end
            panicConn = RunService.Heartbeat:Connect(function()
                local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not (hum and hrp) then return end
                local threshold = Library.Options.PanicHP and Library.Options.PanicHP.Value or 30
                if hum.Health <= threshold then
                    if Library.Options.BossFarm and Library.Options.BossFarm.Value then Library.Options.BossFarm:SetValue(false) end
                    if Library.Options.AutoFarm and Library.Options.AutoFarm.Value then Library.Options.AutoFarm:SetValue(false) end
                    hrp.CFrame = CFrame.new(safespotPos)
                end
            end)
        end,
    })
    PanicBox:AddSlider("PanicHP", { Tooltip = "HP threshold to trigger panic", Text = "Panic HP", Default = 30, Min = 1, Max = 500, Decimals = 0 })

    SafeBox:AddToggle("UseCustomSafespot", { Tooltip = "Use your own safespot position", Text = "Use Custom Safespot", Default = false })
    SafeBox:AddInput("SafespotCoords", { Tooltip = "X, Y, Z of custom safespot", Text = "Safespot Coords", Default = "-3613.2, 422.7, -2603.6", Placeholder = "-3613.2, 422.7, -2603.6" })
    SafeBox:AddButton({ Tooltip = "Save current coords as safespot", Text = "Set Custom Safespot", Func = function()
        local val = Library.Options.SafespotCoords and Library.Options.SafespotCoords.Value or ""
        local x, y, z = val:match("([%-%.%d]+),%s*([%-%.%d]+),%s*([%-%.%d]+)")
        if x and y and z then safespotPos = Vector3.new(tonumber(x), tonumber(y), tonumber(z)) end
    end })
    SafeBox:AddButton({ Tooltip = "Teleport to the saved safespot", Text = "Teleport to Safespot", Func = function()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame = CFrame.new(safespotPos) end
    end })
    SafeBox:AddButton({ Tooltip = "Copy position and set as safespot", Text = "Copy Current Position", Func = function()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local p = hrp.Position
            local str = string.format("%.1f, %.1f, %.1f", p.X, p.Y, p.Z)
            if setclipboard then setclipboard(str) end
            if Library.Options.SafespotCoords then Library.Options.SafespotCoords:SetValue(str) end
        end
    end })

    local swFarmConn
    SwBox:AddToggle("SwitchpowderFarm", { Tooltip = "Farm the EventDesertoid for switchpowder", Text = "Switchpowder Farm", Default = false,
        Callback = function(p)
            if swFarmConn then swFarmConn:Disconnect(); swFarmConn = nil end
            if not p then return end
            local swPos = Vector3.new(1914.5, -402.0, 300.4)
            swFarmConn = RunService.Heartbeat:Connect(function()
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local target = workspace:FindFirstChild("EventDesertoid")
                if target then
                    local troot = target:FindFirstChild("HumanoidRootPart")
                    local hum = target:FindFirstChildOfClass("Humanoid")
                    if troot and hum and hum.Health > 0 then
                        hrp.CFrame = CFrame.lookAt(Vector3.new(troot.Position.X, troot.Position.Y - 7, troot.Position.Z), troot.Position)
                        hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero
                        pcall(function() if sethiddenproperty then sethiddenproperty(hrp, "PhysicsRepRootPart", troot) end end)
                        pcall(function() DataEvent:FireServer("CheckMeleeHit", nil, "NormalAttack", false) end)
                        return
                    end
                end
                hrp.CFrame = CFrame.new(swPos); hrp.AssemblyLinearVelocity = Vector3.zero
            end)
        end,
    })

    local masteryThread, masteryActive
    MastBox:AddInput("MasterySkillName", { Tooltip = "Name of the skill to spam", Text = "Skill Name", Default = "Rasengan", Placeholder = "" })
    MastBox:AddToggle("AutoFarmMastery", { Tooltip = "Spam a skill to level mastery", Text = "Auto Farm Mastery", Default = false,
        Callback = function(p)
            masteryActive = p
            if masteryThread then task.cancel(masteryThread); masteryThread = nil end
            if not p then return end
            masteryThread = task.spawn(function()
                while masteryActive do
                    local skill = Library.Options.MasterySkillName and Library.Options.MasterySkillName.Value
                    if skill and skill ~= "" then pcall(function() DataEvent:FireServer("startSkill", skill) end) end
                    task.wait(0.1)
                end
            end)
        end,
    })
end

do
    local espCfg = {
        mobColor = Color3.fromRGB(255, 255, 255), plrColor = Color3.fromRGB(0, 162, 255),
        hlEnabled = false, hlTrans = 0.5,
        tracerColor = Color3.new(1, 1, 1), tracerThick = 2,
        dist = 1000, fontSize = 14,
        mobs = {}, plrs = {},
        mobEnabled = false, plrEnabled = false,
        mobTracers = {}, mobTracerConns = {},
        plrTracerEnabled = false,
    }

    local function removeESP(t, model)
        local d = t[model]
        if not d then return end
        for _, key in ipairs({"text", "box", "hpBar", "hpOut", "hl", "anc", "died", "rname"}) do
            local v = d[key]
            if v then pcall(function()
                if key == "rname" then RunService:UnbindFromRenderStep(v)
                elseif key == "anc" or key == "died" then v:Disconnect()
                elseif key == "hl" then v:Destroy()
                else v:Remove() end
            end) end
        end
        t[model] = nil
    end

    local function addESP(t, model, color)
        if not (model and model:IsA("Model") and not t[model]) then return end
        if t == espCfg.mobs and Players:GetPlayerFromCharacter(model) then return end
        local hum = model:FindFirstChildOfClass("Humanoid")
        local hrp = model:FindFirstChild("HumanoidRootPart")
        local head = model:FindFirstChild("Head")
        if not (hum and hrp and head) then return end
        local text = Drawing.new("Text"); text.Visible = false; text.Center = true; text.Outline = true; text.Color = color; text.Size = 14
        local box = Drawing.new("Square"); box.Filled = false; box.Visible = false; box.Color = color; box.Thickness = 1
        local hpO = Drawing.new("Square"); hpO.Filled = false; hpO.Visible = false; hpO.Color = Color3.new(1, 1, 1); hpO.Thickness = 1
        local hpB = Drawing.new("Square"); hpB.Filled = true; hpB.Visible = false
        local hl = Instance.new("Highlight"); hl.Parent = model; hl.FillColor = color; hl.OutlineColor = color
        hl.FillTransparency = espCfg.hlTrans; hl.OutlineTransparency = espCfg.hlTrans; hl.Enabled = espCfg.hlEnabled
        local rname = "ZH_ESP_" .. model:GetDebugId()
        RunService:BindToRenderStep(rname, Enum.RenderPriority.Camera.Value + 1, function()
            if not (model and model.Parent and hum and hrp and head) then removeESP(t, model); return end
            local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end
            local dist = (hrp.Position - myHRP.Position).Magnitude
            local sp, vis = Cam:WorldToViewportPoint(hrp.Position)
            local _, headVis = Cam:WorldToViewportPoint(head.Position)
            if dist > espCfg.dist or not (vis and headVis) then
                text.Visible = false; box.Visible = false; hpB.Visible = false; hpO.Visible = false; hl.Enabled = false; return
            end
            local scale = 1 / math.max(sp.Z * 0.1, 0.001)
            local sw, sh = 250 * scale, 500 * scale
            local bw = 50 * scale
            local hp = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
            local hpClr = Color3.fromRGB(255 * (1 - hp), 255 * hp, 0)
            local bx, by = sp.X - sw / 2, sp.Y - sh / 2
            box.Position = Vector2.new(bx, by); box.Size = Vector2.new(sw, sh); box.Color = color; box.Visible = true
            hpO.Position = Vector2.new(bx - bw - 2, by - 1); hpO.Size = Vector2.new(bw + 2, sh + 2); hpO.Visible = true
            hpB.Position = Vector2.new(bx - bw - 1, by + sh * (1 - hp)); hpB.Size = Vector2.new(bw, sh * hp); hpB.Color = hpClr; hpB.Visible = true
            local plr = Players:GetPlayerFromCharacter(model)
            local extra = ""
            if plr then
                pcall(function()
                    local rs2 = game:GetService("ReplicatedStorage")
                    local s2 = rs2:FindFirstChild("Settings")
                    local ps2 = s2 and s2:FindFirstChild(plr.Name)
                    local clan = ps2 and ps2:FindFirstChild("Clan")
                    if clan and clan.Value ~= "" then extra = "[" .. clan.Value .. "] " end
                end)
                pcall(function() local tool = model:FindFirstChildOfClass("Tool"); if tool then extra = extra .. "[" .. tool.Name .. "] " end end)
            end
            text.Text = string.format("%s%s | %.0f/%.0f HP | %.0fm", extra, model.Name, hum.Health, hum.MaxHealth, dist)
            text.Position = Vector2.new(sp.X, by - espCfg.fontSize - 2); text.Size = espCfg.fontSize; text.Color = color; text.Visible = true
            hl.Enabled = espCfg.hlEnabled; hl.FillColor = color; hl.OutlineColor = color
        end)
        t[model] = { text = text, box = box, hpBar = hpB, hpOut = hpO, hl = hl, rname = rname,
            anc = model.AncestryChanged:Connect(function(_, p) if not p then removeESP(t, model) end end),
            died = hum.Died:Connect(function() removeESP(t, model) end) }
    end

    MobEspBox:AddToggle("MobESP", { Tooltip = "Show mob names, HP, and boxes", Text = "Mob ESP", Default = false,
        Callback = function(p)
            espCfg.mobEnabled = p
            if p then
                task.spawn(function()
                    while espCfg.mobEnabled do
                        for _, folder in ipairs({"Live", "Living"}) do
                            local f = workspace:FindFirstChild(folder)
                            if f then for _, v in ipairs(f:GetChildren()) do
                                if v:IsA("Model") and not Players:GetPlayerFromCharacter(v) and not espCfg.mobs[v] and v.Name ~= "Server" then addESP(espCfg.mobs, v, espCfg.mobColor) end
                            end end
                        end
                        for _, v in ipairs(workspace:GetChildren()) do
                            if v:IsA("Model") and not Players:GetPlayerFromCharacter(v) and not espCfg.mobs[v] and v.Name ~= "Server" then
                                local hum = v:FindFirstChildOfClass("Humanoid")
                                if hum and hum.Health > 0 then addESP(espCfg.mobs, v, espCfg.mobColor) end
                            end
                        end
                        task.wait(0.5)
                    end
                end)
            else for m in pairs(espCfg.mobs) do removeESP(espCfg.mobs, m) end end
        end,
    })
    MobEspBox:AddColorPicker("MobESPColor", { Tooltip = "Color of mob ESP drawings", Text = "Mob Color", Default = espCfg.mobColor, Callback = function(c) espCfg.mobColor = c; for _, d in pairs(espCfg.mobs) do if d.text then d.text.Color = c end; if d.box then d.box.Color = c end; if d.hl then d.hl.FillColor = c; d.hl.OutlineColor = c end end end })
    MobEspBox:AddToggle("MobHighlight", { Tooltip = "Glow effect on mobs", Text = "Highlight", Default = false,
        Callback = function(p) espCfg.hlEnabled = p; for _, d in pairs(espCfg.mobs) do if d.hl then d.hl.Enabled = p end end end })
    MobEspBox:AddSlider("MobHLTrans", { Tooltip = "Highlight transparency level", Text = "Highlight Trans", Default = 0.5, Min = 0, Max = 1, Decimals = 2,
        Callback = function(v) espCfg.hlTrans = v; for _, d in pairs(espCfg.mobs) do if d.hl then d.hl.FillTransparency = v; d.hl.OutlineTransparency = v end end end })

    local function removeMobTracer(k)
        if espCfg.mobTracers[k] then pcall(function() espCfg.mobTracers[k]:Remove() end); espCfg.mobTracers[k] = nil end
        if espCfg.mobTracerConns[k] then espCfg.mobTracerConns[k]:Disconnect(); espCfg.mobTracerConns[k] = nil end
    end

    local tracerMobEnabled = false
    MobTrcBox:AddToggle("MobTracer", { Tooltip = "Draw lines to nearby mobs", Text = "Mob Tracer", Default = false,
        Callback = function(p)
            tracerMobEnabled = p
            if not p then for k in pairs(espCfg.mobTracers) do removeMobTracer(k) end
            else
                for model in pairs(espCfg.mobs) do
                    if not espCfg.mobTracers[model] then
                        local line = Drawing.new("Line"); espCfg.mobTracers[model] = line
                        espCfg.mobTracerConns[model] = RunService.RenderStepped:Connect(function()
                            if not (model and model.Parent and tracerMobEnabled) then removeMobTracer(model); return end
                            local hrp = model:FindFirstChild("HumanoidRootPart")
                            if not hrp then return end
                            local sp, vis = Cam:WorldToViewportPoint(hrp.Position)
                            if vis then line.From = Vector2.new(sp.X, sp.Y); line.To = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y); line.Color = espCfg.tracerColor; line.Thickness = espCfg.tracerThick; line.Visible = true
                            else line.Visible = false end
                        end)
                    end
                end
            end
        end,
    })
    MobTrcBox:AddColorPicker("MobTracerColor", { Tooltip = "Color of mob tracer lines", Text = "Tracer Color", Default = Color3.new(1, 1, 1), Callback = function(c) espCfg.tracerColor = c end })
    MobTrcBox:AddSlider("MobTracerThick", { Tooltip = "Thickness of tracer lines", Text = "Tracer Thickness", Default = 2, Min = 1, Max = 5, Decimals = 0, Callback = function(v) espCfg.tracerThick = v end })

    PlrEspBox:AddToggle("PlrESP", { Tooltip = "Show player names, HP, and boxes", Text = "Player ESP", Default = false,
        Callback = function(p)
            espCfg.plrEnabled = p
            if p then
                task.spawn(function()
                    while espCfg.plrEnabled do
                        for _, plr in ipairs(Players:GetPlayers()) do
                            if plr ~= LP and plr.Character and not espCfg.plrs[plr.Character] then addESP(espCfg.plrs, plr.Character, espCfg.plrColor) end
                        end
                        task.wait(0.3)
                    end
                end)
            else for c in pairs(espCfg.plrs) do removeESP(espCfg.plrs, c) end end
        end,
    })
    PlrEspBox:AddColorPicker("PlrESPColor", { Tooltip = "Color of player ESP drawings", Text = "Player Color", Default = espCfg.plrColor, Callback = function(c) espCfg.plrColor = c; for _, d in pairs(espCfg.plrs) do if d.text then d.text.Color = c end; if d.box then d.box.Color = c end; if d.hl then d.hl.FillColor = c; d.hl.OutlineColor = c end end end })
    PlrEspBox:AddToggle("PlrHighlight", { Tooltip = "Glow effect on players", Text = "Highlight", Default = false,
        Callback = function(p) for _, d in pairs(espCfg.plrs) do if d.hl then d.hl.Enabled = p and espCfg.plrEnabled end end end })
    PlrEspBox:AddSlider("PlrHLTrans", { Tooltip = "Highlight transparency level", Text = "Highlight Trans", Default = 0.5, Min = 0, Max = 1, Decimals = 2,
        Callback = function(v) for _, d in pairs(espCfg.plrs) do if d.hl then d.hl.FillTransparency = v; d.hl.OutlineTransparency = v end end end })
    PlrEspBox:AddToggle("PlrTracer", { Tooltip = "Draw lines to nearby players", Text = "Tracer", Default = false, Callback = function(v) espCfg.plrTracerEnabled = v end })

    local fruitESPConns, fruitESPHighlights, fruitESPLabels = {}, {}, {}
    local fruitESPColor = Color3.fromRGB(255, 200, 0)
    local fruitESPEnabled = false
    local fruitNames = {"Apple", "Alluring Apple", "Banana", "Orange", "Chakra Fruit", "Black Flame Gem", "Flame Gem", "Ice Gem", "Life Up Fruit", "Mango", "Gold Bracelet", "Gold Enclosed Ring", "Gold Necklace"}

    local function clearFruitESP()
        for _, h in pairs(fruitESPHighlights) do pcall(function() h:Destroy() end) end
        for _, l in pairs(fruitESPLabels) do pcall(function() l:Remove() end) end
        fruitESPHighlights = {}; fruitESPLabels = {}
        for _, conn in pairs(fruitESPConns) do pcall(function() conn:Disconnect() end) end
        fruitESPConns = {}
    end

    local function isFruit(name) for _, n in ipairs(fruitNames) do if n == name then return true end end return false end

    local function addFruitESP(part)
        if fruitESPHighlights[part] then return end
        local hl = Instance.new("Highlight"); hl.FillColor = fruitESPColor; hl.OutlineColor = fruitESPColor
        hl.FillTransparency = 0.5; hl.OutlineTransparency = 0; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Parent = part
        fruitESPHighlights[part] = hl
        local lbl = Drawing.new("Text"); lbl.Color = fruitESPColor; lbl.Size = 14; lbl.Center = true; lbl.Outline = true; lbl.Visible = false
        fruitESPLabels[part] = lbl
        local rname = "ZH_FRUIT_" .. part:GetDebugId()
        fruitESPConns[rname] = RunService:BindToRenderStep(rname, Enum.RenderPriority.Camera.Value + 1, function()
            if not fruitESPEnabled or not part.Parent then
                RunService:UnbindFromRenderStep(rname); pcall(function() hl:Destroy() end); pcall(function() lbl:Remove() end)
                fruitESPHighlights[part] = nil; fruitESPLabels[part] = nil; fruitESPConns[rname] = nil; return
            end
            local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then lbl.Visible = false; return end
            local dist = (part.Position - hrp.Position).Magnitude
            local sp, vis = Cam:WorldToViewportPoint(part.Position)
            if vis and dist <= espCfg.dist then lbl.Text = part.Name .. " [" .. math.floor(dist) .. "m]"; lbl.Position = Vector2.new(sp.X, sp.Y); lbl.Visible = true
            else lbl.Visible = false end
        end)
        fruitESPConns["anc_" .. part:GetDebugId()] = part.AncestryChanged:Connect(function(_, p)
            if not p then RunService:UnbindFromRenderStep(rname); pcall(function() hl:Destroy() end); pcall(function() lbl:Remove() end); fruitESPHighlights[part] = nil; fruitESPLabels[part] = nil end
        end)
    end

    FrtEspBox:AddToggle("FruitESP", { Tooltip = "Highlight fruits on the map", Text = "Fruit ESP", Default = false,
        Callback = function(p)
            fruitESPEnabled = p
            if not p then clearFruitESP(); return end
            for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and isFruit(obj.Name) then addFruitESP(obj) end end
            fruitESPConns["added"] = workspace.DescendantAdded:Connect(function(obj)
                if fruitESPEnabled and obj:IsA("BasePart") and isFruit(obj.Name) then task.wait(); addFruitESP(obj) end
            end)
        end,
    })
    FrtEspBox:AddColorPicker("FruitESPColor", { Tooltip = "Color of fruit highlights", Text = "Fruit Color", Default = Color3.fromRGB(255, 200, 0), Callback = function(c)
        fruitESPColor = c; for _, hl in pairs(fruitESPHighlights) do hl.FillColor = c; hl.OutlineColor = c end; for _, lbl in pairs(fruitESPLabels) do lbl.Color = c end
    end })

    EspSetBox:AddSlider("ESPDistance", { Tooltip = "Max distance for ESP to render", Text = "ESP Distance", Default = 1000, Min = 0, Max = 10000, Decimals = 0, Callback = function(v) espCfg.dist = v end })
    EspSetBox:AddSlider("ESPFontSize", { Tooltip = "Text size for ESP labels", Text = "Font Size", Default = 14, Min = 10, Max = 30, Decimals = 0, Callback = function(v) espCfg.fontSize = v end })
end

do
    local clickTPConn
    CamBox:AddToggle("ClickTP", { Tooltip = "Right-click to teleport anywhere", Text = "Click TP", Default = false,
        Callback = function(p)
            if clickTPConn then clickTPConn:Disconnect(); clickTPConn = nil end
            if p then
                clickTPConn = UIS.InputBegan:Connect(function(inp, gpe)
                    if gpe or inp.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
                    local ray = Cam:ScreenPointToRay(inp.Position.X, inp.Position.Y)
                    local res = workspace:Raycast(ray.Origin, ray.Direction * 2000)
                    if res then local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = CFrame.new(res.Position + Vector3.new(0, 3, 0)) end end
                end)
            end
        end,
    })

    local freecamConns = {}
    CamBox:AddToggle("Freecam", { Tooltip = "Detach camera and fly freely", Text = "Freecam", Default = false,
        Callback = function(p)
            for _, c in pairs(freecamConns) do c:Disconnect() end; freecamConns = {}
            if p then
                Cam.CameraType = Enum.CameraType.Scriptable
                local keys, rmb = {}, false
                freecamConns[1] = UIS.InputBegan:Connect(function(inp, gpe) if gpe then return end; keys[inp.KeyCode] = true; if inp.UserInputType == Enum.UserInputType.MouseButton2 then rmb = true end end)
                freecamConns[2] = UIS.InputEnded:Connect(function(inp) keys[inp.KeyCode] = false; if inp.UserInputType == Enum.UserInputType.MouseButton2 then rmb = false end end)
                freecamConns[3] = RunService.RenderStepped:Connect(function(dt)
                    if rmb then
                        local delta = UIS:GetMouseDelta(); local cf = Cam.CFrame
                        local pitch = cf:ToEulerAngles(Enum.RotationOrder.YZX)
                        local newP = math.clamp(math.deg(pitch) - delta.Y * freecamSens * 0.1, -85, 85)
                        Cam.CFrame = CFrame.new(cf.Position) * CFrame.Angles(0, -delta.X * freecamSens * 0.01 * math.pi / 18, 0) * CFrame.Angles(math.rad(newP) - pitch, 0, 0) * (cf - cf.Position)
                        UIS.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
                    else UIS.MouseBehavior = Enum.MouseBehavior.Default end
                    local spd = freecamSpeed * dt * 60
                    if keys[Enum.KeyCode.W] then Cam.CFrame = Cam.CFrame * CFrame.new(0, 0, -spd) end
                    if keys[Enum.KeyCode.S] then Cam.CFrame = Cam.CFrame * CFrame.new(0, 0, spd) end
                    if keys[Enum.KeyCode.A] then Cam.CFrame = Cam.CFrame * CFrame.new(-spd, 0, 0) end
                    if keys[Enum.KeyCode.D] then Cam.CFrame = Cam.CFrame * CFrame.new(spd, 0, 0) end
                    if keys[Enum.KeyCode.E] or keys[Enum.KeyCode.Space] then Cam.CFrame = Cam.CFrame * CFrame.new(0, spd, 0) end
                    if keys[Enum.KeyCode.Q] or keys[Enum.KeyCode.LeftControl] then Cam.CFrame = Cam.CFrame * CFrame.new(0, -spd, 0) end
                end)
            else Cam.CameraType = Enum.CameraType.Custom; UIS.MouseBehavior = Enum.MouseBehavior.Default end
        end,
    })
    CamBox:AddSlider("FreecamSens", { Tooltip = "Camera rotation sensitivity", Text = "Sensitivity", Default = 5, Min = 1, Max = 20, Decimals = 1, Callback = function(v) freecamSens = v end })
    CamBox:AddSlider("FreecamSpeed", { Tooltip = "Camera movement speed", Text = "Speed", Default = 1, Min = 0.1, Max = 20, Decimals = 1, Callback = function(v) freecamSpeed = v end })
    CamBox:AddToggle("FOVChanger", { Tooltip = "Override the camera field of view", Text = "FOV", Default = false, Callback = function(p) Cam.FieldOfView = p and camFOV or 70 end })
    CamBox:AddSlider("CameraFOV", { Tooltip = "Custom field of view value", Text = "Camera FOV", Default = 70, Min = 1, Max = 120, Decimals = 0, Callback = function(v) camFOV = v; if Library.Options.FOVChanger and Library.Options.FOVChanger.Value then Cam.FieldOfView = v end end })
    CamBox:AddSlider("MaxZoom", { Tooltip = "Maximum camera zoom distance", Text = "Max Camera Zoom", Default = 400, Min = 0, Max = 2000, Decimals = 0, Callback = function(v) LP.CameraMaxZoomDistance = v end })

    local noFogConn
    LightBox:AddToggle("NoFog", { Tooltip = "Remove all fog and atmosphere", Text = "No Fog", Default = false,
        Callback = function(p)
            if noFogConn then noFogConn:Disconnect(); noFogConn = nil end
            if p then noFogConn = RunService.Heartbeat:Connect(function()
                Lighting.FogEnd = 100000; Lighting.FogStart = 0
                for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("Atmosphere") then v:Destroy() end end
            end) else Lighting.FogEnd = 100000 end
        end,
    })
    LightBox:AddToggle("NoShadows", { Tooltip = "Disable global shadows", Text = "No Shadows", Default = false, Callback = function(p) Lighting.GlobalShadows = not p end })

    local fbConn
    LightBox:AddToggle("FullBright", { Tooltip = "Max brightness, no dark areas", Text = "Fullbright", Default = false,
        Callback = function(p)
            if fbConn then fbConn:Disconnect(); fbConn = nil end
            if p then fbConn = RunService.Heartbeat:Connect(function()
                Lighting.Brightness = brightness; Lighting.ClockTime = 14; Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false; Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end) else Lighting.Brightness = 1; Lighting.ClockTime = 14; Lighting.GlobalShadows = true end
        end,
    })
    LightBox:AddSlider("Brightness", { Tooltip = "Light intensity level", Text = "Brightness", Default = 2, Min = 0, Max = 10, Decimals = 1, Callback = function(v) brightness = v end })
    LightBox:AddSlider("TimeOfDay", { Tooltip = "Set the in-game clock time", Text = "Time of Day", Default = 14, Min = 0, Max = 24, Decimals = 1, Callback = function(v) Lighting.ClockTime = v end })

    local xrayConn
    RenderBox:AddToggle("XRay", { Tooltip = "See through walls and terrain", Text = "Xray", Default = false,
        Callback = function(p)
            if xrayConn then xrayConn:Disconnect(); xrayConn = nil end
            if p then xrayConn = RunService.Heartbeat:Connect(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and not v.Parent:FindFirstChildWhichIsA("Humanoid") and not v.Parent.Parent:FindFirstChildWhichIsA("Humanoid") then
                        v.LocalTransparencyModifier = 0.7
                    end
                end
            end) else for _, v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.LocalTransparencyModifier = 0 end end end
        end,
    })
end

do
    ServBox:AddToggle("AntiAFK", { Tooltip = "Prevent auto-kick for being idle", Text = "Anti AFK", Default = false,
        Callback = function(p) if p then LP.Idled:Connect(function() VIM:SendMouseButtonEvent(0, 0, 0, true, game, 0); task.wait(); VIM:SendMouseButtonEvent(0, 0, 0, false, game, 0) end) end end })
    ServBox:AddButton({ Tooltip = "Rejoin the current server", Text = "Rejoin", Func = function() TP:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end })
    ServBox:AddButton({ Tooltip = "Join a random different server", Text = "Server Hop", Func = function() serverHop(0) end })

    JoinBox:AddInput("JobID", { Tooltip = "Paste a server job ID to join", Default = "", Numeric = false, Finished = false, Text = "JobID", Placeholder = "Paste job id..." })
    JoinBox:AddButton({ Tooltip = "Join server by job ID", Text = "Join Server", Func = function() TP:TeleportToPlaceInstance(game.PlaceId, Library.Options.JobID.Value, LP) end })
    JoinBox:AddButton({ Tooltip = "Copy this server's job ID", Text = "Copy JobId", Func = function() setclipboard(game.JobId); notify("Copied: " .. game.JobId) end })

    local modConn, leaveOnMod = nil, false
    local modKeywords = {"mod", "admin", "staff", "developer", "dev", "owner", "manager", "moderator"}
    SecBox:AddToggle("ModNotifier", { Tooltip = "Alert when a mod joins the server", Text = "Mod Notifier", Default = false,
        Callback = function(p)
            if modConn then modConn:Disconnect(); modConn = nil end
            if p then modConn = Players.PlayerAdded:Connect(function(plr)
                local n = plr.Name:lower()
                for _, kw in pairs(modKeywords) do
                    if n:find(kw) then notify("Possible mod: " .. plr.Name, 10)
                        if leaveOnMod then task.wait(0.5); TP:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end; return
                    end
                end
            end) end
        end,
    })
    SecBox:AddToggle("LeaveOnMod", { Tooltip = "Auto leave if a mod is detected", Text = "Leave On Mod", Default = false, Callback = function(v) leaveOnMod = v end })

    NetBox:AddToggle("AutoRejoin", { Tooltip = "Rejoin if connection is lost", Text = "Auto Rejoin", Default = false,
        Callback = function(p)
            autoRejoin = p
            if p then task.spawn(function()
                while autoRejoin do task.wait(5); if not autoRejoin then break end
                    pcall(function() local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue(); if ping >= 9999 then TP:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end end)
                end
            end) end
        end,
    })

    PerfBox:AddToggle("FPSUnlocker", { Tooltip = "Unlock framerate above 60", Text = "FPS Unlocker", Default = false, Callback = function(p) if not p then setfpscap(60) end end })
    PerfBox:AddInput("FPSCap", { Tooltip = "Target framerate when unlocked", Default = "144", Numeric = true, Finished = true, Text = "FPS Cap", Placeholder = "144",
        Callback = function(v) if Library.Options.FPSUnlocker and Library.Options.FPSUnlocker.Value then pcall(function() setfpscap(tonumber(v) or 144) end) end end })
    PerfBox:AddButton({ Tooltip = "Disable particles, effects, and shadows", Text = "FPS Boost", Func = function()
        pcall(function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Fire") then v.Enabled = false end
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then v.Enabled = false end
            end
            Lighting.GlobalShadows = false
        end)
        notify("FPS Boost applied")
    end })
    PerfBox:AddButton({ Tooltip = "Disable all kill/lava/damage parts", Text = "Remove Kill Bricks", Func = function()
        local n = 0
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local name = v.Name:lower()
                if name:find("kill") or name:find("lava") or name:find("acid") or name:find("damage") or name:find("death") or name:find("void") then
                    pcall(function() v.CanTouch = false; v.CanCollide = false; v.Transparency = 1 end); n = n + 1
                end
            end
        end
        notify("Disabled " .. n .. " kill bricks")
    end })

    local nearbyConn
    local nearbyTable = {}
    MiscNotBox:AddToggle("NearbyNotifier", { Tooltip = "Alert when players get close", Text = "Nearby Notifier", Default = false,
        Callback = function(p)
            if nearbyConn then nearbyConn:Disconnect(); nearbyConn = nil end
            nearbyTable = {}
            if not p then return end
            nearbyConn = RunService.Heartbeat:Connect(function()
                local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if not myHRP then return end
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr == LP then continue end
                    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if not hrp then nearbyTable[plr] = nil; continue end
                    local dist = (myHRP.Position - hrp.Position).Magnitude
                    local was = nearbyTable[plr]
                    local near = dist <= (Library.Options.NearbyDist and Library.Options.NearbyDist.Value or 50)
                    if near and not was then nearbyTable[plr] = true; notify(plr.Name .. " nearby [" .. math.floor(dist) .. "m]", 6)
                    elseif not near and was then nearbyTable[plr] = nil; notify(plr.Name .. " left range", 4) end
                end
            end)
        end,
    })
    MiscNotBox:AddSlider("NearbyDist", { Tooltip = "Detection range in studs", Text = "Nearby Distance", Default = 50, Min = 5, Max = 500, Decimals = 0 })
end

do
    local locList = {"-- Select --"}
    local cpList = {"-- Select --"}
    local cpIndexMap = {}

    local function refreshLocations()
        locList = {"-- Select --"}
        pcall(function() for _, v in ipairs(workspace.Locations:GetChildren()) do if v:IsA("BasePart") then table.insert(locList, v.Name) end end end)
        if Library.Options.LocationSelect then Library.Options.LocationSelect:SetValues(locList); Library.Options.LocationSelect:SetValue("-- Select --") end
    end

    local function refreshCP()
        cpList = {"-- Select --"}; cpIndexMap = {}
        pcall(function()
            local children = workspace.ChakraPoints:GetChildren()
            for i, v in ipairs(children) do local label = "[" .. i .. "] " .. v.Name; table.insert(cpList, label); cpIndexMap[label] = i end
        end)
        if Library.Options.ChakraPointSelect then Library.Options.ChakraPointSelect:SetValues(cpList); Library.Options.ChakraPointSelect:SetValue("-- Select --") end
    end

    LocBox:AddButton({ Tooltip = "Rescan map locations", Text = "Refresh", Func = refreshLocations })
    LocBox:AddDropdown("LocationSelect", { Tooltip = "Pick a map location", Text = "Location", Values = locList, Default = "-- Select --" })
    LocBox:AddButton({ Tooltip = "Teleport to selected location", Text = "Teleport", Func = function()
        local sel = dropVal(Library.Options.LocationSelect)
        if not sel or sel == "-- Select --" then return end
        pcall(function() local part = workspace.Locations:FindFirstChild(sel); if part then local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 4, 0)) end end end)
    end })

    CpBox:AddButton({ Tooltip = "Rescan chakra points", Text = "Refresh", Func = refreshCP })
    CpBox:AddDropdown("ChakraPointSelect", { Tooltip = "Pick a chakra point", Text = "Chakra Point", Values = cpList, Default = "-- Select --" })
    CpBox:AddButton({ Tooltip = "Teleport to selected chakra point", Text = "Teleport", Func = function()
        local sel = dropVal(Library.Options.ChakraPointSelect)
        if not sel or sel == "-- Select --" then return end
        local idx = cpIndexMap[sel]; if not idx then return end
        local model = workspace.ChakraPoints:GetChildren()[idx]; if not model then return end
        local target = model:FindFirstChild("Main") or model.PrimaryPart or model:FindFirstChildOfClass("BasePart")
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp and target then hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 5, 0)) end
    end })
end

do
    HazBox:AddButton({ Tooltip = "Remove all active debuffs", Text = "Clear All Ailments", Func = function() pcall(function() DataEvent:FireServer("RemoveFireAilment") end) end })
    HazBox:AddButton({ Tooltip = "Clear your sin count", Text = "Reset Sins", Func = function() pcall(function() DataFunction:InvokeServer("Pay", 0, "Sins", 1) end) end })
    HazBox:AddButton({ Tooltip = "Repair armor at the medic", Text = "Repair Armor", Func = function()
        local medic = workspace:FindFirstChild("Medic")
        local hrp = medic and medic:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        pcall(function() DataFunction:InvokeServer("Pay", 0, "Injuries", 1, hrp) end)
    end })
    HazBox:AddButton({ Tooltip = "Reset your character save data", Text = "Insta Wipe", Func = function() pcall(function() DataEvent:FireServer("NewGame") end) end })

    local noFireConn
    ProtBox:AddToggle("NoFireDamage", { Tooltip = "Remove fire damage over time", Text = "Fire Immunity", Default = false,
        Callback = function(p) if noFireConn then noFireConn:Disconnect(); noFireConn = nil end; if not p then return end
            noFireConn = RunService.Heartbeat:Connect(function() pcall(function() DataEvent:FireServer("RemoveFireAilment") end) end) end })

    local noLavaConn
    local blDataTable
    local function getBLDataTable()
        if not filtergc then return nil end
        if not blDataTable then
            local t = filtergc("table", {KeyValuePairs = {["DashCooldown"] = false}}, false)
            if not t or not next(t) then t = filtergc("table", {KeyValuePairs = {["DashCooldown"] = true}}, false) end
            blDataTable = t
        end
        return blDataTable
    end

    ProtBox:AddToggle("NoLavaDamage", { Tooltip = "Immune to lava and void damage", Text = "Lava Immunity", Default = false,
        Callback = function(p)
            if noLavaConn then noLavaConn:Disconnect(); noLavaConn = nil end
            local char = LP.Character
            if not p then if char then pcall(function() char:SetAttribute("VoidResistance", false) end) end; return end
            if char then pcall(function() char:SetAttribute("VoidResistance", true) end) end
            noLavaConn = RunService.Heartbeat:Connect(function()
                local c = LP.Character; if c then pcall(function() c:SetAttribute("VoidResistance", true) end) end
                pcall(function() local dt = getBLDataTable(); if dt then for _, v in pairs(dt) do rawset(v, "lavaTick", os.time()) end end end)
            end)
        end,
    })

    local antiVoidConn, antiVoidKBConn
    ProtBox:AddToggle("AntiVoid", { Tooltip = "Disable kill bricks and void damage", Text = "Anti Void", Default = false,
        Callback = function(p)
            if antiVoidConn then antiVoidConn:Disconnect(); antiVoidConn = nil end
            if antiVoidKBConn then antiVoidKBConn:Disconnect(); antiVoidKBConn = nil end
            local char = LP.Character
            if not p then if char then pcall(function() char:SetAttribute("VoidResistance", false) end) end; return end
            local function nukeKillBricks()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") then local n = v.Name:lower(); if n:find("kill") or n:find("void") or n:find("lava") or n:find("damage") then pcall(function() v.CanTouch = false; v.CanCollide = false end) end end
                end
            end
            nukeKillBricks()
            antiVoidKBConn = workspace.DescendantAdded:Connect(function(v)
                if not Library.Options.AntiVoid or not Library.Options.AntiVoid.Value then return end
                if v:IsA("BasePart") then local n = v.Name:lower(); if n:find("kill") or n:find("void") or n:find("lava") or n:find("damage") then pcall(function() v.CanTouch = false; v.CanCollide = false end) end end
            end)
            antiVoidConn = RunService.Heartbeat:Connect(function()
                local c = LP.Character; if c then pcall(function() c:SetAttribute("VoidResistance", true) end); pcall(function() c:SetAttribute("VoidImmune", true) end) end
            end)
        end,
    })

    local noStunConn
    AilBox:AddToggle("NoStun", { Tooltip = "Prevent M1 stun and knockback", Text = "No M1 Stun", Default = false,
        Callback = function(p)
            if noStunConn then noStunConn:Disconnect(); noStunConn = nil end
            if not p then return end
            noStunConn = RunService.Heartbeat:Connect(function()
                local char = LP.Character; if not char then return end
                local settings = char:FindFirstChild("Settings")
                if settings then
                    for _, valName in ipairs({"M1Stunned", "Stunned", "KnockedBack", "M1KnockedBack"}) do
                        pcall(function()
                            local v = settings:FindFirstChild(valName); if not v or v.Value == false then return end
                            local mt = getrawmetatable and getrawmetatable(v)
                            if mt then local o = rawget(mt, "__newindex"); rawset(mt, "__newindex", rawset); v.Value = false; rawset(mt, "__newindex", o)
                            else rawset(v, "Value", false) end
                        end)
                    end
                end
                for _, attr in ipairs({"M1Stunned", "Stunned", "M1KnockedBack", "KnockedBack"}) do
                    pcall(function() if char:GetAttribute(attr) then char:SetAttribute(attr, false) end end)
                end
            end)
        end,
    })

    local noRagdollConn
    AilBox:AddToggle("RemoveRagdoll", { Tooltip = "Cancel ragdoll state instantly", Text = "Remove Ragdoll", Default = false,
        Callback = function(p)
            if noRagdollConn then noRagdollConn:Disconnect(); noRagdollConn = nil end
            if not p then return end
            noRagdollConn = RunService.Heartbeat:Connect(function()
                local char = LP.Character; if not char then return end
                pcall(function()
                    local rag = char:FindFirstChild("Ragdolled")
                    if rag then
                        local mt = getrawmetatable and getrawmetatable(rag)
                        if mt then local o = rawget(mt, "__newindex"); rawset(mt, "__newindex", rawset); rag.Value = false; rawset(mt, "__newindex", o) end
                        rag:Destroy()
                    end
                end)
                for _, v in ipairs(char:GetDescendants()) do
                    if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then pcall(function() v.Enabled = false end) end
                end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end); pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) end) end
            end)
        end,
    })

    AilBox:AddToggle("RemoveBlindness", { Tooltip = "Remove blindness visual effects", Text = "Remove Blindness", Default = false,
        Callback = function(p)
            local conn
            if p then conn = RunService.Heartbeat:Connect(function()
                pcall(function() DataEvent:FireServer("RemoveBlindness") end)
                local char = LP.Character; if not char then return end
                for _, v in ipairs(char:GetDescendants()) do if v.Name:lower():find("blind") then pcall(function() v:Destroy() end) end end
                for _, v in ipairs(Lighting:GetChildren()) do if v.Name:lower():find("blind") or v.Name:lower():find("black") then pcall(function() v:Destroy() end) end end
            end) end
        end,
    })

    local vvGripDmgConn
    GripBox:AddToggle("InfGripDamage", { Tooltip = "Farm infinite grips by dealing damage", Text = "Inf Grips - Give Damage", Default = false,
        Callback = function(p)
            if vvGripDmgConn then vvGripDmgConn:Disconnect(); vvGripDmgConn = nil end
            if not p then return end
            local gripCF = CFrame.new(-3566.09, 422.67, -2385.41)
            vvGripDmgConn = RunService.Heartbeat:Connect(function()
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = gripCF end
                pcall(function() DataEvent:FireServer("TakeDamage", 10000, "yes") end)
            end)
        end,
    })

    local vvGripRecvConn
    GripBox:AddToggle("InfGripReceive", { Tooltip = "Farm infinite grips by receiving", Text = "Inf Grips - Receive", Default = false,
        Callback = function(p)
            if vvGripRecvConn then vvGripRecvConn:Disconnect(); vvGripRecvConn = nil end
            if not p then return end
            local gripCF = CFrame.new(-3566.09, 422.67, -2385.41)
            vvGripRecvConn = RunService.Heartbeat:Connect(function()
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = gripCF end
                pcall(function() DataEvent:FireServer("Grip") end)
            end)
        end,
    })

    local pickupConn, pickupAdded
    PickBox:AddToggle("PickupAura", { Tooltip = "Auto collect nearby dropped items", Text = "Pickup Aura", Default = false,
        Callback = function(p)
            if pickupConn then pickupConn:Disconnect(); pickupConn = nil end
            if pickupAdded then pickupAdded:Disconnect(); pickupAdded = nil end
            if not p then return end
            local function tryFire(part)
                if not (part and part:IsA("BasePart")) then return end
                local idVal = part:FindFirstChild("ID"); local activeVal = part:FindFirstChild("Active")
                if not (idVal and activeVal and activeVal.Value) then return end
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if not hrp then return end
                if (part.Position - hrp.Position).Magnitude <= 50 then pcall(function() DataEvent:FireServer("PickUp", idVal.Value) end) end
            end
            pickupAdded = workspace.DescendantAdded:Connect(function(obj) task.delay(0.1, function() if obj and obj.Parent then tryFire(obj) end end) end)
            local pt = 0
            pickupConn = RunService.Heartbeat:Connect(function(dt)
                pt = pt + dt; if pt < 1 then return end; pt = 0
                for _, obj in ipairs(workspace:GetChildren()) do tryFire(obj) end
            end)
        end,
    })

    local function applyNegateFall(char) local nf = char:FindFirstChild("NegateFall"); if not nf then nf = Instance.new("BoolValue"); nf.Name = "NegateFall"; nf.Parent = char end; nf.Value = true end
    local negateFallConn
    ExplMoveBox:AddToggle("NoFallDamage", { Tooltip = "Prevents fall damage completely", Text = "No Fall Damage", Default = false,
        Callback = function(p)
            if negateFallConn then negateFallConn:Disconnect(); negateFallConn = nil end
            local char = LP.Character
            if not p then if char then local nf = char:FindFirstChild("NegateFall"); if nf then nf:Destroy() end end; return end
            if char then applyNegateFall(char) end
            negateFallConn = LP.CharacterAdded:Connect(applyNegateFall)
        end,
    })

    local cdConn
    local function cdConnect()
        if cdConn then cdConn:Disconnect(); cdConn = nil end
        cdConn = RunService.Heartbeat:Connect(function()
            local noDash = Library.Options.NoDashCD and Library.Options.NoDashCD.Value
            local noBlock = Library.Options.NoBlockCD and Library.Options.NoBlockCD.Value
            local noAil = Library.Options.NoAilmentCD and Library.Options.NoAilmentCD.Value
            if not (noDash or noBlock or noAil) then return end
            pcall(function()
                local dt = getBLDataTable(); if not dt then return end
                for _, v in pairs(dt) do
                    if noDash then rawset(v, "DashCooldown", false) end
                    if noBlock then rawset(v, "BlockCooldown", false) end
                    if noAil then rawset(v, "AilmentCooldown", true) end
                end
            end)
        end)
    end

    CoolBox:AddToggle("NoDashCD", { Tooltip = "Remove dash cooldown", Text = "No Dash Cooldown", Default = false, Callback = function() cdConnect() end })
    CoolBox:AddToggle("NoBlockCD", { Tooltip = "Remove block cooldown", Text = "No Block Cooldown", Default = false, Callback = function() cdConnect() end })
    CoolBox:AddToggle("NoAilmentCD", { Tooltip = "Remove all debuff cooldowns", Text = "No Ailments (No Debuffs)", Default = false, Callback = function() cdConnect() end })

    local chakraConn
    ChakraBox:AddToggle("InfChakra", { Tooltip = "Unlimited chakra for abilities", Text = "Infinite Chakra", Default = false,
        Callback = function(p)
            if chakraConn then chakraConn:Disconnect(); chakraConn = nil end
            if not p then pcall(function() DataEvent:FireServer("StopCharging") end); return end
            local ct = 0
            chakraConn = RunService.Heartbeat:Connect(function(dt)
                ct = ct + dt; if ct < 0.1 then return end; ct = 0
                pcall(function()
                    if filtergc then
                        local dt2 = filtergc("table", {KeyValuePairs = {["DashCooldown"] = false}}, false)
                        if dt2 then for _, v in pairs(dt2) do if v.Chakra ~= nil then rawset(v, "Chakra", v.MaxChakra or 100) end end end
                    end
                end)
                pcall(function() DataEvent:FireServer("Charging") end)
            end)
        end,
    })
    ChakraBox:AddToggle("ChakraFeet", { Tooltip = "Keep chakra feet always active", Text = "Chakra Feet", Default = false,
        Callback = function(p)
            pcall(function() DataEvent:FireServer("ChakraFeet", p) end)
            if p then task.spawn(function()
                while Library.Options.ChakraFeet and Library.Options.ChakraFeet.Value do
                    pcall(function() DataEvent:FireServer("ChakraFeet", true) end); task.wait(1)
                end
            end) end
        end,
    })

    local csAlertConns = {}
    local csAlertDraw
    local CS_RANGE = 120

    local function csAlertClear()
        for _, conn in ipairs(csAlertConns) do pcall(function() conn:Disconnect() end) end; csAlertConns = {}
        if csAlertDraw then pcall(function() csAlertDraw:Remove() end); csAlertDraw = nil end
    end

    local function csShowAlert(playerName)
        if not csAlertDraw then
            csAlertDraw = Drawing.new("Text"); csAlertDraw.Center = true; csAlertDraw.Outline = true
            csAlertDraw.Color = Color3.fromRGB(255, 60, 60); csAlertDraw.Size = 20; csAlertDraw.Font = Drawing.Fonts.Monospace
            csAlertDraw.Position = Vector2.new(Cam.ViewportSize.X / 2, 80); csAlertDraw.Visible = true
        end
        csAlertDraw.Text = "[CHAKRA SENSE] " .. playerName .. " is sensing you!"
        csAlertDraw.Visible = true
        task.delay(3, function() if csAlertDraw then csAlertDraw.Visible = false end end)
    end

    local function watchCSPlayer(plr)
        local function onSettingsChild(child)
            if child.Name ~= "CurrentSkill" then return end
            local conn = child:GetPropertyChangedSignal("Value"):Connect(function()
                if not Library.Options.AntiObserve or not Library.Options.AntiObserve.Value then return end
                if child.Value ~= "Chakra Sense" then return end
                local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                local theirHRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if not (myHRP and theirHRP) then return end
                if (myHRP.Position - theirHRP.Position).Magnitude <= CS_RANGE then csShowAlert(plr.Name) end
            end)
            table.insert(csAlertConns, conn)
        end
        local settingsFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Settings")
        if not settingsFolder then return end
        local plrSettings = settingsFolder:FindFirstChild(plr.Name)
        if plrSettings then
            for _, ch in ipairs(plrSettings:GetChildren()) do onSettingsChild(ch) end
            table.insert(csAlertConns, plrSettings.ChildAdded:Connect(onSettingsChild))
        end
        table.insert(csAlertConns, settingsFolder.ChildAdded:Connect(function(ch)
            if ch.Name == plr.Name then
                for _, child in ipairs(ch:GetChildren()) do onSettingsChild(child) end
                table.insert(csAlertConns, ch.ChildAdded:Connect(onSettingsChild))
            end
        end))
    end

    AwareBox:AddToggle("AntiObserve", { Tooltip = "Alert when someone uses chakra sense on you", Text = "Chakra Sense Alert", Default = false,
        Callback = function(p)
            csAlertClear()
            if not p then return end
            for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LP then watchCSPlayer(plr) end end
            table.insert(csAlertConns, Players.PlayerAdded:Connect(function(plr)
                if plr ~= LP and Library.Options.AntiObserve and Library.Options.AntiObserve.Value then watchCSPlayer(plr) end
            end))
        end,
    })
end

do
    UpgBox:AddButton({ Tooltip = "Unlock the Burrow skill", Text = "Unlock Burrow", Func = function() pcall(function() DataFunction:InvokeServer("UnlockSkill", "Burrow") end) end })
    UpgBox:AddButton({ Tooltip = "Upgrade your armor level", Text = "Upgrade Armor", Func = function() pcall(function() DataFunction:InvokeServer("ArmorUpgrade") end) end })
    UpgBox:AddButton({ Tooltip = "Level up your awakening", Text = "Upgrade Awakening", Func = function() pcall(function() DataEvent:FireServer("UpgradeAwakeningLevel") end) end })
    UpgBox:AddButton({ Tooltip = "Get and bind your weapon", Text = "Bind Weapon", Func = function()
        pcall(function() DataFunction:InvokeServer("GetWeapon") end); task.wait(0.2); pcall(function() DataEvent:FireServer("WeaponBind") end)
    end })

    local v18 = require(game.ReplicatedStorage.GameManager)
    local DataTable = filtergc("table", { KeyValuePairs = { ["DashCooldown"] = false } }, false)
    local function sellBulk(z, l)
        local Merchant = workspace.Merchant.HumanoidRootPart
        for _, v in pairs(DataTable) do
            pcall(function()
                local v601 = v18:calculateBulk(v.Inventory, v.Loadout, z, nil, "Sale")
                for i = math.floor(v601 / 3), v601 do DataFunction:InvokeServer("SellingBulk", i, z, l, Merchant) end
            end)
        end
    end

    SellBox:AddButton({ Tooltip = "Sell all fish in inventory", Text = "Sell Fish", Func = function() task.spawn(function() sellBulk("Fish", "Fish") end) end })
    SellBox:AddButton({ Tooltip = "Sell all fruits in inventory", Text = "Sell Fruits", Func = function() task.spawn(function() sellBulk("Fruit", "Fruit") end) end })
    SellBox:AddButton({ Tooltip = "Sell all items in inventory", Text = "Sell Items", Func = function() task.spawn(function() sellBulk("Item", "Item") end) end })

    local autoSellActive, autoSellConn
    SellBox:AddToggle("AutoSell", { Tooltip = "Sell fish, fruit, and items on a loop", Text = "Auto Sell", Default = false,
        Callback = function(p)
            autoSellActive = p
            if autoSellConn then task.cancel(autoSellConn); autoSellConn = nil end
            if not p then return end
            autoSellConn = task.spawn(function()
                while autoSellActive do
                    task.spawn(function() sellBulk("Fish", "Fish") end)
                    task.spawn(function() sellBulk("Fruit", "Fruit") end)
                    task.spawn(function() sellBulk("Item", "Item") end)
                    task.wait(5)
                end
            end)
        end,
    })

    local villageList = {"Snow", "Rogue", "Rain", "Durana", "Sorythia"}
    VilBox:AddDropdown("JoinVillageSelect", { Tooltip = "Pick a village to join", Text = "Village", Values = villageList, Default = "Snow" })
    VilBox:AddButton({ Tooltip = "Join the selected village", Text = "Join Village", Func = function()
        local sel = dropVal(Library.Options.JoinVillageSelect)
        if not sel then return end
        pcall(function() DataFunction:InvokeServer("JoinVillage", sel) end)
    end })
end

do
    local noVFXConn
    MiscVfxBox:AddToggle("NoVisualEffects", { Tooltip = "Strip particles, blur, and post-fx", Text = "No Visual Effects", Default = false,
        Callback = function(p)
            if noVFXConn then noVFXConn:Disconnect(); noVFXConn = nil end
            if not p then pcall(function() Lighting.GlobalShadows = true end); return end
            local function stripVFX()
                pcall(function()
                    Lighting.GlobalShadows = false; Lighting.FogEnd = 1e6; Lighting.Brightness = 2
                    Lighting.Ambient = Color3.fromRGB(178, 178, 178); Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
                    for _, v in ipairs(Lighting:GetChildren()) do
                        if v:IsA("Atmosphere") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") or v:IsA("Sky") then pcall(function() v:Destroy() end) end
                    end
                end)
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then pcall(function() v.Enabled = false end) end
                end
            end
            stripVFX()
            local vt = 0
            noVFXConn = RunService.Heartbeat:Connect(function(dt) vt = vt + dt; if vt < 3 then return end; vt = 0; stripVFX() end)
        end,
    })

    MiscWBox:AddButton({ Tooltip = "Remove rain, snow, and storms", Text = "Remove Weather Effects", Func = function()
        for _, v in ipairs(Lighting:GetChildren()) do
            local n = v.Name:lower()
            if n:find("rain") or n:find("snow") or n:find("fog") or n:find("storm") or n:find("water") or n:find("blur") or n:find("atmosphere") then pcall(function() v:Destroy() end) end
        end
        for _, v in ipairs(workspace:GetChildren()) do
            if v.Name == "RainPart" or v.Name == "OnlyRainPart" then for _, pe in ipairs(v:GetChildren()) do if pe:IsA("ParticleEmitter") then pe.Enabled = false end end end
        end
    end })

    local clothList = {"-- None --"}
    local function scanClothing()
        clothList = {"-- None --"}
        local cl = game:GetService("ReplicatedStorage"):FindFirstChild("Clothing")
        if not cl then return end
        for _, obj in ipairs(cl:GetChildren()) do table.insert(clothList, obj.Name) end
        if Library.Options.ClothingSelect then Library.Options.ClothingSelect:SetValues(clothList); Library.Options.ClothingSelect:SetValue("-- None --") end
    end
    MiscClothBox:AddButton({ Tooltip = "Rescan available clothing", Text = "Refresh Outfits", Func = scanClothing })
    task.defer(scanClothing)
    MiscClothBox:AddDropdown("ClothingSelect", { Tooltip = "Pick an outfit to equip", Text = "Outfit", Values = clothList, Default = "-- None --" })
    MiscClothBox:AddButton({ Tooltip = "Apply selected outfit to character", Text = "Equip", Func = function()
        local sel = dropVal(Library.Options.ClothingSelect)
        if not sel or sel == "-- None --" then return end
        local char = LP.Character; if not char then return end
        local cl = game:GetService("ReplicatedStorage"):FindFirstChild("Clothing"); if not cl then return end
        local outfit = cl:FindFirstChild(sel); if not outfit then return end
        pcall(function() for _, v in ipairs(char:GetChildren()) do if v:IsA("Shirt") or v:IsA("Pants") then v:Destroy() end end; for _, v in ipairs(outfit:GetDescendants()) do if v:IsA("Shirt") or v:IsA("Pants") then v:Clone().Parent = char end end end)
    end })
    MiscClothBox:AddButton({ Tooltip = "Strip all clothing from character", Text = "Remove Outfit", Func = function()
        local char = LP.Character; if not char then return end
        for _, v in ipairs(char:GetChildren()) do if v:IsA("Shirt") or v:IsA("Pants") then v:Destroy() end end
    end })

    local function openGui(name) for _, g in ipairs(LP.PlayerGui:GetChildren()) do if g.Name == name then g.Enabled = not g.Enabled; return end end end
    MiscShopBox:AddButton({ Tooltip = "Open the wipe shop GUI", Text = "Wipe Shop", Func = function() openGui("WipeShop") end })
    MiscShopBox:AddButton({ Tooltip = "Open the Halloween shop GUI", Text = "Halloween Shop", Func = function() openGui("HalloweenShop") end })
    MiscShopBox:AddButton({ Tooltip = "Open the Christmas shop GUI", Text = "Xmas Shop", Func = function() openGui("XmasShop") end })
    MiscShopBox:AddButton({ Tooltip = "Open the Valentine shop GUI", Text = "Valentine Shop", Func = function() openGui("ValentineShop") end })
    MiscShopBox:AddButton({ Tooltip = "Open the event shop GUI", Text = "Event Shop", Func = function() openGui("EventCollectionShop") end })

    local autoChatOn = false
    MiscChatBox:AddToggle("AutoChat", { Tooltip = "Send a chat message on repeat", Text = "Auto Chat", Default = false,
        Callback = function(p)
            autoChatOn = p
            if p then task.spawn(function()
                while autoChatOn do task.wait(autoChatDelay); if not autoChatOn then break end
                    pcall(function()
                        local tc = game:GetService("TextChatService")
                        if tc.ChatVersion == Enum.ChatVersion.TextChatService then
                            local ch = tc:FindFirstChild("TextChannels"); local gen = ch and ch:FindFirstChild("RBXGeneral")
                            if gen then gen:SendAsync(autoChatMsg) end
                        else game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(autoChatMsg, "All") end
                    end)
                end
            end) end
        end,
    })
    MiscChatBox:AddInput("AutoChatMsg", { Tooltip = "Message to auto-send", Default = "gg", Numeric = false, Finished = true, Text = "Chat Message", Placeholder = "gg", Callback = function(v) autoChatMsg = v end })
    MiscChatBox:AddSlider("AutoChatInterval", { Tooltip = "Seconds between messages", Text = "Interval (s)", Default = 30, Min = 5, Max = 120, Decimals = 0, Callback = function(v) autoChatDelay = v end })

    local statGui
    MiscStatBox:AddToggle("ShowStats", { Tooltip = "Display FPS and ping on screen", Text = "FPS & Ping", Default = false,
        Callback = function(p)
            if not p then if statGui then statGui:Destroy(); statGui = nil end; return end
            statGui = Instance.new("ScreenGui"); statGui.Name = "ZHStats"; statGui.ResetOnSpawn = false; statGui.DisplayOrder = 999
            statGui.Parent = LP:WaitForChild("PlayerGui")
            local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0, 130, 0, 40); lbl.Position = UDim2.new(1, -140, 0, 10)
            lbl.BackgroundColor3 = Color3.fromRGB(15, 15, 15); lbl.BackgroundTransparency = 0.3
            lbl.TextColor3 = Color3.new(1, 1, 1); lbl.Font = Enum.Font.Code; lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.BorderSizePixel = 0; lbl.Parent = statGui
            Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 4)
            local pad = Instance.new("UIPadding", lbl); pad.PaddingLeft = UDim.new(0, 6)
            local last = tick()
            RunService.RenderStepped:Connect(function()
                if not statGui then return end
                local now = tick(); local fps = math.floor(1 / math.max(now - last, 0.001)); last = now
                local ping = 0; pcall(function() ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() end)
                lbl.Text = string.format("FPS: %d\nPing: %dms", fps, ping)
            end)
        end,
    })
end


Library:CreateSettingsTab(Window)

notify("Zero Hub | v1.2.0", 5)
