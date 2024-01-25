function onStepIn(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid, 19881) < 1 then
doPlayerSendTextMessage(cid,22,"You received your initial items!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2138, 1)
doAddContainerItem(bag, 12292, 1)
doAddContainerItem(bag, 2479, 1)
doAddContainerItem(bag, 2485, 1)
doAddContainerItem(bag, 7423, 1)
doAddContainerItem(bag, 10411, 1)
doAddContainerItem(bag, 12295, 1)
doAddContainerItem(bag, 12296, 1)
doAddContainerItem(bag, 10540, 50)
doAddContainerItem(bag, 10541, 50)
doAddContainerItem(bag, 2545, 100)
setPlayerStorageValue(cid, 19881, 1)
end

return true
end