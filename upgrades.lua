local cx,cy = display.contentCenterX,display.contentCenterY
local ch,cw = display.contentHeight, display.contentWidth
local widget = require "widget"
-- requires

local composer = require "composer"
local scene = composer.newScene()

local function gotoGame()
  composer.gotoScene("game", { time = 800, effect="fade"})
end

local function fadetxtout()
  transition.to(cantbuy, {time = 500, alpha = 0})  
end

local function ButtonHandler(event)
  if event.phase == "ended" then
    if event.target.id == "weapon1" then
      if(bank>=5 and Wlevel<1) then
        playButton1:setEnabled(false)
        playButton1.alpha = 0
        playButton1:removeSelf()
        playButton1 = display.newImage("UpgradePics/spell dam bought 1.png",cx-550,cy-250)
        playButton1.width = 170
        playButton1.height = 170
        upl1 = upl1+1
        staff = 5
        bank=bank-5
        coincounter.text = "Coins: "..bank
        Wlevel=Wlevel+1;
      elseif bank<5 then
        cantbuy:toFront()
        transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})

      end
    elseif event.target.id == "weapon2" then
      if(bank>=50 and Wlevel<2) then
        playButton1_2:setEnabled(false)
        playButton1_2.alpha = 0
        playButton1_2 = display.newImage("UpgradePics/spell dam bought 2.png",cx-550,cy-60)
        playButton1_2.width = 170
        playButton1_2.height = 170
        upl1 = upl1+1
        staff = 10
        bank=bank-50
        coincounter.text = "Coins: "..bank
        Wlevel=Wlevel+2;
      elseif bank<50 then
        cantbuy:toFront()
        transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
      end
    elseif event.target.id == "weapon3" then
      if (bank>=200 and Wlevel<5) then
        playButton1_3:setEnabled(false)
        playButton1_3.alpha = 0
        playButton1_3 = display.newImage("UpgradePics/spell dam bought 3.png",cx-550,cy+140)
        playButton1_3.width = 170
        playButton1_3.height = 170
        upl1 = upl1+1
        staff = 20
        bank=bank-200
        coincounter.text = "Coins: "..bank
        Wlevel=Wlevel+5
      elseif bank<200 then
        cantbuy:toFront()
        transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
      end
    elseif event.target.id == "weapon4" then
      if(bank>=500 and Wlevel<10) then
        playButton1_4:setEnabled(false)
        playButton1_4.alpha = 0
        playButton1_4 = display.newImage("UpgradePics/spell dam bought 4.png",cx-550,cy+340)
        playButton1_4.width = 170
        playButton1_4.height = 170
        upl1 = upl1+1
        staff = 40
        bank=bank-500
        coincounter.text = "Coins: "..bank
        Wlevel=Wlevel+10;
      elseif bank<500 then
        cantbuy:toFront()
        transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
      end
      -- Armor Upgrades --
    elseif event.target.id == "robe" then
        if(bank>=5 and Alevel<1) then
          playButton2:setEnabled(false)
          playButton2.alpha = 0
          playButton2:removeSelf()
          playButton2 = display.newImage("UpgradePics/robe bought 1.png",cx-250,cy-250)
          playButton2.width = 170
          playButton2.height = 170  
          upl2 = upl2+1
          armor = 5
          bank=bank-5
          coincounter.text = "Coins: "..bank
          Alevel=Alevel+1;
        elseif bank<5 then
          cantbuy:toFront()
          transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})  
        end
      elseif event.target.id == "robe2" then
        if(bank>=50 and Alevel<2) then
          playButton2_2:setEnabled(false)
          playButton2_2.alpha = 0
          playButton2_2 = display.newImage("UpgradePics/robe bought 2.png",cx-250,cy-60)
          playButton2_2.width = 170
          playButton2_2.height = 170  
          upl2 = upl2+1
          armor = 10
          bank=bank-50
          coincounter.text = "Coins: "..bank
          Alevel=Alevel+2;
        elseif bank<50 then
          cantbuy:toFront()
          transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
        end
      elseif event.target.id == "robe3" then
        if (bank>=200 and Alevel<5) then
          playButton2_3:setEnabled(false)
          playButton2_3.alpha = 0
          playButton2_3 = display.newImage("UpgradePics/robe bought 3.png",cx-250,cy+140)
          playButton2_3.width = 170
          playButton2_3.height = 170
          upl2 = upl2+1
          armor = 20
          bank=bank-200
          coincounter.text = "Coins: "..bank
          Alevel=Alevel+5
        elseif bank<200 then
          cantbuy:toFront()
          transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
        end
      elseif event.target.id == "robe4" then
        if(bank>=500 and Alevel<10) then
          playButton2_4:setEnabled(false)
          playButton2_4.alpha = 0
          playButton2_4 = display.newImage("UpgradePics/robe bought 4.png",cx-250,cy+340)
          playButton2_4.width = 170
          playButton2_4.height = 170
          upl2 = upl2+1
          armor = 40
          bank=bank-500
          coincounter.text = "Coins: "..bank
          Alevel=Alevel+10;
        elseif bank<500 then
          cantbuy:toFront()
          transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})  
        end
        -- Upgrade Skill --
      elseif event.target.id == "skill" then
          if(bank>=5 and Slevel<1) then
            playButton3:setEnabled(false)
            playButton3.alpha = 0
            playButton3:removeSelf()
            playButton3 = display.newImage("UpgradePics/staff bought 1.png",cx+50,cy-250)
            playButton3.width = 170
            playButton3.height = 170
            upl3= upl3+1
            skill = 5
            bank=bank-5
            coincounter.text = "Coins: "..bank
            Slevel=Slevel+1;
          elseif bank<5 then
            cantbuy:toFront()
            transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
          end
        elseif event.target.id == "skill2" then
          if(bank>=50 and Slevel<2) then
            playButton3_2:setEnabled(false)
            playButton3_2.alpha = 0
            playButton3_2 = display.newImage("UpgradePics/staff bought 2.png",cx+50,cy-60)
            playButton3_2.width = 170
            playButton3_2.height = 170
            upl3 = upl3+1
            skill = 10
            bank=bank-50
            coincounter.text = "Coins: "..bank
            Slevel=Slevel+2;
          elseif bank<50 then
            cantbuy:toFront()
            transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})  
          end
        elseif event.target.id == "skill3" then
          if (bank>=200 and Slevel<5) then
            playButton3_3:setEnabled(false)
            playButton3_3.alpha = 0
            playButton3_3 = display.newImage("UpgradePics/staff bought 3.png",cx+50,cy+140)
            playButton3_3.width = 170
            playButton3_3.height = 170
            upl3 = upl3+1
            skill = 15
            bank=bank-200
            coincounter.text = "Coins: "..bank
            Slevel=Slevel+5
          elseif bank<200 then
            cantbuy:toFront()
            transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
          end
        elseif event.target.id == "skill4" then
          if(bank>=500 and Slevel<10) then
            playButton3_4:setEnabled(false)
            playButton3_4.alpha = 0
            playButton3_4 = display.newImage("UpgradePics/staff bought 4.png",cx+50,cy+340)
            playButton3_4.width = 170
            playButton3_4.height = 170
            upl3 = upl3+1
            skill = 25
            bank=bank-500
            coincounter.text = "Coins: "..bank
            Slevel=Slevel+10;
          elseif bank<500 then
            cantbuy:toFront()
            transition.to(cantbuy, {time = 50, alpha = 1,onComplete = fadetxtout})
          end

   elseif event.target.id == "resume" then
      gotoGame()
    end


  end


