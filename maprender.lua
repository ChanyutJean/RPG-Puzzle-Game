-- All Maps

map = {}

-- 1. Cave Map

map[1] = {}

for l = 1, 5 do 
  
  map[1][l] = {}
  
  for i = 1, text[1][l][0].lenx do
    map[1][l][i] = {}
    for j = 1, text[1][l][0].leny do
      local panel = text[1][l][j]:sub(i, i)
      if panel == "O" then
        map[1][l][i][j] = "Floor"
      elseif panel == "A" then
        map[1][l][i][j] = "Stair Up"
      elseif panel == "B" then
        map[1][l][i][j] = "Horizontal"
      elseif panel == "C" then
        map[1][l][i][j] = "Spawn"
      elseif panel == "D" then
        map[1][l][i][j] = "Stair Down"
      elseif panel == "E" then
        map[1][l][i][j] = "Push Rock"
      elseif panel == "F" then
        map[1][l][i][j] = "Rolling Rock"
      elseif panel == "G" then
        map[1][l][i][j] = "Fire"
      elseif panel == "H" then
        map[1][l][i][j] = "Monster 1"
      elseif panel == "I" then
        map[1][l][i][j] = "Monster 2"
      elseif panel == "J" then
        map[1][l][i][j] = "Monster 3"
      elseif panel == "K" then
        map[1][l][i][j] = "Hole"
      elseif panel == "L" then
        map[1][l][i][j] = "Ladder"
      elseif panel == "M" then
        map[1][l][i][j] = "Pull Rock"
      elseif panel == "N" then
        map[1][l][i][j] = "Second Floor Rock"
      elseif panel == "P" then
        map[1][l][i][j] = "Post"
      elseif panel == "Q" then
        map[1][l][i][j] = "Second Floor"
      elseif panel == "R" then
        map[1][l][i][j] = "Second Floor Mark"
      elseif panel == "S" then
        map[1][l][i][j] = "Stacked Rock"
      elseif panel == "T" then
        map[1][l][i][j] = "Small Rock"
      elseif panel == "X" then
        map[1][l][i][j] = "Void"
      elseif panel == "Y" then
        map[1][l][i][j] = "Fake Pull Rock"
      elseif panel == "Z" then
        map[1][l][i][j] = "Fake Hole"
      end
    end
  end
end

-- 2. Town Map

map[2] = {}

for l = 1, 18 do
  map[2][l] = {}
end

for i = 1, text[2][1][0].lenx do
  map[2][1][i] = {}
  for j = 1, text[2][1][0].leny do
    local panel = text[2][1][j]:sub(i, i)
    if panel == "O" then
      map[2][1][i][j] = "Floor"
    elseif panel == "A" then
      map[2][1][i][j] = "Cave 1"
    elseif panel == "B" then
      map[2][1][i][j] = "Cave 2"
    elseif panel == "C" then
      map[2][1][i][j] = "Cave 3"
    elseif panel == "D" then
      map[2][1][i][j] = "Cave 4"
    elseif panel == "E" then
      map[2][1][i][j] = "Cave 5"
    elseif panel == "F" then
      map[2][1][i][j] = "Cave 6"
    elseif panel == "G" then
      map[2][1][i][j] = "Bar 1"
    elseif panel == "H" then
      map[2][1][i][j] = "Bar 2"
    elseif panel == "I" then
      map[2][1][i][j] = "Bar 3"
    elseif panel == "J" then
      map[2][1][i][j] = "Bar 4"
    elseif panel == "K" then
      map[2][1][i][j] = "Police 1"
    elseif panel == "L" then
      map[2][1][i][j] = "Police 2"
    elseif panel == "M" then
      map[2][1][i][j] = "Police 3"
    elseif panel == "N" then
      map[2][1][i][j] = "Police 4"
    elseif panel == "P" then
      map[2][1][i][j] = "Warp 1"
    elseif panel == "Q" then
      map[2][1][i][j] = "Warp 2"
    elseif panel == "R" then
      map[2][1][i][j] = "Warp 3"
    elseif panel == "S" then
      map[2][1][i][j] = "Warp 4"
    elseif panel == "T" then
      map[2][1][i][j] = "Shop 1"
    elseif panel == "U" then
      map[2][1][i][j] = "Shop 2"
    elseif panel == "V" then
      map[2][1][i][j] = "Shop 3"
    elseif panel == "W" then
      map[2][1][i][j] = "Shop 4"
    elseif panel == "X" then
      map[2][1][i][j] = "Shop 5"
    elseif panel == "Y" then
      map[2][1][i][j] = "Shop 6"
    elseif panel == "1" then
      map[2][1][i][j] = "Compass 1"
    elseif panel == "2" then
      map[2][1][i][j] = "Compass 2"
    elseif panel == "3" then
      map[2][1][i][j] = "Compass 3"
    elseif panel == "4" then
      map[2][1][i][j] = "Compass 4"
    elseif panel == "5" then
      map[2][1][i][j] = "Compass 5"
    elseif panel == "6" then
      map[2][1][i][j] = "Compass 6"
    elseif panel == "7" then
      map[2][1][i][j] = "Compass 7"
    elseif panel == "8" then
      map[2][1][i][j] = "Compass 8"
    elseif panel == "9" then
      map[2][1][i][j] = "Compass 9"
    elseif panel == "!" then
      map[2][1][i][j] = "Up"
    elseif panel == "@" then
      map[2][1][i][j] = "Left"
    elseif panel == "#" then
      map[2][1][i][j] = "Down"
    elseif panel == "$" then
      map[2][1][i][j] = "Right"
    end
  end
end

