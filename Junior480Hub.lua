local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SOUND_CLICK = "rbxassetid://12221967"
local SOUND_WHOOSH = "rbxassetid://9118823104"
local SOUND_POPUP = "rbxassetid://9118821063"
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

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Junior480Hub"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local loading = Instance.new("Frame", screenGui)
loading.Size = UDim2.new(1,0,1,0)
loading.BackgroundColor3 = Color3.fromRGB(8,8,8)
local loadingGrad = Instance.new("UIGradient", loading)
loadingGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(18,18,18)), ColorSequenceKeypoint.new(1, Color3.fromRGB(48,48,48))})
local loadingLabel = Instance.new("TextLabel", loading)
loadingLabel.Size = UDim2.new(1,0,0,120)
loadingLabel.Position = UDim2.new(0,0,0.4,0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 28
loadingLabel.Text = "😭 Junior480's Hub - Loading..."
loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)
loadingLabel.TextScaled = true
local barBack = Instance.new("Frame", loading)
barBack.Size = UDim2.new(0.6,0,0.03,0)
barBack.Position = UDim2.new(0.2,0,0.58,0)
barBack.BackgroundColor3 = Color3.fromRGB(40,40,40)
local barBackCorner = Instance.new("UICorner", barBack)
local barFill = Instance.new("Frame", barBack)
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,170,255)
local barFillCorner = Instance.new("UICorner", barFill)
playSound(loading, SOUND_POPUP)
TweenService:Create(barFill, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,1,0)}):Play()
task.wait(4)
TweenService:Create(loading, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
TweenService:Create(loadingLabel, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
TweenService:Create(barBack, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
TweenService:Create(barFill, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
task.wait(0.65)
loading:Destroy()

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

local closeBtn = Instance.new("TextButton", top)
closeBtn.Size = UDim2.new(0,90,0,32)
closeBtn.Position = UDim2.new(1,-98,0,8)
closeBtn.Text = "Close"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
local closeCorner = Instance.new("UICorner", closeBtn); closeCorner.CornerRadius = UDim.new(0,10)
local closeStroke = Instance.new("UIStroke", closeBtn); closeStroke.Thickness = 1

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,180,1,-48)
sidebar.Position = UDim2.new(0,0,0,48)
sidebar.BackgroundColor3 = themes.dark.sidebar
sidebar.BorderSizePixel = 0
local sideCorner = Instance.new("UICorner", sidebar); sideCorner.CornerRadius = UDim.new(0,12)
local sideGrad = Instance.new("UIGradient", sidebar); sideGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(48,48,48)), ColorSequenceKeypoint.new(1, Color3.fromRGB(24,24,24))}); sideGrad.Rotation = 90
local sideLayout = Instance.new("UIListLayout", sidebar); sideLayout.Padding = UDim.new(0,8)
local sidePadding = Instance.new("UIPadding", sidebar); sidePadding.PaddingLeft = UDim.new(0,10); sidePadding.PaddingTop = UDim.new(0,8)

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-180,1,-48)
content.Position = UDim2.new(0,180,0,48)
content.BackgroundColor3 = themes.dark.content
content.BorderSizePixel = 0
local contentCorner = Instance.new("UICorner", content); contentCorner.CornerRadius = UDim.new(0,12)
local contentGrad = Instance.new("UIGradient", content); contentGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(56,56,56)), ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,30))}); contentGrad.Rotation = 90
local contentLayout = Instance.new("UIListLayout", content); contentLayout.Padding = UDim.new(0,10)
content.AutomaticCanvasSize = Enum.AutomaticSize.Y

local popup = Instance.new("Frame", screenGui)
popup.Size = UDim2.new(0,420,0,160)
popup.Position = UDim2.new(0.5,-210,0.5,-80)
popup.BackgroundColor3 = Color3.fromRGB(35,35,35)
popup.Visible = false
popup.ZIndex = 50
local popupCorner = Instance.new("UICorner", popup); popupCorner.CornerRadius = UDim.new(0,12)
local popupTxt = Instance.new("TextLabel", popup)
popupTxt.Size = UDim2.new(1,-40,0,60)
popupTxt.Position = UDim2.new(0,20,0,10)
popupTxt.BackgroundTransparency = 1
popupTxt.Font = Enum.Font.GothamBold
popupTxt.TextSize = 18
popupTxt.TextColor3 = Color3.new(1,1,1)
popupTxt.Text = "Tem certeza que quer sair?"
local popupYes = Instance.new("TextButton", popup)
popupYes.Size = UDim2.new(0.4,0,0,34); popupYes.Position = UDim2.new(0.08,0,0.65,0); popupYes.Text = "Sim"; popupYes.Font = Enum.Font.GothamBold; popupYes.TextColor3 = Color3.new(1,1,1); popupYes.BackgroundColor3 = Color3.fromRGB(60,180,60); local pyc = Instance.new("UICorner", popupYes)
local popupNo = Instance.new("TextButton", popup); popupNo.Size = UDim2.new(0.4,0,0,34); popupNo.Position = UDim2.new(0.52,0,0.65,0); popupNo.Text = "Não"; popupNo.Font = Enum.Font.GothamBold; popupNo.TextColor3 = Color3.new(1,1,1); popupNo.BackgroundColor3 = Color3.fromRGB(180,60,60); local pnc = Instance.new("UICorner", popupNo)

