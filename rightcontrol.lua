function moveRight()
  
  info[file].meta.right = info[file].meta.right + 1
  
  if info[file].battle.on then
    return
  end
  
  if info[file].shop then
    return
  end
  
  if info[file].text then
    return
  end

  if not(you == nil) then
    
    replaceYou("Right")
    
    local thisSpace = currentMap[info[file].posx][info[file].posy]
    
    if info[file].posx < text[info[file].map.id][info[file].map.subid][0].lenx and
    not (currentMap[info[file].posx + 1][info[file].posy] == "Void") then
      
      local specialMove = true
      
      local nextSpace = currentMap[info[file].posx + 1][info[file].posy] -- not at edge, then make variable
      
      if info[file].map.name == "Cave" then
        
        --[[if (info[file].map.subname == "Spawn Path")
        and (info[file].meta.right % 20 == 0) then
          
          startBattle(info[file].battle.you.hp, info[file].battle.you.endur, info[file].battle.you.hit, 
            "Golem", 30, 5, 5, 1.01, 15, 2)
          
        else]]--
        if info[file].map.subname == "Spawn Path" and info[file].posx == 20 and info[file].posy == 8 and info[file].interactibles[1][1][1].posx == 21 then -- collided with old man
          return
        
        elseif info[file].prog.cave.tutorial then
      
          if nextSpace == "Push Rock" then -- cannot go through rock
            oneText("Capstone Tiles/Cave - Push Rock.png", "A seemingly immovable rock. What would happen if an unstoppable force hits it?")
          elseif nextSpace == "Monster" then -- cannot go through monster
            oneText("Capstone Tiles/Cave - Monster.png", "You sighed. Those stationary monsters seem to be a ploy to lead you to a linear gameplay path.")
          elseif nextSpace == "Rolling Rock" then -- cannot go through rolling rock
            oneText("Capstone Tiles/Cave - Rolling Rock.png", "Try pushing the rock by 'acting' on it!")
          elseif nextSpace == "Small Rock" then
            oneText("Capstone Tiles/Cave - Small Rock.png", "The rock blocks the way. Intriguingly, you are unable to walk around it.")
          else
            specialMove = false
          end
          
        else
          
          if nextSpace == "Hole" then
            
            if not(currentMap[info[file].posx + 2] == nil) then
              local afterHole = currentMap[info[file].posx + 2][info[file].posy]
            end
            
            if currentMap[info[file].posx + 2] == nil -- edge of map
            or afterHole == "Void"
            or afterHole == "Hole"
            or afterHole == "Push Rock"
            or afterHole == "Pull Rock"
            or afterHole == "Fake Pull Rock"
            or afterHole == "Stacked Rock" then
              return
              
            else
              replaceYou("Right")
              you.x = you.x + 60
              info[file].posx = info[file].posx + 2
            end
            
          elseif thisSpace == "Ladder"
          and nextSpace == "Way Right" then
            
            info[file].prog.cave.secondfloor = false
      
            makeMap()
            updateMap()
            
            specialMove = false
            
          elseif nextSpace == "Push Rock"
          or nextSpace == "Pull Rock"
          or nextSpace == "Fake Pull Rock"
          or nextSpace == "Stacked Rock"
          or nextSpace == "Second Floor Rock"
          or nextSpace == "Monster" then
            return
          else
            specialMove = false
          end
          
        end
          
      elseif info[file].map.name == "Town" then
        
        if collidedWithNPCRight() then
          return
          
        elseif nextSpace == "Shop 1"
        or nextSpace == "Shop 4"
        or nextSpace == "Compass 1"
        or nextSpace == "Compass 4"
        or nextSpace == "Compass 7"
        or nextSpace == "Bar 1"
        or nextSpace == "Bar 3" 
        
        or nextSpace == "Old Shop 1"
        or nextSpace == "Old Shop 4"
        or nextSpace == "Old Compass 1"
        or nextSpace == "Old Compass 4"
        or nextSpace == "Old Compass 7"
        or nextSpace == "Old Bar 1"
        or nextSpace == "Old Bar 3"
        or nextSpace == "Rubble" 
        
        or nextSpace == "Warp Void"
        or nextSpace == "Warp Post"
        
        or nextSpace == "Bar Void"
        or nextSpace == "Bar Chair"
        or nextSpace == "Bar Table"
        or nextSpace == "Bar Counter"
        or nextSpace == "Bar Counter 2"
        then
          return
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Plains" then
        
        if nextSpace == "Fence Up"
        or nextSpace == "Fence Left"
        or nextSpace == "Fence Down"
        or nextSpace == "Fence Right"
        or nextSpace == "Item"
        or nextSpace == "Post"
        or nextSpace == "Temple 1" 
        or nextSpace == "Temple 4"
        or nextSpace == "Temple 7" then
          return
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Temple" then
        
        local m = text[info[file].map.id][info[file].map.subid][info[file].posy]:sub(info[file].posx, info[file].posx)
          
        if m == "D" or m == "G" or m == "I" or m == "J" or m == "L" or m == "M" or m == "P" or m == "Q" then
          
          templeWallRight()
          
        elseif nextSpace == "Ladder" then
          
          if info[file].map.subname == "First Floor" then
            redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 5, 5, 5, "Right")
          elseif info[file].map.subname == "Second Floor" then
            redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 5, 5, 5, "Right")
          end
          
        elseif info[file].map.subname == "Second Floor" then 
          
          if collidedWithInteractiblesRight("Lock") then
            return
            
          else
            specialMove = false
          end
            
        elseif info[file].map.subname == "Boss Room" then
          
          if collidedWithNPCRight() then
            return
        
          elseif nextSpace == "Book"
          or nextSpace == "Item"
          or nextSpace == "Item 2" then
            return
          end
          
          specialMove = false
        
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Volcano" then
        
        if collidedWithInteractiblesRight("Lock") then
          return

        elseif nextSpace == "Wall" 
        or nextSpace == "Wall 2"
        or nextSpace == "Way Out Up"
        or nextSpace == "Way Out Down"
        or nextSpace == "Left"
        or nextSpace == "Rock"
        or nextSpace == "Lava" then
          return
          
        elseif thisSpace == "Crack" then
          currentMap[info[file].posx][info[file].posy] = "Lava"
          updateMap()
          specialMove = false
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Desert" then
        
        if collidedWithLaser() then
          return
        
        elseif collidedWithInteractiblesRight("Statue") then
          return
      
        elseif thisSpace == "Left"
        or nextSpace == "Left"
        or nextSpace == "Fence Corner" 
        or nextSpace == "Fence End"
        or nextSpace == "Fence Right"
        or nextSpace == "Fence Up"
        or nextSpace == "Switch"
        or nextSpace == "Water"
        or nextSpace == "Post"
        or nextSpace == "Dessert" then
          return
          
        else
          changeLaserLeftRight()
          updateMap()
          
          specialMove = false
        end
      
      elseif info[file].map.name == "Metropolis" then
      
        if info[file].map.subname == "Main Area" then
          
          specialMove = false
        
        elseif info[file].map.subname == "Sewers" then
          
          if nextSpace == "Push Rock" then
            return
          
          else
            specialMove = false
          end
          
        end
      
      elseif info[file].map.name == "Snow" then
      
        if info[file].prog.alp.dir == "" then

          if nextSpace == "Rock"
          or nextSpace == "Wall" 
          or nextSpace == "Way Out Up"
          or nextSpace == "Way Out Down"
          or nextSpace == "Hole" then
            return
            
          elseif nextSpace == "Ice" then
            
            snowSlipRight()
            specialMove = false
            
          elseif nextSpace == "Snowball" then
            
            snowMoveBallRight()
            
          else
            specialMove = false
          end
        
        elseif info[file].prog.alp.dir == "Right" then
          
          snowUnslipRight()
          specialMove = false
          
        end
        
      elseif info[file].map.name == "Ruins" then
        
        if info[file].prog.ruins.dir == "" then
        
          if thisSpace == "Left" 
          or thisSpace == "Up"
          or thisSpace == "Down"
          or thisSpace == "Very Left" 
          or thisSpace == "Very Up"
          or thisSpace == "Very Down" then
            return
            
          elseif thisSpace == "Very Right" then
            
            ruinsSlipRight()
            specialMove = false
            
          elseif nextSpace == "Left" 
          or nextSpace == "Rock"
          or nextSpace == "Post"
          or nextSpace == "Special Stair"
          or nextSpace == "Switch"
          or nextSpace == "Track" then
            return
            
          elseif nextSpace == "Hole" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx + 1, info[file].posy, 5, 5, "Right")
            
          elseif nextSpace == "Stair Up" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) + 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid + 2, info[file].posx + 1, info[file].posy, 5, 5, "Right")
            
          elseif nextSpace == "Stair Down" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx + 1, info[file].posy, 5, 5, "Right")
            
          else
            specialMove = false
          end
          
        elseif info[file].prog.ruins.dir == "Right" then
          
          ruinsUnslip()
          specialMove = false
          
        end
        
      elseif info[file].map.name == "Void" then
        
        if info[file].map.subname == "Cave Room" then
          
          if nextSpace == "Spawn"
          or nextSpace == "Stacked Rock"
          or nextSpace == "Stair Down" then
            return
            
          else
            specialMove = false
          end
          
        elseif info[file].map.subname == "Plains Room" then
          
          local m = text[info[file].map.id][info[file].map.subid][info[file].posy + 9]:sub(info[file].posx, info[file].posx)
            
          if m == "D" or m == "G" or m == "I" or m == "J" or m == "L" or m == "M" or m == "P" or m == "Q" then
            return
            
          else
            specialMove = false
          end
          
        elseif info[file].map.subname == "Volcano Room" then
          
          if nextSpace == "Crack" 
          or nextSpace == "Lava" then
            return
            
          elseif thisSpace == "Cave"
          or thisSpace == "Climb" 
          or thisSpace == "Ledge"
          or thisSpace == "Stair"
          or thisSpace == "Wall 2" then
            
            currentMap[info[file].posx][info[file].posy] = "Lava"
            updateMap()
            specialMove = false
            
          else 
            specialMove = false
          end
        
        elseif info[file].map.subname == "Alp Room" then
          
          if info[file].prog.void.snowdir == "" then

            if nextSpace == "Ledge" then
              return
              
            elseif nextSpace == "Bridge"
            or nextSpace == "Cave"
            or nextSpace == "Climb"
            or nextSpace == "Wall"
            or nextSpace == "Way Out Down" then
              
              voidSnowSlipRight()
              specialMove = false
              
            else
              specialMove = false
            end
          
          elseif info[file].prog.void.snowdir == "Right" then

            voidSnowUnslipRight()
            specialMove = false

          end
        
        elseif info[file].map.subname == "Ruins Room" then
        
          if info[file].prog.void.ruinsdir == "" then
        
            if thisSpace == "Down" 
            or thisSpace == "Right"
            or thisSpace == "Up"
            or thisSpace == "Very Down" 
            or thisSpace == "Very Right"
            or thisSpace == "Very Up" then
              return
              
            elseif thisSpace == "Very Left" then
              
              voidRuinsSlipRight()
              specialMove = false

            else
              specialMove = false
            end
          
          elseif info[file].prog.void.ruinsdir == "Right" then
          
            voidRuinsUnslip()
            specialMove = false
          
          end
        
        elseif info[file].map.subname == "Temple Room" then
        
          if (not(thisSpace == "Book"
          or thisSpace == "Item"
          or thisSpace == "Item 2"
          or thisSpace == "Ladder"
          or thisSpace == "1"
          or thisSpace == "3")-- in a warp zone
          and not info[file].prog.void.templestep) -- and can't step forward
          or nextSpace == "Post" then -- or next step is a wall
            return
            
          else
            info[file].prog.void.templestep = false -- can't step forward in a warp zone
            specialMove = false
          end
        
        elseif info[file].map.subname == "Void Room" then
        
          if nextSpace == "Rock" 
          or nextSpace == "Left"
          or nextSpace == "Lava"
          or thisSpace == "Up"
          or thisSpace == "Left"
          or thisSpace == "Down" 
          or thisSpace == "Very Up"
          or thisSpace == "Very Left"
          or (thisSpace == "Warp A" and not info[file].prog.void.templestep)
          or (thisSpace == "Warp B" and not info[file].prog.void.templestep)
          or (thisSpace == "Warp C" and not info[file].prog.void.templestep) then
            return
          end
          
          info[file].prog.void.templestep = false
          
          if thisSpace == "Crack" then
            currentMap[info[file].posx][info[file].posy] = "Lava"
            addLava()
            updateMap()
            specialMove = false
          end
          
          if nextSpace == "Ice" then
            
            voidFuncIceRight()
            
          else
            specialMove = false
          end
        
        elseif info[file].map.subname == "Boss Room" then
          
          if nextSpace == "Rock" then
            return
            
          else
            specialMove = false
          end
        
        end
        
      end
      
      if not specialMove then
      
        if info[file].posx + 5 < text[info[file].map.id][info[file].map.subid][0].lenx + 1 and info[file].posx == info[file].centerx then
          info[file].centerx = info[file].centerx + 1
          updateMap()
          replaceYou("Right") -- move NPC to front
        else
          you.x = you.x + 30
        end
        info[file].posx = info[file].posx + 1
    
      end
    
    elseif info[file].posx == text[info[file].map.id][info[file].map.subid][0].lenx then
    
      if info[file].map.name == "Cave" then
        
        if info[file].map.subname == "Spawn Path" then
          redoMap("Metropolis", "Metropolitan City", "Sewers", 7, 2, 1, info[file].posy + 5, 5, 5, "Right")
          info[file].cave = makeCaveMap() -- reset map
        end
        
      elseif info[file].map.name == "Town" then
        
        if info[file].map.subname == "Town Square" then
          if info[file].posy == 5 then
            redoMap("Plains", "Steppe Plains", "Steppe Path", 3, 2, 1, 6, 5, 5, "Right")
          end
        end
        
      elseif info[file].map.name == "Plains" then
        
      elseif info[file].map.name == "Temple" then
        
        if info[file].map.subname == "First Floor" then 
          if info[file].prog.temple == 2 then
            redoMap("Temple", "Fane Temple", "Room 3", 4, 4, 1, 5, 5, 5, "Right")
          end
        elseif info[file].map.subname == "Second Floor" then
          redoMap("Temple", "Fane Temple", "Room 8", 4, 10, 1, 5, 5, 5, "Right")
        elseif info[file].map.subname == "Room 2" then
          redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 1, 5, 5, 5, "Right")
        elseif info[file].map.subname == "Room 7" and info[file].posy == 5 then
          redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 1, 5, 5, 5, "Right")
        end
        
      elseif info[file].map.name == "Volcano" then
        
        if info[file].map.subname == "Master Cave" then 
          redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 39, 11, 39, 11, "Down")
        end
        
      elseif info[file].map.name == "Desert" then
        
        if update then
          finishGame()
        else
          redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 1, 5, 5, 5, "Right")
        end
        
      elseif info[file].map.name == "Metropolis" then
        
        if info[file].posx == 31 and info[file].posy == 20 then
          redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 1, 6, 5, 6, "Right")
        end
        
      elseif info[file].map.name == "Snow" then
        
        if info[file].map.subname == "Master Cave" then 
          redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 44, 11, 44, 11, "Down")
        end
        
      elseif info[file].map.name == "Ruins" then
        
        if info[file].map.subname == "Boss Room" then 
          if update then
            finishGame()
          else
            redoMap("Void", "Void", "Plains Room", 10, 2, 7, 9, 5, 5, "Up") -- skip metro 
          end
        end
        
      end
    end
  end
end