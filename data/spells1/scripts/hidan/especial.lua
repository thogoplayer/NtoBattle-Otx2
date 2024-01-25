local config = { 
exausted = 45222,
cooldown = 90,  --- tempo entre um uso e outro
duration = 3, --- duração
effect = 11 -- efeito que sai ao falar a spell
} 


local function effect(cid, eff, count)
if isCreature(cid) then
if count == 0 then
doPlayerSendTextMessage(cid, 27, "Jashin acabou.")
unregisterCreatureEvent(cid, "Jashin")
else
local c_Pos = getCreaturePosition(cid)
doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 11)
local target = getCreatureTarget(cid)
if target then
local t_Pos = getCreaturePosition(target)
doSendMagicEffect({x=t_Pos.x+1, y=t_Pos.y+1, z=t_Pos.z}, 11)
end
addEvent(effect, TIME_SECONDS, cid, eff, count-1)
end
return true
end
end

function onCastSpell(cid, var)
if exhaustion.check(cid, config.exausted) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar a Imortalidade novamente.")
return false
end

local target = getCreatureTarget(cid)
if isLimboProtection(cid, target) then return exhaustion.set(target, config.exausted+1, config.cooldown) end

registerCreatureEvent(cid, "Jashin")
exhaustion.set(cid, config.exausted, config.cooldown)
exhaustion.set(cid, 45223, config.duration)
effect(cid, config.effect, config.duration)
doPlayerSendTextMessage(cid, 27, "Voce esta imortal por ".. config.duration .." segundos.")
return true
end