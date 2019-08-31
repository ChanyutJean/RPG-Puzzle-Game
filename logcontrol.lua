function toLog()
  
  info[file].meta.log = info[file].meta.log + 1
  
  if update then
    oneText("Capstone Textbox/Question.png", "This button is not available in 'play stage' mode.")
  else
  
    if info[file].shop then
      return
    end
    
    if info[file].battle.on then
      return
    end
    
    if info[file].prog.temple == 0 then
      if info[file].prog.cave.rock then
        oneText("Capstone Textbox/Question.png", "Hello, I'm a wizard! First of all, you should go to the far left and 'act' on the rock.")
      elseif info[file].prog.cave.tutorial then
        oneText("Capstone Textbox/Question.png", "Now you should be able to move along the far right to the town!")
      elseif info[file].map.realname == "Municipality Town" then
        oneText("Capstone Textbox/Question.png", "Proceed to the right side to move to Steppe Plains.")
      elseif info[file].map.realname == "Steppe Plains" then
        oneText("Capstone Textbox/Question.png", "Find the hidden temple within this plains! The arrows may guide you there.")
      elseif info[file].map.realname == "Fane Temple" then
        oneText("Capstone Textbox/Question.png", "'Act' on the post to read for directions and move onwards! Also, you may 'act' on the torch to light it up.")
      end
    elseif info[file].map.realname == "Fane Temple" then
      oneText("Capstone Textbox/Question.png", "There is only one way forward; to proceed! 'Act' on the post to read for direction.")
    elseif info[file].map.realname == "Mesa Volcano" then
      oneText("Capstone Textbox/Question.png", "Navigate along this volcano to reach Arid Desert!")
    elseif info[file].map.realname == "Arid Desert" then
      oneText("Capstone Textbox/Question.png", "Navigate along this desert to revisit Municipal Town!")
    elseif info[file].map.realname == "Anarchic Town" then
      oneText("Capstone Textbox/Question.png", "Someone seems to be invading the town. Defeat and destroy all the raids!")
    elseif info[file].map.realname == "Mesa Alp" then
      oneText("Capstone Textbox/Question.png", "Navigate along this alp to reach the hidden ruins!")
    elseif info[file].map.realname == "Relic Ruins" then
      oneText("Capstone Textbox/Question.png", "You've come this far. It's almost over!")
    else
      oneText("Capstone Textbox/Question.png", "Where could you be? I haven't a clue...")
    end
  end
end