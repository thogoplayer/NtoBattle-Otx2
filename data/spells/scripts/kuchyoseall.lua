function onCastSpell(cid, var)
    
    local removeTime = 60 
    local summons = getCreatureSummons(cid)
    local MaximoSummon = 4
if (table.maxn(summons) == MaximoSummon) then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Já tem 4 Summons.")
end
    if(table.maxn(summons) < MaximoSummon) then 
    local anyPos, pos = {x = 0, y = 0, z = 0}, getCreaturePosition(cid)
    local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }
    
if getPlayerVocation(cid) == 6 then
local demon summor = doCreateMonster("Summon Master", pos)
doConvinceCreature(cid, demon summor)
setCreatureMaxHealth(demon summor, getCreatureMaxHealth(cid))
doCreatureAddHealth(demon summor, getCreatureMaxHealth(cid))
setCreatureMaxMana(demon summor, getCreatureMaxMana(cid))
doCreatureAddMana(demon summor, getCreatureMaxMana(cid))
doChangeSpeed(demon summor, getCreatureBaseSpeed(cid))
doSetCreatureOutfit(demon summor, getCreatureOutfit(cid), -1)
end

if getPlayerVocation(cid) == 7 then
local best summon = doCreateMonster("best summon", pos)
doConvinceCreature(cid, best summon)
setCreatureMaxHealth(best summon, getCreatureMaxHealth(cid))
doCreatureAddHealth(best summon, getCreatureMaxHealth(cid))
setCreatureMaxMana(best summon, getCreatureMaxMana(cid))
doCreatureAddMana(best summon, getCreatureMaxMana(cid))
doChangeSpeed(best summon, getCreatureBaseSpeed(cid))
doSetCreatureOutfit(best summon, getCreatureOutfit(cid), -1)
end

end
return true
end