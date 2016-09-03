// Stop stealing my horrific code.
// Credit to Nutscipts Blur, I fucking love blur, maybe im blind.
// original names and memes 

local wave = Material( "icon16/user.png")
local admun = Material( "icon16/shield.png")
local right = Material( "icon16/shield_add.png")

local hoverColor  = blurMotd.black
local hoverColor2 = blurMotd.black
local hoverColor3 = blurMotd.black
local scrollGripColor = blurMotd.black
local black =  Color( 0, 0, 0, 120)
local blue = Color(52, 152, 219,55)
local white = Color(255,255,255,100)




--local hoverColor  = Color(52, 152, 219,55)

--local titleEntryValue
/*function motdQueryTitle(type, buttontext)

		local frame = vgui.Create("DFrame")
			frame:SetSize(ScrW() / 2, ScrH() / 5)
			frame:Center()
			frame:SetTitle("Editor")
			frame:SetBackgroundBlur(true)
			frame:SetDraggable(false)
			frame:MakePopup()
			frame:ShowCloseButton(false)

		local entry = vgui.Create("DTextEntry", frame)
			entry:Dock(TOP)
			entry:DockMargin(5,5,5,5)
			entry:SetSize(frame:GetWide(), frame:GetTall() / 8)
			entry:SetText("Enter New Title.....")
			entry.OnEnter = function( self )
				titleEntryValue = self:GetValue() 
			end
			entry.OnTextChanged = function (self)
				titleEntryValue = self:GetValue()
			end



		local button = vgui.Create("DButton", frame)
			button:Dock(TOP)
			button:DockMargin(5,5,5,5)
			button:SetSize(frame:GetWide(), frame:GetTall() / 5)
			button:SetText("Confirm Edit")
			button.DoClick = function ()
				frame:Close()
				print(titleEntryValue)

			end

end*/


local important = blurMotd.ServerName
	local function format_currency(amount)
 		 local formatted = amount
 		 while true do  
  			  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
   				 if (k==0) then
     				 break
   				 end
  		end
 		 return formatted
	end