for i = 1, text[2][2][0].lenx do
  map[2][2][i] = {}
  for j = 1, text[2][2][0].leny do
    local panel = text[2][2][j]:sub(i, i)
    if panel == "O" then
      map[2][2][i][j] = "Floor"
    elseif panel == "A" then
      map[2][2][i][j] = "Cave 1"
    elseif panel == "B" then
      map[2][2][i][j] = "Cave 2"
    elseif panel == "C" then
      map[2][2][i][j] = "Cave 3"
    elseif panel == "D" then
      map[2][2][i][j] = "Cave 4"
    elseif panel == "E" then
      map[2][2][i][j] = "Cave 5"
    elseif panel == "F" then
      map[2][2][i][j] = "Cave 6"
    elseif panel == "G" then
      map[2][2][i][j] = "Old Bar 1"
    elseif panel == "H" then
      map[2][2][i][j] = "Old Bar 2"
    elseif panel == "I" then
      map[2][2][i][j] = "Old Bar 3"
    elseif panel == "J" then
      map[2][2][i][j] = "Old Bar 4"
    elseif panel == "K" then
      map[2][2][i][j] = "Old Police 1"
    elseif panel == "L" then
      map[2][2][i][j] = "Old Police 2"
    elseif panel == "M" then
      map[2][2][i][j] = "Old Police 3"
    elseif panel == "N" then
      map[2][2][i][j] = "Old Police 4"
    elseif panel == "P" then
      map[2][2][i][j] = "Old Warp 1"
    elseif panel == "Q" then
      map[2][2][i][j] = "Old Warp 2"
    elseif panel == "R" then
      map[2][2][i][j] = "Old Warp 3"
    elseif panel == "S" then
      map[2][2][i][j] = "Old Warp 4"
    elseif panel == "T" then
      map[2][2][i][j] = "Old Shop 1"
    elseif panel == "U" then
      map[2][2][i][j] = "Old Shop 2"
    elseif panel == "V" then
      map[2][2][i][j] = "Old Shop 3"
    elseif panel == "W" then
      map[2][2][i][j] = "Old Shop 4"
    elseif panel == "X" then
      map[2][2][i][j] = "Old Shop 5"
    elseif panel == "Y" then
      map[2][2][i][j] = "Old Shop 6"
    elseif panel == "Z" then
      map[2][2][i][j] = "Rubble 1"
    elseif panel == "1" then
      map[2][2][i][j] = "Old Compass 1"
    elseif panel == "2" then
      map[2][2][i][j] = "Old Compass 2"
    elseif panel == "3" then
      map[2][2][i][j] = "Old Compass 3"
    elseif panel == "4" then
      map[2][2][i][j] = "Old Compass 4"
    elseif panel == "5" then
      map[2][2][i][j] = "Old Compass 5"
    elseif panel == "6" then
      map[2][2][i][j] = "Old Compass 6"
    elseif panel == "7" then
      map[2][2][i][j] = "Old Compass 7"
    elseif panel == "8" then
      map[2][2][i][j] = "Old Compass 8"
    elseif panel == "9" then
      map[2][2][i][j] = "Old Compass 9"
    elseif panel == "!" then
      map[2][2][i][j] = "Up"
    elseif panel == "@" then
      map[2][2][i][j] = "Left"
    elseif panel == "#" then
      map[2][2][i][j] = "Down"
    elseif panel == "$" then
      map[2][2][i][j] = "Right"
    elseif panel == "%" then
      map[2][2][i][j] = "Rubble 2"
    end
  end
end

for i = 1, text[2][3][0].lenx do
  map[2][3][i] = {}
  for j = 1, text[2][3][0].leny do
    local panel = text[2][3][j]:sub(i, i)
    if panel == "W" then
      map[2][3][i][j] = "White"
    elseif panel == "B" then
      map[2][3][i][j] = "Black"
    end
  end
end

for i = 1, text[2][4][0].lenx do
  map[2][4][i] = {}
  for j = 1, text[2][4][0].leny do
    local panel = text[2][4][j]:sub(i, i)
    if panel == "O" then
      map[2][4][i][j] = "Bar Floor"
    elseif panel == "A" then
      map[2][4][i][j] = "Bar Exit"
    elseif panel == "B" then
      map[2][4][i][j] = "Bar Table"
    elseif panel == "C" then
      map[2][4][i][j] = "Bar Chair"
    elseif panel == "D" then
      map[2][4][i][j] = "Bar Counter"
    elseif panel == "E" then
      map[2][4][i][j] = "Bar Counter 2"
    elseif panel == "X" then
      map[2][4][i][j] = "Bar Void"
    end
  end
end

for l = 5, 18 do
  for i = 1, text[2][l][0].lenx do
    map[2][l][i] = {}
    for j = 1, text[2][l][0].leny do
      local panel = text[2][l][j]:sub(i, i)
      if panel == "O" then
        map[2][l][i][j] = "Warp Floor"
      elseif panel == "A" then
        map[2][l][i][j] = "Warp"
      elseif panel == "P" then
        map[2][l][i][j] = "Warp Post"
      elseif panel == "X" then
        map[2][l][i][j] = "Warp Void"
      elseif panel == "1" then
        map[2][l][i][j] = "Warp Room 1"
      elseif panel == "2" then
        map[2][l][i][j] = "Warp Room 2"
      elseif panel == "3" then
        map[2][l][i][j] = "Warp Room 3"
      elseif panel == "4" then
        map[2][l][i][j] = "Warp Room 4"
      elseif panel == "5" then
        map[2][l][i][j] = "Warp Room 5"
      elseif panel == "6" then
        map[2][l][i][j] = "Warp Room 6"
      elseif panel == "7" then
        map[2][l][i][j] = "Warp Room 7"
      elseif panel == "8" then
        map[2][l][i][j] = "Warp Room 8"
      elseif panel == "9" then
        map[2][l][i][j] = "Warp Room 9"
      elseif panel == "!" then
        map[2][l][i][j] = "Warp Room 10"
      elseif panel == "@" then
        map[2][l][i][j] = "Warp Room 11"
      elseif panel == "#" then
        map[2][l][i][j] = "Warp Room 12"
      elseif panel == "$" then
        map[2][l][i][j] = "Warp Room 13"
      end
    end
  end
