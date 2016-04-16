----------------------
-- Stamina Reloaded --
----------------------
-- Auteur : Rhenar ---
-- Version : 0.1 -----
----------------------

if CLIENT then


end

if SERVER then

	AddCSLuaFile("lua/base/sv_stopsprint.lua")
	AddCSLuaFile("lua/base/sv_sprint.lua")
	AddCSLuaFile("lua/base/sv_spawn.lua")

end


print("\n")
MsgC(Color(0,255,0), "----------------------------------------------------------------------\n")
print("\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Stamina\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Version: 0.1\n")
print("\n")
MsgC(Color(0,255,0), "----------------------------------------------------------------------\n")
print("\n")