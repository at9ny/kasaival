local pluginsManager = {}

function loadPlugins(obj)
  if obj.plugin == nil then
    obj.plugin = {}
  end
  for p = 1, #obj.plugins do
    obj.plugin[p] = require('plugins/' .. obj.plugins[p]) 
  end
end

function pluginsManager.load(stage)
  local objs = stage.objs
  for a = 1, #objs do
    local obj = objs[a]

    if obj.plugins ~= nil then   
      loadPlugins(obj)
    end
  end
end

function updatePlugins(obj, stage)
    for p = 1, #obj.plugins do
      if obj.plugin[p].updateMe then
        obj.plugin[p].update(obj, stage)
      end
    end
end

function pluginsManager.update(stage)
  local objs = stage.objs
  for a = 1, #objs do
    local obj = objs[a]
    
    if obj.plugins ~= nil then
      updatePlugins(obj, stage)
    end
  end
end


function drawPlugins(obj, stage)
    for p = 1, #obj.plugins do
      if obj.plugin[p].drawMe then
       obj.plugin[p].draw(obj, stage)
      end
    end
end

function pluginsManager.draw(stage)
  local objs = stage.objs
  for a = 1, #objs do
    local obj = objs[a]
    if obj.plugins ~= nil then
      drawPlugins(obj, stage)
    end
  end
end

return pluginsManager