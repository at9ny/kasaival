local gameManager = require('lib/gameManager')

local state = {}
state.assetsPath = 'assets/'
state.currentStage = 'Game'
state.stage = {}
state.width = 800
state.height = 600


function love.load(arg)
  state.stage = require('stages/' .. state.currentStage)
  gameManager:load(state)
  state.stage:load()



end

function love.update(dt)
  gameManager:update(dt, state)
  state.stage:update(dt)

  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
end

function love.draw()
  gameManager:draw(state)
  state.stage:draw()
end