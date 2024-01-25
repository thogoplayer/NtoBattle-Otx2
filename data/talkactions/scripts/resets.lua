 local config = {
    backToLevel = 500,
    redskull = false, -- need to be without redskull to reset
    battle = false, -- need to be without battle to reset
    pz = false, -- need to be in protect zone to reset
    stages = {
        {resets = 4, level = 1500, premium = 1500},
        {resets = 9, level = 5000, premium = 2500},
        {resets = 14, level = 2500, premium = 2000},
        {resets = 19, level = 3000, premium = 3000},
        {resets = 24, level = 350, premium = 350},
        {resets = 29, level = 400, premium = 400},
        {resets = 34, level = 410, premium = 400},
        {resets = 39, level = 430, premium = 420},
        {resets = 44, level = 450, premium = 440},
        {resets = 49, level = 480, premium = 470},
        {resets = 54, level = 510, premium = 500},
        {resets = 59, level = 550, premium = 540},
        {resets = 64, level = 590, premium = 580},
        {resets = 69, level = 630, premium = 620},
        {resets = 74, level = 680, premium = 670},
        {resets = 79, level = 730, premium = 720},
        {resets = 84, level = 780, premium = 770},
        {resets = 89, level = 860, premium = 840},
        {resets = 94, level = 930, premium = 910},
    }
}

function onSay(cid, words, param)
db.executeQuery("ALTER TABLE `players` ADD `resets` int(11);")
if getPlayerStorageValue(cid,2310) > 0 then
doPlayerSetReset(cid,getPlayerStorageValue(cid,2310))
setPlayerStorageValue(cid,2310,-1)
doRemoveCreature(cid,true)
end
if isPlayer(cid) then
    if config.redskull and getCreatureSkullType(cid) == 4 then
        return doPlayerSendCancel(cid, "You need to be without red skull to reset.")
    elseif config.pz and not getTilePzInfo(getCreaturePosition(cid)) then
        return doPlayerSendCancel(cid, "You need to be in protection zone to reset.")
    elseif config.battle and getCreatureCondition(cid, CONDITION_INFIGHT) then
        return doPlayerSendCancel(cid, "You need to be without battle to reset.")
    end

    local resetLevel = 0
    for x, y in ipairs(config.stages) do
        if getPlayerResets(cid) <= y.resets then
            resetLevel = isPremium(cid) and y.premium or y.level
            break
        end
    end

    if getPlayerLevel(cid) < resetLevel then
        return doPlayerSendCancel(cid, "You need level " .. resetLevel .. " or more to reset.")
    end
    doPlayerAddResets(cid, 1)
    local healthMax, manaMax = getCreatureMaxHealth(cid), getCreatureMaxMana(cid)
    doPlayerAddLevel(cid, -(getPlayerLevel(cid) - config.backToLevel))
    setCreatureMaxHealth(cid, healthMax)
    setCreatureMaxMana(cid, manaMax)
    -- setPontos(cid, cid, getPontos(cid) + 2)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_RED)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Now you have " .. getPlayerResets(cid) .. " " .. (getPlayerResets(cid) == 1 and "reset" or "resets") .. ".")
	end
    return true
end