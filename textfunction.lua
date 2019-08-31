function textPathUp()
  
  if info[file].textpath == 1 or info[file].textpath == 2 or info[file].textpath == 3 or info[file].textpath == 4 or info[file].textpath == 5 then
    oneText("Capstone Interface/"..tostring(info[file].textpath)..".png", "Save or load file " ..tostring(info[file].textpath).."?\n [[Save]]\n Load")
  elseif info[file].textpath == "compass1" then
    oneText("Capstone Textbox/Post.png", "Make a wish to the compass?\n [[Yes]]\n No")
  elseif info[file].textpath == "compass2" then
    oneText("Capstone Textbox/Post.png", "What wish would you make?\n [[Money]]\n Time-travel")
  elseif info[file].textpath == "key" then
    oneText("Capstone Textbox/Post.png", "Trade 1000mL for a key?\n [[Yes]]\n No")
  end
end

function textPathDown()
  
  if info[file].textpath == 1 or info[file].textpath == 2 or info[file].textpath == 3 or info[file].textpath == 4 or info[file].textpath == 5 then
    oneText("Capstone Interface/"..tostring(info[file].textpath)..".png", "Save or load file " ..tostring(info[file].textpath).."?\n Save\n [[Load]]")
  elseif info[file].textpath == "compass1" then
    oneText("Capstone Textbox/Post.png", "Make a wish to the compass?\n Yes\n [[No]]")
  elseif info[file].textpath == "compass2" then
    oneText("Capstone Textbox/Post.png", "What wish would you make?\n Money\n [[Time-travel]]")
  elseif info[file].textpath == "key" then
    oneText("Capstone Textbox/Post.png", "Trade 1000mL for a key?\n Yes\n [[No]]")
  end
end

