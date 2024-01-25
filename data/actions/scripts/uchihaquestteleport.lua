function onUse(cid, item, frompos, item2, topos)

if item.uid == 9121 then
if item.itemid == 1945 then

player1pos = {x=28, y=1209, z=7, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=32, y=1205, z=7, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=36, y=1209, z=7, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=32, y=1213, z=7, stackpos=253}
player4 = getThingfromPos(player4pos)


if isPlayer(player1.uid) and isPlayer(player2.uid) and isPlayer(player3.uid) and isPlayer(player4.uid) then

nplayer1pos = {x = 279, y = 1279, z = 7}
nplayer2pos = {x = 280, y = 1278, z = 7}
nplayer3pos = {x = 280, y = 1279, z = 7}
nplayer4pos = {x = 280, y = 1280, z = 7}

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)
doSendMagicEffect(player3pos,2)
doSendMagicEffect(player4pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)
doTeleportThing(player3.uid,nplayer3pos)
doTeleportThing(player4.uid,nplayer4pos)

doSendMagicEffect(nplayer1pos,4)
doSendMagicEffect(nplayer2pos,4)
doSendMagicEffect(nplayer3pos,4)
doSendMagicEffect(nplayer4pos,4)

doTransformItem(item.uid,1946)

else
doPlayerSendCancel(cid,"Voce prescisa de 4 pessoas para fazer essa quest.")
end
return true
end

elseif item.uid == 9121 then
elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
end
end