local function drawmotdFrame  ()

		local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount)
		local x, y = panel:LocalToScreen(0, 0)
		local scrW, scrH = ScrW(), ScrH()
		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(blur)
			for i = 1, 3 do
				blur:SetFloat("$blur", (i / 3) * (amount or 6))
				blur:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
			end
	end


	local motdFrame  = vgui.Create("DFrame")
		motdFrame:SetSize(ScrW() / 2, ScrH() / 1.5)	
		motdFrame:SetPos(0,0)
		motdFrame:Center()
		motdFrame:MakePopup()
		motdFrame:SetDraggable(false)
		motdFrame:SetTitle(important)
		motdFrame:ShowCloseButton(false)
    		motdFrame.Paint = function( self, w, h )
			DrawBlur(self, 3)
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
			surface.SetDrawColor( Color( 0, 0, 0, 100 ) )
			surface.DrawOutlinedRect( 0, 0, w, h )
		end

		
	/* local panelServerHop= vgui.Create("DButton", motdFrame)
		panelServerHop:DockMargin(5,5,5,5)
		panelServerHop:SetSize(16,16)
		panelServerHop:Dock(TOP)
		panelServerHop:SetText("")
		panelServerHop.Paint = function()
			surface.SetDrawColor( Color( 255, 255, 255  ) )
			surface.SetMaterial(wave)
			surface.DrawTexturedRect(0,0,16,16)
		end
		panelServerHop.DoClick = function()
			motdFrame:AlphaTo( 0, 0.5, 0,  function () motdFrame:Close() end ) 
			if LocalPlayer() and IsValid( LocalPlayer() ) then LocalPlayer():ConCommand( "hop") end 
		end */

	local buttonPanel = vgui.Create("DPanel",motdFrame)
		buttonPanel:SetSize(motdFrame:GetWide()  /2, motdFrame:GetTall() / 8)
		buttonPanel:Dock(BOTTOM)
		buttonPanel:DockMargin(4,4,4,4)
		buttonPanel.Paint = function ( )
		
		end

	local agreeButton = vgui.Create("DButton", buttonPanel)
		agreeButton:SetSize(motdFrame:GetWide()  /2.1, motdFrame:GetTall() / 8)
		agreeButton:Dock(LEFT)
		agreeButton:DockMargin(0,0,0,0)
		 agreeButton.TimerFinish = CurTime()+blurMotd.TimeWait
		agreeButton.Think = function( self )
			self:SetText( "Exit MOTD ".."("..math.Round( self.TimerFinish - CurTime() )..")" )
			if  self.TimerFinish-CurTime() <= 0 or  LocalPlayer():HasReadRules() == true   then 
				self:SetText( "Exit MOTD ".."(".."0"..")" )
				self:SetEnabled(true)
				LocalPlayer():ReadRules(true)
				--panelServerHop:SetEnabled(true)
			else 
				self:SetEnabled(false)
				--panelServerHop:SetEnabled(false)
			end
		end
		
		agreeButton:SetTextColor(Color(255,255,255))			
		agreeButton.Paint = function (self)	
			draw.RoundedBox( 0, 0, 0, agreeButton:GetWide(), agreeButton:GetTall(), hoverColor)
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, agreeButton:GetWide(),  agreeButton:GetTall() )
			surface.SetDrawColor( Color( 255, 255, 255  ) )
				surface.SetMaterial(wave)
				surface.DrawTexturedRect(5,5,16,16)
				
			
		end

		agreeButton.OnCursorEntered = function ()
			surface.PlaySound("ui/buttonrollover.wav")
			hoverColor = blurMotd.blue		
		end

		agreeButton.OnCursorExited = function ()
			hoverColor = blurMotd.black
			agreeButton:SetText("Exit MOTD")
		end
	
	
		agreeButton.DoClick = function(self)
			--chat.AddText( Color( 46, 204, 113 ), LocalPlayer(), " Accepted The Rules.")
			--chat.PlaySound()
			motdFrame:AlphaTo( 0, blurMotd.FadeTime, 0,  function () motdFrame:Close() end ) 		
		end


		local extraButton = vgui.Create("DButton", buttonPanel)
		extraButton:SetSize(motdFrame:GetWide()  / 2, motdFrame:GetTall() / 8)
		extraButton:Dock(LEFT)
		extraButton:DockMargin(5,0,0,0)
		extraButton:SetTextColor(Color(255,255,255))
		extraButton:SetText("Extra")
		extraButton.Paint = function (self)	
			draw.RoundedBox( 0, 0, 0, extraButton:GetWide(), extraButton:GetTall(), hoverColor3)
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, extraButton:GetWide(),  extraButton:GetTall() )
			surface.SetDrawColor( Color( 255, 255, 255  ) )
				surface.SetMaterial(right)
				surface.DrawTexturedRect(5,5,16,16)
				
			
		end

		extraButton.OnCursorEntered = function ()
			surface.PlaySound("ui/buttonrollover.wav")
			hoverColor3 = blurMotd.red		
		end

		extraButton.OnCursorExited = function ()
			hoverColor3 = blurMotd.black
			--extraButton:SetText("Exit MOTD")
		end
		
		extraButton.DoClick = function ()
			--if LocalPlayer() and IsValid( LocalPlayer() ) then LocalPlayer():ConCommand( "hop") end 
			--motdFrame:AlphaTo( 0, 0.5, 0,  function () motdFrame:Close() end ) 
			--LocalPlayer():ConCommand("motdSettings")
		end

	/*	extraButton.DoRightClick = function () 

			if !LocalPlayer():GetUserGroup()  == ply_rank then return 
			else

			local settingsMenu = vgui.Create("DMenu")

			local btnWithIcon = settingsMenu:AddOption( "Edit MOTD Title" ) 
			btnWithIcon:SetIcon( "icon16/book_edit.png" )

			btnWithIcon.DoClick = function() motdQueryTitle() end
 
			local btnWithIcon2 = settingsMenu:AddOption( "Edit MOTD Colours" ) 
			btnWithIcon2:SetIcon( "icon16/color_wheel.png" )

			btnWithIcon2.DoClick = function() motdQuery(color, "Edit Color") end

			local btnWithIcon3 = settingsMenu:AddOption( "Edit News Feed" ) 
			btnWithIcon3:SetIcon( "icon16/world_edit.png" )

			btnWithIcon3.DoClick = function() motdQuery(textbox, "Edit Text") end

			settingsMenu:AddSpacer()			-- Adds a simple line spacer

			local SubMenu = settingsMenu:AddSubMenu( "Buttons" )				-- Add a submenu
			SubMenu:AddOption( "Edit Text" ):SetIcon( "icon16/page_edit.png" )	-- SetIcon possible like this
			SubMenu:AddOption( "Edit Type" ):SetIcon( "icon16/script_edit.png" )

			settingsMenu:Open()

			end
		end */

