local tpId = 5023
local tps = {
        ["Kisame"] = {pos = {x=553, y=674, z=7}, toPos = {x=553, y=666, z=4}, time = 50},
}

function removeTp(tp)
        local t = getTileItemById(tp.pos, tpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(tp.pos, CONST_ME_POFF)
        end
end

function onDeath(cid)
        local tp = tps[getCreatureName(cid)]
        if tp then
                doCreateTeleport(tpId, tp.toPos, tp.pos)
                doCreatureSay(cid, "O teleport ir� sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
                addEvent(removeTp, tp.time*1000, tp)
        end
        return true
end