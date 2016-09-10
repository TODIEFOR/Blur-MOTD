local CATEGORY_NAME = "MOTD"

function ulx.forcemotd (calling_ply, target_ply)
	if target_ply:IsValid() then
		target_ply:ReadRules(false)
		target_ply:ConCommand("motd")
		ulx.fancyLogAdmin(calling_ply, true, "#A force opened rules on #T", target_ply)
		
	end
	
end

local forcemotd = ulx.command ( CATEGORY_NAME, "ulx fmotd", ulx.forcemotd, "!forcemotd", true)

forcemotd:addParam{type=ULib.cmds.PlayerArg}
forcemotd:defaultAccess( ULib.ACCESS_ADMIN)
forcemotd:help("force open the motd on a player")   