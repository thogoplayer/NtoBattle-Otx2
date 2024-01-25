function onCastSpell(cid, var)
if exhaustion.check(cid, 15505) then doPlayerSendCancel(cid, "Você está exhaustado") return false end
if not exhaustion.check(cid, 15504) then doPlayerSendCancel(cid, "Você não possui marcação") return false end
exhaustion.set(cid, 15505, 2)
doTeleportThing(cid, getPos(cid, 15501))
doSendMagicEffect(getPos(cid, 15501), 242)
doSendMagicEffect(getCreaturePosition(cid), 242)
return true
end







-- local storage = 987123 -- storage
-- local item = 11676 -- id do item
-- local time = 10 -- tempo em segundos que o item vai ficar na posição.

-- local pos = {}

-- function terminus(cid)
-- if isPlayer(cid) then
-- for index, pid in pairs(pos) do
-- if index == getCreatureName(cid) then
-- local a = getTileItemById(pos[index], item)
-- if a.uid > 0 then
-- doRemoveItem(a.uid)
-- end
-- end
-- end
-- doPlayerSendTextMessage(cid, 22, "A marcaçâo foi desfeita!.")
-- end
-- end

-- function onCastSpell(cid, var)

-- if getPlayerStorageValue(cid, storage) - os.time() <= 0 then
-- pos[getCreatureName(cid)] = getCreaturePosition(cid)
-- setPlayerStorageValue(cid, storage, os.time()+time)
-- local js = doCreateItem(item, getCreaturePosition(cid))
-- doItemSetAttribute(js, "name", ""..getCreatureName(cid).." Hiraishin")
-- doSendMagicEffect(getCreaturePosition(cid), 3)
-- addEvent(terminus, time*1000, cid)
-- elseif getPlayerStorageValue (cid, storage) - os.time() >= 1 then
-- for index, pid in pairs(pos) do
-- if index == getCreatureName(cid) then
-- doTeleportThing(cid, pid)
-- doSendMagicEffect(getCreaturePosition(cid), 242)
-- end
-- end
-- end

-- return true
-- end