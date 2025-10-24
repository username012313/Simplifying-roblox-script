local RAYFIELD = loadstring(game:HttpGet("https://raw.githubusercontent.com/username012313/Simplifying-roblox-script/refs/heads/main/rayfield-cleaned"))()
local Player = game:GetService("Players").LocalPlayer
local VehicleFolder = workspace.Vehicles
local desiredLength = 0
local MyCarPath = nil
local function findPlayerVehicle()
    for _, vehicle in ipairs(VehicleFolder:GetChildren()) do
        local controlValues = vehicle:FindFirstChild("Control_Values")
        local owner = controlValues and controlValues:FindFirstChild("Owner")
        if owner and owner:IsA("StringValue") and owner.Value == Player.Name then
            MyCarPath = vehicle
        end
    end
end
local function alert(msg, type, icon)
    RAYFIELD:Notify({
        Title = type,
        Content = msg,
        Duration = 3.5,
        Image = icon,
    })
end
 local MAINUI = RAYFIELD:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0,  
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "Rayfield", 
   Theme = "DarkBlue", 
    ToggleUIKeybind = "K", 
    DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 
    ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Big Hub"
   },
    Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
    KeySystem = false, 
   KeySettings = {
      Title = "",
      Subtitle = "",
      Note = "", 
      FileName = "1", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {""} 
   }
})

local Tab = MAINUI:CreateTab("Main", "atom")
local Button = Tab:CreateButton({
   Name = "Detect Car",
   Callback = function()
        findPlayerVehicle()
   end,
})
local RoughHeight = Tab:CreateSlider({
   Name = "Set height rough",
   Range = {0, 25},
   Increment = 0.2,
   Suffix = "",
   CurrentValue = 10,
   Flag = "Slider1",     
   Callback = function(Value)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.FL.Spring.MaxLength = Value
        MyCarPath.Wheels.FR.Spring.MaxLength = Value
        MyCarPath.Wheels.RL.Spring.MaxLength = Value
        MyCarPath.Wheels.RR.Spring.MaxLength = Value
        MyCarPath.Wheels.FL.Spring.MinLength = Value
        MyCarPath.Wheels.FR.Spring.MinLength = Value
        MyCarPath.Wheels.RL.Spring.MinLength = Value
        MyCarPath.Wheels.RR.Spring.MinLength = Value
   end,
})
local FineHeight = Tab:CreateSlider({
   Name = "Set height fine",
   Range = {0, 8},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 10,
   Flag = "Slider2",     
   Callback = function(Value)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.FL.Spring.MaxLength = Value
        MyCarPath.Wheels.FR.Spring.MaxLength = Value
        MyCarPath.Wheels.RL.Spring.MaxLength = Value
        MyCarPath.Wheels.RR.Spring.MaxLength = Value
        MyCarPath.Wheels.FL.Spring.MinLength = Value
        MyCarPath.Wheels.FR.Spring.MinLength = Value
        MyCarPath.Wheels.RL.Spring.MinLength = Value
        MyCarPath.Wheels.RR.Spring.MinLength = Value
   end,
})
local LimitsToggle = Tab:CreateToggle({
   Name = "Hinge Limits",
   CurrentValue = false,
   Flag = "Toggle1",     
   Callback = function(Value)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.FL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
        MyCarPath.Wheels.FR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
        MyCarPath.Wheels.RL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
        MyCarPath.Wheels.RR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
   end,
})
local SuspensionLimits = Tab:CreateToggle({
   Name = "Suspenion Limits",
   CurrentValue = false,
   Flag = "Toggle2",     
   Callback = function(Value)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.FL.Spring.LimitsEnabled = Value
        MyCarPath.Wheels.FR.Spring.LimitsEnabled = Value
        MyCarPath.Wheels.RL.Spring.LimitsEnabled = Value
        MyCarPath.Wheels.RR.Spring.LimitsEnabled = Value
   end,
})
local Tab2 = MAINUI:CreateTab("Second Tab", "atom")
local desiredHeight = Tab2:CreateSlider({
   Name = "Set desired Height",
   Range = {0, 10},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 0,
   Flag = "Slider3",     
   Callback = function(Value)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        desiredLength = Value
   end,
})
local rearSet = Tab2:CreateButton({
   Name = "Set rear desired height",
   Callback = function()
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.RL.Spring.MaxLength = desiredLength
        MyCarPath.Wheels.RR.Spring.MaxLength = desiredLength
        MyCarPath.Wheels.RL.Spring.MinLength = desiredLength
        MyCarPath.Wheels.RR.Spring.MinLength = desiredLength
   end,
})
local frontSet = Tab2:CreateButton({
   Name = "Set front desired height",
   Callback = function()
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        MyCarPath.Wheels.FL.Spring.MaxLength = desiredLength
        MyCarPath.Wheels.FR.Spring.MaxLength = desiredLength
        MyCarPath.Wheels.FL.Spring.MinLength = desiredLength
        MyCarPath.Wheels.FR.Spring.MinLength = desiredLength
   end,
})
