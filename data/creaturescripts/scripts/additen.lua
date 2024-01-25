local monsters = {
["Pain"] = {itemid = 2160, count = 100, itemid2 = 2160, count2 = 100, itemid3 = 2160, count3 = 100},
}

function onKill(cid, target)
local tab = monsters[getCreatureName(target)]
if tab then
doPlayerSendTextMessage(cid,22,"Evento Comcluido!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2665, 1)
doAddContainerItem(bag, 2417, 1)
doAddContainerItem(bag, 2427, 1)
doPlayerAddItem(cid, tab.itemid, tab.count)
end
return true
end
