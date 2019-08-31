function createSave()
  
  local info = {}

  for i = 1, 5 do -- 5 save files
    
    --[[
    -- After Ruins
    
    info[i] = {}
    info[i].map = {}
    info[i].prog = {}
    info[i].battle = {}
    info[i].item = {}
    info[i].meta = {}
    info[i].interactibles = createInteractibles()
    info[i].textlist = {}
    info[i].textlist[0] = 0
    info[i].trophy = {}
    info[i].laser = createLaser()
    info[i].numLaser = 0
    
    info[i].shop = false
    info[i].cave = makeCaveMap()
    
    info[i].text = false
    info[i].textpath = ""
    info[i].textchoose = true
    
    info[i].dir = "Down"
    
    info[i].posx = 5
    info[i].posy = 5

    info[i].centerx = 5
    info[i].centery = 5
    
    info[i].map.name = "Ruins"
    info[i].map.realname = "Relic Ruins"
    info[i].map.subname = "Boss Room"
    info[i].map.id = 9
    info[i].map.subid = 16
    
    info[i].prog.cave = {}
    info[i].prog.cave.visit = 1
    info[i].prog.cave.trial = 1
    info[i].prog.cave.secondfloor = false
    info[i].prog.cave.rock = false
    info[i].prog.cave.fire = true
    info[i].prog.cave.power = false
    info[i].prog.cave.tutorial = false
    
    info[i].prog.town = {}
    info[i].prog.town.warpkey = false
    info[i].prog.town.blow = false
    info[i].prog.town.crisis = false
    info[i].prog.town.warp = makeTownWarp()
    
    info[i].prog.plains = {}
    info[i].prog.plains.item = "XXXXXXXXXXXXXXXXXOXX"
    info[i].prog.plains.song = false
    
    info[i].prog.temple = -1
    
    info[i].prog.volcano = {}
    info[i].prog.volcano.climb = true
    info[i].prog.volcano.explode = true
    
    info[i].prog.desert = {}
    info[i].prog.desert.switch = "XX"
    info[i].prog.desert.dessert = true
    info[i].prog.desert.hitlaser = false
    
    info[i].metro = createMetroFile()
    
    info[i].prog.alp = {}
    info[i].prog.alp.climb = true
    info[i].prog.alp.snowed = true
    info[i].prog.alp.dest = 0
    info[i].prog.alp.dir = ""
    info[i].prog.alp.ball = "OOOOXOOX"
    info[i].prog.alp.highlightx = 0
    info[i].prog.alp.highlighty = 0
    
    info[i].prog.ruins = {}
    info[i].prog.ruins.dest = 0
    info[i].prog.ruins.dir = ""
    info[i].prog.ruins.highlightx = 0
    info[i].prog.ruins.highlighty = 0
    info[i].prog.ruins.stair = 6
    
    info[i].prog.void = {}
    info[i].prog.void.snowdir = ""
    info[i].prog.void.snowdest = 0
    info[i].prog.void.ruinsdir = ""
    info[i].prog.void.ruinsdest = 0
    info[i].prog.void.highlightx = 0
    info[i].prog.void.highlighty = 0
    info[i].prog.void.templestep = false
    info[i].prog.void.lava = "XXXXXXX"
    
    info[i].battle.on = false
    info[i].battle.you = {}
    info[i].battle.enemy = {}
    info[i].battle.status = {}
    
    info[i].battle.you.maxhp = 100
    info[i].battle.you.hp = 100
    info[i].battle.you.endur = 20
    info[i].battle.you.hit = 10
    
    info[i].battle.enemy.name = ""
    info[i].battle.enemy.maxhp = 100
    info[i].battle.enemy.hp = 100
    info[i].battle.enemy.endur = 10
    info[i].battle.enemy.hit = 10
    info[i].battle.enemy.inc = 1.05
    info[i].battle.enemy.exp = 10
    info[i].battle.enemy.pierce = 3
    
    info[i].battle.status.turn = 1
    info[i].battle.status.prevTurnDef = 0
    info[i].battle.status.scope = false
    info[i].battle.status.item = false
    info[i].battle.status.stun = 0
    
    info[i].item.gold = 0
    info[i].item.beatbox = 0
    info[i].item.scope = 0
    info[i].item.decoction = 0
    info[i].item.tonic = 0
    info[i].item.stungun = 0
    info[i].item.shuriken = 0
    info[i].item.repellent = 0
    
    info[i].meta.up = 1
    info[i].meta.left = 1
    info[i].meta.down = 1
    info[i].meta.right = 1
    info[i].meta.act = 1
    info[i].meta.menu = 1
    info[i].meta.log = 1
    info[i].meta.attack = 1
    info[i].meta.defend = 1
    info[i].meta.item = 1

    info[i].trophy.cave = false
    info[i].trophy.town = false
    info[i].trophy.plains = false
    info[i].trophy.temple = false
    info[i].trophy.volcano = false
    info[i].trophy.desert = false
    info[i].trophy.metropolis = false
    info[i].trophy.alp = false
    info[i].trophy.ruins = false
    ]]--
    --[[
    -- After desert
    
    info[i] = {}
    info[i].map = {}
    info[i].prog = {}
    info[i].battle = {}
    info[i].item = {}
    info[i].meta = {}
    info[i].interactibles = createInteractibles()
    info[i].textlist = {}
    info[i].textlist[0] = 0
    info[i].trophy = {}
    info[i].laser = createLaser()
    info[i].numLaser = 0
    
    info[i].shop = false
    info[i].cave = makeCaveMap()
    
    info[i].text = false
    info[i].textpath = ""
    info[i].textchoose = true
    
    info[i].dir = ""
    
    info[i].posx = 2
    info[i].posy = 6

    info[i].centerx = 5
    info[i].centery = 5
    
    info[i].map.name = "Town"
    info[i].map.realname = "Anarchic Town"
    info[i].map.subname = "Town Square Ruins"
    info[i].map.id = 2
    info[i].map.subid = 2
    
    info[i].prog.cave = {}
    info[i].prog.cave.visit = 1
    info[i].prog.cave.trial = 1
    info[i].prog.cave.secondfloor = false
    info[i].prog.cave.rock = false
    info[i].prog.cave.fire = true
    info[i].prog.cave.power = false
    info[i].prog.cave.tutorial = false
    
    info[i].prog.town = {}
    info[i].prog.town.warpkey = false
    info[i].prog.town.blow = false
    info[i].prog.town.crisis = true
    info[i].prog.town.warp = makeTownWarp()
    
    info[i].prog.plains = {}
    info[i].prog.plains.item = "XXXXXXXXXXXXXXXXXOXX"
    info[i].prog.plains.song = false
    
    info[i].prog.temple = -1
    
    info[i].prog.volcano = {}
    info[i].prog.volcano.climb = true
    info[i].prog.volcano.explode = true
    
    info[i].prog.desert = {}
    info[i].prog.desert.switch = "XX"
    info[i].prog.desert.dessert = true
    info[i].prog.desert.hitlaser = false
    
    info[i].metro = createMetroFile()
    
    info[i].prog.alp = {}
    info[i].prog.alp.climb = false
    info[i].prog.alp.snowed = false
    info[i].prog.alp.dest = 0
    info[i].prog.alp.dir = ""
    info[i].prog.alp.ball = "XXXXXXXXX"
    info[i].prog.alp.highlightx = 0
    info[i].prog.alp.highlighty = 0
    
    info[i].prog.ruins = {}
    info[i].prog.ruins.dest = 0
    info[i].prog.ruins.dir = ""
    info[i].prog.ruins.highlightx = 0
    info[i].prog.ruins.highlighty = 0
    info[i].prog.ruins.stair = 1
    
    info[i].prog.void = {}
    info[i].prog.void.snowdir = ""
    info[i].prog.void.snowdest = 0
    info[i].prog.void.ruinsdir = ""
    info[i].prog.void.ruinsdest = 0
    info[i].prog.void.highlightx = 0
    info[i].prog.void.highlighty = 0
    info[i].prog.void.templestep = false
    info[i].prog.void.lava = "XXXXXXX"
    
    info[i].battle.on = false
    info[i].battle.you = {}
    info[i].battle.enemy = {}
    info[i].battle.status = {}
    
    info[i].battle.you.maxhp = 100
    info[i].battle.you.hp = 100
    info[i].battle.you.endur = 20
    info[i].battle.you.hit = 10
    
    info[i].battle.enemy.name = ""
    info[i].battle.enemy.maxhp = 100
    info[i].battle.enemy.hp = 100
    info[i].battle.enemy.endur = 10
    info[i].battle.enemy.hit = 10
    info[i].battle.enemy.inc = 1.05
    info[i].battle.enemy.exp = 10
    info[i].battle.enemy.pierce = 3
    
    info[i].battle.status.turn = 1
    info[i].battle.status.prevTurnDef = 0
    info[i].battle.status.scope = false
    info[i].battle.status.item = false
    info[i].battle.status.stun = 0
    
    info[i].item.gold = 0
    info[i].item.beatbox = 0
    info[i].item.scope = 0
    info[i].item.decoction = 0
    info[i].item.tonic = 0
    info[i].item.stungun = 0
    info[i].item.shuriken = 0
    info[i].item.repellent = 0
    
    info[i].meta.up = 1
    info[i].meta.left = 1
    info[i].meta.down = 1
    info[i].meta.right = 1
    info[i].meta.act = 1
    info[i].meta.menu = 1
    info[i].meta.log = 1
    info[i].meta.attack = 1
    info[i].meta.defend = 1
    info[i].meta.item = 1

    info[i].trophy.cave = false
    info[i].trophy.town = false
    info[i].trophy.plains = false
    info[i].trophy.temple = false
    info[i].trophy.volcano = false
    info[i].trophy.desert = false
    info[i].trophy.metropolis = false
    info[i].trophy.alp = false
    info[i].trophy.ruins = false
    
    ]]--
    
    --The real start
    
    info[i] = {}
    info[i].map = {}
    info[i].prog = {}
    info[i].battle = {}
    info[i].item = {}
    info[i].meta = {}
    info[i].interactibles = createInteractibles()
    info[i].textlist = {}
    info[i].textlist[0] = 0
    info[i].trophy = {}
    info[i].laser = createLaser()
    info[i].numLaser = 0
    
    info[i].shop = false
    info[i].cave = makeCaveMap()
    
    info[i].text = false
    info[i].textpath = ""
    info[i].textchoose = true
    
    info[i].dir = ""
    
    info[i].posx = 5
    info[i].posy = 5

    info[i].centerx = 5
    info[i].centery = 5
    
    info[i].map.name = ""
    info[i].map.realname = ""
    info[i].map.subname = ""
    info[i].map.id = 0
    info[i].map.subid = 0
    
    info[i].prog.cave = {}
    info[i].prog.cave.visit = 1
    info[i].prog.cave.trial = 1
    info[i].prog.cave.secondfloor = false
    info[i].prog.cave.rock = true
    info[i].prog.cave.fire = true
    info[i].prog.cave.power = false
    info[i].prog.cave.tutorial = true
    
    info[i].prog.town = {}
    info[i].prog.town.warpkey = false
    info[i].prog.town.blow = false
    info[i].prog.town.crisis = true
    info[i].prog.town.warp = makeTownWarp()
    
    info[i].prog.plains = {}
    info[i].prog.plains.item = "XXXXXXXXXXXXXXXXXXXX"
    info[i].prog.plains.song = false
    
    info[i].prog.temple = 0
    
    info[i].prog.volcano = {}
    info[i].prog.volcano.climb = false
    info[i].prog.volcano.explode = false
    
    info[i].prog.desert = {}
    info[i].prog.desert.switch = "XX"
    info[i].prog.desert.dessert = true
    info[i].prog.desert.hitlaser = false
    
    info[i].metro = createMetroFile()
    
    info[i].prog.alp = {}
    info[i].prog.alp.climb = false
    info[i].prog.alp.snowed = false
    info[i].prog.alp.dest = 0
    info[i].prog.alp.dir = ""
    info[i].prog.alp.ball = "XXXXXXXXX"
    info[i].prog.alp.highlightx = 0
    info[i].prog.alp.highlighty = 0
    
    info[i].prog.ruins = {}
    info[i].prog.ruins.dest = 0
    info[i].prog.ruins.dir = ""
    info[i].prog.ruins.highlightx = 0
    info[i].prog.ruins.highlighty = 0
    info[i].prog.ruins.stair = 1
    
    info[i].prog.void = {}
    info[i].prog.void.snowdir = ""
    info[i].prog.void.snowdest = 0
    info[i].prog.void.ruinsdir = ""
    info[i].prog.void.ruinsdest = 0
    info[i].prog.void.highlightx = 0
    info[i].prog.void.highlighty = 0
    info[i].prog.void.templestep = false
    info[i].prog.void.lava = "XXXXXXX"
    
    info[i].battle.on = false
    info[i].battle.you = {}
    info[i].battle.enemy = {}
    info[i].battle.status = {}
    
    info[i].battle.you.maxhp = 100
    info[i].battle.you.hp = 100
    info[i].battle.you.endur = 20
    info[i].battle.you.hit = 10
    
    info[i].battle.enemy.name = ""
    info[i].battle.enemy.maxhp = 100
    info[i].battle.enemy.hp = 100
    info[i].battle.enemy.endur = 10
    info[i].battle.enemy.hit = 10
    info[i].battle.enemy.inc = 1.05
    info[i].battle.enemy.exp = 10
    info[i].battle.enemy.pierce = 3
    
    info[i].battle.status.turn = 1
    info[i].battle.status.prevTurnDef = 0
    info[i].battle.status.scope = false
    info[i].battle.status.item = false
    info[i].battle.status.stun = 0
    
    info[i].item.gold = 0
    info[i].item.beatbox = 0
    info[i].item.scope = 0
    info[i].item.decoction = 0
    info[i].item.tonic = 0
    info[i].item.stungun = 0
    info[i].item.shuriken = 0
    info[i].item.repellent = 0
    
    info[i].meta.up = 1
    info[i].meta.left = 1
    info[i].meta.down = 1
    info[i].meta.right = 1
    info[i].meta.act = 1
    info[i].meta.menu = 1
    info[i].meta.log = 1
    info[i].meta.attack = 1
    info[i].meta.defend = 1
    info[i].meta.item = 1

    info[i].trophy.cave = false
    info[i].trophy.town = false
    info[i].trophy.plains = false
    info[i].trophy.temple = false
    info[i].trophy.volcano = false
    info[i].trophy.desert = false
    info[i].trophy.metropolis = false
    info[i].trophy.alp = false
    info[i].trophy.ruins = false
    
    
    
  end
  
  return info
  
