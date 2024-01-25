local times = {
[1] = {monsters = {"Neji ","Tenten ","Rock Lee "}, storage = 39842, item = 12281},
[2] = {monsters = {"Gaara ","Kankuro ","Temari "}, storage = 39843, item = 12282},
}

local function monsterTime(cid, monster)
for _, team in ipairs(times) do
if isInArray(team.monsters, monster) then
return team
end
end
return false
end


function onKill(cid, target)
local grupo = monsterTime(cid, getCreatureName(target))
if grupo then
local count = getPlayerStorageValue(cid, grupo.storage) 
if getPlayerStorageValue(cid, grupo.storage) == 2 then
doPlayerSendTextMessage(cid,22,"Voce conseguiu o "..getItemNameById(grupo.item).."")
doPlayerAddItem(cid, grupo.item, 1)
setPlayerStorageValue(cid, grupo.storage, count+1)
else
setPlayerStorageValue(cid, grupo.storage, count+1)
end

if getPlayerStorageValue(cid, times[1].storage) == 3 and getPlayerStorageValue(cid, times[2].storage) == 3 then
setPlayerStorageValue(cid, times[1].storage, 4)
setPlayerStorageValue(cid, times[2].storage, 4)
doPlayerNextSaga(cid)
unregisterCreatureEvent(cid, "SagaFourmFiveK")
end

end
return true
end