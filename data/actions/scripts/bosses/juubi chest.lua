function onUse(cid, item, frompos, item2, topos)

local bag = doPlayerAddItem(cid, 17455, 1)
local temple = {x = 2408, y = 3148, z = 7}
doPlayerSendTextMessage(cid,22,"Voce ganhou o premio do Juubi Boss!")
doAddContainerItem(bag, 18320, 1) -- gold token
doAddContainerItem(bag, 16475, 15) -- pill sword
doAddContainerItem(bag, 10712, 15) -- pill ml
doAddContainerItem(bag, 16477, 15) -- pill shield
doAddContainerItem(bag, 16474, 15) -- pill glover
doAddContainerItem(bag, 16473, 15) -- pill fist
doAddContainerItem(bag, 16476, 15) -- pill dist
doAddContainerItem(bag, 15485, 1) -- pill dist
doAddContainerItem(bag, 2160, 15) -- pill dist
doTeleportThing(cid, temple)
return true
end