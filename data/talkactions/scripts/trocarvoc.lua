local config = {
[1] = 1199, -- Naruto
[13] = 1161, -- sasuke
[130] = 1526, -- hinata
[170] = 1321, -- itachi
[190] = 372, --killer bee
[200] = 1079, -- kakashi
[447] = 938, -- haku
[467] = 1465, -- sai
[530] = 1472, -- Orochimaru
[631] = 1334, -- deidara
[633] = 1538, -- sasori
[700] = 978, -- tobirama
[767] = 1512, -- guren
[800] = 858, -- shisui
[70] = 1125, -- neji
[209] = 1065, -- madara
[210] = 1065, -- madara
[211] = 1065, -- madara
[300] = 1390, -- minato 
[301] = 1390, -- minato 
[302] = 1390, -- minato 
[439] = 1270, -- hashirama
[440] = 1270, -- hashirama
[441] = 1270, -- hashirama
}

function onSay(cid, words, param, channel)

local t = string.explode(param, ",")
local Name = getPlayerByName(t[1])

if (not t[1]) then
doPlayerSendTextMessage(cid, 27, "Digite o nome do jogador + numero da voc Ex : /trocarvoc Uchiha Kun,13.")
return true
end

if (not Name or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, 27, "O jogador nao existe ou esta offline.")
return true
end

if not tonumber(t[2]) or tonumber(t[2]) == 0 then
doPlayerSendTextMessage(cid, 27, "Digite o nome do jogador + numero da voc Ex : /trocarvoc Uchiha Kun,13!")
return true
end

doPlayerSetVocation(Name, t[2])
doPlayerSendTextMessage(cid, 27, "Voce mudou a vocacao do player " ..t[1].." para "..getPlayerVocationName(Name)..".")
doPlayerSendTextMessage(Name, 19, "Voce mudou sua vocacao "..getPlayerVocationName(Name).." Vocation")
doCreatureChangeOutfit(Name, {lookType = config[getPlayerVocation(Name)]})
return true
end
