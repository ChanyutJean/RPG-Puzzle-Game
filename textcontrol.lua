function changeTextBox(pic, text, size)
  
  info[file].text = true
  
  textimage:removeSelf()
  textimage = nil
  textimage = display.newImageRect(pic, 50, 50)
  textimage.x = 55 -- 30 to 80
  textimage.y = 330 -- 305 to 355
  
  textbox:removeSelf()
  textbox = nil
  textbox = display.newText(text, 187.5, 330, 200, 45, native.systemFont, size, "left")
  
end

function oneText(pic, text)
  
  info[file].textlist[0] = {}
  info[file].textlist[0].num = 1
  info[file].textlist[0].pos = 1
  info[file].textlist[1] = {}
  info[file].textlist[1].pic = pic
  info[file].textlist[1].text = text
  changeTextBox(info[file].textlist[1].pic, info[file].textlist[1].text, 12)
  
end

function tileTextBox(event)
  
  if info[file].shop then
    return
  end
  
  if info[file].battle.on then
    return
  end
  
  if not info[file].text then
    
    local eventPos = currentMap
    [math.ceil((event.x - 25) / 30) + (info[file].centerx - 5)] -- posx
    [math.ceil((event.y - 25) / 30) + (info[file].centery - 5)] -- posy
    
    if eventPos == "Floor" then
      
      oneText("Capstone Tiles/"..info[file].map.name.." - Floor.png", 
        "This is a floor!\nNo matter how hard you fall, it will always be there for you.")
      
    elseif eventPos == "Void" then
      
      oneText("Capstone Tiles/"..info[file].map.name.." - Void.png", 
        "Everyone yearns for that place they'll never reach... Either way, tough luck, you can't go there.")
      
    elseif eventPos == "Post" then
      
      postText()
      
    elseif info[file].map.name == "Cave" then
      
      if eventPos == "Crushed Rock" then
        
        oneText("Capstone Tiles/Cave - Crushed Rock.png", 
        "It's the remnants of that small rock you should've just walked around.")
        
      elseif eventPos == "Fire" then
        
        oneText("Capstone Tiles/Cave - Fire.png",
          "This inanimated fire just seems to piss you off. Such amateurish drawings.")
        
      elseif eventPos == "Hole" or eventPos == "Fake Hole" then
        
        caveHoleText()
        
      elseif eventPos == "Horizontal" then
        
        oneText("Capstone Tiles/Cave - Horizontal.png",
          "A pretty normal functioning bridge. Just either go across or under it. And don't jump.")
      
      elseif eventPos == "Ladder" then
      
        oneText("Capstone Tiles/Cave - Ladder.png",
          "It's either a ladder or it's a stepladder, deal with it.")
        
      elseif eventPos == "Monster" then
        
        oneText("Capstone Tiles/Cave - Monster.png",
          "Oh yeah, it's that orange hexagonal slime thingy or whatever. Moving on.")
        
      elseif eventPos == "Pull Rock" or eventPos == "Fake Pull Rock" then
        
        oneText("Capstone Tiles/Cave - Pull Rock.png",
          "As always, 'act' on it to pull it. Make sure you don't get stuck by pulling yourself into a corner!")
      
      elseif eventPos == "Push Rock" then
      
        if info[file].prog.cave.power then
      
          oneText("Capstone Tiles/Cave - Push Rock.png",
            "As always, 'act' on it to push it. Make sure you know where to push before it gets stuck in a corner!")
        
        else
        
          oneText("Capstone Tiles/Cave - Push Rock.png",
            "You don't seem to have a way to push this rock right now. Let's move on.")
        
        end
        
      elseif eventPos == "Rolling Rock" then
        
        oneText("Capstone Tiles/Cave - Rolling Rock.png",
          "It's a rock dyed so dark, so dark it can roll downhill if you 'act' on it. Wait, does that make sense?")
        
      elseif eventPos == "Second Floor Rock" then
        
        oneText("Capstone Tiles/Cave - Second Floor Rock.png",
          "It's a rock on a rock, and that rocks! Oh, an you can't walk past it, and that sucks.")
        
      elseif eventPos == "Second Floor" then
        
        oneText("Capstone Tiles/Cave - Second Floor.png",
          "It's a rock that you can walk past, the puns you now see have now hit rock bottom. Ahahaha.")
        
      elseif eventPos == "Small Rock" then
        
        oneText("Capstone Tiles/Cave - Small Rock.png",
          "This annoying rock refuses to let you pass through it, so let's crush it.")
        
      elseif eventPos == "Spawn" then
        
        if info[file].prog.cave.visit == 1 then
          oneText("Capstone Tiles/Cave - Spawn.png",
            "It's your spawn!")
        else            
          oneText("Capstone Tiles/Cave - Spawn.png",
            "It's that reminiscent spawn from a while back. A wave of nostalgia rushes through you.")
        end
      
      elseif eventPos == "Stacked Rock" then
      
        oneText("Capstone Tiles/Cave - Stacked Rock.png",
          "It's a stacked rock. Stack them in two of the four corners to move forward with the trial!")
        
      elseif eventPos == "Stair Down" or eventPos == "Stair Up" then
        
        oneText("Capstone Tiles/Cave - "..eventPos..".png",
          "It's an exit to a whole new world! Or something like that.")
        
      elseif eventPos == "Vertical" then
        
        oneText("Capstone Tiles/Cave - Vertical.png",
          "Sincerely, you should not be reading this text. There are no vertical cave bridges in this game.")
        
      elseif eventPos == "Way Down" or eventPos == "Way Right" then
        
        oneText("Capstone Tiles/Cave - "..eventPos..".png",
          "Move past down the ladder to move to the first floor.")
      
      end
    
    elseif info[file].map.name == "Town" then
    
      if eventPos == "Bar 1" or eventPos == "Bar 2" or eventPos == "Bar 3" or eventPos == "Bar 4" then
        
        
        oneText("Capstone Tiles/Town - Bar.png",
          "Bar: A meeting place for exchange of goods and information.")
        
      elseif eventPos:sub(1, 4) == "Cave" then
        
        oneText("Capstone Tiles/Town - Cave.png",
          "Crypt Cave: A resting place for worn souls, and a starting place for fresh ones.")
        
      elseif eventPos:sub(1, 7) == "Compass" then
        
        oneText("Capstone Tiles/Town - Compass.png",
          "Compass: Guidance to a peaceful world. 'Act' on it to make a wish!")
        
      elseif eventPos:sub(1, 6) == "Police" then
        
        oneText("Capstone Tiles/Town - Police.png",
          "Police Station: The place that makes this a municipal town.")
        
      elseif eventPos == "Warp 1" or eventPos == "Warp 2" or eventPos == "Warp 3" or eventPos == "Warp 4" then
        
        oneText("Capstone Tiles/Town - Warp House.png",
          "Warp House: Perhaps you can find a key in the bar?")
        
      elseif eventPos:sub(1, 4) == "Shop" then
        
        oneText("Capstone Tiles/Town - Shop.png",
          "Shop: The finiest selection to suit your battle needs!")
        
      elseif eventPos:sub(1, 7) == "Old Bar" then
        
        oneText("Capstone Tiles/Town - Old Bar.png",
          "Bar: A meeting place for all things evil.")
        
      elseif eventPos:sub(1, 11) == "Old Compass" then
        
        oneText("Capstone Tiles/Town - Old Compass.png",
          "Compass: An illusory guidance to an impossible utopia.")
        
      elseif eventPos:sub(1, 10) == "Old Police" then
        
        oneText("Capstone Tiles/Town - Old Police.png",
          "Police Station: A farce of a sanctuary for hopeless pleas.")
        
      elseif eventPos:sub(1, 8) == "Old Shop" then
        
        oneText("Capstone Tiles/Town - Old Shop.png",
          "Shop: The finest selection to suit your savory, monstrous needs!")
        
      elseif eventPos:sub(1, 8) == "Old Warp" then
        
        oneText("Capstone Tiles/Town - Old Warp.png", 
          "Warp House: Perhaps you can still find a key in the bar?")
          
      elseif eventPos == "Bar Counter" or eventPos == "Bar Counter 2" then
        
        oneText("Capstone Tiles/Town - Bar Counter 2.png",
          "Feel free to 'act' and ask away on anything related to your adventurous needs!")
        
      elseif eventPos == "Bar Chair" then
        
        oneText("Capstone Tiles/Town - Bar Chair.png",
          "Whoever sits here gets to be a chairman!")
        
      elseif eventPos == "Bar Table" then
        
        oneText("Capstone Tiles/Town - Bar Table.png",
          "Let's table on tabling tables on this table. We have other stuff to do. Like play some table jokes.")
        
      elseif eventPos == "Bar Exit" then
        
        oneText("Capstone Tiles/Town - Bar Exit.png",
          "At least have some drinks before you exit, you cheapskate!")
        
      elseif eventPos == "Bar Floor" then
        
        oneText("Capstone Tiles/Town - Bar Floor.png",
          "This is a floor!\nNo matter how hard you fall... Well, be careful of glass hazards.")
        
      elseif eventPos == "Bar Void" then
        
        oneText("Capstone Tiles/Town - Bar Void.png",
          "Everyone yearns for that place they'll never reach... It's a wall, what do you want?")
        
      elseif eventPos == "Black" then
        
        oneText("Capstone Tiles/Town - Black.png", "Black.")
        
      elseif eventPos == "White" then
        
        oneText("Capstone Tiles/Town - White.png", "White.")
        
      elseif eventPos == "Up" then
        
        oneText("Capstone Tiles/Town - Up.png", "This way to Metropolitan City!")
        
      elseif eventPos == "Left" then
        
        oneText("Capstone Tiles/Town - Left.png", "This way to Arid Desert!")
        
      elseif eventPos == "Right" then
        
        oneText("Capstone Tiles/Town - Right.png", "This way to Steppe Plains!")
        
      elseif eventPos == "Down" then
        
        oneText("Capstone Tiles/Town - Down.png", "This way to Empty Room!")
        
      elseif eventPos == "Rubble" then
        
        oneText("Capstone Tiles/Town - Rubble.png", "The ruins of a once municipal town.")
        
      elseif eventPos == "Warp Floor" then
        
        oneText("Capstone Tiles/Town - Warp Floor.png", 
          "This is a floor!\nNo matter how hard you fall... Well, this place is weird, so no guarantee.")
        
      elseif eventPos == "Warp Post" then
        
        oneText("Capstone Tiles/Town - Warp Post.png",
          "A peculiar star-shaped post.\n'Act' on it to see which rooms you have visited.")
        
      elseif eventPos == "Warp" then
        
        oneText("Capstone Tiles/Town - Warp.png",
          "A truly befuddling tile. Press 'act' when you're on it to warp.")
        
      elseif eventPos == "Warp Void" then
        
        oneText("Capstone Tiles/Town - Warp Void.png",
          "Everyone yearns for that place they'll never reach... Actually, don't yearn right now, this place is weird.")
        
      elseif eventPos:sub(1, 9) == "Warp Room" then
        
        oneText("Capstone Tiles/Town - "..eventPos..".png",
          "A label of the room you're in. Well, I hope you know roman numerals.")
        
      end
          
    elseif info[file].map.name == "Plains" then
      
      if eventPos:sub(1, 5) == "Fence" then
        
        oneText("Capstone Tiles/Plains - "..eventPos..".png", 
          "Let the fencing tournament begin! En garde! Parry! Riposte! Feint! Oh, I'm in the wrong side of the fence.")
        
      elseif eventPos == "Item" then
        
        oneText("Capstone Tiles/Plains - Item.png",
          "A magical bag filled with treasures sits on the plain, untouched by other travelers. 'Act' on it to grab it.")
        
      elseif eventPos:sub(1, 6) == "Temple" then
        
        oneText("Capstone Tiles/Plains - Temple.png",
          "Let's not make puns about this sacred temple in the middle of nowhere. Pfft.")
        
      else
        
        oneText("Capstone Tiles/Plains - "..eventPos..".png",
          "Travelers suggest you follow those runic arrows to reach Fane Temple. But you do you.")
        
      end
      
    elseif info[file].map.name == "Temple" then
      
      if eventPos == "Book" then
        
        oneText("Capstone Tiles/Temple - Book.png",
          "A prestigious veteran tome.\n'Act' on it to read about combat techniques!")
        
      elseif eventPos == "Item" or eventPos == "Item 2" then
        
        oneText("Capstone Tiles/Temple - "..eventPos..".png",
          "A magical bag sits idly, as if waiting for you to 'act' on it to grab it in preparation for an epic fight.")
        
      elseif eventPos == "Ladder" then
        
        oneText("Capstone Tiles/Temple - Ladder.png",
          "It's a staircase! Walk on it to reach to the other floor.")
        
      else
        
        oneText("Capstone Tiles/Temple - "..eventPos..".png",
          "Hey, did someone call this tiny line an indestructible wall you need to walk around? Has this world gone crazy?")
        
      end
      
    elseif info[file].map.name == "Volcano" then
      
      if eventPos == "Binocular" then
        
        oneText("Capstone Tiles/Volcano - Binocular.png",
          "'Act' on it to obtain a new perspective from these binoculars.")
        
      elseif eventPos == "Cave" then
        
        oneText("Capstone Tiles/Volcano - Cave.png",
          "An interconnected volcanic cave.\nBe careful when stepping on tectontic cracks on the ground inside!")
        
      elseif eventPos == "Climb" then
        
        oneText("Capstone Tiles/Volcano - Climb.png",
          "A scalable patches of mountain. Use a climbing tool to ascend the volcano!")
        
      elseif eventPos == "Crack" then
        
        oneText("Capstone Tiles/Volcano - Crack.png",
          "A treacherous crack on the ground. Walk through it before it breaks into lava!")
        
      elseif eventPos == "Exit" then
        
        oneText("Capstone Tiles/Volcano - Exit.png",
          "An exit back to the volcano exterior.")
        
      elseif eventPos == "Lava" then
        
        volcanoLava()
        
      elseif eventPos == "Ledge" then
        
        oneText("Capstone Tiles/Volcano - Ledge.png",
          "A fairly nice ledge for you to jump down below. Remember, it's a one way trip down the volcano!")
        
      elseif eventPos == "Left" then
        
        oneText("Capstone Tiles/Volcano - Left.png",
          "A demanding slant that drives you only downhill to the left. For there is no right way.")
          
      elseif eventPos == "Right" then
        
        oneText("Capstone Tiles/Volcano - Right.png",
          "A demanding slant that drives you only downhill to the right. For there is only the right way.")
        
      elseif eventPos == "Rock" then
        
        oneText("Capstone Tiles/Volcano - Rock.png",
          "A fiery, steadfast rock. You cannot walk through it, for only papers beat rock.")
        
      elseif eventPos == "Stair" then
        
        volcanoStair()
      
      elseif eventPos == "Wall" or eventPos == "Wall 2" then
      
        oneText("Capstone Tiles/Volcano - "..eventPos..".png",
          "Everyone yearns for that place they'll never reach... Either way, tough luck, you can't go there.")
        
      elseif eventPos == "Way Out Up" or eventPos == "Way Out Down" then
        
        oneText("Capstone Tiles/Volcano - "..eventPos..".png",
          "An exit out of the area.")
        
      end
    
    elseif info[file].map.name == "Desert" then
    
      if eventPos == "Dessert" then
        
        dessertText()
        
      elseif eventPos:sub(1, 5) == "Fence" then
        
        oneText("Capstone Tiles/Desert - "..eventPos..".png",
          "Let the fencing tournament begin! En garde! Parry! Riposte! Feint! Oh, was this joke already played?")
        
      elseif eventPos == "Up" or eventPos == "Left" or eventPos == "Down" or eventPos == "Right" then
        
        oneText("Capstone Tiles/Desert - "..eventPos..".png",
          "A collapsed old wall that became a slope downhill from sacrificial grounds.")
        
      elseif eventPos == "Monster" then
        
        oneText("Capstone Tiles/Desert - Monster.png",
          "X marks the spot that happens to be useless at this moment.")
        
      elseif eventPos == "Platform" then
        
        oneText("Capstone Tiles/Desert - Platform.png",
          "An elevated platform that seems to serve as sacrificial grounds. Don't go there!")
        
      elseif eventPos == "Rune" then
        
        oneText("Capstone Tiles/Desert - Rune.png",
          "A rune created from fresh blood that seems to be used in sacrificial ceremony. Don't go there!")
        
      elseif eventPos == "Slide" then
        
        oneText("Capstone Tiles/Desert - Slide.png",
          "A smooth downhill slope back to town, at long last!")
        
      elseif eventPos == "Switch" then
        
        oneText("Capstone Tiles/Desert - Switch.png",
          "An unusual button next to a wall might crush the wall itself if you 'act' on it!")
          
      elseif eventPos == "Pier" then
        
        if info[i].prog.desert.dessert then
        
          oneText("Capstone Tiles/Desert - Pier.png",
          "These lonely planks of log seems to be waiting for some visitor from the buzzling metropolis. Is it you?")
        
        else
        
          oneText("Capstone Tiles/Desert - Pier.png",
          "These ecstatic planks of log seems to be welcoming you to a new challenge in the desert. How nice!")
        
        end
        
      elseif eventPos == "Water" then
        
        oneText("Capstone Tiles/Desert - Water.png",
          "These bodies of water stretches to the horizon, making you wonder if this is actually a desert.")
        
      end
      
    elseif info[file].map.name == "Metropolis" then
      
      if eventPos == "Barricade" then
        oneText("Capstone Tiles/City - Barricade.png",
          "It's a barricade!")
      elseif eventPos == "Bridge Left" or eventPos == "Bridge Right" then
        oneText("Capstone Tiles/City - "..eventPos..".png",
          "It's a bridge!")
      elseif eventPos == "Cave Entrance" then
        oneText("Capstone Tiles/City - Cave Entrance.png",
          "It's a cave entrance!")
      elseif eventPos == "Cave Wall" then
        oneText("Capstone Tiles/City - Cave Wall.png",
          "It's a cave!")
      elseif eventPos == "Cone" then
        oneText("Capstone Tiles/City - Cone.png",
          "It's a cone!")
      elseif eventPos == "Crossroad Left" or eventPos == "Crossroad Right" then
        oneText("Capstone Tiles/City - "..eventPos..".png",
          "It's a crossroad!")
      elseif eventPos == "Fence Corner Left" or eventPos == "Fence Corner Right" or eventPos == "Fence Horizontal" or eventPos == "Fence Vertical" then
        oneText("Capstone Tiles/City - "..eventPos..".png",
          "It's a fence!")
      elseif eventPos == "Flower" then
        oneText("Capstone Tiles/City - Flower.png",
          "It's a flower!")
      elseif eventPos:sub(1, 7) == "House 1" then
        oneText("Capstone Tiles/City - House 1.png",
          "It's a building!")
      elseif eventPos:sub(1, 7) == "House 2" then
        oneText("Capstone Tiles/City - House 2.png",
          "It's a residence!")
      elseif eventPos:sub(1, 15) == "Corner Building" then
        oneText("Capstone Tiles/City - Corner Building.png",
          "It's a greenhouse!")
      elseif eventPos:sub(1, 9) == "Mad House" or eventPos:sub(1, 5) == "Smoke" then
        oneText("Capstone Tiles/City - Mad House.png",
          "It's a lab!")
      elseif eventPos:sub(1, 12) == "Main House 1" then
        oneText("Capstone Tiles/City - Main House 1.png",
          "It's an abandoned skyscraper!")
      elseif eventPos:sub(1, 12) == "Main House 2" then
        oneText("Capstone Tiles/City - Main House 2.png",
          "It's a spiritual home!")
      elseif eventPos:sub(1, 6) == "Tunnel" then
        oneText("Capstone Tiles/City - Tunnel.png",
          "It's a tunnel!")
      elseif eventPos:sub(1, 5) == "Tower" then
        onetext("Capstone Tiles/City - Tower.png",
          "It's a tower!")
      elseif eventPos == "Pier" then
        oneText("Capstone Tiles/City - Pier.png",
          "It's a pier!")
      elseif eventPos == "Plains" then
        oneText("Capstone Tiles/City - Plains.png",
          "It's a meadow!")
      elseif eventPos == "Post" then
        oneText("Capstone Tiles/City - Post.png",
          "It's a post!")
      elseif eventPos == "Road Left" or eventPos == "Road Right" then
        oneText("Capstone Tiles/City - "..eventPos..".png",
          "It's a road!")
      elseif eventPos:sub(1, 4) == "Shop" then
        oneText("Capstone Tiles/City - Shop.png",
          "It's a shop!")
      elseif eventPos:sub(1, 6) == "Trophy" then
        oneText("Capstone Tiles/City - Trophy.png",
          "It's a trophy building!")
      elseif eventPos == "Water" then
        oneText("Capstone Tiles/City - Water.png",
          "It's a body of water!")
      end
    
    elseif info[file].map.name == "Snow" then
    
      if eventPos:sub(1, 9) == "Highlight" then
        
        oneText("Capstone Tiles/Snow - "..eventPos..".png",
          "You seem to be slipping to here.")
        
      elseif eventPos == "Bridge" then
        
        oneText("Capstone Tiles/Snow - Bridge.png",
          "A pretty cliched worn out plank bridge. Seems like it might fall down anytime soon.")
        
      elseif eventPos == "Cave" then
        
        oneText("Capstone Tiles/Snow - Cave.png",
          "An interconnected snow cave.\nBe careful about the slippery ground inside!")
        
      elseif eventPos == "Climb" then
        
        oneText("Capstone Tiles/Snow - Climb.png",
          "A scalable patches of mountain. Use a climbing tool to ascend the alp!")
        
      elseif eventPos == "Exit" then
        
        oneText("Capstone Tiles/Snow - Exit.png",
          "An exit back to the snow mountain exterior.")
        
      elseif eventPos == "Floored" then
        
        oneText("Capstone Tiles/Snow - Floored.png",
          "The residue of a snowball blockade. You can now walk through!")
         
      elseif eventPos == "Hole" then
        
        oneText("Capstone Tiles/Snow - Hole.png",
          "A peculiar hollow hole sits next to a snowball blocking your way. 'Act' to push the snowball into the hole!")
        
      elseif eventPos == "Ice" then
        
        oneText("Capstone Tiles/Snow - Ice.png",
          "A slippery floor offers you a slip of ticket to the edge of the area.")
        
      elseif eventPos == "Ledge" then
        
        oneText("Capstone Tiles/Snow - Ledge.png",
          "A fairly nice ledge for you to jump down below. Remember, it's a one way trip down the alp!")
        
      elseif eventPos == "Path" then
        
        oneText("Capstone Tiles/Snow - Path.png",
          "An illusory path that seems to never exist. How is this text able to be read?")
        
      elseif eventPos == "Rock" then
        
        oneText("Capstone Tiles/Snow - Rock.png",
          "An icy, steadfast rock. You cannot walk through it, for only papers beat rock.")
        
      elseif eventPos == "Snowball" then
        
        oneText("Capstone Tiles/Snow - Snowball.png",
          "A snowball blocking the path. As always, you can't seem to walk around it.")
        
      elseif eventPos == "Stair" then
        
        snowStair()
      
      elseif eventPos == "Wall" or eventPos == "Wall 2" then
      
        oneText("Capstone Tiles/Snow - "..eventPos..".png",
          "Everyone yearns for that place they'll never reach... Either way, tough luck, you can't go there.")
        
      elseif eventPos == "Way Out Up" or eventPos == "Way Out Down" then
        
        oneText("Capstone Tiles/Snow - "..eventPos..".png",
          "An exit out of the area.")
        
      end
        
    elseif info[file].map.name == "Ruins" then
      
      if eventPos == "Crack" then
        
        oneText("Capstone Tiles/Ruins - Crack.png",
          "This mild crack seems to indicate a hole above this floor at this area. Keep cracking on!")
        
      elseif eventPos == "Up" or eventPos == "Down" or eventPos == "Left" or eventPos == "Right" then
        
        oneText("Capstone Tiles/Ruins - "..eventPos..".png",
          "A directional pad here seems to be forcing you to direct on its way.")
          
      elseif eventPos == "Very Up" or eventPos == "Very Down" or eventPos == "Very Left" or eventPos == "Very Right" then
        
        oneText("Capstone Tiles/Ruins - "..eventPos..".png",
          "A more swift directional pad here seems to be forcing you to direct to the edge of the area.")
          
      elseif eventPos == "From Down" or eventPos == "From Up" or eventPos == "Tile 3F" then
        
        oneText("Capstone Tiles/Ruins - "..eventPos..".png",
          "A hallway leading to a different area of the same floor.")
          
      elseif eventPos == "Hole" then
        
        oneText("Capstone Tiles/Ruins - Hole.png",
          "Falling down to the previous floor might be inevitable if you step here, but you might progress if you do fall!")
        
      elseif eventPos == "Rock" then
        
        oneText("Capstone Tiles/Ruins - Rock.png", 
          "An runic, steadfast rock. You cannot walk through it, for only papers beat rock.")
        
      elseif eventPos == "Special Stair" or eventPos == "Stair Down" or eventPos == "Stair Up"then
        
        oneText("Capstone Tiles/Ruins - "..eventPos..".png",
          "A stair moving you to a different floor. Look out on whether it moves you up, down, or something else!")
        
      elseif eventPos == "Switch" then
        
        oneText("Capstone Tiles/Ruins - Switch.png",
          "A tantalizing blue switch presents itself to you. Should you 'act' on it?")
        
      elseif eventPos == "Track" then
        
        oneText("Capstone Tiles/Ruins - Track.png",
          "An insurmountable blue barricade presents itself to you. Should you 'act' on the switch to press it, it might disappear!")
        
      end
      
    elseif info[file].map.name == "Void" then
      
      if eventPos == "1" or eventPos == "2" or eventPos == "3" or eventPos == "4" then
        
        oneText("Capstone Tiles/Void - "..eventPos..".png",
          "This seems to be an exit tile.")
        
      elseif eventPos == "Crack" then
        
        oneText("Capstone Tiles/Void - Crack.png",
          "This seems to be a fiery tile.")
        
      elseif eventPos == "Up" or eventPos == "Down" or eventPos == "Left" or eventPos == "Right" then
        
        oneText("Capstone Tiles/Void - "..eventPos..".png",
          "This seems to be a direction tile.")
        
      elseif eventPos == "Ice" then
        
        oneText("Capstone Tiles/Void - Ice.png",
          "This seems to be an icy tile.")
        
      elseif eventPos == "Lava" then
        
        oneText("Capstone Tiles/Void - Lava.png",
          "This seems to be a lava tile.")
        
      elseif eventPos == "Rock" then
        
        oneText("Capstone Tiles/Void - Rock.png",
          "This seems to be a rock tile.")
        
      elseif eventPos == "Very Left" or eventPos == "Very Up" then
        
        oneText("Capstone Tiles/Void - "..eventPos..".png",
          "This seems to be a swift tile.")
        
      elseif eventPos == "Warp A" or eventPos == "Warp B" or eventPos == "Warp C" then
        
        oneText("Capstone Tiles/Void - "..eventPos..".png",
          "This seems to be a warp tile.")
        
      else -- other map tiles
        
        oneText("Capstone Textbox/Question.png",
          "This seems like a jumbled up tile.")
        
      end
    end
  end

end
