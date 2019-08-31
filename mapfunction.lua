function buildYou()
  you = display.newImageRect("Capstone Interactibles/You - Down.png", 32, 40)
  you.x = 160
  you.y = 150
end
-- center; x = 160, y = 150

function nextIntro1()
  
  title:removeSelf()
  title = nil
  option1:removeSelf()
  option1 = nil
  option2:removeSelf()
  option2 = nil
  intro = display.newImageRect("Capstone Interface/Welcome.png", 360, 480)
  intro.x = 180
  intro.y = 240
  intro:addEventListener("tap", nextIntro2)

end

function nextIntro2()
  
  intro:removeSelf()
  intro = nil
  intro = display.newImageRect("Capstone Interface/Tutorial.png", 360, 480)
  intro.x = 180
  intro.y = 240
  intro:addEventListener("tap", nextIntro3)
  
end

function nextIntro3()
  
  intro:removeSelf()
  intro = nil
  intro = display.newImageRect("Capstone Interface/Instructions.png", 360, 480)
  intro.x = 160
  intro.y = 240
  intro:addEventListener("tap", nextIntro4)
  
end

function nextIntro4()
  
  intro:removeSelf()
  intro = nil
  
  buildInterface()
  
  info = createSave()
  file = 1
  
  title = display.newText("realname - subname", 160, 15, native.systemFont, 15)
  
  buildYou()
  redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 12, 5, 12, 5, "Down")
  
end

function finishGame()
  title:removeSelf()
  title = nil
  title = display.newText("Congratulations! You completed the stage.", 160, 15, native.systemFont, 15)
  congrats = display.newImageRect("Capstone Interactibles/Trophy.png", 270, 270)
  congrats.x = 160
  congrats.y = 160
  congrats.alpha = 0.85
  up:removeSelf()
  up = nil
  down:removeSelf()
  down = nil
  left:removeSelf()
  left = nil
  right:removeSelf()
  right = nil
  act:removeSelf()
  act = nil
  menu:removeSelf()
  menu = nil
  advlog:removeSelf()
  advlog = nil
  save1:removeSelf()
  save1 = nil
  save2:removeSelf()
  save2 = nil
  save3:removeSelf()
  save3 = nil
  save4:removeSelf()
  save4 = nil
  save5:removeSelf()
  save5 = nil
  oneText("Capstone Interactibles/Starry.png", "To play another stage, restart the game.")
end

function changeStage(level, name)
  numStage = level
    
  title:removeSelf()
  title = nil
  title = display.newText("Level "..level..": "..name, 160, 50, native.systemFontBold, 20)
  
  stageImg:removeSelf()
  stageImg = nil
  stageImg = display.newImageRect("Capstone Interface/Background - "..name..".png", 270, 270)
  stageImg.x = 160
  stageImg.y = 200

end

function prevStage()
  if numStage == 1 then
    changeStage(8, "Void")
  elseif numStage == 2 then
    changeStage(1, "Plains")
  elseif numStage == 3 then
    changeStage(2, "Temple")
  elseif numStage == 4 then
    changeStage(3, "Volcano")
  elseif numStage == 5 then
    changeStage(4, "Alp")
  elseif numStage == 6 then
    changeStage(5, "Desert")
  elseif numStage == 7 then
    changeStage(6, "Ruins")
  elseif numStage == 8 then
    changeStage(7, "Cave")
  end
end

function nextStage()
  if numStage == 1 then
    changeStage(2, "Temple")
  elseif numStage == 2 then
    changeStage(3, "Volcano")
  elseif numStage == 3 then
    changeStage(4, "Alp")
  elseif numStage == 4 then
    changeStage(5, "Desert")
  elseif numStage == 5 then
    changeStage(6, "Ruins")
  elseif numStage == 6 then
    changeStage(7, "Cave")
  elseif numStage == 7 then
    changeStage(8, "Void")
  elseif numStage == 8 then
    changeStage(1, "Plains")
  end
end

function startGame()
  
  title:removeSelf()
  title = nil
  stageImg:removeSelf()
  stageImg = nil
  left:removeSelf()
  left = nil
  play:removeSelf()
  play = nil
  right:removeSelf()
  right = nil
  
  buildInterface()
  
  info = createSave()
  file = 1
  
  title = display.newText("realname - subname", 160, 15, native.systemFont, 15)
  
  buildYou()
  if numStage == 1 then
    redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 26, 51, 26, 47, "Down")
  elseif numStage == 2 then
    redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 9, 5, 5, "Down")
  elseif numStage == 3 then
    redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 15, 33, 15, "Down")
  elseif numStage == 4 then
    redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 15, 38, 15, "Down")
  elseif numStage == 5 then
    redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 1, 1, 5, 5, "Down")
  elseif numStage == 6 then
    redoMap("Ruins", "Relic Ruins", "1F, South Sector", 9, 1, 5, 9, 5, 5, "Down")
  elseif numStage == 7 then
    info[1].prog.cave.tutorial = false
    info[1].prog.cave.power = true
    redoMap("Cave", "Crypt Cave", "Trial of Tenacity", 1, 5, 8, 8, 5, 5, "Down")
    --redoMap("Cave", "Crypt Cave", "Trial of Insight", 1, 2, 5, 1, 5, 5, "Down")
    insightTrialText()
  elseif numStage == 8 then
    redoMap("Void", "Void", "Cave Room", 10, 1, 1, 5, 5, 5, "Down")
  end
end

function gotonewInterface()
  
  title:removeSelf()
  title = nil
  option1:removeSelf()
  option1 = nil
  option2:removeSelf()
  option2 = nil
  
  update = true
  numStage = 1
  title = display.newText("Level 1: Plains", 160, 50, native.systemFontBold, 20)
  
  stageImg = display.newImageRect("Capstone Interface/Background - Plains.png", 270, 270)
  stageImg.x = 160
  stageImg.y = 200
  
  left = display.newImageRect("Capstone Interface/Left.png", 70, 70)
  left.x = 60
  left.y = 400
  left:addEventListener("tap", prevStage)
  
  play = display.newImageRect("Capstone Interface/Act.png", 70, 70)
  play.x = 160
  play.y = 400
  play:addEventListener("tap", startGame)
  
  right = display.newImageRect("Capstone Interface/Right.png", 70, 70)
  right.x = 260
  right.y = 400
  right:addEventListener("tap", nextStage)
  
end

function createMetroFile()
  
  local list = {}
  
  for i = 1, 10 do
    list[i] = 1
  end
  
  return list
  
end

function templeWallUp()
  
  if currentMap[info[file].posx][info[file].posy] == "Floor" then
    currentMap[info[file].posx][info[file].posy] = "XASD"
    updateMap()
  elseif not (currentMap[info[file].posx][info[file].posy]:sub(1, 1) == "X") then
    currentMap[info[file].posx][info[file].posy] = "X"..currentMap[info[file].posx][info[file].posy]:sub(2, 4)
    updateMap()
  end
  
end

function templeWallLeft()
  
  if currentMap[info[file].posx][info[file].posy] == "Floor" then
    currentMap[info[file].posx][info[file].posy] = "WXSD"
    updateMap()
  elseif not (currentMap[info[file].posx][info[file].posy]:sub(2, 2) == "X") then
    currentMap[info[file].posx][info[file].posy] = currentMap[info[file].posx][info[file].posy]:sub(1, 1).."X"..currentMap[info[file].posx][info[file].posy]:sub(3, 4)
    updateMap()
  end
  
end

function templeWallDown()
  
  if currentMap[info[file].posx][info[file].posy] == "Floor" then
    currentMap[info[file].posx][info[file].posy] = "WAXD"
    updateMap()
  elseif not (currentMap[info[file].posx][info[file].posy]:sub(3, 3) == "X") then
    currentMap[info[file].posx][info[file].posy] = currentMap[info[file].posx][info[file].posy]:sub(1, 2).."X"..currentMap[info[file].posx][info[file].posy]:sub(4, 4)
    updateMap()
  end
  
end

function templeWallRight()
  
  if currentMap[info[file].posx][info[file].posy] == "Floor" then
    currentMap[info[file].posx][info[file].posy] = "WASX"
    updateMap()
  elseif not (currentMap[info[file].posx][info[file].posy]:sub(4, 4) == "X") then
    currentMap[info[file].posx][info[file].posy] = currentMap[info[file].posx][info[file].posy]:sub(1, 3).."X"
    updateMap()
  end
  
end

