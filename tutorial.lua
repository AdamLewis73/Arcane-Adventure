local cx,cy = display.contentCenterX,display.contentCenterY
local ch,cw = display.contentHeight, display.contentWidth
local widget = require "widget"
-- requires

local composer = require "composer"
local scene = composer.newScene()


local function gotoMenu()
  composer.removeScene("menu")
  composer.gotoScene( "menu" ,{time=500, effect="fade"})
end



function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  composer.removeHidden()
  background1 = display.newImage(sceneGroup, "tutorialbasicresized.png",cx,cy)
  background1.width = cw
  background1.height = ch+100
  menuButt = display.newRect(150,150, 400,250)
  menuButt.alpha = 0.01
  sceneGroup:insert(menuButt)
  menuButt:addEventListener( "tap", gotoMenu)
--    tutorialButton:addEventListener("tap", gotoTutorial)
--    menuTrack = audio.loadStream("music/castle2.mp3")
end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

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
--    audio.stop( 1 )
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
     
	end
end


function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
  audio.dispose( menuTrack )
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
