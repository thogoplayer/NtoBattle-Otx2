function onSay(cid, words)

    local level = getPlayerLevel(cid)
    local mlevel = getPlayerMagLevel(cid)
    local min = ((level*9)+(mlevel*1.0)+850)
    local max = ((level*9)+(mlevel*2.0)+1090)
    local rand = math.random(min, max)

if exhaustion.check(cid, 345040) then
    doPlayerSendCancel(cid, "You have to wait ".. exhaustion.get(cid, 345040) .." seconds.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
    return true
end
if getPlayerMana(cid) > 99 then
doCreatureAddHealth(cid, rand)
doSendMagicEffect(getCreaturePosition(cid), 13)
doSendAnimatedText(getCreaturePosition(cid), "Big Regeneration", 25)
doCreatureAddMana(cid, -100)
exhaustion.make(cid, 345040, 0.3)
else
doPlayerSendCancel(cid, "voce nao tem mana.")

doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
end
return true
end