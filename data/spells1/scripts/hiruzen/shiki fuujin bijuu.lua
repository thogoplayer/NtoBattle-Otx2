function onCastSpell(cid, var)
if exhaustion.check(cid, 45433) then
doPlayerSendTextMessage(cid, 23, "Aguarde " .. exhaustion.get(cid, 45433) .. " segundos para usar novamente.")
return false
end
if not isPlayer(target) then doPlayerSendCancel(cid, "Voce so pode usar est em players!") return false end
local target = getCreatureTarget(cid)

if getCreatureCondition(target, CONDITION_ATTRIBUTES, jin_cond_id) then doPlayerSendCancel(cid, "O player não esta no modo bijuu")  return false end

exhaustion.set(cid, 45433, 300)
doSendMagicEffect(getCreaturePosition(target), 732)
doPlayerSendTextMessage(target,19,"Sua bijuu foi selada pelo player "..getCreatureName(cid).."!")
doRemoveCondition(target, CONDITION_ATTRIBUTES, jin_cond_id)
doRemoveCondition(target, CONDITION_OUTFIT, jin_cond_id)

return true
end
