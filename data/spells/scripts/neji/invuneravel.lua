local config = { 
storage = 424513,
exausted = 45221,
cooldown = 120,  --- tempo entre um uso e outro
duration = 7, --- duração
effect1 = 1080 -- efeito que sai ao falar a spell
} 


local function Alerta(cid)
if isPlayer(cid) and getPlayerStorageValue(cid,config.storage) > 0 then
addEvent(Alerta , 1000, cid)
doSendAnimatedText(getCreaturePosition(cid), "Invuneravel", 25)
local pos = getThingPos(cid)
doSendMagicEffect({x=pos.x+2, y=pos.y, z=pos.z}, 1080)
end
return true
end

local function RemoveDefe(cid)
if isPlayer(cid) then
doCreatureSetNoMove(cid, false)
setPlayerStorageValue(cid, config.storage, 0)
doPlayerSendTextMessage(cid, 27, "Sua Invuneravilidade acabou.")
end
return true
end


function onCastSpell(cid, var)
if exhaustion.check(cid, config.exausted) == true then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar a Invuneravilidade novamente.")
return false
end


registerCreatureEvent(cid, "Invuneravel")
doCreatureSetNoMove(cid, true)
pos = getThingPos(cid)
local position1 = {x=pos.x+2, y=pos.y, z=pos.z}
exhaustion.set(cid, config.exausted, 300)
setPlayerStorageValue(cid, config.storage, 5)
Alerta(cid)
addEvent(RemoveDefe , config.duration*1000, cid)
doPlayerSendTextMessage(cid, 27, "Voce esta invunerável por ".. config.duration .." segundos.")
return true
end