local close = Material( "icon16/cancel.png")
local motd = Material( "icon16/door_in.png")


local hoverColor  = blurMotd.black
local hoverColor2 = blurMotd.black
local hoverColor3 = blurMotd.black

function blurMotdSettingsPanel ()

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


	local settingsFrame  = vgui.Create("DFrame")
		settingsFrame:SetSize(ScrW() / 2, ScrH() / 1.5)	
		settingsFrame:SetPos(0,0)
		settingsFrame:Center()
		settingsFrame:MakePopup()
		settingsFrame:SetDraggable(false)
		settingsFrame:SetTitle("Settings")
		settingsFrame:ShowCloseButton(false)
    		settingsFrame.Paint = function( self, w, h )
			DrawBlur(self, 3)
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
			surface.SetDrawColor( Color( 0, 0, 0, 100 ) )
			surface.DrawOutlinedRect( 0, 0, w, h )
		end


	local buttonsPanel = vgui.Create("DPanel",settingsFrame)
		buttonsPanel:SetSize(settingsFrame:GetWide()  /2, settingsFrame:GetTall() / 8)
		buttonsPanel:Dock(BOTTOM)
		buttonsPanel:DockMargin(4,4,4,4)
		buttonsPanel.Paint = function ( )
		
		end

			local extraButton = vgui.Create("DButton", buttonsPanel)
		extraButton:SetSize(settingsFrame:GetWide()  / 2, settingsFrame:GetTall() / 8)
		extraButton:Dock(LEFT)
		extraButton:DockMargin(0,0,0,0)
		extraButton:SetTextColor(Color(255,255,255))
		extraButton:SetText("Return")
		extraButton.Paint = function (self)	
			draw.RoundedBox( 0, 0, 0, extraButton:GetWide(), extraButton:GetTall(), hoverColor3)
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, extraButton:GetWide(),  extraButton:GetTall() )
			surface.SetDrawColor( Color( 255, 255, 255  ) )
				surface.SetMaterial(motd)
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
			settingsFrame:AlphaTo( 0, 0.5, 0,  function () settingsFrame:Close() end ) 
			LocalPlayer():ConCommand("motd")
		end

	local closeButton = vgui.Create("DButton", buttonsPanel)
		closeButton:SetSize(settingsFrame:GetWide()  /2.1, settingsFrame:GetTall() / 8)
		closeButton:Dock(LEFT)
		closeButton:DockMargin(5,0,0,0)
		closeButton:SetText("Close")
		
		closeButton:SetTextColor(Color(255,255,255))			
		closeButton.Paint = function (self)	
			draw.RoundedBox( 0, 0, 0, closeButton:GetWide(), closeButton:GetTall(), hoverColor)
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, closeButton:GetWide(),  closeButton:GetTall() )
			surface.SetDrawColor( Color( 255, 255, 255  ) )
				surface.SetMaterial(close)
				surface.DrawTexturedRect(5,5,16,16)
				
			
		end

		closeButton.OnCursorEntered = function ()
			surface.PlaySound("ui/buttonrollover.wav")
			hoverColor = blurMotd.blue		
		end

		closeButton.OnCursorExited = function ()
			hoverColor = blurMotd.black
		end
	
	
		closeButton.DoClick = function(self)
			--chat.AddText( Color( 46, 204, 113 ), LocalPlayer(), " Accepted The Rules.")
			--chat.PlaySound()
			settingsFrame:AlphaTo( 0, blurMotd.FadeTime, 0,  function () settingsFrame:Close() end ) 		
		end

		local settingsBox = vgui.Create("DPanel",settingsFrame)
		settingsBox:Dock(FILL)
		settingsBox:SetSize(settingsFrame:GetWide() / 4, 1)
		settingsBox:DockMargin(5,3,3,5)
		settingsBox.Paint = function(w,h)
			draw.RoundedBox( 0, 0, 0, settingsBox:GetWide(), settingsBox:GetTall(), Color( 0, 0, 0, 120) )
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, settingsBox:GetWide(),  settingsBox:GetTall() )
		end

		local TextEntry = vgui.Create( "DTextEntry", settingsBox ) -- create the form as a child of frame
		TextEntry:Dock(TOP)
		TextEntry:DockPadding(5,5,5,5)
		TextEntry:SetSize( 40, settingsBox:GetTall() / 8 )
		TextEntry:SetText( "Set Menu Title...." )
		TextEntry.OnEnter = function( self )
			chat.AddText( self:GetValue() )	-- print the form's text as server text
		end
		TextEntry:SetDrawBackground(false)
		TextEntry:SetTextColor(Color(255,255,255))


end

concommand.Add("motdSettings", blurMotdSettingsPanel)