end

-- 3. Plains Map

map[3] = {}

for l = 1, 2 do
  
  map[3][l] = {}
  
  for i = 1, text[3][l][0].lenx do
    map[3][l][i] = {}
    for j = 1, text[3][l][0].leny do
      local panel = text[3][l][j]:sub(i, i)
      if panel == "O" then
        map[3][l][i][j] = "Floor"
      elseif panel == "A" then
        map[3][l][i][j] = "Item"
      elseif panel == "B" then
        map[3][l][i][j] = "Up"
      elseif panel == "C" then
        map[3][l][i][j] = "Left"
      elseif panel == "D" then
        map[3][l][i][j] = "Right"
      elseif panel == "E" then
        map[3][l][i][j] = "Down"
      elseif panel == "F" then
        map[3][l][i][j] = "Up Right"
      elseif panel == "G" then
        map[3][l][i][j] = "Right Down"
      elseif panel == "H" then
        map[3][l][i][j] = "Down Left"
      elseif panel == "I" then
        map[3][l][i][j] = "Left Up"
      elseif panel == "J" then
        map[3][l][i][j] = "Left Down"
      elseif panel == "K" then
        map[3][l][i][j] = "Down Right"
      elseif panel == "L" then
        map[3][l][i][j] = "Right Up"
      elseif panel == "M" then
        map[3][l][i][j] = "Up Left"
      elseif panel == "N" then
        map[3][l][i][j] = "Up Down"
      elseif panel == "Z" then
        map[3][l][i][j] = "Left Right"
      elseif panel == "P" then
        map[3][l][i][j] = "Down Up"
      elseif panel == "Q" then
        map[3][l][i][j] = "Right Left"
      elseif panel == "R" then
        map[3][l][i][j] = "From Down"
      elseif panel == "S" then
        map[3][l][i][j] = "From Right"
      elseif panel == "T" then
        map[3][l][i][j] = "From Up"
      elseif panel == "U" then
        map[3][l][i][j] = "From Left"
      elseif panel == "V" then
        map[3][l][i][j] = "Left And Up"
      elseif panel == "W" then
        map[3][l][i][j] = "Left And Right"
      elseif panel == "X" then
        map[3][l][i][j] = "Up And Down"
      elseif panel == "Y" then
        map[3][l][i][j] = "Start Piece"
      elseif panel == "!" then
        map[3][l][i][j] = "Fence Up"
      elseif panel == "@" then
        map[3][l][i][j] = "Fence Left"
      elseif panel == "#" then
        map[3][l][i][j] = "Fence Down"
      elseif panel == "$" then
        map[3][l][i][j] = "Fence Right"
      elseif panel == "%" then
        map[3][l][i][j] = "Post"
      elseif panel == "1" then
        map[3][l][i][j] = "Temple 1"
      elseif panel == "2" then
        map[3][l][i][j] = "Temple 2"
      elseif panel == "3" then
        map[3][l][i][j] = "Temple 3"
      elseif panel == "4" then
        map[3][l][i][j] = "Temple 4"
      elseif panel == "5" then
        map[3][l][i][j] = "Temple 5"
      elseif panel == "6" then
        map[3][l][i][j] = "Temple 6"
      elseif panel == "7" then
        map[3][l][i][j] = "Temple 7"
      elseif panel == "8" then
        map[3][l][i][j] = "Temple 8"
      elseif panel == "9" then
        map[3][l][i][j] = "Temple 9"
      end
    end
  end
end

-- 4. Temple Map

map[4] = {}

for l = 1, 13 do
  
  map[4][l] = {}
  
  for i = 1, text[4][l][0].lenx do
    map[4][l][i] = {}
    for j = 1, text[4][l][0].leny do
      local panel = text[4][l][j]:sub(i, i)
      if panel == "O" then
        map[4][l][i][j] = "Floor"
      elseif panel == "A" then
        map[4][l][i][j] = "Ladder"
      elseif panel == "B" then
        map[4][l][i][j] = "XASD"
      elseif panel == "C" then
        map[4][l][i][j] = "WXSD"
      elseif panel == "D" then
        map[4][l][i][j] = "WASX"
      elseif panel == "E" then
        map[4][l][i][j] = "WAXD"
      elseif panel == "F" then
        map[4][l][i][j] = "XXSD"
      elseif panel == "G" then
        map[4][l][i][j] = "XASX"
      elseif panel == "H" then
        map[4][l][i][j] = "WXXD"
      elseif panel == "I" then
        map[4][l][i][j] = "WAXX"
      elseif panel == "J" then
        map[4][l][i][j] = "XXSX"
      elseif panel == "K" then
        map[4][l][i][j] = "XXXD"
      elseif panel == "L" then
        map[4][l][i][j] = "XAXX"
      elseif panel == "M" then
        map[4][l][i][j] = "WXXX"
      elseif panel == "N" then
        map[4][l][i][j] = "XAXD"
      elseif panel == "P" then
        map[4][l][i][j] = "WXSX"
      elseif panel == "Q" then
        map[4][l][i][j] = "XXXX"
      elseif panel == "Z" then
        map[4][l][i][j] = "Post"
      elseif panel == "!" then
        map[4][l][i][j] = "Book"
      end
    end
  end
  
