function pushPullRock()

  if info[file].dir == "Up" then
            
    if not(currentMap[info[file].posx][info[file].posy - 2] == nil)
    and (currentMap[info[file].posx][info[file].posy - 1] == "Push Rock" 
    or currentMap[info[file].posx][info[file].posy - 1] == "Second Floor Rock") then
      
      if currentMap[info[file].posx][info[file].posy - 2] == "Push Rock"
      or currentMap[info[file].posx][info[file].posy - 2] == "Pull Rock"
      or currentMap[info[file].posx][info[file].posy - 2] == "Fake Pull Rock"
      or currentMap[info[file].posx][info[file].posy - 2] == "Fake Hole"
      or currentMap[info[file].posx][info[file].posy - 2] == "Stacked Rock"
      or currentMap[info[file].posx][info[file].posy - 2] == "Void"
      or currentMap[info[file].posx][info[file].posy - 2] == "Second Floor Rock"
      or currentMap[info[file].posx][info[file].posy - 2] == "Ladder" then
        return
        
      elseif currentMap[info[file].posx][info[file].posy - 2] == "Hole" then
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 2] = "Floor"
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 1] = "Floor"
        makeMap()
        updateMap()
        
      else
        
        if info[file].prog.cave.secondfloor then
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 1] = "Push Rock"
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 2] = "Stacked Rock"
        else
          if info[file].map.subname == "Sewers" then
            info[file].cave[6][info[file].posx][info[file].posy - 1] = "Floor"
            info[file].cave[6][info[file].posx][info[file].posy - 2] = "Push Rock"
          else
            info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 1] = "Floor"
            info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 2] = "Push Rock"
          end
        end
        makeMap()
        updateMap()
        
      end
    
    elseif not(currentMap[info[file].posx][info[file].posy - 1] == nil)
    and not(currentMap[info[file].posx][info[file].posy + 1] == nil)
    and currentMap[info[file].posx][info[file].posy - 1] == "Pull Rock" then
      
      if currentMap[info[file].posx][info[file].posy + 1] == "Push Rock"
      or currentMap[info[file].posx][info[file].posy + 1] == "Pull Rock"
      or currentMap[info[file].posx][info[file].posy + 1] == "Fake Pull Rock"
      or currentMap[info[file].posx][info[file].posy + 1] == "Stacked Rock"
      or currentMap[info[file].posx][info[file].posy + 1] == "Void"
      or currentMap[info[file].posx][info[file].posy + 1] == "Second Floor Rock" then
        return
      else
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy] = "Pull Rock"
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy - 1] = "Floor"
        you.y = you.y + 30
        info[file].posy = info[file].posy + 1

        makeMap()
        updateMap()
        
      end              
    end

  elseif info[file].dir == "Left" then
    
    if not(currentMap[info[file].posx - 2] == nil)
    and (currentMap[info[file].posx - 1][info[file].posy] == "Push Rock" 
    or currentMap[info[file].posx - 1][info[file].posy] == "Second Floor Rock") then
      
      if currentMap[info[file].posx - 2][info[file].posy] == "Push Rock"
      or currentMap[info[file].posx - 2][info[file].posy] == "Pull Rock"
      or currentMap[info[file].posx - 2][info[file].posy] == "Fake Pull Rock"
      or currentMap[info[file].posx - 2][info[file].posy] == "Fake Hole"
      or currentMap[info[file].posx - 2][info[file].posy] == "Stacked Rock"
      or currentMap[info[file].posx - 2][info[file].posy] == "Void"
      or currentMap[info[file].posx - 2][info[file].posy] == "Second Floor Rock"
      or currentMap[info[file].posx - 2][info[file].posy] == "Ladder" then
        return
      elseif currentMap[info[file].posx - 2][info[file].posy] == "Hole" then
        
        info[file].cave[info[file].map.subid][info[file].posx - 2][info[file].posy] = "Floor"
        info[file].cave[info[file].map.subid][info[file].posx - 1][info[file].posy] = "Floor"
        makeMap()
        updateMap()
        
      else
        
        if info[file].prog.cave.secondfloor then
          info[file].cave[info[file].map.subid][info[file].posx - 1][info[file].posy] = "Push Rock"
          info[file].cave[info[file].map.subid][info[file].posx - 2][info[file].posy] = "Stacked Rock"
        else
          if info[file].map.subname == "Sewers" then
            info[file].cave[6][info[file].posx - 1][info[file].posy] = "Floor"
            info[file].cave[6][info[file].posx - 2][info[file].posy] = "Push Rock"
          else
            info[file].cave[info[file].map.subid][info[file].posx - 1][info[file].posy] = "Floor"
            info[file].cave[info[file].map.subid][info[file].posx - 2][info[file].posy] = "Push Rock"
          end
        end
        
        makeMap()
        updateMap()
        
      end
    
    elseif not(currentMap[info[file].posx - 1] == nil)
    and not(currentMap[info[file].posx + 1] == nil)
    and currentMap[info[file].posx - 1][info[file].posy] == "Pull Rock" then
      
      if currentMap[info[file].posx + 1][info[file].posy] == "Push Rock"
      or currentMap[info[file].posx + 1][info[file].posy] == "Pull Rock"
      or currentMap[info[file].posx + 1][info[file].posy] == "Fake Pull Rock"
      or currentMap[info[file].posx + 1][info[file].posy] == "Stacked Rock"
      or currentMap[info[file].posx + 1][info[file].posy] == "Void"
      or currentMap[info[file].posx + 1][info[file].posy] == "Second Floor Rock" then
        return
      else
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy] = "Pull Rock"
        info[file].cave[info[file].map.subid][info[file].posx - 1][info[file].posy] = "Floor"
        you.x = you.x + 30
        info[file].posx = info[file].posx + 1

        makeMap()
        updateMap()
        
      end              
    end

  elseif info[file].dir == "Right" then
    
    if not(currentMap[info[file].posx + 2] == nil)
    and (currentMap[info[file].posx + 1][info[file].posy] == "Push Rock" 
    or currentMap[info[file].posx + 1][info[file].posy] == "Second Floor Rock") then
      
      if currentMap[info[file].posx + 2][info[file].posy] == "Push Rock"
      or currentMap[info[file].posx + 2][info[file].posy] == "Pull Rock"
      or currentMap[info[file].posx + 2][info[file].posy] == "Fake Pull Rock"
      or currentMap[info[file].posx + 2][info[file].posy] == "Fake Hole"
      or currentMap[info[file].posx + 2][info[file].posy] == "Stacked Rock"
      or currentMap[info[file].posx + 2][info[file].posy] == "Void"
      or currentMap[info[file].posx + 2][info[file].posy] == "Second Floor Rock"
      or currentMap[info[file].posx + 2][info[file].posy] == "Ladder" then
        return
      elseif currentMap[info[file].posx + 2][info[file].posy] == "Hole" then
        
        info[file].cave[info[file].map.subid][info[file].posx + 2][info[file].posy] = "Floor"
        info[file].cave[info[file].map.subid][info[file].posx + 1][info[file].posy] = "Floor"
        makeMap()
        updateMap()
        
      else
        
        if info[file].prog.cave.secondfloor then
          info[file].cave[info[file].map.subid][info[file].posx + 1][info[file].posy] = "Push Rock"
          info[file].cave[info[file].map.subid][info[file].posx + 2][info[file].posy] = "Stacked Rock"
        else
          if info[file].map.subname == "Sewers" then
            info[file].cave[6][info[file].posx + 1][info[file].posy] = "Floor"
            info[file].cave[6][info[file].posx + 2][info[file].posy] = "Push Rock"
          else
            info[file].cave[info[file].map.subid][info[file].posx + 1][info[file].posy] = "Floor"
            info[file].cave[info[file].map.subid][info[file].posx + 2][info[file].posy] = "Push Rock"
          end
        end
        makeMap()
        updateMap()
        
      end
    
    elseif not(currentMap[info[file].posx - 1] == nil)
    and not(currentMap[info[file].posx + 1] == nil)
    and currentMap[info[file].posx + 1][info[file].posy] == "Pull Rock" then
      
      if currentMap[info[file].posx - 1][info[file].posy] == "Push Rock"
      or currentMap[info[file].posx - 1][info[file].posy] == "Pull Rock"
      or currentMap[info[file].posx - 1][info[file].posy] == "Fake Pull Rock"
      or currentMap[info[file].posx - 1][info[file].posy] == "Stacked Rock"
      or currentMap[info[file].posx - 1][info[file].posy] == "Void"
      or currentMap[info[file].posx - 1][info[file].posy] == "Second Floor Rock" then
        return
      else
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy] = "Pull Rock"
        info[file].cave[info[file].map.subid][info[file].posx + 1][info[file].posy] = "Floor"
        you.x = you.x - 30
        info[file].posx = info[file].posx - 1

        makeMap()
        updateMap()
        
      end              
    end
    
  elseif info[file].dir == "Down" then
    
    if not(currentMap[info[file].posx][info[file].posy + 2] == nil)
    and (currentMap[info[file].posx][info[file].posy + 1] == "Push Rock" 
    or currentMap[info[file].posx][info[file].posy + 1] == "Second Floor Rock") then
      
      if currentMap[info[file].posx][info[file].posy + 2] == "Push Rock"
      or currentMap[info[file].posx][info[file].posy + 2] == "Pull Rock"
      or currentMap[info[file].posx][info[file].posy + 2] == "Fake Pull Rock"
      or currentMap[info[file].posx][info[file].posy + 2] == "Fake Hole"
      or currentMap[info[file].posx][info[file].posy + 2] == "Stacked Rock"
      or currentMap[info[file].posx][info[file].posy + 2] == "Void"
      or currentMap[info[file].posx][info[file].posy + 2] == "Second Floor Rock" 
      or currentMap[info[file].posx][info[file].posy + 2] == "Ladder" then
        return
      
      elseif currentMap[info[file].posx][info[file].posy + 2] == "Horizontal" then
        if info[file].posx == 18 then
          oneText("Capstone Tiles/Cave - Push Rock.png", "You can't seem to push the rock under this bridge. Let's try another one.")
        elseif info[file].posx == 20 then
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 4] = "Push Rock"
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 1] = "Floor"
          makeMap()
          updateMap()
        end
        
      elseif currentMap[info[file].posx][info[file].posy + 2] == "Hole" then
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 2] = "Floor"
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 1] = "Floor"
        makeMap()
        updateMap()
        
      else
        
        if info[file].prog.cave.secondfloor then
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 1] = "Push Rock"
          info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 2] = "Stacked Rock"
        else
          if info[file].map.subname == "Sewers" then
            info[file].cave[6][info[file].posx][info[file].posy + 1] = "Floor"
            info[file].cave[6][info[file].posx][info[file].posy + 2] = "Push Rock"
          else
            info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 1] = "Floor"
            info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 2] = "Push Rock"
          end
        end
        makeMap()
        updateMap()
        
      end
    
    elseif not(currentMap[info[file].posx][info[file].posy - 1] == nil)
    and not(currentMap[info[file].posx][info[file].posy + 1] == nil)
    and currentMap[info[file].posx][info[file].posy + 1] == "Pull Rock" then
      
      if currentMap[info[file].posx][info[file].posy - 1] == "Push Rock"
      or currentMap[info[file].posx][info[file].posy - 1] == "Pull Rock"
      or currentMap[info[file].posx][info[file].posy - 1] == "Fake Pull Rock"
      or currentMap[info[file].posx][info[file].posy - 1] == "Stacked Rock"
      or currentMap[info[file].posx][info[file].posy - 1] == "Void"
      or currentMap[info[file].posx][info[file].posy - 1] == "Second Floor Rock" then
        return
      else
        
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy] = "Pull Rock"
        info[file].cave[info[file].map.subid][info[file].posx][info[file].posy + 1] = "Floor"
        you.y = you.y - 30
        info[file].posy = info[file].posy - 1

        makeMap()
        updateMap()
        
      end              
    end
  end
