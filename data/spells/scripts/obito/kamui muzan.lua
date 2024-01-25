local config = { 
storage = 3482190,
exausted = 55695, 
cooldown = 60,  --- tempo entre um uso e outro em segundos
duration = 4, --- duração em segundos
effect1 = 196, -- efeito que sai ao falar a spell
outfit = {lookType = 2303, lookAddons = 0}, -- efeito que sai ao falar a spell
    storagee = { -- só modifique se necessário
        [1] = 76988, 
        [2] = 76989
    }
} 

local function Alert(cid)
if isPlayer(cid) and (exhaustion.check(cid, config.storage) == TRUE) then
addEvent(Alert , 1000, cid)
local pos = getThingPos(cid)
end
return true
end

function onCastSpell(cid, var)
    if exhaustion.check(cid, config.exausted) == TRUE then
        doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, config.exausted) .. " segundos para usar o invisible novamente.")
        return false
    end

    exhaustion.set(cid, config.exausted, config.duration)
    local playerOutfit = getCreatureOutfit(cid)
    doSetCreatureOutfit(cid, config.outfit)
	setPlayerGroupId(cid, 2)
    doCreatureExecuteTalkAction(cid, "/theghostaberto", true)
    doSendMagicEffect(getCreaturePosition(cid), config.effect1)
    doCreatureSay(cid,"Kamui In!!!", 19)
    setPlayerStorageValue(cid, config.storagee[2], 1)
    setPlayerStorageValue(cid, config.storage, config.duration + os.time())

    addEvent(function()
        if isPlayer(cid) then
            setPlayerStorageValue(cid, config.storagee[2], -1)
            doCreatureExecuteTalkAction(cid, "/theghostaberto", true)
            doCreatureSay(cid,"Retornou!!!", 19)
			setPlayerGroupId(cid, 1)
            doSendMagicEffect(getCreaturePosition(cid), config.effect1)
            doSetCreatureOutfit(cid, playerOutfit)
        end
    end, config.duration * 1000)

    exhaustion.set(cid, config.exausted, config.cooldown)
    Alert(cid)
    return true
end