function onUse(cid, item, frompos, item2, topos)

local bag = doPlayerAddItem(cid, 17452, 1)
local temple = {x = 2408, y = 3148, z = 7}
doPlayerSendTextMessage(cid,22,"Voce ganhou o premio do Hidan Boss!")
doAddContainerItem(bag, 18320, 1) -- gold token
doAddContainerItem(bag, 11105, 1) -- akat shield
doAddContainerItem(bag, 15749, 1) -- rare renegade pants
doAddContainerItem(bag, 15773, 1) -- konan tunic akatsuki
doTeleportThing(cid, temple)
return true
end