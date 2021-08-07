local cx,cy = display.contentCenterX,display.contentCenterY
local ch,cw = display.contentHeight, display.contentWidth
local widget = require "widget"
-- requires

local composer = require "composer"
local scene = composer.newScene()

local function gotoGame()
  composer.gotoScene("game", { time = 800, effect="fade"})
end

local bought = false

local function ButtonHandler(event)
  if event.phase == "ended" then
    if event.target.id == "weapon1" then
      if(bank>5 and not bought) then
        upl1 = upl1+1
        staff = 5
        bank=bank-10
        bought=true
      end
    elseif event.target.id == "weapon2" then
      if(bank>50) then
        upl1 = upl1+1
        staff = 10
        bank=bank-50
      end
    elseif event.target.id == "weapon3" then
      if (bank>200) then
        upl1 = upl1+1
        staff = 20
        bank=bank<100
      end
    elseif event.target.id == "weapon4" then
      if(bank>500) then
        upl1 = upl1+1
        staff = 40
        bank=bank-500
      end
   elseif event.target.id == "resume" then
      gotoGame()
    end


  end


end




function scene:create( event )
  print("wedidit")
  composer.removeHidden()
	local sceneGroup = self.view
  print("upl1 = "..upl1)
  print("upl2 = "..upl2)
  local background1 = display.newRect(cx,cy,cw,ch)
  background1:setFillColor(198/255,166/255,1/255)
  sceneGroup:insert(background1)
  local background2 = display.newRect(cx,cy,cw*0.95,ch*0.85)
  background2:setFillColor(145/255,94/255,7/255)
  sceneGroup:insert(background2)


 end


function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
  local title_shadow = display.newText("Spell Book Upgrades", cx+5, 70, native.systemFontBold, 70)
  title_shadow:setFillColor(0)
  sceneGroup:insert(title_shadow)
  local title = display.newText("Spell Book Upgrades", cx, 65, native.systemFontBold, 70)
  sceneGroup:insert(title)
if upl1 == 0 then
  playButton1 = widget.newButton{
    id = "weapon1",
    x=cx-700,
    y=cy-250,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1)
  playButton1.text = display.newText("Damage",playButton1.x,playButton1.y-120, native.systemFontBold, 40)
elseif upl1 >= 1 then
  playButton1 = display.newImage("ButtonPressedLock.png",cx-700,cy-250)
  playButton1.text = display.newText("Damage",playButton1.x,playButton1.y-120, native.systemFontBold, 40)
--    sceneGroup:insert(playButton1)
end
 if upl1==1 then
  playButton1_2 = widget.newButton{
    id = "weapon2",
    x=cx-700,
    y=cy-60,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_2)
elseif upl1 == 0 or upl1 >1 then
  playButton1_2 = display.newImage("ButtonPressedLock.png",cx-700,cy-60)
--    sceneGroup:insert(playButton1)
end
if upl1==2 then
 playButton1_3 = widget.newButton{
    id = "weapon3",
    x=cx-700,
    y=cy+140,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_3)
  elseif upl1<2 or upl1>2 then
  playButton1_3 = display.newImage("ButtonPressedLock.png",cx-700,cy+140)
--    sceneGroup:insert(playButton1)
end
if upl1 ==3 then
  playButton1_4 = widget.newButton{
    id = "weapon4",
    x=cx-700,
    y=cy+340,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_4)
 elseif upl1 < 3 or upl1 > 3 then
  playButton1_4 = display.newImage("ButtonPressedLock.png",cx-700,cy+340)
--    sceneGroup:insert(playButton1)
 end
 ----
 ----armor/HP
 if upl2 == 0 then
  playButton2 = widget.newButton{
    id = "robe",
    x=cx-400,
    y=cy-250,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2)
  playButton2.text = display.newText("Armor",playButton2.x,playButton2.y-120, native.systemFontBold, 40)
elseif upl2 > 0 then
  playButton2 = display.newImage("ButtonPressedLock.png",cx-400,cy-250)
  playButton2.text = display.newText("Armor",playButton2.x,playButton2.y-120, native.systemFontBold, 40)
--    sceneGroup:insert(playButton1)
end
if upl2 == 1 then
  playButton2_2 = widget.newButton{
    id = "robe2",
    x=cx-400,
    y=cy-60,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_2)
elseif upl2 == 0 or upl2 > 1 then
  playButton2_2 = display.newImage("ButtonPressedLock.png",cx-400,cy-60)
