local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game:GetService("Players").LocalPlayer
local CFrameWS = 2
local Carspeed = 2
local TweenSpeed = 15
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
	Callback = function()
        task.spawn(function()
		    workspace.SpeedCameras:Destroy()
            workspace.SpeedZones:Destroy()
        end)
	end,
})
local GetInCarButton = Tab2:CreateButton({
   Name = "Get in car from anywhere",
   Callback = function()
        while not workspace.Vehicles:WaitForChild(Player.Name).DriveSeat.Occupant do
	        workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name):PivotTo(workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.CFrame)
	        task.wait()
             game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("fdffc7c3-4c83-4693-8a33-380ed2d60083"):FireServer(workspace:WaitForChild("Vehicles"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("DriveSeat"),"Oj2",false)
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
            car:SetAttribute("IsOn", true)
			end)
		end
	end,
})
local CarInfiniteFuel = Tab2:CreateToggle({
	Name = "Infinite Fuel",
	CurrentValue = false,
	Flag = "Toggle9",
	Callback = function(Value)
		running = Value
		if running then
			local car = workspace.Vehicles:FindFirstChild(Player.Name)
			if not car then return end
			connection == car:GetAttributeChangedSignal("currentFuel"):Connect(function()
				if not running then return end -- stop if toggle is off
				if Fuel = car:GetAttribute("currentFuel") and Fuel < 10 then
                    car:SetAttribute("currentFuel", 9e99)
                    if Toggles and Toggles.Toggle2 and not Toggles.Toggle2.CurrentValue then
                        Toggles.Toggle2:Set(true)
                    end
				end
            car:SetAttribute("currentFuel", 9e99)
			end)
		end
    end,
})
local Tab3 = Window:CreateTab("Automation", 4483362458)
local TweenSpeedSlider = Tab3:CreateSlider({
   Name = "Slider Example",
   Range = {1, 50},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       TweenSpeed = Value
   end,
})
local TweenTime = Tab3:CreateToggle({
	Name = "Set Time automatically",
	CurrentValue = false,
	Flag = "Toggle9",
	Callback = function(Value)
		running = Value
		if running then
			TweenSpeed = 0
            Rayfield:Notify({
                Title = "Tweens",
                Content = "Please dont move the Time slider while this is enabled",
                Duration = 6.5,
                Image = 4483362458,
            })

		end
    end,
})
local SpawnCar = Tab2:CreateButton({
   Name = "Get in car from anywhere",
   Callback = function()
        local part = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).PrimaryPart
        local tweenservice = game:GetService("TweenService")
        if TweenSpeed ~= 0 then
            local distanceX = math.abs((((workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.CFrame.Position.X + Vector3.new(-1388.8311767578125, 5.537262439727783, 986.9691772460938).X)/2)+1388))
            local distanceZ = math.abs((((workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.CFrame.Position.Z + Vector3.new(-1388.8311767578125, 5.537262439727783, 986.9691772460938).Z)/2)-986))
            local time = math.ceil(((math.max(distanceX,distanceZ))/10))
            local tweeninfo = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
            local tween = tweenservice:Create(workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart, tweeninfo, {CFrame= CFrame.new(-1388.861572265625, 5.537262439727783, 988.2486572265625)})
            tween:Play()
            task.wait(time+0.1)

            game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("69141aa3-8c6a-4eee-ab58-c7805873c0ee"):FireServer()
            task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("e8f3d225-1be6-487b-9572-36254957b902"):FireServer("VW Passat Citizen")

            while not workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.Occupant do
	            workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name):PivotTo(workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.CFrame)
	            task.wait()
                game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("fdffc7c3-4c83-4693-8a33-380ed2d60083"):FireServer(workspace:WaitForChild("Vehicles"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("DriveSeat"),"Oj2",false)
            end

        else
            local distance = ((workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart.CFrame.Position.X + Vector.new(-1388)/2).Magnitude
            local tweeninfo = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
            local tween = tweenservice:Create(workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart, tweeninfo, {CFrame= CFrame.new(-1388.861572265625, 5.537262439727783, 988.2486572265625)})
            tween:Play()
            task.wait(TweenSpeed)

            game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("69141aa3-8c6a-4eee-ab58-c7805873c0ee"):FireServer()
            task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("e8f3d225-1be6-487b-9572-36254957b902"):FireServer("VW Passat Citizen")

            while not workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.Occupant do
	            workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name):PivotTo(workspace.Vehicles:WaitForChild(game:GetService("Players").LocalPlayer.Name).DriveSeat.CFrame)
	            task.wait()
                game:GetService("ReplicatedStorage"):WaitForChild("Bnl"):WaitForChild("fdffc7c3-4c83-4693-8a33-380ed2d60083"):FireServer(workspace:WaitForChild("Vehicles"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("DriveSeat"),"Oj2",false)
            end
        end
   end,
})
