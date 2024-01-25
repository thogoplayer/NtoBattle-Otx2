function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 16700) >= 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end
local waittime = 3.0
local storage = 325213

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local jogadorpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local monsterpos = getCreaturePosition(target)
if target == isMonster or isCreature then
doTeleportThing(cid,monsterpos)
doSendMagicEffect(jogadorpos, 125)
else
doPlayerSendTextMessage(cid,20,'Precisa Selecionar um Alvo')
end
end