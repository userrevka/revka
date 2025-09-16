-- טוענים את Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- יוצרים Window
local Window = Rayfield:CreateWindow({
    Name = "Revka's girls",
    LoadingTitle = "מאיה i spit on you!",
    Theme = "Default",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "MyHubConfig"
    }
})

-- יוצרים Tab ראשי
local MainTab = Window:CreateTab("Main", 4483362458)

-- Section ל־Header
local HeaderSection = MainTab:CreateSection("Player Info")

local player = game.Players.LocalPlayer
local hour = os.date("*t").hour
local greeting = "Hello"
if hour < 12 then
    greeting = "Good morning my dear revka"
elseif hour < 18 then
    greeting = "Good afternoon my dear revka"
else
    greeting = "Good evening my dear revka"
end

local HeaderLabel = MainTab:CreateLabel(greeting..", "..player.Name)

-- ImageLabel Avatar
local avatarFrame = Instance.new("Frame")
avatarFrame.Size = UDim2.new(0, 60, 0, 60)
avatarFrame.BackgroundTransparency = 1
avatarFrame.Parent = MainTab.Holder

local avatarImage = Instance.new("ImageLabel")
avatarImage.Size = UDim2.new(1, 0, 1, 0)
avatarImage.Position = UDim2.new(0, 0, 0, 0)
avatarImage.BackgroundTransparency = 1
avatarImage.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=150&h=150"
avatarImage.Parent = avatarFrame

-- Section נוסף ל־Actions
local ActionSection = MainTab:CreateSection("Random things")

-- Internal values
local walkSpeedValue = 16
local jumpPowerValue = 50
local walkToggle = false
local jumpToggle = false

-- פונקציה שמעדכנת את Humanoid של ה־LocalPlayer
local function applyValues()
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    -- WalkSpeed
    if walkToggle then
        humanoid.WalkSpeed = walkSpeedValue
    else
        humanoid.WalkSpeed = 16
    end

    -- JumpPower
    humanoid.UseJumpPower = true -- חייב להיות true
    if jumpToggle then
        humanoid.JumpPower = jumpPowerValue
    else
        humanoid.JumpPower = 50
    end
end

-- Toggle WalkSpeed
local WalkSpeedToggle = MainTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Flag = "WalkToggle",
    Callback = function(value)
        walkToggle = value
        applyValues()
    end
})

-- Slider WalkSpeed
local WalkSpeedSlider = MainTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 250},
    Increment = 1,
    Suffix = "WS",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(value)
        walkSpeedValue = value
        applyValues()
    end
})

-- Toggle JumpPower
local JumpPowerToggle = MainTab:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Flag = "JumpToggle",
    Callback = function(value)
        jumpToggle = value
        applyValues()
    end
})

-- Slider JumpPower
local JumpPowerSlider = MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 5,
    Suffix = "JP",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(value)
        jumpPowerValue = value
        applyValues()
    end
})

-- מחזיר ערכים לדמות חדשה אחרי Respawn
player.CharacterAdded:Connect(applyValues)

-- Tab Scripts
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)
local ScriptsSection = ScriptsTab:CreateSection("Available Scripts")

local ScriptButton1 = ScriptsTab:CreateButton({
    Name = "Ink Game - key is ink LAWSHUB game",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/LAWSHUB-ink-game/refs/heads/main/LAWSHUB%20ink%20game"))()
    end
})

local ScriptButton2 = ScriptsTab:CreateButton({
    Name = "Volleyball Legends NO KEY",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptshubzeck/Zeckhubv1/refs/heads/main/zeckhub"))()
    end
})
local ScriptButton3 = ScriptsTab:CreateButton({
    Name = "Squid Game: Reblion ITS JUST TROLLS",
    Callback = function()
        local userMessage = Rayfield:CreateInput({
            Name = "Enter your message",
            PlaceholderText = "Type your message here",
            SectionParent = ScriptsTab
        })

        if userMessage and userMessage ~= "" then
            local args = {userMessage}
            game:GetService("ReplicatedStorage"):WaitForChild("SendAnnouncement"):FireServer(unpack(args))
        end
    end
})

-- טעינת הגדרות
Rayfield:LoadConfiguration()
