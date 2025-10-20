repeat
    task.wait()
until game:IsLoaded()

if PathosLoader then
    PathosLoader:Destroy()
end

local Games = {
    'Fight In A School',
    'Forsaken',
    'Untitled Boxing Game',
    'Pressure',
    "South London",
    "Hypershot"
}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')

local PlaceName = game:GetService('MarketplaceService')
    :GetProductInfo(game.PlaceId).Name

local API =
    loadstring(game:HttpGet('https://sdkAPI-public.luarmor.net/library.lua'))()
do
    API.script_id = '30b156d1b5322e48d977bdb219bf4053'
end

local Folder = not isfolder('Pathos') and makefolder('Pathos')
local KeyName = (function()
    for _, Name in Games do
        local r = string.match(PlaceName:lower(), Name:lower())

        if r then
            if Name == "Untitled Boxing Game" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/th3-osc/UIExtender/main/UIHelper"))
            end
            return r
        end
    end
end)()

if not KeyName then
    error('Game not supported by Pathos.')
end

makefolder('Pathos/Keys')
local KeyFile = 'Pathos/Keys/' .. KeyName
local file_key = script_key or (isfile(KeyFile) and readfile(KeyFile)) or nil

local DARK_RED_ACCENT = Color3.fromRGB(120, 20, 20)

local function generateRandomUIName()
    local invisibleChars = {
        '\u{200B}',
        '\u{200C}',
        '\u{200D}',
        '\u{2060}',
        '\u{FEFF}',
    }
    
    local randomName = ""
    for i = 1, math.random(8, 15) do
        randomName = randomName .. invisibleChars[math.random(1, #invisibleChars)]
    end
    
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    for i = 1, math.random(5, 10) do
        local pos = math.random(1, #randomName)
        local char = chars:sub(math.random(1, #chars), math.random(1, #chars))
        randomName = randomName:sub(1, pos) .. char .. randomName:sub(pos + 1)
    end
    
    return randomName
end

getgenv().PathosLoader = Instance.new('ScreenGui')
do
    PathosLoader.Name = generateRandomUIName()
    PathosLoader.ResetOnSpawn = false
    PathosLoader.IgnoreGuiInset = true
    PathosLoader.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    PathosLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    PathosLoader.DisplayOrder = 999
    PathosLoader.Parent = game:GetService('CoreGui')
end

local BackgroundFrame = Instance.new('Frame')
do
    BackgroundFrame.Name = 'BackgroundFrame'
    BackgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    BackgroundFrame.Position = UDim2.new(0, 0, 0, 0)
    BackgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    BackgroundFrame.BackgroundTransparency = 0.3
    BackgroundFrame.BorderSizePixel = 0
    BackgroundFrame.ZIndex = 1
    BackgroundFrame.Parent = PathosLoader
end

local GlowFrame = Instance.new('Frame')
do
    GlowFrame.Name = 'GlowFrame'
    GlowFrame.Size = UDim2.new(0, 408, 0, 328)
    GlowFrame.Position = UDim2.new(0.5, -204, 0.5, -164)
    GlowFrame.AnchorPoint = Vector2.new(0, 0)
    GlowFrame.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    GlowFrame.BackgroundTransparency = 0.92
    GlowFrame.BorderSizePixel = 0
    GlowFrame.ZIndex = 1
    GlowFrame.Parent = PathosLoader
end

local GlowCorner = Instance.new('UICorner')
do
    GlowCorner.CornerRadius = UDim.new(0, 15)
    GlowCorner.Parent = GlowFrame
end

local MainFrame = Instance.new('Frame')
do
    MainFrame.Name = 'MainFrame'
    MainFrame.Size = UDim2.new(0, 400, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
    MainFrame.AnchorPoint = Vector2.new(0, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
    MainFrame.BorderSizePixel = 0
    MainFrame.ZIndex = 2
    MainFrame.Parent = PathosLoader
end

local MainGradient = Instance.new('UIGradient')
do
    MainGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 58)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 40, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40)),
    })
    MainGradient.Rotation = 90
    MainGradient.Parent = MainFrame
end

local MainCorner = Instance.new('UICorner')
do
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
end

local MainStroke = Instance.new('UIStroke')
do
    MainStroke.Color = DARK_RED_ACCENT
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame
end

local TitleBar = Instance.new('Frame')
do
    TitleBar.Name = 'TitleBar'
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 58)
    TitleBar.BorderSizePixel = 0
    TitleBar.ZIndex = 3
    TitleBar.Parent = MainFrame
end

local TitleGradient = Instance.new('UIGradient')
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(45, 45, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 45)),
})
TitleGradient.Rotation = 90
TitleGradient.Parent = TitleBar

