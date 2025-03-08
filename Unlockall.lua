local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:FindFirstChild("PlayerGui")

local PlantsFolder = ReplicatedStorage:FindFirstChild("Plants")
local UpdatePlayerSeedsEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("UpdatePlayerSeeds")

local previousPlants = {}

local function storePlantNames()
    previousPlants = {}
    if PlantsFolder then
        for _, plant in ipairs(PlantsFolder:GetChildren()) do
            if plant:IsA("Model") then
                table.insert(previousPlants, plant.Name)
            end
        end
        table.insert(previousPlants, "ElectricPeashooter")
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.Text = "Get All Plants"

Button.MouseButton1Click:Connect(function()
    storePlantNames()
    
    if UpdatePlayerSeedsEvent then
        for _, plantName in ipairs(previousPlants) do
            local args = {
                [1] = plantName,
                [2] = 300
            }
            UpdatePlayerSeedsEvent:FireServer(unpack(args))
        end
    end

    Button.Text = "Done"
end)
