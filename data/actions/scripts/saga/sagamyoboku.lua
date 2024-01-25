local function check(cid)
if isCreature(cid) and getPlayerStorageValue(cid, 192132) > 4 then
doPlayerNextSaga(cid)
end
return true
end


function onUse(cid, item, frompos, item2, topos)
if not getPlayerSaga(cid, 15, 3) then
return doPlayerSendCancel(cid, "[SAGA SYSTEM] You don't belong on this mission.")
elseif getPlayerStorageValue(cid, 192132) > 4 then
return doPlayerSendTextMessage(cid,22,"Voce ja completou o treino com os SAPOS!")
end

local count_sucess = getPlayerStorageValue(cid, 192132) 
local count_fail = getPlayerStorageValue(cid, 192133) 
local mana = getCreatureMana(cid)
if mana == getCreatureMaxMana(cid) then
doCreatureAddMana(cid, -mana)
if 40 <= (math.random(1, 100)) then
setPlayerStorageValue(cid, 192132, count_sucess+1)
doPlayerSendTextMessage(cid,22,"Treinos com Sucesso : "..(count_sucess+1).."\nTreinos sem Sucesso : "..count_fail.."")
doSendMagicEffect(getCreaturePosition(cid), 188) 
addEvent(check, 100, cid)
else
setPlayerStorageValue(cid, 192133, count_fail+1)
doPlayerSendTextMessage(cid,22,"Treinos com Sucesso : "..count_sucess.."\nTreinos sem Sucesso : "..(count_fail+1).."")
doSendMagicEffect(getCreaturePosition(cid), 2)
end
else
doPlayerSendCancel(cid, "Voce precisa estar com o Chakra 100% para treinar")
end

return true
end