function templePost()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 1
  info[file].textlist[0].pos = 1
  
  if info[file].prog.temple == 0 then
  
    info[file].textlist[1] = {}
    info[file].textlist[1].pic = "Capstone Textbox/Post.png"
    info[file].textlist[1].text = "Up: Room 1\nDown: Steppe Plains"
    
  elseif info[file].prog.temple == 1 then
    
    info[file].textlist[1] = {}
    info[file].textlist[1].pic = "Capstone Textbox/Post.png"
    info[file].textlist[1].text = "Left: Room 2\nDown: Steppe Plains"
    
  elseif info[file].prog.temple == 2 then
    
    info[file].textlist[1] = {}
    info[file].textlist[1].pic = "Capstone Textbox/Post.png"
    info[file].textlist[1].text = "Right: Room 3\nDown: Steppe Plains"
    
  elseif info[file].prog.temple == 3 then
    
    info[file].textlist[1] = {}
    info[file].textlist[1].pic = "Capstone Textbox/Post.png"
    info[file].textlist[1].text = "Up: Room 4\nDown: Steppe Plains"
    
  else
    
    info[file].textlist[1] = {}
    info[file].textlist[1].pic = "Capstone Textbox/Post.png"
    info[file].textlist[1].text = "Ladder: Second Floor\nDown: Steppe Plains"
    
  end
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function insightTrialText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 7
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[1].text = "Welcome! They say that with great power comes great insight, and now is the time to prove it, right?"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[2].text = "Either way! You who have traveled far and wide should have known something very impoertant by now:"
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[3].text = "It's that an insightful tactic can turn a lost cause into an opportunity!"
  
  info[file].textlist[4] = {}
  info[file].textlist[4].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[4].text = "But is there enough of them in you for you to pass though this trial of insight?"
  
  info[file].textlist[5] = {}
  info[file].textlist[5].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[5].text = "In those four corners with weirdly shaped rock, only two of them can be pulled!"
  
  info[file].textlist[6] = {}
  info[file].textlist[6].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[6].text = "Use them to your advantage to push rocks into the hole..."
  
  info[file].textlist[7] = {}
  info[file].textlist[7].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[7].text = "...then make your way downwards to win this trial! Good luck!"
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function courageTrialText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 4
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[1].text = "Mmmm! Next is the trial of courage! No insights would be useful without the courage to execute them!"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[2].text = "In this trial, two of the four holes in the corners are fake."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[3].text = "With that said, manuever around them to get to the bottom of the cave!"
  
  info[file].textlist[4] = {}
  info[file].textlist[4].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[4].text = "By the way, good job on the last trial, I now have a newfound respect for you."
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function visageTrialText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 4
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[1].text = "Greetings, this is the trial of visage!"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[2].text = "Don't you agree? Those which intellect and those with courage can't triumph..."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[3].text = "...without the ability to see things through right from the start!"
  
  info[file].textlist[4] = {}
  info[file].textlist[4].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[4].text = "Anyways, to pass the trial, you must stack a rock on top of another in two of the corners!"
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function tenacityTrialText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 3
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[1].text = "You've arrived at the last trial, the trial of tenacity!"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[2].text = "Intellect, courage, and visage together will never be complete..."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Textbox/NPC - Old Man.png"
  info[file].textlist[3].text = "not without the ability to see things through to the end! And so, good luck."
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function warpRoomText(warpList)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Town - Warp.png"
  info[file].textlist[1].text = "Rooms Visited:\n"..warpList
  
  info[file].textlist[2] = {}
  
  if info[file].map.subid == 16 then
    
    if clearedWarpRoom() then
      
      info[file].textlist[2].pic = "Capstone Tiles/Town - Warp.png"
      info[file].textlist[2].text = "The path opened!"
      
      currentMap[5][8] = "Warp Floor"
      updateMap()
      
    else  
  
      info[file].textlist[2].pic = "Capstone Tiles/Town - Warp.png"
      info[file].textlist[2].text = "To proceed, reach this room by visiting ten rooms with I's."
    
  end
  
  else
  
    info[file].textlist[2].pic = "Capstone Tiles/Town - Warp.png"
    info[file].textlist[2].text = "To proceed, reach the twelfth through only rooms with eyes."
  
  end

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function metroPost()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 3
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Textbox/Post.png"
  info[file].textlist[1].text = "Welcome to Metropolitan City!\nNorthwest: Bridge of Revelation\nFar East: Metro Tower"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Textbox/Post.png"
  info[file].textlist[2].text = "East: Metropolis Shop\nSouth: Municipality Town\nSouthwest: Sewers"
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Textbox/Post.png"
  info[file].textlist[3].text = "Act on the fourteenth of fourteenth to reach the dessertless desert with a new challenge."
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function caveHoleText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Cave - Hole.png"
  info[file].textlist[1].text = "Incapable of coming up with golf jokes, you are reminded that these trials are freaking hard."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/Cave - Hole.png"
  info[file].textlist[2].text = "Either way, you can jump over these holes if there's a place to jump to, or just cover them with rocks."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function postText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/"..info[file].map.name.." - Post.png"
  info[file].textlist[1].text = "Ever wondered about who keeps putting these posts around everywhere?"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/"..info[file].map.name.." - Post.png"
  info[file].textlist[2].text = "Well, let's indulge and see what it says by going there and 'acting' on it."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function volcanoStair()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Volcano - Stair.png"
  info[file].textlist[1].text = "A kindhearted stair guides you along through the grueling volcano."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/Volcano - Stair.png"
  info[file].textlist[2].text = "Let's take the offer and brave through the last bits of this lava-ridden area."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function volcanoLava()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Volcano - Lava.png" 
  info[file].textlist[1].text = "A fire lizard lies beneath this menacing lava. Should you get stuck, a fight with it might not be so bad."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/Volcano - Lava.png"
  info[file].textlist[2].text = "'Act' on the lava to begin combat."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
 
end

