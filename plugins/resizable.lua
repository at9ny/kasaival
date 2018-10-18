local resizable = {}

local pw = -1
local ph = -1
function resizable.update(stage, state)
  local w, h = love.window.getMode()
  local flag = false


  local aspectRatio = w / h
  for i, obj in ipairs(stage.objs) do
    obj.rwidth = (obj.width / state.width) * w
    obj.rheight = (obj.height / state.height) * h

    obj.rx = (obj.x / state.width) * w
    obj.ry = (obj.y / state.height) * h
      
  end
  pw, ph = w, h
 end

return resizable