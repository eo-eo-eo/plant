local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = screenGui

local coinsBox = Instance.new("TextBox")
coinsBox.Size = UDim2.new(0, 280, 0, 50)
coinsBox.Position = UDim2.new(0, 10, 0, 10)
coinsBox.PlaceholderText = "Coins"
coinsBox.Text = ""
coinsBox.Parent = frame

local winsBox = Instance.new("TextBox")
winsBox.Size = UDim2.new(0, 280, 0, 50)
winsBox.Position = UDim2.new(0, 10, 0, 70)
winsBox.PlaceholderText = "Wins"
winsBox.Text = ""
winsBox.Parent = frame

local applyButton = Instance.new("TextButton")
applyButton.Size = UDim2.new(0, 280, 0, 50)
applyButton.Position = UDim2.new(0, 10, 0, 130)
applyButton.Text = "Apply"
applyButton.Parent = frame

local doneBox = Instance.new("Frame")
doneBox.Size = UDim2.new(0, 300, 0, 100)
doneBox.Position = UDim2.new(0.5, -150, 0.5, -50)
doneBox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
doneBox.Visible = false
doneBox.Parent = screenGui

local doneLabel = Instance.new("TextLabel")
doneLabel.Size = UDim2.new(0, 280, 0, 50)
doneLabel.Position = UDim2.new(0, 10, 0, 25)
doneLabel.Text = "Done"
doneLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
doneLabel.BackgroundTransparency = 1
doneLabel.Parent = doneBox

applyButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    doneBox.Visible = true

    local coins = tonumber(coinsBox.Text)
    local wins = tonumber(winsBox.Text)
    
    if coins and wins then
        local argsCoins = { [1] = coins }
        game:GetService("ReplicatedStorage").Events.Update_Coins:FireServer(unpack(argsCoins))

        local argsWins = { [1] = wins }
        game:GetService("ReplicatedStorage").Events.Update_Win:FireServer(unpack(argsWins))

        wait(5)
        game:GetService("ReplicatedStorage").Events.Exit_Game:FireServer()
    else
        print("Invalid input for coins or wins")
    end
end)
