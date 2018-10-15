local move = {}

function defaultControls(speed)
  return {
    [1] = {
      scancodes = {'up', 'w'}, 
      dy = -speed,
    },
    [2] = { 
      scancodes = {'right', 'd'},
      dx = speed,
    },
    [3] = { 
      scancodes = {'down', 's'},
      dy = speed,
    },
    [4] = { 
      scancodes = {'left', 'a'},
      dx = -speed,
    }
  }
end

function nilToZero(val)
  if val ~= nil then
    return val
  else return 0 end
end

function scancodeDown(options)
  for i, option in ipairs(options) do
    if love.keyboard.isScancodeDown(option) then 
      return true
    else
      return false 
    end
  end
end


function move.update(obj, stage)
  local d = stage.dimension
  local t = obj.transform
  local dx, dy = 0, 0
  local sf = 1
  local objKeyMove = defaultControls(obj.speed)

  for s = 1,#objKeyMove do
    if scancodeDown(objKeyMove[s].scancodes) then 
      dy = dy + nilToZero(objKeyMove[s].dy)
      dx = dx + nilToZero(objKeyMove[s].dx)
    end
  end

  t:scale(1, 1)
  t:translate(dx, dy)
end

return move