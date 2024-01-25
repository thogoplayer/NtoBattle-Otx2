local config = {
efeitoTele = 10, -- efeito q ira aparacer a cada teleport.
efeitoDamage = 1, -- efeito q ira aparecer ao hitar no alvo
hits = 5, -- quantos hits vai dar
delay = 200, -- intervalo de tempo a cada hit
min = 10000, -- dano minimo
max = 15000, -- dano maximo
damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}

spell = {
start = function (cid, target, markpos, hits)
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
    addEvent(spell.start, config.delay, cid, target, markpos, hits - 1)
   end
}
function onCastSpell(cid)
target = getCreatureTarget(cid)
if target then
  spell.start(cid, target, getThingPos(cid), config.hits)
end
return true
end