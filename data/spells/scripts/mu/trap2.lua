function onCastSpell(cid, var)
if checkPossibleTarget(cid, getCreatureTarget(cid)) then
    doPlayerSendCancel(cid, "Aguarde um pouco para atacar esse player.")
    return false
end
local from = {x=1080, y=989, z=7} -- Começo do castle
local to = {x=1080, y=989, z=7} -- Final do castle
local from2 = {x=1240, y=1035, z=6} -- Começo do castle
local to2 = {x=1244, y=1039, z=6} -- Final do castle
local from3 = {x=1340, y=1007, z=7} -- Começo do castle
local to3 = {x=1342, y=1009, z=7} -- Final do castle
local from4 = {x=1083, y=989, z=7} -- Começo do castle
local to4 = {x=1083, y=989, z=7} -- Final do castle

if isInRange(getCreaturePosition(cid), from, to) then
   doPlayerSendTextMessage(cid, 27, "voce não pode usar essa spell nessa area")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end 
if isInRange(getCreaturePosition(cid), from2, to2) then
   doPlayerSendTextMessage(cid, 27, "voce não pode usar essa spell nessa area")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end 
if isInRange(getCreaturePosition(cid), from3, to3) then
   doPlayerSendTextMessage(cid, 27, "voce não pode usar essa spell nessa area")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end
if isInRange(getCreaturePosition(cid), from4, to4) then
   doPlayerSendTextMessage(cid, 27, "voce não pode usar essa spell nessa area")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end
local parameters = { cid = cid, var = var}
local waittime = 35 -- Tempo de exhaustion
local storage = 689

if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end 
if getPlayerStorageValue(cid, 1000700) - os.time() > 0 then 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce nao pode usar essa spell em um guy de portao ativo.")
return false
end 
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
if not isPlayer(target) then
doPlayerSendCancel(cid, "Você só pode usar esse jutsu em Players.")
return false
end
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local target = getCreatureTarget(cid)
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 3 * 1000, target, false)
addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 1000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 1500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 2000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 2500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(doSendMagicEffect, 3000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 786)
addEvent(onCastSpell1, 3000, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 