return function(Version: string)
	local Cmdr = Instance.new("ScreenGui")
	Cmdr.DisplayOrder = 1000
	Cmdr.Name = "Cmdr"
	Cmdr.ResetOnSpawn = false
	Cmdr.AutoLocalize = false

	local Frame = Instance.new("Frame")
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Name = "Frame"
	Frame.Position = UDim2.new(0.025, 0, 0, 25)
	Frame.Selectable = false
	Frame.Size = UDim2.new(0.95, 0, 0, 0)
	Frame.Visible = false
	Frame.AutomaticSize = Enum.AutomaticSize.Y
	Frame.Parent = Cmdr

	local LineFrame = Instance.new("ScrollingFrame")
	LineFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame.BackgroundTransparency = 0.4
	LineFrame.BorderSizePixel = 0
	LineFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	LineFrame.Name = "Frame"
	LineFrame.Position = UDim2.new(0.025, 0, 0, 25)
	LineFrame.ScrollBarThickness = 6
	LineFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	LineFrame.Selectable = false
	LineFrame.Size = UDim2.new(1, 0, 0, 0)
	LineFrame.Visible = true
	LineFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	LineFrame.Parent = Frame

	local Corner_LineFrame = Instance.new("UICorner")
	Corner_LineFrame.CornerRadius = UDim.new(0, 8)
	Corner_LineFrame.Parent = LineFrame

	local UIListLayout_LineFrame = Instance.new("UIListLayout")
	UIListLayout_LineFrame.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_LineFrame.Parent = LineFrame

	local UIPadding_LineFrame = Instance.new("UIPadding")
	UIPadding_LineFrame.PaddingBottom = UDim.new(0, 10)
	UIPadding_LineFrame.PaddingLeft = UDim.new(0, 10)
	UIPadding_LineFrame.PaddingRight = UDim.new(0, 10)
	UIPadding_LineFrame.PaddingTop = UDim.new(0, 10)
	UIPadding_LineFrame.Parent = LineFrame

	local VersionLine = Instance.new("TextLabel")
	VersionLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	VersionLine.BackgroundTransparency = 1
	VersionLine.LayoutOrder = -1
	VersionLine.Font = Enum.Font.Code
	VersionLine.Text = `CmdrMax v{Version}`
	VersionLine.Name = "VersionLine"
	VersionLine.Size = UDim2.new(1, 0, 0, 20)
	VersionLine.AutomaticSize = Enum.AutomaticSize.Y
	VersionLine.TextColor3 = Color3.fromRGB(255, 255, 255)
	VersionLine.TextSize = 14
	VersionLine.TextXAlignment = Enum.TextXAlignment.Left
	VersionLine.Parent = LineFrame

	local Autocomplete = Instance.new("ScrollingFrame")
	Autocomplete.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Autocomplete.BackgroundTransparency = 0.4
	Autocomplete.BorderSizePixel = 0
	Autocomplete.CanvasSize = UDim2.new(0, 0, 0, 0)
	Autocomplete.Name = "Autocomplete"
	Autocomplete.Position = UDim2.new(0, 167, 0, 75)
	Autocomplete.ScrollBarThickness = 6
	Autocomplete.ScrollingDirection = Enum.ScrollingDirection.Y
	Autocomplete.Selectable = false
	Autocomplete.Size = UDim2.new(0, 200, 0, 200)
	Autocomplete.Visible = false
	Autocomplete.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Autocomplete.Parent = Cmdr

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout.Parent = Frame

	local Line = Instance.new("TextBox")
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BackgroundTransparency = 1
	Line.Font = Enum.Font.Code
	Line.Name = "Line"
	Line.Size = UDim2.new(1, 0, 0, 20)
	Line.AutomaticSize = Enum.AutomaticSize.Y
	Line.TextColor3 = Color3.fromRGB(255, 255, 255)
	Line.TextSize = 14
	Line.TextXAlignment = Enum.TextXAlignment.Left
	Line.TextEditable = false
	Line.ClearTextOnFocus = false
	Line.Parent = Frame

	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingBottom = UDim.new(0, 0)
	UIPadding.PaddingLeft = UDim.new(0, 0)
	UIPadding.PaddingRight = UDim.new(0, 0)
	UIPadding.PaddingTop = UDim.new(0, 0)
	UIPadding.Parent = Frame

	local User = Instance.new("Frame")
	User.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	User.BackgroundTransparency = 0.4
	User.LayoutOrder = 999999999
	User.BorderSizePixel = 0
	User.Name = "User"
	User.Selectable = false
	User.Size = UDim2.new(1, 0, 0, 40)
	User.Visible = true
	User.Parent = Frame

	local Corner_User = Instance.new("UICorner")
	Corner_User.CornerRadius = UDim.new(0, 8)
	Corner_User.Parent = User

	local UIPadding_User = Instance.new("UIPadding")
	UIPadding_User.PaddingBottom = UDim.new(0, 10)
	UIPadding_User.PaddingLeft = UDim.new(0, 10)
	UIPadding_User.PaddingRight = UDim.new(0, 10)
	UIPadding_User.PaddingTop = UDim.new(0, 10)
	UIPadding_User.Parent = User

	local Entry = Instance.new("Frame")
	Entry.BackgroundTransparency = 1
	Entry.Name = "Entry"
	Entry.Size = UDim2.new(1, 0, 0, 20)
	Entry.Parent = User

	local UIListLayout2 = Instance.new("UIListLayout")
	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout2.Parent = Autocomplete

	local UICorner_AC = Instance.new("UICorner")
	UICorner_AC.CornerRadius = UDim.new(0, 8)
	UICorner_AC.Parent = Autocomplete

	local Title = Instance.new("Frame")
	Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Title.BackgroundTransparency = 0
	Title.BorderSizePixel = 0
	Title.LayoutOrder = -2
	Title.Name = "Title"
	Title.Size = UDim2.new(1, 0, 0, 40)
	Title.Parent = Autocomplete

	local UiCorner_Title = Instance.new("UICorner")
	UiCorner_Title.CornerRadius = UDim.new(0, 8)
	UiCorner_Title.Parent = Title

	local HideCorner = Instance.new("Frame")
	HideCorner.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	HideCorner.BorderSizePixel = 0
	HideCorner.Name = "HideCorner"
	HideCorner.AnchorPoint = Vector2.new(0, 1)
	HideCorner.Position = UDim2.new(0, 0, 1, 0)
	HideCorner.Size = UDim2.new(1, 0, .2, 0)
	HideCorner.Parent = Title

	local Frame_AC = Instance.new("Frame")
	Frame_AC.BackgroundTransparency = 1
	Frame_AC.Name = "Frame"
	Frame_AC.Size = UDim2.new(1, 0, 1, 0)
	Frame_AC.Parent = Title

	local UIPadding_Frame_AC = Instance.new("UIPadding")
	UIPadding_Frame_AC.PaddingLeft = UDim.new(0, 10)
	UIPadding_Frame_AC.Parent = Frame_AC
	
	local Field = Instance.new("TextLabel")
	Field.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Field.BackgroundTransparency = 1
	Field.Font = Enum.Font.SourceSansBold
	Field.Name = "Field"
	Field.Size = UDim2.new(0, 37, 1, 0)
	Field.Text = "from"
	Field.TextColor3 = Color3.fromRGB(255, 255, 255)
	Field.TextSize = 20
	Field.TextXAlignment = Enum.TextXAlignment.Left
	Field.Parent = Frame_AC

	local Description = Instance.new("Frame")
	Description.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Description.BackgroundTransparency = 0
	Description.BorderSizePixel = 0
	Description.LayoutOrder = -1
	Description.Name = "Description"
	Description.Size = UDim2.new(1, 0, 0, 20)
	Description.Parent = Autocomplete

	local TextButton = Instance.new("TextButton")
	TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton.BackgroundTransparency = 1
	TextButton.BorderSizePixel = 0
	TextButton.Font = Enum.Font.Code
	TextButton.Size = UDim2.new(1, 0, 0, 30)
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 14
	TextButton.TextXAlignment = Enum.TextXAlignment.Left
	TextButton.Parent = Autocomplete

	local UICorner_TB = Instance.new("UICorner")
	UICorner_TB.CornerRadius = UDim.new(0, 8)
	UICorner_TB.Parent = TextButton

	local UIListLayout3 = Instance.new("UIListLayout")
	UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout3.Padding = UDim.new(0, 7)
	UIListLayout3.Parent = Entry

	local TextBox = Instance.new("TextBox")
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1
	TextBox.ClearTextOnFocus = false
	TextBox.Font = Enum.Font.Code
	TextBox.LayoutOrder = 999999999
	TextBox.Position = UDim2.new(0, 140, 0, 0)
	TextBox.Size = UDim2.new(1, 0, 0, 20)
	TextBox.Text = "x"
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 14
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.Selectable = false
	TextBox.Parent = Entry

	local TextLabel = Instance.new("TextLabel")
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Font = Enum.Font.Code
	TextLabel.Size = UDim2.new(0, 0, 0, 20)
	TextLabel.AutomaticSize = Enum.AutomaticSize.X
	TextLabel.Text = ""
	TextLabel.TextColor3 = Color3.fromRGB(255, 223, 93)
	TextLabel.TextSize = 14
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.Parent = Entry

	local Label = Instance.new("TextLabel")
	Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Label.BackgroundTransparency = 1
	Label.Font = Enum.Font.SourceSans
	Label.Name = "Label"
	Label.Size = UDim2.new(1, 0, 1, 0)
	Label.Text = "The players to teleport. The players to teleport. The players to teleport. The players to teleport. "
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)
	Label.TextSize = 16
	Label.TextWrapped = true
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.TextYAlignment = Enum.TextYAlignment.Top
	Label.Parent = Description

	local UIPadding3 = Instance.new("UIPadding")
	UIPadding3.PaddingBottom = UDim.new(0, 10)
	UIPadding3.PaddingLeft = UDim.new(0, 10)
	UIPadding3.PaddingRight = UDim.new(0, 10)
	UIPadding3.Parent = Description

	local Typed = Instance.new("TextLabel")
	Typed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Typed.BackgroundTransparency = 1
	Typed.Font = Enum.Font.Code
	Typed.Name = "Typed"
	Typed.Size = UDim2.new(1, 0, 1, 0)
	Typed.Text = "Lab"
	Typed.TextColor3 = Color3.fromRGB(131, 222, 255)
	Typed.TextSize = 14
	Typed.TextXAlignment = Enum.TextXAlignment.Left
	Typed.Parent = TextButton

	local UIPadding4 = Instance.new("UIPadding")
	UIPadding4.PaddingLeft = UDim.new(0, 10)
	UIPadding4.Parent = TextButton

	local Suggest = Instance.new("TextLabel")
	Suggest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Suggest.BackgroundTransparency = 1
	Suggest.Font = Enum.Font.Code
	Suggest.Name = "Suggest"
	Suggest.Size = UDim2.new(1, 0, 1, 0)
	Suggest.Text = "   el"
	Suggest.TextColor3 = Color3.fromRGB(255, 255, 255)
	Suggest.TextSize = 14
	Suggest.TextXAlignment = Enum.TextXAlignment.Left
	Suggest.Parent = TextButton

	local Type = Instance.new("TextLabel")
	Type.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Type.BackgroundTransparency = 1
	Type.BorderColor3 = Color3.fromRGB(255, 153, 153)
	Type.Font = Enum.Font.SourceSans
	Type.Name = "Type"
	Type.Position = UDim2.new(1, 0, 0, 0)
	Type.Size = UDim2.new(0, 0, 1, 0)
	Type.Text = ": Players"
	Type.TextColor3 = Color3.fromRGB(255, 255, 255)
	Type.TextSize = 15
	Type.TextXAlignment = Enum.TextXAlignment.Left
	Type.Parent = Field

	Cmdr.Parent = game:GetService("StarterGui")
	return Cmdr
end
