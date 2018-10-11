local Game = {}

Game.dimension = 2.5
Game.objs = {
  [1] = { 
    name = 'player',
    imageName = 'flame',
    images = {},
    frames = 173,
    frameSpeed = 0.3,
    x = 400,
    y = 300, 
    pluginsToInstall = {'move'},
    pluginsInstalled = {},
    speed = 2,
  }
}

function Game:load()
end

function Game:update(dt)
end

function Game:draw()
end

return Game