end




function scene:create( event )
  print("wedidit")
  composer.removeHidden()
--  composer.removeScene( "game" )
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
  local title_shadow = display.newText("Spell Book Upgrades", cx+5, 70, "HARRYP_.TTF", 100)
  title_shadow:setFillColor(0)
  sceneGroup:insert(title_shadow)
  local title = display.newText("Spell Book Upgrades", cx, 65, "HARRYP_.TTF", 100)
  sceneGroup:insert(title)
if upl1 == 0 then
  playButton1 = widget.newButton{
    id = "weapon1",
    x=cx-550,
    y=cy-250,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/spell dam def 1.png",
    overFile = "UpgradePics/spell dam pressed 1.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1)
  playButton1text = display.newText("Damage",playButton1.x,playButton1.y-120, native.systemFontBold, 40)
elseif upl1 >= 1 then
  playButton1 = display.newImage("UpgradePics/spell dam bought 1.png",cx-550,cy-250)
  playButton1.width = 170
  playButton1.height = 170
  playButton1text = display.newText("Damage",playButton1.x,playButton1.y-120, native.systemFontBold, 40)
--    sceneGroup:insert(playButton1)
end
 if upl1==1 then
  playButton1_2 = widget.newButton{
    id = "weapon2",
    x=cx-550,
    y=cy-60,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/spell dam def 2.png",
    overFile = "UpgradePics/spell dam pressed 2.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_2)
elseif upl1 == 0 then
  playButton1_2 = display.newImage("UpgradePics/spell dam pressed 2.png",cx-550,cy-60)
  playButton1_2.width = 170
  playButton1_2.height = 170
elseif upl1 > 1 then
  playButton1_2 = display.newImage("UpgradePics/spell dam bought 2.png",cx-550,cy-60)
  playButton1_2.width = 170
  playButton1_2.height = 170
end
if upl1==2 then
 playButton1_3 = widget.newButton{
    id = "weapon3",
    x=cx-550,
    y=cy+140,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/spell dam def 3.png",
    overFile = "UpgradePics/spell dam pressed 3.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_3)
  elseif upl1<2 then
    playButton1_3 = display.newImage("UpgradePics/spell dam pressed 3.png",cx-550,cy+140)
    playButton1_3.width = 170
    playButton1_3.height = 170
  elseif upl1>2 then
  playButton1_3 = display.newImage("UpgradePics/spell dam bought 3.png",cx-550,cy+140)
  playButton1_3.width = 170
  playButton1_3.height = 170
end
if upl1 ==3 then
  playButton1_4 = widget.newButton{
    id = "weapon4",
    x=cx-550,
    y=cy+340,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/spell dam def 3.png",
    overFile = "UpgradePics/spell dam pressed 3.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton1_4)
 elseif upl1 < 3 then
  playButton1_4 = display.newImage("UpgradePics/spell dam pressed 3.png",cx-550,cy+340)
  playButton1_4.width = 170
  playButton1_4.height = 170
 elseif upl1 > 3 then
  playButton1_4 = display.newImage("UpgradePics/spell dam bought 3.png",cx-550,cy+340)
  playButton1_4.width = 170
  playButton1_4.height = 170
 end
 ----
 ----armor/HP
 if upl2 == 0 then
  playButton2 = widget.newButton{
    id = "robe",
    x=cx-250,
    y=cy-250,
    width = 170,
    height = 170,    
    defaultFile = "UpgradePics/robe def 1.png",
    overFile = "UpgradePics/robe pressed 1.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2)
  playButton2text = display.newText("Armor",playButton2.x,playButton2.y-120, native.systemFontBold, 40)
elseif upl2 > 0 then
  playButton2 = display.newImage("UpgradePics/robe bought 1.png",cx-250,cy-250)
  playButton2text = display.newText("Armor",playButton2.x,playButton2.y-120, native.systemFontBold, 40)
  playButton2.width = 170
  playButton2.height = 170

end
if upl2 == 1 then
  playButton2_2 = widget.newButton{
    id = "robe2",
    x=cx-250,
    y=cy-60,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/robe def 2.png",
    overFile = "UpgradePics/robe pressed 2.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_2)
elseif upl2 == 0 then
  playButton2_2 = display.newImage("UpgradePics/robe pressed 2.png",cx-250,cy-60)
  playButton2_2.width = 170
  playButton2_2.height = 170
elseif upl2 > 1 then
  playButton2_2 = display.newImage("UpgradePics/robe bought 2.png",cx-250,cy-60)
  playButton2_2.width = 170
  playButton2_2.height = 170
end
if upl2 == 2 then
  playButton2_3 = widget.newButton{
    id = "robe3",
    x=cx-250,
    y=cy+140,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/robe def 3.png",
    overFile = "UpgradePics/robe pressed 3.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_3)
  elseif upl2 < 2 then
    playButton2_3 = display.newImage("UpgradePics/robe pressed 3.png",cx-250,cy+140)
    playButton2_3.width = 170
    playButton2_3.height = 170
  elseif upl2 > 2 then
    playButton2_3 = display.newImage("UpgradePics/robe bought 3.png",cx-250,cy+140)
    playButton2_3.width = 170
    playButton2_3.height = 170
 end
 if upl2 == 3 then
  playButton2_4 = widget.newButton{
    id = "robe4",
    x=cx-250,
    y=cy+340,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/robe def 4.png",
    overFile = "UpgradePics/robe pressed 4.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton2_4)
  elseif upl2 < 3 then
  playButton2_4 = display.newImage("UpgradePics/robe pressed 4.png",cx-250,cy+340)
  playButton2_4.width = 170
  playButton2_4.height = 170
  elseif upl2 > 3 then
  playButton2_4 = display.newImage("UpgradePics/robe bought 4.png",cx-250,cy+340)
  playButton2_4.width = 170
  playButton2_4.height = 170
 end
  ----

  ----Big Spell
  if upl3 == 0 then
  playButton3 = widget.newButton{
    id = "skill",
    x=cx+50,
    y=cy-250,
    width = 170,
    height = 170,    
    defaultFile = "UpgradePics/staff def 1.png",
    overFile = "UpgradePics/staff pressed 1.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3)
  playButton3text = display.newText("Speed",playButton3.x,playButton3.y-120, native.systemFontBold, 40)
elseif upl3 > 0 then
  playButton3 = display.newImage("UpgradePics/staff bought 1.png",cx+50,cy-250)
  playButton3text = display.newText("Speed",playButton3.x,playButton3.y-120, native.systemFontBold, 40)
  playButton3.width = 170
  playButton3.height = 170
end
if upl3 == 1 then
  playButton3_2 = widget.newButton{
    id = "skill2",
    x=cx+50,
    y=cy-60,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/staff def 2.png",
    overFile = "UpgradePics/staff pressed 2.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_2)
elseif upl3 == 0 then
  playButton3_2 = display.newImage("UpgradePics/staff pressed 1.png",cx+50,cy-60)
  playButton3_2.width = 170
  playButton3_2.height = 170
elseif upl3 > 1 then
  playButton3_2 = display.newImage("UpgradePics/staff bought 1.png",cx+50,cy-60)
  playButton3_2.width = 170
  playButton3_2.height = 170
end
if upl3 == 2 then
  playButton3_3 = widget.newButton{
    id = "skill3",
    x=cx+50,
    y=cy+140,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/staff def 3.png",
    overFile = "UpgradePics/staff pressed 3.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_3)
 elseif upl3 < 2 then
  playButton3_3 = display.newImage("UpgradePics/staff pressed 3.png",cx+50,cy+140)
  playButton3_3.width = 170
  playButton3_3.height = 170
 elseif upl3 > 2 then
  playButton3_3 = display.newImage("UpgradePics/staff bought 3.png",cx+50,cy+140)
  playButton3_3.width = 170
  playButton3_3.height = 170
end
if upl3 == 3 then
  playButton3_4 = widget.newButton{
    id = "skill4",
    x=cx+50,
    y=cy+340,
    width = 170,
    height = 170,
    defaultFile = "UpgradePics/staff def 4.png",
    overFile = "UpgradePics/staff pressed 4.png",
    onEvent = ButtonHandler
  }
  sceneGroup:insert(playButton3_4)
elseif upl3 < 3 then
  playButton3_4 = display.newImage("UpgradePics/staff pressed 4.png",cx+50,cy+340)
  playButton3_4.width = 170
  playButton3_4.height = 170
elseif upl3 > 3 then
  playButton3_4 = display.newImage("UpgradePics/staff bought 4.png",cx+50,cy+340)
  playButton3_4.width = 170
  playButton3_4.height = 170
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
  cantbuy = display.newText("Not Enough\n      Gold!", cx+550, cy-200, native.systemFontBold, 80)
  cantbuy.alpha = 0
  sceneGroup:insert(cantbuy)
  price1 = display.newText("5 Gold\n Coins", playButton1.x-220, playButton1.y, native.systemFontBold, 40)
  price1:setFillColor(229/255, 219/255, 19/255)
  sceneGroup:insert(price1)
  price2 = display.newText("50 Gold\n  Coins", playButton1_2.x-210, playButton1_2.y, native.systemFontBold, 40)
  price2:setFillColor(229/255, 219/255, 19/255)
  sceneGroup:insert(price2)
  price3 = display.newText("200 Gold\n   Coins", playButton1_3.x-200, playButton1_3.y, native.systemFontBold, 40)
  price3:setFillColor(229/255, 219/255, 19/255)
  sceneGroup:insert(price3)
  price4 = display.newText("500 Gold\n   Coins", playButton1_4.x-200, playButton1_4.y, native.systemFontBold, 40)
  price4:setFillColor(229/255, 219/255, 19/255)
  sceneGroup:insert(price4)
  coincounter = display.newText("Coins: "..bank, cx+550, cy, native.systemFontBold, 80)
  coincounter:setFillColor(229/255, 219/255, 19/255)
  sceneGroup:insert(coincounter)

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
    if playButton1text ~= nil then
      playButton1text:removeSelf()
    end
    if playButton2text ~= nil then
      playButton2text:removeSelf()
    end
    if playButton3text ~= nil then
      playButton3text:removeSelf()
    end
    cantbuy:removeSelf()
    coincounter:removeSelf()

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
