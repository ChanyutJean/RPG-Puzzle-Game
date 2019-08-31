function makeInteractibles()
  
  if info[file].interactibles[info[file].map.id] == nil then -- no interactibles
    return
  elseif info[file].interactibles[info[file].map.id][info[file].map.subid] == nil then
    return
  else

    local interactiblesList = info[file].interactibles[info[file].map.id][info[file].map.subid]
      
    interactibles = {}
      
    interactibles[0] = interactiblesList[0]
      
    for i = 1, interactibles[0] do
      if interactiblesList[i].posx > info[file].centerx - 5 -- in the frame
      and interactiblesList[i].posx < info[file].centerx + 5
      and interactiblesList[i].posy > info[file].centery - 5
      and interactiblesList[i].posy < info[file].centery + 5 then
        
        if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
          interactibles[i] = display.newImageRect("Capstone Interactibles/"..info[file].interactibles[info[file].map.id][info[file].map.subid][i].name..".png", 32, 40)
          interactibles[i].x = (interactiblesList[i].posx - (info[file].centerx - 5)) * 30 + 10
          interactibles[i].y = (interactiblesList[i].posy - (info[file].centery - 5)) * 30
          interactibles[i].NPC = true
        else
          interactibles[i] = display.newImageRect("Capstone Interactibles/"..info[file].interactibles[info[file].map.id][info[file].map.subid][i].name..".png", 30, 30)
          interactibles[i].x = (interactiblesList[i].posx - (info[file].centerx - 5)) * 30 + 10
          interactibles[i].y = (interactiblesList[i].posy - (info[file].centery - 5)) * 30 + 10
          interactibles[i].NPC = false
        end
        
        local interName = info[file].interactibles[info[file].map.id][info[file].map.subid][i].name
        
        if interName == "Capstone" then
          interactibles[i]:addEventListener("tap", capstoneTextbox)
        elseif interName == "Light - Off" then
          interactibles[i]:addEventListener("tap", lightOffTextbox)
        elseif interName == "Light - On" then
          interactibles[i]:addEventListener("tap", lightOnTextbox)
        elseif interName == "Lock" then
          interactibles[i]:addEventListener("tap", lockTextbox)
        elseif interName == "Snow Climb" then
          interactibles[i]:addEventListener("tap", snowClimbTextbox)
        elseif interName == "Starry" then
          interactibles[i]:addEventListener("tap", starryTextbox)
        elseif interName == "Statue" then
          interactibles[i]:addEventListener("tap", statueTextbox)
        elseif interName == "Trophy" then
          interactibles[i]:addEventListener("tap", trophyTextbox)
        elseif interName == "Volcano Climb" then
          interactibles[i]:addEventListener("tap", volcanoClimbTextbox)
        end
      end
    end
  end
      
end

function deleteInteractibles() 
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then
        interactibles[i]:removeSelf()
        interactibles[i] = nil
      end
    end
    interactibles = nil
  end

end

function deleteLaser()
  
  if not (laserImg == nil) then
    for i = 1, #laserImg do
      if not (laserImg[i] == nil) then
        laserImg[i]:removeSelf()
        laserImg[i] = nil
      end
    end
  end
  
  laserTiles = nil
    
end

