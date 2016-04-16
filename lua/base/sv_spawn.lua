----------------------
-- Stamina Reloaded --
----------------------
-- Auteur : Rhenar ---
-- Version : 0.1 -----
----------------------
AddCSLuaFile()

include("lua/base/sv_stopsprint.lua")
include("lua/base/sv_sprint.lua")

-- ConVars --

ply = LocalPlayer()

-----------------------------

function createstamina()
	
	timer.Destroy("staminatimer")
	ply:SetRunSpeed(240)
	ply:SetNWInt("stamina",100)

	staminarestore(ply)

end

hook.Add("spawnply","createstamina", createstamina)