local pluginsManager = {}

function pluginsManager.load(stage)
  local objs = stage.objs
  for a = 1, #objs do
    for p = 1, #objs[a].pluginsToInstall do
      objs[a].pluginsInstalled[p] = require('plugins/' .. objs[a].pluginsToInstall[p]) 
    end
  end
end

function pluginsManager.update(stage)
  local objs = stage.objs
  for a = 1, #objs do
    local obj = objs[a]

    for p = 1, #obj.pluginsToInstall do
      obj.pluginsInstalled[p].update(obj, stage)
    end
  end
end

return pluginsManager