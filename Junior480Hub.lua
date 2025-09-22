--[[ 
😭 Junior480's Hub 
Modern UI System 
Executor: Xeno 
]]

-- SERVICES
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Junior480Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

-------------------------------------------------------
-- LOADING SCREEN
-------------------------------------------------------
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Size = UDim2.new(1,0,1,0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)

local UIGradient = Instance.new("UIGradient", LoadingFrame)
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30,30,30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(60,60,60))
}
UIGradient.Rotation = 90

local Title = Instance.new("TextLabel", LoadingFrame)
Title.Size = UDim2.new(1,0,0,100)
Title.Position = UDim2.new(0,0,0.4,0)
Title.Text = "😭 Junior480's Hub"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.FredokaOne

local BarBack = Instance.new("Frame", LoadingFrame)
BarBack.Size = UDim2.new(0.6,0,0.03,0)
BarBack.Position = UDim2.new(0.2,0,0.55,0)
BarBack.BackgroundColor3 = Color3.fromRGB(40,40,40)
BarBack.BorderSizePixel = 0
local UICornerBar = Instance.new("UICorner", BarBack)

local BarFill = Instance.new("Frame", BarBack)
BarFill.Size = UDim2.new(0,0,1,0)
BarFill.BackgroundColor3 = Color3.fromRGB(0,170,255)
BarFill.BorderSizePixel = 0
local UICornerFill = Instance.new("UICorner", BarFill)

-- Barra animada
TweenService:Create(BarFill, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,1,0)}):Play()

task.wait(4)
LoadingFrame:Destroy()

-------------------------------------------------------
-- MAIN HUB
-------------------------------------------------------
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0,600,0,400)
MainFrame.Position = UDim2.new(0.5,-300,0.5,-200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
MainFrame.Active = true
MainFrame.Draggable = true

local UICornerMain = Instance.new("UICorner", MainFrame)
local UIStrokeMain = Instance.new("UIStroke", MainFrame)
UIStrokeMain.Thickness = 2
UIStrokeMain.Color = Color3.fromRGB(0,170,255)

local GradientMain = Instance.new("UIGradient", MainFrame)
GradientMain.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,20)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(45,45,45))
}
GradientMain.Rotation = 90

-- TITLE
local TitleHub = Instance.new("TextLabel", MainFrame)
TitleHub.Size = UDim2.new(1,0,0,40)
TitleHub.Text = "😭 Junior480's Hub"
TitleHub.BackgroundTransparency = 1
TitleHub.TextColor3 = Color3.fromRGB(255,255,255)
TitleHub.Font = Enum.Font.FredokaOne
TitleHub.TextScaled = true

-------------------------------------------------------
-- SIDEBAR (CATEGORIAS)
-------------------------------------------------------
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Size = UDim2.new(0,150,1,-40)
SideBar.Position = UDim2.new(0,0,0,40)
SideBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
local UICornerSide = Instance.new("UICorner", SideBar)

-- Função para criar botões de categoria
local function CreateCategoryButton(name, order)
	local Btn = Instance.new("TextButton", SideBar)
	Btn.Size = UDim2.new(1,0,0,35)
	Btn.Position = UDim2.new(0,0,0,(order-1)*40)
	Btn.Text = name
	Btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	Btn.TextColor3 = Color3.fromRGB(255,255,255)
	Btn.Font = Enum.Font.GothamBold
	Btn.TextSize = 14
	local UICornerBtn = Instance.new("UICorner", Btn)
	local UIStrokeBtn = Instance.new("UIStroke", Btn)
	UIStrokeBtn.Color = Color3.fromRGB(80,80,80)
	
	-- Hover anim
	Btn.MouseEnter:Connect(function()
		TweenService:Create(Btn, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {BackgroundColor3 = Color3.fromRGB(0,170,255)}):Play()
	end)
	Btn.MouseLeave:Connect(function()
		TweenService:Create(Btn, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
	end)
	
	return Btn
end

-------------------------------------------------------
-- CONTENT AREA
-------------------------------------------------------
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1,-150,1,-40)
ContentFrame.Position = UDim2.new(0,150,0,40)
ContentFrame.BackgroundTransparency = 1

-- Guardar abas
local Tabs = {}

local function CreateTab(name)
	local Tab = Instance.new("ScrollingFrame", ContentFrame)
	Tab.Size = UDim2.new(1,0,1,0)
	Tab.Visible = false
	Tab.ScrollBarThickness = 4
	Tab.CanvasSize = UDim2.new(0,0,0,600)
	Tabs[name] = Tab
	return Tab
end

-------------------------------------------------------
-- CATEGORIAS (vou deixar pronto pra você)
-------------------------------------------------------
local CreditsTab = CreateTab("Credits")
local ESPTab = CreateTab("ESP")
local WorkspaceTab = CreateTab("Workspace")
local TrollTab = CreateTab("Troll")
local ScriptsTab = CreateTab("Scripts")
local GraphicsTab = CreateTab("Graphics")
local ThemeTab = CreateTab("Theme")
local OthersTab = CreateTab("Others")

-- Criar botões da sidebar
local categories = {"Credits","ESP","Workspace","Troll","Scripts","Graphics","Theme","Others"}
for i,cat in ipairs(categories) do
	local Btn = CreateCategoryButton(cat,i)
	Btn.MouseButton1Click:Connect(function()
		for _,tab in pairs(Tabs) do tab.Visible = false end
		Tabs[cat].Visible = true
	end)
end

-------------------------------------------------------
-- EXEMPLO DE BOTÃO FUNCIONAL (TP Player)
-------------------------------------------------------
local TpBox = Instance.new("TextBox", WorkspaceTab)
TpBox.Size = UDim2.new(0.6,0,0,30)
TpBox.Position = UDim2.new(0.2,0,0,20)
TpBox.PlaceholderText = "Player Name"
TpBox.TextColor3 = Color3.fromRGB(255,255,255)
TpBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
local UICornerTp = Instance.new("UICorner", TpBox)

local TpBtn = Instance.new("TextButton", WorkspaceTab)
TpBtn.Size = UDim2.new(0.6,0,0,30)
TpBtn.Position = UDim2.new(0.2,0,0,60)
TpBtn.Text = "TP to Player"
TpBtn.TextColor3 = Color3.fromRGB(255,255,255)
TpBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
local UICornerTpBtn = Instance.new("UICorner", TpBtn)

TpBtn.MouseButton1Click:Connect(function()
	local target = Players:FindFirstChild(TpBox.Text)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		player.Character:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0,3,0))
	end
end)

-------------------------------------------------------
-- DEIXAR O RESTO DAS CATEGORIAS IGUAIS AO TP 
-- (cada botão vai no seu tab)
-------------------------------------------------------

-- MOSTRAR DEFAULT
CreditsTab.Visible = true

-------------------------------------------------------
-- TECLA PARA ESCONDER HUB
-------------------------------------------------------
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		MainFrame.Visible = not MainFrame.Visible
	end
end)