function volcanoCaveWarp()
    
  if info[file].posx == 8 and info[file].posy == 5 then
    redoMap("Volcano", "Mesa Volcano", "Cave 6", 5, 7, 5, 2, 5, 5, "Up")
  elseif info[file].posx == 5 and info[file].posy == 8 then
    redoMap("Volcano", "Mesa Volcano", "Cave 7", 5, 8, 9, 2, 9, 5, "Down")
  elseif info[file].posx == 13 and info[file].posy == 8 then
    redoMap("Volcano", "Mesa Volcano", "Cave 7", 5, 8, 9, 8, 9, 5, "Up")
  elseif info[file].posx == 19 and info[file].posy == 8 then
    redoMap("Volcano", "Mesa Volcano", "Master Cave", 5, 9, 1, 10, 5, 10, "Right")
  elseif info[file].posx == 33 and info[file].posy == 8 then
    redoMap("Volcano", "Mesa Volcano", "Cave 4", 5, 5, 9, 2, 5, 5, "Left")
  elseif info[file].posx == 8 and info[file].posy == 11 then
    redoMap("Volcano", "Mesa Volcano", "Cave 6", 5, 7, 5, 18, 5, 15, "Up")
  elseif info[file].posx == 18 and info[file].posy == 11 then
    redoMap("Volcano", "Mesa Volcano", "Cave 3", 5, 4, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 27 and info[file].posy == 11 then
    redoMap("Volcano", "Mesa Volcano", "Cave 3", 5, 4, 13, 5, 9, 5, "Left")
  elseif info[file].posx == 33 and info[file].posy == 11 then
    redoMap("Volcano", "Mesa Volcano", "Cave 4", 5, 5, 9, 8, 5, 5, "Left")
  elseif info[file].posx == 39 and info[file].posy == 11 then
    redoMap("Volcano", "Mesa Volcano", "Master Cave", 5, 9, 18, 10, 14, 10, "Left")
  elseif info[file].posx == 8 and info[file].posy == 14 then
    redoMap("Volcano", "Mesa Volcano", "Cave 5", 5, 6, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 14 and info[file].posy == 14 then
    redoMap("Volcano", "Mesa Volcano", "Cave 2", 5, 3, 5, 8, 5, 5, "Up")
  elseif info[file].posx == 21 and info[file].posy == 14 then
    redoMap("Volcano", "Mesa Volcano", "Cave 1", 5, 2, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 24 and info[file].posy == 14 then
    redoMap("Volcano", "Mesa Volcano", "Cave 5", 5, 6, 23, 5, 19, 5, "Left")
  elseif info[file].posx == 31 and info[file].posy == 14 then
    redoMap("Volcano", "Mesa Volcano", "Cave 1", 5, 2, 9, 5, 5, 5, "Left")
  end

end

function volcanoCaveWarpOut()
  
  if info[file].map.subname == "Exterior" then
    if info[file].posx == 5 then
      if update then
        finishGame()
      else
        redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 1, 1, 5, 5, "Down")
      end
    elseif info[file].posx == 33 then
      oneText("Capstone Textbox/Question.png", "This exit seems to be unavalable. Weird.") -- skip warp
      --redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 2, 1, 5, 5, "Down")
    end
  elseif info[file].map.subname == "Cave 1" then
    if info[file].posx == 1 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 21, 14, 21, 14, "Down")
    elseif info[file].posx == 9 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 31, 14, 31, 14, "Down")
    end
  elseif info[file].map.subname == "Cave 2" then
    redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 14, 14, 14, 14, "Down")
  elseif info[file].map.subname == "Cave 3" then
    if info[file].posx == 1 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 18, 11, 18, 11, "Down")
    elseif info[file].posx == 13 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 27, 11, 27, 11, "Down")
    end
  elseif info[file].map.subname == "Cave 4" then
    if info[file].posy == 2 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 8, 33, 8, "Down")
    elseif info[file].posy == 8 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 11, 33, 11, "Down")
    end
  elseif info[file].map.subname == "Cave 5" then
    if info[file].posx == 1 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 8, 14, 8, 14, "Down")
    elseif info[file].posx == 23 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 24, 14, 24, 14, "Down")
    end
  elseif info[file].map.subname == "Cave 6" then
    if info[file].posy == 2 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 8, 5, 8, 5, "Down")
    elseif info[file].posy == 18 then
      redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 8, 11, 8, 11, "Down")
    end
  elseif info[file].map.subname == "Cave 7" then
    redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 13, 8, 13, 8, "Down")
  end
  
end

function snowCaveWarp()
  
  if info[file].posx == 12 and info[file].posy == 5 then
    redoMap("Snow", "Mesa Alp", "Cave 6", 8, 7, 5, 2, 5, 5, "Up")
  elseif info[file].posx == 23 and info[file].posy == 8 then
    redoMap("Snow", "Mesa Alp", "Master Cave", 8, 8, 1, 10, 5, 10, "Right")
  elseif info[file].posx == 38 and info[file].posy == 8 then
    redoMap("Snow", "Mesa Alp", "Cave 4", 8, 5, 9, 2, 5, 5, "Left")
  elseif info[file].posx == 12 and info[file].posy == 11 then
    redoMap("Snow", "Mesa Alp", "Cave 6", 8, 7, 5, 22, 5, 22, "Up")
  elseif info[file].posx == 22 and info[file].posy == 11 then
    redoMap("Snow", "Mesa Alp", "Cave 3", 8, 4, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 32 and info[file].posy == 11 then
    redoMap("Snow", "Mesa Alp", "Cave 3", 8, 4, 14, 5, 10, 5, "Left")
  elseif info[file].posx == 38 and info[file].posy == 11 then
    redoMap("Snow", "Mesa Alp", "Cave 4", 8, 5, 9, 8, 5, 5, "Left")
  elseif info[file].posx == 44 and info[file].posy == 11 then
    redoMap("Snow", "Mesa Alp", "Master Cave", 8, 8, 18, 10, 14, 10, "Left")
  elseif info[file].posx == 5 and info[file].posy == 14 then
    
    if update then
      finishGame()
    else
      redoMap("Ruins", "Relic Ruins", "1F, South Sector", 9, 1, 5, 9, 5, 5, "Up")
    end
    
  elseif info[file].posx == 12 and info[file].posy == 14 then
    redoMap("Snow", "Mesa Alp", "Cave 5", 8, 6, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 18 and info[file].posy == 14 then
    redoMap("Snow", "Mesa Alp", "Cave 2", 8, 3, 5, 8, 5, 5, "Up")
  elseif info[file].posx == 25 and info[file].posy == 14 then
    redoMap("Snow", "Mesa Alp", "Cave 1", 8, 2, 1, 5, 5, 5, "Right")
  elseif info[file].posx == 28 and info[file].posy == 14 then
    redoMap("Snow", "Mesa Alp", "Cave 5", 8, 6, 25, 5, 21, 5, "Left")
  elseif info[file].posx == 36 and info[file].posy == 14 then
    redoMap("Snow", "Mesa Alp", "Cave 1", 8, 2, 9, 5, 5, 5, "Left")
  end
  
end

function snowCaveWarpOut()
  
  if info[file].map.subname == "Exterior" then
    if info[file].posx == 38 then
      oneText("Capstone Textbox/Question.png", "This exit seems to be unavalable. Weird.") -- skip warp
      --redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 2, 1, 5, 5, "Down")
    elseif info[file].posx == 44 then
      oneText("Capstone Textbox/Question.png", "This exit seems to be unavalable. Weird.") -- skip warp
      --redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 1, 1, 5, 5, "Down")
    end
  elseif info[file].map.subname == "Cave 1" then
    if info[file].posx == 1 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 25, 14, 25, 14, "Down")
    elseif info[file].posx == 9 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 36, 14, 36, 14, "Down")
    end
  elseif info[file].map.subname == "Cave 2" then
    redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 18, 14, 18, 14, "Down")
  elseif info[file].map.subname == "Cave 3" then
    if info[file].posx == 1 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 22, 11, 22, 11, "Down")
    elseif info[file].posx == 14 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 32, 11, 32, 11, "Down")
    end
  elseif info[file].map.subname == "Cave 4" then
    if info[file].posy == 2 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 8, 38, 8, "Down")
    elseif info[file].posy == 8 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 11, 38, 11, "Down")
    end
  elseif info[file].map.subname == "Cave 5" then
    if info[file].posx == 1 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 12, 14, 12, 14, "Down")
    elseif info[file].posx == 25 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 28, 14, 28, 14, "Down")
    end
  elseif info[file].map.subname == "Cave 6" then
    if info[file].posy == 2 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 12, 5, 12, 5, "Down")
    elseif info[file].posy == 22 then
      redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 12, 11, 12, 11, "Down")
    end
  end

