function onSay(cid, words, param)


doShowTextDialog(cid, 1976, "[====== Elementos System ======] \n\n--==--==-Como funciona?-==--==--\nO sistema de elementos funciona da seguinte forma, assim que voce upa a skill de acordo com o elemento ate 10 , automaticamente voce passa a hitar 10% a mais em spells desse elemento. \n\n  Ex: Se sua Fuuton Skill for = 10 e se sua spell o danos for 100 o seu danos passa a ser 110.   \n\n[--=*=--=*=-*Skills*-=*=--=*=--] \n [FUUTON] = ["..getPlayerStorageValue(cid, 3001).."/10]\n [KATON] = ["..getPlayerStorageValue(cid, 3002).."/10]\n [SUITON] = ["..getPlayerStorageValue(cid, 3003).."/10]\n [DOTON] = ["..getPlayerStorageValue(cid, 3004).."/10]\n [RAITON] = ["..getPlayerStorageValue(cid, 3005).."/10]\n\n Voce possui "..getPlayerStorageValue(cid, 3000).." present points.")
doSendMagicEffect(getCreaturePosition(cid), 28)
return true
end
