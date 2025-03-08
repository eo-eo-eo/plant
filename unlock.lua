local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:FindFirstChild("PlayerGui")

local UnlockPlantEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("UnlockPlant")
local ExitGameEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("Exit_Game")
local PlantsFolder = ReplicatedStorage:FindFirstChild("Plants")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
ScrollingFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 10

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.Padding = UDim.new(0, 5)

local buttonCount = 0

if UnlockPlantEvent and ExitGameEvent and PlantsFolder then
    for _, plant in ipairs(PlantsFolder:GetChildren()) do
        if plant:IsA("Model") and not (plant.Name == "CandyPea" or plant.Name == "GatlingPea" or plant.Name == "GiftSunflower" or plant.Name == "SnowPea") then
            local Button = Instance.new("TextButton")
            Button.Parent = ScrollingFrame
            Button.Size = UDim2.new(1, 0, 0, 50)
            Button.Text = plant.Name
            buttonCount += 1
            Button.MouseButton1Click:Connect(function()
                ScreenGui:Destroy()
                UnlockPlantEvent:FireServer(plant.Name, 300)
                task.wait(5)
                ExitGameEvent:FireServer()
            end)
        end
    end
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, buttonCount * 55)
end
