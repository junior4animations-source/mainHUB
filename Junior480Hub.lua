local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 400)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame)

local gradMain = Instance.new("UIGradient")
gradMain.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20,20,20))
}
gradMain.Rotation = 45
gradMain.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-80,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "😭 Junior480's Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

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

local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0,150,1,-40)
SideBar.Position = UDim2.new(0,0,0,40)
SideBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame
Instance.new("UICorner", SideBar)

local gradSide = Instance.new("UIGradient")
gradSide.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60,60,60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25,25,25))
}
gradSide.Rotation = -45
gradSide.Parent = SideBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1,-150,1,-40)
ContentFrame.Position = UDim2.new(0,150,0,40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame
Instance.new("UICorner", ContentFrame)

local gradContent = Instance.new("UIGradient")
gradContent.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50,50,50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,30))
}
gradContent.Rotation = 90
gradContent.Parent = ContentFrame

local Categories = {"CREDITS","ESP","WORKSPACE","TROLL","SCRIPTS","GRAPHICS","THEME","OTHERS"}
local SideButtons = {}

for i,cat in ipairs(Categories) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-20,0,35)
    btn.Position = UDim2.new(0,10,0,(i-1)*45+10)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.Text = cat
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(220,220,220)
    btn.Parent = SideBar
    Instance.new("UICorner", btn)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(70,70,70)
    stroke.Thickness = 1.5
    stroke.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.25,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(60,60,60)
        }):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.25,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(40,40,40)
        }):Play()
    end)

    SideButtons[cat] = btn
end

UserInputService.InputBegan:Connect(function(input,gp)
    if not gp and input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MainFrame.Visible = true
