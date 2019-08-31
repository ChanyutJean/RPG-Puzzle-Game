function moveUp() -- pressed up
  
  info[file].meta.up = info[file].meta.up + 1
  
  if info[file].battle.on then
    return
  end
  
  if info[file].shop then
    return
  end
  
  if info[file].text then -- if has text
    info[file].textchoose = true
    textPathUp()
    return
  end
  
  if not(you == nil) then -- you exist
    
    replaceYou("Up")
    
    local thisSpace = currentMap[info[file].posx][info[file].posy]
    
    if info[file].posy > 1 and 
    not (currentMap[info[file].posx][info[file].posy - 1] == "Void") then -- not at the edge and walkable
      
      local specialMove = true
      
      local nextSpace = currentMap[info[file].posx][info[file].posy - 1] -- not at edge, then make variable
      
      if info[file].map.name == "Cave" then
        
        --[[if (info[file].map.subname == "Spawn Path")
        and (info[file].meta.up % 20 == 0) then
          
          startBattle(info[file].battle.you.hp, info[file].battle.you.endur, info[file].battle.you.hit, 
            "Golem", 30, 5, 5, 1.01, 15, 2)
        
        else]]--
        if info[file].prog.cave.tutorial then
        
          if nextSpace == "Horizontal" then -- move through bridge
            if currentMap[info[file].posx][info[file].posy - 2] == "Push Rock" then
              oneText("Capstone Tiles/Cave - Push Rock.png", "There seems to be a rock blocking the way.")
            else
              you.y = you.y - 60
              info[file].posy = info[file].posy - 2
            end
          elseif thisSpace == "Horizontal" then -- cannot fall out of bridge
            oneText("Capstone Tiles/Cave - Horizontal.png", "Don't jump down the bridge!")
          elseif nextSpace == "Fire" then -- cannot go through fire
            oneText("Capstone Tiles/Cave - Fire.png", "A conspicuous fire obviously placed to hinder your path. Let's go the other way.")
          elseif nextSpace == "Push Rock" then -- cannot go through rock
            oneText("Capstone Tiles/Cave - Push Rock.png", "A seemingly immovable boulder. What would happen if an unstoppable force hits it?")
          elseif nextSpace == "Monster" then -- cannot go through monster
            oneText("Capstone Tiles/Cave - Monster.png", "You sighed. Those stationary monsters seem to be a ploy to lead you to a linear gameplay path.")
          elseif nextSpace == "Post" then
            oneText("Capstone Tiles/Cave - Post.png", "This seems to be a post. Maybe you could read it by 'acting' on it.")
          else
            specialMove = false
          end
          
        else
          
          if nextSpace == "Horizontal" then
            
            replaceYou("Up")
            you.y = you.y - 60
            info[file].posy = info[file].posy - 2
            
          elseif nextSpace == "Hole" then
            
            local afterHole = currentMap[info[file].posx][info[file].posy - 2]
          
            if afterHole == nil -- edge of map
            or afterHole == "Void"
            or afterHole == "Hole"
            or afterHole == "Push Rock"
            or afterHole == "Pull Rock"
            or afterHole == "Fake Pull Rock"
            or afterHole == "Stacked Rock" then
              return
            else
              replaceYou("Up")
              you.y = you.y - 60
              info[file].posy = info[file].posy - 2
            end
            
          elseif nextSpace == "Ladder" then
            
            info[file].prog.cave.secondfloor = true
      
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
          or nextSpace == "Post" then
            return
            
          else
            specialMove = false
          end
            
        end
        
      elseif info[file].map.name == "Town" then
        
        if collidedWithNPCUp() then
          return
          
        elseif nextSpace == "Police 4"
        or nextSpace == "Warp 4"
        or nextSpace == "Shop 4"
        or nextSpace == "Shop 6"
        or nextSpace == "Compass 7"
        or nextSpace == "Compass 8"
        or nextSpace == "Compass 9"
        or nextSpace == "Cave 4"
        or nextSpace == "Cave 6"
        or nextSpace == "Bar 3" 
        
        or nextSpace == "Old Police 4"
        or nextSpace == "Old Warp 4"
        or nextSpace == "Old Shop 4"
        or nextSpace == "Old Shop 6"
        or nextSpace == "Old Compass 7"
        or nextSpace == "Old Compass 8"
        or nextSpace == "Old Compass 9"
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
          
        elseif nextSpace == "Police 3" then
          
          oneText("Capstone Interactibles/Lock.png", "Authorized personnel only.")
          
        elseif nextSpace == "Old Police 3" then
          
          oneText("Capstone Interactibles/Lock.png", "It's a ruined police station.")
          
        elseif nextSpace == "Warp 3" then
          
          if info[file].prog.town.warpkey then
            redoMap("Town", "Municipality Town", "Warp House", 2, 5, 5, 9, 5, 5, "Up")
          else
            oneText("Capstone Interactibles/Lock.png", "It's locked! Maybe you could get the key from somewhere...?")
          end
          
        elseif nextSpace == "Old Warp 3" then
          
          if info[file].prog.town.warpkey then
            redoMap("Town", "Anarchic Town", "Warp House", 2, 5, 5, 9, 5, 5, "Up")
          else
            oneText("Capstone Interactibles/Lock.png", "It's locked!")
          end
          
        elseif nextSpace == "Shop 5" then
          
          info[file].shop = true
          showShop()
          oneText("Capstone Tiles/Town - Shop.png", "Welcome to our municipal shop!")
          
        elseif nextSpace == "Old Shop 5" then
          
          info[file].shop = true
          showShop()
          oneText("Capstone Tiles/Town - Shop.png", "Welcome to our beastly shop!")
          
        elseif nextSpace == "Cave 5" then
          redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 27, 9, 24, 5, "Up")
          
        elseif nextSpace == "Bar 4" then
          redoMap("Town", "Municipality Town", "Bar", 2, 4, 8, 9, 5, 5, "Up")
          
        elseif nextSpace == "Old Bar 4" then
          changeInteractiblesBar()
          redoMap("Town", "Anarchic Town", "Bar", 2, 4, 8, 9, 5, 5, "Up")
          
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
        or nextSpace == "Temple 7" 
        or nextSpace == "Temple 9" then
          return
          
        elseif nextSpace == "Temple 8" then
          if update then
            finishGame()
            
          else
            redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 9, 5, 5, "Up")
          end
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Temple" then
        
        local m = text[info[file].map.id][info[file].map.subid][info[file].posy]:sub(info[file].posx, info[file].posx)
          
        if m == "B" or m == "F" or m == "G" or m == "J" or m == "K" or m == "L" or m == "N" or m == "Q" or m == "Z" then
            
          templeWallUp()
            
        elseif nextSpace == "Ladder" then
          
          if info[file].map.subname == "First Floor" then
            redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 5, 5, 5, "Up")
          elseif info[file].map.subname == "Second Floor" then
            redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 5, 5, 5, "Up")
          end
          
        elseif info[file].map.subname == "Second Floor" then
          
          if collidedWithInteractiblesUp("Lock") then
            return
          
          else
            specialMove = false
          end
          
        elseif info[file].map.subname == "Boss Room" then
          
          if collidedWithNPCUp() then
            return
        
          elseif nextSpace == "Book"
          or nextSpace == "Item"
          or nextSpace == "Item 2" then
            return
          
          else
            specialMove = false
          end
          
        else
          specialMove = false
        end
        
      elseif info[file].map.name == "Volcano" then
        
        if collidedWithInteractiblesUp("Lock") then
          return
        
        elseif nextSpace == "Climb" then
          if info[file].prog.volcano.climb then
            specialMove = false
          end
          
        elseif nextSpace == "Rock"
        or nextSpace == "Wall" 
        or nextSpace == "Wall 2"
        or nextSpace == "Way Out Down"
        or nextSpace == "Lava" 
        or nextSpace == "Post" then
          return
          
        elseif nextSpace == "Way Out Up" then
          
          if info[file].map.subname == "Exterior" then
            redoMap("Volcano", "Mesa Volcano", "Trophy Peak", 5, 10, 5, 9, 5, 5, "Up")
          elseif info[file].map.subname == "Cave 7" then
            if not (info[file].prog.volcano.explode) then
              oneText("Capstone Tiles/Volcano - Crack.png", "The volcano seems to have erupted while you were inside the cave...")
              info[file].prog.volcano.explode = true
            end
            redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 5, 8, 5, 8, "Down")
          end

        elseif nextSpace == "Cave" then

          volcanoCaveWarp()
          
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
        
        elseif collidedWithInteractiblesUp("Statue") then
          return

        elseif thisSpace == "Down"
        or nextSpace == "Down"
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

          if nextSpace == "Climb" then
            if info[file].prog.alp.climb then
              specialMove = false
            end
          
          elseif nextSpace == "Rock" 
          or nextSpace == "Wall"
          or nextSpace == "Way Out Down" 
          or nextSpace == "Post" then
            return
             
          elseif currentMap[info[file].posx][info[file].posy - 1] == "Ice" then
            
            snowSlipUp()
            specialMove = false

          elseif currentMap[info[file].posx][info[file].posy - 1] == "Way Out Up" then
            
            redoMap("Snow", "Mesa Alp", "Trophy Peak", 8, 9, 5, 9, 5, 5, "Up")

          elseif currentMap[info[file].posx][info[file].posy - 1] == "Cave" then
            
            snowCaveWarp()
            
          else
            specialMove = false
          end
        
        elseif info[file].prog.alp.dir == "Up" then
          
          snowUnslipUp()
          specialMove = false
          
        end
      
      elseif info[file].map.name == "Ruins" then

        if info[file].prog.ruins.dir == "" then
        
          if thisSpace == "Left" 
          or thisSpace == "Right"
          or thisSpace == "Down"
          or thisSpace == "Very Left" 
          or thisSpace == "Very Right"
          or thisSpace == "Very Down" then
            return
            
          elseif thisSpace == "Very Up" then
            
            ruinsSlipUp()
            specialMove = false
            
          elseif nextSpace == "Down"
          or nextSpace == "Rock"
          or nextSpace == "Post"
          or nextSpace == "Switch"
          or nextSpace == "Track" then
            return
          
          elseif currentMap[info[file].posx][info[file].posy - 1] == "Special Stair" then
            
            ruinsStair()
          
          elseif nextSpace == "Hole" then 
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx, info[file].posy - 1, 5, 5, "Up")
            
          elseif nextSpace == "Stair Up" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) + 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid + 2, info[file].posx, info[file].posy - 1, 5, 5, "Up")
            
          elseif nextSpace == "Stair Down" then
            
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1)) - 1).."F, "..info[file].map.subname:sub(5, 9).." Sector", 9, info[file].map.subid - 2, info[file].posx, info[file].posy - 1, 5, 5, "Up")

          else
            specialMove = false
          end
        
        elseif info[file].prog.ruins.dir == "Up" then
        
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
          
          if m == "B" or m == "F" or m == "G" or m == "J" or m == "K" or m == "L" or m == "N" or m == "Q" or m == "Z" then
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
              
              voidSnowSlipUp()
              specialMove = false
              
            else
              specialMove = false
            end
          
          elseif info[file].prog.void.snowdir == "Up" then
          
            voidSnowUnslipUp()
            specialMove = false
            
          end
        
        elseif info[file].map.subname == "Ruins Room" then
        
          if info[file].prog.void.ruinsdir == "" then
        
            if thisSpace == "Left" 
            or thisSpace == "Right"
            or thisSpace == "Up"
            or thisSpace == "Very Left" 
            or thisSpace == "Very Right"
            or thisSpace == "Very Up" then
              return
              
            elseif thisSpace == "Very Down" then
              
              voidRuinsSlipUp()
              specialMove = false

            else
              specialMove = false
            end
          
          elseif info[file].prog.void.ruinsdir == "Up" then
          
            voidRuinsUnslip()
            specialMove = false
          
          end
        
        elseif info[file].map.subname == "Temple Room" then
        
          if (not(thisSpace == "Book"
          or thisSpace == "Item"
          or thisSpace == "Item 2"
          or thisSpace == "Ladder"
          or thisSpace == "1"
          or thisSpace == "3") -- in a warp zone
          and not info[file].prog.void.templestep) -- and can't step forward
          or nextSpace == "Post" then -- or next step is a wall
            return
            
          else
            info[file].prog.void.templestep = false -- can't step forward in a warp zone
            specialMove = false
          end

        elseif info[file].map.subname == "Void Room" then
          
          if nextSpace == "Rock" 
          or nextSpace == "Down"
          or nextSpace == "Lava"
          or thisSpace == "Left"
          or thisSpace == "Right"
          or thisSpace == "Down" 
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
            
          end
          
          if nextSpace == "Ice" then
            
            voidFuncIceUp()
            
          elseif thisSpace == "Very Up" then
          
            if info[file].posx == 1 then
              redoMap("Void", "Void", "Void Room", 10, 7, 1, 1, 5, 5, "Up")
            elseif info[file].posx == 2 then
              redoMap("Void", "Void", "Void Room", 10, 7, 2, 1, 5, 5, "Up")
            end
            
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
      
      if not specialMove then -- default move
      
        if info[file].posy - 5 > 0 and info[file].posy == info[file].centery then -- scrollable and you at center
          info[file].centery = info[file].centery - 1 -- move the center
          updateMap() -- move map
          replaceYou("Up") -- move NPC to front
        else
          you.y = you.y - 30 -- move yourself
        end
        info[file].posy = info[file].posy - 1
      
      end
          
    elseif info[file].posy == 1 then -- at the edge
    
      if info[file].map.name == "Cave" then
        
        if thisSpace == "Stair Up" then
          if info[file].map.subname == "Spawn Path" then
            if info[file].prog.alp.snowed then
              info[file].cave = makeCaveMap()
              redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 15, 38, 15, "Up")
            else
              info[file].cave = makeCaveMap()
              redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 15, 33, 15, "Up")
            end
          else -- in the trials
            if update then
              oneText("Capstone Textbox/Post.png", "Out of bounds!")
            else
              info[file].cave = makeCaveMap()
              redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 21, 9, 21, 5, "Up")
            end
          end
        end
        
      elseif info[file].map.name == "Town" then
        
        if info[file].map.subname == "Town Square" then
          if info[file].posx == 5 then
            oneText("Capstone Tiles/Town - Up.png", "Under construction.")
          end
        
        elseif info[file].map.subname == "Town Square Ruins" then
          if info[file].posx == 5 then
            redoMap("Metropolis", "Metropolitan City", "Main Area", 7, 1, 14, 22, 14, 18, "Up")
          end
        
        elseif info[file].map.subname == "Empty Room" then
          if info[file].map.realname == "Municipality Town" then
            redoMap("Town", "Municipality Town", "Town Square", 2, 1, 5, 9, 5, 5, "Up")
          else
            redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 5, 9, 5, 5, "Up")
          end
        end
        
      elseif info[file].map.name == "Plains" then
        
        if info[file].map.subname == "Steppe Path" then
          redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 26, 51, 26, 47, "Up")
        end
        
      elseif info[file].map.name == "Temple" then
        
        if info[file].map.subname == "First Floor" then 
          if info[file].prog.temple == 0 then
            redoMap("Temple", "Fane Temple", "Room 1", 4, 2, 5, 9, 5, 5, "Up")
          elseif info[file].prog.temple == 3 then
            redoMap("Temple", "Fane Temple", "Room 4", 4, 5, 5, 9, 5, 5, "Up")
          end
        elseif info[file].map.subname == "Second Floor" then
          if info[file].prog.temple == 4 then
            redoMap("Temple", "Fane Temple", "Room 5", 4, 7, 5, 9, 5, 5, "Up")
          elseif info[file].prog.temple == 9 then
            redoMap("Temple", "Fane Temple", "Room 10", 4, 12, 8, 15, 8, 11, "Up")
          end
        elseif info[file].map.subname == "Room 6" 
        or (info[file].map.subname == "Room 9" and info[file].posx == 5) 
        or info[file].map.subname == "Boss Room" then
          redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 9, 5, 5, "Up")
        end
          
      elseif info[file].map.name == "Volcano" then
        
      elseif info[file].map.name == "Desert" then
        
        if thisSpace == "Pier" then
          redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 2, 9, 5, 5, "Up")
        elseif thisSpace == "Exit" then
          
          if update then
            oneText("Capstone Textbox/Post.png", "Out of bounds!")
          else
            if info[file].posx == 1 then
              if info[file].prog.alp.snowed then
                redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 44, 15, 44, 15, "Up")
              else
                redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 5, 15, 5, 15, "Up")
              end
            elseif info[file].posx == 3 then
              redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 4, 9, 5, 5, "Up")
            end
          end
          
        end
        
      elseif info[file].map.name == "Metropolis" then
        
        if info[file].map.subname == "Sewers" then
          info[file].cave = makeCaveMap()
          redoMap("Metropolis", "Metropolitan City", "Main Area", 7, 1, 4, 20, 5, 18, "Up")
        end
        
      elseif info[file].map.name == "Snow" then
        
      elseif info[file].map.name == "Ruins" then
        
        if thisSpace == "From Up" then
          if info[file].map.subname == "Corridor" then
            redoMap("Ruins", "Relic Ruins", "Boss Room", 9, 16, 5, 9, 5, 5, "Up")
          else
            redoMap("Ruins", "Relic Ruins", tostring(tonumber(info[file].map.subname:sub(1, 1))).."F, North Sector", 9, info[file].map.subid + 1, info[file].posx, 9, 5, 5, "Up")
          end
        elseif thisSpace == "Tile 3F" then
          redoMap("Ruins", "Relic Ruins", "Corridor", 9, 15, 5, 22, 5, 18, "Up")
        end
        
      elseif info[file].map.name == "Void" then
        
        if info[file].map.subname == "Cave Room" and info[file].posx == 7 then
          oneText("Capstone Tiles/Plains - Floor.png", "Welcome to Plains Room.")
          redoMap("Void", "Void", "Plains Room", 10, 2, 7, 9, 5, 5, "Up")
        elseif info[file].map.subname == "Plains Room" and info[file].posx == 9 then
          oneText("Capstone Tiles/Volcano - Floor.png", "Welcome to Volcano Room.")
          redoMap("Void", "Void", "Volcano Room", 10, 3, 9, 9, 5, 5, "Up")
        elseif info[file].map.subname == "Volcano Room" and info[file].posx == 3 then
          
          local noCrack = true
          for i = 1, 9 do
            for j = 1, 9 do
              if not(currentMap[i][j] == "Crack")
              and not(currentMap[i][j] == "Lava")
              and not(currentMap[i][j] == "Floor")
              and not(currentMap[i][j] == "1")
              and not(currentMap[i][j] == "3") then
                noCrack = false
              end
            end
          end
          
          if noCrack then
            oneText("Capstone Tiles/Snow - Floor.png", "Welcome to Alp Room.")
            redoMap("Void", "Void", "Alp Room", 10, 4, 3, 9, 5, 5, "Up")
          else
            oneText("Capstone Interactibles/Lock.png", "Entry denied: A prerequisite has not been fulfilled.")
          end
          
        elseif info[file].map.subname == "Alp Room" and info[file].posx == 5 then
          oneText("Capstone Tiles/Ruins - Floor.png", "Welcome to Ruins Room.")
          redoMap("Void", "Void", "Ruins Room", 10, 5, 5, 9, 5, 5, "Up")
        elseif info[file].map.subname == "Ruins Room" and info[file].posx == 6 then
          oneText("Capstone Tiles/Temple - Floor.png", "Welcome to Temple Room.")
          redoMap("Void", "Void", "Temple Room", 10, 6, 6, 9, 5, 5, "Up")
        elseif info[file].map.subname == "Temple Room" and info[file].posx == 1 then
          oneText("Capstone Tiles/Void - Floor.png", "Welcome to the Void.")
          redoMap("Void", "Void", "Void Room", 10, 7, 9, 9, 5, 5, "Up")
        elseif info[file].map.subname == "Void Room" and info[file].posx == 5 then
          if info[file].prog.void.lava == "OOOOOOO" then
            
            if update then
              finishGame()
            else
              redoMap("Void", "Void", "Boss Room", 10, 8, 5, 9, 5, 5, "Up")
              oneText("Capstone Tiles/Town - White.png", "You have completed the capstone game! Congratulations!") -- cut off
            end
            
          else
            oneText("Capstone Tiles/Void - Crack.png", "Entry denied: A prerequisite has not been fulfilled.")
          end
        end
        
      end
    end
  end
end