--    sceneGroup:insert(playButton1)
end
if upl2 == 2 then
  playButton2_3 = widget.newButton{
    id = "robe3",
    x=cx-400,
    y=cy+140,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_3)
  elseif upl2 < 2 or upl2 > 2 then
  playButton2_3 = display.newImage("ButtonPressedLock.png",cx-400,cy+140)
--    sceneGroup:insert(playButton1)
 end
 if upl2 == 3 then
  playButton2_4 = widget.newButton{
    id = "robe4",
    x=cx-400,
    y=cy+340,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_4)
  elseif upl2 < 3 or upl2 > 3 then
  playButton2_4 = display.newImage("ButtonPressedLock.png",cx-400,cy+340)
--    sceneGroup:insert(playButton1)
 end
  ----

  ----Big Spell
  if upl3 == 0 then
  playButton3 = widget.newButton{
    id = "skill",
    x=cx-100,
    y=cy-250,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3)
  playButton3.text = display.newText("Big Spell",playButton3.x,playButton3.y-120, native.systemFontBold, 40)
elseif upl3 > 0 then
  playButton3 = display.newImage("ButtonPressedLock.png",cx-100,cy-250)
  playButton3.text = display.newText("Big Spell",playButton3.x,playButton3.y-120, native.systemFontBold, 40)
--    sceneGroup:insert(playButton1)
end
if upl3 == 1 then
  playButton3_2 = widget.newButton{
    id = "skill2",
    x=cx-100,
    y=cy-60,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_2)
elseif upl3 == 0 or upl3 > 1 then
  playButton3_2 = display.newImage("ButtonPressedLock.png",cx-100,cy-60)
--    sceneGroup:insert(playButton1)
end
if upl3 == 2 then
  playButton3_3 = widget.newButton{
    id = "skill3",
    x=cx-100,
    y=cy+140,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_3)
 elseif upl3 < 2 or upl3 > 2 then
  playButton3_3 = display.newImage("ButtonPressedLock.png",cx-100,cy+140)
--    sceneGroup:insert(playButton1)
end
if upl3 == 3 then
  playButton3_4 = widget.newButton{
    id = "skill4",
    x=cx-100,
    y=cy+340,
    defaultFile = "Button.png",
    overFile = "ButtonPressed.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_4)
elseif upl3 < 3 or upl3 > 3 then
  playButton3_4 = display.newImage("ButtonPressedLock.png",cx-100,cy+340)
--    sceneGroup:insert(playButton1)
 end
  ----

  print(bank)
---Resume Play Button
  resume = widget.newButton{
    id = "resume",
    x=cx+600,
    y=cy+300,
    width = 300,
    height = 100,
    defaultFile = "Resume.png",
    overFile = "Resume.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(resume)
--resback = display.newRoundedRect(cx+600, cy+300, 300,100, 8)
--resback:setFillColor(0,0,0.8)
--resback.id = "resume"
--resumeshad = display.newText ("Resume", cx+605, cy+305, native.systemFont, 70)
--resumeshad:setFillColor(0)
--resume = display.newText ("Resume", cx+600, cy+300, native.systemFont, 70)
--resume.id = "resume"
--sceneGroup:insert(resback)
--sceneGroup:insert(resumeshad)
--sceneGroup:insert(resume)
--resback:addEventListener("touch", ButtonHandler)
--resume:addEventListener("touch", ButtonHandler)


----
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
--  audio.play( menuTrack, {channel=1, loops = -1})
	end
end


function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
    playButton1:removeSelf()
    playButton1_2:removeSelf()
    playButton1_3:removeSelf()
    playButton1_4:removeSelf()
    playButton2:removeSelf()
    playButton2_2:removeSelf()
    playButton2_3:removeSelf()
    playButton2_4:removeSelf()
    playButton3:removeSelf()
    playButton3_2:removeSelf()
    playButton3_3:removeSelf()
    playButton3_4:removeSelf()

    resume:removeSelf()
    playButton1.text:removeSelf()
    playButton2.text:removeSelf()
    playButton3.text:removeSelf()


--    resback:removeSelf()
--    resumeshad:removeSelf()
    composer.removeScene("game")

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
--      audio.stop( 1 )
	end
end


function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
--  audio.dispose( menuTrack )
--    playButton1:removeSelf()
--    playButton2:removeSelf()
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
