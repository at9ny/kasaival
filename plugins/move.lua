local move = {}

local defaultControls = {
  [1] = {
    scancodes = {'up', 'w'}, 
    dy = -1,
  },
  [2] = { 
    scancodes = {'right', 'd'},
    dx = 1,
  },
  [3] = { 
    scancodes = {'down', 's'},
    dy = 1,
  },
  [4] = { 
    scancodes = {'left', 'a'},
    dx = -1,
  }
}


function nilToZero(val)
  if val ~= nil then
    return val
  else return 0 end
end

function scancodeDown(options)
  for i, option in ipairs(options) do
    if love.keyboard.isScancodeDown(option) then 
      return true
    end
  end
end


function move.update(obj, stage)
  local d = stage.dimension
  local t = obj.transform
  local dx, dy = 0, 0
  local sf = 1
  local objKeyMove = defaultControls

  for s = 1,#objKeyMove do
    if scancodeDown(objKeyMove[s].scancodes) then 
      dy = dy + nilToZero(objKeyMove[s].dy) * obj.speed
      dx = dx + nilToZero(objKeyMove[s].dx) * obj.speed
    end
  end

  obj.x = dx + obj.x
  obj.y = dy + obj.y

  obj.sx = sf
  obj.sy = sf
end

return move