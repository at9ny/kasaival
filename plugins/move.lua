local move = {}

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
  local x, y = 0, 0
  local s = obj.speed

  local d = stage.dimension

  if scancodeDown({'up', 'w'}) then
    y = y - s
  end
  if scancodeDown({'right', 'd'}) then
    x = x + s
  end
  if scancodeDown({'down', 's'}) then
    y = y + s
  end
  if scancodeDown({'left', 'a'}) then
    x = x - s
  end

  obj.x = obj.x + x
  obj.y = obj.y + y
end

return move