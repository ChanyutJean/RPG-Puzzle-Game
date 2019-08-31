function action()
  
  info[file].meta.act = info[file].meta.act + 1
  
  if info[file].text then -- has textbox
    
    if not (info[file].textpath == "") then
      
      local resetText = true
      
      if info[file].textpath == 1 or info[file].textpath == 2 or info[file].textpath == 3 or info[file].textpath == 4 or info[file].textpath == 5 then

        if info[file].textchoose then --save

          info[file].metro[1] = 2 -- is saved
          copyFile(info[file].textpath)
          
        else --load

          file = info[file].textpath -- change file

          if (info[file].metro[1] == 2) then -- has been saved before
            redoMap(info[file].map.name, info[file].map.realname, info[file].map.subname, info[file].map.id, info[file].map.subid, info[file].posx, info[file].posy, info[file].centerx, info[file].centery, info[file].dir)
          else
            redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 12, 5, 12, 5, "Down")
          end
        end
        
      elseif info[file].textpath == "compass1" then
        
        if info[file].textchoose then
          resetText = false
          info[file].textpath = "compass2"
          info[file].textchoose = true
          oneText("Capstone Textbox/Post.png", "What wish would you make?\n [[Money]]\n Time-travel")
        end
        
      elseif info[file].textpath == "compass2" then
        
        resetText = false
        info[file].textpath = ""
        if info[file].textchoose then
          oneText("Capstone Textbox/Post.png", "You obtained 99999G!\n\nUnfortunately, you can't use it here.")
        else
          oneText("Capstone Textbox/Post.png", "You traveled through time!\n\n...one second into the future.")
        end
      
      elseif info[file].textpath == "key" then
      
        info[file].textpath = ""
        if info[file].textchoose then
          resetText = false
          if info[file].item.gold >= 1000 then
            info[file].item.gold = info[file].item.gold - 1000
            info[file].prog.town.warpkey = true
            oneText("Capstone Textbox/Key.png", "You obtained a Key!")
          else
            oneText("Capstone Textbox/Gold.png", "You don't have enough money!")
          end
        end
        
      end
      
      if resetText then
      
        changeTextBox("Capstone Textbox/Default.png", "")
        info[file].textlist = nil
        info[file].textlist = {}
        info[file].text = false
      
      end
      
    else

      if not(info[file].textlist[0].num == info[file].textlist[0].pos) then
        info[file].textlist[0].pos = info[file].textlist[0].pos + 1
        if (info[file].textlist[info[file].textlist[0].pos].size == nil) then
          changeTextBox(info[file].textlist[info[file].textlist[0].pos].pic, info[file].textlist[info[file].textlist[0].pos].text, 12)
        else
          changeTextBox(info[file].textlist[info[file].textlist[0].pos].pic, info[file].textlist[info[file].textlist[0].pos].text, info[file].textlist[info[file].textlist[0].pos].size)
        end
      else
        changeTextBox("Capstone Textbox/Default.png", "")
        info[file].textlist = nil
        info[file].textlist = {}
        info[file].text = false
      end
      
    end
    
  elseif info[file].battle.on then
    return
    
  elseif not(interactibles == nil)
  and ((info[file].dir == "Up" and collidedWithNPCUp()) 
  or (info[file].dir == "Left" and collidedWithNPCLeft())
  or (info[file].dir == "Right" and collidedWithNPCRight())
  or (info[file].dir == "Down" and collidedWithNPCDown())) then -- talk to NPC

    local face = talkNPC()
    local picture = ""
    
    if face:sub(7, 7) == "R" then
      if face:sub(8, 8) == "M" then
        picture = "Capstone Textbox/NPC - Red Male.png"
      elseif face:sub(8, 8) == "F" then
        picture = "Capstone Textbox/NPC - Red Female.png"
      end
      
    elseif face:sub(7, 7) == "G" then
      if face:sub(8, 8) == "M" then
        picture = "Capstone Textbox/NPC - Green Male.png"
      elseif face:sub(8, 8) == "F" then
        picture = "Capstone Textbox/NPC - Green Female.png"
      end
      
    elseif face:sub(7, 7) == "B" then
      if face:sub(8, 8) == "M" then
        picture = "Capstone Textbox/NPC - Blue Male.png"
      elseif face:sub(8, 8) == "F" then
        picture = "Capstone Textbox/NPC - Blue Female.png"
      end
    
    elseif face:sub(7, 13) == "Old Man" then
      picture = "Capstone Textbox/NPC - Old Man.png"
    
    elseif face:sub(7, 12) == "Police" then
      picture = "Capstone Textbox/NPC - Police.png"
      
    elseif face:sub(7, 16) == "Quizmaster" then
      picture = "Capstone Textbox/NPC - Quizmaster.png"
    end
    
    if info[file].map.name == "Cave" then
      
      if info[file].map.subname == "Spawn Path" then
        if info[file].posx == 20 and info[file].posy == 8 then
          NPCOldMan(picture)
        end
      end
      
    elseif info[file].map.name == "Town" then
    
      if info[file].map.subname == "Town Square" then
        if info[file].posx == 2 and info[file].posy == 5 then
          oneText(picture, "Hi! I'm an NPC!")
        elseif info[file].posx == 8 and info[file].posy == 6 then
          NPC1(picture)
        elseif info[file].posx == 5 and info[file].posy == 9 then
          oneText(picture, "Hey, welcome to the town! You should pay visit to our renowned compass, it truly grants wishes!")
        elseif info[file].posx == 6 and info[file].posy == 9 then
          NPC2(picture)
        end
      
      elseif info[file].map.subname == "Bar" then
        if info[file].posx == 6 and info[file].posy == 7 then
          NPC3(picture)
        end
      
      elseif info[file].map.subname == "Town Square Ruins" then
      
        if info[file].posx == 2 and info[file].posy == 6 then
          info[file].interactibles[2][2][1].posx = 0
          info[file].interactibles[2][2][1].posy = 0
          oneText("Capstone Tiles/Town - Floor.png", "You defeated the manifestation of denial itself!") -- skip battle
          updateMap()
          
        elseif info[file].posx == 4 and info[file].posy == 3 then
          info[file].interactibles[2][2][2].posx = 0
          info[file].interactibles[2][2][2].posy = 0
          oneText("Capstone Tiles/Town - Floor.png", "You defeated the manifestation of anger itself!") -- skip battle
          updateMap()
          
        elseif info[file].posx == 7 and info[file].posy == 4 then
          info[file].interactibles[2][2][3].posx = 0
          info[file].interactibles[2][2][3].posy = 0
          oneText("Capstone Tiles/Town - Floor.png", "You defeated the manifestation of depression itself!") -- skip battle
          updateMap()
          
        elseif info[file].posx == 7 and info[file].posy == 7 then
          info[file].interactibles[2][2][4].posx = 0
          info[file].interactibles[2][2][4].posy = 0
          oneText("Capstone Tiles/Town - Floor.png", "You defeated the manifestation of bargaining itself!") -- skip battle
          updateMap()
          
        elseif info[file].posx == 5 and info[file].posy == 9 then
          info[file].interactibles[2][2][5].posx = 0
          info[file].interactibles[2][2][5].posy = 0
          oneText("Capstone Tiles/Town - Floor.png", "You defeated the manifestation of acceptance itself!") -- skip battle
          updateMap()
        end
      
      end
      
    elseif info[file].map.name == "Temple" then
      
      if info[file].map.subname == "Boss Room" then
        if info[file].posx == 3 and info[file].posy == 4 then
          if info[file].prog.town.crisis then
            NPCQuiz(picture)
          else
            -- start quiz show?
          end
        end
      end
      
    elseif info[file].map.name == "Metropolis" then
      
      
      
    end
    
  elseif info[file].map.name == "Cave" then
    
    if not(currentMap[info[file].posx - 1] == nil)
    and currentMap[info[file].posx - 1][info[file].posy] == "Rolling Rock" and info[file].dir == "Left" then
      oneText("Capstone Tiles/Cave - Rolling Rock.png", "You tried pushing the rock up the slope, but to no avail.")
      
    elseif not(currentMap[info[file].posx + 1] == nil) 
    and currentMap[info[file].posx + 1][info[file].posy] == "Rolling Rock" and info[file].dir == "Right" then
      info[file].prog.cave.rock = false
      redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 2, 5, 5, 5, "Right")
      oneText("Capstone Tiles/Cave - Rolling Rock.png", "The rock rolled right down the ramp, smashing the small rock. You felt accomplished.")
      
    elseif not(currentMap[info[file].posx][info[file].posy - 1] == nil)
    and currentMap[info[file].posx][info[file].posy - 1] == "Post" and info[file].dir == "Up" then
      oneText("Capstone Textbox/Post.png", "Left: Crypt Cave\nDown: Town Square")
      
    elseif not(currentMap[info[file].posx][info[file].posy - 1] == nil)
    and currentMap[info[file].posx][info[file].posy - 1] == "Fire" and info[file].dir == "Up" then
      if info[file].prog.town.blow then
        redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 2, 2, 5, 5, "Up")
        oneText("Capstone Tiles/Cave - Fire.png", "With ease, you blew the fire away!")
      else
        oneText("Capstone Tiles/Cave - Fire.png", "The fire burns passionately.")
      end
      
    elseif info[file].map.subname == "Trial of Tenacity"
    and info[file].posx == info[file].interactibles[1][5][1].posx
    and info[file].posy == info[file].interactibles[1][5][1].posy then
      
      if update then
        finishGame()
      else
        info[file].interactibles[1][5][1].posx = 0
        info[file].interactibles[1][5][1].posy = 0
        info[file].trophy.cave = true
        info[file].prog.cave.trial = 0
        oneText("Capstone Interactibles/Trophy.png", "You obtained a cave trophy!")
        redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 21, 9, 21, 5, "Up")
      end
      
    else
      
      if info[file].prog.cave.power then
        
        pushPullRock()
        
        if info[file].map.subname == "Spawn Path" then
          if currentMap[20][8] == "Push Rock" then
            info[file].interactibles[1][1][1].posx = 0
            info[file].interactibles[1][1][1].posy = 0
            updateMap()
          end
        end
        
      end
      
    end
        
  elseif info[file].map.name == "Town" then
    
    if info[file].map.subname == "Town Square" then
      
      if info[file].posx == 5 and info[file].posy == 7 and info[file].dir == "Up" then
        info[file].textpath = "compass1"
        info[file].textchoose = true
        oneText("Capstone Textbox/Post.png", "Make a wish to the compass?\n [[Yes]]\n No")
      end
      
    elseif info[file].map.subname == "Warp House" then
      
      if currentMap[info[file].posx][info[file].posy] == "Warp" then
        warpAction()
      elseif currentMap[info[file].posx][info[file].posy - 1] == "Warp Post" then
        local warpList = ""
        for i = 1, 10 do
          warpList = warpList.." "..info[file].prog.town.warp[i]
        end
        
        warpRoomText(warpList)
      
      elseif info[file].map.subid == 18
      and info[file].posx == info[file].interactibles[2][18][1].posx
      and info[file].posy == info[file].interactibles[2][18][1].posy then
      
        info[file].interactibles[2][18][1].posx = 0
        info[file].interactibles[2][18][1].posy = 0
        info[file].trophy.town = true
        oneText("Capstone Interactibles/Trophy.png", "You obtained a town trophy!")
        if info[file].map.realname == "Municipality Town" then
          redoMap("Town", "Municipality Town", "Town Square", 2, 1, 3, 3, 5, 5, "Down")
        else
          redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 3, 3, 5, 5, "Down")
        end
        
      end
      
    elseif info[file].map.subname == "Bar" then
      
      if info[file].posx == 3 and info[file].posy == 4 and info[file].dir == "Up" then
      
        --[[
        if info[file].prog.town.warpkey then
          oneText("Capstone Textbox/NPC - Green Male.png", "Thank you for your key purchase!")
        else
          info[file].textpath = "key"
          info[file].textchoose = true]]--
        --  oneText("Capstone Textbox/NPC - Green Male.png", "Trade 1000mL for a key?\n [[Yes]]\n No")
        --end

      elseif info[file].posx == 5 and info[file].posy == 4 and info[file].dir == "Up" then
      
        if info[file].map.realname == "Anarchic Town" then
          info[file].prog.town.crisis = false
          info[file].prog.alp.snowed = true
          redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 15, 38, 15, "Up") -- skip metro
          oneText("Capstone Textbox/NPC - Town Boss.png", "You defeated the evil of the town and warped to a new stage!") -- skip metro text
        end
        --[[if info[file].prog.temple == -1 and not info[file].prog.town.blow then
          info[file].prog.town.blow = true
          oneText("Capstone Textbox/Blow.png", "You learned how to blow! Wow, impressive.")
        elseif info[file].map.realname == "Anarchic Town" and info[file].prog.town.crisis then
          startBattle(info[file].battle.you.hp, info[file].battle.you.endur, info[file].battle.you.hit, 
            "Town Boss", 100, 10, 15, 1.1, 200, 3)
          info[file].prog.town.crisis = false
          info[i].prog.alp.snowed = true
          redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 15, 38, 15, "Up") -- skip metro
          oneText("Capstone Textbox/NPC - Town Boss.png", "You defeated the evil of the town and warped to a new stage!") -- skip metro text
        else
          oneText("Capstone Textbox/NPC - Blue Male.png", "Hi! See that fire in the cave? I'll make sure you blow it out if you give me the treasure from the temple!")
        end]]--
      end
    end
        
  elseif info[file].map.name == "Plains" then
    
    if info[file].posx == 5 and info[file].posy == 6 and info[file].dir == "Up" and info[file].map.subname == "Steppe Path" then
      oneText("Capstone Textbox/Post.png", "Left: Municipality Town\nRight: Steppe Plains")
    elseif info[file].map.subname == "Steppe Land" then
      
      if info[file].posx == info[file].interactibles[3][1][1].posx 
      and info[file].posy == info[file].interactibles[3][1][1].posy then
      
        info[file].interactibles[3][1][1].posx = 0
        info[file].interactibles[3][1][1].posy = 0
        info[file].trophy.plains = true
        oneText("Capstone Interactibles/Trophy.png", "You obtained a plains trophy!")
        updateMap()
      
      elseif nearItem(2, 2) and info[file].prog.plains.item:sub(1, 1) == "X" then
        info[file].prog.plains.item = "O"..info[file].prog.plains.item:sub(2, 20)
        info[file].item.shuriken = info[file].item.shuriken + 1
        oneText("Capstone Textbox/Shuriken.png", "You obtained a shuriken!")
        makeMap()
        updateMap()
      
      elseif nearItem(2, 50) and info[file].prog.plains.item:sub(2, 2) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 1).."O"..info[file].prog.plains.item:sub(3, 20)
        info[file].item.repellent = info[file].item.repellent + 1
        oneText("Capstone Textbox/Repellent.png", "You obtained a repellent!")
        makeMap()
        updateMap()
      
      elseif nearItem(14, 13) and info[file].prog.plains.item:sub(3, 3) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 2).."O"..info[file].prog.plains.item:sub(4, 20)
        info[file].item.tonic = info[file].item.tonic + 1
        oneText("Capstone Textbox/Tonic.png", "You obtained a tonic!")
        makeMap()
        updateMap()
      
      elseif nearItem(24, 15) and info[file].prog.plains.item:sub(4, 4) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 3).."O"..info[file].prog.plains.item:sub(5, 20)
        info[file].item.shuriken = info[file].item.shuriken + 1
        oneText("Capstone Textbox/Shuriken.png", "You obtained a shuriken!")
        makeMap()
        updateMap()
      
      elseif nearItem(14, 24) and info[file].prog.plains.item:sub(5, 5) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 4).."O"..info[file].prog.plains.item:sub(6, 20)
        info[file].item.decoction = info[file].item.decoction + 1
        oneText("Capstone Textbox/Decoction.png", "You obtained a decoction!")
        makeMap()
        updateMap()
        
      elseif nearItem(37, 25) and info[file].prog.plains.item:sub(6, 6) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 5).."O"..info[file].prog.plains.item:sub(7, 20)
        info[file].item.tonic = info[file].item.tonic + 1
        oneText("Capstone Textbox/Tonic.png", "You obtained a tonic!")
        makeMap()
        updateMap()
      
      elseif nearItem(27, 27) and info[file].prog.plains.item:sub(7, 7) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 6).."O"..info[file].prog.plains.item:sub(8, 20)
        info[file].item.decoction = info[file].item.decoction + 1
        oneText("Capstone Textbox/Decoction.png", "You obtained a decoction!")
        makeMap()
        updateMap()
      
      elseif nearItem(30, 30) and info[file].prog.plains.item:sub(8, 8) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 7).."O"..info[file].prog.plains.item:sub(9, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
        
      elseif nearItem(31, 30) and info[file].prog.plains.item:sub(9, 9) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 8).."O"..info[file].prog.plains.item:sub(10, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
        
      elseif nearItem(32, 30) and info[file].prog.plains.item:sub(10, 10) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 9).."O"..info[file].prog.plains.item:sub(11, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
        
      elseif nearItem(3, 31) and info[file].prog.plains.item:sub(11, 11) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 10).."O"..info[file].prog.plains.item:sub(12, 20)
        info[file].item.scope = info[file].item.scope + 1
        oneText("Capstone Textbox/Scope.png", "You obtained a scope!")
        makeMap()
        updateMap()
      
      elseif nearItem(30, 31) and info[file].prog.plains.item:sub(12, 12) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 11).."O"..info[file].prog.plains.item:sub(13, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
      
      elseif nearItem(32, 31) and info[file].prog.plains.item:sub(13, 13) == "X"  then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 12).."O"..info[file].prog.plains.item:sub(14, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
      
      elseif nearItem(30, 32) and info[file].prog.plains.item:sub(14, 14) == "X"  then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 13).."O"..info[file].prog.plains.item:sub(15, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
      
      elseif nearItem(31, 32) and info[file].prog.plains.item:sub(15, 15) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 14).."O"..info[file].prog.plains.item:sub(16, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
        
      elseif nearItem(32, 32) and info[file].prog.plains.item:sub(16, 16) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 15).."O"..info[file].prog.plains.item:sub(17, 20)
        info[file].item.gold = info[file].item.gold + 10
        oneText("Capstone Textbox/Gold.png", "You obtained 10 mL of soul!")
        makeMap()
        updateMap()
        
      elseif nearItem(31, 38) and info[file].prog.plains.item:sub(17, 17) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 16).."O"..info[file].prog.plains.item:sub(18, 20)
        info[file].item.scope = info[file].item.scope + 1
        oneText("Capstone Textbox/Scope.png", "You obtained a scope!")
        makeMap()
        updateMap()
        
      elseif nearItem(26, 48) and info[file].prog.plains.item:sub(18, 18) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 17).."O"..info[file].prog.plains.item:sub(19, 20)
        info[file].item.beatbox = info[file].item.beatbox + 1
        oneText("Capstone Textbox/Beatbox.png", "You obtained a beatbox!")
        makeMap()
        updateMap()
      
      elseif nearItem(2, 50) and info[file].prog.plains.item:sub(19, 19) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 18).."O"..info[file].prog.plains.item:sub(20, 20)
        info[file].item.beatbox = info[file].item.beatbox + 1
        oneText("Capstone Textbox/Beatbox.png", "You obtained a beatbox!")
        makeMap()
        updateMap()
        
      elseif nearItem(50, 50) and info[file].prog.plains.item:sub(20, 20) == "X" then
        info[file].prog.plains.item = info[file].prog.plains.item:sub(1, 19).."O"
        info[file].item.repellent = info[file].item.repellent + 1
        oneText("Capstone Textbox/Repellent.png", "You obtained a repellent!")
        makeMap()
        updateMap()
      end
      
    end
        
  elseif info[file].map.name == "Temple" then
    
    if not (info[file].interactibles[info[file].map.id][info[file].map.subid] == nil)
    and info[file].interactibles[info[file].map.id][info[file].map.subid][1].name == "Light - Off" -- lighting torches
    and info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][1].posx
    and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][1].posy then

      if info[file].map.subname == "Room 10" then
        info[file].prog.temple = 10
      else
        info[file].prog.temple = tonumber(info[file].map.subname:sub(6, 6))
      end
      info[file].interactibles[info[file].map.id][info[file].map.subid][1].name = "Light - On"
      if info[file].map.subname == "Room 1"
      or info[file].map.subname == "Room 2"
      or info[file].map.subname == "Room 3" 
      or info[file].map.subname == "Room 4" then
        info[file].interactibles[4][1][tonumber(info[file].map.subname:sub(6, 6))].name = "Light - On"
      else
        templeRetorch()
      end
      
      makeRawMap()
      updateRawMap()
      deleteInteractibles()
      makeInteractibles()
      you:toFront()
      specialMove = false
      
    elseif info[file].map.subname == "First Floor" -- read post
    and info[file].posx == 4
    and info[file].posy == 4
    and info[file].dir == "Up" then
      
      templePost()
      
    elseif info[file].map.subname == "Boss Room" then
      
      if (info[file].posx == 5 and info[file].posy == 5 and info[file].dir == "Up")
      or (info[file].posx == 4 and info[file].posy == 4 and info[file].dir == "Right")
      or (info[file].posx == 6 and info[file].posy == 4 and info[file].dir == "Left")
      or (info[file].posx == 5 and info[file].posy == 3 and info[file].dir == "Down") then
        oneText("Capstone Tiles/Temple - Book.png", "The book seems to be smudged and incomprehensible.") -- skip battle tome
      end
      
    end
        
  elseif info[file].map.name == "Volcano" then
    
    local hasCrack = false
    
    for i = 1, text[info[file].map.id][info[file].map.subid][0].lenx do
      for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
        if currentMap[i][j] == "Crack" then
          hasCrack = true
        end
      end
    end
    
    if info[file].map.subname == "Trophy Peak" 
    and info[file].posx == info[file].interactibles[5][10][1].posx 
    and info[file].posy == info[file].interactibles[5][10][1].posy then
      
      info[file].interactibles[5][10][1].posx = 0
      info[file].interactibles[5][10][1].posy = 0
      info[file].trophy.volcano = true
      oneText("Capstone Interactibles/Trophy.png", "You obtained a volcano trophy!")
      updateMap()
      
    elseif not info[file].prog.volcano.climb and info[file].map.subname == "Cave 2" and info[file].posx == 5 and info[file].posy == 5 then -- climber
      
      if hasCrack then
        oneText("Capstone Interactibles/Volcano Climb.png", "It seems like you need to turn all cracks into lava to obtain the item.")
      else
        info[file].prog.volcano.climb = true
        info[file].interactibles[5][3][1].posx = 0
        info[file].interactibles[5][3][1].posy = 0
        oneText("Capstone Interactibles/Volcano Climb.png", "You obtained a volcanic climbing tool. Now, you can scale the volcano!")
        updateMap()
      end
    
    elseif (not (currentMap[info[file].posx][info[file].posy - 1] == nil) and (currentMap[info[file].posx][info[file].posy - 1] == "Lava" and info[file].dir == "Up"))
    or (not (currentMap[info[file].posx][info[file].posy + 1] == nil) and (currentMap[info[file].posx][info[file].posy + 1] == "Lava" and info[file].dir == "Down"))
    or (not (currentMap[info[file].posx - 1] == nil) and (currentMap[info[file].posx - 1][info[file].posy] == "Lava" and info[file].dir == "Left"))
    or (not (currentMap[info[file].posx + 1] == nil) and (currentMap[info[file].posx + 1][info[file].posy] == "Lava" and info[file].dir == "Right")) then
      
      oneText("Capstone Tiles/Volcano - Lava.png", "A fire lizard jumps out of the lava!")
      
      if info[file].map.subname == "Cave 1" then
        redoMap("Volcano", "Mesa Volcano", "Cave 1", 5, 2, 9, 5, 5, 5, "Down")
      elseif info[file].map.subname == "Cave 2" then
        redoMap("Volcano", "Mesa Volcano", "Cave 2", 5, 3, 5, 8, 5, 5, "Down")
      elseif info[file].map.subname == "Cave 3" then
        redoMap("Volcano", "Mesa Volcano", "Cave 3", 5, 4, 1, 5, 5, 5, "Down")
      elseif info[file].map.subname == "Cave 4" then
        redoMap("Volcano", "Mesa Volcano", "Cave 4", 5, 5, 9, 8, 5, 5, "Down")
      elseif info[file].map.subname == "Cave 5" then
        redoMap("Volcano", "Mesa Volcano", "Cave 5", 5, 6, 23, 5, 19, 5, "Down")
      elseif info[file].map.subname == "Cave 6" then
        redoMap("Volcano", "Mesa Volcano", "Cave 6", 5, 7, 5, 18, 5, 15, "Down")
      elseif info[file].map.subname == "Cave 7" then
        redoMap("Volcano", "Mesa Volcano", "Cave 7", 5, 8, 9, 8, 9, 5, "Down")
      elseif info[file].map.subname == "Master Cave" then
        redoMap("Volcano", "Mesa Volcano", "Master Cave", 5, 9, 18, 10, 14, 10, "Down")
      elseif info[file].map.subname == "Trophy Peak" then
        redoMap("Volcano", "Mesa Volcano", "Trophy Peak", 5, 10, 5, 9, 5, 5, "Down")
      elseif info[file].map.subname == "Exterior" then
        redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 33, 15, 33, 15, "Down")
      end
       
    elseif not (currentMap[info[file].posx][info[file].posy - 1] == nil) and currentMap[info[file].posx][info[file].posy - 1] == "Post" and info[file].dir == "Up" then
      
      oneText("Capstone Tiles/Volcano - Post.png", "Left: Cave 4\n Far Right: Master Cave")
      
    elseif not(interactibles == nil) then -- check lock
      
      for i = 1, interactibles[0] do
        if not(interactibles[i] == nil) then -- check if interactibles present

          if (info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
          and info[file].posy - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
          and info[file].dir == "Up"
          and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == "Lock") 
          or (info[file].posx - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
          and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
          and info[file].dir == "Left"
          and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == "Lock")
          or (info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
          and info[file].posy + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
          and info[file].dir == "Down"
          and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == "Lock") 
          or (info[file].posx + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
          and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
          and info[file].dir == "Right"
          and info[file].interactibles[info[file].map.id][info[file].map.subid][i].name == "Lock") then
            
            if info[file].map.subname == "Cave 3" then
              
              hasCrack = false
              
              for i = info[file].posx - 2, info[file].posx do -- check from x - 2 to x
                for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
                  if currentMap[i][j] == "Crack" then
                    hasCrack = true
                  end
                end
              end  
      
            elseif info[file].map.subname == "Cave 5" then
              
              hasCrack = false
              
              for i = info[file].posx, info[file].posx + 4 do -- check from x to x + 4
                for j = 1, text[info[file].map.id][info[file].map.subid][0].leny do
                  if currentMap[i][j] == "Crack" then
                    hasCrack = true
                  end
                end
              end  
                  
            end
              
            if hasCrack then
              oneText("Capstone Interactibles/Lock.png", "The path may open when all paths are charred red.")
            else
              oneText("Capstone Interactibles/Lock.png", "The lock unlocks!")
              info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx = 0
              info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy = 0
              updateMap()
            end
              
          end
        end
      end
    end
        
  elseif info[file].map.name == "Desert" then
    
    if info[file].posx == 2 and info[file].posy == 2 and info[file].dir == "Up" then
      
      oneText("Capstone Textbox/Post.png", "Left: Mesa Mountain\nRight: Crypt Cave")
    
    elseif info[file].dir == "Left" 
    and not (currentMap[info[file].posx - 1] == nil)
    and currentMap[info[file].posx - 1][info[file].posy] == "Switch" then -- push switch
      
      currentMap[info[file].posx - 1][info[file].posy] = "Right"
      if info[file].posx == 11 then
        info[file].prog.desert.switch = "O"..info[file].prog.desert.switch:sub(2, 2)
      elseif info[file].posx == 44 then
        info[file].prog.desert.switch = info[file].prog.desert.switch:sub(1, 1).."O"
      end
      updateMap()
      
    else
    
      local pushed = false
    
      if not(interactibles == nil) then -- check for statue
      
        for i = 1, interactibles[0] do
          if not(interactibles[i] == nil) then -- check if interactibles present
            
            if (info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
            and info[file].posy - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
            and info[file].dir == "Up")
            or (info[file].posx - 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
            and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy
            and info[file].dir == "Left")
            or (info[file].posx == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
            and info[file].posy + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
            and info[file].dir == "Down")
            or (info[file].posx + 1 == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posx
            and info[file].posy == info[file].interactibles[info[file].map.id][info[file].map.subid][i].posy 
            and info[file].dir == "Right") then
              
              pushed = true
              pushStatue(i)

            end
            
          end
        end
      end
      
      if not pushed then
        
        local collidedWithLaser = false
        
        for i = 1, info[file].numLaser do -- check for laser collision
          if not (laserImg[i] == nil) then
            if (info[file].posx == laserImg[i].posx)
            and (info[file].posy == laserImg[i].posy) then
              collidedWithLaser = true
            end
          end
        end
        
        if not collidedWithLaser then
          changeLaser()
          updateMap()
        end
        
      end
      
    end
    
  elseif info[file].map.name == "Metropolis" then
    
    if info[file].posx == 14 and info[file].posy == 14 and info[file].dir == "Up" then -- Pier
      info[file].prog.desert.dessert = false
      for i = 1, 6 do 
        info[file].interactibles[6][1][i].posx = 0
        info[file].interactibles[6][1][i].posy = 0
      end
      redoMap("Desert", "Arid Desert", "Pier", 6, 2, 5, 7, 5, 5, "Up")
    
    elseif info[file].posx == 11 and info[file].posy == 15 and info[file].dir == "Up" then -- Post
      metroPost()
    
    elseif info[file].map.subname == "Sewers" then
      pushPullRock()
    end
        
  elseif info[file].map.name == "Snow" then 
    
    if info[file].map.subname == "Trophy Peak" 
    and info[file].posx == info[file].interactibles[8][9][1].posx 
    and info[file].posy == info[file].interactibles[8][9][1].posy then
      
      info[file].interactibles[8][9][1].posx = 0
      info[file].interactibles[8][9][1].posy = 0
      info[file].trophy.snow = true
      oneText("Capstone Interactibles/Trophy.png", "You obtained an alp trophy!")
      updateMap()
    
    elseif not info[file].prog.alp.climb and info[file].map.subname == "Cave 2" and info[file].posx == 5 and info[file].posy == 5 then -- climber
      info[file].prog.alp.climb = true
      info[file].interactibles[8][3][1].posx = 0
      info[file].interactibles[8][3][1].posy = 0
      oneText("Capstone Interactibles/Snow Climb.png", "You obtained a snow climbing tool. Now, you can scale the alp!")
      updateMap()
    
    elseif not (currentMap[info[file].posx][info[file].posy - 1] == nil) and currentMap[info[file].posx][info[file].posy - 1] == "Post" and info[file].dir == "Up" then
      
      oneText("Capstone Tiles/Snow - Post.png", "Left Exit: Crypt Cave\n Right Exit: Arid Desert")
      
    end
        
  elseif info[file].map.name == "Ruins" then
    
    if info[file].map.subname == "3F, North Sector" then -- arrow switch
      
      if info[file].posx == 5 and info[file].posy == 3 and info[file].dir == "Up" then
        for i = 1, 9 do
          for j = 1, 9 do
            if currentMap[i][j] == "Up" then 
              currentMap[i][j] = "Down" 
            elseif currentMap[i][j] == "Left" then 
              currentMap[i][j] = "Right" 
            elseif currentMap[i][j] == "Right" then 
              currentMap[i][j] = "Left" 
            elseif currentMap[i][j] == "Down" then 
              currentMap[i][j] = "Up"
            end
          end
        end
        updateMap()
      end
      
    elseif info[file].map.subname == "3F, South Sector" then -- stair switch 3F
    
      if info[file].posx == 6 and info[file].posy == 7 and info[file].dir == "Up" and currentMap[5][6] == "Track" then
        currentMap[5][6] = "Floor"
        info[file].prog.ruins.stair = 3
        updateMap()
      end
    
    elseif info[file].map.subname == "6F, South Sector" then -- stair switch 6F
    
      if info[file].posx == 6 and info[file].posy == 7 and info[file].dir == "Up" and currentMap[5][6] == "Track" then
        currentMap[5][6] = "Floor"
        info[file].prog.ruins.stair = 6
        updateMap()
      end
    
    elseif info[file].map.subname == "Boss Room" then
    
      if info[file].posx == 6 and info[file].posy == 7 and info[file].dir == "Up" then
        oneText("Capstone Interactibles/Capstone.png", "It's almost over! Next is the void stage!") -- skip fight and metro
      end
      
    end
  
  elseif info[file].map.name == "Void" then

    if info[file].map.subname == "Volcano Room" then
      
      oneText("Capstone Tiles/Volcano - Crack.png", "Resetted tiles.")
      redoMap("Void", "Void", "Volcano Room", 10, 3, 9, 9, 5, 5, "Down")
      
    elseif info[file].map.subname == "Temple Room" then
      
      if not(currentMap[info[file].posx][info[file].posy] == "Book"
      or currentMap[info[file].posx][info[file].posy] == "Item"
      or currentMap[info[file].posx][info[file].posy] == "Item 2"
      or currentMap[info[file].posx][info[file].posy] == "Ladder") -- in a warp zone
      and not info[file].prog.void.templestep then -- and had not just warped before
        
        local warped = false
        
        for i = 1, 9 do
          if not warped then
            for j = 1, 9 do
              if not warped then
                if currentMap[i][j] == currentMap[info[file].posx][info[file].posy]
                and not(i == info[file].posx and j == info[file].posy) then
                  warped = true
                  info[file].prog.void.templestep = true
                  redoMap("Void", "Void", "Temple Room", 10, 6, i, j, 5, 5, info[file].dir)
                end
              end
            end
          end
        end
        
      end
      
    elseif info[file].map.subname == "Void Room" then -- 
      
      if info[file].posx == 1 and info[file].posy == 9 then
        if not info[file].prog.void.templestep then
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 5, 6, 5, 5, info[file].dir)
        end
        
      elseif info[file].posx == 5 and info[file].posy == 6 then
        if not info[file].prog.void.templestep then
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 1, 9, 5, 5, info[file].dir)
        end
        
      elseif info[file].posx == 8 and info[file].posy == 2 then
        if not info[file].prog.void.templestep then
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 9, 7, 5, 5, info[file].dir)
        end
        
      elseif info[file].posx == 9 and info[file].posy == 7 then
        if not info[file].prog.void.templestep then
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 8, 2, 5, 5, info[file].dir)
        end
        
      elseif info[file].posx == 5 and info[file].posy == 8 then
        if not info[file].prog.void.templestep then
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 9, 5, 5, 5, info[file].dir)
        end
        
      elseif info[file].posx == 9 and info[file].posy == 5 then
        if not info[file].prog.void.templestep then 
          info[file].prog.void.templestep = true
          redoMap("Void", "Void", "Void Room", 10, 7, 5, 8, 5, 5, info[file].dir)
        end
        
      else
        info[file].prog.void.templestep = false
        oneText("Capstone Tiles/Void - Crack.png", "Resetted tiles.")
        info[file].prog.void.lava = "XXXXXXX"
        redoMap("Void", "Void", "Void Room", 10, 7, 9, 9, 5, 5, "Down")
      
      end
    
    end
    
  end
  
end