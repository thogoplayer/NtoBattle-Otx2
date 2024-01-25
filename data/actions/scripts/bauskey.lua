local keys = {

[16126] = {bau_id = 3434, storageid = 9000, elopoints = 5, premio = {10494}, gradu = GENIN, gold = 0}, 
[3344] = {bau_id = 3433, storageid = 9000, elopoints = 5, premio = {10494}, gradu = GENIN, gold = 0},
}


function onUse(cid, item, frompos, item2, topos)
local i = keys[item.itemid]
if i == false then doPlayerSendCancel(cid, 'No momento esta key não abre nenhum baú') return true end
if i.bau_id ~= item2.itemid then doPlayerSendCancel(cid, 'Esta key não abre este baú de acordo com sua cor') return true end 
if getPlayerGraduation(cid) < i.gradu then doPlayerSendCancel(cid, "É necessario estar na graduação "..TIER_TYPES[i.gradu].." ou superior.") return true end
if getPlayerStorageValue(cid, i.storageid) < 1 then
doAddContainerItemRandom(cid, i.gold, i.premio)
local premioinfo = getPlayerStorageValue(cid, 942134)
doPlayerAddEloPoints(cid, i.elopoints)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você abriu o "..getItemNameById(item2.itemid).." e recebeu "..(i.elopoints > 0 and ""..i.elopoints.." elo points, ..")..""..premioinfo..". Foram Enviados Para o Deposito De Premios.")
doSendMagicEffect(getCreaturePosition(cid), 745,cid)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
-- setPlayerStorageValue(cid, i.storageid, 1)
-- doRemoveItem(item.uid)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empety!.")
end
return true
end


