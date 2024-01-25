-- == Blood Castle Event por Killua == --

function onDeath(cid, corpse, mostDamageKiller)
     if isPlayer(cid) and isInArea(getCreaturePosition(cid), bloodconfig.fromPos, bloodconfig.toPos) then
        setGlobalStorageValue(bloodconfig.playersStorage, getPlayersInBlood()-1)
     end
     return true
end

function onLogin(cid)
    if isInArea(getCreaturePosition(cid), bloodconfig.fromPos, bloodconfig.toPos) then
         doTeleportThing(cid, bloodconfig.templo, false)
         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce estava no meio do evento Blood Castle quando o servidor caiu. Voce foi teleportado para o templo.")
    end
    registerCreatureEvent(cid, "morrerblood")
    registerCreatureEvent(cid, "guardablood")
    registerCreatureEvent(cid, "arcanjoblood")
    return true
end