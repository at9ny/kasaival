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


function nilToZero(val)
  if val ~= nil then
    return val
  else return 0 end
end

function nilToOne(val)
  if val ~= nil then
    return val
  else
    return 1
  end
end


function getND(n, d) -- get normal or default
  if n ~= nil then
    return n
  else
    return d
  end
end

function getRND(r, n, d) -- get resizable, normal or default
  if r ~= nil then
    return r
  else
    return getND(n, d)
  end
end


function getRNDR(r1, r2, n, d) -- get resizable, normal or default ratios
  if r1 ~= nil and r2 ~= nil  then
    return r1 / r2
  else
    return getND(n, d)
  end
end


function getTransform(obj)
  local t = { obj.rx, obj.ry, obj.angle, obj.sx, obj.sy, obj.ox, obj.oy, obj.kx, obj.ky }

  t[1] = getRND(obj.rx, obj.x, 0)
  t[2] = getRND(obj.ry, obj.y, 0)
  t[4] = nilToZero(t[4])
  t[4] = getRNDR(obj.rwidth, obj.width, obj.sx, 1)
  t[5] = getRNDR(obj.rheight, obj.height, obj.sy, 1)

  for i = 6,9  do
    t[i] = nilToZero(t[i])
  end
  
  return love.math.newTransform(t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8], t[9])
end

function drawImages(obj)
  if obj.imageName ~= nil then
    if obj.frames ~= nil then  
      local f = math.floor(frame * obj.frameSpeed) % obj.frames + 1
      love.graphics.draw(obj.images[f], getTransform(obj))
    else  
      love.graphics.draw(obj.image, transform)
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
