-- ==================== RCSTORE COLOR TOOL ====================
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local plr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

local blue = Color3.fromRGB(0, 170, 255)
local white = Color3.fromRGB(255, 255, 255)
local hairCol = Color3.fromRGB(255, 255, 255)
local skinCol = Color3.fromRGB(255, 219, 172)

local Key = "CFZX"
local HubKey = Enum.KeyCode.K

-- ==================== KEY SYSTEM ====================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "RCStoreKeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = plr:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 380, 0, 220)
keyFrame.Position = UDim2.new(0.5, -190, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
keyFrame.Parent = keyGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 16)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "RCSTORE COLOR TOOL"
title.TextColor3 = blue
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 45)
keyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
keyBox.PlaceholderText = "Digite a key..."
keyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
keyBox.TextColor3 = white
keyBox.Font = Enum.Font.Gotham
keyBox.Parent = keyFrame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.6, 0, 0, 40)
submitBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
submitBtn.BackgroundColor3 = blue
submitBtn.Text = "CONFIRMAR"
submitBtn.TextColor3 = white
submitBtn.Font = Enum.Font.GothamBold
submitBtn.Parent = keyFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 10)

submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text:upper() == Key then
        keyGui:Destroy()
        loadMainHub()
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Key incorreta!"
    end
end)

