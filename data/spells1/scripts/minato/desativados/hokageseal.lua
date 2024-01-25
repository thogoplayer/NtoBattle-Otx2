function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local a = 0
local storage = 12001
local parameters = { cid = cid, var = var}
local function targettrap()
local enemy = getCreaturePosition(getCreatureTarget(cid))
if(not isCreature(parameters.cid)) then
return true
end
if getCreatureTarget(cid) < 1 then
return true
end
if isCreature(cid) and isCreature(target) then
local pos = {x=enemy.x+1, y=enemy.y-1, z=enemy.z}
if a < 10 then
doSendMagicEffect(pos, 588)
addEvent(doSendMagicEffect, 400, pos, 588)
addEvent(doSendMagicEffect, 700, pos, 588)
a = a+1
addEvent(targettrap, 1000, target)
end
end
return true
end


local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x+1, y=targetpos.y-1, z=targetpos.z}
local time = 10 -- tempo paralyzado

if isPlayer(cid) and exhaustion.check(cid, storage) == true then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end

local function No_Move_Target()
if isCreature(target) then
doCreatureSetNoMove(target, 0)
local percent = 30 -- Em % da Hp do alvo que serĂ¡ removida
local damage = getCreatureHealth(target) / 100 * percent
doCreatureAddHealth(target, - damage)
end
return true
end
if isPlayer(target) then
targettrap(target)
exhaustion.set(cid, storage, 10)
doCreatureSetNoMove(target, 1)
doSendMagicEffect(efepos, 588)
doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_BLUE,"Voce foi selado pelo jutsu secreto ceifador de almas usado pelos Hokages!")
addEvent(No_Move_Target, time*1000)
else
doPlayerSendCancel(cid,"Use Apenas em Player")
return false
end
return true
end