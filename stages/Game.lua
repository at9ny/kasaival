local Game = {}

Game.dimension = 2.5 
Game.objs = {
  [1] = { 
    name = 'Player',
    imageName = 'flame',
    images = {},
    frames = 173,
    frameSpeed = 0.3,
    transform = love.math.newTransform( 200, 200, 0, 1, 1, 0, 0, 0, 0),
    width = 128,
    height = 256,
    plugins = {'move'},
    speed = 2,
  },
  [2] = {
    name = 'Ground',
    x =  '0',
    y = '0',
    width = '800',
    height = "256",
    plugins = {'grass'},
  }
}

function Game:load()
end

function Game:update(dt)
end

function Game:draw()
end

return Game
