local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0.5, -125, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = screenGui

local coinsBox = Instance.new("TextBox")
coinsBox.Size = UDim2.new(0, 230, 0, 40)
coinsBox.Position = UDim2.new(0, 10, 0, 10)
coinsBox.PlaceholderText = "Coins"
coinsBox.Text = ""
coinsBox.Parent = frame

local addButton = Instance.new("TextButton")
addButton.Size = UDim2.new(0, 230, 0, 40)
addButton.Position = UDim2.new(0, 10, 0, 60)
addButton.Text = "Add"
addButton.Parent = frame

addButton.MouseButton1Click:Connect(function()
    local coinsValue = tonumber(coinsBox.Text)
    if coinsValue then
        local args = {
            [1] = -coinsValue
        }
        game:GetService("ReplicatedStorage").Events.UpdatePlayerCoins:FireServer(unpack(args))
    end
end)
