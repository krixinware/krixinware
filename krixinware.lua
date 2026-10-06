local _kufz85a8=(102+70)
local function _cm81cgjw(s)
local o={}
for i=1,#s do
o[i]=string.char(bit32.bxor(string.byte(s,i),(_kufz85a8+((i-1)*7))%256))
end
return table.concat(o)
end
local HttpService  = game:GetService(_cm81cgjw("\228\199\206\177\155\170\164\171\141\136\151"))
local jsonEncodeMethod = HttpService.JSONEncode
local function encodeJSON(data)
    if type(jsonEncodeMethod) == _cm81cgjw("\202\198\212\162\188\166\185\179") then
        return jsonEncodeMethod(HttpService, data)
    end
    return HttpService:JSONEncode(data)
end
local TweenService = game:GetService(_cm81cgjw("\248\196\223\164\166\156\179\175\146\130\145\156"))
local CoreGui      = game:GetService(_cm81cgjw("\239\220\200\164\143\186\191"))
local Players      = game:GetService(_cm81cgjw("\252\223\219\184\173\189\165"))
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    while not Players.LocalPlayer do
        task.wait()
    end
    LocalPlayer = Players.LocalPlayer
end
local username = LocalPlayer.Name
local userId   = LocalPlayer.UserId
local placeId  = game.PlaceId
local jobId    = game.JobId
local gameId   = game.GameId
local HOST_URL    = "https://exec.luaprotect.dev"
local WS_URL      = "wss://exec.luaprotect.dev/ws"
local SCRIPT_ID   = "tA8K5WOs7Nzm-C3D"
local SCRIPT_NAME = "krixinware"
local IS_TELEPORT_RECONNECT = "0" == _cm81cgjw("\157")
local HANDOFF_RUNNER_ID = ""
local HANDOFF_KEY = ""
local HANDOFF_RUN_ID = ""
local HANDOFF_SESSION_ID = ""
local SECRET_KEY  = "be601a672e0b5021bc3c89015fe929e60efbb18c5c1bc942b478916629ccc9fe"
local RUNNER_ID   = "2c0ace4275a74e91a4ad5339f720d105"
local label = (SCRIPT_NAME ~= _cm81cgjw("") and SCRIPT_NAME) or _cm81cgjw("\224\198\219\177\186\160\162\184\135\159")
local function getGuiParent()
    local parentGui = nil
    if gethui then
        pcall(function()
            local hui = gethui()
            if hui and hui.FindFirstChild then parentGui = hui end
        end)
    end
    if not parentGui then
        pcall(function()
            if CoreGui and CoreGui.FindFirstChild then parentGui = CoreGui end
        end)
    end
    if not parentGui then
        pcall(function()
            if LocalPlayer and LocalPlayer.FindFirstChild then
                parentGui = LocalPlayer:FindFirstChild(_cm81cgjw("\252\223\219\184\173\189\145\168\141")) or LocalPlayer:WaitForChild(_cm81cgjw("\252\223\219\184\173\189\145\168\141"), 5)
            end
        end)
    end
    return parentGui or CoreGui
end
local function cleanupExistingGui(name)
    pcall(function()
        local parents = {}
        if CoreGui then table.insert(parents, CoreGui) end
        if LocalPlayer then
            local pg = LocalPlayer:FindFirstChild(_cm81cgjw("\252\223\219\184\173\189\145\168\141"))
            if pg then table.insert(parents, pg) end
        end
        if gethui then
            pcall(function()
                local hui = gethui()
                if hui and hui ~= CoreGui then table.insert(parents, hui) end
            end)
        end
        for _, p in ipairs(parents) do
            local found = p:FindFirstChild(name)
            while found do
                found:Destroy()
                found = p:FindFirstChild(name)
            end
        end
    end)
end
cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\185\156\121\082\071"))
cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\182\144\115\100\097\103\120\111\067\095\083"))
cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\179\151\110\104\123\123\127\070\071\084\086\075\001\056\061"))
cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\177\150\110\116\097\121\121\109\069\069\081\089\047\046\053\047\011\006\030\004"))
local announcementSerial = 0
local function showAdminAnnouncement(title, message, duration, colorHex, prefix, verified)
    duration = tonumber(duration) or 8
    announcementSerial = announcementSerial + 1
    local serial = announcementSerial
    task.spawn(function()
        local parentGui = getGuiParent()
        if not parentGui then return end
        cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\179\151\110\104\123\123\127\070\071\084\086\075\001\056\061"))
        local screenGui = Instance.new(_cm81cgjw("\255\208\200\164\173\161\145\168\141"))
        screenGui.Name = _cm81cgjw("\224\198\219\145\186\160\162\184\135\159\179\151\110\104\123\123\127\070\071\084\086\075\001\056\061")
        screenGui.ResetOnSpawn = false
        screenGui.IgnoreGuiInset = true
        screenGui.DisplayOrder = 50
        pcall(function() if syn and syn.protect_gui then syn.protect_gui(screenGui) elseif protect_gui then protect_gui(screenGui) end end)
        screenGui.Parent = parentGui
        card = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        card.Name = _cm81cgjw("\237\221\212\174\189\161\181\184\137\142\156\141\067\102\124\113")
        card.AnchorPoint = Vector2.new(0.5, 0)
        card.Position = UDim2.new(0.5, 0, 0, -100)
        card.Size = UDim2.new(1, 0, 0, 44)
        card.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        card.BackgroundTransparency = 0
        card.BorderSizePixel = 0
        card.Parent = screenGui
        local gradient = Instance.new(_cm81cgjw("\249\250\253\179\169\171\191\184\138\159"))
        gradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.25, 0.4),
            NumberSequenceKeypoint.new(0.75, 0.4),
            NumberSequenceKeypoint.new(1, 1)
        })
        gradient.Parent = card
        local contentContainer = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        contentContainer.BackgroundTransparency = 1
        contentContainer.Size = UDim2.new(1, 0, 1, 0)
        contentContainer.Parent = card
        local listLayout = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
        listLayout.FillDirection = Enum.FillDirection.Horizontal
        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Padding = UDim.new(0, 0)
        listLayout.Parent = contentContainer
        local nameColor = Color3.fromRGB(240, 65, 65)
        if type(colorHex) == _cm81cgjw("\223\199\200\168\166\168") and #colorHex >= 6 then
            local cleanHex = colorHex:gsub(_cm81cgjw("\143"), _cm81cgjw(""))
            local r = tonumber(cleanHex:sub(1, 2), 16)
            local g = tonumber(cleanHex:sub(3, 4), 16)
            local b = tonumber(cleanHex:sub(5, 6), 16)
            if r and g and b then
                nameColor = Color3.fromRGB(r, g, b)
            end
        end
        local nameLabel = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        nameLabel.Name = _cm81cgjw("\226\210\215\164\132\174\180\184\136")
        nameLabel.BackgroundTransparency = 1
        nameLabel.Size = UDim2.new(0, 0, 1, 0)
        nameLabel.AutomaticSize = Enum.AutomaticSize.X
        nameLabel.Font = Enum.Font.RobotoMono
        nameLabel.TextSize = 20
        nameLabel.TextColor3 = nameColor
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextYAlignment = Enum.TextYAlignment.Center
        nameLabel.Text = tostring(prefix or _cm81cgjw("\224\198\219\177\186\160\162\184\135\159"))
        nameLabel.LayoutOrder = 1
        nameLabel.Parent = contentContainer
        local nameStroke = Instance.new(_cm81cgjw("\249\250\233\181\186\160\189\184"))
        nameStroke.Color = Color3.fromRGB(0, 0, 0)
        nameStroke.Thickness = 1
        nameStroke.Parent = nameLabel
        if verified then
            local preBadgeSpacer = Instance.new(_cm81cgjw("\234\193\219\172\173"))
            preBadgeSpacer.Name = _cm81cgjw("\252\193\223\131\169\171\177\184\183\155\147\154\101\117")
            preBadgeSpacer.BackgroundTransparency = 1
            preBadgeSpacer.Size = UDim2.new(0, 5, 1, 0)
            preBadgeSpacer.LayoutOrder = 2
            preBadgeSpacer.Parent = contentContainer
            local badge = Instance.new(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135"))
            badge.Name = _cm81cgjw("\250\214\200\168\174\166\179\185\166\138\150\158\101")
            badge.BackgroundTransparency = 1
            badge.Size = UDim2.new(0, 20, 0, 20)
            badge.Image = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\059\045\041\026\029\006\008\014\126\121")
            badge.LayoutOrder = 3
            badge.Parent = contentContainer
            local badgeSpacer = Instance.new(_cm81cgjw("\234\193\219\172\173"))
            badgeSpacer.Name = _cm81cgjw("\238\210\222\166\173\156\166\188\135\142\128")
            badgeSpacer.BackgroundTransparency = 1
            badgeSpacer.Size = UDim2.new(0, 5, 1, 0)
            badgeSpacer.LayoutOrder = 4
            badgeSpacer.Parent = contentContainer
        end
        local msgLabel = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        msgLabel.Name = _cm81cgjw("\225\214\201\178\169\168\179\145\133\137\151\149")
        msgLabel.BackgroundTransparency = 1
        msgLabel.Size = UDim2.new(0, 0, 1, 0)
        msgLabel.AutomaticSize = Enum.AutomaticSize.X
        msgLabel.Font = Enum.Font.RobotoMono
        msgLabel.TextSize = 20
        msgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        msgLabel.TextXAlignment = Enum.TextXAlignment.Left
        msgLabel.TextYAlignment = Enum.TextYAlignment.Center
        msgLabel.Text = _cm81cgjw("\150\147") .. tostring(message or _cm81cgjw(""))
        msgLabel.LayoutOrder = 5
        msgLabel.Parent = contentContainer
        local msgStroke = Instance.new(_cm81cgjw("\249\250\233\181\186\160\189\184"))
        msgStroke.Color = Color3.fromRGB(0, 0, 0)
        msgStroke.Thickness = 1
        msgStroke.Parent = msgLabel
        TweenService:Create(card, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0, 60)
        }):Play()
        task.delay(duration, function()
            if announcementSerial ~= serial or not card.Parent then return end
            local tween = TweenService:Create(card, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, 0, 0, -100)
            })
            tween:Play()
            tween.Completed:Connect(function()
                if announcementSerial == serial and card then card:Destroy() end
            end)
        end)
    end)
