local localPlayer = game.Players.LocalPlayer
local userInputService = game:GetService('UserInputService')
local camera

workspace:GetPropertyChangedSignal('CurrentCamera'):Connect(function(Camera)
	camera = Camera
end)

camera = workspace.CurrentCamera

local Homo = {}

function Homo.CreateWindow()
	local Library = {
		Toggles = {},
		Created = {}
	}
	
	warn("homohub loaded wer love homohacks!!")
	
	local blur = Instance.new('BlurEffect')
	blur.Size = 0
	blur.Parent = camera
	local homohub = Instance.new("ScreenGui")
	local Window = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	homohub.Name = [["homohub" - :nerd:]]
	homohub.Parent = game.Players.LocalPlayer.PlayerGui
	homohub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	homohub.Enabled = false

	Window.Name = "Window"
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.Parent = homohub
	Window.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Window.BackgroundTransparency = 0.250
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.Size = UDim2.new(0, 400, 0, 300)
	userInputService.InputBegan:Connect(function(inputCode, focused)
		if not focused then
			local keyCode = inputCode.KeyCode.Name
			if keyCode == 'Y' then
				homohub.Enabled = not homohub.Enabled
				
				local Leave = Instance.new'Sound'
				Leave.SoundId = 'rbxassetid://4571259077'
				Leave.Volume = 0.1
				Leave.Parent = homohub
				Leave:Play()

				Window.AnchorPoint = Vector2.new()
				Window.Position = UDim2.new()
				
				if not homohub.Enabled then 
					game:GetService('TweenService'):Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quint), {
						Size = 0
					}):Play()
					for Index, GUIObject in Library.Created do
						local did, didnt = pcall(function()
							return GUIObject.Visible
						end)

						if did then
							GUIObject.Visible = false
						end
					end
				else				
					game:GetService('TweenService'):Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quint), {
						Size = 20
					}):Play()
					Window.AnchorPoint = Vector2.new(0.5, 0.5)
					game:GetService('TweenService'):Create(Window, TweenInfo.new(1, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()				

					for Index, GUIObject in Library.Created do
						local did, didnt = pcall(function()
							return GUIObject.Visible
						end)
						if not homohub.Enabled then break end
						if did then
							local Hover = Instance.new'Sound'
							Hover.SoundId = 'rbxassetid://720166642'
							Hover.Parent = game:GetService('SoundService')
							Hover.Volume = .0075
							Hover:Play()
							GUIObject.Visible = true
						end
						task.wait(.025)
					end
				end
			end
		end
	end)

 	UICorner.Parent = Window
	
	local Holder = Instance.new('ScrollingFrame')
	Holder.ScrollBarThickness = 0
	Holder.ScrollBarImageTransparency = 1
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	Holder.Name = "Holder"
	Holder.Parent = Window
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.03, 0, 0.06, 0)
	Holder.Size = UDim2.new(0, 376, 0, 260)

	UIGridLayout.Parent = Holder
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 3, 0, 5)
	UIGridLayout.CellSize = UDim2.new(0, 60, 0, 30)
	
	function Library.CreateButton(Flag, Name, Callback, RightClickCallback)
		assert(type(Callback) == 'function', 'Callback was not a function!')
		
		local Button = Instance.new("TextLabel")
		table.insert(Library.Created, Button)
		local UICorner = Instance.new("UICorner")
		local TextStroke = Instance.new('UIStroke')
		local BorderStroke = Instance.new('UIStroke')
		
		Button.Name = Name
		Button.Text = Name
		Button.TextScaled = true
		Button.Parent = Holder
		Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0, 104, 0, 31)
		Button.Font = Enum.Font.SourceSans
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextSize = 14.000
		Button.ZIndex = math.huge

		TextStroke.Parent = Button
		TextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		TextStroke.Color = Color3.fromRGB(127.5, 0, 0)

		BorderStroke.Parent = Button
		BorderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		BorderStroke.Color = Color3.fromRGB(127.5, 0, 0)
		BorderStroke.Thickness = 2
		
		Button.InputBegan:Connect(function(Input : InputObject)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				local Click = Instance.new'Sound'
				Click.SoundId = 'rbxassetid://156286438'
				Click.Parent = game:GetService('SoundService')
				Click.Volume = .05
				game:GetService('ContentProvider'):PreloadAsync({
					Click
				})
				Click:Play()
				task.delay(Click.TimeLength, function()
					Click:Destroy()
				end)
				task.spawn(Callback)
			elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and type(RightClickCallback) == 'function' then
				task.spawn(RightClickCallback)
				local Click = Instance.new'Sound'
				Click.SoundId = 'rbxassetid://156286438'
				Click.Parent = game:GetService('SoundService')
				Click.Volume = .05
				game:GetService('ContentProvider'):PreloadAsync({
					Click
				})
				Click:Play()
				task.delay(Click.TimeLength, function()
					Click:Destroy()
				end)
			end
		end)
		
		Button.MouseEnter:Connect(function()
			task.spawn(function()
				local Hover = Instance.new'Sound'
				Hover.SoundId = 'rbxassetid://720166642'
				Hover.Parent = Button
				Hover.Volume = .01
				Hover:Play()
				game:GetService('TweenService'):Create(Button, TweenInfo.new(.5), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
			end)
		end)
		
		Button.MouseLeave:Connect(function()
			game:GetService('TweenService'):Create(Button, TweenInfo.new(.5), {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
		end)
		
		--UICorner.Parent = Button
		
		for Index, GUIObject in Library.Created do
			local did, didnt = pcall(function()
				return GUIObject.Visible
			end)

			if did then
				GUIObject.Visible = false
			end
		end
		
		return Button
	end
	
	function Library.CreateToggle(Flag, Name, Callback)
		assert(type(Callback) == 'function', 'Callback was not a function!')
		assert(Library.Toggles[Flag] == nil, 'Flag was already found')
		
		Library.Toggles[Flag] = false

		local Toggle = Instance.new("TextLabel")
		table.insert(Library.Created, Toggle)
		local UICorner = Instance.new("UICorner")
		local TextStroke = Instance.new('UIStroke')
		local BorderStroke = Instance.new('UIStroke')

		Toggle.Name = Name
		Toggle.Text = Name .. ': ' .. tostring(Library.Toggles[Flag])
		Toggle.TextScaled = true
		Toggle.Parent = Holder
		Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderSizePixel = 0
		Toggle.Size = UDim2.new(0, 104, 0, 31)
		Toggle.Font = Enum.Font.SourceSans
		Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.TextSize = 14.000
		Toggle.ZIndex = math.huge

		TextStroke.Parent = Toggle
		TextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		TextStroke.Color = Color3.fromRGB(127.5, 0, 0)

		BorderStroke.Parent = Toggle
		BorderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		BorderStroke.Color = Color3.fromRGB(127.5, 0, 0)
		BorderStroke.Thickness = 2

		Toggle.InputBegan:Connect(function(Input : InputObject)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Library.Toggles[Flag] = not Library.Toggles[Flag]
				local function bals()
					local Click = Instance.new'Sound'
					Click.SoundId = 'rbxassetid://156286438'
					Click.Parent = Toggle
					Click.Volume = .05
					game:GetService('ContentProvider'):PreloadAsync({
						Click
					})
					Click:Play()
					task.delay(Click.TimeLength, function()
						Click:Destroy()
					end)
					Callback(Library.Toggles[Flag])
				end
				task.spawn(bals)
			end
		end)

		--UICorner.Parent = Toggle
		
		Toggle.MouseEnter:Connect(function()
			task.spawn(function()
				local Hover = Instance.new'Sound'
				Hover.SoundId = 'rbxassetid://720166642'
				Hover.Parent = Toggle
				Hover.Volume = .01
				Hover:Play()
				game:GetService('TweenService'):Create(Toggle, TweenInfo.new(.5), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
			end)
		end)

		Toggle.MouseLeave:Connect(function()
			game:GetService('TweenService'):Create(Toggle, TweenInfo.new(.5), {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
		end)

		game:GetService('RunService'):BindToRenderStep(Flag, 999, function()
			Toggle.Text = Name .. ': ' .. tostring(Library.Toggles[Flag])
		end)
		
		return Toggle
	end
	
	return Library
end

return Homo
