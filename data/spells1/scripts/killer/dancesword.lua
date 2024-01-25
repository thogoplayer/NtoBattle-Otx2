local config = {
efeitoTele = 134, -- efeito q ira aparacer a cada teleport.
efeitoDamage = 16, -- efeito q ira aparecer ao hitar no alvo
hits = 4, -- quantos hits vai dar
delay = 400, -- intervalo de tempo a cada hit
min = 4000, -- dano minimo
max = 6000, -- dano maximo
damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}

spell54 = {
start54 = function (cid, target, markpos, hits)
    if not isCreature(cid) then return true end
    if not isCreature(target) or hits < 1 then
                 doTeleportThing(cid, markpos)
                 doSendMagicEffect(getThingPos(cid), config.efeitoTele)
                 return true
    end
    posAv = validPos(getThingPos(target))
    rand = #posAv == 1 and 1 or #posAv - 1
    doSendMagicEffect(getThingPos(cid), config.efeitoTele)
    doTeleportThing(cid, posAv[math.random(1, rand)])
    addEvent(spell54.start54, config.delay, cid, target, markpos, hits - 1)
	if getPlayerStorageValue(cid, 3004) < 10 then
	doAreaCombatHealth(cid, config.damage, getThingPos(target), 0, -config.min, -config.max, config.efeitoDamage)
    else
    doAreaCombatHealth(cid, config.damage, getThingPos(target), 0, -config.min-(config.min/100*10), -config.max(config.max/100*10), config.efeitoDamage)
end
   end
}
function onCastSpell(cid)
local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
target = getCreatureTarget(cid)
if target then
  spell54.start54(cid, target, getThingPos(cid), config.hits)
  doSendMagicEffect(position1, 95)
end
return true
end