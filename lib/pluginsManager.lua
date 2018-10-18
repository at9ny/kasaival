local pluginsManager = {}

function loadPlugins(obj)
  if obj.plugin == nil then
    obj.plugin = {}
  end
  for p = 1, #obj.plugins do
    obj.plugin[p] = require('plugins/' .. obj.plugins[p]) 
  end
end

function pluginsManager.load(stage, state)
  if stage.plugins ~= nil then
    loadPlugins(stage, state)
  end
  local objs = stage.objs
  for a = 1, #objs do
    local obj = objs[a]
    if obj.plugins ~= nil then   
      loadPlugins(obj)
    end
  end
end

function updatePlugins(one, two)
    for p = 1, #one.plugins do
      if type(one.plugin[p].update) == 'function' then
        one.plugin[p].update(one, two)
      end
    end
end

function pluginsManager.update(stage, state)
  if stage.plugins ~= nil then
    updatePlugins(stage, state)
  end
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
      if type(obj.plugin[p].draw) == 'function' then
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