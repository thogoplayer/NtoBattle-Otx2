local config = { 
exausted = 41222,
cooldown = 120,  --- tempo entre um uso e outro
duration = 5, --- duração
eff_delay = 30
} 

local function loopEffect(cid, n)
if isPlayer(cid) then
local pos = getCreaturePosition(cid)
if n > 0 then
doSendMagicEffect({x=pos.x+2, y=pos.y+1, z=pos.z}, 714)
addEvent(loopEffect, config.eff_delay, cid, n-1)
else
doSendMagicEffect({x=pos.x+2, y=pos.y+1, z=pos.z}, 715)
end
end
return true
end

local function removeSpell(cid)
if isPlayer(cid) then
doCreatureSetNoMove(cid, false)
doPlayerSendTextMessage(cid, 27, "Seus cristais foram quebrados.")
end
return true
end


function onCastSpell(cid, var)
if exhaustion.check(cid, config.exausted) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar o Suishou Douka novamente.")
return false
end

exhaustion.set(cid, config.exausted, config.cooldown)
doCreatureSetNoMove(cid, true)
setCreatureBattleLockTime(cid, config.duration)
loopEffect(cid, 65)
addEvent(removeSpell , config.duration*TIME_SECONDS, cid)
doPlayerSendTextMessage(cid, 27, "Suishou Douka ativado por ".. config.duration .." segundos.")
return true
end