local function styleButton(b)
	b.AutoButtonColor = false
	b.Font = Enum.Font.GothamBold
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	local c = Instance.new("UICorner", b); c.CornerRadius = UDim.new(0,8)
	local s = Instance.new("UIStroke", b); s.Thickness = 1; s.Transparency = 0.7
	local g = Instance.new("UIGradient", b); g.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(65,65,65)), ColorSequenceKeypoint.new(1, Color3.fromRGB(40,40,40))}); g.Rotation = 90
	b.Size = UDim2.new(1,-20,0,36)
	b.MouseEnter:Connect(function() TweenService:Create(b, TweenInfo.new(0.18, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(1,-14,0,40)}):Play() end)
	b.MouseLeave:Connect(function() TweenService:Create(b, TweenInfo.new(0.18, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(1,-20,0,36)}):Play() end)
	b.MouseButton1Click:Connect(function() playSound(b, SOUND_CLICK) end)
end

local function createSidebarButton(txt, order)
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1,-20,0,36)
	btn.Position = UDim2.new(0,10,0,(order-1)*46)
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	btn.Text = txt
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	local c = Instance.new("UICorner", btn); c.CornerRadius = UDim.new(0,8)
	styleButton(btn)
	return btn
end

local Tabs = {}
local function createTab(name)
	local t = Instance.new("ScrollingFrame", content)
	t.Name = name
	t.Size = UDim2.new(1,0,1,0)
	t.CanvasSize = UDim2.new(0,0,0,0)
	t.ScrollBarThickness = 6
	t.BackgroundTransparency = 1
	t.Visible = false
	local layout = Instance.new("UIListLayout", t); layout.Padding = UDim.new(0,8)
	t.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Tabs[name] = t
	return t
end

local categories = {"CREDITS","ESP","WORKSPACE","TROLL","SCRIPTS","GRAPHICS","THEME","OTHERS"}
for i,cat in ipairs(categories) do
	createSidebarButton(cat, i)
end

for _,v in ipairs(sidebar:GetChildren()) do
	if v:IsA("TextButton") then
		local name = v.Text
		local tab = createTab(name)
		v.MouseButton1Click:Connect(function()
			playSound(v, SOUND_WHOOSH)
			for _,t in pairs(Tabs) do t.Visible = false end
			tab.Visible = true
		end)
	end
end

local CreditsTab = Tabs["CREDITS"]
local ESPTab = Tabs["ESP"]
local WorkspaceTab = Tabs["WORKSPACE"]
local TrollTab = Tabs["TROLL"]
local ScriptsTab = Tabs["SCRIPTS"]
local GraphicsTab = Tabs["GRAPHICS"]
local ThemeTab = Tabs["THEME"]
local OthersTab = Tabs["OTHERS"]

local function createContentButton(parent, text, callback)
	local b = Instance.new("TextButton", parent)
	b.Text = text
	b.Size = UDim2.new(1,-20,0,36)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	styleButton(b)
	b.MouseButton1Click:Connect(function()
		playSound(b, SOUND_CLICK)
		pcall(callback)
	end)
	return b
end

local function createContentBox(parent, placeholder, callback)
	local t = Instance.new("TextBox", parent)
	t.Size = UDim2.new(1,-20,0,36)
	t.PlaceholderText = placeholder
	t.BackgroundColor3 = Color3.fromRGB(45,45,45)
	t.TextColor3 = Color3.new(1,1,1)
	t.Font = Enum.Font.Gotham
	local c = Instance.new("UICorner", t); c.CornerRadius = UDim.new(0,8)
	t.FocusLost:Connect(function(enter)
		if enter and t.Text ~= "" then
			playSound(t, SOUND_CLICK)
			pcall(callback, t.Text)
		end
	end)
	return t
end

