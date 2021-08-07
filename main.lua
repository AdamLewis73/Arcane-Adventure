local composer = require ("composer")
composer.isDebug = true

level=1; -- game level variable
armor=0; -- player armor
staff = 0; -- player damageamp
skill=0; -- player spell cast speed
wizBan = 0;
gameovercheck = false
--a = 0
bank=0;
bankscore = 0
-- Weapon, Armor and Skill level tracking variables --
Alevel = 0;
Wlevel=0;
Slevel=0;
paralswitcher = 1
upl1 = 0
upl2 = 0
upl3 = 0
upl4 = 0
upl5 = 0
display.setStatusBar( display.HiddenStatusBar )
math.randomseed( os.time() )
audio.reserveChannels( 1 )
audio.setVolume(0.5, {channel = 1})
composer.gotoScene( "menu" )
