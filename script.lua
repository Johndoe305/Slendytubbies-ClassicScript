--// ANTI-EXECUTAR
if _G.ScriptInjetadoCarregado then
    print("⚠️ Injetado já está rodando! Ignorando...")
    return
end
_G.ScriptInjetadoCarregado = true

--// SERVICES
local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

--// STATE
local hitboxRemovida = false
local custardsColetados = false
local espAtivo = false
local espBillboard = nil

--// FUNÇÃO ESP
local function toggleESP()
    espAtivo = not espAtivo
    
    if espAtivo then
        local tinky = workspace:FindFirstChild("TinkyWinkyModel")
        if tinky then
            -- Cria BillboardGui
            espBillboard = Instance.new("BillboardGui")
            espBillboard.Name = "ESP_TinkyWinky"
            espBillboard.Size = UDim2.new(0, 200, 0, 30)
            espBillboard.AlwaysOnTop = true
            espBillboard.MaxDistance = 99999
            espBillboard.Adornee = tinky:FindFirstChild("HumanoidRootPart") or tinky:FindFirstChild("Head") or tinky
            espBillboard.Parent = tinky
            
            local lbl = Instance.new("TextLabel", espBillboard)
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = "🟣 TINKY WINKY"
            lbl.TextColor3 = Color3.fromRGB(200, 100, 255)
            lbl.TextStrokeTransparency = 0
            lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
            lbl.Font = Enum.Font.GothamBold
            lbl.TextSize = 14
            
            print("📍 ESP ATIVADO!")
        else
            print("❌ TinkyWinkyModel não encontrado!")
        end
    else
        if espBillboard then
            espBillboard:Destroy()
            espBillboard = nil
            print("📍 ESP DESATIVADO!")
        end
    end
end

--// GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScriptInjetado"
gui.ResetOnSpawn = false

local fundo = Instance.new("Frame", gui)
fundo.Size = UDim2.new(0, 200, 0, 150)
fundo.Position = UDim2.new(0.5, -100, 0.4, -75)
fundo.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
fundo.BorderSizePixel = 0
Instance.new("UICorner", fundo).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", fundo).Color = Color3.fromRGB(100, 200, 255)
Instance.new("UIStroke", fundo).Thickness = 2

local titulo = Instance.new("TextLabel", fundo)
titulo.Size = UDim2.new(1, 0, 0, 20)
titulo.Position = UDim2.new(0, 0, 0, 5)
titulo.BackgroundTransparency = 1
titulo.Text = "🎮 Slendytubbies Classic Gui"
titulo.TextColor3 = Color3.fromRGB(200, 220, 255)
titulo.Font = Enum.Font.GothamBold
titulo.TextSize = 12
titulo.TextStrokeTransparency = 0
titulo.TextStrokeColor3 = Color3.new(0, 0, 0)

-- BOTÃO 1: REMOVER HITBOX
local btnHitbox = Instance.new("TextButton", fundo)
btnHitbox.Size = UDim2.new(1, -20, 0, 32)
btnHitbox.Position = UDim2.new(0, 10, 0, 28)
btnHitbox.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
btnHitbox.BorderSizePixel = 0
btnHitbox.Text = "🗑️ REMOVER HITBOX"
btnHitbox.TextColor3 = Color3.fromRGB(255, 150, 150)
btnHitbox.Font = Enum.Font.GothamBold
btnHitbox.TextSize = 11
btnHitbox.AutoButtonColor = false
btnHitbox.TextStrokeTransparency = 0
btnHitbox.TextStrokeColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", btnHitbox).CornerRadius = UDim.new(0, 8)

btnHitbox.Activated:Connect(function()
    if hitboxRemovida then
        btnHitbox.Text = "❌ HITBOX JÁ REMOVIDA"
        btnHitbox.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnHitbox.Text = "🗑️ REMOVER HITBOX"
        btnHitbox.TextColor3 = Color3.fromRGB(255, 150, 150)
        return
    end
    
    local tinky = workspace:FindFirstChild("TinkyWinky")
    if tinky then
        local hitbox = tinky:FindFirstChild("Hitbox")
        if hitbox then
            hitbox:Destroy()
            hitboxRemovida = true
            btnHitbox.Text = "✅ HITBOX REMOVIDA!"
            btnHitbox.TextColor3 = Color3.fromRGB(100, 255, 100)
            btnHitbox.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
            print("🗑️ Hitbox removida!")
            task.wait(1.5)
            btnHitbox.Text = "🗑️ REMOVER HITBOX"
            btnHitbox.TextColor3 = Color3.fromRGB(255, 150, 150)
            btnHitbox.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
        else
            btnHitbox.Text = "❌ NÃO ENCONTRADA"
            btnHitbox.TextColor3 = Color3.fromRGB(255, 255, 100)
            task.wait(1.5)
            btnHitbox.Text = "🗑️ REMOVER HITBOX"
            btnHitbox.TextColor3 = Color3.fromRGB(255, 150, 150)
        end
    else
        btnHitbox.Text = "❌ TINKYWINKY NÃO EXISTE"
        btnHitbox.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnHitbox.Text = "🗑️ REMOVER HITBOX"
        btnHitbox.TextColor3 = Color3.fromRGB(255, 150, 150)
    end
end)

