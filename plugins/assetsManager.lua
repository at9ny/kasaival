local assetsManager = {}

assetsManager['assets'] = {}

function assetsManager:load(arg, state)
  self.assets = state.stage.assets
  for i = 1, #self.assets do
    local obj = self.assets[i]
    if obj.frames > 1 then
      for f=1, obj.frames  do
       obj.images[f] = love.graphics.newImage(state.assetsPath .. obj.imageName .. '/' .. f .. '.png')
     end
    else  
      obj.image = love.graphics.newImage(state.assetsPath .. obj.ImageName .. '.png')
    end
  end
end

local frame = 0
function assetsManager:update(dt)
  frame = frame + 1
end

function assetsManager:draw()
  for i = 1, #self.assets do
    local obj = self.assets[i]

    -- info[1] = name of asset, info[2] = how many frames    
    if obj.frames > 1 then
      local f = math.floor(frame * obj.frameSpeed) % obj.frames + 1
      love.graphics.draw(obj.images[f], obj.x, obj.y)
    else  
      love.graphics.draw(obj.image, obj.x, obj.y)
    end
  end
end

return assetsManager