end

function digitalize(i)
  
  local num = 0
  
  --interactibles?
  --caves?
  
  return num
  
end

function copyFile(i)
  
  for j = 1, 10 do -- copy interactibles
    if not (info[file].interactibles[j] == nil) then
      for k = 1, text[j][0] do -- amount of submaps
        if not(info[file].interactibles[j][k] == nil) then
          for l = 1, info[file].interactibles[j][k][0] do -- amount of interactibles
            info[i].interactibles[j][k][l].name = info[file].interactibles[j][k][l].name
            info[i].interactibles[j][k][l].posx = info[file].interactibles[j][k][l].posx
            info[i].interactibles[j][k][l].posy = info[file].interactibles[j][k][l].posy
          end
        end
      end
    end
  end
  
  for j = 1, 28 do
    for k = 1, 9 do
      info[i].cave[1][j][k] = info[file].cave[1][j][k]
    end
  end
  
  for j = 1, 9 do
    for k = 1, 9 do
      info[i].cave[6][j][k] = info[file].cave[6][j][k]
    end
  end
  
  info[i].text = info[file].text
  info[i].textpath = info[file].textpath
  info[i].textchoose = info[file].textchoose
  
  info[i].dir = info[file].dir
  
  info[i].posx = info[file].posx
  info[i].posy = info[file].posy

  info[i].centerx = info[file].centerx
  info[i].centery = info[file].centery
  
  info[i].map.name = info[file].map.name 
  info[i].map.realname = info[file].map.realname
  info[i].map.subname = info[file].map.subname
  info[i].map.id = info[file].map.id
  info[i].map.subid = info[file].map.subid
  
  info[i].prog.cave.visit = info[file].prog.cave.visit
  info[i].prog.cave.trial = info[file].prog.cave.trial
  info[i].prog.cave.secondfloor = info[file].prog.cave.secondfloor
  info[i].prog.cave.rock = info[file].prog.cave.rock
  info[i].prog.cave.fire = info[file].prog.cave.fire
  info[i].prog.cave.power = info[file].prog.cave.power
  info[i].prog.cave.tutorial = info[file].prog.cave.tutorial
  
  info[i].prog.town.warpkey = info[file].prog.town.warpkey
  info[i].prog.town.blow = info[file].prog.town.blow
  info[i].prog.town.crisis = info[file].prog.town.crisis
  
  for j = 1, 10 do
    info[i].prog.town.warp[j] = info[file].prog.town.warp[j]
  end
  
  info[i].prog.plains.item = info[file].prog.plains.item
  info[i].prog.plains.song = info[file].prog.plains.song
  
  info[i].prog.temple = info[file].prog.temple 
  
  info[i].prog.volcano.climb = info[file].prog.volcano.climb
  info[i].prog.volcano.explode = info[file].prog.volcano.explode
  
  info[i].prog.desert.switch = info[file].prog.desert.switch
  info[i].prog.desert.dessert = info[file].prog.desert.dessert
  info[i].prog.desert.hitlaser = info[file].prog.desert.hitlaser
  
  for j = 1, 10 do
    info[i].metro[j] = info[file].metro[j]
  end
  
  info[i].prog.alp.climb = info[file].prog.alp.climb
  info[i].prog.alp.snowed = info[file].prog.alp.snowed
  info[i].prog.alp.dest = info[file].prog.alp.dest
  info[i].prog.alp.dir = info[file].prog.alp.dir
  info[i].prog.alp.ball = info[file].prog.alp.ball
  info[i].prog.alp.highlightx = info[file].prog.alp.highlightx
  info[i].prog.alp.highlighty = info[file].prog.alp.highlighty

  info[i].prog.ruins.dest = info[file].prog.ruins.dest
  info[i].prog.ruins.dir = info[file].prog.ruins.dir
  info[i].prog.ruins.highlightx = info[file].prog.ruins.highlightx
  info[i].prog.ruins.highlighty = info[file].prog.ruins.highlighty
  info[i].prog.ruins.stair = info[file].prog.ruins.stair
  
  info[i].prog.void.snowdir = info[file].prog.void.snowdir
  info[i].prog.void.snowdest = info[file].prog.void.snowdest
  info[i].prog.void.ruinsdir = info[file].prog.void.ruinsdir
  info[i].prog.void.ruinsdest = info[file].prog.void.ruinsdest
  info[i].prog.void.highlightx = info[file].prog.void.highlightx
  info[i].prog.void.highlighty = info[file].prog.void.highlighty
  info[i].prog.void.templestep = info[file].prog.void.templestep 
  info[i].prog.void.lava = info[file].prog.void.lava
  
  info[i].battle.on = info[file].battle.on
  info[i].battle.you.hp = info[file].battle.you.hp
  info[i].battle.you.endur = info[file].battle.you.endur
  info[i].battle.you.hit = info[file].battle.you.hit
  
  info[i].battle.enemy.name = info[file].battle.enemy.name
  info[i].battle.enemy.hp = info[file].battle.enemy.hp
  info[i].battle.enemy.endur = info[file].battle.enemy.endur
  info[i].battle.enemy.hit = info[file].battle.enemy.hit
  info[i].battle.enemy.inc = info[file].battle.enemy.inc
  info[i].battle.enemy.exp = info[file].battle.enemy.exp
  info[i].battle.enemy.pierce = info[file].battle.enemy.pierce
  
  info[i].battle.status.turn = info[file].battle.status.turn
  info[i].battle.status.prevTurnDef = info[file].battle.status.prevTurnDef
  info[i].battle.status.scope = info[file].battle.status.scope
  info[i].battle.status.item = info[file].battle.status.item 
  info[i].battle.status.stun = info[file].battle.status.stun
  
  info[i].item.gold = info[file].item.gold
  info[i].item.beatbox = info[file].item.beatbox
  info[i].item.scope = info[file].item.scope
  info[i].item.decoction = info[file].item.decoction
  info[i].item.tonic = info[file].item.tonic
  info[i].item.stungun = info[file].item.stungun
  info[i].item.shuriken = info[file].item.shuriken
  info[i].item.repellent = info[file].item.repellent
  
  info[i].meta.up = info[file].meta.up
  info[i].meta.left = info[file].meta.left
  info[i].meta.down = info[file].meta.down
  info[i].meta.right = info[file].meta.right
  info[i].meta.act = info[file].meta.act
  info[i].meta.menu = info[file].meta.menu
  info[i].meta.log = info[file].meta.log
  info[i].meta.attack = info[file].meta.attack
  info[i].meta.defend = info[file].meta.defend
  info[i].meta.item = info[file].meta.item
  
  info[i].trophy.cave = info[file].trophy.cave 
  info[i].trophy.town = info[file].trophy.town
  info[i].trophy.plains = info[file].trophy.plains
  info[i].trophy.temple = info[file].trophy.temple
  info[i].trophy.volcano = info[file].trophy.volcano
  info[i].trophy.desert = info[file].trophy.desert 
  info[i].trophy.metropolis = info[file].trophy.metropolis
  info[i].trophy.alp = info[file].trophy.alp
  info[i].trophy.ruins = info[file].trophy.ruins
    