function makeLaser()
  
  laserImg = {}
    
  info[file].numLaser = 0
  
  for i = 1, 43 do -- make laser
    
    local collidedWithStatue = false

    for j = 1, info[file].laser[i].len do -- enumerate tiles
      
      if not (collidedWithStatue) then
      
        for k = 1, 6 do -- check statue collision
          
          if not(collidedWithStatue) then
          
            if info[file].laser[i].curdir == "W" then
                
              if info[file].laser[i].posx == info[file].interactibles[6][1][k].posx
              and info[file].laser[i].posy - j == info[file].interactibles[6][1][k].posy then
                collidedWithStatue = true
                
               info[file].numLaser = info[file].numLaser + 1
                
                laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
                laserImg[info[file].numLaser].posx = info[file].laser[i].posx
                laserImg[info[file].numLaser].posy = info[file].laser[i].posy - j
                laserImg[info[file].numLaser].x = (info[file].laser[i].posx - (info[file].centerx - 5)) * 30 + 10
                laserImg[info[file].numLaser].y = (info[file].laser[i].posy - j) * 30 + 10
                laserImg[info[file].numLaser].rotation = 90
                
              end  
              
            elseif info[file].laser[i].curdir == "A" then
                
              if info[file].laser[i].posx - j == info[file].interactibles[6][1][k].posx
              and info[file].laser[i].posy == info[file].interactibles[6][1][k].posy then
                collidedWithStatue = true   
                
                info[file].numLaser = info[file].numLaser + 1
                
                laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
                laserImg[info[file].numLaser].posx = info[file].laser[i].posx - j
                laserImg[info[file].numLaser].posy = info[file].laser[i].posy
                laserImg[info[file].numLaser].x = (info[file].laser[i].posx - j - (info[file].centerx - 5)) * 30 + 10
                laserImg[info[file].numLaser].y = (info[file].laser[i].posy) * 30 + 10
                laserImg[info[file].numLaser].rotation = 0
                
              end
              
            elseif info[file].laser[i].curdir == "S" then
                
              if info[file].laser[i].posx == info[file].interactibles[6][1][k].posx
              and info[file].laser[i].posy + j == info[file].interactibles[6][1][k].posy then
                collidedWithStatue = true
                
                info[file].numLaser = info[file].numLaser + 1
                
                laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
                laserImg[info[file].numLaser].posx = info[file].laser[i].posx
                laserImg[info[file].numLaser].posy = info[file].laser[i].posy + j
                laserImg[info[file].numLaser].x = (info[file].laser[i].posx - (info[file].centerx - 5)) * 30 + 10
                laserImg[info[file].numLaser].y = (info[file].laser[i].posy + j) * 30 + 10
                laserImg[info[file].numLaser].rotation = 270
                
              end
              
            elseif info[file].laser[i].curdir == "D" then
              
              if info[file].laser[i].posx + j == info[file].interactibles[6][1][k].posx
              and info[file].laser[i].posy == info[file].interactibles[6][1][k].posy then
                collidedWithStatue = true  
                
                info[file].numLaser = info[file].numLaser + 1
                
                laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
                laserImg[info[file].numLaser].posx = info[file].laser[i].posx + j
                laserImg[info[file].numLaser].posy = info[file].laser[i].posy
                laserImg[info[file].numLaser].x = (info[file].laser[i].posx + j - (info[file].centerx - 5)) * 30 + 10
                laserImg[info[file].numLaser].y = (info[file].laser[i].posy) * 30 + 10
                laserImg[info[file].numLaser].rotation = 180

              end
            
            end
          end
        end
        
        if not(collidedWithStatue) then
          
          info[file].numLaser = info[file].numLaser + 1
          
          if info[file].laser[i].curdir == "W" then
            
            if j == info[file].laser[i].len then
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
            else
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser.png", 30, 30)
            end
            
            laserImg[info[file].numLaser].posx = info[file].laser[i].posx
            laserImg[info[file].numLaser].posy = info[file].laser[i].posy - j
            laserImg[info[file].numLaser].x = (info[file].laser[i].posx - (info[file].centerx - 5)) * 30 + 10
            laserImg[info[file].numLaser].y = (info[file].laser[i].posy - j) * 30 + 10
            laserImg[info[file].numLaser].rotation = 90
            
          elseif info[file].laser[i].curdir == "A" then
                  
            if j == info[file].laser[i].len then
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
            else
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser.png", 30, 30)
            end
            
            laserImg[info[file].numLaser].posx = info[file].laser[i].posx - j
            laserImg[info[file].numLaser].posy = info[file].laser[i].posy
            laserImg[info[file].numLaser].x = (info[file].laser[i].posx - j - (info[file].centerx - 5)) * 30 + 10
            laserImg[info[file].numLaser].y = (info[file].laser[i].posy) * 30 + 10
            laserImg[info[file].numLaser].rotation = 0       
          
          elseif info[file].laser[i].curdir == "S" then
                  
            if j == info[file].laser[i].len then
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
            else
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser.png", 30, 30)
            end
            
            laserImg[info[file].numLaser].posx = info[file].laser[i].posx
            laserImg[info[file].numLaser].posy = info[file].laser[i].posy + j
            laserImg[info[file].numLaser].x = (info[file].laser[i].posx - (info[file].centerx - 5)) * 30 + 10
            laserImg[info[file].numLaser].y = (info[file].laser[i].posy + j) * 30 + 10
            laserImg[info[file].numLaser].rotation = 270
          
          elseif info[file].laser[i].curdir == "D" then
                
            if j == info[file].laser[i].len then
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser Head.png", 30, 30)
            else
              laserImg[info[file].numLaser] = display.newImageRect("Capstone Interactibles/Laser.png", 30, 30)
            end
            
            laserImg[info[file].numLaser].posx = info[file].laser[i].posx + j
            laserImg[info[file].numLaser].posy = info[file].laser[i].posy
            laserImg[info[file].numLaser].x = (info[file].laser[i].posx + j - (info[file].centerx - 5)) * 30 + 10
            laserImg[info[file].numLaser].y = (info[file].laser[i].posy) * 30 + 10
            laserImg[info[file].numLaser].rotation = 180

          end
        end
      end
    end
  end

  for i = 1, info[file].numLaser do
    
    if laserImg[i].posx <= info[file].centerx - 5
    or laserImg[i].posx >= info[file].centerx + 5 then
      laserImg[i]:removeSelf()
      laserImg[i] = nil
    end
    
  end

