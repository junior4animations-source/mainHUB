local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SOUND_CLICK = "rbxassetid://12221967"
local SOUND_WHOOSH = "rbxassetid://9118823104"

local function playSound(parent,id)
	local s = Instance.new("Sound",parent)
	s.SoundId=id
	s.Volume=0.7
	s:Play()
	game.Debris:AddItem(s,2)
end

local themes={
	dark={bg=Color3.fromRGB(25,25,25),content=Color3.fromRGB(35,35,35),sidebar=Color3.fromRGB(20,20,20),text=Color3.fromRGB(255,255,255)},
	white={bg=Color3.fromRGB(245,245,245),content=Color3.fromRGB(255,255,255),sidebar=Color3.fromRGB(230,230,230),text=Color3.fromRGB(25,25,25)},
	gray={bg=Color3.fromRGB(90,90,90),content=Color3.fromRGB(110,110,110),sidebar=Color3.fromRGB(70,70,70),text=Color3.fromRGB(255,255,255)}
}

local screenGui=Instance.new("ScreenGui")
screenGui.Name="Junior480Hub"
screenGui.ResetOnSpawn=false
screenGui.Parent=PlayerGui

local main=Instance.new("Frame",screenGui)
main.Size=UDim2.new(0,760,0,440)
main.Position=UDim2.new(0.5,-380,0.5,-220)
main.BackgroundColor3=themes.dark.bg
main.BorderSizePixel=0
main.Active=true
main.Draggable=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,14)
local mainStroke=Instance.new("UIStroke",main)
mainStroke.Thickness=2
mainStroke.Transparency=0.7

local top=Instance.new("Frame",main)
top.Size=UDim2.new(1,0,0,48)
top.BackgroundColor3=Color3.fromRGB(18,18,18)
Instance.new("UICorner",top).CornerRadius=UDim.new(0,14)
local title=Instance.new("TextLabel",top)
title.Size=UDim2.new(1,-140,1,0)
title.Position=UDim2.new(0,80,0,0)
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold
title.TextSize=20
title.Text="😭 Junior480's Hub"
title.TextColor3=themes.dark.text
title.TextXAlignment=Enum.TextXAlignment.Center

local sidebar=Instance.new("Frame",main)
sidebar.Size=UDim2.new(0,160,1,-48)
sidebar.Position=UDim2.new(0,0,0,48)
sidebar.BackgroundColor3=themes.dark.sidebar
Instance.new("UICorner",sidebar).CornerRadius=UDim.new(0,14)

local content=Instance.new("Frame",main)
content.Size=UDim2.new(1,-160,1,-48)
content.Position=UDim2.new(0,160,0,48)
content.BackgroundColor3=themes.dark.content
Instance.new("UICorner",content).CornerRadius=UDim.new(0,14)

local uiList=Instance.new("UIListLayout",sidebar)
uiList.Padding=UDim.new(0,6)
uiList.HorizontalAlignment=Enum.HorizontalAlignment.Center
uiList.VerticalAlignment=Enum.VerticalAlignment.Top

local categories={"Credits","ESP","Workspace","Troll","Scripts","Graphics","Theme","Others"}
local tabs={}

for _,cat in ipairs(categories) do
	local btn=Instance.new("TextButton",sidebar)
	btn.Size=UDim2.new(1,-20,0,36)
	btn.BackgroundColor3=themes.dark.bg
	Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)
	btn.Font=Enum.Font.GothamBold
	btn.Text=cat
	btn.TextColor3=themes.dark.text
	btn.TextSize=16
	local tab=Instance.new("ScrollingFrame",content)
	tab.Visible=false
	tab.Size=UDim2.new(1,0,1,0)
	tab.BackgroundTransparency=1
	tab.CanvasSize=UDim2.new(0,0,0,600)
	Instance.new("UIListLayout",tab).Padding=UDim.new(0,6)
	tabs[cat]=tab
	btn.MouseButton1Click:Connect(function()
		for _,t in pairs(tabs) do t.Visible=false end
		tab.Visible=true
		playSound(main,SOUND_CLICK)
	end)
end

tabs["Credits"].Visible=true
local cred=Instance.new("TextLabel",tabs["Credits"])
cred.Size=UDim2.new(1,-20,0,40)
cred.BackgroundTransparency=1
cred.Font=Enum.Font.GothamBold
cred.Text="Made by: Junior480 | Executor: Xeno"
cred.TextColor3=themes.dark.text
cred.TextSize=18

main.Visible=true
playSound(main,SOUND_WHOOSH)

UserInputService.InputBegan:Connect(function(input,gpe)
	if gpe then return end
	if input.KeyCode==Enum.KeyCode.RightControl then
		if not main.Visible then
			main.Visible=true
			playSound(main,SOUND_WHOOSH)
			TweenService:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-380,0.5,-220)}):Play()
		else
			playSound(main,SOUND_WHOOSH)
			TweenService:Create(main,TweenInfo.new(0.28,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-380,1.2,0)}):Play()
			task.delay(0.3,function() main.Visible=false end)
		end
	end
end)
