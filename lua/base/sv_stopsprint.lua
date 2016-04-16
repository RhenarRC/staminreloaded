----------------------
-- Stamina Reloaded --
----------------------
-- Auteur : Rhenar ---
-- Version : 0.1 -----
----------------------
AddCSLuaFile()

include("lua/base/sv_spawn.lua")
include("lua/base/sv_sprint.lua")

-- ConVars --

ply = LocalPlayer()

-----------------------------

function staminaarret(ply, key)
	if key == IN_SPEED and !ply:KeyDown(IN_SPEED) then
		timer.Destroy("staminatimer")
		staminarestore(ply)
	end
end

hook.Add("arret", "staminarret" staminaaret)

function staminarestore(ply)
	timer.Create("staminagain", 0.50, 0, function()
		if ply:GetNWInt("stamina") >= 100 then
			return false
		else
			ply:SetNWInt("stamina",ply:GetNWInt("stamina") + 1)
		end
	end)
end