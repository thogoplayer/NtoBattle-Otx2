local config = {
[1] = {area = {{x = 2333, y = 2387, z = 7},{x = 2351, y = 2398, z = 7}}, exit = {x = 2334, y = 2388, z = 7}}, -----kirigakure
[2] = {area = {{x = 2333, y = 2387, z = 6},{x = 2351, y = 2398, z = 6}}, exit = {x = 2334, y = 2388, z = 7}},  -----kirigakure
[3] = {area = {{x = 1991, y = 2032, z = 7},{x = 2005, y = 2047, z = 7}}, exit = {x = 1997, y = 2029, z = 7}},   -----konoha
[4] = {area = {{x = 1351, y = 2177, z = 7},{x = 1370, y = 2192, z = 7}}, exit = {x = 1361, y = 2177, z = 7}},   ------suna
[5] = {area = {{x = 1351, y = 2177, z = 6},{x = 1370, y = 2192, z = 6}}, exit = {x = 1361, y = 2177, z = 7}},    ----suna
[6] = {area = {{x = 940, y = 1073, z = 7},{x = 998, y = 1346, z = 7}}, exit = {x= 2374, y=3115, z= 7}},    ----evento blood
}

function onStatsChange(target, cid, changetype, combat, value)
for i, v in pairs(config) do
if(isPlayer(target) and isInArea(getThingPos(target), v.area[1],v.area[2]) and changetype == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(target)) then
doCreatureAddHealth(target, getCreatureMaxHealth(target))
doTeleportThing(target, v.exit)
return false
end
end
return true
end