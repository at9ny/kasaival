local gameManager = {}

local assetsManager = require('lib/assetsManager')
local pluginsManager = require('lib/pluginsManager')

function gameManager:load(state) 
  pluginsManager.load(state.stage)
  assetsManager.load(state)
end

function gameManager:update(dt, state)
  pluginsManager.update(state.stage, state)
  assetsManager.update()
end

function gameManager:draw(state)
  pluginsManager.draw(state.stage)
  assetsManager.draw(state.stage.objs)
end

return gameManager