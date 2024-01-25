function onTarget(cid, target)
if isPlayer(cid) and isNpc(target) then
local waittime = 2.0 -- Tempo de exhaustion
local storage = 335621

if exhaustion.check(cid, storage) then
return false
end
local mypos = getPlayerPosition(cid)
local targetpos = getPlayerPosition(target)
local distancia = getDistanceBetween(mypos, targetpos)
if distancia < 5 then
exhaustion.set(cid, storage, waittime)
-- doCreatureSay(cid, "Hi", TALKTYPE_PRIVATE)
doCreatureSay(cid, "Hi", 7)

-- for i=1, 56 do
-- if doCreatureSay(cid, "trade", i) then
-- doCreatureSay(cid, i, 1)
-- end
-- end
end
end
return true
end

