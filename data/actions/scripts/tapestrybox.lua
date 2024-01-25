function onUse(cid, item, frompos, item2, topos)

local presentes = {12597,12598,12599,12600,12601,12602,12604,12606}
local randomChance = math.random(1, #presentes)

doTransformItem(item.uid, presentes[randomChance], 1)
doPlayerSendTextMessage(cid, 27, "Voce abriu uma Tapestry Box e recebeu 1 Tapestry")
return true
end






