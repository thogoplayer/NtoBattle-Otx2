function onCastSpell(cid, var)
    local anyPos, pos = {x = 943, y = 992, z = 7}, getCreaturePosition(cid)
    local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }

local MaximoSummon = 1 --- Maximo de Monstros Sumonados
local summons = getCreatureSummons(cid)
    local playerSummons = 1, #getCreatureSummons(cid)
   if(table.maxn(summons) < MaximoSummon) then
        for i = 1, playerSummons do
            local bunshin = doCreateMonster("kuchyose corvo", anyPos)
            doConvinceCreature(cid, bunshin)
            doCreatureAddHealth(bunshin, getCreatureHealth(cid))
			setCreatureName(bunshin, getCreatureName(cid), "a " .. getCreatureName(cid))
			local toPos = isWalkable(toPos[i]) == false and pos or toPos[i]
            doTeleportThing(bunshin, toPos)
			doSendMagicEffect({x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}, 397)
        end
    else
        return false
    end
    return true
end
           
