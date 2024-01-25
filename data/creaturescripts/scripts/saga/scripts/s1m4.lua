function onKill(cid, target)
if getCreatureName(target) == "Mizuki " and getPlayerSaga(cid, 1,4) then
doPlayerNextSaga(cid)
-- doCreateNpc("mizukki", {x= 1972, y=1966, z= 7})
unregisterCreatureEvent(cid, "sagaonemfourk")
end
return true
end