function dessertText()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 9
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[1].text = "Okay, listen, this stationary crimson anarchid is fairly sophisticated, pay attention."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[2].text = "Now, these desserts monitor this area using their laser vision with a fixed length. Don't let them see you."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[3].text = "You can 'act' and slightly startle them, so that they can change their field of view."
  
  info[file].textlist[4] = {}
  info[file].textlist[4].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[4].text = "If you start walking, they will also change their vision. You should walk so that you don't collide."
  
  info[file].textlist[5] = {}
  info[file].textlist[5].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[5].text = "If you walk horizontally, they will change to have a vertical laser, and vice versa."
  
  info[file].textlist[6] = {}
  info[file].textlist[6].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[6].text = "They will also try to switch up their field of view as much as possible."
  
  info[file].textlist[7] = {}
  info[file].textlist[7].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[7].text = "To avoid their vision, plan your moves accordingly..."
  
  info[file].textlist[8] = {}
  info[file].textlist[8].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[8].text = "...and use the green tetrahedral statues to block their view if possible."
  
  info[file].textlist[9] = {}
  info[file].textlist[9].pic = "Capstone Tiles/Desert - Dessert.png"
  info[file].textlist[9].text = "Wish you luck on this barren land, cheers."
  
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function snowStair()
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = "Capstone Tiles/Snow - Stair.png"
  info[file].textlist[1].text = "A kindhearted stair guides you along through the grueling mountain."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = "Capstone Tiles/Snow - Stair.png"
  info[file].textlist[2].text = "Let's take the offer and brave through the last bits of this snow-ridden area."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function NPCOldMan(picture)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 4
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = picture
  info[file].textlist[1].text = "It's saddening. Nobody craves a good quality puzzle anymore."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = picture
  info[file].textlist[2].text = "Nowadays, it's just solving easy puzzles accompanied by cool animations."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = picture
  info[file].textlist[3].text = "But still, do you want to relive ye olden days of challenging puzzles?"
  
  info[file].textlist[4] = {}
  info[file].textlist[4].pic = picture
  info[file].textlist[4].text = "Bring forth a rock to the place where you are now, and the trial shall begin."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function NPC1(picture)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = picture
  info[file].textlist[1].text = "Are you going to Steppe Plains? Make sure you stack up your inventory, it's a tough world out there!"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = picture
  info[file].textlist[2].text = "Also, up in the plains, they say you can follow those mysterious arrows to reach your destination!"

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function NPC2(picture)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = picture
  info[file].textlist[1].text = "Hey, welcome to the town! It might be small here, and we're still reconstructing the road to the city..."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = picture
  info[file].textlist[2].text = "...but make yourself at home!"

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function NPC3(picture)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 3
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = picture
  info[file].textlist[1].text = "Did you know? Rumors has been going on here for a while about that police station."
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = picture
  info[file].textlist[2].text = "Someone so vile is being kept there, that all hell would let loose if that guy were to break out."
  
  info[file].textlist[3] = {}
  info[file].textlist[3].pic = picture
  info[file].textlist[3].text = "Scary stuff. Nobody cares enough to brave through inside that station."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function NPCQuiz(picture)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 2
  info[file].textlist[0].pos = 1
  
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = picture
  info[file].textlist[1].text = "Hello! I'm currently making a quiz right here and now just for you!"
  
  info[file].textlist[2] = {}
  info[file].textlist[2].pic = picture
  info[file].textlist[2].text = "If you're interested, please come back when, say, the town's road to the city has finished it construction."

  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function capstoneTextbox()
  oneText("Capstone Interactibles/Capstone.png", "It's Capstone!")
end

function starryTextbox()
  oneText("Capstone Interactibles/Starry.png", "It's Starry!")
end

function lightOffTextbox()
  oneText("Capstone Interactibles/Light - Off.png", "It's an unlit torch! Is it reachable? If it is, then 'act' on it to light it up!")
end

function lightOnTextbox()
  oneText("Capstone Interactibles/Light - On.png", "It's a torch! May it's flames guide us into an eternal happiness.")
end

function lockTextbox()
  oneText("Capstone Interactibles/Lock.png", "It's a lock! The path seems to be blocked; is there some other way, or some way to unlock it?")
end

function snowClimbTextbox()
  oneText("Capstone Interactibles/Snow Climb.png", "It's a climbing tool! 'Act' on it to obtain it and scale the mountain.")
end

function volcanoClimbTextbox()
  oneText("Capstone Interactibles/Volcano Climb.png", "It's a scaling tool! 'Act' on it to obtain it and climb the volcano.")
end

function statueTextbox()
  oneText("Capstone Interactibles/Statue.png", "It seems to be a relocatable statue! 'Act' on it to move it to block the dessert's laser vision!")
end

function trophyTextbox()
  oneText("Capstone Interactibles/Trophy.png", "It's a trophy! 'Act' on it to receive your well-earned trophy!")
end