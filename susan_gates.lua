local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace:FindFirstChildOfClass("Camera")

local keys = SilentAim.keys
local mt = getrawmetatable(game)
local namecall = mt.__namecall
local aimlock = {
  ["activated"] = true,
  ["victim"] = nil,
}

if not SilentAim["general configuration"]["sos down"] then 
	StarterGui:SetCore("SendNotification",{
	    Title="Silent Aim",
	    Text = "The script refuses to execute because you have the value of sos down set to false"
	})
    return
end 

if game.PlaceId ~= 2788229376 or LOADED then
	StarterGui:SetCore("SendNotification",{
	    Title="Silent Aim",
	    Text = "the game is not da hood / the script has already been executed"
	})
    return
end

if SilentAim["general configuration"]["metamethods mode"] and SilentAim["general configuration"]["camera manipulation"] then
    StarterGui:SetCore("SendNotification",{
	    Title="Silent Aim",
	    Text = "You have both methods activated / activate only one and run again."
	})
    return
end

getgenv().LOADED = true

if SilentAim["general configuration"]["metamethods mode"] then
	StarterGui:SetCore("SendNotification",{
		Title="Silent Aim",
		Text = "Silent Aim Activated\nMode: metatables position spoofing"
	})
elseif SilentAim["general configuration"]["camera manipulation"] then 
	StarterGui:SetCore("SendNotification",{
		Title="Silent Aim",
		Text = "AIMLOCK ACTIVADO\nMode: camera maniuplation"
	})
end 

wait(1.5)

StarterGui:SetCore("SendNotification",{
    Title="Silent Aim",
    Text = "Press the key "..keys.key3.." to activate / disable the silent aim"
})
StarterGui:SetCore("SendNotification",{
    Title="Silent Aim",
    Text = "Press the key "..keys.key2.." to unlock"
})
StarterGui:SetCore("SendNotification",{
    Title="Silent Aim",
    Text = "Press the key "..keys.key1.." to lock onto someone\n(put the mouse over the person you want to lock on)"
})

function isautistic(autist)
    if Players:GetPlayerFromCharacter(autist) then
        return true
    else
        return false
    end
end

function kill_and_violate_his_rotten_body(victim)
    return Players:GetPlayerFromCharacter(victim)
end

function groomer(pedophile,victim,genitals,woman,minor)
	if pedophile == "Drizzy" and victim and woman and minor then
        if SilentAim["general configuration"].predict_movements then
            return victim.Character[genitals].Position + victim.Character.UpperTorso.Velocity * SilentAim["general configuration"].prediction
        else
            return victim.Character[genitals].Position
        end
    end
end

function ispedophile(dhplayer,retard)
	if dhplayer == "Drizzy" then
		if tostring(retard) == "MainEvent" then
			return true
		end
	end
end

function suicide(mongolian)
	local gay = mongolian.Character
    gay.Humanoid.Died:Connect(function()
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        StarterGui:SetCore("SendNotification",{
            Title="Silent Aim",
            Text = "You've died, the aimlock was deactivated."
        })
    end)
    gay.BodyEffects["K.O"].Changed:Connect(function()
        if gay.BodyEffects["K.O"].Value == true then
            aimlock.activated = false
            LocalPlayer.CameraMode = Enum.CameraMode.Classic
            StarterGui:SetCore("SendNotification",{
                Title="Silent Aim",
                Text = "You have been knocked, the aimlock was deactivated."
            })
        end
    end)
end

function died(mongolian)
    local gay = mongolian.Character
	if gay:FindFirstChild("BodyEffects") and gay.BodyEffects:FindFirstChild("K.O") then
		hong_kong = gay.BodyEffects["K.O"].Changed:Connect(function()
			if gay.BodyEffects["K.O"].Value == true and aimlock["victim"] == mongolian then
				aimlock.victim = nil
				LocalPlayer.CameraMode = Enum.CameraMode.Classic
				StarterGui:SetCore("SendNotification",{
					Title="Silent Aim",
					Text = "The one you have locked on has been knocked, unlocked from them."
				})
			end
			hong_kong:Disconnect()
		end)
	end
	china = gay.Humanoid.Died:Connect(function()
		if aimlock["victim"] == mongolian then
			aimlock.victim = nil
			LocalPlayer.CameraMode = Enum.CameraMode.Classic
			StarterGui:SetCore("SendNotification",{
				Title="Silent Aim",
				Text = "The one you locked on died, unlocked frm them."
			})
		end
		china:Disconnect()
	end)
