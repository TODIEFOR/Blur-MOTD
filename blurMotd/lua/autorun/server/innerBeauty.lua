util.AddNetworkString("OpenMotd")

local number

hook.Add( "PlayerSay", "motdChatCommand", function( ply, text, public )
	text = string.lower( text ) 
	if ( text == "!motd" ) then
		net.Start("OpenMotd")
		net.Send(ply)
		return ""
	end
end )