end

function createLaser()
  
  local list = {}
  
  local num = 1
  
  for i = 1, text[6][1][0].lenx do -- execute columns first
    for j = 1, text[6][1][0].leny do
      if text[6][1][j]:sub(i, i) == "R" then -- is dessert
        list[num] = {}
        list[num].posx = i
        list[num].posy = j
        
        num = num + 1
      end
    end
  end
  
  list[1].dir  = "WASD"
  list[1].len  = 2
  list[2].dir  = "WXXD"
  list[2].len  = 1
  list[3].dir  = "XASX"
  list[3].len  = 1
  list[4].dir  = "WASD"
  list[4].len  = 1
  list[5].dir  = "WASD"
  list[5].len  = 2
  list[6].dir  = "XAXD"
  list[6].len  = 5
  list[7].dir  = "WASD"
  list[7].len  = 1
  list[8].dir  = "XAXD"
  list[8].len  = 3
  list[9].dir  = "WXXX"
  list[9].len  = 3
  list[10].dir = "XXSX"
  list[10].len = 3
  
  list[11].dir = "XAXX"
  list[11].len = 3
  list[12].dir = "XAXX"
  list[12].len = 3
  list[13].dir = "XXSD"
  list[13].len = 1
  list[14].dir = "WASD"
  list[14].len = 1
  list[15].dir = "XXSD"
  list[15].len = 2
  list[16].dir = "WASD"
  list[16].len = 1
  list[17].dir = "XAXD"
  list[17].len = 2
  list[18].dir = "XAXX"
  list[18].len = 4
  list[19].dir = "WASD"
  list[19].len = 1
  list[20].dir = "XXSX"
  list[20].len = 1
  
  list[21].dir = "XXSD"
  list[21].len = 4
  list[22].dir = "WASD"
  list[22].len = 2
  list[23].dir = "WASD"
  list[23].len = 2
  list[24].dir = "WASD"
  list[24].len = 2
  list[25].dir = "WASD"
  list[25].len = 1
  list[26].dir = "WXSX"
  list[26].len = 1
  list[27].dir = "WXXD"
  list[27].len = 2
  list[28].dir = "WASD"
  list[28].len = 1
  list[29].dir = "XAXX"
  list[29].len = 7
  list[30].dir = "WASD"
  list[30].len = 1
  
  list[31].dir = "WASD"
  list[31].len = 1
  list[32].dir = "WXXD"
  list[32].len = 4
  list[33].dir = "XAXX"
  list[33].len = 2
  list[34].dir = "XAXX"
  list[34].len = 2
  list[35].dir = "XXXD"
  list[35].len = 2
  list[36].dir = "WASD"
  list[36].len = 2
  list[37].dir = "WASD"
  list[37].len = 2
  list[38].dir = "WXXX"
  list[38].len = 1
  list[39].dir = "WASD"
  list[39].len = 1
  list[40].dir = "XASD"
  list[40].len = 2
  
  list[41].dir = "WASX"
  list[41].len = 4
  list[42].dir = "WXXX"
  list[42].len = 2
  list[43].dir = "WXXX"
  list[43].len = 2
  
  for i = 1, 43 do
    for j = 1, 4 do
      if not(list[i].dir:sub(j, j) == "X") then
        list[i].curdir = list[i].dir:sub(j, j)
        break
      end
    end
  end
  
  return list
  