local TitleCorner = Instance.new('UICorner')
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new('Frame')
TitleFix.Size = UDim2.new(1, 0, 0, 12)
TitleFix.Position = UDim2.new(0, 0, 1, -12)
TitleFix.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
TitleFix.BorderSizePixel = 0
TitleFix.ZIndex = 3
TitleFix.Parent = TitleBar

local TitleFixGradient = Instance.new('UIGradient')
TitleFixGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 45)),
})
TitleFixGradient.Rotation = 90
TitleFixGradient.Parent = TitleFix

local TitleText = Instance.new('TextLabel')
do
    TitleText.Name = 'TitleText'
    TitleText.Size = UDim2.new(1, -100, 1, 0)
    TitleText.Position = UDim2.new(0, 50, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = 'PATHOS LOADER'
    TitleText.TextColor3 = Color3.fromRGB(220, 50, 50)
    TitleText.TextSize = 18
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.TextYAlignment = Enum.TextYAlignment.Center
    TitleText.Font = Enum.Font.GothamBold
    TitleText.ZIndex = 4
    TitleText.Parent = TitleBar
end

local CloseButton = Instance.new('TextButton')
do
    CloseButton.Name = 'CloseButton'
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Text = '×'
    CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    CloseButton.TextSize = 20
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.ZIndex = 4
    CloseButton.Parent = TitleBar
end

local DescriptionText = Instance.new('TextLabel')
do
    DescriptionText.Name = 'DescriptionText'
    DescriptionText.Size = UDim2.new(1, -40, 0, 40)
    DescriptionText.Position = UDim2.new(0, 20, 0, 70)
    DescriptionText.BackgroundTransparency = 1
    DescriptionText.Text = 'Please enter your key to access scripts'
    DescriptionText.TextColor3 = Color3.fromRGB(180, 180, 180)
    DescriptionText.TextSize = 14
    DescriptionText.TextXAlignment = Enum.TextXAlignment.Center
    DescriptionText.TextYAlignment = Enum.TextYAlignment.Center
    DescriptionText.Font = Enum.Font.Gotham
    DescriptionText.ZIndex = 3
    DescriptionText.Parent = MainFrame
end

local KeyInputFrame = Instance.new('Frame')
KeyInputFrame.Name = 'KeyInputFrame'
KeyInputFrame.Size = UDim2.new(1, -40, 0, 40)
KeyInputFrame.Position = UDim2.new(0, 20, 0, 130)
KeyInputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
KeyInputFrame.BorderSizePixel = 0
KeyInputFrame.ZIndex = 3
KeyInputFrame.Parent = MainFrame

local KeyInputCorner = Instance.new('UICorner')
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInputFrame

local KeyInputStroke = Instance.new('UIStroke')
KeyInputStroke.Color = DARK_RED_ACCENT
KeyInputStroke.Thickness = 1
KeyInputStroke.Parent = KeyInputFrame

local KeyTextBox = Instance.new('TextBox')
KeyTextBox.Name = 'KeyTextBox'
KeyTextBox.Size = UDim2.new(1, -20, 1, 0)
KeyTextBox.Position = UDim2.new(0, 10, 0, 0)
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.Text = ''
KeyTextBox.PlaceholderText = 'Enter Key'
KeyTextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.TextSize = 14
KeyTextBox.TextXAlignment = Enum.TextXAlignment.Left
KeyTextBox.TextYAlignment = Enum.TextYAlignment.Center
KeyTextBox.Font = Enum.Font.Gotham
KeyTextBox.ClearTextOnFocus = false
KeyTextBox.ZIndex = 4
KeyTextBox.Parent = KeyInputFrame

local ButtonContainer = Instance.new('Frame')
ButtonContainer.Name = 'ButtonContainer'
ButtonContainer.Size = UDim2.new(1, -40, 0, 40)
ButtonContainer.Position = UDim2.new(0, 20, 0, 190)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.ZIndex = 3
ButtonContainer.Parent = MainFrame

local GetKeyButton = Instance.new('TextButton')
GetKeyButton.Name = 'GetKeyButton'
GetKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyButton.Position = UDim2.new(0, 0, 0, 0)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = 'Get Key'
GetKeyButton.TextColor3 = Color3.fromRGB(200, 200, 200)
GetKeyButton.TextSize = 14
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.ZIndex = 4
GetKeyButton.Parent = ButtonContainer

local GetKeyCorner = Instance.new('UICorner')
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyButton

local CheckKeyButton = Instance.new('TextButton')
CheckKeyButton.Name = 'CheckKeyButton'
CheckKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
CheckKeyButton.Position = UDim2.new(0.52, 0, 0, 0)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Text = 'Check Key'
CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyButton.TextSize = 14
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.ZIndex = 4
CheckKeyButton.Parent = ButtonContainer

local CheckKeyCorner = Instance.new('UICorner')
CheckKeyCorner.CornerRadius = UDim.new(0, 8)
CheckKeyCorner.Parent = CheckKeyButton

local DiscordContainer = Instance.new('Frame')
DiscordContainer.Name = 'DiscordContainer'
DiscordContainer.Size = UDim2.new(1, -40, 0, 30)
DiscordContainer.Position = UDim2.new(0, 20, 1, -40)
DiscordContainer.BackgroundTransparency = 1
DiscordContainer.ZIndex = 3
DiscordContainer.Parent = MainFrame

local DiscordSupportButton = Instance.new('TextButton')
DiscordSupportButton.Name = 'DiscordSupportButton'
DiscordSupportButton.Size = UDim2.new(1, 0, 1, 0)
DiscordSupportButton.Position = UDim2.new(0, 0, 0, 0)
DiscordSupportButton.BackgroundTransparency = 1
DiscordSupportButton.Text = '(Click Here For Support)'
DiscordSupportButton.TextColor3 = Color3.fromRGB(150, 150, 150)
DiscordSupportButton.TextSize = 12
DiscordSupportButton.TextXAlignment = Enum.TextXAlignment.Center
DiscordSupportButton.TextYAlignment = Enum.TextYAlignment.Center
DiscordSupportButton.Font = Enum.Font.Gotham
DiscordSupportButton.ZIndex = 4
DiscordSupportButton.Parent = DiscordContainer

local NotificationContainer = Instance.new('Frame')
NotificationContainer.Name = 'NotificationContainer'
NotificationContainer.Size = UDim2.new(0, 300, 1, 0)
NotificationContainer.Position = UDim2.new(1, -320, 0, 20)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.ZIndex = 50
NotificationContainer.Parent = PathosLoader

local StatusLabel = Instance.new('TextLabel')
StatusLabel.Name = 'StatusLabel'
StatusLabel.Size = UDim2.new(1, -40, 0, 25)
StatusLabel.Position = UDim2.new(0, 20, 0, 250)
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
StatusLabel.BorderSizePixel = 0
StatusLabel.Text = ''
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 12
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.TextYAlignment = Enum.TextYAlignment.Center
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Visible = false
StatusLabel.ZIndex = 5
StatusLabel.Parent = MainFrame

local StatusCorner = Instance.new('UICorner')
StatusCorner.CornerRadius = UDim.new(0, 6)
StatusCorner.Parent = StatusLabel

local StatusStroke = Instance.new('UIStroke')
StatusStroke.Color = DARK_RED_ACCENT
StatusStroke.Thickness = 1
StatusStroke.Parent = StatusLabel

local PopupBackground = Instance.new('TextButton')
PopupBackground.Name = 'PopupBackground'
PopupBackground.Size = UDim2.new(1, 0, 1, 0)
PopupBackground.Position = UDim2.new(0, 0, 0, 0)
PopupBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PopupBackground.BackgroundTransparency = 0.5
PopupBackground.BorderSizePixel = 0
PopupBackground.Text = ''
PopupBackground.Visible = false
PopupBackground.ZIndex = 9
PopupBackground.Parent = PathosLoader

local KeyProviderPopup = Instance.new('Frame')
KeyProviderPopup.Name = 'KeyProviderPopup'
KeyProviderPopup.Size = UDim2.new(0, 280, 0, 200)
KeyProviderPopup.Position = UDim2.new(0.5, -140, 0.5, -100)
KeyProviderPopup.AnchorPoint = Vector2.new(0, 0)
KeyProviderPopup.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
KeyProviderPopup.BorderSizePixel = 0
KeyProviderPopup.Visible = false
KeyProviderPopup.ZIndex = 10
KeyProviderPopup.Parent = PathosLoader

local PopupGradient = Instance.new('UIGradient')
PopupGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 58)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 40, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40)),
})
PopupGradient.Rotation = 90
PopupGradient.Parent = KeyProviderPopup

