-- Beta - to do list

-- Real Game To-Do (outdated)
--[[
music
--metropolis tower
--metro add npc
--interactibles event click
--NPC quizmaster
--relic ruins boss room
--save files: type password
-- log button was supposed to be adventure log and download save password
--trophy room metropolis: complete tasks like "be on save slot 4" or "walk up 100 times. 
metropolis -- personality, einstein puzzles, sudoku, walk according to instructions
-- map where you can move in but not out?
post in every map - find in minigame
weird scroll map

minor bug fixings:
mesa volcano/alp cave 5 no scroll.
desert prevent statues from merging to each other.
]]--

--[[
Metro file list:
start with 1
1 - 1 = Has not been saved before, 2 = has been saved
2 - 1 = main house, 2 = spirit house
10 -
]]--

-- Capstone Game: Main Code

-- Load map data

require("mapdata")
require("maprender")

-- Load button controls

require("upcontrol")
require("leftcontrol")
require("rightcontrol")
require("downcontrol")

require("actcontrol")
require("actfunction")

require("menucontrol")
require("logcontrol")
require("textcontrol")

require("savecontrol")
require("savefunction")

-- Load functions

require("interactibles") -- interactibles data
require("mainfunction")

require("mapfunction")
require("textfunction")

-- Load battle phases

require("fightcontrol")
require("battleinterface")

-- Load interface

require("buttoninterface")

-- Introduction

update = false
title = display.newImageRect("Icon.png", 270, 270)
title.x = 160
title.y = 160
option1 = display.newText("> Play the entire story", 160, 345, 300, 30, native.systemFontBold, "left")
option1:addEventListener("tap", nextIntro1)
option2 = display.newText("> Choose stage to play", 160, 395, 300, 30, native.systemFontBold, "left")
option2:addEventListener("tap", gotonewInterface)

-- Test codes

--[[for i = 1, 100 do
print(native.getFontNames()[i])
end]]--

-- Create map


--redoMap(info[file].map.name, info[file].map.realname, info[file].map.subname, info[file].map.id, info[file].map.subid, info[file].posx, info[file].posy, info[file].centerx, info[file].centery, info[file].dir)

-- The start
--redoMap("Cave", "Crypt Cave", "Spawn Path", 1, 1, 12, 5, 12, 5, "Down")


--redoMap("Cave", "Crypt Cave", "Trial of Insight", 1, 2, 5, 1, 5, 5, "Down")
--redoMap("Cave", "Crypt Cave", "Trial of Courage", 1, 3, 8, 1, 5, 5)
--redoMap("Cave", "Crypt Cave", "Trial of Visage", 1, 4, 6, 1, 5, 5)
--redoMap("Cave", "Crypt Cave", "Trial of Tenacity", 1, 5, 8, 1, 5, 5, "Down")
--redoMap("Cave", "Crypt Cave", "Trial of Tenacity", 1, 5, 8, 8, 5, 5, "Down")

--redoMap("Town", "Municipality Town", "Town Square", 2, 1, 5, 5, 5, 5, "Down")


--After desert
--redoMap("Town", "Anarchic Town", "Town Square Ruins", 2, 2, 2, 6, 5, 5, "Down")


--redoMap("Town", "Municipality Town", "Warp House", 2, 16, 5, 5, 5, 5, "Down")
--redoMap("Plains", "Steppe Plains", "Steppe Land", 3, 1, 26, 50, 26, 47, "Down")

--redoMap("Temple", "Fane Temple", "First Floor", 4, 1, 5, 5, 5, 5, "Down")
--redoMap("Temple", "Fane Temple", "Room 1", 4, 2, 5, 9, 5, 5, "Down")
--redoMap("Temple", "Fane Temple", "Second Floor", 4, 6, 5, 9, 5, 5, "Down")
--redoMap("Temple", "Fane Temple", "Room 10", 4, 12, 8, 7, 8, 7, "Down")
--redoMap("Temple", "Fane Temple", "Boss Room", 4, 13, 5, 5, 5, 5, "Down")

--redoMap("Volcano", "Mesa Volcano", "Trophy Peak", 5, 10, 5, 9, 5, 5, "Down")
--redoMap("Volcano", "Mesa Volcano", "Cave 5", 5, 6, 18, 5, 18, 5, "Down")
--redoMap("Volcano", "Mesa Volcano", "Exterior", 5, 1, 10, 14, 10, 14, "Down")
--redoMap("Volcano", "Mesa Volcano", "Cave 5", 5, 6, 6, 5, 6, 5, "Down")

--redoMap("Desert", "Arid Desert", "Dessert's Lair", 6, 1, 5, 5, 5, 5, "Down")

--redoMap("Metropolis", "Metropolitan City", "Main Area", 7, 1, 8, 18, 8, 18, "Down")


-- After alp
--redoMap("Ruins", "Relic Ruins", "1F, South Sector", 9, 1, 5, 8, 5, 5, "Up")


--redoMap("Ruins", "Relic Ruins", "3F, South Sector", 9, 5, 5, 7, 5, 5, "Down")
--redoMap("Ruins", "Relic Ruins", "6F, South Sector", 9, 11, 5, 7, 5, 5, "Down")

-- after Ruins
--redoMap("Ruins", "Relic Ruins", "Boss Room", 9, 16, 5, 5, 5, 5, "Down")

--redoMap("Void", "Void", "Cave Room", 10, 1, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Plains Room", 10, 2, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Volcano Room", 10, 3, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Alp Room", 10, 4, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Ruins Room", 10, 5, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Temple Room", 10, 6, 5, 5, 5, 5, "Down")
--redoMap("Void", "Void", "Void Room", 10, 7, 9, 9, 5, 5, "Down")
--redoMap("Ruins", "Relic Ruins", "6F, South Sector", 9, 11, 5, 9, 5, 5, "Down")
--redoMap("Ruins", "Relic Ruins", "3F, North Sector", 9, 6, 5, 5, 5, 5, "Down")
--redoMap("Ruins", "Relic Ruins", "3F, South Sector", 9, 5, 5, 7, 5, 5, "Down")
--redoMap("Ruins", "Relic Ruins", "Boss Room", 9, 16, 5, 5, 5, 5, "Down")

--redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 25, 5, 25, 5, "Down")
--redoMap("Snow", "Mesa Alp", "Exterior", 8, 1, 38, 15, 38, 15, "Up")
--redoMap("Snow", "Mesa Alp", "Cave 2", 8, 3, 5, 5, 5, 5, "Down")
