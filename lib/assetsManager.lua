local assetsManager = {}

function loadImages(obj, assetsPath)
 if obj.imageName ~= nil then
  if obj.frames ~= nil then
      for f=1, obj.frames  do
        obj.images[f] = love.graphics.newImage(assetsPath .. obj.imageName .. '/' .. f .. '.png')
      end
    else  
      obj.image = love.graphics.newImage(assetsPath .. obj.ImageName .. '.png')
    end
  end
end

function assetsManager.load(state)
  local objs = state.stage.objs
  for i = 1, #objs do
    local obj = objs[i]
    loadImages(obj, state.assetsPath)
  end
end

local frame = 0
function assetsManager.update()
  frame = frame + 1
end

function drawImages(obj)
  if obj.imageName ~= nil then
    if obj.frames ~= nil then
      local f = math.floor(frame * obj.frameSpeed) % obj.frames + 1
      love.graphics.draw(obj.images[f], obj.transform)
    else  
      love.graphics.draw(obj.image, obj.transform)
    end
  end
end

function assetsManager.draw(objs)
  love.graphics.setColor(255,255,255)
  for i = 1, #objs do
    local obj = objs[i]
    drawImages(obj)

  end
end

return assetsManager
