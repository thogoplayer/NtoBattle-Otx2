local cooldown = 5 -- tempo em minutos

function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local seetime = getGlobalStorageValue(63254)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
if getGlobalStorageValue(63250) > os.time() then return doPlayerSendCancel(cid,"Wait "..minutes.." minutes and "..seconds.." seconds to enter the quest!") end

player1pos = {x = 1927, y = 2839, z = 7, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x = 1925, y = 2837, z = 7, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x = 1925, y = 2841, z = 7, stackpos=253}
player3 = getThingfromPos(player3pos)


if player1 and player2 and player3 then
queststatus1 = getPlayerStorageValue(player1.uid,14306)
queststatus2 = getPlayerStorageValue(player2.uid,14306)
queststatus3 = getPlayerStorageValue(player3.uid,14306)
    if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 then	
        nplayer1pos = {x = 1958, y = 2833, z = 7}
        nplayer2pos = {x = 1960, y = 2832, z = 7}
        nplayer3pos = {x = 1957, y = 2831, z = 7}

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
        setGlobalStorageValue(63250, cooldown*60 + os.time())
    else
    doPlayerSendCancel(cid,"Someone from this group has already done the quest!")
    end
else
doPlayerSendCancel(cid,"3 players are required to start this quest!.")
end

end