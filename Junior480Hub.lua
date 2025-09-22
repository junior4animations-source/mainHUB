local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SOUND_CLICK = "rbxassetid://12221967"
local SOUND_WHOOSH = "rbxassetid://9118823104"

local function playSound(parent,id)
	local s=Instance.new("Sound",parent)
	s.SoundId=id
	s.Volume=0.6
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

-- botão sair
local closeBtn=Instance.new("TextButton",top)
closeBtn.Size=UDim2.new(0,40,0,40)
closeBtn.Position=UDim2.new(1,-44,0,4)
closeBtn.BackgroundColor3=Color3.fromRGB(200,50,50)
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(1,0)
closeBtn.Text="❌"
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=20
closeBtn.TextColor3=Color3.new(1,1,1)

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

local function makeButton(parent,text,callback)
	local b=Instance.new("TextButton",parent)
	b.Size=UDim2.new(1,-20,0,36)
	b.BackgroundColor3=Color3.fromRGB(50,50,50)
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
	b.Font=Enum.Font.GothamBold
	b.Text=text
	b.TextColor3=Color3.new(1,1,1)
	b.TextSize=16
	b.MouseEnter:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.25,Enum.EasingStyle.Cubic),{BackgroundColor3=Color3.fromRGB(80,80,80)}):Play()
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.25,Enum.EasingStyle.Cubic),{BackgroundColor3=Color3.fromRGB(50,50,50)}):Play()
	end)
	b.MouseButton1Click:Connect(function()
		playSound(main,SOUND_CLICK)
		callback()
	end)
	return b
end

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
	tab.CanvasSize=UDim2.new(0,0,0,800)
	Instance.new("UIListLayout",tab).Padding=UDim.new(0,6)
	tabs[cat]=tab
	btn.MouseButton1Click:Connect(function()
		for _,t in pairs(tabs) do t.Visible=false end
		tab.Visible=true
		playSound(main,SOUND_CLICK)
	end)
end

tabs["Credits"].Visible=true
makeButton(tabs["Credits"],"Made by: Junior480",function() end)
makeButton(tabs["Credits"],"Executor: Xeno",function() end)

-- ESP
makeButton(tabs["ESP"],"ESP PLAYERS",function() print("ESP Players") end)
makeButton(tabs["ESP"],"ESP NAMES",function() print("ESP Names") end)
makeButton(tabs["ESP"],"ESP PARTS",function() print("ESP Parts") end)

-- Workspace
makeButton(tabs["Workspace"],"Fly Player",function() print("Fly toggle") end)
makeButton(tabs["Workspace"],"Fling",function() print("Fling toggle") end)
makeButton(tabs["Workspace"],"TP Player",function()
	local target=Players:FindFirstChild("Player")
	if target and target.Character and LocalPlayer.Character then
		LocalPlayer.Character:MoveTo(target.Character:GetPivot().p)
	end
end)

-- Scripts
makeButton(tabs["Scripts"],"Infinite Yield",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
makeButton(tabs["Scripts"],"Auto Clicker GUI",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/The-telligence/main/MC%20KSystem%202"))()
end)
makeButton(tabs["Scripts"],"GhostHub",function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end)

-- Graphics
makeButton(tabs["Graphics"],"RTX",function() print("RTX toggle") end)
makeButton(tabs["Graphics"],"Low Graphics",function() print("Low graphics") end)
makeButton(tabs["Graphics"],"Medium Graphics",function() print("Medium graphics") end)
makeButton(tabs["Graphics"],"High Graphics",function() print("High graphics") end)

-- Theme
makeButton(tabs["Theme"],"Dark Mode",function()
	main.BackgroundColor3=themes.dark.bg
	sidebar.BackgroundColor3=themes.dark.sidebar
	content.BackgroundColor3=themes.dark.content
	title.TextColor3=themes.dark.text
end)
makeButton(tabs["Theme"],"White Mode",function()
	main.BackgroundColor3=themes.white.bg
	sidebar.BackgroundColor3=themes.white.sidebar
	content.BackgroundColor3=themes.white.content
	title.TextColor3=themes.white.text
end)
makeButton(tabs["Theme"],"Gray Mode",function()
	main.BackgroundColor3=themes.gray.bg
	sidebar.BackgroundColor3=themes.gray.sidebar
	content.BackgroundColor3=themes.gray.content
	title.TextColor3=themes.gray.text
end)

-- Others
for i=1,5 do
	makeButton(tabs["Others"],"Extra "..i,function() print("Extra "..i) end)
end

-- popup sair
local popup=Instance.new("Frame",screenGui)
popup.Size=UDim2.new(0,260,0,140)
popup.Position=UDim2.new(0.5,-130,0.5,-70)
popup.BackgroundColor3=Color3.fromRGB(40,40,40)
Instance.new("UICorner",popup).CornerRadius=UDim.new(0,12)
popup.Visible=false
local txt=Instance.new("TextLabel",popup)
txt.Size=UDim2.new(1,0,0.5,0)
txt.BackgroundTransparency=1
txt.Font=Enum.Font.GothamBold
txt.Text="Tem certeza que quer sair?"
txt.TextSize=18
txt.TextColor3=Color3.new(1,1,1)
local yes=makeButton(popup,"Sim",function() screenGui:Destroy() end)
yes.Position=UDim2.new(0,10,0.6,0)
yes.Size=UDim2.new(0.5,-15,0.3,0)
local no=makeButton(popup,"Não",function() popup.Visible=false end)
no.Position=UDim2.new(0.5,5,0.6,0)
no.Size=UDim2.new(0.5,-15,0.3,0)

closeBtn.MouseButton1Click:Connect(function()
	popup.Visible=true
end)

-- toggle com RightControl
UserInputService.InputBegan:Connect(function(input,gpe)
	if gpe then return end
	if input.KeyCode==Enum.KeyCode.RightControl then
		if main.Visible then
			playSound(main,SOUND_WHOOSH)
			main.Visible=false
		else
			main.Visible=true
			playSound(main,SOUND_WHOOSH)
		end
	end
end)
