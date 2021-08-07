---TO ADD:RANDOMIZED ENEMIES, DARK FOREST MUSIC, ICON

local cx,cy = display.contentCenterX,display.contentCenterY
local ch,cw = display.contentHeight, display.contentWidth
local widget = require "widget"
-- requires
require "animations"
local composer = require "composer"
local scene = composer.newScene()

local physics = require "physics"
physics.start()
--physics.setDrawMode("hybrid")

local spellCollision = {categoryBits=1, maskBits=2}
local darkWizardCollisions = {categoryBits=2, maskBits=5}
local wizCollisions = {categoryBits=4, maskBits=2}
local darkSound = audio.loadSound("music/darksanctum.mp3")
local fbSound= audio.loadSound("fire.wav")
local gameTrack
local jung1 = {}
local jung2 = {}
local jung3 = {}
local jung4 = {}
local jung5 = {}
local ground = {}
local char1
local currEnemCoun = 0
local char2 = {}
local xCount = 0
local a=0
local b=0
local i=0
local fireball={}
local ftime = 0
local n = 0
local firecount = 0
local fireballLock = false
local function wizCount()
  wizBan=wizBan+1;
  currEnemCoun = currEnemCoun + 1
  wizBanTxt.text="Wizards Banished: "..wizBan
end

local function scrollJung(self,event)
	if self.x < -1913 then
		self.x = 1920
	else
		self.x = self.x - self.speed
	end
end
local function scrollGround(self,event)
	if self.x < -450 then
		self.x = 2220
	else
		self.x = self.x - self.speed
	end
end

local function scrollEnemies(self,event)
	if self.x < -200 then
		self.x = 2100
	else
		self.x = self.x - self.speed
	end
end

local function projectile(self,event)
	if self.x > 1850 then
    firecount = firecount + 1
		self:removeSelf()
--    self = nil
    Runtime:removeEventListener("enterFrame", self)
	else
		self.x = self.x + self.speed
	end
end
local function endGame()
  composer.setVariable("finalScore", bankscore)
  composer.removeScene( "highscores" )
  composer.gotoScene( "highscores", {time = 800, effect = "crossFade"}) 
  level=1; -- game level variable
  armor=0; -- player armor
  staff = 0; -- player damageamp
  skill=0; -- player spell cast speed
  wizBan = 0
  bank=0
  bankscore = 0
  Alevel = 0
  Wlevel=0
  Slevel=0
  upl1 = 0
  upl2 = 0
  upl3 = 0
  upl4 = 0
  upl5 = 0
end
local function onCollision(event)

  if event.phase == "began" then
    if event.target.name=="fb" then
      firecount = firecount + 1
      event.target:removeSelf()
      event.target.enterFrame = onCollision
      Runtime:removeEventListener("enterFrame", event.target)
      event.other:setFillColor(0.8,0,0)
      event.other.hp = event.other.hp - char1.damage
    end

    if event.target.name=="wiz" then
      event.target.hp=event.target.hp -5-level+1
      wizhptxt.text = "HP: "..char1.hp
      event.other.hp = event.other.hp - 15
    end

    if event.other.hp <= 0 then
      if event.other.name=="wiz" then
        fireballLock=true
--        gTxt.text="Wiz has Died :(!\n All Hope Is Lost!"
        gameovercheck = true
        endGame()
      end
      event.other.enterFrame = scrollEnemies
      Runtime:removeEventListener("enterFrame",event.other)
      --physics.removeBody(event.other)
      event.other:removeSelf()
      wizCount();
      bank=bank+level;
      bankscore = bankscore+level
--      coinCounter(xCount)
      coinCounterTxt.text = "Coins: "..bank
      b=b-1;
    end

  end
end

-- background

local function enemySpawn()
  if b<10 then
    b=b+1;
    a=a+1
