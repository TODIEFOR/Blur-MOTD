util.AddNetworkString("OpenMotd")

local number

hook.Add( "PlayerSay", "motdChatCommand", function( ply, text, public )
	text = string.lower( text ) 
	if ( text == blurMotd.ChatCommand ) then
		net.Start("OpenMotd")
		net.Send(ply)
		return ""
	end
end )

hook.Add("PlayerInitialSpawn","blurMotdSpawn", function(ply)
	net.Start("OpenMotd")
	net.Send(ply)
end)