end

function snowSlipUp()
  
  for i = info[file].posy - 1, 1, -1 do -- loop to find the earliest non-slippery path
    if not(currentMap[info[file].posx][i] == "Ice") then
      
      if currentMap[info[file].posx][i] == "Floor" then
        info[file].prog.alp.dest = (info[file].posy - 1) - (i)
      else
        info[file].prog.alp.dest = (info[file].posy - 1) - (i + 1) -- distance from posy - 1 to i + 1
      end
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Up"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      else
        currentMap[info[file].posx][i + 1] = "Highlight"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i + 1
      end
      updateMap()
      break
      
    elseif i == 1 then -- checks after all position is checked
    
      info[file].prog.alp.dest = (info[file].posy - 1) - (i)
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Up"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      else
        currentMap[info[file].posx][i] = "Highlight"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      end
      updateMap()
      
    end
  end
  
end

function voidSnowSlipUp()
  
  for i = info[file].posy - 1, 1, -1 do -- loop to find the earliest non-slippery path
    
    if currentMap[info[file].posx][i] == "Ledge"
    or currentMap[info[file].posx][i] == "Floor" then
      
      if currentMap[info[file].posx][i] == "Floor" then
        info[file].prog.void.snowdest = (info[file].posy - 1) - (i)
      else
        info[file].prog.void.snowdest = (info[file].posy - 1) - (i + 1) -- distance from posy - 1 to i + 1
      end
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Up"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
      elseif currentMap[info[file].posx][i + 1] == "Bridge" then
        currentMap[info[file].posx][i + 1] = "Highlight Bridge"
      elseif currentMap[info[file].posx][i + 1] == "Way Out Down" then
        currentMap[info[file].posx][i + 1] = "Highlight Way Out Down"
      elseif currentMap[info[file].posx][i + 1] == "Cave" then
        currentMap[info[file].posx][i + 1] = "Highlight Cave"
      elseif currentMap[info[file].posx][i + 1] == "Wall" then
        currentMap[info[file].posx][i + 1] = "Highlight Wall"
      elseif currentMap[info[file].posx][i + 1] == "Climb" then
        currentMap[info[file].posx][i + 1] = "Highlight Climb"
      end
      updateMap()
      break
      
    elseif i == 1 then -- checks after all position is checked
    
      info[file].prog.void.snowdest = (info[file].posy - 1) - (i)
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Up"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
      elseif currentMap[info[file].posx][i] == "Bridge" then
        currentMap[info[file].posx][i] = "Highlight Bridge"
      elseif currentMap[info[file].posx][i] == "Way Out Down" then
        currentMap[info[file].posx][i] = "Highlight Way Out Down"
      elseif currentMap[info[file].posx][i] == "Cave" then
        currentMap[info[file].posx][i] = "Highlight Cave"
      elseif currentMap[info[file].posx][i] == "Wall" then
        currentMap[info[file].posx][i] = "Highlight Wall"
      elseif currentMap[info[file].posx][i] == "Climb" then
        currentMap[info[file].posx][i] = "Highlight Climb"
      end
      updateMap()
      
    end
  end
  
end

function snowSlipDown()
  
  for i = info[file].posy + 1, text[info[file].map.id][info[file].map.subid][0].leny do -- loop to find the earliest non-slippery path
    if not(currentMap[info[file].posx][i] == "Ice") then
      
      if currentMap[info[file].posx][i] == "Floor" then
        info[file].prog.alp.dest = (i) - (info[file].posy + 1)
      else
        info[file].prog.alp.dest = (i - 1) - (info[file].posy + 1) -- distance from posy + 1 to i - 1
      end
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Down"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      else
        currentMap[info[file].posx][i - 1] = "Highlight"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i - 1
      end
      updateMap()
      break
      
    elseif i == text[info[file].map.id][info[file].map.subid][0].leny then -- checks after all position is checked
    
      info[file].prog.alp.dest = (i) - (info[file].posy + 1)
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Down"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      else
        currentMap[info[file].posx][i] = "Highlight"
        info[file].prog.alp.highlightx = info[file].posx
        info[file].prog.alp.highlighty = i
      end
      updateMap()
        
    end
  end
  
end

function voidSnowSlipDown()
  
  for i = info[file].posy + 1, text[info[file].map.id][info[file].map.subid][0].leny do -- loop to find the earliest non-slippery path
    if currentMap[info[file].posx][i] == "Ledge"
    or currentMap[info[file].posx][i] == "Floor" then
      
      if currentMap[info[file].posx][i] == "Floor" then
        info[file].prog.void.snowdest = (i) - (info[file].posy + 1)
      else
        info[file].prog.void.snowdest = (i - 1) - (info[file].posy + 1) -- distance from posy + 1 to i - 1
      end
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Down"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
      elseif currentMap[info[file].posx][i - 1] == "Bridge" then
        currentMap[info[file].posx][i - 1] = "Highlight Bridge"
      elseif currentMap[info[file].posx][i - 1] == "Way Out Down" then
        currentMap[info[file].posx][i - 1] = "Highlight Way Out Down"
      elseif currentMap[info[file].posx][i - 1] == "Cave" then
        currentMap[info[file].posx][i - 1] = "Highlight Cave"
      elseif currentMap[info[file].posx][i - 1] == "Wall" then
        currentMap[info[file].posx][i - 1] = "Highlight Wall"
      elseif currentMap[info[file].posx][i - 1] == "Climb" then
        currentMap[info[file].posx][i - 1] = "Highlight Climb"
      end
      updateMap()
      break
      
    elseif i == text[info[file].map.id][info[file].map.subid][0].leny then -- checks after all position is checked
    
      info[file].prog.void.snowdest = (i) - (info[file].posy + 1)
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Down"
      if currentMap[info[file].posx][i] == "Floor" then
        currentMap[info[file].posx][i] = "Highlight Floor"
      elseif currentMap[info[file].posx][i] == "Bridge" then
        currentMap[info[file].posx][i] = "Highlight Bridge"
      elseif currentMap[info[file].posx][i] == "Way Out Down" then
        currentMap[info[file].posx][i] = "Highlight Way Out Down"
      elseif currentMap[info[file].posx][i] == "Cave" then
        currentMap[info[file].posx][i] = "Highlight Cave"
      elseif currentMap[info[file].posx][i] == "Wall" then
        currentMap[info[file].posx][i] = "Highlight Wall"
      elseif currentMap[info[file].posx][i] == "Climb" then
        currentMap[info[file].posx][i] = "Highlight Climb"
      end
      updateMap()
        
    end
  end
  
end

function snowSlipLeft()

  for i = info[file].posx - 1, 1, -1 do -- loop to find the earliest non-slippery path
    if not(currentMap[i][info[file].posy] == "Ice") then
      
      if currentMap[i][info[file].posy] == "Floor" then
        info[file].prog.alp.dest = (info[file].posx - 1) - (i)
      else
        info[file].prog.alp.dest = (info[file].posx - 1) - (i + 1) -- distance from posx - 1 to i + 1
      end
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Left"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      else
        currentMap[i + 1][info[file].posy] = "Highlight"
        info[file].prog.alp.highlightx = i + 1
        info[file].prog.alp.highlighty = info[file].posy
      end
      updateMap()
      break
      
    elseif i == 1 then -- checks after all position is checked
      
      info[file].prog.alp.dest = (info[file].posx - 1) - (i) 
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Left"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      else
        currentMap[i][info[file].posy] = "Highlight"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      end
      updateMap()
      
    end
  end
end

function voidSnowSlipLeft()
  
  for i = info[file].posx - 1, 1, -1 do -- loop to find the earliest non-slippery path
    if currentMap[i][info[file].posy] == "Ledge"
    or currentMap[i][info[file].posy] == "Floor" then
      
      if currentMap[i][info[file].posy] == "Floor" then
        info[file].prog.void.snowdest = (info[file].posx - 1) - (i)
      else
        info[file].prog.void.snowdest = (info[file].posx - 1) - (i + 1) -- distance from posx - 1 to i + 1
      end
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Left"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
      elseif currentMap[i + 1][info[file].posy] == "Bridge" then
        currentMap[i + 1][info[file].posy] = "Highlight Bridge"
      elseif currentMap[i + 1][info[file].posy] == "Way Out Down" then
        currentMap[i + 1][info[file].posy] = "Highlight Way Out Down"
      elseif currentMap[i + 1][info[file].posy] == "Cave" then
        currentMap[i + 1][info[file].posy] = "Highlight Cave"
      elseif currentMap[i + 1][info[file].posy] == "Wall" then
        currentMap[i + 1][info[file].posy] = "Highlight Wall"
      elseif currentMap[i + 1][info[file].posy] == "Climb" then
        currentMap[i + 1][info[file].posy] = "Highlight Climb"
      end
      updateMap()
      break
      
    elseif i == 1 then -- checks after all position is checked
      
      info[file].prog.void.snowdest = (info[file].posx - 1) - (i) 
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Left"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
      elseif currentMap[i][info[file].posy] == "Bridge" then
        currentMap[i][info[file].posy] = "Highlight Bridge"
      elseif currentMap[i][info[file].posy] == "Way Out Down" then
        currentMap[i][info[file].posy] = "Highlight Way Out Down"
      elseif currentMap[i][info[file].posy] == "Cave" then
        currentMap[i][info[file].posy] = "Highlight Cave"
      elseif currentMap[i][info[file].posy] == "Wall" then
        currentMap[i][info[file].posy] = "Highlight Wall"
      elseif currentMap[i][info[file].posy] == "Climb" then
        currentMap[i][info[file].posy] = "Highlight Climb"
      end
      updateMap()
      
    end
  end
