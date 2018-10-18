local grass = {}

grass.resizable = true

function grass.draw(obj, stage)
  love.graphics.setColor(255,0,255,255)
  if obj.rx and obj.ry and obj.rwidth and obj.rheight ~= nil then
    love.graphics.rectangle('fill', obj.rx, obj.ry, obj.rwidth, obj.rheight)
  elseif obj.x and obj.y and obj.width and obj.height ~= nil then
    love.graphics.rectangle('fill', obj.x, obj.y, obj.width, obj.height)
  else
    print(obj.x, obj.y, obj.width, obj.height)
  end
  
end

return grass