-- BOTÃO 2: COLETAR CUSTARDS
local btnColetar = Instance.new("TextButton", fundo)
btnColetar.Size = UDim2.new(1, -20, 0, 32)
btnColetar.Position = UDim2.new(0, 10, 0, 63)
btnColetar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
btnColetar.BorderSizePixel = 0
btnColetar.Text = "🍮 COLETAR CUSTARDS"
btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
btnColetar.Font = Enum.Font.GothamBold
btnColetar.TextSize = 11
btnColetar.AutoButtonColor = false
btnColetar.TextStrokeTransparency = 0
btnColetar.TextStrokeColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", btnColetar).CornerRadius = UDim.new(0, 8)

btnColetar.Activated:Connect(function()
    if custardsColetados then
        btnColetar.Text = "❌ CUSTARDS JÁ COLETADOS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnColetar.Text = "🍮 COLETAR CUSTARDS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    
    local folder = workspace:FindFirstChild("Collect")
    if not folder then
        btnColetar.Text = "❌ PASTA NÃO EXISTE"
        btnColetar.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnColetar.Text = "🍮 COLETAR CUSTARDS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    
    local custards = folder:FindFirstChild("Custards")
    if not custards then
        btnColetar.Text = "❌ CUSTARDS NÃO EXISTE"
        btnColetar.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnColetar.Text = "🍮 COLETAR CUSTARDS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    
    local char = player.Character
    if not char then
        btnColetar.Text = "❌ VOCÊ ESTÁ MORTO"
        btnColetar.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnColetar.Text = "🍮 COLETAR CUSTARDS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then
        btnColetar.Text = "❌ SEM CORPO"
        btnColetar.TextColor3 = Color3.fromRGB(255, 255, 100)
        task.wait(1.5)
        btnColetar.Text = "🍮 COLETAR CUSTARDS"
        btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
        return
    end
    
    local coletados = 0
    for _, custard in ipairs(custards:GetChildren()) do
        local main = custard:FindFirstChild("main")
        if main then
            local touch = main:FindFirstChild("TouchInterest")
            if touch then
                firetouchinterest(main, root, 0)
                firetouchinterest(main, root, 1)
                coletados = coletados + 1
            end
        end
    end
    
    custardsColetados = true
    btnColetar.Text = "✅ " .. coletados .. " COLETADOS!"
    btnColetar.TextColor3 = Color3.fromRGB(100, 255, 100)
    btnColetar.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
    print("🍮 " .. coletados .. " custards coletados!")
    task.wait(1.5)
    btnColetar.Text = "🍮 COLETAR CUSTARDS"
    btnColetar.TextColor3 = Color3.fromRGB(255, 200, 100)
    btnColetar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
end)

-- BOTÃO 3: ESP (TOGGLE)
local btnESP = Instance.new("TextButton", fundo)
btnESP.Size = UDim2.new(1, -20, 0, 32)
btnESP.Position = UDim2.new(0, 10, 0, 98)
btnESP.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
btnESP.BorderSizePixel = 0
btnESP.Text = "📍 ESP TINKY: OFF"
btnESP.TextColor3 = Color3.fromRGB(200, 150, 255)
btnESP.Font = Enum.Font.GothamBold
btnESP.TextSize = 11
btnESP.AutoButtonColor = false
btnESP.TextStrokeTransparency = 0
btnESP.TextStrokeColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", btnESP).CornerRadius = UDim.new(0, 8)

btnESP.Activated:Connect(function()
    toggleESP()
    
    if espAtivo then
        btnESP.Text = "📍 ESP TINKY: ON"
        btnESP.TextColor3 = Color3.fromRGB(100, 255, 100)
        btnESP.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
    else
        btnESP.Text = "📍 ESP TINKY: OFF"
        btnESP.TextColor3 = Color3.fromRGB(200, 150, 255)
        btnESP.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    end
end)

--// DRAG
local arrastando, dragStart, startPos
fundo.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        arrastando = true; dragStart = input.Position; startPos = fundo.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if arrastando and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        fundo.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        arrastando = false
    end
end)

-- NOTIFICAÇÃO
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made by Old Scripts";
    Text = "Script loaded";
    Icon = "rbxassetid://15794846967"; -- icone de virus so pra dar um pouco de susto kkkk
    Duration = 6;
    Button1 = "OK";
    Callback = callback;
})

-- Somzinho de carregado
task.spawn(function()
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://3398620867"
    s.Volume = 1
    s.Parent = game:GetService("SoundService")
    s:Play()
    task.delay(3, function() s:Destroy() end)
end)

print("[loaded]")
