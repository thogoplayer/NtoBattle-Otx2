local function nextSagaa(player)
if isCreature(player) then
   doPlayerNextSaga(player)
   doRemoveCondition(player, CONDITION_OUTFIT)
   registerCreatureEvent(player, "sagafourmfivek")
end
end

function onStatsChange(cid, attacker, type, combat, value)
if isCreature(cid) and getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/2) and getPlayerStorageValue(cid, 55552) < 1 then
if getPlayerStorageValue(cid, 55552) < 1 then
onSay(cid, "Boa Sorte, Uchiha Sasuke...Shh...", TALKTYPE_SAY)
addEvent(doRemoveCreature, 2000, cid)
doSetCreatureOutfit(attacker, {lookType = 391}, -1)
addEvent(nextSagaa, 6000, attacker)
setPlayerStorageValue(cid,55552, 1)
end
return false
end
return true
end


local function attackedByPlayers(playerList)
for _, player in ipairs(playerList) do
doSetCreatureOutfit(player, {lookType = 391}, -1)
addEvent(nextSagaa, 6000, player)
end
end

function onDeath(cid, corpse, deathList)
if isCreature(cid) and getPlayerStorageValue(cid, 55552) < 1 then
onSay(cid, "Boa Sorte, Uchiha Sasuke... Shh...", TALKTYPE_SAY)
attackedByPlayers(getPlayersInDeathList(deathList))
setPlayerStorageValue(cid,55552, 1)
end
return true
end
