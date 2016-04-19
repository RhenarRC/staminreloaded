----------------------
-- Stamina Reloaded --
----------------------
-- Auteur : Rhenar ---
-- Version : 0.3 -----
----------------------
if (SERVER) then

function createstamina()
	
	timer.Destroy("staminatimer")
	ply:SetRunSpeed(240)
	ply:SetNWInt("stamina",100)

	staminarestore(ply)

end

hook.Add("spawnply","createstamina", createstamina)
function stamina(ply, key)
	if key == IN_SPEED or ply:KeyDown(IN_SPEED) then
		if ply:InVehicle() then return false end
		if ply:GetMoveType() == MOVETYPE_NOCLIP then return false end
		if ply:GetMoveType() == MOVETYPE_LADDER then return false end
		if ply:GetNWInt("stamina") >= 10 then
			ply:SetRunSpeed(160)
			timer.Destroy("staminagain")
			timer.Create("staminatimer", 0.25, 0, function()
				if ply:GetNWInt("stamina") <= 0 then
					ply:SetRunSpeed(140)
					timer.Destroy("staminatimer")
					return false
				end
				local velocity = ply:GetVelocity()
				if velocity.x >= 140 or velocity.x <= -140 or velocity.y >= 140 or velocity.y <= -140 then
					ply:SetNWInt("stamina", ply:GetNWInt("stamina") - 1 )
				end
			end)
		else
			ply:SetRunSpeed(140)
			timer.Destroy("staminatimer")
		end
	end
	if key == IN_JUMP or ply:KeyDown(IN_JUMP) then
		if ply:GetNWInt("stamina") >= 10 then
			ply:SetJumpPower(200)
			ply:SetNWInt("stamina",ply:GetNWInt("stamina") - 1 )
		else
			ply:SetJumpPower(20)
		end
	end
end

hook.Add("press", "stamina", stamina)

function staminaarret(ply, key)
	if key == IN_SPEED and !ply:KeyDown(IN_SPEED) then
		timer.Destroy("staminatimer")
		staminarestore(ply)
	end
end

hook.Add("arret", "staminaarret", staminaaret)

function staminarestore(ply)
	timer.Create("staminagain", 0.50, 0, function()
		if ply:GetNWInt("stamina") >= 100 then
			return false
		else
			ply:SetNWInt("stamina",ply:GetNWInt("stamina") + 1)
		end
	end)
end
end