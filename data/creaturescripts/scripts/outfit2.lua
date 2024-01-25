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
[400] = 1020, -- hashirama
[401] = 1020, -- hashirama
[402] = 1020, -- hashirama
}


function onLogin(cid)
if (not config[getPlayerVocation(cid)]) then
return true
end

if getPlayerAccess(cid) >= 3 then
return true
end

if getPlayerStorageValue(cid, 19882) < 1 then
doCreatureChangeOutfit(cid, {lookType = config[getPlayerVocation(cid)]})
setPlayerStorageValue(cid, 19882, 1)
return true
end
return true
end