end

-- 5. Volcano Map

map[5] = {}

for l = 1, 10 do
  
  map[5][l] = {}
  
  for i = 1, text[5][l][0].lenx do
    map[5][l][i] = {}
    for j = 1, text[5][l][0].leny do
      local panel = text[5][l][j]:sub(i, i)
      if panel == "O" then
        map[5][l][i][j] = "Floor"
      elseif panel == "A" then
        map[5][l][i][j] = "Crack"
      elseif panel == "B" then
        map[5][l][i][j] = "Binoculars"
      elseif panel == "C" then
        map[5][l][i][j] = "Rock"
      elseif panel == "D" then
        map[5][l][i][j] = "Right"
      elseif panel == "E" then
        map[5][l][i][j] = "Left"
      elseif panel == "F" then
        map[5][l][i][j] = "Exit"
      elseif panel == "M" then
        map[5][l][i][j] = "Wall 2"
      elseif panel == "P" then
        map[5][l][i][j] = "Post"
      elseif panel == "S" then
        map[5][l][i][j] = "Stair"
      elseif panel == "T" then
        map[5][l][i][j] = "Ledge"
      elseif panel == "U" then
        map[5][l][i][j] = "Climb"
      elseif panel == "V" then
        map[5][l][i][j] = "Cave"
      elseif panel == "W" then
        map[5][l][i][j] = "Wall"
      elseif panel == "X" then
        map[5][l][i][j] = "Void"
      elseif panel == "Y" then
        map[5][l][i][j] = "Way Out Up"
      elseif panel == "Z" then
        map[5][l][i][j] = "Way Out Down"
      end
    end
  end
end

-- 6. Desert Map

map[6] = {}

for l = 1, 2 do
  
  map[6][l] = {}
  
  for i = 1, text[6][l][0].lenx do
    map[6][l][i] = {}
    for j = 1, text[6][l][0].leny do
      local panel = text[6][l][j]:sub(i, i)
      if panel == "O" then
        map[6][l][i][j] = "Floor"
      elseif panel == "A" then
        map[6][l][i][j] = "Exit"
      elseif panel == "B" then
        map[6][l][i][j] = "Pier"
      elseif panel == "C" then
        map[6][l][i][j] = "Water"
      elseif panel == "D" then
        map[6][l][i][j] = "Up"
      elseif panel == "E" then
        map[6][l][i][j] = "Left"
      elseif panel == "F" then
        map[6][l][i][j] = "Down"
      elseif panel == "G" then
        map[6][l][i][j] = "Switch"
      elseif panel == "H" then
        map[6][l][i][j] = "Rune"
      elseif panel == "I" then
        map[6][l][i][j] = "Platform"
      elseif panel == "J" then
        map[6][l][i][j] = "Slide"
      elseif panel == "K" then
        map[6][l][i][j] = "Monster"
      elseif panel == "L" then
        map[6][l][i][j] = "Fence Up"
      elseif panel == "M" then
        map[6][l][i][j] = "Fence Corner"
      elseif panel == "N" then
        map[6][l][i][j] = "Fence Right"
      elseif panel == "P" then
        map[6][l][i][j] = "Post"
      elseif panel == "Q" then
        map[6][l][i][j] = "Fence End"
      elseif panel == "R" then
        map[6][l][i][j] = "Dessert"
      elseif panel == "X" then
        map[6][l][i][j] = "Void"
      elseif panel == "Z" then
        map[6][l][i][j] = "Exit Pier"
      end
    end
  end
end

-- 7. Metropolis Map

map[7] = {}

map[7][1] = {}

for i = 1, text[7][1][0].lenx do
  map[7][1][i] = {}
  for j = 1, 22 do
    local panel = text[7][1][j]:sub(i, i)
    if panel == "O" then
      map[7][1][i][j] = "Floor"
    elseif panel == "A" then
      map[7][1][i][j] = "Bridge Left"
    elseif panel == "B" then
      map[7][1][i][j] = "Bridge Right"
    elseif panel == "C" then
      map[7][1][i][j] = "Cone"
    elseif panel == "D" then
      map[7][1][i][j] = "Cave Wall"
    elseif panel == "E" then
      map[7][1][i][j] = "Cave Entrance"
    elseif panel == "F" then
      map[7][1][i][j] = "Road Left"
    elseif panel == "G" then
      map[7][1][i][j] = "Road Right"
    elseif panel == "H" then
      map[7][1][i][j] = "Crossroad Left"
    elseif panel == "I" then
      map[7][1][i][j] = "Crossroad Right"
    elseif panel == "J" then
      map[7][1][i][j] = "Fence Horizontal"
    elseif panel == "K" then
      map[7][1][i][j] = "Fence Vertical"
    elseif panel == "L" then
      map[7][1][i][j] = "Fence Corner Left"
    elseif panel == "M" then
      map[7][1][i][j] = "Fence Corner Right"
    elseif panel == "N" then
      map[7][1][i][j] = "Pier"
    elseif panel == "P" then
      map[7][1][i][j] = "Flower"
    elseif panel == "Q" then
      map[7][1][i][j] = "Plains"
    elseif panel == "R" then
      map[7][1][i][j] = "Corner Building 1"
    elseif panel == "S" then
      map[7][1][i][j] = "Corner Building 2"
    elseif panel == "T" then
      map[7][1][i][j] = "Corner Building 3"
    elseif panel == "U" then
      map[7][1][i][j] = "Corner Building 4"
    elseif panel == "V" then
      map[7][1][i][j] = "Corner Building 5"
    elseif panel == "W" then
      map[7][1][i][j] = "Water"
    elseif panel == "X" then
      map[7][1][i][j] = "Void"
    elseif panel == "Y" then
      map[7][1][i][j] = "Corner Building 6"
    elseif panel == "Z" then
      map[7][1][i][j] = "Corner Building 7"
    elseif panel == "*" then
      map[7][1][i][j] = "Corner Building 8"
    elseif panel == "@" then
      map[7][1][i][j] = "Shop 1"
    elseif panel == "#" then
      map[7][1][i][j] = "Shop 2"
    elseif panel == "$" then
      map[7][1][i][j] = "Shop 3"
    elseif panel == "%" then
      map[7][1][i][j] = "Shop 4"
    elseif panel == "&" then
      map[7][1][i][j] = "Post"
    elseif panel == "1" then
      map[7][1][i][j] = "Trophy 1"
    elseif panel == "2" then
      map[7][1][i][j] = "Trophy 2"
    elseif panel == "3" then
      map[7][1][i][j] = "Trophy 3"
    elseif panel == "4" then
      map[7][1][i][j] = "Trophy 4"
    elseif panel == "5" then
      map[7][1][i][j] = "Trophy 5"
    elseif panel == "6" then
      map[7][1][i][j] = "Trophy 6"
    elseif panel == "7" then
      map[7][1][i][j] = "Trophy 7"
    elseif panel == "8" then
      map[7][1][i][j] = "Trophy 8"
    elseif panel == "9" then
      map[7][1][i][j] = "Trophy 9"
    else --temporary
      map[7][1][i][j] = "Floor"
    end
  end