end

function createInteractibles()
  
  local list = {}
  
  -- 1. Cave Interactibles
  
  list[1] = {}
  
  -- 1.1 Old Man
  
  list[1][1] = {}
  list[1][1][0] = 1
  
  list[1][1][1] = {}
  list[1][1][1].name = "NPC - Old Man"
  list[1][1][1].posx = 21
  list[1][1][1].posy = 8
  
  -- 1.5 Trophy
  
  list[1][5] = {}
  list[1][5][0] = 1
  
  list[1][5][1] = {}
  list[1][5][1].name = "Trophy"
  list[1][5][1].posx = 8
  list[1][5][1].posy = 8
  
  -- 2. Town Interactibles
  
  list[2] = {}
  
  -- 2.1 Town Square
  
  list[2][1] = {}
  list[2][1][0] = 4
  
  list[2][1][1] = {}
  list[2][1][1].name = "NPC - RM Button"
  list[2][1][1].posx = 5
  list[2][1][1].posy = 8
  
  list[2][1][2] = {}
  list[2][1][2].name = "NPC - GM Tie"
  list[2][1][2].posx = 6
  list[2][1][2].posy = 8
  
  list[2][1][3] = {}
  list[2][1][3].name = "NPC - BM Right"
  list[2][1][3].posx = 1
  list[2][1][3].posy = 5
  
  list[2][1][4] = {}
  list[2][1][4].name = "NPC - BM Shirt"
  list[2][1][4].posx = 8
  list[2][1][4].posy = 5
  
  -- 2.2 Town Square Ruins

  list[2][2] = {}
  list[2][2][0] = 5
  
  list[2][2][1] = {}
  list[2][2][1].name = "NPC - Denial"
  list[2][2][1].posx = 3
  list[2][2][1].posy = 6
  
  list[2][2][2] = {}
  list[2][2][2].name = "NPC - Anger"
  list[2][2][2].posx = 5
  list[2][2][2].posy = 3
  
  list[2][2][3] = {}
  list[2][2][3].name = "NPC - Depression"
  list[2][2][3].posx = 7
  list[2][2][3].posy = 5
  
  list[2][2][4] = {}
  list[2][2][4].name = "NPC - Bargaining"
  list[2][2][4].posx = 6
  list[2][2][4].posy = 7
  
  list[2][2][5] = {}
  list[2][2][5].name = "NPC - Acceptance"
  list[2][2][5].posx = 6
  list[2][2][5].posy = 9
  
  -- 2.4 Bar
  
  list[2][4] = {}
  list[2][4][0] = 4
  
  list[2][4][1] = {}
  list[2][4][1].name = "NPC - GM Shirt"
  list[2][4][1].posx = 3
  list[2][4][1].posy = 2
  
  list[2][4][2] = {}
  list[2][4][2].name = "NPC - BM Shirt"
  list[2][4][2].posx = 5
  list[2][4][2].posy = 2
  
  list[2][4][3] = {}
  list[2][4][3].name = "NPC - RM Tie"
  list[2][4][3].posx = 6
  list[2][4][3].posy = 6
  
  list[2][4][4] = {}
  list[2][4][4].name = "NPC - Town Boss"
  list[2][4][4].posx = 0
  list[2][4][4].posy = 0
  
  -- 2.18 Trophy
  
  list[2][18] = {}
  list[2][18][0] = 1
  
  list[2][18][1] = {}
  list[2][18][1].name = "Trophy"
  list[2][18][1].posx = 5
  list[2][18][1].posy = 3
  
  -- 3. Plains Interactibles
  
  list[3] = {}
  
  -- 3.1 Trophy
  
  list[3][1] = {}
  list[3][1][0] = 1
  
  list[3][1][1] = {}
  list[3][1][1].name = "Trophy"
  list[3][1][1].posx = 31
  list[3][1][1].posy = 31
  
  -- 4. Temple Interactibles
  
  list[4] = {}
  
  -- 4.1 First Floor
  
  list[4][1] = {}
  list[4][1][0] = 4
  
  list[4][1][1] = {}
  list[4][1][1].name = "Light - Off"
  list[4][1][1].posx = 2
  list[4][1][1].posy = 2
  
  list[4][1][2] = {}
  list[4][1][2].name = "Light - Off"
  list[4][1][2].posx = 2
  list[4][1][2].posy = 8
  
  list[4][1][3] = {}
  list[4][1][3].name = "Light - Off"
  list[4][1][3].posx = 8
  list[4][1][3].posy = 8
  
  list[4][1][4] = {}
  list[4][1][4].name = "Light - Off"
  list[4][1][4].posx = 8
  list[4][1][4].posy = 2
  
  -- 4.2 Room 1
  
  list[4][2] = {}
  list[4][2][0] = 1
  
  list[4][2][1] = {}
  list[4][2][1].name = "Light - Off"
  list[4][2][1].posx = 3
  list[4][2][1].posy = 3
  
  -- 4.3 Room 2
  
  list[4][3] = {}
  list[4][3][0] = 1
  
  list[4][3][1] = {}
  list[4][3][1].name = "Light - Off"
  list[4][3][1].posx = 2
  list[4][3][1].posy = 2
  
  -- 4.4 Room 3
  
  list[4][4] = {}
  list[4][4][0] = 1
  
  list[4][4][1] = {}
  list[4][4][1].name = "Light - Off"
  list[4][4][1].posx = 4
  list[4][4][1].posy = 4
  
  -- 4.5 Room 4
  
  list[4][5] = {}
  list[4][5][0] = 1
  
  list[4][5][1] = {}
  list[4][5][1].name = "Light - Off"
  list[4][5][1].posx = 4
  list[4][5][1].posy = 8
  
  -- 4.6 Second Floor
  
  list[4][6] = {}
  list[4][6][0] = 6
  
  list[4][6][1] = {}
  list[4][6][1].name = "Light - Off"
  list[4][6][1].posx = 2
  list[4][6][1].posy = 2
  
  list[4][6][2] = {}
  list[4][6][2].name = "Light - Off"
  list[4][6][2].posx = 8
  list[4][6][2].posy = 2
  
  list[4][6][3] = {}
  list[4][6][3].name = "Lock"
  list[4][6][3].posx = 3
  list[4][6][3].posy = 5
  
  list[4][6][4] = {}
  list[4][6][4].name = "Lock"
  list[4][6][4].posx = 7
  list[4][6][4].posy = 5
  
  list[4][6][5] = {}
  list[4][6][5].name = "Lock"
  list[4][6][5].posx = 5
  list[4][6][5].posy = 7
  
  list[4][6][6] = {}
  list[4][6][6].name = "Lock"
  list[4][6][6].posx = 5
  list[4][6][6].posy = 9
  
  -- 4.7 Room 5
  
  list[4][7] = {}
  list[4][7][0] = 1

  list[4][7][1] = {}
  list[4][7][1].name = "Light - Off"
  list[4][7][1].posx = 8
  list[4][7][1].posy = 4
  
  -- 4.8 Room 6
  
  list[4][8] = {}
  list[4][8][0] = 1

  list[4][8][1] = {}
  list[4][8][1].name = "Light - Off"
  list[4][8][1].posx = 4
  list[4][8][1].posy = 7
  
  -- 4.9 Room 7
  
  list[4][9] = {}
  list[4][9][0] = 1

  list[4][9][1] = {}
  list[4][9][1].name = "Light - Off"
  list[4][9][1].posx = 9
  list[4][9][1].posy = 4
  
  -- 4.10 Room 8
  
  list[4][10] = {}
  list[4][10][0] = 1
  
  list[4][10][1] = {}
  list[4][10][1].name = "Light - Off"
  list[4][10][1].posx = 2
  list[4][10][1].posy = 5
  
  -- 4.11 Room 9
  
  list[4][11] = {}
  list[4][11][0] = 1
  
  list[4][11][1] = {}
  list[4][11][1].name = "Light - Off"
  list[4][11][1].posx = 1
  list[4][11][1].posy = 9
  
  -- 4.12 Room 10
  
  list[4][12] = {}
  list[4][12][0] = 1
  
  list[4][12][1] = {}
  list[4][12][1].name = "Light - Off"
  list[4][12][1].posx = 8
  list[4][12][1].posy = 7
  
  -- 4.13 Trophy
  
  list[4][13] = {}
  list[4][13][0] = 2
  
  list[4][13][1] = {}
  list[4][13][1].name = "NPC - Quizmaster"
  list[4][13][1].posx = 3
  list[4][13][1].posy = 3
  
  list[4][13][2] = {}
  list[4][13][2].name = "Trophy"
  list[4][13][2].posx = 0
  list[4][13][2].posy = 0
  
  -- 5. Volcano Interactibles
  
  list[5] = {}
  
  -- 5.1 Exterior
  
  list[5][1] = {}
  list[5][1][0] = 1
  
  list[5][1][1] = {}
  list[5][1][1].name = "Lock"
  list[5][1][1].posx = 39
  list[5][1][1].posy = 11
  
  -- 5.2 Cave 1
  
  list[5][2] = {}
  list[5][2][0] = 1
  
  list[5][2][1] = {}
  list[5][2][1].name = "Lock"
  list[5][2][1].posx = 1
  list[5][2][1].posy = 5

  -- 5.3 Cave 2
  
  list[5][3] = {}
  list[5][3][0] = 1
  
  list[5][3][1] = {}
  list[5][3][1].name = "Volcano Climb"
  list[5][3][1].posx = 5
  list[5][3][1].posy = 5
  
  -- 5.4 Cave 3
  
  list[5][4] = {}
  list[5][4][0] = 3
  
  list[5][4][1] = {}
  list[5][4][1].name = "Lock"
  list[5][4][1].posx = 5
  list[5][4][1].posy = 5
  
  list[5][4][2] = {}
  list[5][4][2].name = "Lock"
  list[5][4][2].posx = 9
  list[5][4][2].posy = 5
  
  list[5][4][3] = {}
  list[5][4][3].name = "Lock"
  list[5][4][3].posx = 13
  list[5][4][3].posy = 5
  
  -- 5.5 Cave 4
  
  list[5][5] = {}
  list[5][5][0] = 1
  
  list[5][5][1] = {}
  list[5][5][1].name = "Lock"
  list[5][5][1].posx = 9
  list[5][5][1].posy = 2
  
  -- 5.6 Cave 5
  
  list[5][6] = {}
  list[5][6][0] = 3
  
  list[5][6][1] = {}
  list[5][6][1].name = "Lock"
  list[5][6][1].posx = 17
  list[5][6][1].posy = 5
  
  list[5][6][2] = {}
  list[5][6][2].name = "Lock"
  list[5][6][2].posx = 9
  list[5][6][2].posy = 5
  
  list[5][6][3] = {}
  list[5][6][3].name = "Lock"
  list[5][6][3].posx = 1
  list[5][6][3].posy = 5
  
   -- 5.7 Cave 6
  
  list[5][7] = {}
  list[5][7][0] = 1
  
  list[5][7][1] = {}
  list[5][7][1].name = "Lock"
  list[5][7][1].posx = 5
  list[5][7][1].posy = 2
  
   -- 5.8 Cave 7
  
  list[5][8] = {}
  list[5][8][0] = 1
  
  list[5][8][1] = {}
  list[5][8][1].name = "Lock"
  list[5][8][1].posx = 9
  list[5][8][1].posy = 2
  
  -- 5.9 Master Cave
  
  list[5][9] = {}
  list[5][9][0] = 2
  
  list[5][9][1] = {}
  list[5][9][1].name = "Lock"
  list[5][9][1].posx = 1
  list[5][9][1].posy = 9
  
  list[5][9][2] = {}
  list[5][9][2].name = "Lock"
  list[5][9][2].posx = 1
  list[5][9][2].posy = 10
  
  -- 5.10 Trophy Cave
  
  list[5][10] = {}
  list[5][10][0] = 1
  
  list[5][10][1] = {}
  list[5][10][1].name = "Trophy"
  list[5][10][1].posx = 5
  list[5][10][1].posy = 5
  
  -- 6. Desert Interactibles
  
  list[6] = {}
  
  -- 6.1 Statues
  
  list[6][1] = {}
  list[6][1][0] = 6
  
  list[6][1][1] = {}
  list[6][1][1].name = "Statue"
  list[6][1][1].posx = 18
  list[6][1][1].posy = 5
  
  list[6][1][2] = {}
  list[6][1][2].name = "Statue"
  list[6][1][2].posx = 26
  list[6][1][2].posy = 3
  
  list[6][1][3] = {}
  list[6][1][3].name = "Statue"
  list[6][1][3].posx = 34
  list[6][1][3].posy = 2

  list[6][1][4] = {}
  list[6][1][4].name = "Statue"
  list[6][1][4].posx = 46
  list[6][1][4].posy = 8
  
  list[6][1][5] = {}
  list[6][1][5].name = "Statue"
  list[6][1][5].posx = 58
  list[6][1][5].posy = 5
  
  list[6][1][6] = {}
  list[6][1][6].name = "Statue"
  list[6][1][6].posx = 66
  list[6][1][6].posy = 2
  
  -- 6.2 Trophy
  
  list[6][2] = {}
  list[6][2][0] = 1
  
  list[6][2][1] = {}
  list[6][2][1].name = "Trophy"
  list[6][2][1].posx = 5
  list[6][2][1].posy = 7
  
  -- 7. Metropolis Interactibles
  
  list[7] = {}
  
  -- 7.1 Metropolis
  
  list[7][1] = {}
  list[7][1][0] = 0
  
  -- 8. Alp Interactibles
  
  list[8] = {}
  
  -- 8.2 Cave 2
  
  list[8][3] = {}
  list[8][3][0] = 1
  
  list[8][3][1] = {}
  list[8][3][1].name = "Snow Climb"
  list[8][3][1].posx = 5
  list[8][3][1].posy = 5
  
  -- 8.9 Trophy
  
  list[8][9] = {}
  list[8][9][0] = 1
  
  list[8][9][1] = {}
  list[8][9][1].name = "Trophy"
  list[8][9][1].posx = 5
  list[8][9][1].posy = 5
  
  -- 9. Ruins Interactibles
  
  list[9] = {}
  
  -- 9.16 Trophy
  
  list[9][16] = {}
  list[9][16][0] = 2
  
  list[9][16][1] = {}
  list[9][16][1].name = "Trophy"
  list[9][16][1].posx = 0 -- skip trophy
  list[9][16][1].posy = 0
  
  list[9][16][2] = {}
  list[9][16][2].name = "Capstone"
  list[9][16][2].posx = 0 -- skip capstone
  list[9][16][2].posy = 0
  
  return list
  
end