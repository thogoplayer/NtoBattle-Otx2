function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local time = 3 -- tempo paralyzado

if exhaustion.check(cid, 12000)  then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12000) .. " segundos para usar novamente.")
return false
end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12000, 20) end

exhaustion.set(cid, 12000, 20)
effect(target, {3,3}, 658)
addEvent(effect, 300, target, {1,1}, 659)
addEvent(effect, 500, target, {1,1}, 659)
addEvent(effect, 700, target, {1,1}, 659)
addEvent(effect, 900, target, {1,1}, 659)
addEvent(effect, 1100, target, {1,1}, 659)
addEvent(effect, 1300, target, {1,1}, 659)
Trap(target, time)
return true
end