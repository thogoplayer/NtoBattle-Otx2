local config = {
cooldown = 1800, -- 5 * 60
storage = 636255,
area = {{x = 1349, y = 2777, z = 11},{x = 1352, y = 2781, z = 11}},
toPosition = {x = 1351, y = 2781, z = 12},
level = 450,
eff = 394
}


function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
if getPlayerLevel(cid) < config.level then return doPlayerSendCancel(cid,"Somente nivel "..config.level.." ") end
local seetime = getGlobalStorageValue(config.storage)-os.time()
if getGlobalStorageValue(config.storage) > os.time() then return doPlayerSendCancel(cid,"Wait "..math.floor(seetime/60).." minutes and "..math.floor(seetime%60).." seconds to enter the quest!") end
setGlobalStorageValue(config.storage, config.cooldown+ os.time())
teleportAllPlayersInArea(config.area, config.toPosition, config.level, config.eff)
return true
end