local PopupCorner = Instance.new('UICorner')
PopupCorner.CornerRadius = UDim.new(0, 12)
PopupCorner.Parent = KeyProviderPopup

local PopupStroke = Instance.new('UIStroke')
PopupStroke.Color = DARK_RED_ACCENT
PopupStroke.Thickness = 2
PopupStroke.Parent = KeyProviderPopup

local PopupTitle = Instance.new('TextLabel')
PopupTitle.Name = 'PopupTitle'
PopupTitle.Size = UDim2.new(1, -60, 0, 40)
PopupTitle.Position = UDim2.new(0, 20, 0, 15)
PopupTitle.BackgroundTransparency = 1
PopupTitle.Text = 'Choose Key Provider'
PopupTitle.TextColor3 = Color3.fromRGB(220, 50, 50)
PopupTitle.TextSize = 16
PopupTitle.TextXAlignment = Enum.TextXAlignment.Center
PopupTitle.TextYAlignment = Enum.TextYAlignment.Center
PopupTitle.Font = Enum.Font.GothamBold
PopupTitle.ZIndex = 11
PopupTitle.Parent = KeyProviderPopup

local PopupCloseButton = Instance.new('TextButton')
PopupCloseButton.Name = 'PopupCloseButton'
PopupCloseButton.Size = UDim2.new(0, 30, 0, 30)
PopupCloseButton.Position = UDim2.new(1, -40, 0, 10)
PopupCloseButton.BackgroundTransparency = 1
PopupCloseButton.Text = '×'
PopupCloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
PopupCloseButton.TextSize = 18
PopupCloseButton.Font = Enum.Font.GothamBold
PopupCloseButton.ZIndex = 11
PopupCloseButton.Parent = KeyProviderPopup

