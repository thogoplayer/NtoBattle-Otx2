local config = {
cooldown = 1800, -- 5 * 60
storage = 636254,
area = {{x = 1798, y = 2283, z = 9},{x = 1803, y = 2287, z = 9}},
toPosition = {x = 1768, y = 2274, z = 8},
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