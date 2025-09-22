local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SOUND_CLICK = "rbxassetid://12221967"
local SOUND_WHOOSH = "rbxassetid://9118823104"
local TWEEN = TweenInfo.new(0.28, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

local themes = {
	dark  = {bg=Color3.fromRGB(25,25,25), content=Color3.fromRGB(35,35,35), sidebar=Color3.fromRGB(20,20,20), text=Color3.fromRGB(255,255,255)},
	white = {bg=Color3.fromRGB(245,245,245), content=Color3.fromRGB(255,255,255), sidebar=Color3.fromRGB(230,230,230), text=Color3.fromRGB(25,25,25)},
	gray  = {bg=Color3.fromRGB(90,90,90), content=Color3.fromRGB(110,110,110), sidebar=Color3.fromRGB(70,70,70), text=Color3.fromRGB(255,255,255)}
}

local ESPState = {Players=false, Names=false, Parts=false}
local FlyState = false
local RTXState = false
local OthersState = {}

local function playSound(parent, id)
	local s = Instance.new("Sound", parent)
	s.SoundId = id
	s.Volume = 0.7
	s:Play()
	game.Debris:AddItem(s, 2)
end

-- GUI Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Junior480Hub"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0,760,0,440)
main.Position = UDim2.new(0.5,-380,0.5,-220)
main.BackgroundColor3 = themes.dark.bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
local mainCorner = Instance.new("UICorner", main); mainCorner.CornerRadius = UDim.new(0,14)
local mainStroke = Instance.new("UIStroke", main); mainStroke.Thickness = 2; mainStroke.Transparency = 0.7
local mainGrad = Instance.new("UIGradient", main); mainGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(38,38,38)), ColorSequenceKeypoint.new(1, Color3.fromRGB(18,18,18))}); mainGrad.Rotation = 90

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,48)
top.Position = UDim2.new(0,0,0,0)
top.BackgroundColor3 = Color3.fromRGB(18,18,18)
local topCorner = Instance.new("UICorner", top); topCorner.CornerRadius = UDim.new(0,14)
local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-140,1,0)
title.Position = UDim2.new(0,80,0,0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Text = "😭 Junior480's Hub"
title.TextColor3 = themes.dark.text
title.TextXAlignment = Enum.TextXAlignment.Center
local icon = Instance.new("TextLabel", top)
icon.Size = UDim2.new(0,44,0,44)
icon.Position = UDim2.new(0,12,0,2)
icon.BackgroundTransparency = 1
icon.Font = Enum.Font.GothamBold
icon.Text = "😭"
icon.TextSize = 24
icon.TextColor3 = themes.dark.text

-- resto do script continua igual (sidebar, tabs, botoes, etc) 
-- ...

-- mostrar a gui direto
main.Visible = true
playSound(main, SOUND_WHOOSH) -- só um somzinho de abertura

-- atalho para esconder/mostrar
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		if not main.Visible then
			main.Visible = true
			playSound(main, SOUND_WHOOSH)
			TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,-380,0.5,-220)}):Play()
		else
			playSound(main, SOUND_WHOOSH)
			TweenService:Create(main, TweenInfo.new(0.28, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,-380,1.2,0)}):Play()
			task.delay(0.3, function() main.Visible = false end)
		end
	end
end)
