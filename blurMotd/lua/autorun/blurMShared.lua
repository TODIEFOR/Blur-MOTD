// Dont fakin touch
// ===========================================================================
local meta = FindMetaTable("Player") // For a later date....

function meta:HasReadRules ()

	return self:GetNWBool("Rules", false)
end

function meta:ReadRules(value)

	self:SetNWBool("Rules", value)

end

// ===========================================================================

blurMotd = {}

blurMotd.black = Color( 0, 0, 0, 120)
blurMotd.blue = Color(52, 152, 219,55)
blurMotd.white = Color(255,255,255,5)
blurMotd.red = Color(231, 76, 60,55)

blurMotd.ChatCommand = "!motd"

blurMotd.TimeWait  = 10 // This is the amount of seconds the person has to wait before being able to close the panel.
blurMotd.FadeTime = 1 // Time it takes to fade out the panel

blurMotd.ServerName = "Welcome To The Server!"
blurMotd.Ranks = {"owner","superadmin","admin","moderator"} // Use for later on

blurMotd.News = [[
This MOTD was created by http://steamcommunity.com/id/whiiteuk/

This page will be updated shortly.

]]

/* Alright, to make a button this is the format {title = "Button Title", type = "url", outcome = "http://google.com"},

title = What the button title will be (It adds the button automatically when you create a new table entry)
type = You can choose between "text" or "url", see below for examples
outcome = What the text / url will be

*/

blurMotd.Buttons = {

{title = "Rules", type = "text", outcome = [[Welcome to the server. Heres a list of our rules:
1. Respect All Staff And Their Decisions
2. Don't Exploit
3. Play Fair
4. Don't Mic Spam
5. Scripting / Hacking Will Result In A Permanent Ban
6. Respect Other Players
7. Check Our Group / Website For The Full List Of Rules
8. Have Fun!

]]},

{title = "Google", type = "url", outcome = "http://google.com"},
{title = "Staff", type = "text", outcome = [[This Is The Staff List:
Check back here for more info soon!

]]},
{title = "Youtube", type = "url", outcome = "http://www.youtube.com/"},
{title = "Wu-Tang Clan", type = "url", outcome = "http://www.youtube.com/watch?v=jOLuW2w5kgg"},

}

//Not an extremely special server list addon, its just I cant wrap my head around lua and fucking databases just yet, this isnt needed right now.
blurMotd.Servers = {
	
{gamemode = "Deathrun", description = "Im fat as fuck", ip = "182.168.1.1"},
{gamemode = "Zombie Survival", description = "Chicken Kiev's all round...", ip = "182.168.1.1"},

}
