function startBattle(youHp, youEndur, youHit, enemyName, enemyHp, enemyEndur, enemyHit, enemyInc, enemyExp, enemyPierce)
  
  you:removeSelf()
  you = nil
  displayBattleImg(enemyName)
  setBattleVar(youHp, youEndur, youHit, enemyName, enemyHp, enemyEndur, enemyHit, enemyInc, enemyExp, enemyPierce)
  displayBattleVar()
  
end

function endBattle()
  
  info[file].battle.on = false
  
  you = display.newImageRect("Capstone Interactibles/You - "..info[file].dir..".png", 32, 40)
  you.x = 10 + (info[file].posx - info[file].centerx + 5) * 30
  you.y = (info[file].posy - info[file].centery + 5) * 30
  
  bg:removeSelf()
  bg = nil
  
  atk:removeSelf()
  atk = nil
  
  def:removeSelf()
  def = nil
  
  itm:removeSelf()
  itm = nil
  
  turnText:removeSelf()
  turnText = nil
  
  pattText:removeSelf()
  pattText = nil
  
  youHpText:removeSelf() 
  youHpText = nil
  
  enemyHpText:removeSelf()
  enemyHpText = nil
  
  mon:removeSelf()
  mon = nil
  
  byou:removeSelf()
  byou = nil

end

function gameOver() 
  
  gameOverText = display.newImageRect("Capstone Interface/gameover.png", 300, 300)
  gameOverText.x = 160
  gameOverText.y = 150
  
  atk:removeSelf()
  atk = nil
  
  def:removeSelf()
  def = nil
  
  itm:removeSelf()
  itm = nil
  
end

function displayBattleImg(enemyName)
  
  bg = display.newImageRect("Capstone Interface/Background - "..info[file].map.name..".png", 270, 270)
  bg.x = 160
  bg.y = 160
  
  mon = display.newImageRect("Capstone Interface/Monster - "..enemyName..".png", 120, 120)
  mon.x = 230
  mon.y = 170
  
  byou = display.newImageRect("Capstone Interactibles/You - Right.png", 64, 80)
  byou.x = 65
  byou.y = 190
  
  atk = display.newImageRect("Capstone Interface/Attack.png", 40, 40)
  atk.x = 180
  atk.y = 270
  atk:addEventListener("tap", attack)

  def = display.newImageRect("Capstone Interface/Defend.png", 40, 40)
  def.x = 225
  def.y = 270
  def:addEventListener("tap", defend)
  
  itm = display.newImageRect("Capstone Interface/Item.png", 40, 40)
  itm.x = 270
  itm.y = 270
  itm:addEventListener("tap", item)
  
end

function attackPattern()
  
  local list = {}
  
  -- 1. Calculate random factor (10-99)
  
  list[1] = 10 + math.floor(((info[file].meta.up + info[file].meta.down + info[file].meta.left + info[file].meta.right + info[file].meta.act + info[file].meta.menu + info[file].meta.log + info[file].meta.attack + info[file].meta.defend + info[file].meta.item) % (90)))
  
  list[1] = encodeDigit(list[1])
  
  -- 2. Calculate attack factor (100-999)
  
  list[2] = 199 - list[1] + math.floor(
    
  -- Walking over acting factor (Max: Walk 2 times, act 1 time; Linear growth)
  
  math.min(200, (100 * (info[file].meta.up + info[file].meta.down + info[file].meta.left + info[file].meta.right)) / (info[file].meta.act + info[file].meta.menu + info[file].meta.log))
  
  -- Walking a straight path factor (Max: Walk the same path 2 times more than the other; Comparative division) 
  
  + math.min(200, (100 * math.max(math.abs(info[file].meta.up / info[file].meta.down), math.abs(info[file].meta.down / info[file].meta.down), math.abs(info[file].meta.left / info[file].meta.right), math.abs(info[file].meta.right / info[file].meta.left))))
  
  -- Low HP and high turn factor (Max: 0 HP, 100 or so turns)
      
  + math.min(200, 50 * (1 - (info[file].battle.you.hp / info[file].battle.you.maxhp)) + 50 * (1 - (info[file].battle.enemy.hp / info[file].battle.enemy.maxhp)) + 10 * math.max(5, math.log10(info[file].battle.status.turn)) + 50) 
  
  -- High attack factor (Max: Attack 2 times more than defend; Comparative division)
  
  + math.min(200, (100 * (info[file].meta.attack / info[file].meta.defend))))
  
  -- 3. Estimate attack value (0-9)
  
  list[3] = 0
  
  -- Attack value higher than randomly generated value
  
  if 10 * list[1] < list[2] then 
    list[3] = list[3] + 6
  end
  
  -- Attack value higher than half-ish
  
  if list[2] > 500 then
    list[3] = list[3] + 4
  end
  
  -- Add entropy (From -5 to +5)
  
  list[3] = list[3] - 5 + (list[1] % 11) 

  if list[3] < 0 then
    list[3] = 0
  elseif list[3] > 9 then
    list[3] = 9
  end
  
  -- 4. Generate attack ID (10-99)
  
  list[4] = encodeDigit(list[2] / 10)
  
  -- 5. Find attack stance (Attack/Defend)
  
  print(list[1], list[2])
  if (list[1] / 10) < (list[2] / 100) then
    list[5] = true
  else
    list[5] = false
  end
  
  if info[file].battle.status.stun > info[file].battle.status.turn then
    list[5] = true
  end
  
  print(list[5])
  
  return list