end

function snowSlipRight()
  
  for i = info[file].posx + 1, text[info[file].map.id][info[file].map.subid][0].lenx do -- loop to find the earliest non-slippery path
    if not(currentMap[i][info[file].posy] == "Ice") then
      
      if currentMap[i][info[file].posy] == "Floor" then
        info[file].prog.alp.dest = (i) - (info[file].posx + 1)
      else
        info[file].prog.alp.dest = (i - 1) - (info[file].posx + 1) -- distance from posx + 1 to i - 1
      end
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Right"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      else
        currentMap[i - 1][info[file].posy] = "Highlight"
        info[file].prog.alp.highlightx = i - 1
        info[file].prog.alp.highlighty = info[file].posy
      end
      updateMap()
      break
    
    elseif i == text[info[file].map.id][info[file].map.subid][0].lenx then -- checks after all position is checked
    
      info[file].prog.alp.dest = (i) - (info[file].posx + 1) 
      if info[file].prog.alp.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.alp.dir = "Right"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      else
        currentMap[i][info[file].posy] = "Highlight"
        info[file].prog.alp.highlightx = i
        info[file].prog.alp.highlighty = info[file].posy
      end
      updateMap()
      
    end
  end
end

function voidSnowSlipRight()
  
   for i = info[file].posx + 1, text[info[file].map.id][info[file].map.subid][0].lenx do -- loop to find the earliest non-slippery path
    if currentMap[i][info[file].posy] == "Ledge"
    or currentMap[i][info[file].posy] == "Floor" then
      
      if currentMap[i][info[file].posy] == "Floor" then
        info[file].prog.void.snowdest = (i) - (info[file].posx + 1)
      else
        info[file].prog.void.snowdest = (i - 1) - (info[file].posx + 1) -- distance from posx + 1 to i - 1
      end
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Right"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
      elseif currentMap[i - 1][info[file].posy] == "Bridge" then
        currentMap[i - 1][info[file].posy] = "Highlight Bridge"
      elseif currentMap[i - 1][info[file].posy] == "Way Out Down" then
        currentMap[i - 1][info[file].posy] = "Highlight Way Out Down"
      elseif currentMap[i - 1][info[file].posy] == "Cave" then
        currentMap[i - 1][info[file].posy] = "Highlight Cave"
      elseif currentMap[i - 1][info[file].posy] == "Wall" then
        currentMap[i - 1][info[file].posy] = "Highlight Wall"
      elseif currentMap[i - 1][info[file].posy] == "Climb" then
        currentMap[i - 1][info[file].posy] = "Highlight Climb"
      end
      updateMap()
      break
    
    elseif i == text[info[file].map.id][info[file].map.subid][0].lenx then -- checks after all position is checked
    
      info[file].prog.void.snowdest = (i) - (info[file].posx + 1) 
      if info[file].prog.void.snowdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.snowdir = "Right"
      if currentMap[i][info[file].posy] == "Floor" then
        currentMap[i][info[file].posy] = "Highlight Floor"
      elseif currentMap[i][info[file].posy] == "Bridge" then
        currentMap[i][info[file].posy] = "Highlight Bridge"
      elseif currentMap[i][info[file].posy] == "Way Out Down" then
        currentMap[i][info[file].posy] = "Highlight Way Out Down"
      elseif currentMap[i][info[file].posy] == "Cave" then
        currentMap[i][info[file].posy] = "Highlight Cave"
      elseif currentMap[i][info[file].posy] == "Wall" then
        currentMap[i][info[file].posy] = "Highlight Wall"
      elseif currentMap[i][info[file].posy] == "Climb" then
        currentMap[i][info[file].posy] = "Highlight Climb"
      end
      updateMap()
      
    end
  end
end

function ruinsSlipUp()
  
  for i = info[file].posy - 1, 1, -1 do -- loop to find the earliest non-slippery path
    
    if currentMap[info[file].posx][i] == "Post"
    or currentMap[info[file].posx][i] == "Switch"
    or currentMap[info[file].posx][i] == "Void"
    or currentMap[info[file].posx][i] == "Rock" then
      
      info[file].prog.ruins.dest = (info[file].posy - 1) - (i + 1)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Up"
      info[file].prog.ruins.highlightx = info[file].posx
      info[file].prog.ruins.highlighty = i + 1
      updateMap()
      break
      
    elseif currentMap[info[file].posx][i] == "Very Up"
    or currentMap[info[file].posx][i] == "Very Down"
    or currentMap[info[file].posx][i] == "Very Left"
    or currentMap[info[file].posx][i] == "Very Right"
    or i == 1 then
      
      info[file].prog.ruins.dest = (info[file].posy - 1) - (i)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Up"
      info[file].prog.ruins.highlightx = info[file].posx
      info[file].prog.ruins.highlighty = i
      updateMap()
      break

    end
  end
  
end

function voidRuinsSlipUp()
  
  for i = info[file].posy - 1, 1, -1 do -- loop to find the earliest non-slippery path
    
    if currentMap[info[file].posx][i] == "Very Up"
    or currentMap[info[file].posx][i] == "Very Down"
    or currentMap[info[file].posx][i] == "Very Left"
    or currentMap[info[file].posx][i] == "Very Right"
    or i == 1 then
      
      info[file].prog.void.ruinsdest = (info[file].posy - 1) - (i)
      if info[file].prog.void.ruinsdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.ruinsdir = "Up"
      info[file].prog.void.highlightx = info[file].posx
      info[file].prog.void.highlighty = i
      updateMap()
      break

    end
  end
  
end

function ruinsSlipLeft()
  
  for i = info[file].posx - 1, 1, -1 do -- loop to find the earliest non-slippery path
                  
    if currentMap[i][info[file].posy] == "Post"
    or currentMap[i][info[file].posy] == "Switch"
    or currentMap[i][info[file].posy] == "Void"
    or currentMap[i][info[file].posy] == "Rock" then
      
      info[file].prog.ruins.dest = (info[file].posx - 1) - (i + 1) 
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Left"
      info[file].prog.ruins.highlightx = i + 1
      info[file].prog.ruins.highlighty = info[file].posy
      updateMap()
      break
      
    elseif currentMap[i][info[file].posy] == "Very Up"
    or currentMap[i][info[file].posy] == "Very Down"
    or currentMap[i][info[file].posy] == "Very Left"
    or currentMap[i][info[file].posy] == "Very Right"
    or i == 1 then
      
      info[file].prog.ruins.dest = (info[file].posx - 1) - (i)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Left"
      info[file].prog.ruins.highlightx = i
      info[file].prog.ruins.highlighty = info[file].posy
      updateMap()
      break
      
    end
  end
end

function voidRuinsSlipLeft()
  
  for i = info[file].posx - 1, 1, -1 do -- loop to find the earliest non-slippery path
    
    if currentMap[i][info[file].posy] == "Very Up"
    or currentMap[i][info[file].posy] == "Very Down"
    or currentMap[i][info[file].posy] == "Very Left"
    or currentMap[i][info[file].posy] == "Very Right"
    or i == 1 then
      
      info[file].prog.void.ruinsdest = (info[file].posx - 1) - (i)
      if info[file].prog.void.ruinsdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.ruinsdir = "Left"
      info[file].prog.void.highlightx = i
      info[file].prog.void.highlighty = info[file].posy
      updateMap()
      break

    end
  end
  
end


