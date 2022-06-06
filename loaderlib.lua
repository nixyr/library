local Nix = {}
--lib
function Nix.CreateWindow(loaderName)
local NixLoader = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Top = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local TopCorner = Instance.new("UICorner")
local UserFrame = Instance.new("Frame")
local CloseIcon = Instance.new("ImageLabel")
local UserIcon = Instance.new("ImageLabel")
local InfoFrame = Instance.new("Frame")
local UserCorner = Instance.new("UICorner")
local InfoCorner = Instance.new("UICorner")
local Close = Instance.new("ImageButton")
local CloseCorner = Instance.new("UICorner")
local LoaderTitle = Instance.new("TextLabel")
local Username = Instance.new("TextLabel")
local Executor = Instance.new("TextLabel")
local GameName = Instance.new("TextLabel")
local Execution = Instance.new("TextLabel")

--Locals
local GameTitle = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local IGN = game.Players.LocalPlayer.Name
local ExecutorName = (identifyexecutor and table.concat({ identifyexecutor() }, " ") or "Unknown")
local c=0
if isfile("kiwi.txt") then
c = tonumber(readfile("kiwi.txt")) + 1
writefile("kiwi.txt", tostring(c))
else
writefile("kiwi.txt", tostring(1))
c = 1
end
local TotalExecution = ("%s"):format(readfile("kiwi.txt"))

local TopBar = Top
local UserInputService = game:GetService("UserInputService")
local Camera = workspace:WaitForChild("Camera")

local DragMousePosition
local FramePosition
local Draggable = false
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	Draggable = true
	DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
	FramePosition = Vector2.new(Main.Position.X.Scale, Main.Position.Y.Scale)
	end
	end)
UserInputService.InputChanged:Connect(function(input)
	if Draggable == true then
	local NewPosition = FramePosition + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition) / Camera.ViewportSize)
	Main.Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)
	end
	end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	Draggable = false
	end
	end)

--
LoaderTitle = LoaderTitle or "Nixyr Loader V2"
--

--Start
NixLoader.Name = loaderName
NixLoader.Parent = game.CoreGui
NixLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "MainFrame"
Main.Parent = NixLoader
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Position = UDim2.new(0.048, 0, 0.075, 0)
Main.Size = UDim2.new(0, 250, 0, 150)

Top.Name = "TopBar"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Top.Size = UDim2.new(0, 250, 0, 30)
Top.ZIndex = 2

MainCorner.CornerRadius = UDim.new(0, 5)
MainCorner.Name = "Corner"
MainCorner.Parent = Main

TopCorner.CornerRadius = UDim.new(0, 5)
TopCorner.Name = "Corner"
TopCorner.Parent = Top

