local assetsManager = require('plugins/assetsManager')

local state = {}
state.assetsPath = 'assets/'
state.currentStage = "Game"
state.stage = {}

function love.load(arg)
  state.stage = require(state.currentStage)
  assetsManager:load(arg, state)
end

function love.update(dt)
  assetsManager:update(dt)

  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end

function love.draw()
  assetsManager:draw()
end