end

for i = 1, text[7][1][0].lenx do
  for j = 23, 26 do
    local panel = text[7][1][j]:sub(i, i)
    if panel == "!" then
      map[7][1][i][j - 22] = "House 1-7"
    elseif panel == "@" then
      map[7][1][i][j - 22] = "House 1-8"
    elseif panel == "#" then
      map[7][1][i][j - 22] = "House 1-9"  
    elseif panel == "A" then
      map[7][1][i][j - 22] = "House 1-1"
    elseif panel == "B" then
      map[7][1][i][j - 22] = "House 1-2"
    elseif panel == "C" then
      map[7][1][i][j - 22] = "House 1-3"
    elseif panel == "D" then
      map[7][1][i][j - 22] = "House 2-1"
    elseif panel == "E" then
      map[7][1][i][j - 22] = "House 2-2"
    elseif panel == "F" then
      map[7][1][i][j - 22] = "House 2-3"
    elseif panel == "G" then
      map[7][1][i][j - 22] = "House 1-4"
    elseif panel == "H" then
      map[7][1][i][j - 22] = "House 1-5"
    elseif panel == "I" then
      map[7][1][i][j - 22] = "House 1-6"
    elseif panel == "J" then
      map[7][1][i][j - 22] = "House 2-4"
    elseif panel == "K" then
      map[7][1][i][j - 22] = "House 2-5"
    elseif panel == "L" then
      map[7][1][i][j - 22] = "House 2-6"
    elseif panel == "M" then
      map[7][1][i][j - 22] = "Smoke 1"
    elseif panel == "N" then
      map[7][1][i][j - 22] = "Smoke 2"
    elseif panel == "O" then
      map[7][1][i][j - 22] = "Smoke 3"
    elseif panel == "P" then
      map[7][1][i][j - 22] = "Smoke 4"
    elseif panel == "Q" then
      map[7][1][i][j - 22] = "Mad House 1"
    elseif panel == "R" then
      map[7][1][i][j - 22] = "Mad House 2"
    elseif panel == "S" then
      map[7][1][i][j - 22] = "Mad House 3"
    elseif panel == "T" then
      map[7][1][i][j - 22] = "Mad House 4"
    elseif panel == "a" then
      map[7][1][i][j - 22] = "Main House 0-01"
    elseif panel == "b" then
      map[7][1][i][j - 22] = "Main House 0-02"
    elseif panel == "c" then
      map[7][1][i][j - 22] = "Main House 0-03"
    elseif panel == "d" then
      map[7][1][i][j - 22] = "Main House 0-04"
    elseif panel == "e" then
      map[7][1][i][j - 22] = "Main House 0-05"
    elseif panel == "f" then
      map[7][1][i][j - 22] = "Main House 0-06"
    elseif panel == "g" then
      map[7][1][i][j - 22] = "Main House 0-07"
    elseif panel == "h" then
      map[7][1][i][j - 22] = "Main House 0-08"
    elseif panel == "i" then
      map[7][1][i][j - 22] = "Main House 0-09"
    elseif panel == "j" then
      map[7][1][i][j - 22] = "Main House 0-10"
    elseif panel == "k" then
      map[7][1][i][j - 22] = "Main House 0-11"
    elseif panel == "l" then
      map[7][1][i][j - 22] = "Main House 0-12"
    elseif panel == "m" then
      map[7][1][i][j - 22] = "Main House 0-13"
    elseif panel == "n" then
      map[7][1][i][j - 22] = "Main House 0-14"
    elseif panel == "o" then
      map[7][1][i][j - 22] = "Main House 0-15"
    elseif panel == "p" then
      map[7][1][i][j - 22] = "Main House 0-16"
    elseif panel == "q" then
      map[7][1][i][j - 22] = "Main House 0-17"
    elseif panel == "r" then
      map[7][1][i][j - 22] = "Main House 0-18"
    elseif panel == "s" then
      map[7][1][i][j - 22] = "Main House 0-19"
    elseif panel == "t" then
      map[7][1][i][j - 22] = "Main House 0-20"
    elseif panel == "u" then
      map[7][1][i][j - 22] = "Tunnel 01"
    elseif panel == "v" then
      map[7][1][i][j - 22] = "Tunnel 02"
    elseif panel == "w" then
      map[7][1][i][j - 22] = "Tunnel 03"
    elseif panel == "x" then
      map[7][1][i][j - 22] = "Tunnel 04"
    elseif panel == "y" then
      map[7][1][i][j - 22] = "Tunnel 05"
    elseif panel == "z" then
      map[7][1][i][j - 22] = "Tunnel 06"
    elseif panel == "1" then
      map[7][1][i][j - 22] = "Tunnel 07"
    elseif panel == "2" then
      map[7][1][i][j - 22] = "Tunnel 08"
    elseif panel == "3" then
      map[7][1][i][j - 22] = "Tunnel 09"
    elseif panel == "4" then
      map[7][1][i][j - 22] = "Tunnel 10"
    elseif panel == "5" then
      map[7][1][i][j - 22] = "Tunnel 11"
    elseif panel == "6" then
      map[7][1][i][j - 22] = "Tunnel 12"
    elseif panel == "7" then
      map[7][1][i][j - 22] = "Tunnel 13"
    elseif panel == "8" then
      map[7][1][i][j - 22] = "Tunnel 14"
    elseif panel == "9" then
      map[7][1][i][j - 22] = "Tunnel 15"
    elseif panel == "0" then
      map[7][1][i][j - 22] = "Tunnel 16"
    end
  end
