local cooldown = 30 -- tempo em minutos

function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local seetime = getGlobalStorageValue(63289)-os.time()
if getGlobalStorageValue(63289) > os.time() then return doPlayerSendCancel(cid,"Wait "..math.floor(seetime/60).." minutes and "..math.floor(seetime%60).." seconds to enter the quest!") end


player1pos = {x = 2271, y = 1978, z = 8, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x = 2320, y = 2016, z = 8, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x = 2240, y = 2020, z = 8, stackpos=253}
player3 = getThingfromPos(player3pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 then
queststatus1 = getPlayerStorageValue(player1.uid,9017)
queststatus2 = getPlayerStorageValue(player2.uid,9017)
queststatus3 = getPlayerStorageValue(player3.uid,9017)
    if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 then	
    nplayer1pos = {x = 2324, y = 1937, z = 8}
	nplayer2pos = {x = 2323, y = 1937, z = 8}
	nplayer3pos = {x = 2322, y = 1937, z = 8}

        doSendMagicEffect(player1pos,2)
        doSendMagicEffect(player2pos,2)
        doSendMagicEffect(player3pos,2)

        doTeleportThing(player1.uid,nplayer1pos)
        doTeleportThing(player2.uid,nplayer2pos)
        doTeleportThing(player3.uid,nplayer3pos)

        doSendMagicEffect(nplayer1pos,4)
        doSendMagicEffect(nplayer2pos,4)
        doSendMagicEffect(nplayer3pos,4)

        doTransformItem(item.uid,1946)
        setGlobalStorageValue(63289, cooldown*60 + os.time())
    else
    return doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
    end
else
return doPlayerSendCancel(cid,"3 players are required to start this quest!.")
end
return true
end