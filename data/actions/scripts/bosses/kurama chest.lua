function onUse(cid, item, frompos, item2, topos)

local bag = doPlayerAddItem(cid, 17456, 1)
local temple = {x = 2408, y = 3148, z = 7}
doPlayerSendTextMessage(cid,22,"Voce ganhou o premio do Kurama Boss!")
doAddContainerItem(bag, 18320, 1) -- gold token
doAddContainerItem(bag, 10364, 200) -- great health
doAddContainerItem(bag, 10365, 200) -- great mana
doAddContainerItem(bag, 15782, 1) -- great mana
doTeleportThing(cid, temple)
return true
end