local LinkvertiseButton = Instance.new('TextButton')
LinkvertiseButton.Name = 'LinkvertiseButton'
LinkvertiseButton.Size = UDim2.new(1, -40, 0, 40)
LinkvertiseButton.Position = UDim2.new(0, 20, 0, 70)
LinkvertiseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
LinkvertiseButton.BorderSizePixel = 0
LinkvertiseButton.Text = 'Linkvertise'
LinkvertiseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LinkvertiseButton.TextSize = 14
LinkvertiseButton.Font = Enum.Font.GothamBold
LinkvertiseButton.ZIndex = 11
LinkvertiseButton.Parent = KeyProviderPopup

local LinkvertiseCorner = Instance.new('UICorner')
LinkvertiseCorner.CornerRadius = UDim.new(0, 8)
LinkvertiseCorner.Parent = LinkvertiseButton

local LootlabsButton = Instance.new('TextButton')
LootlabsButton.Name = 'LootlabsButton'
LootlabsButton.Size = UDim2.new(1, -40, 0, 40)
LootlabsButton.Position = UDim2.new(0, 20, 0, 125)
LootlabsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
LootlabsButton.BorderSizePixel = 0
LootlabsButton.Text = 'Lootlabs'
LootlabsButton.TextColor3 = Color3.fromRGB(200, 200, 200)
LootlabsButton.TextSize = 14
LootlabsButton.Font = Enum.Font.GothamBold
LootlabsButton.ZIndex = 11
LootlabsButton.Parent = KeyProviderPopup

