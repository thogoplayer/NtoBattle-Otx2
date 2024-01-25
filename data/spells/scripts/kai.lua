function onCastSpell(cid, var)

if #getCreatureSummons(cid) < 1 then
doPlayerSendCancel(cid, "Voce nao tem summons.")
return false
end

for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 54)
doRemoveCreature(uid)
end  
return true
end