local bijuuscroll = {
["Shukaku"] = {scrollid = 11171},
["Matatabi"] = {scrollid = 11172},
["Isobu"] = {scrollid = 11173},
["Son Goku"] = {scrollid = 11175},
["Kokuou"] = {scrollid = 11176},
["Saiken"] = {scrollid = 11174},
["Choumei"] = {scrollid = 11177},
["Gyuki"] = {scrollid = 11178},
["Kurama"] = {scrollid = 11179},
["Juubi"] = {scrollid = 11180}
}

local selo_effect = 4 -- Efeito do selo que vai sair em cima do monstro selando ele.

function onUse(cid, item, frompos, item2, topos)
for i,x in pairs(bijuuscroll) do
if item.itemid == x.scrollid then
if getPlayerStorageValue(cid, jin_Storage) <= 0 then
doRemoveItem(item.uid, 1)
doBroadcastMessage("[====== Jinchuuriki System ======]\nO "..i.." foi Selado pelo player "..getCreatureName(cid).."")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você agora é Jinchuuriki do "..i..", use tamanho poder com sabedoria!!")
jin.setPlayerBijuu(cid, jin_bijuus[i:lower()].sto)
jin.setBijuuTime(cid, jin_TimeDay)
jin.doPlayerSetSpells(cid, jin_bijuus[i:lower()].spells)
doSendMagicEffect(getCreaturePosition(cid), selo_effect)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Atualmente voce ja e Jinchuuriki do "..jin.getPlayerBijuu(cid)..", espere o tempo acabar.")
end						
end								 
end
return true
end