end

function setInteractiblesName(file, subid, number)
  
  if info[file].interactibles[4][subid][number].name == "Light - On" then
    return 1
  else
    return 0
  end
  
end

function printFile(i)
  
  print("Interactibles:",
    info[i].interactibles[1][5][1].posx,
    info[i].interactibles[1][5][1].posy,
    info[i].interactibles[2][4][1].posx,
    info[i].interactibles[2][4][1].posy,
    info[i].interactibles[2][4][2].posx,
    info[i].interactibles[2][4][2].posy,
    info[i].interactibles[2][4][3].posx,
    info[i].interactibles[2][4][3].posy,
    info[i].interactibles[2][4][4].posx,
    info[i].interactibles[2][4][4].posy,
    info[i].interactibles[2][18][1].posx,
    info[i].interactibles[2][18][1].posy,
    info[i].interactibles[3][1][1].posx,
    info[i].interactibles[3][1][1].posy,
    setInteractiblesName(i, 1, 1),
    setInteractiblesName(i, 1, 2),
    setInteractiblesName(i, 1, 3),
    setInteractiblesName(i, 1, 4),
    setInteractiblesName(i, 2, 1),
    setInteractiblesName(i, 3, 1),
    setInteractiblesName(i, 4, 1),
    setInteractiblesName(i, 5, 1),
    setInteractiblesName(i, 6, 1),
    setInteractiblesName(i, 6, 2),
    info[i].interactibles[4][6][3].posx,
    info[i].interactibles[4][6][3].posy,
    info[i].interactibles[4][6][4].posx,
    info[i].interactibles[4][6][4].posy,
    info[i].interactibles[4][6][5].posx,
    info[i].interactibles[4][6][5].posy,
    info[i].interactibles[4][6][6].posx,
    info[i].interactibles[4][6][6].posy,
    setInteractiblesName(i, 7, 1),
    setInteractiblesName(i, 8, 1),
    setInteractiblesName(i, 9, 1),
    setInteractiblesName(i, 10, 1),
    setInteractiblesName(i, 11, 1),
    setInteractiblesName(i, 12, 1),
    info[i].interactibles[4][13][1].posx,
    info[i].interactibles[4][13][1].posy,
    info[i].interactibles[4][13][2].posx,
    info[i].interactibles[4][13][2].posy,
    info[i].interactibles[5][1][1].posx,
    info[i].interactibles[5][1][1].posy,
    info[i].interactibles[5][2][1].posx,
    info[i].interactibles[5][2][1].posy,
    info[i].interactibles[5][3][1].posx,
    info[i].interactibles[5][3][1].posy,
    info[i].interactibles[5][4][1].posx,
    info[i].interactibles[5][4][1].posy,
    info[i].interactibles[5][4][2].posx,
    info[i].interactibles[5][4][2].posy,
    info[i].interactibles[5][4][3].posx,
    info[i].interactibles[5][4][3].posy,
    info[i].interactibles[5][5][1].posx,
    info[i].interactibles[5][5][1].posy,
    info[i].interactibles[5][6][1].posx,
    info[i].interactibles[5][6][1].posy,
    info[i].interactibles[5][6][2].posx,
    info[i].interactibles[5][6][2].posy,
    info[i].interactibles[5][6][3].posx,
    info[i].interactibles[5][6][3].posy,
    info[i].interactibles[5][7][1].posx,
    info[i].interactibles[5][7][1].posy,
    info[i].interactibles[5][8][1].posx,
    info[i].interactibles[5][8][1].posy,
    info[i].interactibles[5][9][1].posx,
    info[i].interactibles[5][9][1].posy,
    info[i].interactibles[5][9][2].posx,
    info[i].interactibles[5][9][2].posy,
    info[i].interactibles[5][10][1].posx,
    info[i].interactibles[5][10][1].posy,
    info[i].interactibles[6][1][1].posx,
    info[i].interactibles[6][1][1].posy,
    info[i].interactibles[6][1][2].posx,
    info[i].interactibles[6][1][2].posy,
    info[i].interactibles[6][1][3].posx,
    info[i].interactibles[6][1][3].posy,
    info[i].interactibles[6][1][4].posx,
    info[i].interactibles[6][1][4].posy,
    info[i].interactibles[6][1][5].posx,
    info[i].interactibles[6][1][5].posy,
    info[i].interactibles[6][1][6].posx,
    info[i].interactibles[6][1][6].posy,
    info[i].interactibles[6][2][1].posx,
    info[i].interactibles[6][2][1].posy,
    --Metropolis interactibles
    info[i].interactibles[8][3][1].posx,
    info[i].interactibles[8][3][1].posy,
    info[i].interactibles[8][9][1].posx,
    info[i].interactibles[8][9][1].posy
  )
  
  print("Cave:")
  
  for j = 1, 28 do
    for k = 1, 9 do
      if info[i].cave[1][j][k] == "Push Rock" then
        print(j, k)
      end
    end
  end
  
  print("Sewers:")
    
  for j = 1, 9 do
    for k = 1, 9 do
      if info[i].cave[6][j][k] == "Push Rock" then
        print(j, k)
      end
    end
  end
  
  print("Text:", info[i].text, "Path:", info[i].textpath, "Choose:", info[i].textchoose)
  
  print("Position:", info[i].dir, info[i].posx, info[i].posy, info[i].centerx, info[i].centery)
  
  print("Map:", info[i].map.name, info[i].map.realname, info[i].map.subname, info[i].map.id, info[i].map.subid)
  
  print("Cave:", info[i].prog.cave.visit, info[i].prog.cave.trial, info[i].prog.cave.secondfloor, info[i].prog.cave.rock, info[i].prog.cave.fire, info[i].prog.cave.power, info[i].prog.cave.tutorial)
  
  print("Town:", info[i].prog.town.warpkey, info[i].prog.town.blow, info[i].prog.town.crisis)
  
  print("Warp:")
  for j = 1, 10 do
    print(info[i].prog.town.warp[j])
  end
  
  print("Plains:", info[i].prog.plains.item, info[i].prog.plains.song)
  
  print("Temple:", info[i].prog.temple)
  
  print("Volcano:", info[i].prog.volcano.climb, info[i].prog.volcano.explode)
  
  print("Desert:", info[i].prog.desert.switch, info[i].prog.desert.dessert, info[i].prog.desert.hitlaser)
  
  print("Metro:")
  for j = 1, 10 do
    print(info[i].metro[j])
  end
  
  print("Alp:", info[i].prog.alp.climb, info[i].prog.alp.snowed, info[i].prog.alp.dest, info[i].prog.alp.dir, info[i].prog.alp.ball, info[i].prog.alp.highlightx, info[i].prog.alp.highlighty)

  print("Ruins:", info[i].prog.ruins.dest, info[i].prog.ruins.dir, info[i].prog.ruins.highlightx, info[i].prog.ruins.highlighty, info[i].prog.ruins.stair)
  
  print("Void:", info[i].prog.void.snowdir, info[i].prog.void.snowdest, info[i].prog.void.ruinsdir, info[i].prog.void.ruinsdest, info[i].prog.void.highlightx, info[i].prog.void.highlighty, info[i].prog.void.templestep, info[i].prog.void.lava)
  
  print("Battle - You:", info[i].battle.on, info[i].battle.you.hp, info[i].battle.you.endur, info[i].battle.you.hit)
  
  print("Battle - Enemy:", info[i].battle.enemy.name, info[i].battle.enemy.hp, info[i].battle.enemy.endur, info[i].battle.enemy.hit, info[i].battle.enemy.inc, info[i].battle.enemy.exp, info[i].battle.enemy.pierce)
  
  print("Battle - Status:", info[i].battle.status.turn, info[i].battle.status.prevTurnDef, info[i].battle.status.scope, info[i].battle.status.item, info[i].battle.status.stun)
  
  print("Item:", info[i].item.gold, info[i].item.beatbox, info[i].item.scope, info[i].item.decoction, info[i].item.tonic, info[i].item.stungun, info[i].item.shuriken, info[i].item.repellent)
  
  print("Meta:", info[i].meta.up, info[i].meta.left, info[i].meta.down, info[i].meta.right, info[i].meta.act, info[i].meta.menu, info[i].meta.log, info[i].meta.attack, info[i].meta.defend, info[i].meta.item)
  
  print("Trophy:", info[i].trophy.cave, info[i].trophy.town, info[i].trophy.plains, info[i].trophy.temple, info[i].trophy.volcano, info[i].trophy.desert, info[i].trophy.metropolis, info[i].trophy.alp, info[i].trophy.ruins)
  
end
  