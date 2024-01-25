function onTarget(cid, target)
local stor = 3241 -- Storage
local value = 1 -- Valor da storage
if getPlayerStorageValue(target, stor) ~= value then return false end
return true
end