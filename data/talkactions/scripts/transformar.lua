local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
[1] = { 25, 2, 267, 10},
[2] = { 50, 3, 268, 14},
[3] = { 75, 4, 269, 524},
[4] = { 100, 5, 270, 250},
[5] = { 125, 6, 271, 469},
[6] = { 150, 7, 272, 469},
[7] = { 175, 8, 273, 469},
[8] = { 200, 9, 277, 469},
[9] = { 250, 10, 274, 469},
[10] = { 275, 11, 275, 469},
[11] = { 300, 12, 276, 469},
[12] = { 350, 13, 273, 469},
[13] = { 375, 14, 278, 469},
[14] = { 400, 15, 279, 469},
[15] = { 475, 16, 280, 469},
[16] = { 525, 17, 281, 469},
[17] = { 550, 17, 282, 469},
}
function onSay(cid, words, param, channel)
local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- começo e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- começo e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- começo e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- começo e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- começo e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Você não pode se Transformar nesta área!") return true
end
doPlayerSay(cid, "transformar")
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Transformou e teve um aumento de poder!")
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você precisa estar no level " .. voc[1] .. " para transformar e aumentar seu poder.")
end
else
doPlayerSendCancel(cid, "Você não pode se Transformar!")
end
return true
end