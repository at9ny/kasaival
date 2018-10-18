local resizable = {}

local pw = -1
local ph = -1
function resizable.update(stage, state)
  local w, h = love.window.getMode()
  local flag = false


  local aspectRatio = w / h
  
  if pw ~= w or ph ~= h then flag = true end

  if flag then  
    for i, obj in ipairs(stage.objs) do
      local x = (obj.x / state.width) * w
      local y = (obj.y / state.height) * h

      if obj.width ~= nil then
        obj.rx = x
      end
      if obj.height ~= nil then
        obj.ry = y
      end
    end
  end
  pw, ph = w, h
 end

return resizable