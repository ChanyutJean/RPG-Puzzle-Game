function replaceYou(dir)
  info[file].dir = dir
  local tempx = you.x
  local tempy = you.y
  you:removeSelf()
  you = nil
  you = display.newImageRect("Capstone Interactibles/You - "..dir..".png", 32, 40)
  you.x = tempx
  you.y = tempy
  
  if info[file].prog.desert.hitlaser then
    you:setFillColor(1, 0.5, 0.5)
  end
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then -- check if interactibles present
        if interactibles[i].NPC and interactibles[i].y > you.y then
          interactibles[i]:toFront()
        end
      end
    end
  end
  
end

function changeMap(name, realname, subname, id, subid, posx, posy, centerx, centery)
  
  info[file].map.name = name
  info[file].map.realname = realname
  info[file].map.subname = subname
  info[file].map.id = id
  info[file].map.subid = subid

  info[file].posx = posx
  info[file].posy = posy

  info[file].centerx = centerx
  info[file].centery = centery
  
end

function makeMap()
  
  currentMap = {}
  
  local defaultBuild = false
  
  if info[file].map.name == "Cave" then
    
    if info[file].cave[5][8][1] == "Floor" then -- tenacity trial, stair
      info[file].cave[5][8][1] = "Stair Up"
    end
    
    for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
      currentMap[i] = {}
      for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
        currentMap[i][j] = info[file].cave[info[file].map.subid][i][j]
      end
    end
    
    if info[file].prog.cave.secondfloor then -- visage trial, second floor
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
          if currentMap[i][j] == "Stacked Rock" then
            currentMap[i][j] = "Second Floor Rock"
          elseif currentMap[i][j] == "Push Rock" then
            currentMap[i][j] = "Second Floor"
          elseif currentMap[i][j] == "Floor"
          or currentMap[i][j] == "Hole"
          or currentMap[i][j] == "Stair Up"
          or currentMap[i][j] == "Stair Down" then
            currentMap[i][j] = "Void"
          end
          
          if i == 6 and j == 4 and currentMap[i][j] == "Void" then
            currentMap[i][j] = "Way Down"
          elseif i == 7 and j == 3 and currentMap[i][j] == "Void" then
            currentMap[i][j] = "Way Right"
          end
          
        end
      end
      
    else -- miscellaneous fixes

      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
          if currentMap[i][j]:sub(1, 7) == "Monster" then
            if currentMap[i][j] == "Monster "..info[file].prog.cave.visit then
              currentMap[i][j] = "Monster"
            else
              currentMap[i][j] = "Floor"
            end
          elseif currentMap[i][j] == "Fire" and not info[file].prog.cave.fire then
            currentMap[i][j] = "Floor"
          elseif currentMap[i][j] == "Rolling Rock" and not info[file].prog.cave.rock then
            currentMap[i][j] = "Floor"
          elseif currentMap[i][j] == "Small Rock" and not info[file].prog.cave.rock then
            currentMap[i][j] = "Crushed Rock"
          end
          
        end
      end
      
    end
    
  elseif info[file].map.name == "Town" then
    
    if info[file].map.subname == "Town Square Ruins" then
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
        end
      end
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
          if currentMap[i][j]:sub(1, 6) == "Rubble" then
            if (currentMap[i][j] == "Rubble 1" and info[file].prog.town.crisis)
            or (currentMap[i][j] == "Rubble 2" and not info[file].prog.town.crisis) then
              currentMap[i][j] = "Rubble"
            else
              currentMap[i][j] = "Floor"
            end
          end
        end
      end
      
    else
      defaultBuild = true
    end  

  elseif info[file].map.name == "Plains" then
    
    if info[file].map.subname == "Steppe Land" then -- change items
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
          if (info[file].prog.plains.item:sub(1, 1) == "O" and i == 2 and j == 2)
          or (info[file].prog.plains.item:sub(2, 2) == "O" and i == 2 and j == 50)
          or (info[file].prog.plains.item:sub(3, 3) == "O" and i == 14 and j == 13)
          or (info[file].prog.plains.item:sub(4, 4) == "O" and i == 24 and j == 15)
          or (info[file].prog.plains.item:sub(5, 5) == "O" and i == 14 and j == 24)
          or (info[file].prog.plains.item:sub(6, 6) == "O" and i == 37 and j == 25)
          or (info[file].prog.plains.item:sub(7, 7) == "O" and i == 27 and j == 27)
          or (info[file].prog.plains.item:sub(8, 8) == "O" and i == 30 and j == 30)
          or (info[file].prog.plains.item:sub(9, 9) == "O" and i == 31 and j == 30)
          or (info[file].prog.plains.item:sub(10, 10) == "O" and i == 32 and j == 30)
          or (info[file].prog.plains.item:sub(11, 11) == "O" and i == 3 and j == 31)
          or (info[file].prog.plains.item:sub(12, 12) == "O" and i == 30 and j == 31)
          or (info[file].prog.plains.item:sub(13, 13) == "O" and i == 32 and j == 31)
          or (info[file].prog.plains.item:sub(14, 14) == "O" and i == 30 and j == 32)
          or (info[file].prog.plains.item:sub(15, 15) == "O" and i == 31 and j == 32)
          or (info[file].prog.plains.item:sub(16, 16) == "O" and i == 32 and j == 32)
          or (info[file].prog.plains.item:sub(17, 17) == "O" and i == 31 and j == 38)
          or (info[file].prog.plains.item:sub(18, 18) == "O" and i == 26 and j == 48)
          or (info[file].prog.plains.item:sub(19, 19) == "O" and i == 2 and j == 50)
          or (info[file].prog.plains.item:sub(20, 20) == "O" and i == 50 and j == 50)
          then
            currentMap[i][j] = "Floor"
          else
            currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
          end
          
        end
      end
    
    else
      defaultBuild = true
    end

  elseif info[file].map.name == "Temple" then 
  
  
    if not (info[file].map.subname == "First Floor" or info[file].map.subname == "Second Floor" or info[file].map.subname == "Boss Room") then -- start with nothing in temple
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = "Floor"
        end
      end
      
    elseif info[file].map.subname == "First Floor" and info[file].prog.temple < 4 then -- no ladder
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          if i == 5 and j == 5 then
            currentMap[i][j] = "Floor"
          else
            currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
          end
        end
      end
      
    else
      defaultBuild = true
    end
    
  elseif info[file].map.name == "Volcano" then
    
    if info[file].map.subname == "Exterior" and (not info[file].prog.volcano.explode) then -- no cracks in exterior
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
        end
      end
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          if currentMap[i][j] == "Crack" then
            currentMap[i][j] = "Wall"
            currentMap[i][j - 1] = "Wall" -- change wall 2 to wall
          end
        end
      end
      
    else
      defaultBuild = true
    end
    
  elseif info[file].map.name == "Desert" then
    
    if info[file].map.subname == "Dessert's Lair" then
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
        end
      end
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          if currentMap[i][j] == "Dessert" and not info[file].prog.desert.dessert then
            currentMap[i][j] = "Floor"
          elseif currentMap[i][j] == "Monster" and not info[file].prog.desert.dessert then
            currentMap[i][j] = "Dessert 2"
          end
        end
      end
      
      if info[file].prog.desert.switch:sub(1, 1) == "O" then
        currentMap[10][3] = "Right"
      elseif info[file].prog.desert.switch:sub(2, 2) == "O" then
        currentMap[43][8] = "Right"
      end
      
    else
      defaultBuild = true
    end
    
  elseif info[file].map.name == "Metropolis" then
    
    if info[file].map.subname == "Sewers" then
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = info[file].cave[6][i][j]
        end
      end
      
    else
      defaultBuild = true
    end
    
  elseif info[file].map.name == "Snow" then 
    
    if info[file].map.subname == "Exterior" then -- change Snowball to Floored
    
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
          if (info[file].prog.alp.ball:sub(1, 1) == "O" and (i == 10 or i == 11) and j == 5)
          or (info[file].prog.alp.ball:sub(2, 2) == "O" and (i == 26 or i == 27) and j == 14)
          or (info[file].prog.alp.ball:sub(3, 3) == "O" and (i == 13 or i == 14) and j == 5)
          or (info[file].prog.alp.ball:sub(4, 4) == "O" and (i == 13 or i == 14) and j == 11)
          or (info[file].prog.alp.ball:sub(5, 5) == "O" and (i == 10 or i == 11) and j == 14)
          or (info[file].prog.alp.ball:sub(6, 6) == "O" and (i == 16 or i == 17) and j == 14)
          or (info[file].prog.alp.ball:sub(7, 7) == "O" and (i == 29 or i == 30) and j == 14)
          or (info[file].prog.alp.ball:sub(8, 8) == "O" and (i == 34 or i == 35) and j == 14)
          or (info[file].prog.alp.ball:sub(9, 9) == "O" and (i == 39 or i == 40) and j == 14)
          then
            currentMap[i][j] = "Floored"
          else
            currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
          end
          
        end
      end
    
    else
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
          
          if i == info[file].prog.alp.highlightx and j == info[file].prog.alp.highlighty then
            if currentMap[i][j] == "Ice" then
              currentMap[i][j] = "Highlight"
            elseif currentMap[i][j] == "Floor" then
              currentMap[i][j] = "Highlight Floor"
            end
          end
          
        end
      end
      
    end
    
  elseif info[file].map.name == "Ruins" then
    
    for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
      currentMap[i] = {}
      for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
          
        if (info[file].map.subname == "3F, South Sector" and not (info[file].prog.ruins.stair == 1) and i == 5 and j == 6) 
        or (info[file].map.subname == "6F, South Sector" and info[file].prog.ruins.stair == 6 and i == 5 and j == 6) then
          currentMap[i][j] = "Floor"
        else
          currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
        end
        
      end
    end
    
  elseif info[file].map.name == "Void" then
    
    if info[file].map.subname == "Void Room" then
      
      for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
        currentMap[i] = {}
        for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
            
            
          if (info[file].prog.void.lava:sub(1, 1) == "O" and i == 1 and j == 1)
          or (info[file].prog.void.lava:sub(2, 2) == "O" and i == 2 and j == 1)
          or (info[file].prog.void.lava:sub(3, 3) == "O" and i == 1 and j == 2)
          or (info[file].prog.void.lava:sub(4, 4) == "O" and i == 1 and j == 3)
          or (info[file].prog.void.lava:sub(5, 5) == "O" and i == 6 and j == 9)
          or (info[file].prog.void.lava:sub(6, 6) == "O" and i == 7 and j == 9)
          or (info[file].prog.void.lava:sub(7, 7) == "O" and i == 8 and j == 9)
          then
            currentMap[i][j] = "Lava"
          else
            currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
          end
          
        end
      end
    
    else
      defaultBuild = true
    end
    
  end
    
  if defaultBuild then -- default map build process
    
    for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
      currentMap[i] = {}
      for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
        currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
      end
    end
    
  end
     