local LootlabsCorner = Instance.new('UICorner')
LootlabsCorner.CornerRadius = UDim.new(0, 8)
LootlabsCorner.Parent = LootlabsButton

local function CreateTween(
    instance,
    properties,
    time,
    easingStyle,
    easingDirection
)
    local info = TweenInfo.new(
        time or 0.3,
        easingStyle or Enum.EasingStyle.Quad,
        easingDirection or Enum.EasingDirection.Out
    )
    return TweenService:Create(instance, info, properties)
end

local function setupHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        CreateTween(button, { BackgroundColor3 = hoverColor }, 0.2):Play()
    end)

    button.MouseLeave:Connect(function()
        CreateTween(button, { BackgroundColor3 = normalColor }, 0.2):Play()
    end)
end

setupHoverEffect(
    GetKeyButton,
    Color3.fromRGB(60, 60, 65),
    Color3.fromRGB(80, 80, 85)
)
setupHoverEffect(
    CheckKeyButton,
    Color3.fromRGB(220, 50, 50),
    Color3.fromRGB(240, 70, 70)
)
setupHoverEffect(
    LinkvertiseButton,
    Color3.fromRGB(220, 50, 50),
    Color3.fromRGB(240, 70, 70)
)
setupHoverEffect(
    LootlabsButton,
    Color3.fromRGB(60, 60, 65),
    Color3.fromRGB(80, 80, 85)
)

CloseButton.MouseEnter:Connect(function()
    CreateTween(
        CloseButton,
        { TextColor3 = Color3.fromRGB(255, 100, 100) },
        0.2
    ):Play()
end)

CloseButton.MouseLeave:Connect(function()
    CreateTween(
        CloseButton,
        { TextColor3 = Color3.fromRGB(200, 200, 200) },
        0.2
    ):Play()
end)

PopupCloseButton.MouseEnter:Connect(function()
    CreateTween(
        PopupCloseButton,
        { TextColor3 = Color3.fromRGB(255, 100, 100) },
        0.2
    ):Play()
end)

PopupCloseButton.MouseLeave:Connect(function()
    CreateTween(
        PopupCloseButton,
        { TextColor3 = Color3.fromRGB(200, 200, 200) },
        0.2
    ):Play()
end)

DiscordSupportButton.MouseEnter:Connect(function()
    CreateTween(
        DiscordSupportButton,
        { TextColor3 = Color3.fromRGB(220, 50, 50) },
        0.2
    ):Play()
end)

DiscordSupportButton.MouseLeave:Connect(function()
    CreateTween(
        DiscordSupportButton,
        { TextColor3 = Color3.fromRGB(150, 150, 150) },
        0.2
    ):Play()
end)

KeyTextBox.Focused:Connect(function()
    CreateTween(KeyInputStroke, { Color = Color3.fromRGB(220, 50, 50) }, 0.3):Play()
end)

KeyTextBox.FocusLost:Connect(function()
    CreateTween(KeyInputStroke, { Color = DARK_RED_ACCENT }, 0.3):Play()
end)

local function showStatus(message, color, duration)
    StatusLabel.Text = message
    StatusLabel.TextColor3 = color
    StatusLabel.Visible = true

    task.spawn(function()
        task.wait(duration or 3)
        if StatusLabel and StatusLabel.Parent then
            CreateTween(StatusLabel, { TextTransparency = 1 }, 0.3).Completed:Connect(
                function()
                    if StatusLabel and StatusLabel.Parent then
                        StatusLabel.Visible = false
                        StatusLabel.TextTransparency = 0
                    end
                end
            )
        end
    end)
end

local activeNotifications = {}
local notificationId = 0