end
  
-- 7.2 Sewers

map[7][2] = {}

for i = 1, text[7][2][0].lenx do
  map[7][2][i] = {}
  for j = 1, text[7][2][0].leny do
    local panel = text[7][2][j]:sub(i, i)
    if panel == "O" then
      map[7][2][i][j] = "Floor"
    elseif panel == "A" then
      map[7][2][i][j] = "Stair Up"
    elseif panel == "E" then
      map[7][2][i][j] = "Push Rock"
    elseif panel == "X" then
      map[7][2][i][j] = "Void"
    end
  end
end

-- 8. Alp Map

map[8] = {}

for l = 1, 9 do
  
  map[8][l] = {}
  
  for i = 1, text[8][l][0].lenx do
    map[8][l][i] = {}
    for j = 1, text[8][l][0].leny do
      local panel = text[8][l][j]:sub(i, i)
      if panel == "O" then
        map[8][l][i][j] = "Floor"
      elseif panel == "A" then
        map[8][l][i][j] = "Ice"
      elseif panel == "B" then
        map[8][l][i][j] = "Binoculars"
      elseif panel == "C" then
        map[8][l][i][j] = "Rock"
      elseif panel == "D" then
        map[8][l][i][j] = "Exit"
      elseif panel == "E" then
        map[8][l][i][j] = "Post"
      elseif panel == "M" then
        map[8][l][i][j] = "Wall 2"
      elseif panel == "N" then
        map[8][l][i][j] = "Path"
      elseif panel == "P" then
        map[8][l][i][j] = "Snowball"
      elseif panel == "Q" then
        map[8][l][i][j] = "Hole"
      elseif panel == "R" then
        map[8][l][i][j] = "Bridge"
      elseif panel == "S" then
        map[8][l][i][j] = "Stair"
      elseif panel == "T" then
        map[8][l][i][j] = "Ledge"
      elseif panel == "U" then
        map[8][l][i][j] = "Climb"
      elseif panel == "V" then
        map[8][l][i][j] = "Cave"
      elseif panel == "W" then
        map[8][l][i][j] = "Wall"
      elseif panel == "X" then
        map[8][l][i][j] = "Void"
      elseif panel == "Y" then
        map[8][l][i][j] = "Way Out Up"
      elseif panel == "Z" then
        map[8][l][i][j] = "Way Out Down"
      end
    end
  end

end

-- 9. Ruins Map

map[9] = {}

for l = 1, 16 do
  
  map[9][l] = {}
  
  for i = 1, text[9][l][0].lenx do
    map[9][l][i] = {}
    for j = 1, text[9][l][0].leny do
      local panel = text[9][l][j]:sub(i, i)
      if panel == "O" then
        map[9][l][i][j] = "Floor"
      elseif panel == "A" then
        map[9][l][i][j] = "Up"
      elseif panel == "B" then
        map[9][l][i][j] = "Left"
      elseif panel == "C" then
        map[9][l][i][j] = "Down"
      elseif panel == "D" then
        map[9][l][i][j] = "Right"
      elseif panel == "E" then
        map[9][l][i][j] = "Very Up"
      elseif panel == "F" then
        map[9][l][i][j] = "Very Left"
      elseif panel == "G" then
        map[9][l][i][j] = "Very Down"
      elseif panel == "H" then
        map[9][l][i][j] = "Very Right"
      elseif panel == "I" then
        map[9][l][i][j] = "From Down"
      elseif panel == "J" then
        map[9][l][i][j] = "From Up"
      elseif panel == "K" then
        map[9][l][i][j] = "Crack"
      elseif panel == "L" then
        map[9][l][i][j] = "Hole"
      elseif panel == "M" then
        map[9][l][i][j] = "Stair Up"
      elseif panel == "N" then
        map[9][l][i][j] = "Stair Down"
      elseif panel == "P" then
        map[9][l][i][j] = "Post"
      elseif panel == "Q" then
        map[9][l][i][j] = "Special Stair"
      elseif panel == "R" then
        map[9][l][i][j] = "Rock"
      elseif panel == "S" then
        map[9][l][i][j] = "Switch"
      elseif panel == "T" then
        map[9][l][i][j] = "Track"
      elseif panel == "U" then
        map[9][l][i][j] = "Tile 3F"
      elseif panel == "V" then
        map[9][l][i][j] = "Metro Exit"
      elseif panel == "X" then
        map[9][l][i][j] = "Void"
      end
    end
  end

