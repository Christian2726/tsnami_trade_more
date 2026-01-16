-- =====================================
-- TOGGLE AUTO PROXIMITY PROMPT (VISIBLE)
-- INSTANTE + re-presiona al reaparecer
-- PAUSA INSTANTE por Guesto Angelic
-- =====================================

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

getgenv().AutoPrompt = false

local promptState = {}

-- ========== UI TOGGLE ==========

local gui = Instance.new("ScreenGui")
gui.Name = "AutoPromptToggleGui"
gui.ResetOnSpawn = false
gui.Parent = LP:WaitForChild("PlayerGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 240, 0, 55)
btn.Position = UDim2.new(0.5, -120, 0.05, 0)
btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
btn.TextColor3 = Color3.fromRGB(255,0,0)
btn.TextScaled = true
btn.Text = "AUTO BOTÓN: OFF"
btn.Parent = gui
btn.Active = true
btn.Draggable = true

btn.MouseButton1Click:Connect(function()
	getgenv().AutoPrompt = not getgenv().AutoPrompt
	if getgenv().AutoPrompt then
		btn.Text = "AUTO BOTÓN: ON"
		btn.TextColor3 = Color3.fromRGB(0,255,0)
	else
		btn.Text = "AUTO BOTÓN: OFF"
		btn.TextColor3 = Color3.fromRGB(255,0,0)
	end
end)

-- ========== PAUSA INSTANTE POR ARCHIVO ==========

local function HasGuestoInBoth()
	local other = Players:FindFirstChild("Nossssskk")
	if not other then return false end

	local bp1 = LP:FindFirstChild("Backpack")
	local bp2 = other:FindFirstChild("Backpack")
	if not bp1 or not bp2 then return false end

	return bp1:FindFirstChild("Guesto Angelic") and bp2:FindFirstChild("Guesto Angelic")
end

-- ========== LOOP FRAME POR FRAME ==========

local MAX_DISTANCE = 12

RunService.RenderStepped:Connect(function()

	-- ⛔ PAUSA TOTAL INSTANTE
	if HasGuestoInBoth() then
		return
	end

	if not getgenv().AutoPrompt then return end

	local char = LP.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("ProximityPrompt") then

			local last = promptState[v]

			-- si se ocultó, marca hidden
			if not v.Enabled or not v.PromptShown then
				promptState[v] = "hidden"
			end

			-- si reapareció, permite otra vez
			if v.Enabled and v.PromptShown and last == "hidden" then
				promptState[v] = nil
			end

			-- si puede presionarse
			if not promptState[v] then
				local part = v.Parent
				if part and part:IsA("BasePart") then
					local dist = (part.Position - hrp.Position).Magnitude
					if dist <= MAX_DISTANCE then
						local _, onScreen = Camera:WorldToViewportPoint(part.Position)
						if onScreen then
							pcall(function()
								v.HoldDuration = 0
								fireproximityprompt(v, 0, true)
								promptState[v] = "pressed"
							end)
						end
					end
				end
			end
		end
	end

	-- limpiar destruidos
	for p,_ in pairs(promptState) do
		if not p.Parent then
			promptState[p] = nil
		end
	end
end)
