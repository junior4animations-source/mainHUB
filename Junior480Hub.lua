-- Gui Principal
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 400)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame)

-- TopBar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "😭 Junior480's Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Botão fechar
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,40,1,0)
CloseBtn.Position = UDim2.new(1,-40,0,0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.Parent = TopBar

Instance.new("UICorner", CloseBtn)

-- Sidebar
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0,150,1,-40)
SideBar.Position = UDim2.new(0,0,0,40)
SideBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

-- Conteúdo
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1,-150,1,-40)
ContentFrame.Position = UDim2.new(0,150,0,40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- Função criar botões laterais
local Categories = {"CREDITS","ESP","WORKSPACE","TROLL","SCRIPTS","GRAPHICS","THEME","OTHERS"}
local SideButtons = {}
local CategoryFrames = {}

for i,cat in ipairs(Categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,40)
    btn.Position = UDim2.new(0,0,0,(i-1)*40)
    btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
    btn.Text = cat
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(200,200,200)
    btn.Parent = SideBar
    SideButtons[cat] = btn

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.Parent = ContentFrame
    CategoryFrames[cat] = frame

    btn.MouseButton1Click:Connect(function()
        for _,f in pairs(CategoryFrames) do f.Visible = false end
        for _,b in pairs(SideButtons) do
            TweenService:Create(b, TweenInfo.new(0.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(25,25,25)}):Play()
        end
        frame.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
    end)
end

-- Exemplo Theme
local ThemeFrame = CategoryFrames["THEME"]

local function makeThemeButton(txt,color,pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9,0,0,40)
    b.Position = UDim2.new(0.05,0,0,pos*50)
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.Text = txt
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Parent = ThemeFrame
    Instance.new("UICorner",b)
    b.MouseButton1Click:Connect(function()
        for _,obj in pairs({MainFrame,TopBar,SideBar,ContentFrame}) do
            obj.BackgroundColor3 = color
        end
    end)
end

makeThemeButton("Dark Mode", Color3.fromRGB(30,30,30), 0)
makeThemeButton("White Mode", Color3.fromRGB(240,240,240), 1)
makeThemeButton("Gray Mode", Color3.fromRGB(120,120,120), 2)

-- Inicial
SideButtons["THEME"].MouseButton1Click:Connect(function() end)
SideButtons["THEME"]:MouseButton1Click()
MainFrame.Visible = true

-- Toggle CTRL
UserInputService.InputBegan:Connect(function(input,gp)
    if not gp and input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Botão sair
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
