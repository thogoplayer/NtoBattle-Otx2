local msg = "Agora seu sistema PvP está %s."
function onSay(cid, words, param)
local _table = {
    ["!pvpon"] = {"ativado", 1},
    ["!pvpoff"] = {"desativado", 0},
}
    if _table[param:lower()] then
        local mode = _table[param:lower()]
        setPlayerStorageValue(cid, 91821, mode[2])
        doPlayerSendTextMessage(cid, 27, msg:format(mode[1]))
    end
    return true
end
 Tags:
    <event type="statschange" name="PvPStats" event="script" value="pvp.lua"/>
    <event type="target" name="PvPTarget" event="script" value="pvp.lua"/> 
    <event type="login" name="PvPLogin" event="script" value="pvp.lua"/> 
function onTarget(cid, target)
    if isPlayer(target) and isPlayer(cid) then
        if getPlayerStorageValue(cid, 91821) < 1 then
            doPlayerSendCancel(cid, "Você está com o modo PvP desligado. Se quiser atacar outros jogadores, ative-o.")
            return false
        end
    end
    return true
end
 
function onStatsChange(cid, attacker, type, combat, value)
    if isPlayer(cid) and isPlayer(attacker) and type == STATSCHANGE_HEALTHLOSS then
        if getPlayerStorageValue(attacker, 91821) < 1 then
            doPlayerSendCancel(attacker, "Você está com o modo PvP desligado. Se quiser atacar outros jogadores, ative-o.")
            return false
        end
    end
    return true
end
 
function onLogin(cid)
    registerCreatureEvent(cid, "PvPTarget")
    registerCreatureEvent(cid, "PvPStats")
    return true
end