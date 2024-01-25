local time = 3 -- tempo paralyzado

function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 12001) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12001) .. " segundos para usar novamente.")
return false
end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12001, 20) end
local target = getCreatureTarget(cid)
local t_Pos = getCreaturePosition(target)
exhaustion.set(cid, 12001, 20)
Trap(target, time)
doSendMagicEffect({x=t_Pos.x+2, y=t_Pos.y, z=t_Pos.z}, 571)
return true
end