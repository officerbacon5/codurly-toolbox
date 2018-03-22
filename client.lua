-- Menu 0 = Main Menu 1 = Emotes 2 = LEO Toolbox 3 = civ toolbox 4 = Vehicle Menu
mainMenu = {"Emotes", "LEO Toolbox", "Civ Toolbox","Vehicle"}
emotesMenu = {"Cop", "Smoke", "Party", "Film", "Camera", "Clipboard", "Notes", "Traffic","Back"}
leoMenu = {"Toggle Cuff", "Grab","Breathalyze","Equip Loadout", "Toggle Carbine","Toggle Shotgun","Radar","Back"}
civMenu = {"Drop Weapon","Set BAC","Crouch","Ad","Back"}
vehicleMenu = {"Doors", "Trunk", "Engine", "Roll Windows","Back"}
doorsMenu = { "Front Right", "Front Left", "Rear right", "Rear Left", "Back"}
adMenu = { "Fleeca", "Maze", "Ammunation", "LSCustoms", "Pegasus", "Taxi", "Weazel", "Casey", "247", "Back"}
menu = false
currentMenu = 0


Citizen.CreateThread(function()


while true do

  DisableControlAction(22, 135, true)
  boolie = GetLastInputMethod(2)

  if (IsControlJustReleased(0, 244)) and boolie then
    --Citizen.Trace("Clicked")
    menu = not menu
    currentMenu = 0
  end
  Wait(0)

  if menu then

    local ply = GetPlayerPed(-1)

    i=1
    y = 0.426

    Cursor(1)
    DisableControlAction(0, 1, active) -- LookLeftRight
    DisableControlAction(0, 2, active) -- LookUpDown
    DisableControlAction(0, 24, active) -- Attack
    DisablePlayerFiring(ply, true) -- Disable weapon firing
    DisableControlAction(0, 142, active) -- MeleeAttackAlternate
    DisableControlAction(0, 106, active) -- VehicleMouseControlOverride

    if currentMenu == 0 then

      for i = 1, #mainMenu, 1 do

        DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
        DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, mainMenu[i], 0, 0, 0, 196, 4, 0)


        isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
        if callback == true then
          if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

            currentMenu = i
            --TriggerEvent("chatMessage", "[DOJ  LOGIN]", {255, 255, 255}, "Box "..i.." clicked")
          end
        end
        end)

        y = y + 0.05

      end

    end

    if currentMenu == 1 then

      for i = 1, #emotesMenu, 1 do

        DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
        DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, emotesMenu[i], 0, 0, 0, 196, 4, 0)


        isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
        if callback == true then
          if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

            if emotesMenu[i] == "Back" then
              currentMenu = 0
            end

            TriggerEvent("play", string.lower(emotesMenu[i]))
          end
        end
        end)

        y = y + 0.05

      end

    end

    if currentMenu == 2 then

      for i = 1, #leoMenu, 1 do

        DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
        DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, leoMenu[i], 0, 0, 0, 196, 4, 0)


        isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
        if callback == true then
          if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

            if leoMenu[1] == leoMenu[i] then
              TriggerEvent("cuff")
            elseif leoMenu[2] == leoMenu[i] then
              TriggerEvent("grabNear")
            elseif leoMenu[3] == leoMenu[i] then
              TriggerEvent("breathNearby")
            elseif leoMenu[4] == leoMenu[i] then
              TriggerEvent("equipPistol")
            elseif leoMenu[5] == leoMenu[i] then
              TriggerEvent("equipCarbine")
            elseif leoMenu[6] == leoMenu[i] then
              TriggerEvent("equipShotgun")
			elseif leoMenu[7] == leoMenu[i] then
              TriggerEvent("toggleMenu")
            elseif leoMenu[i] == "Back" then
              currentMenu = 0

            end

          end
        end
        end)

		 y = y + 0.05
	
		end
	end

	
	  if currentMenu == 3 then

          for i = 1, #civMenu, 1 do

            DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
            DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, civMenu[i], 0, 0, 0, 196, 4, 0)


            isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
            if callback == true then
              if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

				if civMenu[1] == civMenu[i] then
                  TriggerEvent("dropGun")
				elseif civMenu[2] == civMenu[i] then
				  getText(4, function(callback)
						
						TriggerServerEvent("setBac", callback)
						
				  
				  end)
				elseif civMenu[3] == civMenu[i] then
                  TriggerEvent("playerCrouch")
				elseif civMenu[4] == civMenu[i] then
                 currentMenu = "ads"
                elseif civMenu[i] == "Back" then
                  currentMenu = 0

                end

              end
            end
            end)

            y = y + 0.05

          end

        end
	
	
	
        if currentMenu == 4 then

          for i = 1, #vehicleMenu, 1 do

            DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
            DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, vehicleMenu[i], 0, 0, 0, 196, 4, 0)


            isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
            if callback == true then
              if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

                if vehicleMenu[1] == vehicleMenu[i] then
                 -- TriggerEvent("cuff")
					currentMenu = doors
				elseif vehicleMenu[2] == vehicleMenu[i] then
					TriggerEvent("openDoor", "trunk")
				elseif vehicleMenu[3] == vehicleMenu[i] then
					TriggerEvent("Engine")
				elseif vehicleMenu[4] == vehicleMenu[i] then
					TriggerEvent("Windows")
                elseif vehicleMenu[i] == "Back" then
                  currentMenu = 0

                end

              end
            end
            end)

            y = y + 0.05

          end

        end

		if currentMenu == doors then

          for i = 1, #doorsMenu, 1 do

            DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
            DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, doorsMenu[i], 0, 0, 0, 196, 4, 0)


            isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
            if callback == true then
              if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

                if doorsMenu[1] == doorsMenu[i] then
					TriggerEvent("openDoor", "rfront")
				elseif doorsMenu[2] == doorsMenu[i] then
					TriggerEvent("openDoor", "lfront")
				elseif doorsMenu[3] == doorsMenu[i] then
					TriggerEvent("openDoor", "rrear")
				elseif doorsMenu[4] == doorsMenu[i] then
					TriggerEvent("openDoor", "lrear")
                elseif doorsMenu[i] == "Back" then
                  currentMenu = 4

                end

              end
            end
            end)

            y = y + 0.05

          end

        end

      else
        Cursor(0)


      end
	  
	    if currentMenu == "ads" then

          for i = 1, #adMenu, 1 do

            DrawRect(0.277, y, 0.0489, 0.0439, 210, 211, 211, 228)
            DrawAdvancedText(0.372, y + 0.005, 0.005, 0.0028, 0.34, adMenu[i], 0, 0, 0, 196, 4, 0)


            isCursorInZone(0.252, y - 0.0174, 0.300, y + 0.0174, y, function(callback)
            if callback == true then
              if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

                if adMenu[i] == "Back" then
                  currentMenu = 3

				elseif adMenu[i] ~= "Back" then
					
					 TriggerEvent("doj:ad:composeAd", string.lower(adMenu[i]))
				
                end

              end
            end
            end)

            y = y + 0.05

          end

        end
		
    end
    end)

    function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
      SetTextFont(font)
      SetTextProportional(0)
      SetTextScale(sc, sc)
      N_0x4e096588b13ffeca(jus)
      SetTextColour(r, g, b, a)
      --SetTextDropShadow(0, 0, 0, 0,255)
      SetTextEdge(1, 0, 0, 0, 255)
      -- SetTextDropShadow()
      -- SetTextOutline()
      SetTextEntry("STRING")
      AddTextComponentString(text)
      DrawText(x - 0.1+w, y - 0.02+h)
    end

    function isCursorInZone(x1, y1, x2, y2, drawx, callBack)
      if CursorInZone(x1, y1, x2, y2) then

        DrawRect(0.277, drawx, 0.0489999999999999, 0.0439999999999999, 250, 251, 251, 228)
        callBack(true)


      end
    end

    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

      -- TriggerEvent("chatMessage", "[DOJ  LOGIN]", {255, 255, 255}, "Box clicked")
      return true
    end
	
function getText(maxChars, callback)
    DisplayOnscreenKeyboard(false, "", "", "", "", "", "", maxChars)
    inputText = ""
    input = true
    textdone = false
    Citizen.CreateThread(function()
        while input do
            Citizen.Wait(0)
            HideHudAndRadarThisFrame()
            if (UpdateOnscreenKeyboard() == 3) then
                if (textdone) then
                    input = false
                    break
                end
            elseif (UpdateOnscreenKeyboard() == 1) then
                inputText = GetOnscreenKeyboardResult()
                if (string.len(inputText) > 0) then
                    input = false
                    textdone = true
                    callback(inputText)
                    break
                else
                    DisplayOnscreenKeyboard(false, "", "", inputText, "", "", "", maxChars)
                end
            elseif (UpdateOnscreenKeyboard() == 2) then
                if (textdone) then
                    input = false
                    callback("none")
                    break
                end
            end
        end
    end)
end