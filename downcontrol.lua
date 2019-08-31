function moveDown()
  
  info[file].meta.down = info[file].meta.down + 1
  
  if info[file].battle.on then
    return
  end
  
  if info[file].shop then
    return
  end
  
  if info[file].text then
    info[file].textchoose = false
    textPathDown()
    return
  end
  
  if not(you == nil) then
    
    replaceYou("Down")
    
    local thisSpace = currentMap[info[file].posx][info[file].posy]
    
    if info[file].posy < text[info[file].map.id][info[file].map.subid][0].leny and
    not (currentMap[info[file].posx][info[file].posy + 1] == "Void")then
      
      local specialMove = true
      
      local nextSpace = currentMap[info[file].posx][info[file].posy + 1]
      
      if info[file].map.name == "Cave" then
        
        --[[if (info[file].map.subname == "Spawn Path")
        and (info[file].meta.down % 20 == 0) then
          
          startBattle(info[file].battle.you.hp, info[file].battle.you.endur, info[file].battle.you.hit, 
            "Golem", 30, 5, 5, 1.01, 15, 2)
        
        else]]--
        if info[file].map.subname == "Spawn Path" and info[file].posx == 21 and info[file].posy == 7 and info[file].interactibles[1][1][1].posx == 21 then -- collided with old man
          return
        
        elseif info[file].prog.cave.tutorial then
        
          if nextSpace == "Horizontal" then -- move through bridge
            replaceYou("Down")
            you.y = you.y + 60
            info[file].posy = info[file].posy + 2
          elseif thisSpace == "Horizontal" then -- cannot fall out of bridge
            oneText("Capstone Tiles/Cave - Horizontal.png", "You looked down under the bridge with an irrational fear of height.")
          elseif nextSpace == "Push Rock" then -- cannot go through rock
            oneText("Capstone Tiles/Cave - Push Rock.png", "A seemingly immovable rock. What would happen if an unstoppable force hits it?")
          elseif nextSpace == "Monster" then -- cannot go through monster
            oneText("Capstone Tiles/Cave - Monster.png", "You sighed. Those stationary monsters seem to be a ploy to lead you to a linear gameplay path.")
          elseif nextSpace == "Post" then
            oneText("Capstone Textbox/You - Normal.png", "You aren't supposed to be reading this text.")
          else
            specialMove = false
          end
          
        else
          
          if nextSpace == "Horizontal" then
            
            replaceYou("Down")
            you.y = you.y + 60
            info[file].posy = info[file].posy + 2
            
          elseif nextSpace == "Hole" then
            
            local afterHole = currentMap[info[file].posx][info[file].posy + 2]
            
            if afterHole == nil -- edge of map
            or afterHole == "Void"
            or afterHole == "Hole"
            or afterHole == "Push Rock"
            or afterHole == "Pull Rock"
            or afterHole == "Fake Pull Rock"
            or afterHole == "Stacked Rock" then
              return
            else
              replaceYou("Down")
              you.y = you.y + 60
              info[file].posy = info[file].posy + 2
            end 
            
          elseif thisSpace == "Ladder"
          and nextSpace == "Way Down" then
            
            info[file].prog.cave.secondfloor = false
      
            makeMap()
            updateMap()
            
            specialMove = false
            
          elseif thisSpace == "Horizontal" 
          or nextSpace == "Fire"
          or nextSpace == "Push Rock"
          or nextSpace == "Pull Rock"
          or nextSpace == "Fake Pull Rock"
          or nextSpace == "Stacked Rock"
          or nextSpace == "Second Floor Rock"
          or nextSpace == "Monster"
          or nextSpace == "Post"
          then
          else
            specialMove = false
          end 
          
        end
        
      elseif info[file].map.name == "Town" then
        
        if collidedWithNPCDown() then
          return
          
        elseif nextSpace == "Compass 1"
        or nextSpace == "Compass 2"
        or nextSpace == "Compass 3"
        or nextSpace == "Cave 1"
        or nextSpace == "Cave 2"
        or nextSpace == "Cave 3"
        or nextSpace == "Bar 1"
        or nextSpace == "Bar 2" 
        
        or nextSpace == "Old Compass 1"
        or nextSpace == "Old Compass 2"
        or nextSpace == "Old Compass 3"
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
        or nextSpace == "Temple 2"
        or nextSpace == "Temple 3" then
          return
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Temple" then
        
        local m = text[info[file].map.id][info[file].map.subid][info[file].posy]:sub(info[file].posx, info[file].posx)
          
        if m == "E" or m == "H" or m == "I" or m == "K" or m == "L" or m == "M" or m == "N" or m == "Q" then
          
          templeWallDown()
          
        elseif nextSpace == "Ladder" then
          
          if info[file].map.subname == "First Floor" then
            redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 5, 5, 5, "Down")
          elseif info[file].map.subname == "Second Floor" then
            redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 5, 5, 5, "Down")
          end
          
        elseif info[file].map.subname == "Second Floor" then
          
          if collidedWithInteractiblesDown("Lock") then
            return
            
          else
            specialMove = false
          end
        
        elseif info[file].map.subname == "Boss Room" then
        
          if collidedWithNPCDown() then
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
        
        if collidedWithInteractiblesDown("Lock") then
          return
        
        elseif nextSpace == "Climb" then
          if info[file].prog.volcano.climb then
            specialMove = false
          end
          
        elseif nextSpace == "Wall" 
        or nextSpace == "Wall 2"
        or nextSpace == "Way Out Up"
        or nextSpace == "Rock"
        or nextSpace == "Lava" then
          return
          
        elseif nextSpace == "Way Out Down" then
          
          volcanoCaveWarpOut()
        

        elseif thisSpace == "Crack" then
          currentMap[info[file].posx][info[file].posy] = "Lava"
          updateMap()
          specialMove = false
          
        elseif nextSpace == "Ledge" then
          replaceYou("Down")
          info[file].posy = info[file].posy + 3
          info[file].centery = info[file].centery + 3
          updateMap()
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Desert" then
        
        if collidedWithLaser() then
          return
        
        elseif collidedWithInteractiblesDown("Statue") then
          return
        
        elseif thisSpace == "Up"
        or nextSpace == "Up"
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
          changeLaserUpDown()
          updateMap()
          
          specialMove = false
        end
        
      elseif info[file].map.name == "Metropolis" then
        
        if info[file].map.subname == "Main Area" then
      
          if info[file].posx == 4 and info[file].posy == 20 then
            redoMap("Metropolis", "Metropolitan City", "Sewers", 7, 2, 8, 1, 5, 5, "Down")
          else
            specialMove = false
          end
          
        elseif info[file].map.subname == "Sewers" then
          
          if nextSpace == "Push Rock" then
            return
          
          else
            specialMove = false
          end
          
        end
      
      elseif info[file].map.name == "Snow" then
      
        if info[file].prog.alp.dir == "" then
          
          if nextSpace == "Climb" then
            if info[file].prog.alp.climb then
              specialMove = false
            end

          elseif nextSpace == "Rock"
          or nextSpace == "Wall"
          or nextSpace == "Way Out Up" then
            return
            
          elseif nextSpace == "Ice" then
            
            snowSlipDown()
            specialMove = false
            

          elseif nextSpace == "Way Out Down" then
            
            snowCaveWarpOut()
            
          elseif nextSpace == "Ledge" then
            
            replaceYou("Down")
            info[file].posy = info[file].posy + 3
            info[file].centery = info[file].centery + 3
            updateMap()
          
          else
            specialMove = false
          end
        
        elseif info[file].prog.alp.dir == "Down" then
         
          snowUnslipDown()
          specialMove = false
          
        end
      
      elseif info[file].map.name == "Ruins" then
        
        if info[file].prog.ruins.dir == "" then
        
          if thisSpace == "Left" 
          or thisSpace == "Right"
          or thisSpace == "Up"
          or thisSpace == "Very Left" 
          or thisSpace == "Very Right"
          or thisSpace == "Very Up" then
            return
            
          elseif thisSpace == "Very Down" then
            
            ruinsSlipDown()
            specialMove = false
            
          elseif nextSpace == "Up"
          or nextSpace == "Rock"
          or nextSpace == "Post"
          or nextSpace == "Switch"
          or nextSpace == "Track" then
            return
            
          elseif nextSpace == "Hole" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx, info[file].posy + 1, 5, 5, "Down")

          elseif nextSpace == "Stair Up" then
          
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) + 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid + 2, info[file].posx, info[file].posy + 1, 5, 5, "Down")
            
          elseif nextSpace == "Stair Down" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx, info[file].posy + 1, 5, 5, "Down")

          else
            specialMove = false
          end
          
        elseif info[file].prog.ruins.dir == "Down" then
          
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
            
          if m == "E" or m == "H" or m == "I" or m == "K" or m == "L" or m == "M" or m == "N" or m == "Q" then
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
              
              voidSnowSlipDown()
              specialMove = false
              
            else
              specialMove = false
            end
          
          elseif info[file].prog.void.snowdir == "Down" then
            
            voidSnowUnslipDown()
            specialMove = false
            
          end
        
        elseif info[file].map.subname == "Ruins Room" then
        
          if info[file].prog.void.ruinsdir == "" then
        
            if thisSpace == "Left" 
            or thisSpace == "Right"
            or thisSpace == "Down"
            or thisSpace == "Very Left" 
            or thisSpace == "Very Right"
            or thisSpace == "Very Down" then
              return
              
            elseif thisSpace == "Very Up" then
              
              voidRuinsSlipDown()
              specialMove = false

            else
              specialMove = false
            end
          
          elseif info[file].prog.void.ruinsdir == "Down" then
          
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
          or nextSpace == "Up"
          or nextSpace == "Lava"
          or thisSpace == "Left"
          or thisSpace == "Right"
          or thisSpace == "Up" 
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
            
            voidFuncIceDown()
            
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
      
        if info[file].posy + 5 < text[info[file].map.id][info[file].map.subid][0].leny + 1 and info[file].posy == info[file].centery then
          info[file].centery = info[file].centery + 1
          updateMap()
          replaceYou("Down") -- move NPC to front
        else
          you.y = you.y + 30
        end
        info[file].posy = info[file].posy + 1
        
      end
    
    elseif info[file].posy == text[info[file].map.id][info[file].map.subid][0].leny then
    
      if info[file].map.name == "Cave" then
        
        if thisSpace == "Stair Down" then
          
          if info[file].map.subname == "Spawn Path" then
            if info[file].posx == 4 then
              info[file].cave = makeCaveMap() -- reset map
              redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 3, 1, 5, 5, "Down")
              
            elseif info[file].posx == 21 then
              if info[file].prog.cave.trial == 1 then
                info[file].cave = makeCaveMap() -- reset map
                redoMap("Cave", "Crypt Cave", "Trial of Insight", 1, 2, 5, 1, 5, 5, "Down")
                insightTrialText()
              elseif info[file].prog.cave.trial == 2 then
                info[file].cave = makeCaveMap() -- reset map
                redoMap("Cave", "Crypt Cave", "Trial of Courage", 1, 3, 8, 1, 5, 5, "Down")
                courageTrialText()
              elseif info[file].prog.cave.trial == 3 then
                info[file].cave = makeCaveMap() -- reset map
                redoMap("Cave", "Crypt Cave", "Trial of Visage", 1, 4, 6, 1, 5, 5, "Down")
                visageTrialText()
              elseif info[file].prog.cave.trial == 4 then
                info[file].cave = makeCaveMap() -- reset map
                redoMap("Cave", "Crypt Cave", "Trial of Tenacity", 1, 5, 8, 1, 5, 5, "Down")
                tenacityTrialText()
              elseif info[file].prog.cave.trial == 0 then
                oneText("Capstone Textbox/You - Normal.png", "The path seems to be obstructed.")
              end
              
            elseif info[file].posx == 27 then
              info[file].prog.cave.tutorial = false
              redoMap("Town", "Municipality Town", "Town Square", 2, 1, 2, 9, 5, 5, "Down")
            end
            
          elseif info[file].map.subname == "Trial of Insight" then
            redoMap("Cave", "Crypt Cave", "Trial of Courage", 1, 3, 8, 1, 5, 5, "Down")
            courageTrialText()
            info[file].prog.cave.trial = 2
            
          elseif info[file].map.subname == "Trial of Courage" then
            redoMap("Cave", "Crypt Cave", "Trial of Visage", 1, 4, 6, 1, 5, 5, "Down")
            visageTrialText()
            info[file].prog.cave.trial = 3
            
          elseif info[file].map.subname == "Trial of Visage" then
            if info[file].cave[4][1][1] == "Stacked Rock"
            and info[file].cave[4][9][9] == "Stacked Rock" then
              redoMap("Cave", "Crypt Cave", "Trial of Tenacity", 1, 5, 8, 1, 5, 5, "Down")
              tenacityTrialText()
              info[file].prog.cave.trial = 4
            else
              oneText("Capstone Textbox/Old Man.png", "Stack two rocks together in two of the corners first!")
            end
          end
        end
        
      elseif info[file].map.name == "Town" then
        
        if info[file].map.subname == "Town Square"
        or info[file].map.subname == "Town Square Ruins" then
          if info[file].posx == 5 then
            redoMap("Town", info[file].map.realname, "Empty Room", 2, 3, 5, 1, 5, 5, "Down")
          end
        
        elseif info[file].map.subname == "Warp House" then
          if info[file].posx == 5
          and not (info[file].map.subid == 16)
          and not (info[file].map.subid == 18) then
            info[file].prog.town.warp = makeTownWarp() -- reset warp list
            if info[file].map.realname == "Municipality Town" then  
              redoMap("Town", "Municipality Town", "Town Square", 2, 1, 3, 3, 5, 5, "Down")
            else
              redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 3, 3, 5, 5, "Down")
            end
          end
        
        elseif info[file].map.subname == "Bar" then
          if info[file].map.realname == "Municipality Town" then
            redoMap("Town", "Municipality Town", "Town Square", 2, 1, 9, 9, 5, 5, "Down")
          else
            redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 9, 9, 5, 5, "Down")
          end
        end
        
      elseif info[file].map.name == "Plains" then
        if update then
          oneText("Capstone Textbox/Post.png", "Out of bounds!")
        else
          redoMap("Plains", "Steppe Plains", "Steppe Path", 3, 2, 6, 1, 5, 5, "Down")
        end
      elseif info[file].map.name == "Temple" then
        
        if info[file].map.subname == "First Floor" then
          
          if update then
            oneText("Capstone Textbox/Post.png", "Out of bounds!")
          else
            redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 41, 43, 41, 43, "Down")
          end
          
        elseif info[file].map.subname == "Second Floor" then
          
          if info[file].prog.temple == 5 then
            redoMap("Temple", "Fane Temple", "Room 6", 4, 8, 5, 1, 5, 5, "Down")
          elseif info[file].prog.temple == 8 then
            redoMap("Temple", "Fane Temple", "Room 9", 4, 11, 5, 1, 5, 5, "Down")
          elseif info[file].prog.temple == 10 then
            redoMap("Temple", "Fane Temple", "Boss Room", 4, 13, 5, 1, 5, 5, "Down")
            
            templeRelock()
          end
          
        elseif (info[file].map.subname == "Room 1" and info[file].posx == 5)
        or info[file].map.subname == "Room 4" then
          redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 1, 5, 5, "Down")
        elseif info[file].map.subname == "Room 5"
        or (info[file].map.subname == "Room 10" and info[file].posx == 8) then
          redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 1, 5, 5, "Down")
        elseif info[file].map.subname == "Boss Room" then
          
          if update then
            finishGame()
          else
            info[file].prog.temple = -1
            redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 15, 33, 15, "Up") -- skip town revisit
            oneText("Capstone Tiles/Temple - Floor.png", "You got mysteriously warped into the volcano! Let's forge on!")
          end
          --[[redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 41, 43, 41, 43, "Down")
          startBattle(info[file].battle.you.hp, info[file].battle.you.endur, info[file].battle.you.hit, 
            "Temple", 100, 10, 10, 1.05, 100, 3)
          oneText("Capstone Tiles/Temple - Floor.png", "The temple itself offers you to a fight!")]]--
          
        end
        
        
      elseif info[file].map.name == "Volcano" then
        
        if thisSpace == "Exit" then
          redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 21, 2, 21, 5, "Down")
        end
        
      elseif info[file].map.name == "Desert" then
        
        if thisSpace == "Exit Pier" then
          if update then
            oneText("Capstone Textbox/Post.png", "Out of bounds!")
          else
            redoMap("Desert", "Arid Desert", "Pier", 6, 2, 5, 1, 5, 5, "Down")
          end
        end
        
      elseif info[file].map.name == "Metropolis" then
        
      elseif info[file].map.name == "Snow" then
        
        if thisSpace == "Exit" then
          redoMap("Snow", "Mesa Alp", "Exterior", 5, 1, 25, 2, 25, 5, "Down")
        end
        
      elseif info[file].map.name == "Ruins" then
        
        if thisSpace == "From Down" then

          if info[file].map.subname == "Corridor" then
            redoMap("Ruins", "Relic Ruins", "3F, North Sector", 9, 6, 5, 1, 5, 5, "Down")
          elseif info[file].map.subname == "Boss Room" then
            redoMap("Ruins", "Relic Ruins", "Corridor", 9, 15, 5, 1, 5, 5, "Down")
          elseif info[file].map.subname == "1F, South Sector" then
            if update then
              oneText("Capstone Textbox/Post.png", "Out of bounds!")
            else
              redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 5, 14, 5, 14, "Down")
            end
          else
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1))).."F, South Sector", 9, info[file].map.subid - 1, info[file].posx, 1, 5, 5, "Down")
          end
          
        end
        
      end
    end
  end
end