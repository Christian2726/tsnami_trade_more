-- =====================================
-- TOGGLE AUTO PROXIMITY PROMPT (VISIBLE)
-- Solo botones frente al jugador
-- + PAUSA si "Guesto Angelic" está en ambos Backpacks
-- =====================================

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().AutoPrompt = false

-- ========== FUNCIÓN PAUSA POR ARCHIVO ==========

local function HasGuestoInBoth()
	local other = Players:FindFirstChild("Nossssskk")
	if not other then return false end

	local bp1 = LP:FindFirstChild("Backpack")
	local bp2 = other:FindFirstChild("Backpack")
	if not bp1 or not bp2 then return false end

	return bp1:FindFirstChild("Guesto Angelic") and bp2:FindFirstChild("Guesto Angelic")
end

-- ========== UI TOGGLE ==========

local gui = Instance.new("ScreenGui")
gui.Name = "AutoPromptToggleGui"
gui.ResetOnSpawn = false
gui.Parent = LP:WaitForChild("PlayerGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 240, 0, 60)
btn.Position = UDim2.new(0.5, -120, 0.8, 0)
btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
btn.TextColor3 = Color3.fromRGB(255,0,0)
btn.TextScaled = true
btn.Text = "AUTO BOTÓN: OFF"
btn.Parent = gui
btn.Draggable = true
btn.Active = true

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

-- ========== AUTO PRESIONAR SOLO VISIBLE ==========

local MAX_DISTANCE = 12

task.spawn(function()
	while true do

		-- ⛔ SI AMBOS TIENEN "GUESTO ANGELIC" → PAUSA TODO
		if HasGuestoInBoth() then
			task.wait(0.2)
			continue
		end

		if getgenv().AutoPrompt then
			local char = LP.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")

			if hrp then
				for _, v in pairs(workspace:GetDescendants()) do
					if v:IsA("ProximityPrompt") then
						local part = v.Parent
						if part and part:IsA("BasePart") then
							local dist = (part.Position - hrp.Position).Magnitude
							if dist <= MAX_DISTANCE then
								local _, onScreen = Camera:WorldToViewportPoint(part.Position)
								if onScreen then
									pcall(function()
										v.HoldDuration = 0
										fireproximityprompt(v)
									end)
								end
							end
						end
					end
				end
			end
		end

		task.wait(0.05)
	end
end)
