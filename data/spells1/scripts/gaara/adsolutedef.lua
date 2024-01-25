local config = { 
exausted = 41222,
cooldown = 90,  --- tempo entre um uso e outro
duration = 8, --- duração
eff_delay = 200
} 

local function loopEffect(cid, n)
if isCreature(cid) and n > 0 then
local pos = getCreaturePosition(cid)
doSendMagicEffect({x=pos.x+2, y=pos.y+1, z=pos.z}, 142)
addEvent(loopEffect, config.eff_delay, cid, n-1)
end
return true
end

local function removeSpell(cid)
if isCreature(cid) then
doCreatureSetNoMove(cid, false)
doPlayerSendTextMessage(cid, 27, "Sua defesa foi quebrada.")
end
return true
end


function onCastSpell(cid, var)
if exhaustion.check(cid, config.exausted) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar o jutsu novamente.")
return false
end

exhaustion.set(cid, config.exausted, config.cooldown)
doCreatureSetNoMove(cid, true)
setCreatureBattleLockTime(cid, config.duration)
loopEffect(cid, 40)
addEvent(removeSpell , config.duration*TIME_SECONDS, cid)
doPlayerSendTextMessage(cid, 27, "Saikyou Zettai Bogyo Shukaku no Tate ativado por ".. config.duration .." segundos.")
return true
end