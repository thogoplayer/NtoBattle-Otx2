function onStepIn(cid, item, pos)
        if isPlayer(cid) then
                doCreatureAddHealth(cid, -remove)
                        doSendAnimatedText(getCreaturePosition(cid), "FAIL", math.random(1, 255))
                end
                        return true
                end