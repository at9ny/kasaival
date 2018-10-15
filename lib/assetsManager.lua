local assetsManager = {}


function assetsManager.load(state)
  local objs = state.stage.objs
  for i = 1, #objs do
    local obj = objs[i]
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
function assetsManager.update()
  frame = frame + 1
end

function assetsManager.draw(objs)
  for i = 1, #objs do
    local obj = objs[i]

    if obj.frames > 1 then
      local f = math.floor(frame * obj.frameSpeed) % obj.frames + 1
      love.graphics.draw(obj.images[f], obj.transform)
    else  
      love.graphics.draw(obj.image, obj.transform)
    end
  end
end

return assetsManager
