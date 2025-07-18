local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlaceId = 15862722220
local JobId = "7ceba9b28e748b4db160fd559a9b5400"
local TARGET_PLAYER_NAME = "taiphat145"

TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)

repeat wait() until game:IsLoaded() and Players.LocalPlayer and Players.LocalPlayer.Character

local LocalPlayer = Players.LocalPlayer

-- Dịch chuyển đến NPC Seller
local function teleportToSeller()
    local seller = workspace:FindFirstChild("Seller")
    if seller and seller:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = seller.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
    else
        warn("Không tìm thấy NPC Seller")
    end
end

-- Gửi toàn bộ pet
local function sendAllPetsToPlayer()
    local tradeRemote = ReplicatedStorage:FindFirstChild("TradeRemote")
    if tradeRemote and tradeRemote:IsA("RemoteEvent") then
        -- Giả định bạn đã kiểm tra action đúng là "SendAllPets"
        tradeRemote:FireServer(TARGET_PLAYER_NAME, "SendAllPets")
    else
        warn("Không tìm thấy TradeRemote hoặc không phải RemoteEvent")
    end
end

teleportToSeller()
wait(2)
sendAllPetsToPlayer()