local msg = "Agora seu sistema PvP está %s."
function onSay(cid, words, param)
local _table = {
    ["on"] = {"ativado", 1},
    ["off"] = {"desativado", 0},
}
    if _table[param:lower()] then
        local mode = _table[param:lower()]
        setPlayerStorageValue(cid, 91821, mode[2])
        doPlayerSendTextMessage(cid, 27, ""..msg:format(mode[1]))
		doSendAnimatedText(getCreaturePosition(cid), 'pvp '..param..'', 144)
    end
    return true
end