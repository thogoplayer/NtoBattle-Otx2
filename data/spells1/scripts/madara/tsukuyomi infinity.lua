local config = {
    effect = 906,          --Efeito.
    time = 5,              --Duração da parede.
    cooldown = 120,  
    storage = 9571,
	hitpercent = 6,
	delay_effect_again = 15
}


function loopEffect(enemy, delay, count, cid)
if isPlayer(enemy) then
    if isPlayer(cid) and count > 0 and getPlayerModes(cid).secure == 1 then  
    doCreatureAddHealth(enemy, - getCreatureMaxHealth(enemy)/100*config.hitpercent)
    doSendMagicEffect(getThingPos(enemy), 809)
    addEvent(loopEffect, delay, enemy, delay, count -1, cid)
    else
	doCreatureSetNoMove(enemy, false)
    end
end
return true
end


function onCastSpell(cid)

if getCreatureIn(cid, AREA_ARENA) or getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) or getTileInfo(getThingPos(cid)).nopvp then
doPlayerSendCancel(cid, "Você nao pode usar o jutsu aqui!!")
return false
end

if getPlayerStorageValue(cid, config.storage) > os.time() then
doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).")
return false
end


local cPos = getCreaturePosition(cid)
local players = getAllPlayersInArea({x= cPos.x-6, y = cPos.y-5, z = cPos.z}, {x= cPos.x+6, y = cPos.y+5, z = cPos.z})
doSendMagicEffect({x=cPos.x-3, y=cPos.y-2, z=cPos.z}, config.effect)
doSendMagicEffect({x=cPos.x+4, y=cPos.y+4, z=cPos.z},953)
setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
setCreatureBattleLockTime(cid, 1)
    for _, uid in pairs(players) do
        if cid ~= uid and isWalkable(getCreaturePosition(uid), true) and getPlayerLevel(uid) >= 200 and getPlayerGroupId(uid) < 3 and not (isInParty(cid) and isPlayer(uid) and isInParty(uid) and getPlayerParty(cid) == getPlayerParty(uid)) then      
            if getPlayerStorageValue(uid, config.storage+1) < os.time() then
			doCreatureSetNoMove(uid, true)
            loopEffect(uid, 500, config.time*2, cid)
		    setPlayerStorageValue(uid, config.storage+1, os.time() + config.delay_effect_again)
            doSendMagicEffect(getCreaturePosition(uid), 809)
		    end
        end
    end
    return true
end

