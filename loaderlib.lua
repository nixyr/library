local nix = {}

function Nixyr:CreateWindow(loaderName)
  --Main GUI
  local NixLoader = Instance.new("ScreenGui")
  local Main = Instance.new("Frame")
  local Top = Instance.new("Frame")
  local MainCorner = Instance.new("UICorner")
  local TopCorner = Instance.new("UICorner")
  local LoaderTitle = Instance.new("TextLabel")
  local Close = Instance.new("TextButton")
  local CloseCorner = Instance.new("UICorner")

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
  Close.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
  Close.BackgroundTransparency = 0
  Close.Size = UDim2.new(0, 20, 0, 20)
  Close.Text = "X"
  Close.TextSize = 10.000
  Close.TextColor3 = Color3.fromRGB(255, 255, 255)
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
  
  CloseCorner.CornerRadius = UDim.new(0,5)
  CloseCorner.Name = "Corner"
  CloseCorner.Parent = Close

  LoaderTitle.Name = "Title"
  LoaderTitle.Parent = Main
  LoaderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  LoaderTitle.BackgroundTransparency = 1.000
  LoaderTitle.TextSize = 20.000
  LoaderTitle.Size = UDim2.new(0, 213, 0, 30)
  LoaderTitle.Text = loaderName
  LoaderTitle.TextColor3 = Color3.fromRGB(255, 255,  255)
  LoaderTitle.Font = Enum.Font.GothamBold
  LoaderTitle.Position = UDim2.new(0, 17, 0, 50)
  
  function Nixyr:Button(btext,callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    
    --
    btext = btext or "TextButton"
    callback = callback or function()  end
    --
    
    Button.Name = "Button"
    Button.Parent = Main
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Position = UDim2.new(0,  20, 0, 100)
    Button.Size = UDim2.new(0, 230, 0, 30)
    Button.AutoButtonColor = false
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = btext or "textbtn"
    Button.TextSize = 10.000
    
    ButtonCorner.CornerRadius = UDim(0,5)
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
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
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
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(250,250,250)
      }):Play()
  end)

    Button.MouseLeave:Connect(function()
      game.TweenService:Create(Button, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(180, 180, 180)
      }):Play()
    end)
    
  end
  
end
return nix