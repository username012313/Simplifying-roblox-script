local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game:GetService("Players").LocalPlayer
local Window = Rayfield:CreateWindow({
   Name = "buggy eh thing",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = eh, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Information!!",
   Content = "Please first spawn a car in before using the Sliders and toggles",
   Duration = 6.5,
   Image = 4483362458,
})
local Tab = Window:CreateTab("Car suspension", 4483362458) -- Title, Image
local SuspensionheightSlider = Tab:CreateSlider({
   Name = "Suspension height",
   Range = {0, 50},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 2,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.MaxLength = Value
        localcar.DriveSeat.SpringFR.MaxLength = Value
        localcar.DriveSeat.SpringRL.MaxLength = Value
        localcar.DriveSeat.SpringRR.MaxLength = Value
        localcar.DriveSeat.SpringFL.MinLength = Value
        localcar.DriveSeat.SpringFR.MinLength = Value
        localcar.DriveSeat.SpringRL.MinLength = Value
        localcar.DriveSeat.SpringRR.MinLength = Value
        localcar.DriveSeat.SpringFL.FreeLength = Value
        localcar.DriveSeat.SpringFR.FreeLength = Value
        localcar.DriveSeat.SpringRL.FreeLength = Value
        localcar.DriveSeat.SpringRR.FreeLength = Value
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Make Springs use Values",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.LimitsEnabled = Value
        localcar.DriveSeat.SpringFR.LimitsEnabled = Value
        localcar.DriveSeat.SpringRL.LimitsEnabled = Value
        localcar.DriveSeat.SpringRR.LimitsEnabled = Value
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Enable Springs (air suspension??)",
   CurrentValue = true,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.Enabled = Value
        localcar.DriveSeat.SpringFR.Enabled = Value
        localcar.DriveSeat.SpringRL.Enabled = Value
        localcar.DriveSeat.SpringRR.Enabled = Value
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Stiffness",
   Range = {0, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 10,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.Stiffness = Value*1000
        localcar.DriveSeat.SpringFR.Stiffness = Value*1000
        localcar.DriveSeat.SpringRL.Stiffness = Value*1000
        localcar.DriveSeat.SpringRR.Stiffness = Value*1000
   end,
})
local Button = Tab:CreateButton({
    Name = "Make them work with custom heights (PRESS FIRST)",
   Callback = function()
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.MaxForce = math.huge
        localcar.DriveSeat.SpringFR.MaxForce = math.huge
        localcar.DriveSeat.SpringRL.MaxForce = math.huge
        localcar.DriveSeat.SpringRR.MaxForce = math.huge
        localcar.DriveSeat.SafetyConstraintFL.Length = math.huge
        localcar.DriveSeat.SafetyConstraintFR.Length = math.huge
        localcar.DriveSeat.SafetyConstraintRL.Length = math.huge
        localcar.DriveSeat.SafetyConstraintRR.Length = math.huge
   end,
})
local Button = Tab:CreateButton({
    Name = "Reset all Springs",
   Callback = function()
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.MaxLength = 2
        localcar.DriveSeat.SpringFR.MaxLength = 2
        localcar.DriveSeat.SpringRL.MaxLength = 2
        localcar.DriveSeat.SpringRR.MaxLength = 2
        localcar.DriveSeat.SpringFL.MinLength = 2
        localcar.DriveSeat.SpringFR.MinLength = 2
        localcar.DriveSeat.SpringRL.MinLength = 2
        localcar.DriveSeat.SpringRR.MinLength = 2
        localcar.DriveSeat.SpringFL.FreeLength = 2
        localcar.DriveSeat.SpringFR.FreeLength = 2
        localcar.DriveSeat.SpringRL.FreeLength = 2
        localcar.DriveSeat.SpringRR.FreeLength = 2
        localcar.DriveSeat.SpringFL.LimitsEnabled = false
        localcar.DriveSeat.SpringFR.LimitsEnabled = false
        localcar.DriveSeat.SpringRL.LimitsEnabled = false
        localcar.DriveSeat.SpringRR.LimitsEnabled = false
        localcar.DriveSeat.SpringFL.Enabled = true
        localcar.DriveSeat.SpringFR.Enabled = true
        localcar.DriveSeat.SpringRL.Enabled = true
        localcar.DriveSeat.SpringRR.Enabled = true
        localcar.DriveSeat.SpringFL.Stiffness = 4000
        localcar.DriveSeat.SpringFR.Stiffness = 4000
        localcar.DriveSeat.SpringRL.Stiffness = 4000
        localcar.DriveSeat.SpringRR.Stiffness = 4000
        localcar.DriveSeat.SpringFL.MaxForce = 80000 --80k
        localcar.DriveSeat.SpringFR.MaxForce = 80000
        localcar.DriveSeat.SpringRL.MaxForce = 80000
        localcar.DriveSeat.SpringRR.MaxForce = 80000 
        localcar.DriveSeat.SafetyConstraintFL.Length = 1
        localcar.DriveSeat.SafetyConstraintFR.Length = 1
        localcar.DriveSeat.SafetyConstraintRL.Length = 1
        localcar.DriveSeat.SafetyConstraintRR.Length = 1
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "make em springy bois visible",
   CurrentValue = true,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        localcar.DriveSeat.SpringFL.Visible = Value
        localcar.DriveSeat.SpringFR.Visible = Value
        localcar.DriveSeat.SpringRL.Visible = Value
        localcar.DriveSeat.SpringRR.Visible = Value
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Motor Speed ()",
   Range = {0, 100000},
   Increment = 1,
   Suffix = "",
   CurrentValue = 200,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local carpath = workspace.Vehicles
        local player = game:GetService("Players").LocalPlayer
        local localcar = carpath:WaitForChild(player.Name)
        while true do
            localcar.DriveSeat.CylindricalConstraints.FL.MotorMaxTorque = Value
            localcar.DriveSeat.CylindricalConstraints.FR.MotorMaxTorque = Value
            localcar.DriveSeat.CylindricalConstraints.RL.MotorMaxTorque = Value
            localcar.DriveSeat.CylindricalConstraints.RR.MotorMaxTorque = Value
            localcar.DriveSeat.CylindricalConstraints.FL.MotorMaxAngularAcceleration = Value
            localcar.DriveSeat.CylindricalConstraints.FR.MotorMaxAngularAcceleration = Value
            localcar.DriveSeat.CylindricalConstraints.RL.MotorMaxAngularAcceleration = Value
            localcar.DriveSeat.CylindricalConstraints.RR.MotorMaxAngularAcceleration = Value
            task.wait(0.01)
            end
   end,
})