end

function makeRawMap()
  
  for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
    currentMap[i] = {}
    for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
      currentMap[i][j] = map[info[file].map.id][info[file].map.subid][i][j]
    end
  end
  
end

function updateMap()
  
  if info[file].map.name == "Void" then
    
    if info[file].map.subname == "Cave Room" then
      tileset = "Cave"
    elseif info[file].map.subname == "Plains Room" then
      tileset = "Plains"
    elseif info[file].map.subname == "Volcano Room" then
      tileset = "Volcano"
    elseif info[file].map.subname == "Alp Room" then
      tileset = "Snow"
    elseif info[file].map.subname == "Ruins Room" then
      tileset = "Ruins"
    elseif info[file].map.subname == "Temple Room" then
      tileset = "Temple"
    elseif info[file].map.subname == "Void Room" 
    or info[file].map.subname == "Boss Room" then
      tileset = "Void"
    end

    for i = 1, 9 do
      for j = 1, 9 do 
        
        if currentMap[i + info[file].centerx - 5][j + info[file].centery - 5] == "1"
        or currentMap[i + info[file].centerx - 5][j + info[file].centery - 5] == "2"
        or currentMap[i + info[file].centerx - 5][j + info[file].centery - 5] == "3"
        or currentMap[i + info[file].centerx - 5][j + info[file].centery - 5] == "4" then
        
          img = display.newImageRect(
              "Capstone Tiles/Void - "..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]..".png", 30, 30)
          img.x = (30 * i) + 10 -- 25 to 295 (max. 320)
          img.y = (30 * j) + 10 -- 25 to 295 (max. 480)
        
        else
        
          img = display.newImageRect(
              "Capstone Tiles/"..tileset.." - "..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]..".png", 30, 30)
          img.x = (30 * i) + 10 -- 25 to 295 (max. 320)
          img.y = (30 * j) + 10 -- 25 to 295 (max. 480)
          
          if info[file].map.subname == "Ruins Room" and i == info[file].prog.void.highlightx and j == info[file].prog.void.highlighty then
            img:setFillColor(0.5, 1, 0.5)
          end
          
        end
        
      end
    end
    
  elseif info[file].map.name == "Metropolis" then
    
    if info[file].map.subname == "Main Area" then
      tileset = "City"
    elseif info[file].map.subname == "Sewers" then
      tileset = "Cave"
    else
      tileset = "Building"
    end
    
    for i = 1, 9 do
      for j = 1, 9 do 
        
        if currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]:sub(1, 12) == "Main House 0" then
          currentMap[i + info[file].centerx - 5][j + info[file].centery - 5] = "Main House "..info[file].metro[2].."-"..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]:sub(14, 15)
          print(currentMap[i + info[file].centerx - 5][j + info[file].centery - 5])
        end
        img = display.newImageRect(
          "Capstone Tiles/"..tileset.." - "..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]..".png", 30, 30)
        img.x = (30 * i) + 10 -- 25 to 295 (max. 320)
        img.y = (30 * j) + 10 -- 25 to 295 (max. 480)
          
      end
    end
  
  else -- default update process
  
    for i = 1, 9 do
      for j = 1, 9 do 
      
        img = display.newImageRect(
            "Capstone Tiles/"..info[file].map.name.." - "..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]..".png", 30, 30)
        img.x = (30 * i) + 10 -- 25 to 295 (max. 320)
        img.y = (30 * j) + 10 -- 25 to 295 (max. 480)
        
        if info[file].map.name == "Ruins" and i + info[file].centerx - 5 == info[file].prog.ruins.highlightx and j + info[file].centery - 5 == info[file].prog.ruins.highlighty then --re-highlight ruins
          img:setFillColor(0.5, 1, 0.5)
        end

      end
    end
  end 
    
  deleteInteractibles()
  makeInteractibles()
  
  deleteLaser()
  if info[file].map.name == "Desert" and info[file].map.subname == "Dessert's Lair" and info[file].prog.desert.dessert then
    makeLaser()
  end
  
  you:toFront()
  
end

function updateRawMap()
  
  for i = 1, 9 do
    for j = 1, 9 do 
      img = display.newImageRect("Capstone Tiles/"..info[file].map.name.." - "..currentMap[i + info[file].centerx - 5][j + info[file].centery - 5]..".png", 30, 30)
      img.x = (30 * i) + 10 -- 25 to 295 (max. 320)
      img.y = (30 * j) + 10 -- 25 to 295 (max. 480)
    end
  end
  
end

function changeTitle(realname, subname)
  
  title:removeSelf()
  title = nil
  title = display.newText("File "..file..": "..realname.." - "..subname, 160, 15, native.systemFont, 15)
  
end

function redoMap(name, realname, subname, id, subid, posx, posy, centerx, centery, dir)
  changeMap(name, realname, subname, id, subid, posx, posy, centerx, centery)
  makeMap()
  updateMap()
  changeTitle(realname, subname)
        
  replaceYou(dir)
  you.x = 160 + (30 * (posx - centerx))
  you.y = 150 + (30 * (posy - centery))
end