function buildInterface()

  mapbg = display.newImageRect("Capstone Tiles/64x64.png", 270, 270)
  mapbg.x = 160
  mapbg.y = 160
  mapbg:addEventListener("tap", tileTextBox)

  textboxbg = display.newImageRect("Capstone Interface/Textbox.png", 270, 60)
  textboxbg.x = 160 -- 25 to 295
  textboxbg.y = 330 -- 300 to 360

  textimage = display.newImageRect("Capstone Textbox/Default.png", 50, 50)
  textimage.x = 55 -- 30 to 80
  textimage.y = 330 -- 305 to 355

  textbox = display.newText("", 187.5, 330, 200, 45, calibriFont, 12, "left")

  up = display.newImageRect("Capstone Interface/Up.png", 35, 35)
  up.x = 60 + 17.5
  up.y = 365 + 17.5
  up:addEventListener("tap", moveUp)

  left = display.newImageRect("Capstone Interface/Left.png", 35, 35)
  left.x = 25 + 17.5
  left.y = 400 + 17.5
  left:addEventListener("tap", moveLeft)

  right = display.newImageRect("Capstone Interface/Right.png", 35, 35)
  right.x = 95 + 17.5
  right.y = 400 + 17.5
  right:addEventListener("tap", moveRight)

  down = display.newImageRect("Capstone Interface/Down.png", 35, 35)
  down.x = 60 + 17.5
  down.y = 435 + 17.5
  down:addEventListener("tap", moveDown)

  act = display.newImageRect("Capstone Interface/Act.png", 40, 40)
  act.x = 275
  act.y = 400
  act:addEventListener("tap", action)

  menu = display.newImageRect("Capstone Interface/Menu.png", 40, 40)
  menu.x = 225
  menu.y = 400
  menu:addEventListener("tap", toMenu)

  advlog = display.newImageRect("Capstone Interface/Log.png", 40, 40)
  advlog.x = 175
  advlog.y = 400
  advlog:addEventListener("tap", toLog)

  save1 = display.newImageRect("Capstone Interface/1.png", 25, 25)
  save1.x = 150 + 12.5
  save1.y = 440 + 12.5
  save1:addEventListener("tap", save1func)

  save2 = display.newImageRect("Capstone Interface/2.png", 25, 25)
  save2.x = 180 + 12.5
  save2.y = 440 + 12.5
  save2:addEventListener("tap", save2func)

  save3 = display.newImageRect("Capstone Interface/3.png", 25, 25)
  save3.x = 210 + 12.5
  save3.y = 440 + 12.5
  save3:addEventListener("tap", save3func)

  save4 = display.newImageRect("Capstone Interface/4.png", 25, 25)
  save4.x = 240 + 12.5
  save4.y = 440 + 12.5
  save4:addEventListener("tap", save4func)

  save5 = display.newImageRect("Capstone Interface/5.png", 25, 25)
  save5.x = 270 + 12.5
  save5.y = 440 + 12.5
  save5:addEventListener("tap", save5func)

  --copyright = display.newText("C 2017-2018 name All Rights Reserved.", 160, 475, 320, 10, native.systemFontBold, 10, "right")
  
end