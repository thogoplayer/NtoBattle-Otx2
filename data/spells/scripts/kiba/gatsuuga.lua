local config = {
efeitoTele = 209, -- efeito q ira aparacer a cada teleport.
efeitoDamage = 17, -- efeito q ira aparecer ao hitar no alvo
hits = 1, -- quantos hits vai dar
delay = 400, -- intervalo de tempo a cada hit
min = 32000, -- dano minimo
max = 33400, -- dano maximo
damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}

spell37 = {
start37 = function (cid, target, markpos, hits)
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
    addEvent(spell37.start37, config.delay, cid, target, markpos, hits - 1)
   end
}
function onCastSpell(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
target = getCreatureTarget(cid)
if target then
  spell37.start37(cid, target, getThingPos(cid), config.hits)
  doSendMagicEffect(position1, 37)
end
return true
end