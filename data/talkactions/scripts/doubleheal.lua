function onSay(cid, words)

if getPlayerMana(cid) > 99 then
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) * 11 / 100)
doSendMagicEffect(getCreaturePosition(cid), 13)
doSendAnimatedText(getCreaturePosition(cid), "Big Regeneration", 25)
doCreatureAddMana(cid, -100)
else
doPlayerSendCancel(cid, "voce nao tem mana.")

doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
end
return true
end
