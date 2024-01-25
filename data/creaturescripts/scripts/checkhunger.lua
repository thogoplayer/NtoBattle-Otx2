-- Developed by Wise ~ TibiaKing.com
local t = {
    hp = 2, -- %
    maxTime = 1 * 60, -- minutes * 60
    lossInterval = 150, -- seconds
    hstor = 98765 -- hunger storage
}

function checkHunger(cid)
    local h = getPlayerStorageValue(cid, t.hstor)
    local loss = t.lossInterval > 1 and t.lossInterval or 2
    
    if getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBEATTACKED) then
        return true
    elseif getPlayerFood(cid) < 1 then
        if h <= t.maxTime then
            if h < 0 then
                setPlayerStorageValue(cid, t.hstor, 0)
            end
            
            setPlayerStorageValue(cid, t.hstor, getPlayerStorageValue(cid, t.hstor) + 1)
        else
            addEvent(function()
                if isPlayer(cid) then
                    doCreatureAddHealth(cid, -(t.hp * (getCreatureMaxHealth(cid) / 100)))
                end
            end, (loss - 1) * 1000)
        end
    else
        if h > 0 then
            setPlayerStorageValue(cid, t.hstor, 0)
        end
    end
    
    addEvent(function()
        if isPlayer(cid) then
            checkHunger(cid)
        end
    end, 1000)
    return true
end

function onLogin(cid)
    return checkHunger(cid) and true
end