local function createNotification(message, notificationType, duration)
    notificationId = notificationId + 1
    local currentId = notificationId

    local notificationColors = {
        success = {
            bg = Color3.fromRGB(45, 45, 52),
            border = Color3.fromRGB(120, 20, 20),
            icon = '✓',
        },
        error = {
            bg = Color3.fromRGB(45, 45, 52),
            border = Color3.fromRGB(180, 30, 30),
            icon = '✗',
        },
        info = {
            bg = Color3.fromRGB(45, 45, 52),
            border = Color3.fromRGB(100, 100, 110),
            icon = 'ℹ',
        },
        warning = {
            bg = Color3.fromRGB(45, 45, 52),
            border = Color3.fromRGB(160, 80, 20),
            icon = '⚠',
        },
    }

    local config = notificationColors[notificationType]
        or notificationColors.info
    duration = duration or 4

    local notification = Instance.new('Frame')
    notification.Name = 'Notification_' .. currentId
    notification.Size = UDim2.new(1, 0, 0, 60)
    notification.Position = UDim2.new(0, 300, 0, #activeNotifications * 70)
    notification.BackgroundColor3 = config.bg
    notification.BorderSizePixel = 0
    notification.ZIndex = 51
    notification.Parent = NotificationContainer

    local notifGradient = Instance.new('UIGradient')
    notifGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 58)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 45)),
    })
    notifGradient.Rotation = 90
    notifGradient.Parent = notification

    local notifCorner = Instance.new('UICorner')
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notification

    local notifStroke = Instance.new('UIStroke')
    notifStroke.Color = config.border
    notifStroke.Thickness = 2
    notifStroke.Parent = notification

    local iconLabel = Instance.new('TextLabel')
    iconLabel.Size = UDim2.new(0, 30, 1, 0)
    iconLabel.Position = UDim2.new(0, 10, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = config.icon
    iconLabel.TextColor3 = config.border
    iconLabel.TextSize = 20
    iconLabel.TextXAlignment = Enum.TextXAlignment.Center
    iconLabel.TextYAlignment = Enum.TextYAlignment.Center
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.ZIndex = 52
    iconLabel.Parent = notification

    local messageLabel = Instance.new('TextLabel')
    messageLabel.Size = UDim2.new(1, -80, 1, 0)
    messageLabel.Position = UDim2.new(0, 45, 0, 0)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.TextSize = 12
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Center
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextWrapped = true
    messageLabel.ZIndex = 52
    messageLabel.Parent = notification

    local closeButton = Instance.new('TextButton')
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = '×'
    closeButton.TextColor3 = Color3.fromRGB(180, 180, 180)
    closeButton.TextSize = 16
    closeButton.Font = Enum.Font.GothamBold
    closeButton.ZIndex = 52
    closeButton.Parent = notification

    local progressBar = Instance.new('Frame')
    progressBar.Size = UDim2.new(1, 0, 0, 3)
    progressBar.Position = UDim2.new(0, 0, 1, -3)
    progressBar.BackgroundColor3 = config.border
    progressBar.BorderSizePixel = 0
    progressBar.ZIndex = 52
    progressBar.Parent = notification

    local progressCorner = Instance.new('UICorner')
    progressCorner.CornerRadius = UDim.new(0, 2)
    progressCorner.Parent = progressBar

    table.insert(activeNotifications, { frame = notification, id = currentId })

    CreateTween(notification, {
        Position = UDim2.new(0, 0, 0, (#activeNotifications - 1) * 70),
    }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()

    CreateTween(progressBar, {
        Size = UDim2.new(0, 0, 0, 3),
    }, duration, Enum.EasingStyle.Linear):Play()

    local function dismissNotification()
        CreateTween(notification, {
            Position = UDim2.new(0, 300, 0, notification.Position.Y.Offset),
        }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In):Play()

        for i, notif in ipairs(activeNotifications) do
            if notif.id == currentId then
                table.remove(activeNotifications, i)
                break
            end
        end

        for i, notif in ipairs(activeNotifications) do
            CreateTween(notif.frame, {
                Position = UDim2.new(0, 0, 0, (i - 1) * 70),
            }, 0.3):Play()
        end

        task.spawn(function()
            task.wait(0.5)
            if notification and notification.Parent then
                notification:Destroy()
            end
        end)
    end

    closeButton.MouseButton1Click:Connect(dismissNotification)

    closeButton.MouseEnter:Connect(function()
        CreateTween(
            closeButton,
            { TextColor3 = Color3.fromRGB(255, 100, 100) },
            0.2
        ):Play()
    end)

    closeButton.MouseLeave:Connect(function()
        CreateTween(
            closeButton,
            { TextColor3 = Color3.fromRGB(180, 180, 180) },
            0.2
        ):Play()
    end)

    task.spawn(function()
        task.wait(duration)
        if notification and notification.Parent then
            dismissNotification()
        end
    end)
end

local function shakeUI()
    local originalPosition = MainFrame.Position
    local originalGlowPosition = GlowFrame.Position
    local shakeIntensity = 8
    local shakeCount = 6

    task.spawn(function()
        for i = 1, shakeCount do
            local randomX = math.random(-shakeIntensity, shakeIntensity)
            local randomY = math.random(-shakeIntensity, shakeIntensity)

            CreateTween(MainFrame, {
                Position = UDim2.new(
                    originalPosition.X.Scale,
                    originalPosition.X.Offset + randomX,
                    originalPosition.Y.Scale,
                    originalPosition.Y.Offset + randomY
                ),
            }, 0.05):Play()

            CreateTween(GlowFrame, {
                Position = UDim2.new(0.5, -204 + randomX, 0.5, -164 + randomY),
            }, 0.05):Play()

            task.wait(0.05)
        end

        CreateTween(MainFrame, { Position = originalPosition }, 0.1):Play()
        CreateTween(GlowFrame, { Position = originalGlowPosition }, 0.1):Play()
    end)
end

task.spawn(function()
    while GlowFrame and GlowFrame.Parent do
        CreateTween(GlowFrame, {
            Size = UDim2.new(0, 415, 0, 335),
            Position = UDim2.new(0.5, -207.5, 0.5, -167.5),
            BackgroundTransparency = 0.95,
        }, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()

        task.wait(2)

        if not (GlowFrame and GlowFrame.Parent) then
            break
        end

        CreateTween(GlowFrame, {
            Size = UDim2.new(0, 408, 0, 328),
            Position = UDim2.new(0.5, -204, 0.5, -164),
            BackgroundTransparency = 0.92,
        }, 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut):Play()

        task.wait(2)
    end
end)

local popupOpen = false

local function openPopup()
    if popupOpen then
        return
    end
    popupOpen = true

    PopupBackground.Visible = true
    PopupBackground.BackgroundTransparency = 1
    CreateTween(PopupBackground, { BackgroundTransparency = 0.5 }, 0.2):Play()

    KeyProviderPopup.Visible = true
    KeyProviderPopup.Size = UDim2.new(0, 0, 0, 0)
    CreateTween(
        KeyProviderPopup,
        { Size = UDim2.new(0, 280, 0, 200) },
        0.3,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ):Play()
end

local function closePopup()
    if not popupOpen then
        return
    end
    popupOpen = false

    KeyProviderPopup.Visible = false
    PopupBackground.Visible = false

    PopupBackground.BackgroundTransparency = 0.5
end

local function closeUI()
    if popupOpen then
        PopupBackground.Visible = false
        KeyProviderPopup.Visible = false
        popupOpen = false
    end

    local closeTween = CreateTween(MainFrame, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
    }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)

    local glowTween = CreateTween(GlowFrame, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
    }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)

    local backgroundTween =
        CreateTween(BackgroundFrame, { BackgroundTransparency = 1 }, 0.4)

    closeTween:Play()
    glowTween:Play()
    backgroundTween:Play()

    closeTween.Completed:Connect(function()
        if PathosLoader and PathosLoader.Parent then
            PathosLoader:Destroy()
        end
    end)
end

local function CheckKey(key)
    script_key = script_key or key
    local status = API.check_key(script_key)
    do
        if status.code == 'KEY_VALID' then
            script_key = script_key
            writefile('Pathos/Keys/' .. KeyName, script_key)
            closeUI()
            API.load_script()
        elseif status.code:find('KEY_') then
            local messages = {
                KEY_HWID_LOCKED = 'Key linked to a different HWID. Please reset it using our bot',
                KEY_INCORRECT = 'Key is incorrect',
                KEY_INVALID = 'Key is invalid',
            }
            createNotification(
                'Key Failure: ' .. (messages[status.code] or 'Unknown error'),
                'info',
                3
            )
        else
            game:GetService('Players').LocalPlayer
                :Kick(
                    'Key Failure: '
                        .. status.message
                        .. ' Code: '
                        .. status.code
                )
        end
    end
end

CheckKeyButton.MouseButton1Click:Connect(function()
    local keyInput = KeyTextBox.Text

    if keyInput == '' then
        createNotification('Please enter a key first!', 'warning', 3)
        shakeUI()
        return
    end
    createNotification('Validating your key...', 'info', 2)
    CheckKey(keyInput)
end)

CloseButton.MouseButton1Click:Connect(function()
    closeUI()
end)

GetKeyButton.MouseButton1Click:Connect(function()
    openPopup()
end)

PopupCloseButton.MouseButton1Click:Connect(function()
    closePopup()
end)

PopupBackground.MouseButton1Click:Connect(function()
    closePopup()
end)

LootlabsButton.MouseButton1Click:Connect(function()
    if setclipboard then
    	createNotification("Linkvertise link copied to clipboard!", "info", 3)
    	setclipboard("https://ads.luarmor.net/get_key?for=Pathos-GVYYQNGHIzmp")
    else
    	createNotification("Could not set clipboard! copy from textbox", "info", 3)
    	KeyTextBox.Text = "https://shorturl.at/YEJd8"
    end

    closePopup()
end)

LinkvertiseButton.MouseButton1Click:Connect(function()
    if setclipboard then
        createNotification('Linkvertise link copied to clipboard!', 'info', 3)
        setclipboard(
            'https://ads.luarmor.net/get_key?for=Pathos_FIAS_Linkvertise-aietlPpLMrMu'
        )
    else
        createNotification(
            'Could not set clipboard! copy from textbox',
            'info',
            3
        )
        KeyTextBox.Text = 'https://shorturl.at/aPcwd'
    end
    closePopup()
end)

DiscordSupportButton.MouseButton1Click:Connect(function()
    task.spawn(function()
        local HttpService = game:GetService('HttpService')

        pcall(function()
            local request = request or http_request or (syn and syn.request)
            do
                if request then
                    request({
                        Url = 'http://127.0.0.1:6463/rpc?v=1',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json',
                            ['origin'] = 'https://discord.com',
                        },
                        Body = HttpService:JSONEncode({
                            args = { code = 'pathoscc' },
                            cmd = 'INVITE_BROWSER',
                            nonce = '.',
                        }),
                    })
                    createNotification(
                        'Opening Discord support server...',
                        'info',
                        3
                    )
                else
                    createNotification(
                        'Discord RPC not available',
                        'warning',
                        4
                    )
                end
            end
            if setclipboard then
                createNotification('Copying discord to clipboard...', 'info', 3)
                setclipboard('https://discord.com/pathoscc')
            end
        end)
    end)
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
GlowFrame.Size = UDim2.new(0, 0, 0, 0)
GlowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
GlowFrame.BackgroundTransparency = 1

CreateTween(MainFrame, {
    Size = UDim2.new(0, 400, 0, 320),
    Position = UDim2.new(0.5, -200, 0.5, -160),
}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()

CreateTween(GlowFrame, {
    Size = UDim2.new(0, 408, 0, 328),
    Position = UDim2.new(0.5, -204, 0.5, -164),
    BackgroundTransparency = 0.92,
}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()

game:GetService('Players').LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.InProgress then
        queue_on_teleport('<script to execute after TP>')
    end
end)

if file_key then
    local status = API.check_key(file_key)
    do
        if status.code == 'KEY_VALID' then
            KeyTextBox.Text = tostring(file_key)
        else
            file_key = nil

            if isfile(KeyFile) then
                delfile(KeyFile)
            end
        end
    end
end
