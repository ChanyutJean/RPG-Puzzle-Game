print("hi")
for i = 1, 9 do
  for j = 1, 9 do 
    if i == 2 or j == 8 or (i == 9 and j > 5) then
      img = display.newImageRect("Capstone Tiles/Cave - Second Floor Rock.png", 30, 30)
    elseif i == 8 or j == 7 then
      img = display.newImageRect("Capstone Tiles/Cave - Second Floor.png", 30, 30)
    elseif i == 2 or j == 3 then
      img = display.newImageRect("Capstone Tiles/Cave - Stacked Rock.png", 30, 30)
    else
      img = display.newImageRect("Capstone Tiles/Cave - Push Rock.png", 30, 30)
    end
    img.x = 30 * i
    img.y = 30 * j
  end
end
--[[for i = 1, 9 do
  for j = 1, 9 do 
    value = math.random(1, 4)
    if value == 1 then
      img = display.newImageRect("Capstone Tiles/Volcano - Crack.png", 30, 30)
    elseif value == 2 then
      img = display.newImageRect("Capstone Tiles/Volcano - Lava.png", 30, 30)
    elseif value == 3 then
      img = display.newImageRect("Capstone Tiles/Volcano - Rock.png", 30, 30)
    else
      img = display.newImageRect("Capstone Tiles/Volcano - Floor.png", 30, 30)
    end
    img.x = 30 * i
    img.y = 30 * j
  end
end
for i = 1, 9 do
  for j = 1, 9 do 
    value = math.random(1, 4)
    if value == 1 then
      img = display.newImageRect("Capstone Tiles/Temple - WASD.png", 30, 30)
    elseif value == 2 then
      img = display.newImageRect("Capstone Tiles/Temple - XAXD.png", 30, 30)
    elseif value == 3 then
      img = display.newImageRect("Capstone Tiles/Temple - WXSD.png", 30, 30)
    else
      img = display.newImageRect("Capstone Tiles/Temple - XXSX.png", 30, 30)
    end
    img.x = 30 * i
    img.y = 30 * j
  end
end
for i = 1, 9 do
  for j = 1, 9 do 
    
    img = display.newImageRect("Capstone Tiles/Plains - Floor.png", 30, 30)
    
    img.x = 30 * i
    img.y = 30 * j
  end
end
for i = 1, 9 do
  for j = 1, 9 do 
    
    img = display.newImageRect("Capstone Tiles/Snow - Floor.png", 30, 30)
    
    img.x = 30 * i
    img.y = 30 * j
  end
end]]--

for i = 1, 9 do
  for j = 1, 9 do 
    if i == 2 or j == 8 or (i == 9 and j > 5) then
      img = display.newImageRect("Capstone Tiles/Ruins - Ladder.png", 30, 30)
    elseif i == 8 or j == 7 then
      img = display.newImageRect("Capstone Tiles/Ruins - Hole.png", 30, 30)
    elseif i == 2 or j == 3 then
      img = display.newImageRect("Capstone Tiles/Ruins - Rock.png", 30, 30)
    elseif i < 3 and math.random() < 0.5 then
      img = display.newImageRect("Capstone Tiles/Ruins - Crack.png", 30, 30)
      
    else
      img = display.newImageRect("Capstone Tiles/Ruins - Floor.png", 30, 30)
    end
    img.x = 30 * i
    img.y = 30 * j
  end
end