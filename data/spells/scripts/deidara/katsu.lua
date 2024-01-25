function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar o jutsu aqui!!")
return false
end
blowSummons(cid)
return true
end