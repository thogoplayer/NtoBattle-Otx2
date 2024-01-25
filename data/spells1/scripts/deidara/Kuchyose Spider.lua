function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then doPlayerSendCancel(cid, "Você nao pode usar o Summon aqui") return false end
if not summonKibakuNendo(cid, "Spider") then return false end
return true
end