createContentButton(CreditsTab, "Made by: Junior480", function() end)
createContentButton(CreditsTab, "Executor: Xeno", function() end)

createContentButton(ESPTab, "ESP PLAYERS (Hitboxes)", function()
	ESPState.Players = not ESPState.Players
	if ESPState.Players then
		for _,plr in ipairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local sb = Instance.new("SelectionBox", workspace)
				sb.Name = "JUNIOR480_ESP_PLAYER"
				sb.Adornee = plr.Character.HumanoidRootPart
				sb.Color3 = Color3.fromRGB(255,60,60)
			end
		end
	else
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("SelectionBox") and v.Name == "JUNIOR480_ESP_PLAYER" then v:Destroy() end
		end
	end
end)

createContentButton(ESPTab, "ESP NAMES", function()
	ESPState.Names = not ESPState.Names
	if ESPState.Names then
		for _,plr in ipairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("Head") then
				if not plr.Character.Head:FindFirstChild("JUNIOR480_ESP_NAME") then
					local bill = Instance.new("BillboardGui", plr.Character.Head)
					bill.Name = "JUNIOR480_ESP_NAME"
					bill.Adornee = plr.Character.Head
					bill.Size = UDim2.new(0,140,0,30)
					bill.StudsOffset = Vector3.new(0,2.6,0)
					bill.AlwaysOnTop = true
					local t = Instance.new("TextLabel", bill)
					t.Size = UDim2.new(1,0,1,0)
					t.BackgroundTransparency = 1
					t.Font = Enum.Font.GothamBold
					t.TextSize = 14
					t.Text = plr.Name
					t.TextColor3 = Color3.new(1,1,1)
				end
			end
		end
	else
		for _,plr in ipairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("Head") and plr.Character.Head:FindFirstChild("JUNIOR480_ESP_NAME") then
				plr.Character.Head.JUNIOR480_ESP_NAME:Destroy()
			end
		end
	end
end)

createContentButton(ESPTab, "ESP PARTS", function()
	ESPState.Parts = not ESPState.Parts
	if ESPState.Parts then
		for _,p in ipairs(workspace:GetDescendants()) do
			if p:IsA("BasePart") and not p:FindFirstChild("JUNIOR480_ESP_PART") then
				local sb = Instance.new("SelectionBox", workspace)
				sb.Name = "JUNIOR480_ESP_PART"
				sb.Adornee = p
				sb.Color3 = Color3.fromRGB(60,130,255)
			end
		end
	else
		for _,v in pairs(workspace:GetDescendants()) do
			if v:IsA("SelectionBox") and v.Name == "JUNIOR480_ESP_PART" then v:Destroy() end
		end
	end
end)

createContentBox(WorkspaceTab, "TP Player (Digite nome)", function(txt)
	local p = Players:FindFirstChild(txt)
	if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
	end
end)

createContentBox(WorkspaceTab, "SELECT IMAGE PART (coloque o ID)", function(txt)
	local sel = LocalPlayer:GetMouse().Target
	if sel and sel:IsA("BasePart") then
		local dec = Instance.new("Decal", sel)
		dec.Texture = "rbxassetid://"..txt
	end
end)

createContentButton(WorkspaceTab, "FLY (Toggle)", function()
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
	FlyState = not FlyState
	if FlyState then
		local hrp = LocalPlayer.Character.HumanoidRootPart
		local bv = Instance.new("BodyVelocity", hrp)
		bv.Name = "JUNIOR480_FLY_BV"
		bv.MaxForce = Vector3.new(9e9,9e9,9e9)
		bv.Velocity = Vector3.new(0,0,0)
		local conn
		conn = RunService.Heartbeat:Connect(function()
			if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not hrp:FindFirstChild("JUNIOR480_FLY_BV") then conn:Disconnect(); return end
			local vel = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + hrp.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - hrp.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - hrp.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + hrp.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,50,0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel = vel - Vector3.new(0,50,0) end
			bv.Velocity = vel * 1
		end)
	else
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("JUNIOR480_FLY_BV") then LocalPlayer.Character.HumanoidRootPart.JUNIOR480_FLY_BV:Destroy() end
		end
	end
end)

createContentButton(WorkspaceTab, "FLING (Impulse)", function()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 150, 0)
	end
end)

createContentBox(WorkspaceTab, "SKYBOX IMAGE DECAL (id)", function(txt)
	pcall(function()
		local s = Instance.new("Sky")
		s.Name = "JUNIOR480_SKY"
		s.SkyboxBk = "rbxassetid://"..txt
		s.SkyboxDn = "rbxassetid://"..txt
		s.SkyboxFt = "rbxassetid://"..txt
		s.SkyboxLf = "rbxassetid://"..txt
		s.SkyboxRt = "rbxassetid://"..txt
		s.Parent = Lighting
	end)
end)