end

function setBattleVar(youHp, youEndur, youHit, enemyName, enemyHp, enemyEndur, enemyHit, enemyInc, enemyExp, enemyPierce)
  
  info[file].battle.on = true
  
  info[file].battle.you.hp = youHp
  info[file].battle.you.endur = youEndur
  info[file].battle.you.hit = youHit
  
  info[file].battle.enemy.name = enemyName
  info[file].battle.enemy.maxhp = enemyHp
  info[file].battle.enemy.hp = enemyHp
  info[file].battle.enemy.endur = enemyEndur
  info[file].battle.enemy.hit = enemyHit
  info[file].battle.enemy.inc = enemyInc
  info[file].battle.enemy.exp = enemyExp
  info[file].battle.enemy.pierce = enemyPierce
  
  info[file].battle.status.turn = 1
  info[file].battle.status.prevTurnDef = 0
  
end

function displayBattleVar()
  
  turnText = display.newText("Turn: "..info[file].battle.status.turn, 90, 260, 120, 20, "Times New Roman", 20, "left")
  
  battleCode = attackPattern()
  pattText = display.newText("ID: "..battleCode[1]..battleCode[4].."-"..battleCode[3], 90, 280, 120, 20, "Times New Roman", 20, "left")
  
  youHpText = display.newText(info[file].battle.you.hp.."HP", 80, 45, native.systemFontBold, 30)
  youHpText:setFillColor(1 - (info[file].battle.you.hp / info[file].battle.you.maxhp), info[file].battle.you.hp / info[file].battle.you.maxhp, 0)
  
  enemyHpText = display.newText(info[file].battle.enemy.hp.."HP", 240, 45, native.systemFontBold, 30)
  enemyHpText:setFillColor(0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2))

end

function encodeDigit(i) -- turns number 10-99 into another pseudorandom non-uniform number 10-99
  
  return 10 + math.floor(10000 * (i ^ (1/3))) % 90
  
end

function enemyPower()
  return math.floor(info[file].battle.enemy.hit * info[file].battle.enemy.inc ^ info[file].battle.status.turn)
end

function youHpLost(pierce) -- boolean input
  
  if pierce then
    info[file].battle.you.hp = info[file].battle.you.hp - (info[file].battle.enemy.pierce * enemyPower())
  else
    info[file].battle.you.hp = info[file].battle.you.hp - enemyPower()
  end
  if info[file].battle.you.hp <= 0 then
    return true -- end battle
  end
  return false -- continue battle
  
end

function enemyHpLost()
  
  if info[file].battle.status.scope then -- double the damage
    
    if info[file].battle.enemy.hp <= info[file].battle.enemy.endur then
      info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit
    else
      if info[file].battle.you.hp <= info[file].battle.you.endur then
        info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit * 4
      else
        info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit * 2
      end
    end
    
    info[file].battle.status.scope = false
    
  else
    
    if info[file].battle.enemy.hp <= info[file].battle.enemy.endur then
      info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit * 0.5
    else
      if info[file].battle.you.hp <= info[file].battle.you.endur then
        info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit * 2
      else
        info[file].battle.enemy.hp = info[file].battle.enemy.hp - info[file].battle.you.hit
      end
    end
    
  end
  
  if info[file].battle.enemy.hp <= 0 then
    return true -- end battle
  end
  return false -- continue battle
  