function ruinsSlipDown()
  
  for i = info[file].posy + 1, text[info[file].map.id][info[file].map.subid][0].leny do -- loop to find the earliest non-slippery path
      
    if currentMap[info[file].posx][i] == "Post"
    or currentMap[info[file].posx][i] == "Switch"
    or currentMap[info[file].posx][i] == "Void"
    or currentMap[info[file].posx][i] == "Rock" then
      
      info[file].prog.ruins.dest = (i - 1) - (info[file].posy + 1) 
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Down"
      info[file].prog.ruins.highlightx = info[file].posx
      info[file].prog.ruins.highlighty = i - 1
      updateMap()
      break
        
    elseif currentMap[info[file].posx][i] == "Very Up"
    or currentMap[info[file].posx][i] == "Very Down"
    or currentMap[info[file].posx][i] == "Very Left"
    or currentMap[info[file].posx][i] == "Very Right"
    or i == text[info[file].map.id][info[file].map.subid][0].leny then
      
      info[file].prog.ruins.dest = (i) - (info[file].posy + 1)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Down"
      info[file].prog.ruins.highlightx = info[file].posx
      info[file].prog.ruins.highlighty = i
      updateMap()
      break
      
    end
  end
  
end

function voidRuinsSlipDown()
  
  for i = info[file].posy + 1, text[info[file].map.id][info[file].map.subid][0].leny do -- loop to find the earliest non-slippery path
    
    if currentMap[info[file].posx][i] == "Very Up"
    or currentMap[info[file].posx][i] == "Very Down"
    or currentMap[info[file].posx][i] == "Very Left"
    or currentMap[info[file].posx][i] == "Very Right"
    or i == text[info[file].map.id][info[file].map.subid][0].leny then
      
      info[file].prog.void.ruinsdest = (i) - (info[file].posy + 1)
      if info[file].prog.void.ruinsdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.ruinsdir = "Down"
      info[file].prog.void.highlightx = info[file].posx
      info[file].prog.void.highlighty = i
      updateMap()
      break

    end
  end
  
end

function ruinsSlipRight()
  
  for i = info[file].posx + 1, text[info[file].map.id][info[file].map.subid][0].lenx do -- loop to find the earliest non-slippery path
          
    if currentMap[i][info[file].posy] == "Post"
    or currentMap[i][info[file].posy] == "Switch"
    or currentMap[i][info[file].posy] == "Void"
    or currentMap[i][info[file].posy] == "Rock" then
      
      info[file].prog.ruins.dest = (i - 1) - (info[file].posx + 1)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
    info[file].prog.ruins.dir = "Right"
      info[file].prog.ruins.highlightx = i - 1
      info[file].prog.ruins.highlighty = info[file].posy
      updateMap()
      break
      
    elseif currentMap[i][info[file].posy] == "Very Up"
    or currentMap[i][info[file].posy] == "Very Down"
    or currentMap[i][info[file].posy] == "Very Left"
    or currentMap[i][info[file].posy] == "Very Right"
    or i == text[info[file].map.id][info[file].map.subid][0].lenx then
      
      info[file].prog.ruins.dest = (i) - (info[file].posx + 1)
      if info[file].prog.ruins.dest == 0 then
        break -- if hit instantly
      end
      info[file].prog.ruins.dir = "Right"
      info[file].prog.ruins.highlightx = i
      info[file].prog.ruins.highlighty = info[file].posy
      updateMap()
      break
      
    end
  end
end

function voidRuinsSlipRight()
  
  for i = info[file].posx + 1, text[info[file].map.id][info[file].map.subid][0].lenx do -- loop to find the earliest non-slippery path
    
    if currentMap[i][info[file].posy] == "Very Up"
    or currentMap[i][info[file].posy] == "Very Down"
    or currentMap[i][info[file].posy] == "Very Left"
    or currentMap[i][info[file].posy] == "Very Right"
    or i == text[info[file].map.id][info[file].map.subid][0].lenx then

      info[file].prog.void.ruinsdest = (i) - (info[file].posx + 1)
      if info[file].prog.void.ruinsdest == 0 then
        break -- if hit instantly
      end
      info[file].prog.void.ruinsdir = "Right"
      info[file].prog.void.highlightx = i
      info[file].prog.void.highlighty = info[file].posy
      updateMap()
      break

    end
  end
  
end


function ruinsStair()
  
  if info[file].map.subname == "1F, South Sector" then
    if info[file].prog.ruins.stair == 1 then
      --do nothing
    else
      redoMap("Ruins", "Relic Ruins", "3F, South Sector", 9, 5, 5, 5, 5, 5, "Down")
    end
  elseif info[file].map.subname == "3F, South Sector" then
    if info[file].prog.ruins.stair == 3 then
      redoMap("Ruins", "Relic Ruins", "1F, South Sector", 9, 1, 5, 5, 5, 5, "Down")
    else
      redoMap("Ruins", "Relic Ruins", "6F, South Sector", 9, 11, 5, 5, 5, 5, "Down")
    end
  elseif info[file].map.subname == "6F, South Sector" then
    redoMap("Ruins", "Relic Ruins", "1F, South Sector", 9, 1, 5, 5, 5, 5, "Down")
  end
  
end

function snowMoveBallRight()
  
  currentMap[info[file].posx + 1][info[file].posy] = "Floored"
  currentMap[info[file].posx + 2][info[file].posy] = "Floored"
  if info[file].posx == 12 and info[file].posy == 5 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 2).."O"..info[file].prog.alp.ball:sub(4, 9)
  elseif info[file].posx == 12 and info[file].posy == 11 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 3).."O"..info[file].prog.alp.ball:sub(5, 9)
  elseif info[file].posx == 9 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 4).."O"..info[file].prog.alp.ball:sub(6, 9)
  elseif info[file].posx == 15 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 5).."O"..info[file].prog.alp.ball:sub(7, 9)
  elseif info[file].posx == 28 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 6).."O"..info[file].prog.alp.ball:sub(8, 9)
  elseif info[file].posx == 33 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 7).."O"..info[file].prog.alp.ball:sub(9, 9)
  end
  updateMap()
  
end

function snowMoveBallLeft()
  
  currentMap[info[file].posx - 1][info[file].posy] = "Floored"
  currentMap[info[file].posx - 2][info[file].posy] = "Floored"
  if info[file].posx == 12 and info[file].posy == 5 then
    info[file].prog.alp.ball = "O"..info[file].prog.alp.ball:sub(2, 8)
  elseif info[file].posx == 28 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 1).."O"..info[file].prog.alp.ball:sub(3, 8)
  elseif info[file].posx == 41 and info[file].posy == 14 then
    info[file].prog.alp.ball = info[file].prog.alp.ball:sub(1, 8).."O"
  end
  updateMap()
  
end

function ruinsUnslip()
  
  info[file].prog.ruins.dest = info[file].prog.ruins.dest - 1
  if info[file].prog.ruins.dest == 0 then
    info[file].prog.ruins.dir = ""
    info[file].prog.ruins.highlightx = 0
    info[file].prog.ruins.highlighty = 0
    updateMap()
  end
  
end

function voidRuinsUnslip()
  
  info[file].prog.void.ruinsdest = info[file].prog.void.ruinsdest - 1
  if info[file].prog.void.ruinsdest == 0 then
    info[file].prog.void.ruinsdir = ""
    info[file].prog.void.highlightx = 0
    info[file].prog.void.highlighty = 0
    updateMap()
  end
  
end

function voidRoomSnowUnslip()
  
  info[file].prog.alp.dest = info[file].prog.alp.dest - 1
  if info[file].prog.alp.dest == 0 then
    info[file].prog.alp.dir = ""
  end

end

function snowUnslipUp()
  
  info[file].prog.alp.dest = info[file].prog.alp.dest - 1
  if info[file].prog.alp.dest == 0 then
    info[file].prog.alp.dir = ""
    if currentMap[info[file].posx][info[file].posy - 1] == "Highlight" then
      currentMap[info[file].posx][info[file].posy - 1] = "Ice"
    else
      currentMap[info[file].posx][info[file].posy - 1] = "Floor"
    end
    info[file].prog.alp.highlightx = 0
    info[file].prog.alp.highlighty = 0
    updateMap()
  end
     
end

function snowUnslipLeft()
  
  info[file].prog.alp.dest = info[file].prog.alp.dest - 1
  if info[file].prog.alp.dest == 0 then
    info[file].prog.alp.dir = ""
    if currentMap[info[file].posx - 1][info[file].posy] == "Highlight" then
      currentMap[info[file].posx - 1][info[file].posy] = "Ice"
    else
      currentMap[info[file].posx - 1][info[file].posy] = "Floor"
    end
    info[file].prog.alp.highlightx = 0
    info[file].prog.alp.highlighty = 0
    updateMap()
  end
  
