function toMenu()
  
  info[file].meta.menu = info[file].meta.menu + 1
  
  if update then
    oneText("Capstone Textbox/Question.png", "This button is not available.")
  else 
    printFile(1)
    
    if info[file].shop then
      return
    end
    
    if info[file].battle.on then
      return
    end
  end
    
end