-- ==================== MAIN HUB ====================
function loadMainHub()
    local sgui = Instance.new("ScreenGui")
    sgui.Name = "RCStoreColorTool"
    sgui.ResetOnSpawn = false
    sgui.Parent = game:GetService("CoreGui") or plr.PlayerGui

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 720, 0, 520)
    main.Position = UDim2.new(0.5, -340, 0.5, -240)
    main.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
    main.Active = true
    main.Draggable = true
    main.Parent = sgui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1, 40, 1, 40)
    glow.Position = UDim2.new(0, -20, 0, -20)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857644"
    glow.ImageColor3 = blue
    glow.ImageTransparency = 0.85
    glow.Parent = main

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(1, -38, 0, 10)
    closeBtn.BackgroundColor3 = white
    closeBtn.BackgroundTransparency = 0.9
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(200, 60, 60)
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = main
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    closeBtn.MouseButton1Click:Connect(function() main.Visible = false end)

    local logo = Instance.new("TextLabel")
    logo.Size = UDim2.new(0, 300, 0, 50)
    logo.Position = UDim2.new(0, 25, 0, 15)
    logo.BackgroundTransparency = 1
    logo.Text = "RCSTORE COLOR TOOL"
    logo.TextColor3 = white
    logo.TextSize = 30
    logo.Font = Enum.Font.GothamBlack
    logo.Parent = main

    local panel = Instance.new("ScrollingFrame")
    panel.Position = UDim2.new(0, 25, 0, 80)
    panel.Size = UDim2.new(0.92, 0, 0.78, 0)
    panel.BackgroundTransparency = 1
    panel.ScrollBarThickness = 6
    panel.ScrollBarImageColor3 = blue
    panel.CanvasSize = UDim2.new(0,0,0,1100)
    panel.Parent = main

    local y = 20

    local function label(text)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, -20, 0, 35)
        l.Position = UDim2.new(0, 10, 0, y)
        l.BackgroundTransparency = 1
        l.Text = text
        l.TextColor3 = blue
        l.TextSize = 18
        l.Font = Enum.Font.GothamBold
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = panel
        y = y + 45
    end

    local function btn(text, cb)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, -20, 0, 45)
        b.Position = UDim2.new(0, 10, 0, y)
        b.BackgroundColor3 = white
        b.BackgroundTransparency = 0.9
        b.Text = text
        b.TextColor3 = white
        b.TextSize = 15
        b.Font = Enum.Font.GothamSemibold
        b.Parent = panel
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
        b.MouseButton1Click:Connect(cb)
        y = y + 55
    end

    local function fireColor(cmd, r, g, b)
        if plr:FindFirstChild("startevent") then
            plr.startevent:FireServer(cmd, string.format("%.2f,%.2f,%.2f", r / 255, g / 255, b / 255))
        end
    end

    -- ==================== PICKER HSV COMPLETO ====================
    local function picker(default, onChange, titleText)
        label(titleText)

        local box = Instance.new("Frame")
        box.Size = UDim2.new(1, -20, 0, 190)
        box.Position = UDim2.new(0, 10, 0, y)
        box.BackgroundTransparency = 1
        box.Parent = panel
        y = y + 210

        local sv = Instance.new("TextButton")
        sv.Size = UDim2.new(0, 280, 0, 140)
        sv.Position = UDim2.new(0, 5, 0, 5)
        sv.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        sv.Text = ""
        sv.AutoButtonColor = false
        sv.BorderSizePixel = 0
        sv.Parent = box
        Instance.new("UICorner", sv).CornerRadius = UDim.new(0, 8)

        local wO = Instance.new("Frame")
        wO.Size = UDim2.new(1, 0, 1, 0)
        wO.BackgroundTransparency = 0
        wO.BorderSizePixel = 0
        wO.Parent = sv
        Instance.new("UICorner", wO).CornerRadius = UDim.new(0, 8)
        local wG = Instance.new("UIGradient", wO)
        wG.Color = ColorSequence.new(white)
        wG.Transparency = NumberSequence.new(0, 1)

        local bO = Instance.new("Frame")
        bO.Size = UDim2.new(1, 0, 1, 0)
        bO.BackgroundTransparency = 0
        bO.BorderSizePixel = 0
        bO.Parent = sv
        Instance.new("UICorner", bO).CornerRadius = UDim.new(0, 8)
        local bG = Instance.new("UIGradient", bO)
        bG.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
        bG.Transparency = NumberSequence.new(1, 0)
        bG.Rotation = 90

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 12, 0, 12)
        dot.BackgroundColor3 = white
        dot.Parent = sv
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        Instance.new("UIStroke", dot).Color = Color3.fromRGB(0, 0, 0)

        local hueB = Instance.new("TextButton")
        hueB.Size = UDim2.new(0, 30, 0, 140)
        hueB.Position = UDim2.new(0, 295, 0, 5)
        hueB.Text = ""
        hueB.AutoButtonColor = false
        hueB.Parent = box
        Instance.new("UICorner", hueB).CornerRadius = UDim.new(0, 8)

        local hG = Instance.new("UIGradient", hueB)
        hG.Rotation = 90
        hG.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
        })

        local arr = Instance.new("Frame")
        arr.Size = UDim2.new(1, 6, 0, 4)
        arr.Position = UDim2.new(0, -3, 0, 0)
        arr.BackgroundColor3 = white
        arr.Parent = hueB

        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, -10, 0, 30)
        row.Position = UDim2.new(0, 5, 0, 152)
        row.BackgroundTransparency = 1
        row.Parent = box

        local function tb(ph, x)
            local t = Instance.new("TextBox")
            t.Size = UDim2.new(0, 100, 0, 28)
            t.Position = UDim2.new(0, x, 0, 0)
            t.BackgroundColor3 = white
            t.BackgroundTransparency = 0.92
            t.Font = Enum.Font.Gotham
            t.TextSize = 13
            t.TextColor3 = white
            t.PlaceholderText = ph
            t.Text = ""
            t.Parent = row
            Instance.new("UICorner", t).CornerRadius = UDim.new(0, 5)
            return t
        end

        local rT = tb("R", 0)
        local gT = tb("G", 105)
        local bT = tb("B", 210)

        local h, s, v = 0, 0, 1
        local dragH, dragS = false, false

        local function emit() onChange(Color3.fromHSV(h, s, v)) end

        local function refresh()
            local c = Color3.fromHSV(h, s, v)
            sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
            rT.Text = math.floor(c.R * 255)
            gT.Text = math.floor(c.G * 255)
            bT.Text = math.floor(c.B * 255)
            emit()
        end

        local function setCol(c)
            local hh, ss, vv = c:ToHSV()
            h, s, v = hh, ss, vv
            sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
            arr.Position = UDim2.new(0, -3, 0, (1 - h) * hueB.AbsoluteSize.Y - 2)
            dot.Position = UDim2.new(0, s * sv.AbsoluteSize.X - 6, 0, (1 - v) * sv.AbsoluteSize.Y - 6)
            rT.Text = math.floor(c.R * 255)
            gT.Text = math.floor(c.G * 255)
            bT.Text = math.floor(c.B * 255)
            emit()
        end

        local function fromRGB()
            local rr = math.clamp(tonumber(rT.Text) or 0, 0, 255)
            local gg = math.clamp(tonumber(gT.Text) or 0, 0, 255)
            local bb = math.clamp(tonumber(bT.Text) or 0, 0, 255)
            setCol(Color3.fromRGB(rr, gg, bb))
        end

        rT.FocusLost:Connect(fromRGB)
        gT.FocusLost:Connect(fromRGB)
        bT.FocusLost:Connect(fromRGB)

        hueB.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragH = true end
        end)

        sv.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragS = true end
        end)

        uis.InputChanged:Connect(function(inp)
            if inp.UserInputType ~= Enum.UserInputType.MouseMovement then return end
            if dragH then
                local q = math.clamp((inp.Position.Y - hueB.AbsolutePosition.Y) / hueB.AbsoluteSize.Y, 0, 1)
                arr.Position = UDim2.new(0, -3, 0, q * hueB.AbsoluteSize.Y - 2)
                h = 1 - q
                refresh()
            elseif dragS then
                local sx = math.clamp((inp.Position.X - sv.AbsolutePosition.X) / sv.AbsoluteSize.X, 0, 1)
                local sy = math.clamp((inp.Position.Y - sv.AbsolutePosition.Y) / sv.AbsoluteSize.Y, 0, 1)
                dot.Position = UDim2.new(0, sx * sv.AbsoluteSize.X - 6, 0, sy * sv.AbsoluteSize.Y - 6)
                s = sx
                v = 1 - sy
                refresh()
            end
        end)

        uis.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                dragH = false
                dragS = false
            end
        end)

        setCol(default)
    end

    picker(hairCol, function(c) hairCol = c end, "HAIR COLOR")
    picker(skinCol, function(c) skinCol = c end, "SKIN COLOR")

    btn("APPLY HAIR", function()
        fireColor("haircolor", math.floor(hairCol.R * 255), math.floor(hairCol.G * 255), math.floor(hairCol.B * 255))
    end)

    btn("APPLY SKIN", function()
        fireColor("skin", math.floor(skinCol.R * 255), math.floor(skinCol.G * 255), math.floor(skinCol.B * 255))
    end)

    uis.InputBegan:Connect(function(inp)
        if inp.KeyCode == HubKey then
            main.Visible = not main.Visible
        end
    end)



    btn("💎 JOIN RCSTORE", function()
        if setclipboard then
            setclipboard("https://discord.gg/kTSfdXR7et")
        end
    end)

    print("[Procurados Skinhub]: Loaded successfully!")
end

print("Tecla do Hub: K")