end

function pushStatue(index)
  
  if info[file].dir == "Up" then
    
    if not(currentMap[info[file].posx][info[file].posy - 2] == nil) then
      
      if currentMap[info[file].posx][info[file].posy - 2] == "Exit"
      or currentMap[info[file].posx][info[file].posy - 2] == "Exit Pier"
      or currentMap[info[file].posx][info[file].posy - 2] == "Floor" then
        
        info[file].interactibles[6][1][index].posy = info[file].interactibles[6][1][index].posy - 1
        updateMap()
        
      end
    end
  
  elseif info[file].dir == "Left" then
    
    if not(currentMap[info[file].posx - 2] == nil) then
      
      if currentMap[info[file].posx - 2][info[file].posy] == "Exit"
      or currentMap[info[file].posx - 2][info[file].posy] == "Exit Pier"
      or currentMap[info[file].posx - 2][info[file].posy] == "Floor" then
        
        info[file].interactibles[6][1][index].posx = info[file].interactibles[6][1][index].posx - 1
        updateMap()
        
      end
    end
  
  elseif info[file].dir == "Down" then
    
    if not(currentMap[info[file].posx][info[file].posy + 2] == nil) then
      
      if currentMap[info[file].posx][info[file].posy + 2] == "Exit"
      or currentMap[info[file].posx][info[file].posy + 2] == "Exit Pier"
      or currentMap[info[file].posx][info[file].posy + 2] == "Floor" then
        
        info[file].interactibles[6][1][index].posy = info[file].interactibles[6][1][index].posy + 1
        updateMap()
        
      end
    end
    
  elseif info[file].dir == "Right" then
    
    if not(currentMap[info[file].posx + 2][info[file].posy] == nil) then
      
      if currentMap[info[file].posx + 2][info[file].posy] == "Exit"
      or currentMap[info[file].posx + 2][info[file].posy] == "Exit Pier"
      or currentMap[info[file].posx + 2][info[file].posy] == "Floor" then
        
        info[file].interactibles[6][1][index].posx = info[file].interactibles[6][1][index].posx + 1
        updateMap()
        
      end
    end
  
  end
  