end

function snowUnslipDown()
  
  info[file].prog.alp.dest = info[file].prog.alp.dest - 1
  if info[file].prog.alp.dest == 0 then
    info[file].prog.alp.dir = ""
    if currentMap[info[file].posx][info[file].posy + 1] == "Highlight" then
      currentMap[info[file].posx][info[file].posy + 1] = "Ice"
    else
      currentMap[info[file].posx][info[file].posy + 1] = "Floor"
    end
    info[file].prog.alp.highlightx = 0
    info[file].prog.alp.highlighty = 0
    updateMap()
  end
  
end

function snowUnslipRight()
  
  info[file].prog.alp.dest = info[file].prog.alp.dest - 1
  if info[file].prog.alp.dest == 0 then
    info[file].prog.alp.dir = ""
    if currentMap[info[file].posx + 1][info[file].posy] == "Highlight" then
      currentMap[info[file].posx + 1][info[file].posy] = "Ice"
    else
      currentMap[info[file].posx + 1][info[file].posy] = "Floor"
    end
    info[file].prog.alp.highlightx = 0
    info[file].prog.alp.highlighty = 0
    updateMap()
  end
  
end

function voidSnowUnslipUp()
  
  info[file].prog.void.snowdest = info[file].prog.void.snowdest - 1
  if info[file].prog.void.snowdest == 0 then
    info[file].prog.void.snowdir = ""
    if currentMap[info[file].posx][info[file].posy - 1] == "Highlight Floor" then
      currentMap[info[file].posx][info[file].posy - 1] = "Floor"
    elseif currentMap[info[file].posx][info[file].posy - 1] == "Highlight Bridge" then
      currentMap[info[file].posx][info[file].posy - 1] = "Bridge"
    elseif currentMap[info[file].posx][info[file].posy - 1] == "Highlight Way Out Down" then
      currentMap[info[file].posx][info[file].posy - 1] = "Way Out Down"
    elseif currentMap[info[file].posx][info[file].posy - 1] == "Highlight Cave" then
      currentMap[info[file].posx][info[file].posy - 1] = "Cave"
    elseif currentMap[info[file].posx][info[file].posy - 1] == "Highlight Wall" then
      currentMap[info[file].posx][info[file].posy - 1] = "Wall"
    elseif currentMap[info[file].posx][info[file].posy - 1] == "Highlight Climb" then
      currentMap[info[file].posx][info[file].posy - 1] = "Climb"
    end
    updateMap()
  end
            
end

function voidSnowUnslipLeft()
  
  info[file].prog.void.snowdest = info[file].prog.void.snowdest - 1
  if info[file].prog.void.snowdest == 0 then
    info[file].prog.void.snowdir = ""
    if currentMap[info[file].posx - 1][info[file].posy] == "Highlight Floor" then
      currentMap[info[file].posx - 1][info[file].posy] = "Floor"
    elseif currentMap[info[file].posx - 1][info[file].posy] == "Highlight Bridge" then
      currentMap[info[file].posx - 1][info[file].posy] = "Bridge"
    elseif currentMap[info[file].posx - 1][info[file].posy] == "Highlight Way Out Down" then
      currentMap[info[file].posx - 1][info[file].posy] = "Way Out Down"
    elseif currentMap[info[file].posx - 1][info[file].posy] == "Highlight Cave" then
      currentMap[info[file].posx - 1][info[file].posy] = "Cave"
    elseif currentMap[info[file].posx - 1][info[file].posy] == "Highlight Wall" then
      currentMap[info[file].posx - 1][info[file].posy] = "Wall"
    elseif currentMap[info[file].posx - 1][info[file].posy] == "Highlight Climb" then
      currentMap[info[file].posx - 1][info[file].posy] = "Climb"
    end
    updateMap()
  end
  
end

function voidSnowUnslipDown()
  
  info[file].prog.void.snowdest = info[file].prog.void.snowdest - 1
  if info[file].prog.void.snowdest == 0 then
    info[file].prog.void.snowdir = ""
    if currentMap[info[file].posx][info[file].posy + 1] == "Highlight Floor" then
      currentMap[info[file].posx][info[file].posy + 1] = "Floor"
    elseif currentMap[info[file].posx][info[file].posy + 1] == "Highlight Bridge" then
      currentMap[info[file].posx][info[file].posy + 1] = "Bridge"
    elseif currentMap[info[file].posx][info[file].posy + 1] == "Highlight Way Out Down" then
      currentMap[info[file].posx][info[file].posy + 1] = "Way Out Down"
    elseif currentMap[info[file].posx][info[file].posy + 1] == "Highlight Cave" then
      currentMap[info[file].posx][info[file].posy + 1] = "Cave"
    elseif currentMap[info[file].posx][info[file].posy + 1] == "Highlight Wall" then
      currentMap[info[file].posx][info[file].posy + 1] = "Wall"
    elseif currentMap[info[file].posx][info[file].posy + 1] == "Highlight Climb" then
      currentMap[info[file].posx][info[file].posy + 1] = "Climb"
    end
    updateMap()
  end
  
end

function voidSnowUnslipRight()
  
  info[file].prog.void.snowdest = info[file].prog.void.snowdest - 1
  if info[file].prog.void.snowdest == 0 then
    info[file].prog.void.snowdir = ""
    if currentMap[info[file].posx + 1][info[file].posy] == "Highlight Floor" then
      currentMap[info[file].posx + 1][info[file].posy] = "Floor"
    elseif currentMap[info[file].posx + 1][info[file].posy] == "Highlight Bridge" then
      currentMap[info[file].posx + 1][info[file].posy] = "Bridge"
    elseif currentMap[info[file].posx + 1][info[file].posy] == "Highlight Way Out Down" then
      currentMap[info[file].posx + 1][info[file].posy] = "Way Out Down"
    elseif currentMap[info[file].posx + 1][info[file].posy] == "Highlight Cave" then
      currentMap[info[file].posx + 1][info[file].posy] = "Cave"
    elseif currentMap[info[file].posx + 1][info[file].posy] == "Highlight Wall" then
      currentMap[info[file].posx + 1][info[file].posy] = "Wall"
    elseif currentMap[info[file].posx + 1][info[file].posy] == "Highlight Climb" then
      currentMap[info[file].posx + 1][info[file].posy] = "Climb"
    end
    updateMap()
  end
  
end

function changeLaserUpDown()
  
  for i = 1, 43 do
    
    if info[file].laser[i].curdir == "W" then
      if info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      elseif info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      end
    
    elseif info[file].laser[i].curdir == "A" then
      if info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      end
  
    elseif info[file].laser[i].curdir == "S" then
      if info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      elseif info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      end
      
    elseif info[file].laser[i].curdir == "D" then
      if info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      end
    end
  end
end

function changeLaserLeftRight()

  for i = 1, 43 do
    
    if info[file].laser[i].curdir == "W" then
      if info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      end
    
    elseif info[file].laser[i].curdir == "A" then
      if info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      elseif info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      end
  
    elseif info[file].laser[i].curdir == "S" then
      if info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      end
      
    elseif info[file].laser[i].curdir == "D" then
      if info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      elseif info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      end
    end
  end
end

function changeLaser()
  
  for i = 1, 43 do
    
    if info[file].laser[i].curdir == "W" then
      if info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      elseif info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      elseif info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      end
    
    elseif info[file].laser[i].curdir == "A" then
      if info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      elseif info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      elseif info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      end
  
    elseif info[file].laser[i].curdir == "S" then
      if info[file].laser[i].dir:sub(4, 4) == "D" then
        info[file].laser[i].curdir = "D"
      elseif info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      elseif info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      end
      
    elseif info[file].laser[i].curdir == "D" then
      if info[file].laser[i].dir:sub(1, 1) == "W" then
        info[file].laser[i].curdir = "W"
      elseif info[file].laser[i].dir:sub(2, 2) == "A" then
        info[file].laser[i].curdir = "A"
      elseif info[file].laser[i].dir:sub(3, 3) == "S" then
        info[file].laser[i].curdir = "S"
      end
    end
  
  end
end

function collidedWithLaser()
  
  for i = 1, info[file].numLaser do -- check for laser collision
    if not (laserImg[i] == nil) then
      if info[file].posx == laserImg[i].posx
      and info[file].posy == laserImg[i].posy then
        
        if not info[file].prog.desert.hitlaser then
          you:setFillColor(1, 0.5, 0.5)
          info[file].prog.desert.hitlaser = true
        
        else
          resetStatue()
          if info[file].posx < 22 then
            redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 8, 3, 8, 5, "Down")
          elseif info[file].posx < 32 then
            redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 22, 7, 22, 5, "Down")
          elseif info[file].posx < 55 then
            redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 41, 8, 41, 5, "Down")
          else
            redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 54, 5, 54, 5, "Down")
          end
          info[file].prog.desert.hitlaser = false
        end
        
        return true
        
      end
    end
  end
  
  return false
  