end

function attack()
  
  info[file].meta.attack = info[file].meta.attack + 1
  
  if info[file].text or not (textboxitem == nil) then
    return
  end
  
  if battleCode[5] then --enemy attacks
    
    oneText("Capstone Interface/Attack.png", "You ATTACKed!\n"..info[file].battle.enemy.name.." ATTACKed!\nBoth sides lost their health!")
    
    if enemyHpLost() then
      endBattle()
      return
    end
    if youHpLost(false) then
      gameOver()
      return
    end
    updateBattleText()
    info[file].battle.status.turn = info[file].battle.status.turn + 1
    
  else
    
    oneText("Capstone Interface/Attack.png", "You ATTACKed!\n"..info[file].battle.enemy.name.." DEFENDed!\nYou got parried and lost health!")
    
    info[file].battle.status.scope = false
    
    if youHpLost(false) then
      gameOver()
      return
    end
    updateBattleText()
    info[file].battle.status.turn = info[file].battle.status.turn + 2
    
  end
end

function defend()
  
  info[file].meta.defend = info[file].meta.defend + 1
  
  if info[file].text or not (textboxitem == nil) then
    return
  end
  
  info[file].battle.status.scope = false
  
  if battleCode[5] then --enemy attacks
    if info[file].battle.status.prevTurnDef > 1 then -- pierces shield
      
      oneText("Capstone Interface/Defend.png", "You DEFENDed!\n"..info[file].battle.enemy.name.." ATTACKed!\nYour enemy pierced, you lost health!")
      info[file].battle.status.prevTurnDef = 0
      if youHpLost(true) then
        gameOver()
        return
      end
      updateBattleText()
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      
    else
      
      oneText("Capstone Interface/Defend.png", "You DEFENDed!\n"..info[file].battle.enemy.name.." ATTACKed!\nYou parried, your enemy lost health!")
      
      info[file].battle.status.prevTurnDef = 0
      if enemyHpLost() then
        endBattle()
        return
      end
      updateBattleText()
      info[file].battle.status.turn = info[file].battle.status.turn + 2
      
    end
  else
    
    oneText("Capstone Interface/Defend.png", "You DEFENDed!\n"..info[file].battle.enemy.name.." DEFENDed!\nNothing happens!")
    
    info[file].battle.status.prevTurnDef = info[file].battle.status.prevTurnDef + 1
    updateBattleText()
    info[file].battle.status.turn = info[file].battle.status.turn + 1
  
  end
end

function item()
  
  info[file].meta.item = info[file].meta.item + 1
  
  if info[file].text then
    return
  end
  
  if not info[file].battle.status.item then
  
    textboxitem = display.newImageRect("Capstone Interface/Itemtext.png", 270, 60)
    textboxitem.x = 160 -- 25 to 295
    textboxitem.y = 330 -- 300 to 360
    textboxitem:addEventListener("tap", tapItem)
    
    info[file].battle.status.item = true
  
  end

end

