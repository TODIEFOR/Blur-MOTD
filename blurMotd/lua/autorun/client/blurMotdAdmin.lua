local hoverColor  = blurMotd.black

function serverHopFrame ()


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

local motdHop  = vgui.Create("DFrame")
		motdHop:SetSize(ScrW() / 2, ScrH() / 3)	
		motdHop:SetPos(0,0)
		motdHop:Center()
		--motdHop:MakePopup()
		motdHop:SetDraggable(false)
		motdHop:SetTitle("Server Hop")
		motdHop:ShowCloseButton(false)
    		motdHop.Paint = function( self, w, h )
			DrawBlur(self, 3)
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 120 ) )
			surface.SetDrawColor( Color( 0, 0, 0, 100 ) )
			surface.DrawOutlinedRect( 0, 0, w, h )
		end
		motdHop:AlphaTo(  255, 1, 0,  function () 
			motdHop:MakePopup()
		 end ) 

		local serverJump = vgui.Create("DButton", motdHop)
		serverJump:SetSize(motdHop:GetWide()  / 3, motdHop:GetTall() / 8)
		serverJump:Dock(BOTTOM)
		serverJump:DockMargin(4,4,4,4)
		serverJump:SetText("Close")
		
		
		serverJump:SetTextColor(Color(255,255,255))			
		serverJump.Paint = function (self)
			
			draw.RoundedBox( 0, 0, 0, serverJump:GetWide(), serverJump:GetTall(), hoverColor)
			surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
			surface.DrawOutlinedRect( 0, 0, serverJump:GetWide(),  serverJump:GetTall() )

		end

		serverJump.OnCursorEntered = function ()
				surface.PlaySound("ui/buttonrollover.wav")
				--serverJump:SetText("Take Me There!")
				hoverColor = blurMotd.blue
				
		end

		serverJump.OnCursorExited = function ()
				hoverColor = blurMotd.black
				--serverJump:SetText("Exit Server Hop")
		end
	
	
		serverJump.DoClick = function(self)
		
					motdHop:AlphaTo( 0, 1, 0,  function () motdHop:Close() end ) 
	
		end


		local hoverColor3 = blurMotd.black
		for k, v in pairs (blurMotd.Servers) do


			local serverPanel = vgui.Create("DPanel", motdHop)
				serverPanel:SetPos(0, (k-1) * motdHop:GetTall() / 8)
				serverPanel:Dock(TOP)
				serverPanel:DockMargin(5,5,5,5)
				serverPanel:SetSize(serverJump:GetWide() -20, motdHop:GetTall() / 4.5)

			serverPanel.Paint = function(self)
				draw.RoundedBox( 0, 0, 0, serverPanel:GetWide(), serverPanel:GetTall(), blurMotd.black )
				surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
				surface.DrawOutlinedRect( 0, 0, serverPanel:GetWide(),  serverPanel:GetTall() )
			end 

			//===============

			local server = vgui.Create("DButton", serverPanel)
				server:SetPos(0, (k-1) * motdHop:GetTall() / 8)
				server:Dock(RIGHT)
				server:DockMargin(0,0,0,0)
				server:SetSize(serverPanel:GetWide() / 3, serverPanel:GetTall() )
				server:SetText("Select")
				server:SetTextColor(Color(255,255,255))
				
				local hoverColor3 = blurMotd.black // this work around worked for some fucking reason
			server.Paint = function(self)
				draw.RoundedBox( 0, 0, 0, server:GetWide(), server:GetTall(), hoverColor3 )
				surface.SetDrawColor( Color( 0, 0, 0, 170 ) )
				surface.DrawOutlinedRect( 0, 0, server:GetWide(),  server:GetTall() )
			end 

			server.OnCursorEntered = function()
				--surface.PlaySound(iced_motd.HoverSound)
				hoverColor3 = blurMotd.white
			end
			
			 server.OnCursorExited = function()
			
				hoverColor3 = blurMotd.black
			end

			server.DoClick = function(self)

				if LocalPlayer() and IsValid( LocalPlayer() ) then LocalPlayer():ConCommand( 'connect ' .. v.ip .. "" )
		
					chat.AddText( Color( 46, 204, 113 ), LocalPlayer(), " Has Switched Server" )
					chat.PlaySound()

				else
					ErrorNoHalt( "Server Hop has encountered an error...." )
					chat.AddText( Color( 46, 204, 113 ), "Whoops! There seems to be an error with a Server in Server Hop...." )

				end
			end

			local serverName = vgui.Create("DLabel", serverPanel)
			serverName:SetText(v.gamemode)
			serverName:SetTextColor(Color(255,255,255))
			serverName:SizeToContents()
			serverName:Dock(LEFT)
			serverName:DockMargin(10 ,10,10,10)

			local serverDesc = vgui.Create("DLabel", serverPanel)
			serverDesc:SetText(v.description)
			serverDesc:SetTextColor(Color(255,255,255))
			serverDesc:SizeToContents()
			serverDesc:Dock(RIGHT)
			serverDesc:DockMargin(10,10,10,10)
		

		end

end

concommand.Add("hop", serverHopFrame)