end

function go_hong_kong(geographic_location)
    Camera.CoordinateFrame = geographic_location
end

suicide(LocalPlayer)

LocalPlayer.CharacterAdded:Connect(function(asjfkg)
	repeat wait() until asjfkg:FindFirstChild("Humanoid")
	repeat wait() until asjfkg:FindFirstChild("BodyEffects")
	wait(0.2)
    suicide(LocalPlayer)
end)

Players.PlayerRemoving:Connect(function(asshole)
    if asshole == aimlock["victim"] then
        aimlock["victim"] = nil
        StarterGui:SetCore("SendNotification",{
            Title="Silent Aim",
            Text = "THE RETARD YOU LOCKED ON LEFT HAHAHA XD\nUNLOCKED"
        })
    end
end)

Mouse.KeyDown:Connect(function(AMONGUS)
    if AMONGUS:lower() == keys.key1:lower() then
        local genital = Mouse.Target
        if genital then
            local victim = genital.Parent
            if victim:IsA("Accessory") then
                victim = victim.Parent
            elseif victim.Name == "SpecialParts" then
                victim = victim.Parent.Parent
            end
            if victim:FindFirstChild("Humanoid") and isautistic(victim) then
                aimlock.victim = kill_and_violate_his_rotten_body(victim)
                StarterGui:SetCore("SendNotification",{
                    Title = "Silent Aim",
                    Text = "Locked on to: "..victim.Name
                })
                if victim:FindFirstChild("BodyEffects") and victim.BodyEffects:FindFirstChild("K.O") then 
					if victim.BodyEffects["K.O"].Value == false then
						died(kill_and_violate_his_rotten_body(victim))
					end
                end
           end
        end
    elseif AMONGUS:lower() == keys.key2:lower() then
        if aimlock.victim then
            local previous_victim = aimlock.victim
            aimlock.victim = nil
            StarterGui:SetCore("SendNotification",{
                Title = "Silent Aim",
                Text = "Unlocked from: "..previous_victim.Name
            })
	    wait(0.3)
	    LocalPlayer.CameraMode = Enum.CameraMode.Classic 
        end
    elseif AMONGUS:lower() == keys.key3:lower() then
        if aimlock.victim == true then
            aimlock.activated = false
            StarterGui:SetCore("SendNotification",{
                Title = "Silent Aim",
                Text = "Aimlock (false)"
            })
            wait(0.3)
            LocalPlayer.CameraMode = Enum.CameraMode.Classic 
        else
            aimlock.activated = true
            StarterGui:SetCore("SendNotification",{
                Title = "Silent Aim",
                Text = "Aimlock (true)"
            })
        end
    end
end)

if SilentAim["general configuration"]["metamethods mode"] then
    setreadonly(mt,false)
    mt.__namecall = newcclosure(function(self,...) 
        local arg = {...}
        local namecallmethod = getnamecallmethod()
        if namecallmethod == "FireServer" and ispedophile("Drizzy",self) and arg[1] == "UpdateMousePos" and aimlock.activated and aimlock["victim"] then 
            arg[2] = groomer("Drizzy",aimlock["victim"],SilentAim["general configuration"]["aim part"] or "Head",true,true)
        end
        return namecall(self,unpack(arg))
    end)
    setreadonly(mt,true)
elseif SilentAim["general configuration"]["camera manipulation"] then
RunService:BindToRenderStep("HONG KONG",Enum.RenderPriority.First.Value,function()
	local number_of_genitals = SilentAim["general configuration"]["aim part"]
        if aimlock.activated and aimlock["victim"] then
            	LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            	go_hong_kong(
			CFrame.new(
				Camera.CoordinateFrame.p, 
				CFrame.new(aimlock["victim"].Character[number_of_genitals].Position - Vector3.new(0,SilentAim["general configuration"].Y,0)).p 
			)
		)
        end
end)
else
    StarterGui:SetCore("SendNotification",{
        Title="Silent Aim",
        Text = "Somehow, none of the options were activated, what the fuck, harry"
    })
    return
end
