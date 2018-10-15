local gameManager = {}

local assetsManager = require('lib/assetsManager')
local pluginsManager = require('lib/pluginsManager')

function gameManager:init(state) 
  assetsManager.load(state)
  pluginsManager.load(state.stage)
end

function gameManager:update(dt, state)
  assetsManager.update()
  pluginsManager.update(state.stage)
end

function gameManager:draw(state)
  assetsManager.draw(state.stage.objs)
end

return gameManager