function tapItem(event)
  
  textboxitem:removeSelf()
  textboxitem = nil
  
  info[file].battle.status.item = false
  
  if event.x < 74 then
    
    if info[file].item.beatbox == 0 then
      oneText("Capstone Textbox/Question.png", "Beatbox is not in your inventory!")
    else
      info[file].item.beatbox = info[file].item.beatbox - 1
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      local stance = ""
      if battleCode[5] then
        stance = "ATTACK"
      else
        stance = "DEFEND"
      end
      oneText("Capstone Textbox/Beatbox.png", "You activated the beatbox! The enemy is now so eager to see you that it is "..stance.."ing!")
      updateBattleTextWithoutID()
    end
      
  elseif event.x < 109 then
    
    if info[file].item.scope == 0 then
      oneText("Capstone Textbox/Question.png", "Scope is not in your inventory!")
    else
      info[file].item.scope = info[file].item.scope - 1
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      info[file].battle.status.scope = true
      oneText("Capstone Textbox/Scope.png", "You peeked into the scope and see the enemy's weakness, now you can hit twice as hard!")
      updateBattleTextWithoutID()
    end
    
  elseif event.x < 142 then
    
    if info[file].item.decoction == 0 then
      oneText("Capstone Textbox/Question.png", "Decoction is not in your inventory!")
    else
      info[file].item.decoction = info[file].item.decoction - 1
      info[file].battle.you.hp = info[file].battle.you.hp + math.floor(info[file].battle.you.maxhp / 2)
      if info[file].battle.you.hp > info[file].battle.you.maxhp then
        info[file].battle.you.hp = info[file].battle.you.maxhp
      end
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      oneText("Capstone Textbox/Decoction.png", "You used decoction and gained half of your full health back!")
      updateBattleTextWithoutID()
    end
    
  elseif event.x < 177 then
    
    if info[file].item.tonic == 0 then
      oneText("Capstone Textbox/Question.png", "Tonic is not in your inventory!")
    else
      info[file].item.tonic = info[file].item.tonic - 1
      info[file].battle.you.hp = info[file].battle.you.maxhp
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      oneText("Capstone Textbox/Tonic.png", "You used tonic and restored all of your full health back!")
      updateBattleTextWithoutID()
    end
    
  elseif event.x < 212 then
    
    if info[file].item.stungun == 0 then
      oneText("Capstone Textbox/Question.png", "Stun gun is not in your inventory!")
    else
      info[file].item.stungun = info[file].item.stungun - 1
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      info[file].battle.status.stun = info[file].battle.status.turn + 3
      oneText("Capstone Textbox/Stungun.png", "You stunned your enemy with a stun gun! The enemy is now stunned into attacking for 3 turns!")
      updateBattleTextWithoutID()
    end
    
  elseif event.x < 244 then
    
    if info[file].item.shuriken == 0 then
      oneText("Capstone Textbox/Question.png", "Shuriken is not in your inventory!")
    else
      info[file].item.shuriken = info[file].item.shuriken - 1
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      info[file].battle.enemy.hp = info[file].battle.enemy.hp - 20
      oneText("Capstone Textbox/Shuriken.png", "You throwed a shuriken into the enemy! The enemy's health is lost!")
      if info[file].battle.enemy.hp <= 0 then
        endBattle()
      else
        updateBattleTextWithoutID()
      end
    end
    
  else
    
    if info[file].item.repellent == 0 then
      oneText("Capstone Textbox/Question.png", "Repellent is not in your inventory!")
    else
      info[file].item.repellent = info[file].item.repellent - 1
      info[file].battle.status.turn = info[file].battle.status.turn + 1
      endBattle()
      oneText("Capstone Textbox/Repellent.png", "You used a repellent! The enemy ran away.")
    end
    
  end
    
end

function updateBattleTextWithoutID()

  turnText:removeSelf()
  turnText = nil
  turnText = display.newText("Turn: "..info[file].battle.status.turn, 90, 260, 120, 20, "Times New Roman", 20, "left")
  
  youHpText:removeSelf()
  youHpText = nil
  youHpText = display.newText(info[file].battle.you.hp.."HP", 80, 45, native.systemFontBold, 30)
  youHpText:setFillColor(1 - (info[file].battle.you.hp / info[file].battle.you.maxhp), info[file].battle.you.hp / info[file].battle.you.maxhp, 0)
  
  enemyHpText:removeSelf()
  enemyHpText = nil
  enemyHpText = display.newText(info[file].battle.enemy.hp.."HP", 240, 45, native.systemFontBold, 30)
  enemyHpText:setFillColor(0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2))
  
end

function updateBattleText()
  
  turnText:removeSelf()
  turnText = nil
  turnText = display.newText("Turn: "..info[file].battle.status.turn, 90, 260, 120, 20, "Times New Roman", 20, "left")
  
  pattText:removeSelf()
  pattText = nil
  battleCode = attackPattern()
  pattText = display.newText("ID: "..battleCode[1]..battleCode[4].."-"..battleCode[3], 90, 280, 120, 20, "Times New Roman", 20, "left")
  
  youHpText:removeSelf()
  youHpText = nil
  youHpText = display.newText(info[file].battle.you.hp.."HP", 80, 45, native.systemFontBold, 30)
  youHpText:setFillColor(1 - (info[file].battle.you.hp / info[file].battle.you.maxhp), info[file].battle.you.hp / info[file].battle.you.maxhp, 0)
  
  enemyHpText:removeSelf()
  enemyHpText = nil
  enemyHpText = display.newText(info[file].battle.enemy.hp.."HP", 240, 45, native.systemFontBold, 30)
  enemyHpText:setFillColor(0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2), 0.5 + ((info[file].battle.enemy.hp / info[file].battle.enemy.maxhp) / 2))
  
end