end

-- 10. Void Map

map[10] = {}

for l = 1, 8 do
  
  map[10][l] = {}
  
end

for i = 1, text[10][1][0].lenx do
  map[10][1][i] = {}
  for j = 1, text[10][1][0].leny do
    local panel = text[10][1][j]:sub(i, i)
    if panel == "1" then
      map[10][1][i][j] = "1"
    elseif panel == "2" then
      map[10][1][i][j] = "2"
    elseif panel == "3" then
      map[10][1][i][j] = "3"
    elseif panel == "4" then
      map[10][1][i][j] = "4"
    elseif panel == "A" then
      map[10][1][i][j] = "Floor"
    elseif panel == "B" then
      map[10][1][i][j] = "Hole"
    elseif panel == "C" then
      map[10][1][i][j] = "Horizontal"
    elseif panel == "D" then
      map[10][1][i][j] = "Ladder"
    elseif panel == "E" then
      map[10][1][i][j] = "Pull Rock"
    elseif panel == "F" then
      map[10][1][i][j] = "Push Rock"
    elseif panel == "G" then
      map[10][1][i][j] = "Rolling Rock"
    elseif panel == "H" then
      map[10][1][i][j] = "Second Floor Rock"
    elseif panel == "I" then
      map[10][1][i][j] = "Second Floor"
    elseif panel == "J" then
      map[10][1][i][j] = "Spawn"
    elseif panel == "K" then
      map[10][1][i][j] = "Stacked Rock"
    elseif panel == "L" then
      map[10][1][i][j] = "Stair Down"
    end
  end
end

for i = 1, text[10][2][0].lenx do
  map[10][2][i] = {}
  for j = 1, text[10][2][0].leny do
    local panel = text[10][2][j]:sub(i, i)
    if panel == "1" then
      map[10][2][i][j] = "1"
    elseif panel == "2" then
      map[10][2][i][j] = "2"
    elseif panel == "3" then
      map[10][2][i][j] = "3"
    elseif panel == "4" then
      map[10][2][i][j] = "4"
    elseif panel == "B" then
      map[10][2][i][j] = "Up"
    elseif panel == "C" then
      map[10][2][i][j] = "Left"
    elseif panel == "D" then
      map[10][2][i][j] = "Right"
    elseif panel == "E" then
      map[10][2][i][j] = "Down"
    elseif panel == "F" then
      map[10][2][i][j] = "Up Right"
    elseif panel == "G" then
      map[10][2][i][j] = "Right Down"
    elseif panel == "H" then
      map[10][2][i][j] = "Down Left"
    elseif panel == "I" then
      map[10][2][i][j] = "Left Up"
    elseif panel == "J" then
      map[10][2][i][j] = "Left Down"
    elseif panel == "K" then
      map[10][2][i][j] = "Down Right"
    elseif panel == "L" then
      map[10][2][i][j] = "Right Up"
    elseif panel == "M" then
      map[10][2][i][j] = "Up Left"
    elseif panel == "N" then
      map[10][2][i][j] = "Up Down"
    elseif panel == "Z" then
      map[10][2][i][j] = "Left Right"
    elseif panel == "P" then
      map[10][2][i][j] = "Down Up"
    elseif panel == "Q" then
      map[10][2][i][j] = "Right Left"
    elseif panel == "R" then
      map[10][2][i][j] = "From Down"
    elseif panel == "S" then
      map[10][2][i][j] = "From Right"
    elseif panel == "T" then
      map[10][2][i][j] = "From Up"
    elseif panel == "U" then
      map[10][2][i][j] = "From Left"
    elseif panel == "V" then
      map[10][2][i][j] = "Left And Up"
    elseif panel == "W" then
      map[10][2][i][j] = "Left And Right"
    elseif panel == "X" then
      map[10][2][i][j] = "Up And Down"
    end
  end
end
  
for i = 1, text[10][3][0].lenx do
  map[10][3][i] = {}
  for j = 1, text[10][3][0].leny do
    local panel = text[10][3][j]:sub(i, i)
    if panel == "1" then
      map[10][3][i][j] = "1"
    elseif panel == "2" then
      map[10][3][i][j] = "2"
    elseif panel == "3" then
      map[10][3][i][j] = "3"
    elseif panel == "4" then
      map[10][3][i][j] = "4"
    elseif panel == "A" then
      map[10][3][i][j] = "Cave"
    elseif panel == "B" then
      map[10][3][i][j] = "Climb"
    elseif panel == "C" then
      map[10][3][i][j] = "Ledge"
    elseif panel == "D" then
      map[10][3][i][j] = "Stair"
    elseif panel == "E" then
      map[10][3][i][j] = "Wall 2"
    elseif panel == "F" then
      map[10][3][i][j] = "Floor"
    elseif panel == "G" then
      map[10][3][i][j] = "Crack"
    end
  end
end

for i = 1, text[10][4][0].lenx do
  map[10][4][i] = {}
  for j = 1, text[10][4][0].leny do
    local panel = text[10][4][j]:sub(i, i)
    if panel == "1" then
      map[10][4][i][j] = "1"
    elseif panel == "2" then
      map[10][4][i][j] = "2"
    elseif panel == "3" then
      map[10][4][i][j] = "3"
    elseif panel == "4" then
      map[10][4][i][j] = "4"
    elseif panel == "A" then
      map[10][4][i][j] = "Bridge"
    elseif panel == "B" then
      map[10][4][i][j] = "Cave"
    elseif panel == "C" then
      map[10][4][i][j] = "Climb"
    elseif panel == "D" then
      map[10][4][i][j] = "Wall"
    elseif panel == "E" then
      map[10][4][i][j] = "Way Out Down"
    elseif panel == "F" then
      map[10][4][i][j] = "Floor"
    elseif panel == "G" then
      map[10][4][i][j] = "Ledge"
    end
  end