--    print("b: "..b.."    a: "..a)
    char2[a]=display.newImage("Wiz/Wizard2.png")
    char2[a]:scale(0.4,0.4)
    char2[a].x = cw+50
    char2[a].y = cy+cy*0.42
    char2[a].speed = 5 + math.floor(level/2)
    char2[a].hp = 8 + level
    char2[a].enterFrame = scrollEnemies
    Runtime:addEventListener("enterFrame", char2[a])
    physics.addBody(char2[a], {radius = 20})
    char2[a].filter = darkWizardCollisions;
    char2[a].gravityScale=0
    char2[a]:addEventListener("collision", onCollision)
--    gTxt.text="";
    xCount = xCount+1
    button1:toFront()
  end
end
local function genChar()
  char1=display.newImage("Wiz/Wizard.png")
  char1:scale(0.4,0.4)
  char1.name="wiz"
  char1.x = cx - 0.4*cw
  char1.y = cy+cy*0.42
  char1.hp= 20 + armor;
  char1.damage = 5+staff
  physics.addBody( char1, {radius=20} )
  char1.isSensor=true;
  char1.gravityScale=0
  char1:addEventListener("collision",onCollision)
  char1.filter=wizCollisions;
end

function buttonHandler(event)
    if event.phase == "began" then
      if fireballLock == false then
        audio.play(fbSound)
        fireball[n] = display.newImage("fball.png",char1.x+70,char1.y)
        fireball[n]:scale(3,3)
        fireball[n].speed = 20
        fireball[n].hp = 5 + staff
        fireball[n].name = "fb"
        fireball[n].enterFrame = projectile
        Runtime:addEventListener("enterFrame",fireball[n])
--        fireball[n].alpha = 0
        physics.addBody(fireball[n], {radius = 20})
        fireball[n].gravityScale = 0
        fireball[n].filter=spellCollision
        fireball[n]:addEventListener("collision", onCollision)
--        fireball[n]:addEventListener("postCollision", onPostCollision)
        n=n+1
        fireballLock = true
        ftime = 1
      end
    end
end

local function game (event)
  i = i+1
  if ftime >= 1 then
    ftime = ftime + 1
  end
  
  if ftime>(45-skill) then
    if fireballLock then
      ftime = 0
      fireballLock=false
    end
  end
  if i>15 then
    i=0
    spawn = math.random(0,100)
--    print(spawn)
      if spawn>75-math.floor(level/2) then
        enemySpawn()
      end
  end
  if wizBan > 7*level+math.floor(level/3) then
      level=level+1;
      composer.gotoScene("upgrades")
  end
end

music = audio.loadStream("music/airship.mp3")

function scene:create( event )
--  event.params.
  composer.removeHidden()
  local sceneGroup = self.view
if paralswitcher == 0 then  
  background = display.newImage("plx-1.png",cx,cy)
  background.width = 1920
  background.height = 1080
--  sceneGroup:insert(background)               ------------
  for i = 0,1 do
    jung1[i]= display.newImage("plx-2.png")
    jung1[i].anchorX = 0
    jung1[i].anchorY = 1
    jung1[i].width = 1920
    jung1[i].height = 1080
    jung1[i].x = 0 + 1920*i
    jung1[i].y = 1080
    jung1[i].speed = 1
    jung1[i].enterFrame = scrollJung