end

function resetStatue()
  
  info[file].interactibles[6][1][1].posx = 18
  info[file].interactibles[6][1][1].posy = 5
  
  info[file].interactibles[6][1][2].posx = 26
  info[file].interactibles[6][1][2].posy = 3
  
  info[file].interactibles[6][1][3].posx = 34
  info[file].interactibles[6][1][3].posy = 2

  info[file].interactibles[6][1][4].posx = 46
  info[file].interactibles[6][1][4].posy = 8
  
  info[file].interactibles[6][1][5].posx = 58
  info[file].interactibles[6][1][5].posy = 5
  
  info[file].interactibles[6][1][6].posx = 66
  info[file].interactibles[6][1][6].posy = 2

end

function talkNPC()
  
  for i = 1, info[file].interactibles[info[file].map.id][info[file].map.subid][0] do
    if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
      if ((info[file].dir == "Up") and collidedWithInteractiblesUp(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name)) 
      or ((info[file].dir == "Left") and collidedWithInteractiblesLeft(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name)) 
      or ((info[file].dir == "Right") and collidedWithInteractiblesRight(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name)) 
      or ((info[file].dir == "Down") and collidedWithInteractiblesDown(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name)) then
        return info[file].interactibles[info[file].map.id][info[file].map.subid][i].name
      end
    end
  end
end

function collidedWithNPCUp()
 
  if not(info[file].interactibles[info[file].map.id] == nil) 
  and not(info[file].interactibles[info[file].map.id][info[file].map.subid] == nil) then
    for i = 1, info[file].interactibles[info[file].map.id][info[file].map.subid][0] do
      if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
        if collidedWithInteractiblesUp(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name) then
          return true
        end
      end
    end
    return false
  end
end

function collidedWithNPCDown()
  
  if not(info[file].interactibles[info[file].map.id] == nil) 
  and not(info[file].interactibles[info[file].map.id][info[file].map.subid] == nil) then
    for i = 1, info[file].interactibles[info[file].map.id][info[file].map.subid][0] do
      if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
        if collidedWithInteractiblesDown(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name) then
          return true
        end
      end
    end
    return false
  end
  
end

function collidedWithNPCRight()
 
  if not(info[file].interactibles[info[file].map.id] == nil) 
  and not(info[file].interactibles[info[file].map.id][info[file].map.subid] == nil) then
   for i = 1, info[file].interactibles[info[file].map.id][info[file].map.subid][0] do
      if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
        if collidedWithInteractiblesRight(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name) then
          return true
        end
      end
    end
    return false
  end
  
end

function collidedWithNPCLeft()
  
  if not(info[file].interactibles[info[file].map.id] == nil) 
  and not(info[file].interactibles[info[file].map.id][info[file].map.subid] == nil) then
    for i = 1, info[file].interactibles[info[file].map.id][info[file].map.subid][0] do
      if info[file].interactibles[info[file].map.id][info[file].map.subid][i].name:sub(1, 3) == "NPC" then
        if collidedWithInteractiblesLeft(info[file].interactibles[info[file].map.id][info[file].map.subid][i].name) then
          return true
        end
      end
    end
    return false
  end
  
end

function collidedWithInteractiblesUp(name)
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then -- check if interactibles present
        if info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
        and info[file].posy - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
        and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == name then
          return true
        end
      end
    end
  end
  
  return false
  
end

function collidedWithInteractiblesLeft(name)
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then -- check if interactibles present
        if info[file].posx - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
        and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
        and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == name then
          return true
        end
      end
    end
  end
  
  return false
  
end

function collidedWithInteractiblesRight(name)
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then -- check if interactibles present
        if info[file].posx + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
        and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
        and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == name then
          return true
        end
      end
    end
  end
  
  return false
  
end

function collidedWithInteractiblesDown(name)
  
  if not(interactibles == nil) then
    for i = 1, interactibles[0] do
      if not(interactibles[i] == nil) then -- check if interactibles present
        if info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
        and info[file].posy + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
        and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == name then
          return true
        end
      end
    end
  end
  
  return false
  
end

function makeCaveMap()
  
  local list = {}
  
  list[1] = {}
  for k = 1, 28 do
    list[1][k] = {}
    for l = 1, 9 do
      list[1][k][l] = map[1][1][k][l]
    end
  end
  for j = 2, 5 do
    list[j] = {}
    for k = 1, 9 do
      list[j][k] = {}
      for l = 1, 9 do
        list[j][k][l] = map[1][j][k][l]
      end
    end
  end
  list[6] = {} -- sewers
  for k = 1, 9 do
    list[6][k] = {}
    for l = 1, 9 do
      list[6][k][l] = map[7][2][k][l]
    end
  end
  
  return list
  
end

function makeTownWarp()
  
  local list = {}
  
  list[1] = "I"
  for i = 2, 10 do
    list[i] = "O"
  end
  
  return list
  
end

function templeRelock()
  
  info[file].interactibles[4][6][3].posx = 1
  info[file].interactibles[4][6][3].posy = 5
  
  info[file].interactibles[4][6][4].posx = 9
  info[file].interactibles[4][6][4].posy = 5
  
  info[file].interactibles[4][6][5].posx = 5
  info[file].interactibles[4][6][5].posy = 3
  
  info[file].interactibles[4][6][6].posx = 5
  info[file].interactibles[4][6][6].posy = 7
  
end

function templeRetorch()
  
  if info[file].map.subname == "Room 5" then -- change lock position
        
    info[file].interactibles[4][6][5].posx = 4
    info[file].interactibles[4][6][5].posy = 8
    
    info[file].interactibles[4][6][6].posx = 6
    info[file].interactibles[4][6][6].posy = 8
    
  elseif info[file].map.subname == "Room 6" then
    
    info[file].interactibles[4][6][5].posx = 5
    info[file].interactibles[4][6][5].posy = 7
    
  elseif info[file].map.subname == "Room 7" then
    
    info[file].interactibles[4][6][6].posx = 5
    info[file].interactibles[4][6][6].posy = 9
    
  elseif info[file].map.subname == "Room 8" then
    
    info[file].interactibles[4][6][6].posx = 4
    info[file].interactibles[4][6][6].posy = 8
    
  elseif info[file].map.subname == "Room 9" then
    
    info[file].interactibles[4][6][5].posx = 6
    info[file].interactibles[4][6][5].posy = 8
    
  elseif info[file].map.subname == "Room 10" then
    
    info[file].interactibles[4][6][1].name = "Light - On"
    info[file].interactibles[4][6][2].name = "Light - On"
    
    info[file].interactibles[4][6][3].posx = 1
    info[file].interactibles[4][6][3].posy = 5
    
    info[file].interactibles[4][6][4].posx = 9
    info[file].interactibles[4][6][4].posy = 5
    
    info[file].interactibles[4][6][5].posx = 4
    info[file].interactibles[4][6][5].posy = 8
    
    info[file].interactibles[4][6][6].posx = 6
    info[file].interactibles[4][6][6].posy = 8
    
  end
  
end

function addLava()
  
  if info[file].posx == 1 and info[file].posy == 1 then
    info[file].prog.void.lava = "O"..info[file].prog.void.lava:sub(2, 7)
  elseif info[file].posx == 2 and info[file].posy == 1 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 1).."O"..info[file].prog.void.lava:sub(3, 7)
  elseif info[file].posx == 1 and info[file].posy == 2 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 2).."O"..info[file].prog.void.lava:sub(4, 7)
  elseif info[file].posx == 1 and info[file].posy == 3 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 3).."O"..info[file].prog.void.lava:sub(5, 7)
  elseif info[file].posx == 6 and info[file].posy == 9 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 4).."O"..info[file].prog.void.lava:sub(6, 7)
  elseif info[file].posx == 7 and info[file].posy == 9 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 5).."O"..info[file].prog.void.lava:sub(7, 7)
  elseif info[file].posx == 8 and info[file].posy == 9 then
    info[file].prog.void.lava = info[file].prog.void.lava:sub(1, 6).."O"
  end
  
end

