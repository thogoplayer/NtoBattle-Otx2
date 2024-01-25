local config = {
[1] = 334, -- Naruto
[13] = 439, -- sasuke
[130] = 248, -- hinata
[170] = 275, -- itachi
[190] = 300, --killer bee
[200] = 285, -- kakashi
[447] = 205, -- haku
[467] = 407, -- sai
[530] = 383, -- Orochimaru
[631] = 189, -- deidara
[633] = 420, -- sasori
[700] = 469, -- tobirama
[767] = 200, -- guren
[800] = 447, -- shisui
[70] = 348, -- neji
[209] = 312, -- madara
[300] = 323, -- minato 
[439] = 220, -- hashirama
[400] = 355, -- obito
[25] = 398, -- lee
[139] = 262, -- ino
[192] = 666, -- tsunade
[50] = 564, -- gaara
}


function onLogin(cid)
if (not config[getPlayerVocation(cid)]) then
return true
end

if getPlayerStorageValue(cid, 19982) < 1 then
doCreatureChangeOutfit(cid, {lookType = config[getPlayerVocation(cid)]})
setPlayerStorageValue(cid, 19982, 1)
return true
end
return true
end