// ============================================================================= Scroll Bar Shit ============================================================================================ //
	local scrollPanel = vgui.Create("DPanel",motdFrame)
		scrollPanel:Dock(LEFT)
		scrollPanel:SetSize(motdFrame:GetWide() / 4, 1)
		scrollPanel:DockMargin(5,0,3,5)
		scrollPanel.Paint = function(w,h)
			draw.RoundedBox( 0, 0, 0, scrollPanel:GetWide(), scrollPanel:GetTall(), Color( 0, 0, 0, 120) )
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, scrollPanel:GetWide(),  scrollPanel:GetTall() )
		end

		local contentBox = vgui.Create("DPanel",motdFrame)
		contentBox:Dock(FILL)
		contentBox:SetSize(motdFrame:GetWide() / 4, 1)
		contentBox:DockMargin(5,3,3,5)
		contentBox.Paint = function(w,h)
			draw.RoundedBox( 0, 0, 0, contentBox:GetWide(), contentBox:GetTall(), Color( 0, 0, 0, 120) )
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, contentBox:GetWide(),  contentBox:GetTall() )
		end

		local ContentText = vgui.Create("DLabel", contentBox)
			ContentText:SetPos(4,4)
			ContentText:SetTextColor(Color(255,255,255))
			ContentText:SetText(blurMotd.News)
			ContentText:SizeToContents()


		local HtmlFrame = vgui.Create( "DHTML", contentBox )
			HtmlFrame:SetPos( 10, 10)
			HtmlFrame:SetSize( contentBox:GetWide(), contentBox:GetTall() )
			HtmlFrame:Dock(FILL)

	local buttonScrollPanel = vgui.Create( "DScrollPanel", scrollPanel )
		buttonScrollPanel:Dock(FILL)
		buttonScrollPanel:SetSize( motdFrame:GetTall(), 250 )

		local sbar = buttonScrollPanel:GetVBar()
			function sbar:Paint( w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 120 ) )
			end
			function sbar.btnUp:Paint( w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 120 ) )
			end

			function sbar.btnDown:Paint( w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color(  0, 0, 0, 120 ) )
			end

			function sbar.btnGrip:Paint( w, h )
				draw.RoundedBox( 0, 0, 0, w, h, scrollGripColor )
				surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
				surface.DrawOutlinedRect( 0, 0, w,  h )
			end

			function sbar.btnGrip:OnCursorEntered( )
				scrollGripColor = blurMotd.white
			end

			function sbar.btnGrip:OnCursorExited() 
				scrollGripColor = blurMotd.black
			end
		
		for k, v in pairs (blurMotd.Buttons) do
			local Button = vgui.Create("DButton", buttonScrollPanel)
				--Button:SetPos(0, (k-1) * motdFrame:GetTall() / 8)
				Button:Dock(TOP)
				Button:DockMargin(0,1,1,0)
				Button:SetSize(scrollPanel:GetWide() -20, buttonScrollPanel:GetTall() / 2.8)
				Button:SetText(v.title)
				Button:SetTextColor(Color(255,255,255))
				
				local hoverColor3 = blurMotd.black // this work around worked for some fucking reason
			Button.Paint = function(self)
				draw.RoundedBox( 0, 0, 0, Button:GetWide(), Button:GetTall(), hoverColor3 )
				surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
				surface.DrawOutlinedRect( 0, 0, Button:GetWide(),  Button:GetTall() )
			end 

			Button.OnCursorEntered = function()
				--surface.PlaySound(iced_motd.HoverSound)
				hoverColor3 = blurMotd.white
			end
			
			 Button.OnCursorExited = function()
				hoverColor3 = blurMotd.black
			end

				Button.DoClick = function()
					if v.type == "url" then
						ContentText:SetPos(2,2)
						ContentText:SetWide(contentBox:GetWide() - 5)
						ContentText:Clear()
						ContentText:SetText("Loading......")
						ContentText:SizeToContents()
						HtmlFrame:OpenURL( v.outcome ) 
						HtmlFrame:SetVisible(true)
					elseif v.type == "text" then
						ContentText:SetPos(4, 4)
						ContentText:Clear()
						ContentText:SetText(v.outcome)
						--ContentText:SetWrap(true)
						ContentText:SetWide(contentBox:GetWide() - 5)
						ContentText:SizeToContents()
						HtmlFrame:SetVisible(false)
					end
				end
		end
		


// ============================================================================= Content Box ============================================================================================ //







end

net.Receive("OpenMotd", function (len, ply )
	if LocalPlayer():IsValid() then 
		LocalPlayer():ConCommand("motd")
	end
end)

concommand.Add("motd", drawmotdFrame)