Close.Name = "Close"
Close.Parent = Top
Close.BackgroundColor3 = Color3.fromRGB(27, 45, 53)
Close.BackgroundTransparency = 1
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Image = ""
Close.ImageColor3 = Color3.fromRGB(255, 255, 255)
Close.Position = UDim2.new(0, 224, 0,5)
Close.Visible = true
Close.AutoButtonColor = false
Close.MouseButton1Click:Connect(function()
	Main:TweenSize(
		UDim2.new(0, 0, 0, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quart,
		.5,
		true
	)
--Destroy
	NixLoader:Destroy()
	end)

CloseIcon.Name = "CloseIcon"
CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseIcon.BackgroundTransparency = 1.000
CloseIcon.Parent = Close
CloseIcon.Image = "5969992570"

CloseCorner.CornerRadius = UDim.new(0,5)
CloseCorner.Name = "Corner"
CloseCorner.Parent = Close

LoaderTitle.Name = "Title"
LoaderTitle.Parent = Top
LoaderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderTitle.BackgroundTransparency = 1.000
LoaderTitle.TextSize = 12.000
LoaderTitle.Size = UDim2.new(0, 130, 0, 30)
LoaderTitle.Text = loaderName
LoaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoaderTitle.Font = Enum.Font.SciFi
LoaderTitle.TextXAlignment = Enum.TextXAlignment.Left
LoaderTitle.Position = UDim2.new(0, 0, 0, 0)

UserFrame.Name = "UserFrame"
UserFrame.Parent = Main
UserFrame.BackgroundColor3 = Color3.fromRGB(27, 45, 53)
UserFrame.Position = UDim2.new(0, 10, 0, 40)
UserFrame.Size = UDim2.new(0, 60, 0, 60)

UserIcon.Name = "Icon"
UserIcon.BackgroundColor3 = Color3.fromRGB(255,255,255)
UserIcon.BackgroundTransparency = 1.000
UserIcon.Parent = UserFrame
UserIcon.Size = UDim2.new(0, 60, 0, 60)
UserIcon.Image = "https://roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.userId.."&width=420&height=420&format=png"

Execution.Name = "Execution"
Execution.Parent = InfoFrame
Execution.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execution.BackgroundTransparency = 1.000
Execution.TextSize = 8.000
Execution.Size = UDim2.new(0, 130, 0, 30)
Execution.Text = "⭐ "..TotalExecution
Execution.TextColor3 = Color3.fromRGB(255, 255, 255)
Execution.Font = Enum.Font.SciFi
Execution.TextXAlignment = Enum.TextXAlignment.Left
Execution.Position = UDim2.new(0, 3, 0, -8)

UserCorner.CornerRadius = UDim.new(0, 5)
UserCorner.Name = "Corner"
UserCorner.Parent = UserFrame

InfoFrame.Name = "InfoFrame"
InfoFrame.Parent = Main
InfoFrame.BackgroundColor3 = Color3.fromRGB(27, 45, 53)
InfoFrame.Position = UDim2.new(0, 80, 0, 40)
InfoFrame.Size = UDim2.new(0, 160, 0, 60)

Username.Name = "Username"
Username.Parent = InfoFrame
Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Username.BackgroundTransparency = 1.000
Username.TextSize = 12.000
Username.Size = UDim2.new(0, 130, 0, 30)
Username.Text = "👤 "..IGN
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.Font = Enum.Font.SciFi
Username.TextXAlignment = Enum.TextXAlignment.Left
Username.Position = UDim2.new(0, 10, 0, 0)

Executor.Name = "Executor"
Executor.Parent = InfoFrame
Executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Executor.BackgroundTransparency = 1.000
Executor.TextSize = 12.000
Executor.Size = UDim2.new(0, 130, 0, 30)
Executor.Text = "💻 "..ExecutorName
Executor.TextColor3 = Color3.fromRGB(255, 255, 255)
Executor.Font = Enum.Font.SciFi
Executor.TextXAlignment = Enum.TextXAlignment.Left
Executor.Position = UDim2.new(0, 10, 0, 15)

GameName.Name = "GameName"
GameName.Parent = InfoFrame
GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameName.BackgroundTransparency = 1.000
GameName.TextSize = 12.000
GameName.Size = UDim2.new(0, 130, 0, 30)
GameName.Text = "🎮 "..GameTitle
GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
GameName.Font = Enum.Font.SciFi
GameName.TextXAlignment = Enum.TextXAlignment.Left
GameName.Position = UDim2.new(0, 10, 0, 30)

InfoCorner.CornerRadius = UDim.new(0,5)
InfoCorner.Name = "Corner"
InfoCorner.Parent = InfoFrame

function Nix:Button(btext,callback)
local Button = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")

--
callback = callback or function() end
--

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(27, 45, 53)
Button.Position = UDim2.new(0, 10, 0, 110)
Button.Font = Enum.Font.Antique
Button.Size = UDim2.new(0, 230, 0, 30)
Button.AutoButtonColor = false
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = btext
Button.TextSize = 15.000

ButtonCorner.CornerRadius = UDim.new(0,2)
ButtonCorner.Name = "Corner"
ButtonCorner.Parent = Button

local debounce = false
local debounce1 = false
Button.MouseButton1Click:Connect(function()
	if not debounce then
	debounce = true
	callback()
	wait(1)
	debounce = false
	end
	end)

Button.MouseButton1Up:Connect(function()
	Button:TweenSize(UDim2.new(0, 230, 0, 30),
		"InOut", "Quint", 0.18, true)
	game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(27, 45, 53),
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
	end)

Button.MouseButton1Down:Connect(function()
	if not debounce1 then
	debounce1 = true
	Button:TweenSize(UDim2.new(0, 224, 0, 30),
		"InOut", "Quint", 0.18, true)
	game.TweenService:Create(Button,TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(101, 168, 167),
		TextColor3 = Color3.fromRGB(0, 0, 0)
	}):Play()
	wait(1)
	debounce1 = false
	end
	end)

Button.MouseEnter:Connect(function()
	game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(27, 45, 53),
		TextColor3 = Color3.fromRGB(250,250,250)
	}):Play()
	end)

Button.MouseLeave:Connect(function()
	game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		 = Color3.fromRGB(27, 45, 53),
		TextColor3 = Color3.fromRGB(255, 255, 255)
	}):Play()
	end)

end
end
return Nix