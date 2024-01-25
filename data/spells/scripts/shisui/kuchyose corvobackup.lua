function onCastSpell(cid, var) if isSelado(cid) then return false end
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end
local exausted = 42524
local cooldown = 300
if exhaustion.check(cid, exausted) == true then
local seetime = exhaustion.get(cid, exausted)
local hours, minutes, seconds = math.floor(seetime/120), math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendCancel(cid, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente o Genjutsu!")
return false
end

    local anyPos, pos = {x= 2181, y=3577, z= 7}, getCreaturePosition(cid)
    local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }

local function OutfitRem(cid)
if isPlayer(cid) then
doRemoveCondition(cid, CONDITION_OUTFIT)
local position2 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
setPlayerStorageValue(cid, 423414,0)
doSendMagicEffect(position2, 533)
end
return true
end
local MaximoSummon = 4 --- Maximo de Monstros Sumonados
local summons = getCreatureSummons(cid)
    local playerSummons = 4, #getCreatureSummons(cid)
   if(table.maxn(summons) < MaximoSummon) then
        for i = 1, playerSummons do
            doCombatAreaHealth(0, 0, anyPos, 0, 0, 0, 255)
            doCreateItem(460, 1, anyPos)

            local bunshin = doCreateMonster("kuchyose corvo", anyPos)
			setCreatureName(bunshin, getCreatureName(cid), "a " .. getCreatureName(cid))
            doCreatureSetNoMove(bunshin, 0)
			local toPos = isWalkable(toPos[i]) == false and pos or toPos[i]
            addEvent(doTeleportThing, 100, bunshin, toPos)
			addEvent(doRemoveCreature, 5000, bunshin)
			setPlayerStorageValue(cid, 423414,1)
			exhaustion.set(cid, 65322, 5)

local function OutfitAdd(cid)
doSendMagicEffect({x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}, 397)
local outfit = getCreatureOutfit(cid)
            for i, v in pairs(getCreatureOutfit(bunshin)) do
	    	outfit[i] = v
	        end
            doSetCreatureOutfit(cid, outfit, -1)
			addEvent(OutfitRem, 5000, cid)
return true
end			
OutfitAdd(cid)
exhaustion.set(cid, exausted, cooldown)
        end
    else
	doPlayerSendCancel(cid,"Voce possui o maximo de Summons")
        return false
    end
    return true
end
           
