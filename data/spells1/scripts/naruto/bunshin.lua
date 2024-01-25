function onCastSpell(cid, var)
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_SAGA) then
doPlayerSendCancel(cid, "Você nao pode usar o Summon aqui")
return false
end

   local anyPos, pos = {x= 1950, y=1979, z= 7}, getCreaturePosition(cid)
   local MaximoSummon = 2 --- Maximo de Monstros Sumonados

   if #getCreatureSummons(cid) < MaximoSummon then
            if not isWalkable(anyPos) then
			anyPos = {x= 1952, y=1979, z= 7}
			end
            local bunshin = doCreateMonster("Clone", anyPos)
			if bunshin then
            doConvinceCreature(cid, bunshin)
            setCreatureMaxHealth(bunshin, getCreatureMaxHealth(cid))
            doCreatureAddHealth(bunshin, getCreatureHealth(cid))
            doSetCreatureOutfit(bunshin, getCreatureOutfit(cid), -1)
			setCreatureName(bunshin, getCreatureName(cid), "a " .. getCreatureName(cid))		
            doTeleportThing(bunshin, pos)
			end
			doSendMagicEffect(pos, CONST_ME_POFF)
    else
	doPlayerSendCancel(cid,"Voce possui o maximo de Summons")
        return false
    end
    return true
end
           
