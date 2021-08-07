local cx,cy = display.contentCenterX,display.contentCenterY
local ch,cw = display.contentHeight, display.contentWidth
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local json = require( "json" )
 
local scoresTable = {}
--local highSound = audio.loadSound("music/highScore.mp3")
local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )
local highTrack
local prs = 0
local function scrollBack(self,event)
	if self.x < -955 then
		self.x = cx+cw
	else
		self.x = self.x - self.speed
	end
end

local function loadScores()
 
    local file = io.open( filePath, "r" )
 
    if file then
        local contents = file:read( "*a" )
        io.close( file )
        scoresTable = json.decode( contents )
    end
 
    if ( scoresTable == nil or #scoresTable == 0 ) then
        scoresTable = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    end
end

local function saveScores()
 
    for i = #scoresTable, 11, -1 do
        table.remove( scoresTable, i )
    end
 
    local file = io.open( filePath, "w" )
 
    if file then
        file:write( json.encode( scoresTable ) )
        io.close( file )
    end
end
local function gotoMenu()
  composer.removeScene("menu")
  composer.gotoScene( "menu", { time = 800, effect = "crossFade" } )
  end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    -- Load the previous scores
    loadScores()
 
    -- Insert the saved score from the last game into the table, then reset it
    table.insert( scoresTable, composer.getVariable( "finalScore" ) )
    composer.setVariable( "finalScore", 0 )
 
    -- Sort the table entries from highest to lowest
    local function compare( a, b )
        return a > b
    end
    table.sort( scoresTable, compare )
 
    -- Save the scores
    saveScores()
 
  background1 = display.newImage(sceneGroup, "menuBack.png",cx,cy)
  background1.width = 1920
  background1.height = 1080
  background1.speed = 3
  background1.enterFrame = scrollBack
  Runtime:addEventListener("enterFrame",background1)
  background2 = display.newImage(sceneGroup, "menuBack.png",cx+cw,cy)
  background2.width = 1920
  background2.height = 1080
  background2.speed = 3
  background2.enterFrame = scrollBack
  Runtime:addEventListener("enterFrame",background2)
 
    local highScoresHeaderShadow = display.newText( sceneGroup, "High Scores", display.contentCenterX+5, 100+5, "HARRYP_.TTF", 120 )
    highScoresHeaderShadow:setFillColor(0)
    local highScoresHeader = display.newText( sceneGroup, "High Scores", display.contentCenterX, 100, "HARRYP_.TTF", 120 )
    highScoresHeader:setFillColor(1)
    for i = 1, 5 do
        if ( scoresTable[i] ) then
            local yPos = 150 + ( i * 100 )
 
            local rankNum = display.newText( sceneGroup, i .. ")", display.contentCenterX-50, yPos, native.systemFont, 36 )
--            rankNum:setFillColor( 0.8 )
            rankNum:setFillColor( 0)
            rankNum.anchorX = 1
 
            local thisScore = display.newText( sceneGroup, scoresTable[i], display.contentCenterX-30, yPos, native.systemFont, 36 )
            thisScore.anchorX = 0
            thisScore:setFillColor(0.3)
        end
    end
    if gameovercheck == true then
      gTxt=display.newText("Wiz has Died :(!\n All Hope Is Lost!",cx,cy+275, system.nativeFont, 100)
      gTxt:setFillColor(1)
      prs = 1
    end
    local menuButton = display.newText( sceneGroup, "Menu", display.contentCenterX, 0.9*ch, native.systemFont, 75 )
    menuButton:setFillColor( 0.2 )
    menuButton:addEventListener( "tap", gotoMenu )
    
    highSound = audio.loadStream( "music/highScore.mp3")
end

-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
    audio.play( highSound, {channel=1, loops = -1})
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
    if prs == 1 then
      gTxt:removeSelf()
      gameovercheck = false
    end
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    audio.stop( 1 )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
    audio.dispose( highSound )
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