createContentBox(WorkspaceTab, "AUDIO PLAYER (asset id)", function(txt)
	pcall(function()
		if workspace:FindFirstChild("JUNIOR480_MUSIC") then workspace.JUNIOR480_MUSIC:Destroy() end
		local s = Instance.new("Sound", workspace)
		s.Name = "JUNIOR480_MUSIC"
		s.SoundId = "rbxassetid://"..txt
		s.Looped = true
		s.Volume = 1
		s:Play()
	end)
end)

local TROLLS = {
	{"Spam Jump", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.Jump = true end end},
	{"Flood Chat", function() pcall(function() game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("HAHAHA", "All") end) end},
	{"Spin Self", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(360), 0) end end},
	{"Fake Lag", function() task.wait(4) end},
	{"Annoy Sound", function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://12222005"; s:Play(); game.Debris:AddItem(s, 6) end}
}

for _,t in ipairs(TROLLS) do
	createContentButton(TrollTab, t[1], t[2])
end

createContentButton(ScriptsTab, "Infinite Yield", function()
	pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
end)
createContentButton(ScriptsTab, "Auto Clicker GUI", function()
	pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/The-telligence/main/MC%20KSystem%202"))() end)
end)
createContentButton(ScriptsTab, "GhostHub", function()
	pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))() end)
end)

createContentButton(GraphicsTab, "Low Graphics", function() pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end) end)
createContentButton(GraphicsTab, "Medium Graphics", function() pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level05 end) end)
createContentButton(GraphicsTab, "High Graphics", function() pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end) end)
createContentButton(GraphicsTab, "Shaders (placeholder)", function() end)
createContentButton(GraphicsTab, "Bloom Shaders (placeholder)", function() end)
createContentButton(GraphicsTab, "RTX (INCRÍVEL)", function()
	RTXState = not RTXState
	if RTXState then
		if not Lighting:FindFirstChild("JUNIOR480_BLOOM") then
			local b = Instance.new("BloomEffect", Lighting); b.Name = "JUNIOR480_BLOOM"; b.Intensity = 1.5
			local cc = Instance.new("ColorCorrectionEffect", Lighting); cc.Name = "JUNIOR480_CC"; cc.Saturation = 0.15; cc.Contrast = 0.15
			local sr = Instance.new("SunRaysEffect", Lighting); sr.Name = "JUNIOR480_SUN"; sr.Intensity = 0.25
		end
	else
		for _,n in ipairs({"JUNIOR480_BLOOM","JUNIOR480_CC","JUNIOR480_SUN"}) do
			if Lighting:FindFirstChild(n) then Lighting[n]:Destroy() end
		end
	end
end)

