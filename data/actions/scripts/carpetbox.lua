function onUse(cid, item, frompos, item2, topos)

local presentes = {12611,12613,12615,12617,12619,12621,12623,12625,12627,12629,12631,12633,12635,12637,12639,12712}
local randomChance = math.random(1, #presentes)

doTransformItem(item.uid, presentes[randomChance], 1)
doPlayerSendTextMessage(cid, 27, "Voce abriu uma Carpet Box e recebeu 1 Carpet")
return true
end






