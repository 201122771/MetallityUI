game.StarterGui:SetCore("SendNotification", {
    Title = "Mentallity Hub"; -- the title (ofc)
    Text =  "!!Loaded!!";
    Duration = 5;
})

print("----------<({Mentallity})>---------")
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/201122771/Mayhem/main/venyx"))() --Reuploaded Venyx UI Lib, guy get's free credit.
local venyx = library.new("Metallity; RobberGUI", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(112, 18, 18),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(53, 13, 13),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- welcome
local page = venyx:addPage("Welcome!", 5012544693)
local section1 = page:addSection("Welcome!")

local guiuser = game.Players.LocalPlayer.Name

section1:addButton("Logged in as, ".. guiuser, function()

end)

section1:addButton("Project: Mentallity", function()

end)

section1:addButton("Version: Alpha 0.0.1", function()

end)

section1:addKeybind("ToggleKeybind", Enum.KeyCode.P, function()
print("Activated Keybind")
venyx:toggle()
end, function()
end)

-- 1st page
local page = venyx:addPage("R-1", 5012544693)
local section1 = page:addSection("Modules")

section1:addButton("Load ESP Module", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/201122771/MetallityUI/main/Main%20ESP"))()
end)

section1:addButton("Load Aimbot", function()
    local plr = game.Players.LocalPlayer
    local camera = game.Workspace.CurrentCamera
    local UIS = game.UserInputService
    local mouse = plr:GetMouse()
    local LOCKON = "Head"
    _G.aim = false

    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            _G.aim = true
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            _G.aim = false
        end
    end)

    local FOV = Drawing.new("Circle") -- Change these ESP Settings to anything at https://x.synapse.to/docs/reference/drawing_lib.html
    FOV.Visible = true
    FOV.Color = Color3.fromRGB(30, 255, 0)
    FOV.Thickness = 2
    FOV.NumSides = 100
    FOV.Radius = 125
    FOV.Filled = false

    game:GetService("RunService").RenderStepped:Connect(function()
        local closest = nil
        local min = math.huge
        FOV.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
        if _G.aim == true then
            for i, v in pairs(game.Players:GetChildren()) do
                if v.TeamColor ~= plr.TeamColor then
                    if game.Players:FindFirstChild(v.Name) and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= plr.Name  and v.Character.Humanoid.Health > 0 then
                        local plrpos, OnScreen = camera:WorldToViewportPoint(v.Character[LOCKON].Position)
                        if OnScreen then
                            local distance = math.sqrt(math.pow(mouse.X - plrpos.X, 2), math.pow(mouse.Y - plrpos.Y, 2))
                            local fovdistance = math.sqrt(math.pow(FOV.Position.X - plrpos.X, 2) + math.pow(FOV.Position.Y - plrpos.Y, 2))
                            if fovdistance <= FOV.Radius then
                                if distance < min then
                                    min = distance
                                    closest = v
                                end
                            end
                        end
                    end
                end
            end
            if game.Players:FindFirstChild(closest.Name) and closest.Character ~= nil and closest.Character:FindFirstChild("Humanoid") ~= nil and closest.Character:FindFirstChild("HumanoidRootPart") ~= nil and closest.Name ~= plr.Name  and closest.Character.Humanoid.Health > 0 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, closest.Character[LOCKON].CFrame.Position)
            end
        end
    end)
end)

section1:addButton("Noclip(V)", functio()
    game:getService("RunService"):BindToRenderStep("",0,function()
    if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then return end
    if game:getService("UserInputService"):IsKeyDown(Enum.KeyCode.V) then
    game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
    end
    end)
end)

-- Credits page
local page = venyx:addPage("Credits", 5012544693)
local section1 = page:addSection("Scripter & UI")
local section2 = page:addSection("Special Mentions")

section1:addButton("Scripts by Menace#1337", function()

end)

section1:addButton("UI Library used: Venyx", function()

end)

section2:addButton("LookFord#2277", function()

end)

section2:addButton("ArtfulDesires#6929", function()

end)

-- Themes
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true) -- no default for more freedom