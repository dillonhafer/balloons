-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require("physics")

local tapCount = 5



local background = display.newImageRect("background.png", 360, 570)
local platform = display.newImageRect("platform.png", 300, 50)
local balloon = display.newImageRect("balloon.png", 112, 112)
local tapText = display.newText(tapCount, 30, 10, native.systemFont, 40)
local function updateTaps(balloon)
  tapCount = tapCount - 1
  tapText.text = tapCount

  if tapCount == 0 then
    display.newText("GAME OVER", display.contentCenterX, display.contentCenterY, native.systemFont, 40)
    physics.stop()
  end
end

local function pushBalloon(event)
  local balloon = event.target
  if tapCount > 0 then
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    updateTaps(balloon)
  end
end

background.x = display.contentCenterX
background.y = display.contentCenterY

platform.x = display.contentCenterX
platform.y = display.contentHeight-25
platform.alpha = 0.8

balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

physics.start()
physics.addBody(platform, "static")
physics.addBody(balloon, "dynamic", { radius=50, bounce=0.3 })

balloon:addEventListener("tap", pushBalloon)
