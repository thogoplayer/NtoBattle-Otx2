function onTarget(cid, target)
    if isPlayer(cid) and isPlayer(target) then
        if getCreatureTarget(cid) ~= 0 or exhaustion.get(cid, 87976564) then
            doPlayerSendCancel(cid, "Target Lost")
            if getCreatureTarget(cid) ~= 0 then
                exhaustion.set(cid, 87976564, 2)
            end
            return false
        end
    end
    return true
end