end
local CONSOLE_TOAST_LIMIT = 4
local CONSOLE_TOAST_WIDTH = 340
local CONSOLE_TOAST_HEIGHT = 68
local CONSOLE_TOAST_MAX_TEXT = 1000
local consoleToastSerial = 0
local consoleToastEntries = {}
local recentConsoleOutput = {}
local function themeColor(hex, fallback)
    hex = tostring(hex or _cm81cgjw("")):gsub(_cm81cgjw("\143"), _cm81cgjw(""))
    if #hex ~= 6 or not hex:match(_cm81cgjw("\242\150\194\234\236")) then return fallback end
    return Color3.fromRGB(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
end
local THEME_BG = themeColor("", Color3.fromRGB(20, 20, 20))
local PROMPT_FOR_KEY = "1" == _cm81cgjw("\157")
local THEME_TEXT = themeColor("", Color3.fromRGB(255, 255, 255))
local THEME_ACCENT = themeColor("", nil) 
local THEME_MUTED = THEME_TEXT:Lerp(THEME_BG, 0.4)
local fontBold = Enum.Font.RobotoMono
local fontRegular = Enum.Font.RobotoMono
pcall(function()
    if not Enum.Font.RobotoMono then
        fontBold = Enum.Font.Code
        fontRegular = Enum.Font.Code
    end
end)
local function consoleOutputStyle(level)
    if level == _cm81cgjw("\201\193\200\174\186") then
        return {
            title = (label ~= _cm81cgjw("") and label ~= _cm81cgjw("\224\198\219\177\186\160\162\184\135\159") and label) or _cm81cgjw("\224\198\219\145\186\160\162\184\135\159\210\188\114\117\097\103"),
            accent = Color3.fromRGB(239, 68, 68),
            icon = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\040\020\025\009\012\012\127\121"),
            duration = 8
        }
    elseif level == _cm81cgjw("\219\210\200\175\161\161\177") then
        return {
            title = (label ~= _cm81cgjw("") and label ~= _cm81cgjw("\224\198\219\177\186\160\162\184\135\159") and label) or _cm81cgjw("\251\210\200\175\161\161\177"),
            accent = Color3.fromRGB(245, 158, 11),
            icon = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\044\026\029\004\011\014\114\116"),
            duration = 8
        }
    elseif level == _cm81cgjw("\223\198\217\162\173\188\165") then
        return {
            title = (label ~= _cm81cgjw("") and label ~= _cm81cgjw("\224\198\219\177\186\160\162\184\135\159") and label) or _cm81cgjw("\224\198\219\145\186\160\162\184\135\159"),
            accent = Color3.fromRGB(16, 185, 129),
            icon = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\044\026\029\008\008\009\114\121"),
            duration = 6
        }
    end
    return {
        title = (label ~= _cm81cgjw("") and label ~= _cm81cgjw("\224\198\219\177\186\160\162\184\135\159") and label) or _cm81cgjw("\224\198\219\145\186\160\162\184\135\159"),
        accent = THEME_ACCENT or Color3.fromRGB(59, 130, 246),
        icon = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\044\026\029\004\010\006\127\123"),
        duration = 6
    }
end
local function trimConsoleOutput(value)
    local text = tostring(value or _cm81cgjw("")):gsub(_cm81cgjw("\161"), _cm81cgjw("")):gsub(_cm81cgjw("\242\150\201\234"), _cm81cgjw("")):gsub(_cm81cgjw("\137\192\145\229"), _cm81cgjw(""))
    if #text > CONSOLE_TOAST_MAX_TEXT then
        text = text:sub(1, CONSOLE_TOAST_MAX_TEXT - 3) .. _cm81cgjw("\130\157\148")
    end
    return text
end
local function isConsoleError(value)
    local text = string.lower(tostring(value or _cm81cgjw("")))
    local errorMarkers = {
        _cm81cgjw("\201\193\200\174\186"), _cm81cgjw("\202\210\211\173\173\171"), _cm81cgjw("\202\210\211\173\189\189\179"), _cm81cgjw("\207\220\207\173\172\239\184\178\144"), _cm81cgjw("\207\210\212\175\167\187"), _cm81cgjw("\197\221\204\160\164\166\178\253\143\142\139"),
        _cm81cgjw("\206\210\212\175\173\171"), _cm81cgjw("\222\214\220\180\187\170\178"), _cm81cgjw("\222\210\206\164\232\163\191\176\141\159\151\157"), _cm81cgjw("\223\198\202\164\186\188\179\185\129\143"),
    }
    for _, marker in ipairs(errorMarkers) do
        if text:find(marker, 1, true) then return true end
    end
    return false
end
local function isConsoleSuccess(value)
    local text = string.lower(tostring(value or _cm81cgjw("")))
    local successMarkers = {
        _cm81cgjw("\207\220\212\175\173\172\162\184\128"), _cm81cgjw("\205\198\206\169\173\161\162\180\135\138\134\156\100"), _cm81cgjw("\223\198\217\162\173\188\165"), _cm81cgjw("\223\214\217\180\186\170\186\164"), _cm81cgjw("\205\198\206\169\167\189\191\167\129\143"), _cm81cgjw("\192\220\219\165\173\171")
    }
    for _, marker in ipairs(successMarkers) do
        if text:find(marker, 1, true) then return true end
    end
    return false
end
local function removeConsoleToast(entry, immediate)
    if not entry or entry.removed then return end
    entry.removed = true
    for index, activeEntry in ipairs(consoleToastEntries) do
        if activeEntry == entry then
            table.remove(consoleToastEntries, index)
            break
        end
    end
    if not entry.card or not entry.card.Parent then return end
    if immediate then
        entry.card:Destroy()
        return
    end
    local fadeInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    pcall(function()
        TweenService:Create(entry.card, fadeInfo, { BackgroundTransparency = 1, Position = UDim2.new(0, 24, 0, 0) }):Play()
        if entry.stroke then TweenService:Create(entry.stroke, fadeInfo, { Transparency = 1 }):Play() end
        if entry.iconFrame then TweenService:Create(entry.iconFrame, fadeInfo, { BackgroundTransparency = 1 }):Play() end
        if entry.iconImg then TweenService:Create(entry.iconImg, fadeInfo, { ImageTransparency = 1 }):Play() end
        TweenService:Create(entry.title, fadeInfo, { TextTransparency = 1 }):Play()
        local messageTween = TweenService:Create(entry.message, fadeInfo, { TextTransparency = 1 })
        messageTween:Play()
        messageTween.Completed:Connect(function()
            if entry.card then entry.card:Destroy() end
        end)
    end)
end
local DISABLE_NOTIFICATIONS = 1 == 1
local function showConsoleNotification(level, message)
    if DISABLE_NOTIFICATIONS then return end
    pcall(function()
        local text = trimConsoleOutput(message)
        if text == _cm81cgjw("") then return end
        local now = tick()
        local outputKey = tostring(level) .. _cm81cgjw("\150") .. text
        if recentConsoleOutput[outputKey] and now - recentConsoleOutput[outputKey] < 1.5 then return end
        recentConsoleOutput[outputKey] = now
        for key, timestamp in pairs(recentConsoleOutput) do
            if now - timestamp > 8 then recentConsoleOutput[key] = nil end
        end
        local parentGui = getGuiParent()
        if not parentGui then return end
        local screenGui = parentGui:FindFirstChild(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\177\150\110\116\097\121\121\109\069\069\081\089\047\046\053\047\011\006\030\004"))
        if not screenGui then
            screenGui = Instance.new(_cm81cgjw("\255\208\200\164\173\161\145\168\141"))
            screenGui.Name = _cm81cgjw("\224\198\219\145\186\160\162\184\135\159\177\150\110\116\097\121\121\109\069\069\081\089\047\046\053\047\011\006\030\004")
            screenGui.ResetOnSpawn = false
            screenGui.IgnoreGuiInset = true
            screenGui.DisplayOrder = 25
            screenGui.Parent = parentGui
        end
        local stack = screenGui:FindFirstChild(_cm81cgjw("\226\220\206\168\174\166\181\188\144\130\157\151\083\115\111\118\119"))
        if not stack then
            stack = Instance.new(_cm81cgjw("\234\193\219\172\173"))
            stack.Name = _cm81cgjw("\226\220\206\168\174\166\181\188\144\130\157\151\083\115\111\118\119")
            stack.AnchorPoint = Vector2.new(1, 1)
            stack.Position = UDim2.new(1, -16, 1, -16)
            stack.Size = UDim2.new(0, CONSOLE_TOAST_WIDTH, 0, 0)
            stack.AutomaticSize = Enum.AutomaticSize.Y
            stack.Active = false
            stack.BackgroundTransparency = 1
            stack.BorderSizePixel = 0
            stack.Parent = screenGui
            local sizeConstraint = Instance.new(_cm81cgjw("\249\250\233\168\178\170\149\178\138\152\134\139\097\110\096\097"))
            sizeConstraint.MaxSize = Vector2.new(CONSOLE_TOAST_WIDTH, 720)
            sizeConstraint.MinSize = Vector2.new(0, 0)
            sizeConstraint.Parent = stack
            local layout = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
            layout.Name = _cm81cgjw("\255\199\219\162\163\131\183\164\139\158\134")
            layout.FillDirection = Enum.FillDirection.Vertical
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Padding = UDim.new(0, 8)
            layout.Parent = stack
        end
        while #consoleToastEntries >= CONSOLE_TOAST_LIMIT do
            removeConsoleToast(consoleToastEntries[1], true)
        end
        local style = consoleOutputStyle(level)
        consoleToastSerial = consoleToastSerial + 1
        local card = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        card.Name = _cm81cgjw("\239\220\212\178\167\163\179\137\139\138\129\141")
        card.LayoutOrder = consoleToastSerial
        card.Size = UDim2.new(1, 0, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = THEME_BG
        card.BackgroundTransparency = 1
        card.BorderSizePixel = 0
        card.ClipsDescendants = true
        card.Parent = stack
        local corner = Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"))
        corner.CornerRadius = UDim.new(0, 3)
        corner.Parent = card
        local stroke = Instance.new(_cm81cgjw("\249\250\233\181\186\160\189\184"))
        stroke.Color = Color3.fromRGB(45, 45, 45)
        stroke.Transparency = 1
        stroke.Thickness = 1
        stroke.Parent = card
        local cardPadding = Instance.new(_cm81cgjw("\249\250\234\160\172\171\191\179\131"))
        cardPadding.PaddingTop = UDim.new(0, 12)
        cardPadding.PaddingBottom = UDim.new(0, 12)
        cardPadding.PaddingLeft = UDim.new(0, 14)
        cardPadding.PaddingRight = UDim.new(0, 12)
        cardPadding.Parent = card
        local row = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        row.Name = _cm81cgjw("\254\220\205")
        row.Size = UDim2.new(1, 0, 0, 0)
        row.AutomaticSize = Enum.AutomaticSize.Y
        row.BackgroundTransparency = 1
        row.BorderSizePixel = 0
        row.Parent = card
        local rowLayout = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
        rowLayout.FillDirection = Enum.FillDirection.Horizontal
        rowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        rowLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        rowLayout.SortOrder = Enum.SortOrder.LayoutOrder
        rowLayout.Padding = UDim.new(0, 10)
        rowLayout.Parent = row
        local iconFrame = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        iconFrame.Name = _cm81cgjw("\229\208\213\175\142\189\183\176\129")
        iconFrame.Size = UDim2.new(0, 24, 0, 24)
        iconFrame.BackgroundColor3 = style.accent
        iconFrame.BackgroundTransparency = 1
        iconFrame.BorderSizePixel = 0
        iconFrame.LayoutOrder = 1
        iconFrame.Parent = row
        local iconCorner = Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"))
        iconCorner.CornerRadius = UDim.new(0, 3)
        iconCorner.Parent = iconFrame
        local iconImg = Instance.new(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135"))
        iconImg.Name = _cm81cgjw("\229\208\213\175")
        iconImg.Size = UDim2.new(0, 16, 0, 16)
        iconImg.AnchorPoint = Vector2.new(0.5, 0.5)
        iconImg.Position = UDim2.new(0.5, 0, 0.5, 0)
        iconImg.BackgroundTransparency = 1
        iconImg.BorderSizePixel = 0
        iconImg.Image = style.icon
        iconImg.ImageColor3 = style.accent
        iconImg.ImageTransparency = 1
        iconImg.Parent = iconFrame
        local content = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        content.Name = _cm81cgjw("\239\220\212\181\173\161\162")
        content.Size = UDim2.new(1, -34, 0, 0)
        content.AutomaticSize = Enum.AutomaticSize.Y
        content.BackgroundTransparency = 1
        content.BorderSizePixel = 0
        content.LayoutOrder = 2
        content.Parent = row
        local contentLayout = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
        contentLayout.FillDirection = Enum.FillDirection.Vertical
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 2)
        contentLayout.Parent = content
        local titleLabel = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        titleLabel.Name = _cm81cgjw("\248\218\206\173\173")
        titleLabel.Size = UDim2.new(1, 0, 0, 16)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = fontBold
        titleLabel.Text = style.title
        titleLabel.TextSize = 13
        titleLabel.TextColor3 = THEME_TEXT
        titleLabel.TextTransparency = 1
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.TextYAlignment = Enum.TextYAlignment.Center
        titleLabel.LayoutOrder = 1
        titleLabel.Parent = content
        local messageLabel = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        messageLabel.Name = _cm81cgjw("\225\214\201\178\169\168\179")
        messageLabel.Size = UDim2.new(1, 0, 0, 0)
        messageLabel.AutomaticSize = Enum.AutomaticSize.Y
        messageLabel.BackgroundTransparency = 1
        messageLabel.Font = fontRegular
        messageLabel.Text = text
        messageLabel.TextSize = 12
        messageLabel.TextColor3 = THEME_MUTED
        messageLabel.TextTransparency = 1
        messageLabel.TextWrapped = true
        messageLabel.TextTruncate = Enum.TextTruncate.None
        messageLabel.TextXAlignment = Enum.TextXAlignment.Left
        messageLabel.TextYAlignment = Enum.TextYAlignment.Top
        messageLabel.LayoutOrder = 2
        messageLabel.Parent = content
        local entry = {
            card = card,
            stroke = stroke,
            iconFrame = iconFrame,
            iconImg = iconImg,
            title = titleLabel,
            message = messageLabel,
            removed = false,
        }
        table.insert(consoleToastEntries, entry)
        card.Position = UDim2.new(0, 20, 0, 0)
        local fadeIn = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        TweenService:Create(card, fadeIn, { BackgroundTransparency = 0.05, Position = UDim2.new(0, 0, 0, 0) }):Play()
        TweenService:Create(stroke, fadeIn, { Transparency = 0 }):Play()
        TweenService:Create(iconFrame, fadeIn, { BackgroundTransparency = 0.86 }):Play()
        TweenService:Create(iconImg, fadeIn, { ImageTransparency = 0 }):Play()
        TweenService:Create(titleLabel, fadeIn, { TextTransparency = 0 }):Play()
        TweenService:Create(messageLabel, fadeIn, { TextTransparency = 0 }):Play()
        task.delay(style.duration, function() removeConsoleToast(entry, false) end)
    end)
end
local function runnerWarn(message)
    local text = tostring(message or _cm81cgjw(""))
    warn(_cm81cgjw("\247") .. label .. _cm81cgjw("\241\147") .. text)
    local level = isConsoleError(text) and _cm81cgjw("\201\193\200\174\186") or _cm81cgjw("\219\210\200\175\161\161\177")
    showConsoleNotification(level, text)
end
local linkPanel = nil
local DISCORD_BLURPLE = THEME_ACCENT or Color3.fromRGB(88, 101, 242)
local function formatLinkCode(code)
    code = tostring(code or _cm81cgjw(""))
    if #code == 6 then return code:sub(1, 3) .. _cm81cgjw("\140") .. code:sub(4, 6) end
    return code
end
local function hideDiscordLinkPanel(linked)
    local panel = linkPanel
    if not panel then return end
    linkPanel = nil
    panel.closed = true
    pcall(function()
        if linked then
            panel.title.Text = _cm81cgjw("\232\218\201\162\167\189\178\253\136\130\156\146\101\099")
            panel.message.Text = _cm81cgjw("\255\199\219\179\188\166\184\186\196\159\154\156\032\116\109\103\117\083\094\031\022\017")
            panel.codeLabel.Text = _cm81cgjw("\232\220\212\164")
            panel.codeLabel.TextColor3 = Color3.fromRGB(16, 185, 129)
            panel.timer.Text = _cm81cgjw("")
            task.wait(1.2)
        end
        local fade = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        TweenService:Create(panel.card, fade, { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 16) }):Play()
        for _, obj in ipairs(panel.card:GetDescendants()) do
            if obj:IsA(_cm81cgjw("\248\214\194\181\132\174\180\184\136")) or obj:IsA(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133")) then
                TweenService:Create(obj, fade, { TextTransparency = 1, BackgroundTransparency = 1 }):Play()
            elseif obj:IsA(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135")) then
                TweenService:Create(obj, fade, { ImageTransparency = 1, BackgroundTransparency = 1 }):Play()
            elseif obj:IsA(_cm81cgjw("\249\250\233\181\186\160\189\184")) then
                TweenService:Create(obj, fade, { Transparency = 1 }):Play()
            elseif obj:IsA(_cm81cgjw("\234\193\219\172\173")) and obj.BackgroundTransparency < 1 then
                TweenService:Create(obj, fade, { BackgroundTransparency = 1 }):Play()
            end
        end
        task.wait(0.3)
        if panel.gui then panel.gui:Destroy() end
    end)
end
local function showDiscordLinkPanel(info, sendEvent)
    local enterMode = info and info.mode == _cm81cgjw("\200\218\201\162\167\189\178")
    local function requestNewCode() sendEvent({ event = _cm81cgjw("\192\218\212\170\151\172\185\185\129\180\128\156\102\117\107\102\116") }) end
    local code = tostring(info and info.code or _cm81cgjw(""))
    local expiresAt = os.clock() + (tonumber(info and info.expiresIn) or 300)
    local servers = {}
    if info and type(info.servers) == _cm81cgjw("\216\210\216\173\173") then
        for _, name in ipairs(info.servers) do table.insert(servers, tostring(name)) end
    end
    if #servers == 0 and info and info.server then table.insert(servers, tostring(info.server)) end
    local whereText
    if #servers == 1 then
        whereText = _cm81cgjw("\249\192\223\225\231\163\191\179\143\203\133\144\116\111\046\097\116\074\089\017\091\080\034\040\116\050\012\073\004\031\027\165") .. servers[1] .. _cm81cgjw("\140\247\211\178\171\160\164\185\196\152\151\139\118\098\124\059")
    elseif #servers > 1 then
        local last = table.remove(servers)
        whereText = _cm81cgjw("\249\192\223\225\231\163\191\179\143\203\133\144\116\111\046\097\116\074\089\017\091\080\034\040\116\050\012\073\017\025\007\165\227\245\186\213\192\202\197\216\228\143\187\170\131\136\156\145\220\112\111\099\110\122\084\094\014\027") .. table.concat(servers, _cm81cgjw("\128\147")) .. _cm81cgjw("\140\220\200\225") .. last .. _cm81cgjw("\130")
    else
        whereText = _cm81cgjw("\249\192\223\225\231\163\191\179\143\203\133\144\116\111\046\097\116\074\089\017\091\080\034\040\116\050\012\073\004\031\027\165\255\240\232\200\216\219\145\206\228\143\187\170\131\136\156\145\220\112\111\099\110\122\084\003")
    end
    if enterMode then
        whereText = whereText:gsub(_cm81cgjw("\242\230\201\164\232\224\186\180\138\128\210\142\105\115\102\053\104\075\067\066\024\092\041\041\049\123\011\007"), _cm81cgjw("\254\198\212\225\231\163\191\179\143\203\155\151")):gsub(_cm81cgjw("\137\157\158"), _cm81cgjw("")) .. _cm81cgjw("\128\147\206\169\173\161\246\184\138\159\151\139\032\115\102\112\060\064\069\085\093\031\047\057\116\060\011\031\021\004\094\252\227\230\186\201\205\221\211\147")
    end
    if linkPanel and linkPanel.card and linkPanel.card.Parent then
        if linkPanel.enterMode then
            linkPanel.message.Text = whereText
            return
        end
        linkPanel.code = code
        linkPanel.expiresAt = expiresAt
        linkPanel.refreshing = false
        linkPanel.message.Text = whereText
        linkPanel.codeLabel.Text = formatLinkCode(code)
        return
    end
    pcall(function()
        local parentGui = getGuiParent()
        if not parentGui then return end
        cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\182\144\115\100\097\103\120\111\067\095\083"))
        local gui = Instance.new(_cm81cgjw("\255\208\200\164\173\161\145\168\141"))
        gui.Name = _cm81cgjw("\224\198\219\145\186\160\162\184\135\159\182\144\115\100\097\103\120\111\067\095\083")
        gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true
        gui.DisplayOrder = 30
        gui.Parent = parentGui
        local backdrop = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        backdrop.Name = _cm81cgjw("\238\210\217\170\172\189\185\173")
        backdrop.Size = UDim2.new(1, 0, 1, 0)
        backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        backdrop.BackgroundTransparency = 1
        backdrop.BorderSizePixel = 0
        backdrop.Active = true
        backdrop.Parent = gui
        local card = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        card.Name = _cm81cgjw("\224\218\212\170\139\174\164\185")
        card.AnchorPoint = Vector2.new(0.5, 0.5)
        card.Position = UDim2.new(0.5, 0, 0.5, 16)
        card.Size = UDim2.new(0, 440, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = THEME_BG
        card.BackgroundTransparency = 1
        card.BorderSizePixel = 0
        card.Parent = gui
        Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), card).CornerRadius = UDim.new(0, 3)
        local cardSize = Instance.new(_cm81cgjw("\249\250\233\168\178\170\149\178\138\152\134\139\097\110\096\097"))
        cardSize.MaxSize = Vector2.new(440, 600)
        cardSize.Parent = card
        local stroke = Instance.new(_cm81cgjw("\249\250\233\181\186\160\189\184"))
        stroke.Color = Color3.fromRGB(45, 45, 45)
        stroke.Transparency = 1
        stroke.Parent = card
        local pad = Instance.new(_cm81cgjw("\249\250\234\160\172\171\191\179\131"))
        pad.PaddingTop, pad.PaddingBottom = UDim.new(0, 22), UDim.new(0, 22)
        pad.PaddingLeft, pad.PaddingRight = UDim.new(0, 22), UDim.new(0, 22)
        pad.Parent = card
        local list = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
        list.FillDirection = Enum.FillDirection.Vertical
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Padding = UDim.new(0, 14)
        list.Parent = card
        local header = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        header.Size = UDim2.new(1, 0, 0, 36)
        header.BackgroundTransparency = 1
        header.LayoutOrder = 1
        header.Parent = card
        local iconFrame = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        iconFrame.Size = UDim2.new(0, 36, 0, 36)
        iconFrame.BackgroundColor3 = DISCORD_BLURPLE
        iconFrame.BackgroundTransparency = 0.86
        iconFrame.BorderSizePixel = 0
        iconFrame.Parent = header
        Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), iconFrame).CornerRadius = UDim.new(0, 3)
        local icon = Instance.new(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135"))
        icon.Size = UDim2.new(0, 22, 0, 22)
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.Position = UDim2.new(0.5, 0, 0.5, 0)
        icon.BackgroundTransparency = 1
        icon.Image = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\044\026\029\004\010\006\127\123")
        icon.ImageColor3 = DISCORD_BLURPLE
        icon.Parent = iconFrame
        local title = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        title.Position = UDim2.new(0, 48, 0, 0)
        title.Size = UDim2.new(1, -48, 1, 0)
        title.BackgroundTransparency = 1
        title.Font = fontBold
        title.TextSize = 20
        title.TextColor3 = THEME_TEXT
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Text = _cm81cgjw("\224\218\212\170\232\182\185\168\150\203\182\144\115\100\097\103\120\003\094\094\024\079\042\044\045")
        title.Parent = header
        local message = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        message.Size = UDim2.new(1, 0, 0, 0)
        message.AutomaticSize = Enum.AutomaticSize.Y
        message.BackgroundTransparency = 1
        message.Font = fontRegular
        message.TextSize = 15
        message.TextColor3 = THEME_MUTED
        message.TextWrapped = true
        message.TextXAlignment = Enum.TextXAlignment.Left
        message.Text = whereText
        message.LayoutOrder = 2
        message.Parent = card
        local codeBox = Instance.new(_cm81cgjw("\234\193\219\172\173"))
        codeBox.Size = UDim2.new(1, 0, 0, 64)
        codeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        codeBox.BackgroundTransparency = 0.96
        codeBox.BorderSizePixel = 0
        codeBox.LayoutOrder = 3
        codeBox.Parent = card
        Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), codeBox).CornerRadius = UDim.new(0, 3)
        local codeLabel = Instance.new(enterMode and _cm81cgjw("\248\214\194\181\138\160\174") or _cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        if enterMode then
            codeLabel.PlaceholderText = _cm81cgjw("\156\131\138\225\248\255\230")
            codeLabel.PlaceholderColor3 = THEME_MUTED
            codeLabel.ClearTextOnFocus = false
        end
        codeLabel.Position = UDim2.new(0, 16, 0, 0)
        codeLabel.Size = UDim2.new(1, -110, 1, 0)
        codeLabel.BackgroundTransparency = 1
        codeLabel.Font = Enum.Font.RobotoMono
        codeLabel.TextSize = 34
        codeLabel.TextColor3 = THEME_TEXT
        codeLabel.TextXAlignment = Enum.TextXAlignment.Left
        codeLabel.Text = enterMode and _cm81cgjw("") or formatLinkCode(code)
        codeLabel.Parent = codeBox
        local copyBtn = Instance.new(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133"))
        copyBtn.AnchorPoint = Vector2.new(1, 0.5)
        copyBtn.Position = UDim2.new(1, -12, 0.5, 0)
        copyBtn.Size = UDim2.new(0, 80, 0, 38)
        copyBtn.BackgroundColor3 = DISCORD_BLURPLE
        copyBtn.AutoButtonColor = true
        copyBtn.Font = fontBold
        copyBtn.TextSize = 15
        copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        copyBtn.Text = enterMode and _cm81cgjw("\224\218\212\170") or _cm81cgjw("\239\220\202\184")
        copyBtn.Parent = codeBox
        Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), copyBtn).CornerRadius = UDim.new(0, 3)
        local timer = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
        timer.Size = UDim2.new(1, 0, 0, 18)
        timer.BackgroundTransparency = 1
        timer.Font = fontRegular
        timer.TextSize = 13
        timer.TextColor3 = THEME_MUTED
        timer.TextXAlignment = Enum.TextXAlignment.Left
        timer.Text = _cm81cgjw("")
        timer.LayoutOrder = 5
        timer.Parent = card
        local invite = info and info.invite and tostring(info.invite) or nil
        if invite and invite ~= _cm81cgjw("") then
            local inviteRow = Instance.new(_cm81cgjw("\234\193\219\172\173"))
            inviteRow.Size = UDim2.new(1, 0, 0, 40)
            inviteRow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            inviteRow.BackgroundTransparency = 0.97
            inviteRow.BorderSizePixel = 0
            inviteRow.LayoutOrder = 4
            inviteRow.Parent = card
            Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), inviteRow).CornerRadius = UDim.new(0, 3)
            local inviteLabel = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
            inviteLabel.Position = UDim2.new(0, 14, 0, 0)
            inviteLabel.Size = UDim2.new(1, -110, 1, 0)
            inviteLabel.BackgroundTransparency = 1
            inviteLabel.Font = fontRegular
            inviteLabel.TextSize = 14
            inviteLabel.TextColor3 = THEME_MUTED
            inviteLabel.TextXAlignment = Enum.TextXAlignment.Left
            inviteLabel.TextTruncate = Enum.TextTruncate.AtEnd
            inviteLabel.Text = _cm81cgjw("\226\220\206\225\161\161\246\169\140\142\210\138\101\117\120\112\110\028\010") .. invite:gsub(_cm81cgjw("\242\219\206\181\184\188\233\231\203\196"), _cm81cgjw(""))
            inviteLabel.Parent = inviteRow
            local inviteBtn = Instance.new(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133"))
            inviteBtn.AnchorPoint = Vector2.new(1, 0.5)
            inviteBtn.Position = UDim2.new(1, -8, 0.5, 0)
            inviteBtn.Size = UDim2.new(0, 84, 0, 28)
            inviteBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            inviteBtn.BackgroundTransparency = 0.9
            inviteBtn.AutoButtonColor = true
            inviteBtn.Font = fontBold
            inviteBtn.TextSize = 13
            inviteBtn.TextColor3 = THEME_TEXT
            inviteBtn.Text = _cm81cgjw("\239\220\202\184\232\166\184\171\141\159\151")
            inviteBtn.Parent = inviteRow
            Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), inviteBtn).CornerRadius = UDim.new(0, 3)
            inviteBtn.MouseButton1Click:Connect(function()
                local copied = false
                pcall(function()
                    local clip = setclipboard or toclipboard or (syn and syn.write_clipboard)
                    if clip then clip(invite); copied = true end
                end)
                inviteBtn.Text = copied and _cm81cgjw("\239\220\202\168\173\171") or _cm81cgjw("\227\195\223\175\232\166\162")
                task.delay(1.5, function() if inviteBtn.Parent then inviteBtn.Text = _cm81cgjw("\239\220\202\184\232\166\184\171\141\159\151") end end)
            end)
        end
        linkPanel = {
            gui = gui, card = card, title = title, message = message,
            codeLabel = codeLabel, timer = timer, code = code,
            expiresAt = expiresAt, refreshing = false, closed = false,
            enterMode = enterMode, submitBtn = copyBtn,
        }
        local panel = linkPanel
        if enterMode then
            local function submit()
                local entered = tostring(codeLabel.Text or _cm81cgjw("")):gsub(_cm81cgjw("\137\192\145"), _cm81cgjw(""))
                if not entered:match(_cm81cgjw("\242\150\222\228\172\234\178\248\128\206\150\220\100\035")) then
                    timer.Text = _cm81cgjw("\233\221\206\164\186\239\162\181\129\203\196\212\100\110\105\124\104\003\073\094\092\090\102\043\038\052\015\073\095\027\023\235\231\189")
                    return
                end
                copyBtn.Text = _cm81cgjw("\130\157\148")
                timer.Text = _cm81cgjw("\239\219\223\162\163\166\184\186\196\159\154\156\032\100\097\113\121\013\004\031")
                sendEvent({ event = _cm81cgjw("\192\218\212\170\151\172\185\185\129\180\129\140\098\106\103\097"), code = entered })
            end
            copyBtn.MouseButton1Click:Connect(submit)
            codeLabel.FocusLost:Connect(function(enterPressed) if enterPressed then submit() end end)
        end
        if not enterMode then copyBtn.MouseButton1Click:Connect(function()
            local copied = false
            pcall(function()
                local clip = setclipboard or toclipboard or (syn and syn.write_clipboard)
                if clip then clip(tostring(panel.code)); copied = true end
            end)
            copyBtn.Text = copied and _cm81cgjw("\239\220\202\168\173\171") or _cm81cgjw("\248\202\202\164\232\166\162")
            task.delay(1.5, function() if copyBtn.Parent then copyBtn.Text = _cm81cgjw("\239\220\202\184") end end)
        end) end
        local fadeIn = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        TweenService:Create(card, fadeIn, { BackgroundTransparency = 0.03, Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
        TweenService:Create(backdrop, fadeIn, { BackgroundTransparency = 0.45 }):Play()
        TweenService:Create(stroke, fadeIn, { Transparency = 0 }):Play()
        if not enterMode then task.spawn(function()
            while not panel.closed and card.Parent do
                local left = math.max(0, math.floor(panel.expiresAt - os.clock()))
                if left > 0 then
                    timer.Text = string.format(_cm81cgjw("\239\220\222\164\232\170\174\173\141\153\151\138\032\110\096\053\057\071\016\020\008\013\034"), math.floor(left / 60), left % 60)
                elseif not panel.refreshing then
                    panel.refreshing = true
                    timer.Text = _cm81cgjw("\239\220\222\164\232\170\174\173\141\153\151\157\032\042\046\114\121\087\094\088\086\088\102\044\116\053\007\030\080\024\016\224\162\189\180")
                    pcall(requestNewCode)
                end
                task.wait(1)
            end
        end) end
    end)
end
local function showDiscordLinkError(message)
    local panel = linkPanel
    if not panel or not panel.enterMode then return end
    pcall(function()
        panel.timer.Text = tostring(message or _cm81cgjw("\248\219\219\181\232\172\185\185\129\203\150\144\100\105\041\097\060\084\069\067\083\017"))
        if panel.submitBtn then panel.submitBtn.Text = _cm81cgjw("\224\218\212\170") end
    end)
end
local function runnerPrint(message)
    local text = tostring(message or _cm81cgjw(""))
    print(_cm81cgjw("\247") .. label .. _cm81cgjw("\241\147") .. text)
    local level = isConsoleSuccess(text) and _cm81cgjw("\223\198\217\162\173\188\165") or _cm81cgjw("\197\221\220\174")
    showConsoleNotification(level, text)
end
local function runnerQuiet()
end
local sha256 = {}
do
    local band, rshift, lshift, bxor, bnot = bit32.band, bit32.rshift, bit32.lshift, bit32.bxor, bit32.bnot
    local add = function(...)
        local sum = 0
        for _, v in ipairs({...}) do sum = (sum + v) % 4294967296 end
        return sum
    end
    local rrotate = function(x, n)
        return bxor(rshift(x, n), lshift(x, 32 - n))
    end
    local h_init = {
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
        0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
    }
    local k = {
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    }
    local function str_to_bytes(str)
        local bytes = {}
        for i = 1, #str do table.insert(bytes, string.byte(str, i)) end
        return bytes
    end
    local function bytes_to_hex(bytes)
        local hex = {}
        for _, b in ipairs(bytes) do table.insert(hex, string.format(_cm81cgjw("\137\131\136\185"), b)) end
        return table.concat(hex)
    end
    local function block_hash(block, h)
        local w = {}
        for i = 1, 16 do
            w[i] = add(lshift(block[4*i - 3], 24), lshift(block[4*i - 2], 16), lshift(block[4*i - 1], 8), block[4*i])
        end
        for i = 17, 64 do
            local s0 = bxor(bxor(rrotate(w[i-15], 7), rrotate(w[i-15], 18)), rshift(w[i-15], 3))
            local s1 = bxor(bxor(rrotate(w[i-2], 17), rrotate(w[i-2], 19)), rshift(w[i-2], 10))
            w[i] = add(w[i-16], s0, w[i-7], s1)
        end
        local a, b, c, d, e, f, g, h_val = h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]
        for i = 1, 64 do
            local S1 = bxor(bxor(rrotate(e, 6), rrotate(e, 11)), rrotate(e, 25))
            local ch = bxor(band(e, f), band(bnot(e), g))
            local temp1 = add(h_val, S1, ch, k[i], w[i])
            local S0 = bxor(bxor(rrotate(a, 2), rrotate(a, 13)), rrotate(a, 22))
            local maj = bxor(bxor(band(a, b), band(a, c)), band(b, c))
            local temp2 = add(S0, maj)
            h_val = g; g = f; f = e; e = add(d, temp1); d = c; c = b; b = a; a = add(temp1, temp2)
        end
        h[1] = add(h[1], a); h[2] = add(h[2], b); h[3] = add(h[3], c); h[4] = add(h[4], d)
        h[5] = add(h[5], e); h[6] = add(h[6], f); h[7] = add(h[7], g); h[8] = add(h[8], h_val)
    end
    function sha256.digest(str)
        local h = { unpack(h_init) }
        local bytes = str_to_bytes(str)
        local bit_len = #bytes * 8
        table.insert(bytes, 0x80)
        while (#bytes % 64) ~= 56 do table.insert(bytes, 0) end
        for i = 7, 0, -1 do table.insert(bytes, band(rshift(bit_len, i * 8), 0xFF)) end
        for chunk = 1, #bytes / 64 do
            local block = {}
            for i = 1, 64 do table.insert(block, bytes[(chunk-1)*64 + i]) end
            block_hash(block, h)
        end
        local result = {}
        for _, val in ipairs(h) do
            for i = 3, 0, -1 do table.insert(result, band(rshift(val, i * 8), 0xFF)) end
        end
        return result
    end
    function sha256.hmac(key, message)
        local key_bytes = str_to_bytes(key)
        if #key_bytes > 64 then key_bytes = sha256.digest(key) end
        while #key_bytes < 64 do table.insert(key_bytes, 0) end
        local ipad, opad = {}, {}
        for i = 1, 64 do ipad[i] = bxor(key_bytes[i], 0x36); opad[i] = bxor(key_bytes[i], 0x5C) end
        local inner_payload = {}
        for _, b in ipairs(ipad) do table.insert(inner_payload, string.char(b)) end
        for _, b in ipairs(str_to_bytes(message)) do table.insert(inner_payload, string.char(b)) end
        local inner_hash = sha256.digest(table.concat(inner_payload))
        local outer_payload = {}
        for _, b in ipairs(opad) do table.insert(outer_payload, string.char(b)) end
        for _, b in ipairs(inner_hash) do table.insert(outer_payload, string.char(b)) end
        return bytes_to_hex(sha256.digest(table.concat(outer_payload)))
    end
end
local HEX_NIBBLE = {}
for i = 0, 9 do HEX_NIBBLE[48 + i] = i end
for i = 0, 5 do HEX_NIBBLE[97 + i] = 10 + i; HEX_NIBBLE[65 + i] = 10 + i end
local DECRYPT_BATCH = 4096          
local DECRYPT_YIELD_EVERY = 262144  
local function decryptXOR(hexText, seedKey)
    local secret = seedKey .. SECRET_KEY
    local n = #secret
    local keyBytes = { string.byte(secret, 1, n) }
    local stream = {}
    for r = 0, n - 1 do
        stream[r] = keyBytes[((r + keyBytes[r + 1]) % n) + 1]
    end
    local bxor, char, sbyte, concat = bit32.bxor, string.char, string.byte, table.concat
    local total = #hexText
    local canYield = total > DECRYPT_YIELD_EVERY and task and task.wait
    local out = {}
    local r = 0
    local sinceYield = 0
    local i = 1
    while i <= total do
        local j = i + DECRYPT_BATCH - 1
        if j > total then j = total end
        local bytes = { sbyte(hexText, i, j) }
        local batch = {}
        local bn = 0
        for k = 1, #bytes - 1, 2 do
            local hi, lo = HEX_NIBBLE[bytes[k]], HEX_NIBBLE[bytes[k + 1]]
            if hi and lo then
                bn = bn + 1
                batch[bn] = bxor(hi * 16 + lo, stream[r])
                r = r + 1
                if r == n then r = 0 end
            end
        end
        local parts = {}
        for s = 1, bn, 1024 do
            local e = s + 1023
            if e > bn then e = bn end
            parts[#parts + 1] = char(unpack(batch, s, e))
        end
        out[#out + 1] = concat(parts)
        i = j + 1
        sinceYield = sinceYield + DECRYPT_BATCH
        if canYield and sinceYield >= DECRYPT_YIELD_EVERY then
            sinceYield = 0
            task.wait()
        end
    end
    return concat(out)
end
local hwid = _cm81cgjw("\234\210\214\173\170\174\181\182\201\163\165\176\068\042") .. tostring(userId)
pcall(function()
    if gethwid then hwid = gethwid()
    elseif syn and syn.gethwid then hwid = syn.gethwid() end
end)
local executor = _cm81cgjw("\249\221\209\175\167\184\184")
pcall(function()
    local function getVal(fnName)
        if getgenv then
            local ok, val = pcall(function() return getgenv()[fnName] end)
            if ok and val ~= nil then return val end
        end
        if _G then
            local ok, val = pcall(function() return _G[fnName] end)
            if ok and val ~= nil then return val end
        end
        if shared then
            local ok, val = pcall(function() return shared[fnName] end)
            if ok and val ~= nil then return val end
        end
        local ok, val = pcall(function() return getfenv()[fnName] end)
        if ok and val ~= nil then return val end
        return nil
    end
    local idFn = getVal(_cm81cgjw("\197\215\223\175\188\166\176\164\129\147\151\154\117\115\097\103"))
        or getVal(_cm81cgjw("\203\214\206\164\176\170\181\168\144\132\128\151\097\106\107"))
        or getVal(_cm81cgjw("\203\214\206\164\176\170\181\168\144\132\128"))
        or (syn and syn.identifyexecutor)
        or (delta and delta.identifyexecutor)
        or (fluxus and fluxus.identifyexecutor)
    if type(idFn) == _cm81cgjw("\202\198\212\162\188\166\185\179") then
        local ok, res1, res2 = pcall(idFn)
        if ok and res1 then
            if type(res1) == _cm81cgjw("\223\199\200\168\166\168") and res1 ~= _cm81cgjw("") then
                local ver = (type(res2) == _cm81cgjw("\223\199\200\168\166\168") and res2 ~= _cm81cgjw("")) and (_cm81cgjw("\140") .. res2) or _cm81cgjw("")
                executor = res1 .. ver
            elseif type(res1) == _cm81cgjw("\216\210\216\173\173") then
                executor = tostring(res1.name or res1.Name or res1[1] or _cm81cgjw("\249\221\209\175\167\184\184"))
            end
        end
    end
    if executor == _cm81cgjw("\249\221\209\175\167\184\184") then
        local infoFn = getVal(_cm81cgjw("\203\214\206\164\176\170\181\168\144\132\128\144\110\097\097"))
        if type(infoFn) == _cm81cgjw("\202\198\212\162\188\166\185\179") then
            local ok, info = pcall(infoFn)
            if ok and info then
                if type(info) == _cm81cgjw("\216\210\216\173\173") then
                    executor = tostring(info.name or info.Name or info[1] or _cm81cgjw("\249\221\209\175\167\184\184"))
                elseif type(info) == _cm81cgjw("\223\199\200\168\166\168") and info ~= _cm81cgjw("") then
                    executor = info
                end
            end
        end
    end
    if executor == _cm81cgjw("\249\221\209\175\167\184\184") then
        if getVal(_cm81cgjw("\252\252\238\128\155\156\159\136\169\180\190\182\065\067\075\081")) or getVal(_cm81cgjw("\220\220\206\160\187\188\191\168\137")) then executor = _cm81cgjw("\252\220\206\160\187\188\191\168\137")
        elseif getVal(_cm81cgjw("\255\252\246\128\154\142\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\223\220\214\160\186\174")) then executor = _cm81cgjw("\255\220\214\160\186\174")
        elseif getVal(_cm81cgjw("\251\242\236\132\151\131\153\156\160\174\182")) or getVal(_cm81cgjw("\219\210\204\164")) then executor = _cm81cgjw("\251\210\204\164")
        elseif getVal(_cm81cgjw("\232\246\246\149\137\144\154\146\165\175\183\189")) or getVal(_cm81cgjw("\200\214\214\181\169")) then executor = _cm81cgjw("\232\214\214\181\169")
        elseif getVal(_cm81cgjw("\239\252\254\132\144\144\154\146\165\175\183\189")) or getVal(_cm81cgjw("\207\220\222\164\176")) then executor = _cm81cgjw("\239\220\222\164\176")
        elseif getVal(_cm81cgjw("\225\242\249\146\152\131\153\148\176\180\190\182\065\067\075\081")) or getVal(_cm81cgjw("\193\210\217\178\184\163\185\180\144")) then executor = _cm81cgjw("\225\210\217\146\184\163\185\180\144")
        elseif getVal(_cm81cgjw("\250\246\246\142\139\134\130\132\187\167\189\184\068\066\074")) or getVal(_cm81cgjw("\218\214\214\174\171\166\162\164")) then executor = _cm81cgjw("\250\214\214\174\171\166\162\164")
        elseif getVal(_cm81cgjw("\250\252\246\149\151\131\153\156\160\174\182")) or getVal(_cm81cgjw("\218\220\214\181")) then executor = _cm81cgjw("\250\220\214\181")
        elseif getVal(_cm81cgjw("\244\246\244\142\151\131\153\156\160\174\182")) or getVal(_cm81cgjw("\212\214\212\174")) then executor = _cm81cgjw("\244\214\212\174")
        elseif getVal(_cm81cgjw("\255\228\243\135\156\144\154\146\165\175\183\189")) or getVal(_cm81cgjw("\223\196\211\167\188")) then executor = _cm81cgjw("\255\196\211\167\188")
        elseif getVal(_cm81cgjw("\231\225\244\141\151\131\153\156\160\174\182")) or getVal(_cm81cgjw("\199\193\212\173")) then executor = _cm81cgjw("\231\225\244\141")
        elseif getVal(_cm81cgjw("\228\234\254\147\135\136\147\147\187\167\189\184\068\066\074")) or getVal(_cm81cgjw("\196\202\222\179\167\168\179\179")) then executor = _cm81cgjw("\228\202\222\179\167\168\179\179")
        elseif getVal(_cm81cgjw("\234\255\239\153\157\156\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\202\223\207\185\189\188")) then executor = _cm81cgjw("\234\223\207\185\189\188")
        elseif getVal(_cm81cgjw("\237\225\249\132\157\156\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\205\193\217\164\189\188")) then executor = _cm81cgjw("\237\193\217\164\189\188")
        elseif getVal(_cm81cgjw("\239\246\246\132\154\150\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\207\214\214\164\186\182")) then executor = _cm81cgjw("\239\214\214\164\186\182")
        elseif getVal(_cm81cgjw("\237\227\234\141\141\152\151\143\161\180\190\182\065\067\075\081")) or getVal(_cm81cgjw("\205\195\202\173\173\184\183\175\129")) then executor = _cm81cgjw("\237\195\202\173\173\184\183\175\129")
        elseif getVal(_cm81cgjw("\239\230\248\136\144\144\154\146\165\175\183\189")) or getVal(_cm81cgjw("\207\198\216\168\176")) then executor = _cm81cgjw("\239\198\216\168\176")
        elseif getVal(_cm81cgjw("\226\246\224\148\154\144\154\146\165\175\183\189")) or getVal(_cm81cgjw("\194\214\192\180\186")) then executor = _cm81cgjw("\226\214\192\180\186")
        elseif getVal(_cm81cgjw("\254\246\251\141\151\131\153\156\160\174\182")) or getVal(_cm81cgjw("\222\214\219\173")) then executor = _cm81cgjw("\254\214\219\173")
        elseif getVal(_cm81cgjw("\225\242\254\136\157\130\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\193\210\222\168\189\162")) then executor = _cm81cgjw("\225\210\222\168\189\162")
        elseif getVal(_cm81cgjw("\239\252\233\140\129\140\137\145\171\170\182\188\068")) or getVal(_cm81cgjw("\207\220\201\172\161\172")) then executor = _cm81cgjw("\239\220\201\172\161\172")
        elseif syn then executor = _cm81cgjw("\255\202\212\160\184\188\179") end
    end
end)
local isLowSyncExecutor = false
pcall(function()
    local execLower = string.lower(tostring(executor or _cm81cgjw("")))
    isLowSyncExecutor = execLower:find(_cm81cgjw("\212\214\212\174"), 1, true) ~= nil
        or execLower:find(_cm81cgjw("\223\220\214\160\186\174"), 1, true) ~= nil
        or execLower:find(_cm81cgjw("\200\214\214\181\169"), 1, true) ~= nil
        or execLower:find(_cm81cgjw("\220\220\206\160\187\188\191\168\137"), 1, true) ~= nil
end)
local isEnvironmentTampered = false
pcall(function()
    if type(math) ~= _cm81cgjw("\216\210\216\173\173") or type(math.floor) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") then isEnvironmentTampered = true end
    if type(string) ~= _cm81cgjw("\216\210\216\173\173") or type(string.byte) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") or type(string.char) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") then isEnvironmentTampered = true end
    if type(table) ~= _cm81cgjw("\216\210\216\173\173") or type(table.concat) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") or type(table.insert) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") then isEnvironmentTampered = true end
    if type(bit32) ~= _cm81cgjw("\216\210\216\173\173") or type(bit32.bxor) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") then isEnvironmentTampered = true end
end)
if isEnvironmentTampered then
    SECRET_KEY = string.reverse(tostring(SECRET_KEY)) .. _cm81cgjw("\243\231\251\140\152\138\132\152\160")
end
local SCRIPT_TAG = (SCRIPT_ID ~= _cm81cgjw("") and SCRIPT_ID ~= "tA8K5WOs7Nzm-C3D") and tostring(SCRIPT_ID) or _cm81cgjw("\200\214\220\160\189\163\162")
local _LP_STORE = nil
pcall(function()
    local g = (getgenv and getgenv()) or shared or _G
    if g then
        if type(g._luaprotect_store) ~= _cm81cgjw("\216\210\216\173\173") then
            g._luaprotect_store = {
                sockets = {},
                sessions = {},
                invocations = {},
                executed = {},
                keys = {},
                rids = {},
                run_ids = {}
            }
        end
        _LP_STORE = g._luaprotect_store
        if getgenv then getgenv()._luaprotect_store = _LP_STORE end
        if shared then shared._luaprotect_store = _LP_STORE end
        if _G then _G._luaprotect_store = _LP_STORE end
    end
end)
local _PARENT_WS = (_LP_STORE and _LP_STORE.sockets[SCRIPT_TAG]) or (SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") and ((getgenv and getgenv().sentinel_ws) or (shared and shared.sentinel_ws) or (_G and _G.sentinel_ws)) or nil)
local _PARENT_KEY = (_LP_STORE and _LP_STORE.keys[SCRIPT_TAG]) or (SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") and ((getgenv and getgenv()._luaprotect_key) or (shared and shared._luaprotect_key) or (_G and _G._luaprotect_key)) or nil)
local _PERSISTED_RUNNER_ID = (_LP_STORE and _LP_STORE.rids[SCRIPT_TAG]) or (SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") and ((getgenv and getgenv()._luaprotect_rid) or (shared and shared._luaprotect_rid) or (_G and _G._luaprotect_rid)) or nil)
local _PERSISTED_RUN_ID = (_LP_STORE and _LP_STORE.run_ids[SCRIPT_TAG]) or (SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") and ((getgenv and getgenv()._luaprotect_run_id) or (shared and shared._luaprotect_run_id) or (_G and _G._luaprotect_run_id)) or nil)
if IS_TELEPORT_RECONNECT then
    if HANDOFF_RUNNER_ID ~= _cm81cgjw("") then _PERSISTED_RUNNER_ID = HANDOFF_RUNNER_ID end
    if HANDOFF_KEY ~= _cm81cgjw("") then _PARENT_KEY = HANDOFF_KEY end
    if HANDOFF_RUN_ID ~= _cm81cgjw("") then _PERSISTED_RUN_ID = HANDOFF_RUN_ID end
end
local IS_NESTED_IMPORT = "0" == _cm81cgjw("\157")
local IS_FRESH_FALLBACK = false
local MY_LAST_CONNECT_ATTEMPT = 0
local INVOCATION_MARKER = table.concat({
    tostring(os.time()),
    tostring(math.floor(os.clock() * 1000000)),
    tostring(math.random(100000, 999999)),
    tostring({})
}, _cm81cgjw("\150"))
local INVOCATION_OWNER = (getgenv and getgenv().sentinel_invocation)
    or (shared and shared.sentinel_invocation)
    or (_G and _G.sentinel_invocation)
if _LP_STORE and _LP_STORE.invocations[SCRIPT_TAG] then
    INVOCATION_OWNER = _LP_STORE.invocations[SCRIPT_TAG]
elseif SCRIPT_TAG ~= _cm81cgjw("\200\214\220\160\189\163\162") then
    INVOCATION_OWNER = nil
end
if not IS_NESTED_IMPORT and not IS_TELEPORT_RECONNECT then
    if _LP_STORE then _LP_STORE.invocations[SCRIPT_TAG] = INVOCATION_MARKER end
    if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv then getgenv().sentinel_invocation = INVOCATION_MARKER end
        if shared then shared.sentinel_invocation = INVOCATION_MARKER end
        if _G then _G.sentinel_invocation = INVOCATION_MARKER end
    end
    INVOCATION_OWNER = INVOCATION_MARKER
    if _LP_STORE then _LP_STORE.executed[SCRIPT_TAG] = {} end
    if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv then getgenv()._luaprotect_executed = {} end
        if shared then shared._luaprotect_executed = {} end
        if _G then _G._luaprotect_executed = {} end
    end
end
local canUseParentImport = false
if IS_NESTED_IMPORT and not canUseParentImport then
    IS_FRESH_FALLBACK = true
end
if canUseParentImport then
    local parentImportSucceeded = false
    local requestFunc = (syn and syn.request) or request or http_request or (http and http.request)
    local childRunnerId, childKey = nil, nil
    local importCheck = nil
    local importRequestId = nil
    do
        local keyUrl = HOST_URL .. _cm81cgjw("\131\210\202\168\231\189\163\179\138\142\128\212\107\098\119\042\111\064\088\088\072\075\015\041\105") .. SCRIPT_ID
        local keyBody = nil
        local IMPORT_KEY_MAX_RETRIES = 3
        for _attempt = 1, IMPORT_KEY_MAX_RETRIES do
            keyBody = nil
            importCheck = nil
            local requestTransportFailed = false
            if requestFunc then
                local ok, res = pcall(requestFunc, { Url = keyUrl, Method = _cm81cgjw("\235\246\238") })
                if ok and res then
                    importCheck = tostring(res.StatusCode or res.status or _cm81cgjw("\217\221\209\175\167\184\184"))
                    importRequestId = res.Headers and (res.Headers[_cm81cgjw("\244\158\246\180\169\159\164\178\144\142\145\141\045\085\107\100\105\070\089\069\021\118\034")] or res.Headers[_cm81cgjw("\212\158\214\180\169\191\164\178\144\142\145\141\045\117\107\100\105\070\089\069\021\086\034")])
                    local statusCode = tonumber(res.StatusCode or res.status)
                    if statusCode == 200 then
                        keyBody = res.Body
                    elseif statusCode == 429 then
                        local retryAfter = 5
                        pcall(function()
                            local h = res.Headers or res.headers or {}
                            local ra = h[_cm81cgjw("\254\214\206\179\177\226\151\187\144\142\128")] or h[_cm81cgjw("\222\214\206\179\177\226\183\187\144\142\128")]
                            if ra then retryAfter = tonumber(ra) or 5 end
                        end)
                        waitWithCountdown(retryAfter)
                    end
                else
                    importCheck = _cm81cgjw("\222\214\203\180\173\188\162\240\129\153\128\150\114")
                    requestTransportFailed = true
                end
            else
                requestTransportFailed = true
            end
            if not keyBody and requestTransportFailed and statusCode ~= 429 then
                local ok, response = pcall(function() return game:HttpGet(keyUrl) end)
                if ok then keyBody = response else importCheck = importCheck or _cm81cgjw("\196\199\206\177\175\170\162\240\129\153\128\150\114") end
            end
            if keyBody then break end
        end
        if keyBody then
            local ok, data = pcall(HttpService.JSONDecode, HttpService, keyBody)
            if ok and data and data.runnerId and data.key then
                childRunnerId = tostring(data.runnerId)
                childKey = tostring(data.key)
            end
        end
    end
    if childKey and childRunnerId then
        local url = HOST_URL .. _cm81cgjw("\131\210\202\168\231\188\181\175\141\155\134\212\099\104\096\097\121\077\094\030") .. SCRIPT_ID
        local timestamp = tostring(os.time())
        pcall(function()
            local serverTime = workspace:GetServerTimeNow()
            if serverTime and serverTime > 0 then timestamp = tostring(math.floor(serverTime)) end
        end)
        local chars = _cm81cgjw("\205\209\217\165\173\169\177\181\141\129\153\149\109\105\097\101\109\081\089\069\077\073\049\053\045\033\035\043\051\051\059\195\203\219\211\235\227\227\251\243\139\155\131\139\179\179\187\163\171\091\083\075\040\046\020\030\000\014\116\126\104\110")
        local nonce = {}
        local rng = Random.new()
        for _ = 1, 16 do
            local idx = rng:NextInteger(1, #chars)
            table.insert(nonce, chars:sub(idx, idx))
        end
        nonce = table.concat(nonce)
        local sigPayload = tostring(userId) .. _cm81cgjw("\130") .. tostring(hwid) .. _cm81cgjw("\130") .. timestamp .. _cm81cgjw("\130") .. nonce .. _cm81cgjw("\130\131")
        local signature = sha256.hmac(childKey, sigPayload)
        local body = nil
        local bodyFromSigned = false
        if requestFunc then
            local ok, res = pcall(requestFunc, { Url = url, Method = _cm81cgjw("\235\246\238"), Headers = {
                [_cm81cgjw("\244\158\233\168\175\161\183\169\145\153\151")] = signature, [_cm81cgjw("\244\158\238\168\165\170\165\169\133\134\130")] = timestamp, [_cm81cgjw("\244\158\244\174\166\172\179")] = nonce,
                [_cm81cgjw("\244\158\239\178\173\189\251\148\128")] = tostring(userId), [_cm81cgjw("\244\158\242\182\161\171")] = tostring(hwid), [_cm81cgjw("\244\158\232\180\166\161\179\175\201\162\150")] = childRunnerId
            }})
            if ok and res and res.StatusCode == 200 then body = res.Body; bodyFromSigned = true end
        end
        if not body and not bodyFromSigned then
            importCheck = importCheck or _cm81cgjw("\223\218\221\175\173\171\251\175\129\154\135\156\115\115\035\115\125\074\070\084\092")
        end
        if body then
            local refused = false
            if not bodyFromSigned then
                if body:sub(1, 1) == _cm81cgjw("\215") then
                    pcall(function()
                        local data = HttpService:JSONDecode(body)
                        if data and (data.error or data.message) then
                            runnerWarn(_cm81cgjw("\229\222\202\174\186\187\246\184\150\153\157\139\058\039") .. tostring(data.error or data.message))
                        end
                    end)
                    refused = true
                elseif body:sub(1, 2) == _cm81cgjw("\129\158") then
                    runnerWarn(_cm81cgjw("\229\222\202\174\186\187\246\175\129\141\135\138\101\099\052\053") .. body:sub(1, 120))
                    refused = true
                end
            end
            if not refused then
                body = body:gsub(_cm81cgjw("\067\008\005"), _cm81cgjw(""))
                body = body:gsub(_cm81cgjw("\078\051\225\074\229\064\139"), _cm81cgjw(""))
                local fn, err = loadstring(body)
                if fn then
                    parentImportSucceeded = true
                    local execOk, execErr = pcall(fn)
                    if not execOk then
                        runnerWarn(_cm81cgjw("\229\222\202\174\186\187\246\184\156\142\145\140\116\110\097\123\060\070\088\067\087\077\124\109") .. tostring(execErr))
                    end
                else
                    runnerWarn(_cm81cgjw("\229\222\202\174\186\187\246\177\139\138\150\138\116\117\103\123\123\003\079\067\074\080\052\119\116") .. tostring(err))
                end
            end
        else
            local suffix = importCheck and (_cm81cgjw("\140\155\251\145\129\239\181\181\129\136\153\217") .. tostring(importCheck) .. (importRequestId and (_cm81cgjw("\128\147\200\164\185\186\179\174\144\203") .. tostring(importRequestId)) or _cm81cgjw("")) .. _cm81cgjw("\133")) or _cm81cgjw("")
            runnerQuiet(_cm81cgjw("\234\210\211\173\173\171\246\169\139\203\155\148\112\104\124\097\060\080\073\067\081\079\050\109") .. SCRIPT_ID .. suffix)
        end
    else
        runnerQuiet(_cm81cgjw("\239\220\207\173\172\239\184\178\144\203\159\144\110\115\046\124\113\083\069\067\076\031\045\040\045\123\004\006\002\087") .. SCRIPT_ID .. _cm81cgjw("\140\158\154\167\169\163\186\180\138\140\210\155\097\100\101\053\104\076\010\102\093\093\021\034\055\048\007\029\080\019\027\233\229\229\255\211\209"))
    end
    if parentImportSucceeded then return end
    IS_FRESH_FALLBACK = true
end
if IS_FRESH_FALLBACK and not IS_TELEPORT_RECONNECT then
    if _LP_STORE then _LP_STORE.invocations[SCRIPT_TAG] = INVOCATION_MARKER end
    if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv then getgenv().sentinel_invocation = INVOCATION_MARKER end
        if shared then shared.sentinel_invocation = INVOCATION_MARKER end
        if _G then _G.sentinel_invocation = INVOCATION_MARKER end
    end
    INVOCATION_OWNER = INVOCATION_MARKER
end
local function fetchRunnerKey()
    if SECRET_KEY and SECRET_KEY ~= _cm81cgjw("") and SECRET_KEY ~= "be601a672e0b5021bc3c89015fe929e60efbb18c5c1bc942b478916629ccc9fe"
       and RUNNER_ID and RUNNER_ID ~= _cm81cgjw("") and RUNNER_ID ~= "2c0ace4275a74e91a4ad5339f720d105" then
        if _LP_STORE then
            _LP_STORE.keys[SCRIPT_TAG] = SECRET_KEY
            _LP_STORE.rids[SCRIPT_TAG] = RUNNER_ID
        end
        if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
            if getgenv then
                getgenv()._luaprotect_key = SECRET_KEY
                getgenv()._luaprotect_rid = RUNNER_ID
            end
            if shared then
                shared._luaprotect_key = SECRET_KEY
                shared._luaprotect_rid = RUNNER_ID
            end
            if _G then
                _G._luaprotect_key = SECRET_KEY
                _G._luaprotect_rid = RUNNER_ID
            end
        end
        return true
    end
    if IS_TELEPORT_RECONNECT then
        if not _PERSISTED_RUNNER_ID or not _PERSISTED_RUN_ID or not _PARENT_KEY then
            runnerWarn(_cm81cgjw("\239\210\212\175\167\187\246\175\129\152\134\150\114\098\046\118\115\077\094\088\086\074\041\056\039\123\017\012\003\004\023\234\226\179\243\197\205\193\194\212\176\178\233\249\144\139\139\148\143\102\042\099\125\050\067\085\081\088\055\061\053\119\042\013\009\083\009\226\250\230\230\233"))
            return false
        end
        RUNNER_ID = tostring(_PERSISTED_RUNNER_ID)
        SECRET_KEY = tostring(_PARENT_KEY)
        return true
    end
    local url = HOST_URL .. _cm81cgjw("\131\210\202\168\231\189\163\179\138\142\128\212\107\098\119")
    if SCRIPT_ID ~= _cm81cgjw("") then url = url .. _cm81cgjw("\147\192\217\179\161\191\162\148\128\214") .. SCRIPT_ID end
    local body = nil
    local keyCheck = nil
    local KEY_FETCH_MAX_RETRIES = 3
    for _attempt = 1, KEY_FETCH_MAX_RETRIES do
        body = nil
        keyCheck = nil
        local requestTransportFailed = false
        local requestFunc = (syn and syn.request) or request or http_request or (http and http.request)
        if requestFunc then
            local ok, res = pcall(requestFunc, { Url = url, Method = _cm81cgjw("\235\246\238") })
            if ok and res then
                keyCheck = tostring(res.StatusCode or res.status or _cm81cgjw("\217\221\209\175\167\184\184"))
                local statusCode = tonumber(res.StatusCode or res.status)
                if statusCode == 200 then
                    body = res.Body
                elseif statusCode == 429 then
                    local retryAfter = 5
                    pcall(function()
                        local h = res.Headers or res.headers or {}
                        local ra = h[_cm81cgjw("\254\214\206\179\177\226\151\187\144\142\128")] or h[_cm81cgjw("\222\214\206\179\177\226\183\187\144\142\128")]
                        if ra then retryAfter = tonumber(ra) or 5 end
                    end)
                    runnerWarn(_cm81cgjw("\254\198\212\175\173\189\246\182\129\146\210\159\101\115\109\125\060\081\075\069\093\018\042\036\057\050\022\012\020\087\086\177\190\170\179\129\133\143\196\216\176\185\171\176\142\128\206\156\146\035") .. retryAfter .. _cm81cgjw("\223"))
                    waitWithCountdown(retryAfter)
                end
            else
                keyCheck = _cm81cgjw("\222\214\203\180\173\188\162\240\129\153\128\150\114")
                requestTransportFailed = true
            end
        else
            requestTransportFailed = true
        end
        if not body and requestTransportFailed and statusCode ~= 429 then
            local ok, response = pcall(function() return game:HttpGet(url) end)
            if ok then body = response else keyCheck = keyCheck or _cm81cgjw("\196\199\206\177\175\170\162\240\129\153\128\150\114") end
        end
        if body then break end
    end
    if body then
        local ok, data = pcall(HttpService.JSONDecode, HttpService, body)
        if ok and data and data.runnerId and data.key then
            RUNNER_ID = data.runnerId
            SECRET_KEY = data.key
            if _LP_STORE then
                _LP_STORE.keys[SCRIPT_TAG] = data.key
                _LP_STORE.rids[SCRIPT_TAG] = data.runnerId
            end
            if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
                if getgenv then
                    getgenv()._luaprotect_key = data.key
                    getgenv()._luaprotect_rid = data.runnerId
                end
                if shared then
                    shared._luaprotect_key = data.key
                    shared._luaprotect_rid = data.runnerId
                end
                if _G then
                    _G._luaprotect_key = data.key
                    _G._luaprotect_rid = data.runnerId
                end
            end
            return true
        end
    end
    runnerWarn(_cm81cgjw("\234\210\211\173\173\171\246\169\139\203\148\156\116\100\102\053\110\086\068\095\093\077\102\038\049\034\066\065\049\039\055\165\239\251\255\194\195\143") .. tostring(keyCheck or _cm81cgjw("\217\221\209\175\167\184\184")) .. _cm81cgjw("\133"))
    return false
end
pcall(function()
    local existing = (_LP_STORE and _LP_STORE.sockets[SCRIPT_TAG])
    if not existing and SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        existing = (getgenv and getgenv().sentinel_ws)
            or (shared and shared.sentinel_ws)
            or (_G and _G.sentinel_ws)
    end
    if existing and existing.Close then 
        pcall(function() existing:Close() end)
        task.wait(0.15)
    end
    if _LP_STORE then _LP_STORE.sockets[SCRIPT_TAG] = nil end
    if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv and getgenv().sentinel_ws == existing then getgenv().sentinel_ws = nil end
        if shared and shared.sentinel_ws == existing then shared.sentinel_ws = nil end
        if _G and _G.sentinel_ws == existing then _G.sentinel_ws = nil end
    end
end)
if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
    if getgenv then getgenv().sentinel_reconnect = false end
end
local function makeRequest(url, data, isReconnectFlag)
    local jsonStr = encodeJSON(data)
    local timestamp = tostring(os.time())
    pcall(function()
        local serverTime = workspace:GetServerTimeNow()
        if serverTime and serverTime > 0 then timestamp = tostring(math.floor(serverTime)) end
    end)
    local chars = _cm81cgjw("\205\209\217\165\173\169\177\181\141\129\153\149\109\105\097\101\109\081\089\069\077\073\049\053\045\033\035\043\051\051\059\195\203\219\211\235\227\227\251\243\139\155\131\139\179\179\187\163\171\091\083\075\040\046\020\030\000\014\116\126\104\110")
    local nonce = {}
    local rng = Random.new()
    for _ = 1, 16 do
        local idx = rng:NextInteger(1, #chars)
        table.insert(nonce, chars:sub(idx, idx))
    end
    nonce = table.concat(nonce)
    local reconnectBit = (isReconnectFlag and _cm81cgjw("\157") or _cm81cgjw("\156"))
    local sigPayload = tostring(userId) .. _cm81cgjw("\130") .. tostring(hwid) .. _cm81cgjw("\130") .. timestamp .. _cm81cgjw("\130") .. nonce .. _cm81cgjw("\130") .. reconnectBit .. _cm81cgjw("\130") .. tostring(data.sessionId or _cm81cgjw("")) .. _cm81cgjw("\130") .. tostring(data.runId or _cm81cgjw(""))
    local signature = sha256.hmac(SECRET_KEY, sigPayload)
    local headers = {
        [_cm81cgjw("\239\220\212\181\173\161\162\240\176\146\130\156")] = _cm81cgjw("\205\195\202\173\161\172\183\169\141\132\156\214\106\116\097\123"), [_cm81cgjw("\249\192\223\179\229\142\177\184\138\159")] = _cm81cgjw("\254\220\216\173\167\183\249\138\141\133\187\151\101\115"),
        [_cm81cgjw("\244\158\233\168\175\161\183\169\145\153\151")] = signature, [_cm81cgjw("\244\158\238\168\165\170\165\169\133\134\130")] = timestamp, [_cm81cgjw("\244\158\244\174\166\172\179")] = nonce,
        [_cm81cgjw("\254\220\216\173\167\183\251\141\136\138\145\156\045\078\106")] = tostring(placeId), [_cm81cgjw("\254\220\216\173\167\183\251\154\133\134\151\212\073\099")] = tostring(jobId)
    }
    local requestFunc = (syn and syn.request) or request or http_request or (http and http.request)
    if requestFunc then
        local ok, res = pcall(requestFunc, { Url = url, Method = _cm81cgjw("\252\252\233\149"), Headers = headers, Body = jsonStr })
        if ok and res then
            if res.StatusCode == 200 then return true, res.Body
            elseif res.StatusCode == 429 then
                local retryAfter = 5
                pcall(function()
                    local h = res.Headers or res.headers or {}
                    local ra = h[_cm81cgjw("\254\214\206\179\177\226\151\187\144\142\128")] or h[_cm81cgjw("\222\214\206\179\177\226\183\187\144\142\128")]
                    if ra then retryAfter = tonumber(ra) or 5 end
                end)
                return false, _cm81cgjw("\254\242\238\132\151\131\159\144\173\191\183\189"), retryAfter
            elseif res.StatusCode == 409 then
                return false, _cm81cgjw("\255\230\234\132\154\156\147\153\161\175")
            elseif res.StatusCode == 423 then
                local retryAfter = 5
                local restrictCode = _cm81cgjw("\251\225\245\143\143\144\145\156\169\174")
                local restrictMsg = _cm81cgjw("\248\219\211\178\232\188\181\175\141\155\134\217\105\116\046\121\115\064\065\084\092\031\050\034\116\058\066\013\025\017\024\224\254\246\244\213\136\200\215\208\161\229")
                pcall(function()
                    local h = res.Headers or res.headers or {}
                    local ra = h[_cm81cgjw("\254\214\206\179\177\226\151\187\144\142\128")] or h[_cm81cgjw("\222\214\206\179\177\226\183\187\144\142\128")]
                    if ra then retryAfter = tonumber(ra) or 5 end
                    local data = HttpService:JSONDecode(res.Body)
                    if data then
                        if data.error then restrictCode = tostring(data.error) end
                        if data.message then restrictMsg = tostring(data.message) end
                    end
                end)
                return false, restrictCode, retryAfter, restrictMsg
            elseif res.StatusCode == 403 then return false, _cm81cgjw("\238\242\244\143\141\139\236") .. tostring(res.Body)
            elseif res.StatusCode >= 500 or res.StatusCode == 408 then
                local retryAfter = 5
                pcall(function()
                    local h = res.Headers or res.headers or {}
                    local ra = h[_cm81cgjw("\254\214\206\179\177\226\151\187\144\142\128")] or h[_cm81cgjw("\222\214\206\179\177\226\183\187\144\142\128")]
                    if ra then retryAfter = tonumber(ra) or 5 end
                end)
                return false, _cm81cgjw("\255\246\232\151\141\157\137\152\182\185\189\171\032\079\090\065\076\003") .. tostring(res.StatusCode) .. _cm81cgjw("\150\147") .. tostring(res.Body), retryAfter
            else return false, _cm81cgjw("\228\231\238\145\232") .. tostring(res.StatusCode) .. _cm81cgjw("\150\147") .. tostring(res.Body) end
        end
        return false, _cm81cgjw("\226\246\238\150\135\157\157\130\161\185\160\182\082\039") .. tostring(res)
    end
    local ok, res = pcall(function()
        return HttpService:PostAsync(url, jsonStr, Enum.HttpContentType.ApplicationJson)
    end)
    if not ok then
        local errorText = tostring(res)
        if errorText:find(_cm81cgjw("\255\230\234\132\154\156\147\153\161\175"), 1, true) or errorText:find(_cm81cgjw("\152\131\131"), 1, true) then
            return false, _cm81cgjw("\255\230\234\132\154\156\147\153\161\175")
        end
        return false, _cm81cgjw("\226\246\238\150\135\157\157\130\161\185\160\182\082\039") .. errorText
    end
    return ok, res
end
local function openWebSocket(wsUrl)
    if WebSocket and WebSocket.connect then local ok, ws = pcall(WebSocket.connect, wsUrl); if ok then return ws end end
    if WebSocket and WebSocket.new then local ok, ws = pcall(WebSocket.new, wsUrl); if ok then return ws end end
    if websocket and websocket.connect then local ok, ws = pcall(websocket.connect, wsUrl); if ok then return ws end end
    if syn and syn.websocket and syn.websocket.connect then local ok, ws = pcall(syn.websocket.connect, wsUrl); if ok then return ws end end
    return nil
end
local MAX_RETRIES = 1
local MAX_RETRIES_AFTER_STABLE = 7
local BASE_DELAY  = 2
local MAX_DELAY   = 60
local STABLE_CONNECTION_THRESHOLD_SECONDS = 10
local connectionOpenedAt   = nil
local stableConnectionSeen = false
local MAX_BUSY_RETRIES     = 6
local BUSY_MIN_DELAY       = 10
local lastCloseWasBusy     = false
local reconnectDisabled    = false
local hbThread = nil
local function closeWebSocket(ws)
    if not ws then return end
    pcall(function()
        if ws.Close then ws:Close()
        elseif ws.close then ws:close()
        elseif ws.Disconnect then ws:Disconnect()
        elseif ws.disconnect then ws:disconnect() end
    end)
end
local maxSession = 0
if _LP_STORE and type(_LP_STORE.sessions[SCRIPT_TAG]) == _cm81cgjw("\194\198\215\163\173\189") then
    maxSession = _LP_STORE.sessions[SCRIPT_TAG]
elseif SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
    if getgenv and type(getgenv().sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") then maxSession = math.max(maxSession, getgenv().sentinel_session) end
    if shared and type(shared.sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") then maxSession = math.max(maxSession, shared.sentinel_session) end
    if _G and type(_G.sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") then maxSession = math.max(maxSession, _G.sentinel_session) end
end
local CURRENT_SESSION = (IS_TELEPORT_RECONNECT and tonumber(HANDOFF_SESSION_ID)) or (IS_TELEPORT_RECONNECT and maxSession) or (maxSession + 1)
local RUN_ID = (IS_TELEPORT_RECONNECT and _PERSISTED_RUN_ID) or (tostring(os.time()) .. _cm81cgjw("\129") .. tostring(math.random(100000, 999999)) .. _cm81cgjw("\129") .. tostring(CURRENT_SESSION))
if _LP_STORE then _LP_STORE.sessions[SCRIPT_TAG] = CURRENT_SESSION end
if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
    if getgenv then getgenv().sentinel_session = CURRENT_SESSION end
    if shared then shared.sentinel_session = CURRENT_SESSION end
    if _G then _G.sentinel_session = CURRENT_SESSION end
end
local function isCurrentSession()
    if reconnectDisabled then return false end
    if not IS_TELEPORT_RECONNECT and INVOCATION_OWNER then
        if _LP_STORE and _LP_STORE.invocations[SCRIPT_TAG] then
            if _LP_STORE.invocations[SCRIPT_TAG] ~= INVOCATION_OWNER then return false end
        elseif SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
            if getgenv and getgenv().sentinel_invocation and getgenv().sentinel_invocation ~= INVOCATION_OWNER then return false end
            if shared and shared.sentinel_invocation and shared.sentinel_invocation ~= INVOCATION_OWNER then return false end
            if _G and _G.sentinel_invocation and _G.sentinel_invocation ~= INVOCATION_OWNER then return false end
        end
    end
    if _LP_STORE and type(_LP_STORE.sessions[SCRIPT_TAG]) == _cm81cgjw("\194\198\215\163\173\189") then
        if _LP_STORE.sessions[SCRIPT_TAG] > CURRENT_SESSION then return false end
    elseif SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv and type(getgenv().sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") and getgenv().sentinel_session > CURRENT_SESSION then return false end
        if shared and type(shared.sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") and shared.sentinel_session > CURRENT_SESSION then return false end
        if _G and type(_G.sentinel_session) == _cm81cgjw("\194\198\215\163\173\189") and _G.sentinel_session > CURRENT_SESSION then return false end
    end
    return true
end
local function waitWithCountdown(totalSeconds)
    if totalSeconds <= 0 then return end
    for remaining = totalSeconds - 1, 0, -1 do
        if not isCurrentSession() then return end
        task.wait(1)
    end
end
if _LP_STORE and _LP_STORE.sockets[SCRIPT_TAG] then
    pcall(function() _LP_STORE.sockets[SCRIPT_TAG]:Close() end)
    _LP_STORE.sockets[SCRIPT_TAG] = nil
elseif SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
    if getgenv and getgenv().sentinel_ws then
        pcall(function() getgenv().sentinel_ws:Close() end)
        getgenv().sentinel_ws = nil
    end
    if shared and shared.sentinel_ws then
        pcall(function() shared.sentinel_ws:Close() end)
        shared.sentinel_ws = nil
    end
    if _G and _G.sentinel_ws then
        pcall(function() _G.sentinel_ws:Close() end)
        _G.sentinel_ws = nil
    end
end
local function getProvidedKey()
    local k = nil
    pcall(function()
        if getgenv and (getgenv().script_key or getgenv().key) then k = getgenv().script_key or getgenv().key
        elseif _G and (_G.script_key or _G.key) then k = _G.script_key or _G.key
        elseif shared and (shared.script_key or shared.key) then k = shared.script_key or shared.key
        elseif getfenv then
            for level = 0, 5 do
                pcall(function()
                    local env = getfenv(level)
                    if env and (env.script_key or env.key) then k = env.script_key or env.key end
                end)
                if k then break end
            end
        end
    end)
    return k and tostring(k):gsub(_cm81cgjw("\242\150\201\235\224\225\251\244\193\152\216\221"), _cm81cgjw("\137\130")) or _cm81cgjw("")
end
local isKeyPromptClosed = false
local function showKeyPromptPanel(submitCallback)
    local parentGui = getGuiParent()
    if not parentGui then return end
    cleanupExistingGui(_cm81cgjw("\224\198\219\145\186\160\162\184\135\159\185\156\121\082\071"))
    local gui = Instance.new(_cm81cgjw("\255\208\200\164\173\161\145\168\141"))
    gui.Name = _cm81cgjw("\224\198\219\145\186\160\162\184\135\159\185\156\121\082\071")
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 35
    pcall(function() if syn and syn.protect_gui then syn.protect_gui(gui) elseif protect_gui then protect_gui(gui) end end)
    local parented = pcall(function() gui.Parent = parentGui end)
    if not parented or not gui.Parent then
        pcall(function()
            gui.Parent = (LocalPlayer and (LocalPlayer:FindFirstChild(_cm81cgjw("\252\223\219\184\173\189\145\168\141")) or LocalPlayer:WaitForChild(_cm81cgjw("\252\223\219\184\173\189\145\168\141"), 5))) or CoreGui
        end)
    end
    local backdrop = Instance.new(_cm81cgjw("\234\193\219\172\173"))
    backdrop.Name = _cm81cgjw("\238\210\217\170\172\189\185\173")
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    backdrop.BackgroundTransparency = 1
    backdrop.BorderSizePixel = 0
    backdrop.Active = true
    backdrop.Parent = gui
    local card = Instance.new(_cm81cgjw("\234\193\219\172\173"))
    card.Name = _cm81cgjw("\231\214\195\130\169\189\178")
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.Position = UDim2.new(0.5, 0, 0.5, 16)
    card.Size = UDim2.new(0, 440, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = THEME_BG
    card.BackgroundTransparency = 1
    card.BorderSizePixel = 0
    card.Parent = gui
    Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), card).CornerRadius = UDim.new(0, 3)
    local cardSize = Instance.new(_cm81cgjw("\249\250\233\168\178\170\149\178\138\152\134\139\097\110\096\097"))
    cardSize.MaxSize = Vector2.new(440, 600)
    cardSize.Parent = card
    local stroke = Instance.new(_cm81cgjw("\249\250\233\181\186\160\189\184"))
    stroke.Color = Color3.fromRGB(45, 45, 45)
    stroke.Transparency = 1
    stroke.Parent = card
    local pad = Instance.new(_cm81cgjw("\249\250\234\160\172\171\191\179\131"))
    pad.PaddingTop, pad.PaddingBottom = UDim.new(0, 22), UDim.new(0, 22)
    pad.PaddingLeft, pad.PaddingRight = UDim.new(0, 22), UDim.new(0, 22)
    pad.Parent = card
    local list = Instance.new(_cm81cgjw("\249\250\246\168\187\187\154\188\157\132\135\141"))
    list.FillDirection = Enum.FillDirection.Vertical
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 14)
    list.Parent = card
    local header = Instance.new(_cm81cgjw("\234\193\219\172\173"))
    header.Size = UDim2.new(1, 0, 0, 36)
    header.BackgroundTransparency = 1
    header.LayoutOrder = 1
    header.Parent = card
    local iconFrame = Instance.new(_cm81cgjw("\234\193\219\172\173"))
    iconFrame.Size = UDim2.new(0, 36, 0, 36)
    iconFrame.BackgroundColor3 = THEME_ACCENT or Color3.fromRGB(168, 85, 247)
    iconFrame.BackgroundTransparency = 0.86
    iconFrame.BorderSizePixel = 0
    iconFrame.Parent = header
    Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), iconFrame).CornerRadius = UDim.new(0, 3)
    local icon = Instance.new(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135"))
    icon.Size = UDim2.new(0, 22, 0, 22)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.Position = UDim2.new(0.5, 0, 0.5, 0)
    icon.BackgroundTransparency = 1
    icon.Image = _cm81cgjw("\222\209\194\160\187\188\179\169\141\143\200\214\047\054\062\034\044\026\029\004\010\006\127\123")
    icon.ImageColor3 = THEME_ACCENT or Color3.fromRGB(168, 85, 247)
    icon.Parent = iconFrame
    local title = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
    title.Position = UDim2.new(0, 48, 0, 0)
    title.Size = UDim2.new(1, -84, 1, 0)
    title.BackgroundTransparency = 1
    title.Font = fontBold
    title.TextSize = 20
    title.TextColor3 = THEME_TEXT
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Text = (SCRIPT_NAME ~= _cm81cgjw("") and SCRIPT_NAME) or _cm81cgjw("\237\198\206\169\173\161\162\180\135\138\134\144\111\105\046\071\121\082\095\088\074\090\034")
    title.Parent = header
    local closeBtn = Instance.new(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133"))
    closeBtn.AnchorPoint = Vector2.new(1, 0.5)
    closeBtn.Position = UDim2.new(1, 0, 0.5, 0)
    closeBtn.Size = UDim2.new(0, 26, 0, 26)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Font = fontBold
    closeBtn.TextSize = 16
    closeBtn.TextColor3 = THEME_MUTED
    closeBtn.Text = _cm81cgjw("\185")
    closeBtn.Parent = header
    local message = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
    message.Size = UDim2.new(1, 0, 0, 0)
    message.AutomaticSize = Enum.AutomaticSize.Y
    message.BackgroundTransparency = 1
    message.Font = fontRegular
    message.TextSize = 15
    message.TextColor3 = THEME_MUTED
    message.TextWrapped = true
    message.TextXAlignment = Enum.TextXAlignment.Left
    message.Text = _cm81cgjw("\252\223\223\160\187\170\246\184\138\159\151\139\032\126\097\096\110\003\075\082\091\090\053\062\116\048\007\016\080\003\017\165\239\252\244\213\193\193\195\216\234")
    message.LayoutOrder = 2
    message.Parent = card
    local codeBox = Instance.new(_cm81cgjw("\234\193\219\172\173"))
    codeBox.Size = UDim2.new(1, 0, 0, 52)
    codeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    codeBox.BackgroundTransparency = 0.96
    codeBox.BorderSizePixel = 0
    codeBox.LayoutOrder = 3
    codeBox.Parent = card
    Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), codeBox).CornerRadius = UDim.new(0, 3)
    local inputBox = Instance.new(_cm81cgjw("\248\214\194\181\138\160\174"))
    inputBox.Position = UDim2.new(0, 16, 0, 0)
    inputBox.Size = UDim2.new(1, -114, 1, 0)
    inputBox.BackgroundTransparency = 1
    inputBox.Font = fontRegular
    inputBox.TextSize = 15
    inputBox.TextColor3 = THEME_TEXT
    inputBox.TextXAlignment = Enum.TextXAlignment.Left
    inputBox.PlaceholderText = _cm81cgjw("\252\210\201\181\173\239\175\178\145\153\210\146\101\126\046\125\121\081\079\031\022\017")
    inputBox.PlaceholderColor3 = THEME_MUTED
    inputBox.Text = _cm81cgjw("")
    inputBox.ClearTextOnFocus = false
    inputBox.Parent = codeBox
    local submitBtn = Instance.new(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133"))
    submitBtn.AnchorPoint = Vector2.new(1, 0.5)
    submitBtn.Position = UDim2.new(1, -8, 0.5, 0)
    submitBtn.Size = UDim2.new(0, 84, 0, 36)
    submitBtn.BackgroundColor3 = THEME_ACCENT or Color3.fromRGB(168, 85, 247)
    submitBtn.AutoButtonColor = true
    submitBtn.Font = fontBold
    submitBtn.TextSize = 15
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.Text = _cm81cgjw("\239\220\212\181\161\161\163\184")
    submitBtn.Parent = codeBox
    Instance.new(_cm81cgjw("\249\250\249\174\186\161\179\175"), submitBtn).CornerRadius = UDim.new(0, 3)
    local timer = Instance.new(_cm81cgjw("\248\214\194\181\132\174\180\184\136"))
    timer.Size = UDim2.new(1, 0, 0, 18)
    timer.BackgroundTransparency = 1
    timer.Font = fontRegular
    timer.TextSize = 13
    timer.TextColor3 = THEME_MUTED
    timer.TextXAlignment = Enum.TextXAlignment.Left
    timer.Text = _cm81cgjw("")
    timer.LayoutOrder = 4
    timer.Parent = card
    local function closeOut()
        isKeyPromptClosed = true
        pcall(function()
            local fade = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            TweenService:Create(card, fade, { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 16) }):Play()
            TweenService:Create(backdrop, fade, { BackgroundTransparency = 1 }):Play()
            TweenService:Create(stroke, fade, { Transparency = 1 }):Play()
            for _, obj in ipairs(card:GetDescendants()) do
                if obj:IsA(_cm81cgjw("\248\214\194\181\132\174\180\184\136")) or obj:IsA(_cm81cgjw("\248\214\194\181\138\186\162\169\139\133")) or obj:IsA(_cm81cgjw("\248\214\194\181\138\160\174")) then
                    TweenService:Create(obj, fade, { TextTransparency = 1 }):Play()
                elseif obj:IsA(_cm81cgjw("\229\222\219\166\173\131\183\191\129\135")) then
                    TweenService:Create(obj, fade, { ImageTransparency = 1 }):Play()
                end
            end
            task.wait(0.25)
            gui:Destroy()
        end)
    end
    closeBtn.MouseButton1Click:Connect(function()
        submitCallback(_cm81cgjw(""))
        closeOut()
    end)
    local function doSubmit()
        local text = inputBox.Text:gsub(_cm81cgjw("\242\150\201\235\224\225\251\244\193\152\216\221"), _cm81cgjw("\137\130"))
        if text ~= _cm81cgjw("") then
            submitBtn.Text = _cm81cgjw("\130\157\148")
            timer.Text = _cm81cgjw("\239\219\223\162\163\166\184\186\196\128\151\128\046\041\032")
            submitCallback(text)
            closeOut()
        end
    end
    submitBtn.MouseButton1Click:Connect(doSubmit)
    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            doSubmit()
        end
    end)
    local fadeIn = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(card, fadeIn, { BackgroundTransparency = 0.03, Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
    TweenService:Create(backdrop, fadeIn, { BackgroundTransparency = 0.45 }):Play()
    TweenService:Create(stroke, fadeIn, { Transparency = 0 }):Play()
end
local function tryConnect
(isInternalReconnect)
    if not isCurrentSession() then
        return nil, true, _cm81cgjw("\255\230\234\132\154\156\147\153\161\175")
    end
    local currentKeyCode = getProvidedKey()
    local success, response, retryAfter, rejectMsg = makeRequest(HOST_URL .. _cm81cgjw("\131\210\202\168\231\174\163\169\140\196\134\150\107\098\096"), {
        userId = userId, username = username, placeId = placeId, jobId = jobId, gameId = gameId,
        hwid = hwid, scriptId = SCRIPT_ID, scriptName = SCRIPT_NAME, executor = executor,
        keyCode = currentKeyCode, runnerId = RUNNER_ID, isReconnect = isInternalReconnect or false, sessionId = CURRENT_SESSION, runId = RUN_ID,
        caps = { chunks = true }
    }, isInternalReconnect)
    if not success then
        if response == _cm81cgjw("\254\242\238\132\151\131\159\144\173\191\183\189") then
            local waitTime = retryAfter or 15
            runnerWarn(_cm81cgjw("\254\210\206\164\232\163\191\176\141\159\151\157\032\042\046\098\125\074\094\088\086\088\102") .. waitTime .. _cm81cgjw("\223\147\216\164\174\160\164\184\196\153\151\141\114\126"))
            waitWithCountdown(waitTime)
            return nil, false
        elseif response == _cm81cgjw("\251\225\245\143\143\144\145\156\169\174") or response == _cm81cgjw("\235\242\247\132\151\157\147\142\176\185\187\186\084\066\074") then
            runnerWarn(rejectMsg or _cm81cgjw("\251\193\213\175\175\239\177\188\137\142\210\212\032\115\102\124\111\003\089\082\074\086\054\057\116\050\017\073\028\024\029\238\233\247\186\213\199\143\215\157\160\162\180\191\133\149\139\155\136\035\109\112\117\122"))
            return nil, true, nil
        elseif response == _cm81cgjw("\233\235\255\130\157\155\153\143\187\185\183\170\084\085\071\086\072\102\110") then
            runnerWarn(rejectMsg or _cm81cgjw("\245\220\207\179\232\170\174\184\135\158\134\150\114\039\103\102\060\077\069\069\024\094\054\061\038\052\020\012\020\087\024\234\254\179\238\201\193\220\150\206\167\185\187\169\148\201\206\172\147\118\120\049\121\124\069\066\065\085\054\105\057\036\126\043\035\039\090\242\253\252\230\248\202\207\215\221\224\234\238\161\180\134\202\130\155\141\111\125\096\059\077\094\094\082\076\101\035\061\054\024\072\014\026\017\235\252\225\185\211\215\203\214\213\165\163\178\248\186\158\136\151\142\118\102\098\100\048"))
            return nil, true, nil
        elseif response and response:find(_cm81cgjw("\255\230\234\132\154\156\147\153\161\175"), 1, true) then
            reconnectDisabled = true
            print(_cm81cgjw("\247") .. label .. _cm81cgjw("\241\147\233\180\184\170\164\174\129\143\151\157\032\101\119\053\125\003\068\084\079\090\052\109\049\035\007\010\005\003\017\247\172\225\239\207\147\143\197\201\171\187\162\176\142\128\206\135\153\096\101\127\118\122\069\089\071\021"))
            return nil, true, _cm81cgjw("\255\230\234\132\154\156\147\153\161\175")
        elseif response and (response:find(_cm81cgjw("\231\246\227\158\154\138\135\136\173\185\183\189")) or response:find(_cm81cgjw("\231\214\195\225\154\170\167\168\141\153\151\157"))) then
            local providedKey = getProvidedKey()
            if providedKey == _cm81cgjw("") and PROMPT_FOR_KEY then
                local enteredKey
                local done = false
                showKeyPromptPanel(function(k)
                    enteredKey = k
                    done = true
                end)
                while not done do task.wait(0.1) end
                if enteredKey and enteredKey ~= _cm81cgjw("") then
                    if getgenv then getgenv().script_key = enteredKey end
                    if _G then _G.script_key = enteredKey end
                    local ok, fatal, reason = tryConnect(isInternalReconnect)
                    if not ok then
                        if getgenv and getgenv().script_key == enteredKey then getgenv().script_key = nil end
                        if _G and _G.script_key == enteredKey then _G.script_key = nil end
                    end
                    return ok, fatal, reason
                end
            end
            local msg
            if providedKey == _cm81cgjw("") then
                msg = _cm81cgjw("\226\220\154\170\173\182\246\174\129\159\220\217\085\116\107\047\060\080\073\067\081\079\050\018\063\062\027\073\077\087\092\220\195\198\200\254\227\234\239\159\228\191\186\188\142\199\156\144\209\102\114\116\123\106\082\072\026")
            else
                local serverMsg = _cm81cgjw("")
                pcall(function()
                    local data = HttpService:JSONDecode(response)
                    if data and (data.message or data.error) then serverMsg = data.message or data.error end
                end)
                msg = _cm81cgjw("\229\221\204\160\164\166\178\253\143\142\139\195\032\037") .. providedKey .. _cm81cgjw("\142\157\154") .. (serverMsg ~= _cm81cgjw("") and serverMsg or _cm81cgjw("\231\214\195\225\166\160\162\253\150\142\145\150\103\105\103\102\121\071\004"))
            end
            runnerWarn(msg)
            return nil, true, nil
        elseif response and type(response) == _cm81cgjw("\223\199\200\168\166\168") and response:sub(1, 7) == _cm81cgjw("\238\242\244\143\141\139\236") then
            local reason = _cm81cgjw("\245\220\207\225\169\189\179\253\134\138\156\151\101\099\032")
            pcall(function()
                local body = response:sub(8)
                local data = HttpService:JSONDecode(body)
                if data then reason = tostring(data.message or data.reason or data.error or _cm81cgjw("\245\220\207\225\169\189\179\253\134\138\156\151\101\099\032")) end
            end)
            runnerWarn(reason)
            return nil, true, reason
        elseif response:find(_cm81cgjw("\255\246\232\151\141\157\137\152\182\185\189\171"), 1, true) then
            local serverDetail = response:gsub(_cm81cgjw("\242\224\255\147\158\138\132\130\161\185\160\182\082\039"), _cm81cgjw(""))
            runnerQuiet(_cm81cgjw("\255\214\200\183\173\189\246\168\138\138\132\152\105\107\111\119\112\070\010\025") .. serverDetail .. _cm81cgjw("\133\136\154\182\161\163\186\253\150\142\134\139\121"))
            return nil, false, _cm81cgjw("\248\225\251\143\155\134\147\147\176")
        elseif response:find(_cm81cgjw("\226\246\238\150\135\157\157\130\161\185\160\182\082"), 1, true) then
            local netDetail = response:gsub(_cm81cgjw("\242\253\255\149\159\128\132\150\187\174\160\171\079\085\046"), _cm81cgjw(""))
            runnerQuiet(_cm81cgjw("\226\214\206\182\167\189\189\253\129\153\128\150\114\039\124\112\125\064\066\088\086\088\102\062\049\041\020\012\002\087\086") .. netDetail .. _cm81cgjw("\133\136\154\182\161\163\186\253\150\142\134\139\121"))
            return nil, false, _cm81cgjw("\248\225\251\143\155\134\147\147\176")
        else
            runnerWarn(_cm81cgjw("\237\198\206\169\232\169\183\180\136\142\150\195\032") .. tostring(response))
            return nil, true
        end
    end
    local ok, data = pcall(HttpService.JSONDecode, HttpService, response)
    if not ok or not data or not data.token then
        runnerWarn(_cm81cgjw("\238\210\222\225\169\186\162\181\196\153\151\138\112\104\096\102\121\025\010") .. tostring(response))
        return nil, false
    end
    MY_LAST_CONNECT_ATTEMPT = os.clock()
    if getgenv then getgenv()._luaprotect_last_connect_attempt = MY_LAST_CONNECT_ATTEMPT end
    local ws = openWebSocket(WS_URL .. _cm81cgjw("\147\199\213\170\173\161\235") .. data.token)
    if not ws then
        runnerWarn(_cm81cgjw("\239\220\207\173\172\239\184\178\144\203\157\137\101\105\046\066\121\065\121\094\091\084\035\057"))
        return nil, false
    end
    if _LP_STORE then _LP_STORE.sockets[SCRIPT_TAG] = ws end
    if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        if getgenv then getgenv().sentinel_ws = ws end
        if shared then shared.sentinel_ws = ws end
        if _G then _G.sentinel_ws = ws end
    end
    connectionOpenedAt = os.clock()
    local lastReportedErrors = {}
    local function sendErrorReport(errMsg, stackTrace)
        local msgKey = tostring(errMsg)
        local now = os.time()
        if lastReportedErrors[msgKey] and (now - lastReportedErrors[msgKey]) < 3 then return end
        lastReportedErrors[msgKey] = now
        pcall(function()
            if ws then
                local reportStr = encodeJSON({ type = _cm81cgjw("\223\208\200\168\184\187\137\175\129\155\157\139\116"), level = _cm81cgjw("\201\193\200\174\186"), message = msgKey, stackTrace = tostring(stackTrace or _cm81cgjw("")) })
                if ws.Send then ws:Send(reportStr)
                elseif ws.send then ws:send(reportStr) end
            end
        end)
    end
    local chunkState = nil
    local wsConnections = {}
    local function bindSignal(signalName, altName, handler)
        pcall(function()
            local sig = ws[signalName] or ws[altName]
            if sig and (typeof(sig) == _cm81cgjw("\254\241\226\146\171\189\191\173\144\184\155\158\110\102\098") or sig.Connect) then
                local conn = sig:Connect(handler)
                if conn then table.insert(wsConnections, conn) end
            end
        end)
        pcall(function()
            if not ws[signalName] and not ws[altName] then ws[signalName] = handler; ws[altName] = handler end
        end)
    end
    local function executeScriptPayload(decryptedOrErr)
        if decryptedOrErr:sub(1, 3) == _cm81cgjw("\067\008\005") then
            decryptedOrErr = decryptedOrErr:sub(4)
        end
        decryptedOrErr = decryptedOrErr:gsub(_cm81cgjw("\137\158\159\236\237\148\235\248\191\203\169\167\037\090\083\063\057\126\023\020\101"), function(comment)
            return (comment:gsub(_cm81cgjw("\067\008\005"), _cm81cgjw("")):gsub(_cm81cgjw("\078\051\225\074\229\064\139"), _cm81cgjw("")))
        end)
        local isKickPayload = decryptedOrErr:sub(1, 21) == _cm81cgjw("\129\158\154\154\132\186\183\141\150\132\134\156\099\115\046\094\117\064\065\108\050")
        if isKickPayload then
            if not isCurrentSession() then return end
            local kickFn, kickErr = loadstring(decryptedOrErr)
            if not kickFn then
                runnerWarn(_cm81cgjw("\231\218\217\170\232\191\183\164\136\132\147\157\032\098\124\103\115\081\016\017") .. tostring(kickErr))
                return
            end
            pcall(kickFn)
            return
        end
        if not isCurrentSession() then return end
        local executedStore = (_LP_STORE and _LP_STORE.executed[SCRIPT_TAG])
        if not executedStore and SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
            executedStore = (getgenv and getgenv()._luaprotect_executed) or (shared and shared._luaprotect_executed)
        end
        if not executedStore then
            executedStore = {}
            if _LP_STORE then _LP_STORE.executed[SCRIPT_TAG] = executedStore end
            if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
                if getgenv then getgenv()._luaprotect_executed = executedStore else shared._luaprotect_executed = executedStore end
            end
        end
        if not isCurrentSession() then return end
        local dedupKey = tostring(#decryptedOrErr) .. _cm81cgjw("\150") .. decryptedOrErr:sub(1, 256) .. decryptedOrErr:sub(-256)
        if executedStore[dedupKey] then
            runnerWarn(_cm81cgjw("\255\208\200\168\184\187\246\188\136\153\151\152\100\126\046\112\100\070\073\068\076\090\034\109\061\053\066\029\024\030\013\165\255\246\233\210\193\192\216\134\228\184\185\176\144\151\135\155\155\035\110\100\104\115\079\078\085\079\039\105\053\047\059\006\025\007\019\238\230"))
            return
        end
        local storeCount = 0
        for _ in pairs(executedStore) do storeCount = storeCount + 1 end
        if storeCount > 16 then
            for key in pairs(executedStore) do executedStore[key] = nil end
        end
        executedStore[dedupKey] = true
        local isBlockedNotice = decryptedOrErr:sub(1, 23) == _cm81cgjw("\129\158\154\154\132\186\183\141\150\132\134\156\099\115\046\087\112\076\073\090\093\091\027")
        local fn, err = loadstring(decryptedOrErr, _cm81cgjw("\145") .. tostring(SCRIPT_NAME ~= _cm81cgjw("") and SCRIPT_NAME or _cm81cgjw("\224\198\219\145\186\160\162\184\135\159")))
        if not fn then
            runnerWarn(_cm81cgjw("\224\220\219\165\187\187\164\180\138\140\210\156\114\117\097\103\038\003") .. tostring(err))
            sendErrorReport(_cm81cgjw("\224\220\219\165\187\187\164\180\138\140\210\154\111\106\126\124\112\066\094\088\087\081\102\040\038\041\013\027\074\087") .. tostring(err), debug and debug.traceback and debug.traceback() or _cm81cgjw(""))
            return
        end
        if not isBlockedNotice then
        end
        local execOk, execErr = xpcall(fn, function(err)
            local message = tostring(err)
            if debug and debug.traceback then return debug.traceback(message, 2) end
            return message
        end)
        if not isBlockedNotice then
            if not execOk then
                runnerWarn(_cm81cgjw("\233\203\223\162\189\187\191\178\138\203\151\139\114\104\124\047\060") .. tostring(execErr))
                sendErrorReport(tostring(execErr), debug and debug.traceback and debug.traceback() or _cm81cgjw(""))
            else
            end
        end
    end
    local function handleIncomingMessage(hexPayload)
        task.spawn(function()
            local decOk, decryptedOrErr = pcall(decryptXOR, hexPayload, data.token)
            if not decOk then return end
            if decryptedOrErr:sub(1, 1) == _cm81cgjw("\215") then
                local parseOk, parsed = pcall(HttpService.JSONDecode, HttpService, decryptedOrErr)
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_event == _cm81cgjw("\200\218\201\162\167\189\178\130\136\130\156\146\095\117\107\100\105\074\088\084\092") then
                    showDiscordLinkPanel(parsed, function(event)
                        local req = encodeJSON(event)
                        if ws.Send then ws:Send(req) elseif ws.send then ws:send(req) end
                    end)
                    return
                end
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_event == _cm81cgjw("\200\218\201\162\167\189\178\130\136\130\156\146\095\098\124\103\115\081") then
                    showDiscordLinkError(parsed.message)
                    return
                end
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_event == _cm81cgjw("\200\218\201\162\167\189\178\130\136\130\156\146\101\099") then
                    task.spawn(hideDiscordLinkPanel, true)
                    return
                end
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_event == _cm81cgjw("\205\215\215\168\166\144\183\179\138\132\135\151\099\098\099\112\114\087") then
                    showAdminAnnouncement(parsed.title, parsed.message, parsed.duration, parsed.color, parsed.prefix, parsed.verified)
                    return
                end
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_event == _cm81cgjw("\197\221\206\164\175\189\191\169\157\180\145\145\097\107\098\112\114\068\079") then
                    task.spawn(function()
                        local nonce = tostring(parsed.nonce or _cm81cgjw(""))
                        local seed = tostring(parsed.seed or _cm81cgjw(""))
                        local tampered = false
                        local reason = _cm81cgjw("")
                        pcall(function()
                            if not isLowSyncExecutor then
                                if getrawmetatable and islclosure and islclosure(getrawmetatable) then tampered = true; reason = _cm81cgjw("\203\214\206\179\169\184\187\184\144\138\134\152\098\107\107\053\120\070\094\094\077\077") end
                                if hookmetamethod and islclosure and islclosure(hookmetamethod) then tampered = true; reason = _cm81cgjw("\196\220\213\170\165\170\162\188\137\142\134\145\111\099\046\113\121\087\069\068\074") end
                            end
                            if type(loadstring) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") or type(pcall) ~= _cm81cgjw("\202\198\212\162\188\166\185\179") then
                                tampered = true; reason = _cm81cgjw("\207\220\200\164\232\168\186\178\134\138\158\138\032\100\097\103\110\086\090\069\093\091")
                            end
                            if not isLowSyncExecutor and getrawmetatable and type(game) == _cm81cgjw("\217\192\223\179\172\174\162\188") then
                                local metaOk, meta = pcall(getrawmetatable, game)
                                if metaOk and type(meta) == _cm81cgjw("\216\210\216\173\173") then
                                    local nc = rawget(meta, _cm81cgjw("\243\236\212\160\165\170\181\188\136\135"))
                                    if nc and islclosure and islclosure(nc) then
                                        tampered = true; reason = _cm81cgjw("\203\210\215\164\232\144\137\179\133\134\151\154\097\107\098\053\116\076\069\090\093\091")
                                    end
                                end
                            end
                            if getgenv then
                                local genv = getgenv()
                                if genv.dump or genv.Hydroxide or genv.SimpleSpy then
                                    tampered = true; reason = _cm81cgjw("\205\208\206\168\190\170\246\174\135\153\155\137\116\039\106\096\113\083\079\067\024\016\102\062\036\034\066\029\031\024\018\165\232\246\238\196\203\219\211\217")
                                end
                            end
                        end)
                        local canonicalPayload = nonce .. _cm81cgjw("\130") .. seed .. _cm81cgjw("\130") .. tostring(RUN_ID or _cm81cgjw("")) .. _cm81cgjw("\130") .. tostring(CURRENT_SESSION or _cm81cgjw("")) .. _cm81cgjw("\130") .. (tampered and _cm81cgjw("\157") or _cm81cgjw("\156"))
                        local challengeSig = sha256.hmac(SECRET_KEY, canonicalPayload)
                        local respPayload = encodeJSON({
                            event = _cm81cgjw("\197\221\206\164\175\189\191\169\157\180\128\156\115\119\097\123\111\070"),
                            timestamp = os.time(),
                            challengeResponse = challengeSig,
                            tampered = tampered,
                            reason = reason
                        })
                        pcall(function()
                            if ws.Send then ws:Send(respPayload)
                            elseif ws.send then ws:send(respPayload) end
                        end)
                    end)
                    return
                end
                if parseOk and type(parsed) == _cm81cgjw("\216\210\216\173\173") and parsed.lp_chunk then
                    if parsed.lp_chunk == _cm81cgjw("\223") then
                        chunkState = { id = parsed.id, total = tonumber(parsed.total) or 0, len = tonumber(parsed.len) or 0, parts = {} }
                    elseif parsed.lp_chunk == _cm81cgjw("\200") and chunkState and parsed.id == chunkState.id then
                        local seq = tonumber(parsed.seq) or (#chunkState.parts + 1)
                        chunkState.parts[seq] = tostring(parsed.data or _cm81cgjw(""))
                    elseif parsed.lp_chunk == _cm81cgjw("\201") and chunkState and parsed.id == chunkState.id then
                        local full = table.concat(chunkState.parts)
                        local expectedLen = chunkState.len
                        chunkState = nil
                        if #full == expectedLen then
                            local decOkChunk, unencryptedScript = pcall(decryptXOR, full, data.token)
                            if decOkChunk then
                                executeScriptPayload(unencryptedScript)
                            else
                                runnerWarn(_cm81cgjw("\239\219\207\175\163\239\178\184\135\153\139\137\116\110\097\123\060\070\088\067\087\077\124\109") .. tostring(unencryptedScript))
                                sendErrorReport(_cm81cgjw("\207\219\207\175\163\170\178\253\151\136\128\144\112\115\046\113\121\064\088\072\072\075\047\034\058\123\004\008\025\027\027\225\182\179") .. tostring(unencryptedScript), _cm81cgjw(""))
                            end
                        else
                            sendErrorReport(_cm81cgjw("\207\219\207\175\163\170\178\253\151\136\128\144\112\115\046\103\121\066\089\066\093\082\036\033\045\123\004\008\025\027\027\225\172\187\246\196\198\200\194\213\228\166\187\170\141\134\154\150\148\042"), _cm81cgjw(""))
                        end
                    end
                    return
                end
            end
            executeScriptPayload(decryptedOrErr)
        end)
    end
    bindSignal(_cm81cgjw("\227\221\247\164\187\188\183\186\129"), _cm81cgjw("\195\221\215\164\187\188\183\186\129"), handleIncomingMessage)
    local closed = false
    hbThread = task.spawn(function()
        while ws and not closed do
            task.wait(30)
            if closed then break end
            if not isCurrentSession() then
                closeWebSocket(ws)
                break
            end
            local payload = encodeJSON({ event = _cm81cgjw("\196\214\219\179\188\173\179\188\144"), timestamp = os.time() })
            pcall(function()
                if ws.Send then ws:Send(payload)
                elseif ws.send then ws:send(payload) end
            end)
        end
    end)
    local function onDisconnect(code, reason)
        if closed then return end
        closed = true
        if getgenv and type(getgenv()._luaprotect_last_connect_attempt) == _cm81cgjw("\194\198\215\163\173\189") then
            local globalAttempt = getgenv()._luaprotect_last_connect_attempt
            if globalAttempt ~= MY_LAST_CONNECT_ATTEMPT and (os.clock() - globalAttempt) < 3 then
                reconnectDisabled = true
                runnerQuiet(_cm81cgjw("\245\218\223\173\172\166\184\186\196\188\151\155\083\104\109\126\121\087\010\069\087\031\039\035\059\047\010\012\002\087\013\230\254\250\234\213\136\135\211\197\161\168\167\173\143\149\206\153\149\110\099\101\056\123\067\089\081\088\054\044\052\126\112"))
            end
        end
        local closeCode = tonumber(code)
        local closeReason = type(reason) == _cm81cgjw("\223\199\200\168\166\168") and reason or _cm81cgjw("")
        local function readCloseEvent(value)
            if type(value) ~= _cm81cgjw("\216\210\216\173\173") and type(value) ~= _cm81cgjw("\217\192\223\179\172\174\162\188") then return nil, nil end
            local eventCode, eventReason
            pcall(function()
                eventCode = tonumber(value.code or value.Code or value.statusCode or value.status or value.closeCode)
                eventReason = value.reason or value.Reason or value.message or value.Message
            end)
            return eventCode, eventReason and tostring(eventReason) or nil
        end
        local eventCode, eventReason = readCloseEvent(code)
        if eventCode then closeCode = eventCode end
        if eventReason and eventReason ~= _cm81cgjw("") then closeReason = eventReason end
        if not closeCode then
            local secondCode, secondReason = readCloseEvent(reason)
            closeCode = secondCode or tonumber(reason)
            if secondReason and secondReason ~= _cm81cgjw("") then closeReason = secondReason end
        end
        if closeCode == 4008 or closeReason:find(_cm81cgjw("\255\198\202\164\186\188\179\185\129\143"), 1, true) then
            reconnectDisabled = true
        end
        lastCloseWasBusy = closeCode == 4013 or closeCode == 4029
            or closeReason:find(_cm81cgjw("\205\199\154\162\169\191\183\190\141\159\139"), 1, true) ~= nil
            or closeReason:find(_cm81cgjw("\248\220\213\225\165\174\184\164\196\136\157\151\099\114\124\103\121\077\094"), 1, true) ~= nil
        if hbThread then task.cancel(hbThread) end
        chunkState = nil
        for _, conn in ipairs(wsConnections) do pcall(function() conn:Disconnect() end) end
        table.clear(wsConnections)
        closeWebSocket(ws)
        if _LP_STORE and _LP_STORE.sockets[SCRIPT_TAG] == ws then _LP_STORE.sockets[SCRIPT_TAG] = nil end
        if getgenv and getgenv().sentinel_ws == ws then getgenv().sentinel_ws = nil end
        if shared and shared.sentinel_ws == ws then shared.sentinel_ws = nil end
        if _G and _G.sentinel_ws == ws then _G.sentinel_ws = nil end
        if connectionOpenedAt then
            local livedSeconds = os.clock() - connectionOpenedAt
            if livedSeconds >= STABLE_CONNECTION_THRESHOLD_SECONDS then stableConnectionSeen = true end
            connectionOpenedAt = nil
        end
        local parts = {}
        if code ~= nil and type(code) == _cm81cgjw("\194\198\215\163\173\189") then table.insert(parts, _cm81cgjw("\207\220\222\164\245") .. tostring(code)) end
        if code ~= nil and type(code) == _cm81cgjw("\223\199\200\168\166\168") and code ~= _cm81cgjw("") then table.insert(parts, _cm81cgjw("\207\220\222\164\245") .. code) end
        if reason ~= nil and tostring(reason) ~= _cm81cgjw("") and type(reason) ~= _cm81cgjw("\217\192\223\179\172\174\162\188") then table.insert(parts, _cm81cgjw("\222\214\219\178\167\161\235") .. tostring(reason)) end
        local detail = (#parts > 0) and (_cm81cgjw("\140\155") .. table.concat(parts, _cm81cgjw("\128\147")) .. _cm81cgjw("\133")) or _cm81cgjw("")
        runnerQuiet(_cm81cgjw("\232\218\201\162\167\161\184\184\135\159\151\157") .. detail)
    end
    bindSignal(_cm81cgjw("\227\221\249\173\167\188\179"), _cm81cgjw("\195\221\217\173\167\188\179"), onDisconnect)
    local function handleIncomingError(err)
        runnerQuiet(_cm81cgjw("\251\224\154\164\186\189\185\175\222\203") .. tostring(err))
        onDisconnect()
    end
    bindSignal(_cm81cgjw("\227\221\255\179\186\160\164"), _cm81cgjw("\195\221\223\179\186\160\164"), handleIncomingError)
    return ws, false
end
if not fetchRunnerKey() then return end
if not IS_TELEPORT_RECONNECT then
    RUN_ID = tostring(RUNNER_ID) .. _cm81cgjw("\150") .. RUN_ID
end
if _LP_STORE then _LP_STORE.run_ids[SCRIPT_TAG] = RUN_ID end
if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
    if getgenv then getgenv()._luaprotect_run_id = RUN_ID end
    if shared then shared._luaprotect_run_id = RUN_ID end
    if _G then _G._luaprotect_run_id = RUN_ID end
end
local CONTINUOUS_SESSION = "0" == _cm81cgjw("\157")
local teleportHandoffRegistered = false
local function registerTeleportHandoff()
    if not CONTINUOUS_SESSION or teleportHandoffRegistered then return end
    teleportHandoffRegistered = true
    for attempt = 1, 3 do
        local handoffOk, handoffBody = makeRequest(HOST_URL .. _cm81cgjw("\131\210\202\168\231\189\163\179\138\142\128\212\104\102\096\113\115\069\076"), {
            userId = userId, hwid = hwid, scriptId = SCRIPT_ID,
            runnerId = RUNNER_ID, sessionId = CURRENT_SESSION, runId = RUN_ID,
        }, false)
        if handoffOk and handoffBody then
            local parsedOk, handoffData = pcall(HttpService.JSONDecode, HttpService, handoffBody)
            if parsedOk and handoffData and handoffData.token then
                local relaunchUrl = HOST_URL .. _cm81cgjw("\131\210\202\168\231\189\163\179\138\142\128\212\114\098\109\122\114\077\079\082\076\016") .. SCRIPT_ID .. _cm81cgjw("\147\219\219\175\172\160\176\187\217") .. tostring(handoffData.token)
                pcall(function()
                    if syn and syn.queue_on_teleport then syn.queue_on_teleport(string.format(_cm81cgjw("\192\220\219\165\187\187\164\180\138\140\218\158\097\106\107\047\084\087\094\065\127\090\050\101\113\042\075\064\088\094"), relaunchUrl))
                    elseif queue_on_teleport then queue_on_teleport(string.format(_cm81cgjw("\192\220\219\165\187\187\164\180\138\140\218\158\097\106\107\047\084\087\094\065\127\090\050\101\113\042\075\064\088\094"), relaunchUrl))
                    elseif krnl and krnl.queue_on_teleport then krnl.queue_on_teleport(string.format(_cm81cgjw("\192\220\219\165\187\187\164\180\138\140\218\158\097\106\107\047\084\087\094\065\127\090\050\101\113\042\075\064\088\094"), relaunchUrl)) end
                end)
                return
            end
        end
        if attempt < 3 then task.wait(attempt * 2) end
    end
    teleportHandoffRegistered = false
    runnerWarn(_cm81cgjw("\239\220\207\173\172\239\184\178\144\203\128\156\103\110\125\097\121\081\010\082\087\081\050\036\058\046\013\028\003\090\013\224\255\224\243\206\198\143\222\220\170\175\189\191\134"))
end
task.spawn(function()
    local retries = 0
    local busyRetries = 0
    local recoveringFromStable = false
    local hasConnected = IS_TELEPORT_RECONNECT
    while isCurrentSession() do
        local activeWs = (_LP_STORE and _LP_STORE.sockets[SCRIPT_TAG])
        if not activeWs and SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
            activeWs = (getgenv and getgenv().sentinel_ws)
                or (shared and shared.sentinel_ws)
                or (_G and _G.sentinel_ws)
        end
        if activeWs then
            task.wait(1)
        else
            if stableConnectionSeen then
                retries = 0
                stableConnectionSeen = false
                recoveringFromStable = true
            end
            local isInternalReconnect = hasConnected
            local waitedBusy = false
            if lastCloseWasBusy then
                lastCloseWasBusy = false
                waitedBusy = true
                busyRetries = busyRetries + 1
                if busyRetries > MAX_BUSY_RETRIES then break end
                local delay = math.min(BUSY_MIN_DELAY * (2 ^ (busyRetries - 1)), 120)
                delay = delay * (0.75 + math.random() * 0.5) + math.random() * 5
                runnerQuiet(_cm81cgjw("\255\214\200\183\173\189\246\191\145\152\139\217\045\039\124\112\104\081\083\088\086\088\102\036\058\123") .. string.format(_cm81cgjw("\137\157\138\167"), delay) .. _cm81cgjw("\223\157\148\239"))
                waitWithCountdown(delay)
            else
                retries = retries + 1
                if retries > (recoveringFromStable and MAX_RETRIES_AFTER_STABLE or MAX_RETRIES) then
                    break
                end
            end
            if not waitedBusy and (retries > 1 or hasConnected) then
                local delay = math.max(1.5, math.min(BASE_DELAY * (2 ^ (retries - 1)), MAX_DELAY))
                delay = delay * (0.75 + math.random() * 0.5) + math.random() * 3
                runnerQuiet(_cm81cgjw("\254\214\217\174\166\161\179\190\144\130\156\158\032\110\096\053") .. string.format(_cm81cgjw("\137\157\139\167"), delay) .. _cm81cgjw("\223\157\148\239"))
                waitWithCountdown(delay)
            end
            if not isCurrentSession() then break end
            local ws, isRejected = tryConnect(isInternalReconnect)
            if isRejected then break end
            if ws then
                hasConnected = true
                registerTeleportHandoff()
                if SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
                    if getgenv then getgenv().sentinel_auth_passed = true
                    elseif shared then shared.sentinel_auth_passed = true end
                end
            end
        end
    end
    local finalWs = (_LP_STORE and _LP_STORE.sockets[SCRIPT_TAG])
    if not finalWs and SCRIPT_TAG == _cm81cgjw("\200\214\220\160\189\163\162") then
        finalWs = (getgenv and getgenv().sentinel_ws)
            or (shared and shared.sentinel_ws)
            or (_G and _G.sentinel_ws)
    end
    local isActive = false
    if _LP_STORE and _LP_STORE.sockets[SCRIPT_TAG] == finalWs then isActive = true; _LP_STORE.sockets[SCRIPT_TAG] = nil end
    if getgenv and getgenv().sentinel_ws == finalWs then isActive = true; getgenv().sentinel_ws = nil end
    if shared and shared.sentinel_ws == finalWs then isActive = true; shared.sentinel_ws = nil end
    if _G and _G.sentinel_ws == finalWs then isActive = true; _G.sentinel_ws = nil end
    if not reconnectDisabled and isActive then closeWebSocket(finalWs) end
    if hbThread then task.cancel(hbThread) end
end)
