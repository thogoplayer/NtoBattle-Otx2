function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 192132) == 10 then
doPlayerSendTextMessage(cid,22,"Voce ja completou o treino com os SAPOS!")
return false
end

local function Verificar()
if getPlayerStorageValue(cid, 192132) == 10 then
setPlayerStorageValue(cid,40000, 58)
doPlayerPopupFYI(cid, "["..getPlayerStorageValue(cid, 40000).."/62] Converse com o Fukasaku")
end
return true
end

local chance = 50
local mana = getCreatureMana(cid)
if mana == getCreatureMaxMana(cid) then
if chance <= (math.random(1, 100)) then
doCreatureAddMana(cid, -mana)
setPlayerStorageValue(cid, 192132, getPlayerStorageValue(cid, 192132)+1)
doPlayerSendTextMessage(cid,22,"Treinos com Sucesso : "..getPlayerStorageValue(cid, 192132).."\nTreinos sem Sucesso : "..getPlayerStorageValue(cid, 192133).."")
doSendMagicEffect(getCreaturePosition(cid), 188) 
addEvent(Verificar, 100)
else
setPlayerStorageValue(cid, 192133, getPlayerStorageValue(cid, 192133)+1)
doPlayerSendTextMessage(cid,22,"Treinos com Sucesso : "..getPlayerStorageValue(cid, 192132).."\nTreinos sem Sucesso : "..getPlayerStorageValue(cid, 192133).."")
doCreatureAddMana(cid, -mana)
doSendMagicEffect(getCreaturePosition(cid), 2)
end
else
doPlayerSendCancel(cid, "Voce precisa estar com o Chakra 100% para treinar")
return true
end
return true
end