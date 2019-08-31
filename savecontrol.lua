function save1func()
  
  if update then
    oneText("Capstone Interface/1.png", "You can't save in 'play stage' mode!")
  end
  
  if info[file].shop then
    oneText("Capstone Interface/1.png", "You can't save while shopping!")
  end
  
  if info[file].battle.on then
    oneText("Capstone Interface/1.png", "You can't save during a battle!")
  end
  
  if info[file].map.name == "Cave" and info[file].map.subname:sub(1, 5) == "Trial" then
    oneText("Capstone Interface/1.png", "You can't save inside the trial!")
  end
  
  if not info[file].text then
    
    info[file].textpath = 1
    info[file].textchoose = true
    oneText("Capstone Interface/1.png", "Save or load file 1?\n [[Save]]\n Load")
    
  end
  
end

function save2func()
  
  if update then
    oneText("Capstone Interface/2.png", "You can't save in 'play stage' mode!")
  end
  
  if info[file].shop then
    oneText("Capstone Interface/2.png", "You can't save while shopping!")
  end
  
  if info[file].battle.on then
    oneText("Capstone Interface/2.png", "You can't save during a battle!")
  end
  
  if info[file].map.name == "Cave" and info[file].map.subname:sub(1, 5) == "Trial" then
    oneText("Capstone Interface/2.png", "You can't save inside the trial!")
  end
  
  if not info[file].text then
  
    info[file].textpath = 2
    info[file].textchoose = true
    oneText("Capstone Interface/2.png", "Save or load file 2?\n [[Save]]\n Load")
  
  end

end

function save3func()
  
  if update then
    oneText("Capstone Interface/3.png", "You can't save in 'play stage' mode!")
  end
  
  if info[file].shop then
    oneText("Capstone Interface/3.png", "You can't save while shopping!")
  end
  
  if info[file].battle.on then
    oneText("Capstone Interface/3.png", "You can't save during a battle!")
  end
  
  if info[file].map.name == "Cave" and info[file].map.subname:sub(1, 5) == "Trial" then
    oneText("Capstone Interface/3.png", "You can't save inside the trial!")
  end
  
  if not info[file].text then
  
    info[file].textpath = 3
    info[file].textchoose = true
    oneText("Capstone Interface/3.png", "Save or load file 3?\n [[Save]]\n Load")
  
  end
  
end

function save4func()
  
  if update then
    oneText("Capstone Interface/4.png", "You can't save in 'play stage' mode!")
  end
  
  if info[file].shop then
    oneText("Capstone Interface/4.png", "You can't save while shopping!")
  end
  
  if info[file].battle.on then
    oneText("Capstone Interface/4.png", "You can't save during a battle!")
  end
  
  if info[file].map.name == "Cave" and info[file].map.subname:sub(1, 5) == "Trial" then
    oneText("Capstone Interface/4.png", "You can't save inside the trial!")
  end
  
  if not info[file].text then
  
    info[file].textpath = 4
    info[file].textchoose = true
    oneText("Capstone Interface/4.png", "Save or load file 4?\n [[Save]]\n Load")
  
  end
  
end

function save5func()
  
  if update then
    oneText("Capstone Interface/5.png", "You can't save in 'play stage' mode!")
  end
  
  if info[file].shop then
    oneText("Capstone Interface/5.png", "You can't save while shopping!")
  end
  
  if info[file].battle.on then
    oneText("Capstone Interface/5.png", "You can't save during a battle!")
  end
  
  if info[file].map.name == "Cave" and info[file].map.subname:sub(1, 5) == "Trial" then
    oneText("Capstone Interface/5.png", "You can't save inside the trial!")
  end
  
  if not info[file].text then
  
    info[file].textpath = 5
    info[file].textchoose = true
    oneText("Capstone Interface/5.png", "Save or load file 5?\n [[Save]]\n Load")
  
  end
  
end