function voidFuncIceUp()
  
  if info[file].posx == 3 and info[file].posy == 4 then
    redoMap("Void", "Void", "Void Room", 10, 7, 3, 2, 5, 5, "Up")
  elseif info[file].posx == 7 and info[file].posy == 7 then
    redoMap("Void", "Void", "Void Room", 10, 7, 7, 3, 5, 5, "Up")
  elseif info[file].posx == 5 and info[file].posy == 8 then
    redoMap("Void", "Void", "Void Room", 10, 7, 5, 6, 5, 5, "Up")
  elseif info[file].posx == 6 and info[file].posy == 8 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 5, 5, 5, "Up")
  elseif info[file].posx == 6 and info[file].posy == 9 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 5, 5, 5, "Up")
  end
  
end

function voidFuncIceLeft()
  
  if info[file].posx == 7 and info[file].posy == 3 then
    redoMap("Void", "Void", "Void Room", 10, 7, 1, 3, 5, 5, "Left")
  elseif info[file].posx == 8 and info[file].posy == 4 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 4, 5, 5, "Left")
  elseif info[file].posx == 6 and info[file].posy == 5 then
    redoMap("Void", "Void", "Void Room", 10, 7, 2, 5, 5, 5, "Left")
  elseif info[file].posx == 8 and info[file].posy == 5 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 5, 5, 5, "Left")
  elseif info[file].posx == 7 and info[file].posy == 7 then
    redoMap("Void", "Void", "Void Room", 10, 7, 2, 7, 5, 5, "Left")
  end
  
end

function voidFuncIceDown()
  
  if info[file].posx == 5 and info[file].posy == 2 then
    redoMap("Void", "Void", "Void Room", 10, 7, 5, 4, 5, 5, "Down")
  elseif info[file].posx == 7 and info[file].posy == 3 then
    redoMap("Void", "Void", "Void Room", 10, 7, 7, 7, 5, 5, "Down")
  end
  
end

function voidFuncIceRight()
  
  if info[file].posx == 1 and info[file].posy == 3 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 3, 5, 5, "Right")
  elseif info[file].posx == 2 and info[file].posy == 5 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 5, 5, 5, "Right")
  elseif info[file].posx == 2 and info[file].posy == 7 then
    redoMap("Void", "Void", "Void Room", 10, 7, 7, 7, 5, 5, "Right")
  elseif info[file].posx == 5 and info[file].posy == 8 then
    redoMap("Void", "Void", "Void Room", 10, 7, 6, 8, 5, 5, "Right")
  end
  
end

function clearedWarpRoom()
  
  for i = 1, 10 do
    if info[file].prog.town.warp[i] == "O"
    or info[file].prog.town.warp[i] == "V"
    or info[file].prog.town.warp[i] == "X" then
      return false
    end
  end
  
  return true
  
end

function showShop()

  shop = display.newImageRect("Capstone Interface/Shop.png", 270, 270)
  shop.x = 160
  shop.y = 160
  shop:addEventListener("tap", shopping)
  
  item1 = display.newText("x"..info[file].item.beatbox, 145, 40, native.systemFont, 15)
  item2 = display.newText("x"..info[file].item.scope, 145, 70, native.systemFont, 15)
  item3 = display.newText("x"..info[file].item.decoction, 145, 100, native.systemFont, 15)
  item4 = display.newText("x"..info[file].item.tonic, 145, 130, native.systemFont, 15)
  item5 = display.newText("x"..info[file].item.stungun, 145, 160, native.systemFont, 15)
  item6 = display.newText("x"..info[file].item.shuriken, 145, 190, native.systemFont, 15)
  item7 = display.newText("x"..info[file].item.repellent, 145, 220, native.systemFont, 15)
  
  item1:setFillColor(0, 0, 0)
  item2:setFillColor(0, 0, 0)
  item3:setFillColor(0, 0, 0)
  item4:setFillColor(0, 0, 0)
  item5:setFillColor(0, 0, 0)
  item6:setFillColor(0, 0, 0)
  item7:setFillColor(0, 0, 0)
  
  goldText = display.newText(info[file].item.gold.." mL", 100, 250, native.systemFont, 15)
  goldText:setFillColor(0, 0, 0)
  
end

function deleteShop()
  
  shop:removeSelf()
  shop = nil
  
  item1:removeSelf()
  item1 = nil
  item2:removeSelf()
  item2 = nil
  item3:removeSelf()
  item3 = nil
  item4:removeSelf()
  item4 = nil
  item5:removeSelf()
  item5 = nil
  item6:removeSelf()
  item6 = nil
  item7:removeSelf()
  item7 = nil
  
  goldText:removeSelf()
  goldText = nil
  
end

function shopping(event)
  
  if event.x > 250 and event.y > 270 then
    
    info[file].shop = false
    deleteShop()
  
  elseif event.x > 210 and event.x <= 265 then
  
    if event.y < 55 then
      if info[file].item.gold >= 15 then
        if info[file].item.beatbox < 9 then
          info[file].item.gold = info[file].item.gold - 15
          info[file].item.beatbox = info[file].item.beatbox + 1
          oneText("Capstone Textbox/Beatbox.png", "Brought beatbox!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Beatbox.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 85 then
      if info[file].item.gold >= 25 then
        if info[file].item.scope < 9 then
          info[file].item.gold = info[file].item.gold - 25
          info[file].item.scope = info[file].item.scope + 1
          oneText("Capstone Textbox/Scope.png", "Brought scope!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Scope.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 115 then
      if info[file].item.gold >= 40 then
        if info[file].item.decoction < 9 then
          info[file].item.gold = info[file].item.gold - 40
          info[file].item.decoction = info[file].item.decoction + 1
          oneText("Capstone Textbox/Decoction.png", "Brought decoction!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Decoction.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 145 then
      if info[file].item.gold >= 65 then
        if info[file].item.tonic < 9 then
          info[file].item.gold = info[file].item.gold - 65
          info[file].item.tonic = info[file].item.tonic + 1
          oneText("Capstone Textbox/Tonic.png", "Brought tonic!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Tonic.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 175 then
      if info[file].item.gold >= 45 then
        if info[file].item.stungun < 9 then
          info[file].item.gold = info[file].item.gold - 45
          info[file].item.stungun = info[file].item.stungun + 1
          oneText("Capstone Textbox/Stungun.png", "Brought stun gun!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Stungun.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 205 then
      if info[file].item.gold >= 45 then
        if info[file].item.shuriken < 9 then
          info[file].item.gold = info[file].item.gold - 45
          info[file].item.shuriken = info[file].item.shuriken + 1
          oneText("Capstone Textbox/Shuriken.png", "Brought shuriken!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Shuriken.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
      
    elseif event.y < 235 then
      if info[file].item.gold >= 150 then
        if info[file].item.repellent < 9 then
          info[file].item.gold = info[file].item.gold - 150
          info[file].item.repellent = info[file].item.repellent + 1
          oneText("Capstone Textbox/Repellent.png", "Brought repellent!")
          deleteShop()
          showShop()
        else
          oneText("Capstone Textbox/Repellent.png", "You already have a full stack of this item!")
        end
      else
        oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
      end
    end
    
  elseif event.x > 265 then
    
    if event.y < 55 then
      oneText("Capstone Textbox/Beatbox.png", "")
    elseif event.y < 85 then
      oneText("Capstone Textbox/Scope.png", "")
    elseif event.y < 115 then
      oneText("Capstone Textbox/Decoction.png", "")
    elseif event.y < 145 then
      oneText("Capstone Textbox/Tonic.png", "")
    elseif event.y < 175 then
      oneText("Capstone Textbox/Stungun.png", "")
    elseif event.y < 205 then
      oneText("Capstone Textbox/Shuriken.png", "")
    elseif event.y < 235 then
      oneText("Capstone Textbox/Repellent.png", "")      
    end
  
  end
end

function nearItem(x, y)
  
  if (info[file].posx == x and info[file].posy == y + 1 and info[file].dir == "Up")
  or (info[file].posx == x + 1 and info[file].posy == y and info[file].dir == "Left")
  or (info[file].posx == x - 1 and info[file].posy == y and info[file].dir == "Right")
  or (info[file].posx == x and info[file].posy == y - 1 and info[file].sir == "Down") then
    return true
  else
    return false
  end
  
end

function changeInteractiblesBar()
  
  info[file].interactibles[2][4][1].posx = 0
  info[file].interactibles[2][4][1].posy = 0
  
  info[file].interactibles[2][4][2].posx = 0
  info[file].interactibles[2][4][2].posy = 0
  
  info[file].interactibles[2][4][3].posx = 0
  info[file].interactibles[2][4][3].posy = 0
  
  info[file].interactibles[2][4][4].posx = 5
  info[file].interactibles[2][4][4].posy = 2
  
end