local config = {
efeitoTele = 209, -- efeito q ira aparacer a cada teleport.
efeitoDamage = 201, -- efeito q ira aparecer ao hitar no alvo
hits = 5, -- quantos hits vai dar
delay = 300, -- intervalo de tempo a cada hit
min = 2500, -- dano minimo
max = 2800, -- dano maximo
damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}

spell14 = {
start14 = function (cid, target, markpos, hits)
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
    doAreaCombatHealth(cid, config.damage, getThingPos(target), 0, -config.min, -config.max, config.efeitoDamage)
    addEvent(spell14.start14, config.delay, cid, target, markpos, hits - 1)
   end
}
function onCastSpell(cid)
target = getCreatureTarget(cid)
if target then
  spell14.start14(cid, target, getThingPos(cid), config.hits)
end
return true
end