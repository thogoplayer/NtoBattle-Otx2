function onSay(cid, words, param)


local msg = [[ --------- SHOP LISTA. ---------
(Beta Test)

------Items------

••Kaguya Cetro - 15 Donate Points
••Kage Shuriken - 15 Donate Points
••Tobi Mask - 15 Donate Points
••Yondaime Tunic - 25 Donate Points
••Sennin Legs - 15 Donate Points
••Vital Boots - 10 Donate Points
••Madara Rinnegan Shield - 10 Donate Points
••Slayer Glover - 15 Donate Points
••Raijin Nidaime Sword - 15 Donate Points
••Mes Premium - 10 Donate Points

----Vocations----

••Minato Vocation - 30 Donate Points
••Hashirama Vocation - 30 Donate Points
••Madara Vocation - 30 Donate Points


-- Para comprar fale !buyshop [NOME DO ITEM]--
]]

doPlayerPopupFYI(cid, msg)
doSendMagicEffect(getCreaturePosition(cid), 28)
return true
end