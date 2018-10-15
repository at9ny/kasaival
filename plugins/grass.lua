local grass = {}

grass.drawMe = true

function grass.draw(obj, stage)
  love.graphics.setColor(255,0,255,255)
  love.graphics.rectangle('fill', obj.x, obj.y, obj.width, obj.height)
end

return grass