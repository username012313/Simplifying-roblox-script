local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game:GetService("Players").LocalPlayer
local CFrameWS = 2
local Carspeed = 2
local Window = Rayfield:CreateWindow({
   Name = "Emergency Hamburg Hub!!",
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
      Note = "No method of obtaining the key is provided", 
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image
local CFRameWS = Tab:CreateSlider({
   Name = "CFrame Walkspeed",
   Range = {0, 20},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 2,
   Flag = "Slider1", 
   Callback = function(Value)
        speed = Value/10
   end,
})
local CFrameWSToggle = Tab:CreateToggle({
    Name = "Enable CFrame Walkspeed",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        running = Value
        if running then
            local char = workspace:FindFirstChild(Player.Name)
            local hrp = char.HumanoidRootPart
            local hum = char.Humanoid
            task.spawn(function()
                while running and char and hum and hrp do
                    local dir = hum.MoveDirection
                    if dir.Magnitude > 0 then
                        hrp.CFrame = hrp.CFrame + (dir * speed)
                    end
                    task.wait() 
                end
            end)
        end
    end,
})
local Tab2 = Window:CreateTab("Car", 4483362458)
local SpeedCamButton = Tab2:CreateButton({
	Name = "No Speedtraps",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		running = Value
		if running then
            task.spawn(function()
		       workspace.SpeedCameras:Destroy()
               workspace.SpeedZones:Destroy()
            end)
        end
	end,
})
local GetInCarButton = Tab2:CreateButton({
   Name = "Get in car from anywhere",
   Callback = function()
        while not workspace.Vehicles:WaitForChild(Player.Name).DriveSeat.Occupant do
	        workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name):PivotTo(workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.CFrame)
	        task.wait()
             game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("fdffc7c3-4c83-4693-8a33-380ed2d60083"):FireServer(workspace:WaitForChild("Vehicles"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("DriveSeat"),"Oj2",false)
             task.wait()
        end
   end,
})
local CarSpeed = Tab2:CreateSlider({
   Name = "Car speed multipler",
   Range = {-10, 50},
   Increment = 0.1,
   Suffix = "",
   CurrentValue = 2,
   Flag = "Slider2", 
   Callback = function(Value)
        Carspeed = Value*10
   end,
})
local CarSpeedToggle = Tab2:CreateToggle({
    Name = "Enable Carspeed mult.",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        running = Value
        if running then
            local car = workspace.Vehicles:FindFirstChild(Player.Name)
            local seat = car.DriveSeat
            task.spawn(function()
		        while running do
                	seat.AssemblyLinearVelocity = seat.CFrame.LookVector * Carspeed
			        task.wait()
		        end
            end)
        end
    end,
})
local CarInvincibiltyToggle = Tab2:CreateToggle({
	Name = "Make car Invincible",
	CurrentValue = false,
	Flag = "Toggle2",
	Callback = function(Value)
		running = Value
		if running then
			local car = workspace.Vehicles:FindFirstChild(Player.Name)
			if not car then return end
			connection = car:GetAttributeChangedSignal("IsOn"):Connect(function()
				if not running then return end -- stop if toggle is off
				if car:GetAttribute("IsOn") == false then
					car:SetAttribute("IsOn", true)
					if Toggles and Toggles.Toggle2 and not Toggles.Toggle2.CurrentValue then
						Toggles.Toggle2:Set(true)
					end
				end
			end)
		end
	end,
})
