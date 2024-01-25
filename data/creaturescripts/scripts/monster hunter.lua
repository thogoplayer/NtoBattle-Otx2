-- Monster Hunter Event feito por Killua, XTibia.com

function onKill(cid, target, lastHit)
    if isPlayer(cid) and isMonster(target) then
        if getCreatureMaster(target) ~= nil then
            return true
        end
        local name = getGlobalStorageValue(1919211)
        if string.lower(getCreatureName(target)) == string.lower(name) then
            doPlayerSetStorageValue(cid, 1814210, getPlayerStorageValue(cid, 1814210) + 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Monster Hunter Event] Voce ja matou "..getPlayerStorageValue(cid, 1814210).." "..name.."s! Continue matando para ser o vencedor!")
        end
    end
    return true
end

function onLogin(cid)
    if getGlobalStorageValue(1919211) == 0 then
        doPlayerSetStorageValue(cid, 1814210, 0)
    end
    registerCreatureEvent(cid, "Monster Hunter")
    return true
end