end

function warpAction()
  
  local pos = 0
  local des = 0
  local nm = ""
  
  if info[file].posx == 2 and info[file].posy == 2 then
    pos = 1
  elseif info[file].posx == 8 and info[file].posy == 2 then
    pos = 2
  elseif info[file].posx == 2 and info[file].posy == 8 then
    pos = 3
  elseif info[file].posx == 8 and info[file].posy == 8 then
    pos = 4
  elseif info[file].posx == 5 and info[file].posy == 1 then
    pos = 5
  elseif info[file].posx == 5 and info[file].posy == 9 then
    pos = 6
  end
  
  if info[file].map.subid == 5 then -- Warp House 1
    
    if pos == 1 then
      des = 16
    elseif pos == 2 then
      des = 13
    end
    
  elseif info[file].map.subid == 6 then
    
    if pos == 2 then
      des = 15
    elseif pos == 4 then
      des = 14
    end
    
  elseif info[file].map.subid == 7 then
    
    if pos == 3 then
      des = 17
    elseif pos == 4 then
      des = 9
    end
    
  elseif info[file].map.subid == 8 then
    
    if pos == 1 then
      des = 9
    elseif pos == 3 then
      des = 15
    end
    
  elseif info[file].map.subid == 9 then
    
    if pos == 1 then
      des = 8 
    elseif pos == 2 then
      des = 12
    elseif pos == 4 then
      des = 7
    end
    
  elseif info[file].map.subid == 10 then
    
    if pos == 2 then
      des = 6
    elseif pos == 3 then
      des = 14
    elseif pos == 4 then
      des = 17
    end
    
  elseif info[file].map.subid == 11 then
    
    if pos == 1 then
      des = 13
    elseif pos == 3 then
      des = 10
    elseif pos == 4 then
      des = 16
    end
  
  elseif info[file].map.subid == 12 then
  
    if pos == 1 then
      des = 5
    elseif pos == 2 then
      des = 9
    elseif pos == 3 then
      des = 16
    end
    
  elseif info[file].map.subid == 13 then
    
    if pos == 1 then
      des = 11
    elseif pos == 2 then
      des = 5
    elseif pos == 3 then
      des = 17
    elseif pos == 4 then
      des = 17
    end
    
  elseif info[file].map.subid == 14 then
    
    if pos == 1 then
      des = 15
    elseif pos == 2 then
      des = 16
    elseif pos == 3 then
      des = 11
    elseif pos == 4 then
      des = 6
    end
    
  elseif info[file].map.subid == 15 then
    
    if pos == 1 then
      des = 14
    elseif pos == 2 then
      des = 10
    elseif pos == 3 then
      des = 8
    elseif pos == 4 then
      des = 0
    elseif pos == 5 then
      des = 16
    end
    
  elseif info[file].map.subid == 16 then
    
    if pos == 1 then
      des = 12
    elseif pos == 2 then
      des = 14
    elseif pos == 3 then
      des = 12
    elseif pos == 4 then
      des = 11
    elseif pos == 5 then
      des = 15
    elseif pos == 6 then
      des = 18
    end
    
  end
  
  if des == 5 then
    nm = "I"
  elseif des == 6 then
    nm = "II"
  elseif des == 7 then
    nm = "III"
  elseif des == 8 then
    nm = "IV"
  elseif des == 9 then
    nm = "V"
  elseif des == 10 then
    nm = "VI"
  elseif des == 11 then
    nm = "VII"
  elseif des == 12 then
    nm = "VIII"
  elseif des == 13 then
    nm = "IX"
  elseif des == 14 then
    nm = "X"
  elseif des == 15 then
    nm = "XI"
  elseif des == 16 then
    nm = "XII"
  elseif des == 17 then
    nm = "XIII"
  elseif des == 18 then
    nm = "?"
  end
  
  if des == 0 then
    oneText("Capstone Tiles/Warp.png", "It doesn't seem to be working...")
  else
    
    local dup = false
    
    for i = 1, 10 do
      if info[file].prog.town.warp[i] == nm then
        dup = true
      end
    end
    
    if not dup then
      
      local changed = false
      
      for i = 1, 10 do
        if info[file].prog.town.warp[i] == "O" then
          info[file].prog.town.warp[i] = nm
          changed = true
          break
        end
      end
      
      if not changed then
        
        for i = 1, 9 do
          info[file].prog.town.warp[i] = info[file].prog.town.warp[i + 1]
        end
        info[file].prog.town.warp[10] = nm
        
      end
      
    end

    redoMap("Town", info[file].map.realname, "Warp House", 2, des, info[file].posx, info[file].posy, info[file].centerx, info[file].centery, info[file].dir)
  end
    
end