--    sceneGroup:insert(jung1[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung1[i])
  end
  for i = 0,1 do
    jung2[i]= display.newImage("plx-3.png")
    jung2[i].anchorX = 0
    jung2[i].anchorY = 1
    jung2[i].width = 1920
    jung2[i].height = 1080
    jung2[i].x = 0 + 1920*i
    jung2[i].y = 1080
    jung2[i].speed = 2
    jung2[i].enterFrame = scrollJung
--    sceneGroup:insert(jung2[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung2[i])
  end
  for i = 0,1 do
    jung3[i]= display.newImage("plx-4.png")
    jung3[i].anchorX = 0
    jung3[i].anchorY = 1
    jung3[i].width = 1920
    jung3[i].height = 1080
    jung3[i].x = 0 + 1920*i
    jung3[i].y = 1080
    jung3[i].speed = 3
    jung3[i].enterFrame = scrollJung
--    sceneGroup:insert(jung3[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung3[i])
  end
  for i = 0,1 do
    jung4[i]= display.newImage("plx-5.png")
    jung4[i].anchorX = 0
    jung4[i].anchorY = 1
    jung4[i].width = 1920
    jung4[i].height = 1080
    jung4[i].x = 0 + 1920*i
    jung4[i].y = 1080
    jung4[i].speed = 5
    jung4[i].enterFrame = scrollJung
--    sceneGroup:insert(jung4[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung4[i])
  end

  for i = 0,5 do
    ground[i] = display.newImage("jground.png")
    ground[i].anchorX = 0
    ground[i].anchorY = 1
    ground[i].width = 450
    ground[i].height = 200
    ground[i].x = 0 + 450*i
    ground[i].y = 1150
    ground[i].speed = 5
    ground[i].enterFrame = scrollGround
--    sceneGroup:insert(ground[i])                  ----------------
    Runtime:addEventListener("enterFrame", ground[i])
  end
  
elseif paralswitcher == 1 then
  background = display.newImage("Parallax/layer_07.png",cx,cy)
  background.width = 1920
  background.height = 1080
--  sceneGroup:insert(background)               ------------
  for i = 0,1 do
    jung1[i]= display.newImage("Parallax/layer_06.png")
    jung1[i].anchorX = 0
    jung1[i].anchorY = 1
    jung1[i].width = 1920
    jung1[i].height = 1080
    jung1[i].x = 0 + 1920*i
    jung1[i].y = 1080
    jung1[i].speed = 1
    jung1[i].enterFrame = scrollJung
--    sceneGroup:insert(jung1[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung1[i])
  end
  for i = 0,1 do
    jung2[i]= display.newImage("Parallax/layer_02.png")
    jung2[i].anchorX = 0
    jung2[i].anchorY = 1
    jung2[i].width = 1920
    jung2[i].height = 1080
    jung2[i].x = 0 + 1920*i
    jung2[i].y = 1140
    jung2[i].speed = 2
    jung2[i].enterFrame = scrollJung
--    sceneGroup:insert(jung2[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung2[i])
  end
  for i = 0,1 do
    jung3[i]= display.newImage("Parallax/layer_03.png")
    jung3[i].anchorX = 0
    jung3[i].anchorY = 1
    jung3[i].width = 1920
    jung3[i].height = 1080
    jung3[i].x = 0 + 1920*i
    jung3[i].y = 1080
    jung3[i].speed = 3
    jung3[i].enterFrame = scrollJung
--    sceneGroup:insert(jung3[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung3[i])
  end
  for i = 0,1 do
    jung4[i]= display.newImage("Parallax/layer_05.png")
    jung4[i].anchorX = 0
    jung4[i].anchorY = 1
    jung4[i].width = 1920
    jung4[i].height = 1200
    jung4[i].x = 0 + 1920*i
    jung4[i].y = 1130
    jung4[i].speed = 4
    jung4[i].enterFrame = scrollJung
--    sceneGroup:insert(jung4[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung4[i])
  end
  for i = 0,1 do
    jung5[i]= display.newImage("Parallax/layer_04.png")
    jung5[i].anchorX = 0
    jung5[i].anchorY = 1
    jung5[i].width = 1920
    jung5[i].height = 1200
    jung5[i].x = 0 + 1920*i
    jung5[i].y = 1180
    jung5[i].speed = 5
    jung5[i].enterFrame = scrollJung
--    sceneGroup:insert(jung4[i])                  ----------------
    Runtime:addEventListener("enterFrame", jung5[i])
  end
  for i = 0,1 do
    ground[i] = display.newImage("Parallax/layer_01.png")
    ground[i].anchorX = 0
    ground[i].anchorY = 1
--    ground[i].width = 450
--    ground[i].height = 200
    ground[i].x = 0 + 1920*i
    ground[i].y = 1150
    ground[i].speed = 5
    ground[i].enterFrame = scrollJung
--    sceneGroup:insert(ground[i])                  ----------------
    Runtime:addEventListener("enterFrame", ground[i])
  end
end  
--- ADDED PLAYER ---
  genChar();
if paralswitcher == 0 then
  paralswitcher = 1
elseif paralswitcher == 1 then
  paralswitcher = 0 
end

  wizBanTxt=display.newText("Wizards Banished: "..wizBan, cx+0.2*cw, 75)
  coinCounterTxt = display.newText("Coins: "..bank, cx-0.2*cw, 75)
  coinCounterTxt:setFillColor(229/255, 219/255, 19/255)
  wizhptxt = display.newText("HP: "..char1.hp, cx-0.2*cw, 150)
--  gTxt=display.newText("",cx,cy+275, system.nativeFont, 100)
--  gTxt:setFillColor(1)
  button1 = widget.newButton{
      id = "spell1",
      label = "A",
      x = 0.90*display.contentWidth,
      y = 0.90*display.contentHeight,
      defaultFile = "leather button.png",
      overFile = "leather button pressed.png",
      onPress = buttonHandler
  }
  button1:scale(1.5,1.5)
--  sceneGroup:insert(button1) ----------------
  button1:toFront()
  button1.alpha = 0.75
end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

--    sceneGroup:insert(button1)
    Runtime:addEventListener("enterFrame", game)
--    openWiz = display.newSprite(sheetWiz2, sequence_Wiz2)
--    openWiz.x = cx
--    openWiz.y = cy
--    openWiz:scale(7,7)
----    openWiz:play()
--    openWiz2 = display.newSprite(sheetWiz3, sequence_Wiz3)
--    openWiz2.x = cx
--    openWiz2.y = cy-48
--    openWiz2:scale(7,7)
--    openWiz2:play()
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
  if paralswitcher == 1 then
    audio.play( music, {channel=1, loops = -1})
	elseif paralswitcher == 0 then
    audio.play( darkSound, {channel=1, loops = -1})
  end
  end
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

    for i = 0,1 do
      Runtime:removeEventListener("enterFrame", jung1[i])
      Runtime:removeEventListener("enterFrame", jung2[i])
      Runtime:removeEventListener("enterFrame", jung3[i])
      Runtime:removeEventListener("enterFrame", jung4[i])
      jung1[i]:removeSelf()
      jung2[i]:removeSelf()
      jung3[i]:removeSelf()
      jung4[i]:removeSelf()
      if jung5[i] ~= nil then
        Runtime:removeEventListener("enterFrame", jung5[i])
        jung5[i]:removeSelf()
      end
    end
    background:removeSelf()

    for i = 0,5 do
      if ground[i] ~= nil then
      Runtime:removeEventListener("enterFrame", ground[i])
      ground[i]:removeSelf()
      end
    end
      Runtime:removeEventListener("enterFrame", scrollEnemies)
      Runtime:removeEventListener("enterFrame", game)
    local t = 0
    for i = currEnemCoun+1,a do
      t = t+1
      print("t: " ..t)
--    for i = a-b,a do
--      char2[i].enterFrame = scrollEnemies
      Runtime:removeEventListener("enterFrame", char2[i])
      if char2[i] ~= nil then
      char2[i]:removeSelf()
      end
    end
    for i = firecount+1, n do
      Runtime:removeEventListener("enterFrame", fireball[i])
      if fireball[i] ~= nil then
      fireball[i]:removeSelf()
      end
    end
    if char1~=nil then char1:removeSelf() end

    button1:setEnabled(false)
    button1:removeSelf()
    wizBanTxt:removeSelf()
    coinCounterTxt:removeSelf()
    wizhptxt:removeSelf()
  --audio.stop(fbSound)
    audio.stop( 1 )
    audio.dispose( menuTrack )
  elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
  for i = wizBan+1,a do
--      char2[i].enterFrame = scrollEnemies
--      Runtime:removeEventListener("enterFrame", char2[i])
--      char2[i]:removeSelf()
    end
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