end

for i = 1, text[10][5][0].lenx do
  map[10][5][i] = {}
  for j = 1, text[10][5][0].leny do
    local panel = text[10][5][j]:sub(i, i)
    if panel == "1" then
      map[10][5][i][j] = "1"
    elseif panel == "2" then
      map[10][5][i][j] = "2"
    elseif panel == "3" then
      map[10][5][i][j] = "3"
    elseif panel == "4" then
      map[10][5][i][j] = "4"
    elseif panel == "A" then
      map[10][5][i][j] = "Down"
    elseif panel == "B" then
      map[10][5][i][j] = "Left"
    elseif panel == "C" then
      map[10][5][i][j] = "Up"
    elseif panel == "D" then
      map[10][5][i][j] = "Right"
    elseif panel == "E" then
      map[10][5][i][j] = "Very Down"
    elseif panel == "F" then
      map[10][5][i][j] = "Very Left"
    elseif panel == "G" then
      map[10][5][i][j] = "Very Up"
    elseif panel == "H" then
      map[10][5][i][j] = "Very Right"
    elseif panel == "I" then
      map[10][5][i][j] = "Hole"
    elseif panel == "J" then
      map[10][5][i][j] = "Ladder"
    elseif panel == "K" then
      map[10][5][i][j] = "Rock"
    elseif panel == "L" then
      map[10][5][i][j] = "Track"
    end
  end
end

for i = 1, text[10][6][0].lenx do
    map[10][6][i] = {}
    for j = 1, text[10][6][0].leny do
      local panel = text[10][6][j]:sub(i, i)
      if panel == "1" then
        map[10][6][i][j] = "1"
      elseif panel == "2" then
        map[10][6][i][j] = "2"
      elseif panel == "3" then
        map[10][6][i][j] = "3"
      elseif panel == "4" then
        map[10][6][i][j] = "4"
      elseif panel == "A" then
        map[10][6][i][j] = "Ladder"
      elseif panel == "B" then
        map[10][6][i][j] = "XASD"
      elseif panel == "C" then
        map[10][6][i][j] = "WXSD"
      elseif panel == "D" then
        map[10][6][i][j] = "WASX"
      elseif panel == "E" then
        map[10][6][i][j] = "WAXD"
      elseif panel == "F" then
        map[10][6][i][j] = "XXSD"
      elseif panel == "G" then
        map[10][6][i][j] = "XASX"
      elseif panel == "H" then
        map[10][6][i][j] = "WXXD"
      elseif panel == "I" then
        map[10][6][i][j] = "WAXX"
      elseif panel == "J" then
        map[10][6][i][j] = "XXSX"
      elseif panel == "K" then
        map[10][6][i][j] = "XXXD"
      elseif panel == "L" then
        map[10][6][i][j] = "XAXX"
      elseif panel == "M" then
        map[10][6][i][j] = "WXXX"
      elseif panel == "N" then
        map[10][6][i][j] = "XAXD"
      elseif panel == "P" then
        map[10][6][i][j] = "WXSX"
      elseif panel == "Q" then
        map[10][6][i][j] = "Post"
      elseif panel == "!" then
        map[10][6][i][j] = "Book"
      elseif panel == "@" then
        map[10][6][i][j] = "Item"
      elseif panel == "#" then
        map[10][6][i][j] = "Item 2"
      end
    end
  end
  
  for i = 1, text[10][7][0].lenx do
    map[10][7][i] = {}
    for j = 1, text[10][7][0].leny do
      local panel = text[10][7][j]:sub(i, i)
      if panel == "1" then
        map[10][7][i][j] = "1"
      elseif panel == "2" then
        map[10][7][i][j] = "2"
      elseif panel == "3" then
        map[10][7][i][j] = "3"
      elseif panel == "4" then
        map[10][7][i][j] = "4"
      elseif panel == "A" then
        map[10][7][i][j] = "Crack"
      elseif panel == "B" then
        map[10][7][i][j] = "Ice"
      elseif panel == "C" then
        map[10][7][i][j] = "Up"
      elseif panel == "D" then
        map[10][7][i][j] = "Right"
      elseif panel == "E" then
        map[10][7][i][j] = "Down"
      elseif panel == "F" then
        map[10][7][i][j] = "Left"
      elseif panel == "G" then
        map[10][7][i][j] = "Very Up"
      elseif panel == "H" then
        map[10][7][i][j] = "Very Left"
      elseif panel == "I" then
        map[10][7][i][j] = "Rock"
      elseif panel == "J" then 
        map[10][7][i][j] = "Warp A"
      elseif panel == "K" then
        map[10][7][i][j] = "Warp B"
      elseif panel == "L" then
        map[10][7][i][j] = "Warp C"
      elseif panel == "O" then
        map[10][7][i][j] = "Floor"
      end
    end
  end
  
  for i = 1, text[10][8][0].lenx do
    map[10][8][i] = {}
    for j = 1, text[10][8][0].leny do
      local panel = text[10][8][j]:sub(i, i)
      if panel == "3" then
        map[10][8][i][j] = "3"
      elseif panel == "O" then
        map[10][8][i][j] = "Floor"
      elseif panel == "X" then
        map[10][8][i][j] = "Rock"
      end
    end
  end
      