local function effectPrision(cid)
if isCreature(cid) then
local pos = getCreaturePosition(cid)
doSendMagicEffect({x=pos.x+2, y=pos.y+3, z=pos.z}, 1199)
end
return true
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local time = 3 -- tempo paralyzado

if exhaustion.check(cid, 12000) == true then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, 12000) .. " segundos para usar novamente.")
return false
end
if isLimboProtection(cid, target) then return exhaustion.set(cid, 12000, 20) end

exhaustion.set(cid, 12000, 20)
effectPrision(target)
addEvent(effectPrision, 300, target)
addEvent(effectPrision, 700, target)
addEvent(effectPrision, 1100, target)
Trap(target, time)
return true
end