createContentButton(ThemeTab, "Dark Mode", function()
	local th = themes.dark
	TweenService:Create(main, TWEEN, {BackgroundColor3 = th.bg}):Play()
	TweenService:Create(content, TWEEN, {BackgroundColor3 = th.content}):Play()
	TweenService:Create(sidebar, TWEEN, {BackgroundColor3 = th.sidebar}):Play()
	for _,obj in ipairs(screenGui:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
			TweenService:Create(obj, TWEEN, {TextColor3 = th.text}):Play()
		end
	end
end)

createContentButton(ThemeTab, "White Mode", function()
	local th = themes.white
	TweenService:Create(main, TWEEN, {BackgroundColor3 = th.bg}):Play()
	TweenService:Create(content, TWEEN, {BackgroundColor3 = th.content}):Play()
	TweenService:Create(sidebar, TWEEN, {BackgroundColor3 = th.sidebar}):Play()
	for _,obj in ipairs(screenGui:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
			TweenService:Create(obj, TWEEN, {TextColor3 = th.text}):Play()
		end
	end
end)

createContentButton(ThemeTab, "Gray Mode", function()
	local th = themes.gray
	TweenService:Create(main, TWEEN, {BackgroundColor3 = th.bg}):Play()
	TweenService:Create(content, TWEEN, {BackgroundColor3 = th.content}):Play()
	TweenService:Create(sidebar, TWEEN, {BackgroundColor3 = th.sidebar}):Play()
	for _,obj in ipairs(screenGui:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
			TweenService:Create(obj, TWEEN, {TextColor3 = th.text}):Play()
		end
	end
end)

local othersList = {"Speed Boost","Big Head","Rainbow Hat","God Mode","Tiny Player","Super Jump","NoClip","Invisible","Reset Character","Give Tools"}
for _,name in ipairs(othersList) do
	createContentButton(OthersTab, name, function()
		local char = LocalPlayer.Character
		if not char then return end
		local hum = char:FindFirstChild("Humanoid")
		if name == "Speed Boost" then
			if OthersState[name] then hum.WalkSpeed = 16; OthersState[name] = false else hum.WalkSpeed = 40; OthersState[name] = true end
		elseif name == "Big Head" then
			if OthersState[name] then OthersState[name] = false; if char:FindFirstChild("Head") then char.Head.Size = Vector3.new(2,1,1) end else OthersState[name] = true; if char:FindFirstChild("Head") then char.Head.Size = Vector3.new(3,2,2) end end
		elseif name == "Rainbow Hat" then
			for _,acc in pairs(char:GetChildren()) do if acc:IsA("Accessory") and acc:FindFirstChildWhichIsA("BasePart") then acc:FindFirstChildWhichIsA("BasePart").Color = Color3.fromHSV(math.random(),1,1) end end
		elseif name == "God Mode" then if hum then hum.Health = hum.MaxHealth end
		elseif name == "Tiny Player" then
			if OthersState[name] then OthersState[name] = false; for _,p in pairs(char:GetChildren()) do if p:IsA("BasePart") then p.Size = p.Size / 0.6 end end
			else OthersState[name] = true; for _,p in pairs(char:GetChildren()) do if p:IsA("BasePart") then p.Size = p.Size * 0.6 end end end
		elseif name == "Super Jump" then if OthersState[name] then hum.JumpPower = 50; OthersState[name] = false else hum.JumpPower = 120; OthersState[name] = true end
		elseif name == "NoClip" then
			OthersState[name] = not OthersState[name]
			if OthersState[name] then
				RunService:BindToRenderStep("JUNIOR480_NoClip", Enum.RenderPriority.Character.Value, function() for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end)
			else
				pcall(function() RunService:UnbindFromRenderStep("JUNIOR480_NoClip") end)
				for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end
			end
		elseif name == "Invisible" then
			OthersState[name] = not OthersState[name]
			for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = OthersState[name] and 1 or 0 end end
		elseif name == "Reset Character" then LocalPlayer:LoadCharacter()
		elseif name == "Give Tools" then local tool = Instance.new("Tool"); tool.Name = "JUNIOR480_TOOL"; tool.Parent = LocalPlayer.Backpack end
	end)
end

for _,plr in ipairs(Players:GetPlayers()) do
	if plr.Character then
		if ESPState.Players then
			local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
			if hrp then local sb = Instance.new("SelectionBox", workspace); sb.Name = "JUNIOR480_ESP_PLAYER"; sb.Adornee = hrp; sb.Color3 = Color3.fromRGB(255,60,60) end
		end
	end
	plr.CharacterAdded:Connect(function(char) task.wait(0.2)
		if ESPState.Players then
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if hrp then local sb = Instance.new("SelectionBox", workspace); sb.Name = "JUNIOR480_ESP_PLAYER"; sb.Adornee = hrp; sb.Color3 = Color3.fromRGB(255,60,60) end
		end
	end)
end
Players.PlayerAdded:Connect(function(plr) plr.CharacterAdded:Connect(function(c) task.wait(0.2); if ESPState.Players and c:FindFirstChild("HumanoidRootPart") then local sb = Instance.new("SelectionBox", workspace); sb.Name = "JUNIOR480_ESP_PLAYER"; sb.Adornee = c.HumanoidRootPart; sb.Color3 = Color3.fromRGB(255,60,60) end end) end)

closeBtn.MouseButton1Click:Connect(function()
	playSound(closeBtn, SOUND_POPUP)
	popup.Visible = true
	popup.Size = UDim2.new(0,0,0,0)
	TweenService:Create(popup, TweenInfo.new(0.28, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(0,420,0,160)}):Play()
end)
popupNo.MouseButton1Click:Connect(function() playSound(popupNo, SOUND_CLICK); TweenService:Create(popup, TweenInfo.new(0.18, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(0,0,0,0)}):Play(); task.wait(0.18); popup.Visible = false end)
popupYes.MouseButton1Click:Connect(function() playSound(popupYes, SOUND_POPUP); TweenService:Create(popup, TweenInfo.new(0.18, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(0,0,0,0)}):Play(); task.wait(0.18); screenGui:Destroy() end)

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

main.Visible = true
task.wait(0.05)
for _,v in pairs(sidebar:GetChildren()) do if v:IsA("TextButton") and v.Text == "THEME" then v:MouseButton1Click() end end
