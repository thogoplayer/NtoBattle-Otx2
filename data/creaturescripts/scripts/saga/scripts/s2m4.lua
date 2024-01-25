local function summon(cid)
if isCreature(cid) then
local c_Pos = getCreaturePosition(cid)
local s_sasuke = doCreateMonster("Sasukee", {x=c_Pos.x, y=c_Pos.y-2, z=c_Pos.z})
local s_sakura = doCreateMonster("Sakuraa", {x=c_Pos.x, y=c_Pos.y+2, z=c_Pos.z})
onSay(s_sasuke, "Naruto seu diota")
onSay(s_sakura, "Naruto seu diota")
addEvent(onSay, 1000, s_sasuke, "Temos que ir juntos")
addEvent(onSay, 1800, s_sakura, "Ok")
doConvinceCreature(cid, s_sasuke)
doConvinceCreature(cid, s_sakura)
addEvent(onSay, 3200, cid, "Aaa, cala a boca Sasuke, eu vou pegar esse gizo, tou certo!!!")
end
end


local function playerCheck(deathList)
for _, pid in ipairs(deathList) do
if isPlayer(pid) and getPlayerSaga(pid, 2, 4) then
doPlayerNextSaga(pid)
doTeleportThing(pid, {x= 2050, y=2095, z= 7})
doRemoveCondition(pid, CONDITION_OUTFIT)
-- if #getCreatureSummons(pid) >= 1 then
for _, uid in pairs (getCreatureSummons(pid)) do
doRemoveCreature(uid)
end
-- end
end
end
end



function onStatsChange(cid, attacker, type, combat, value)
if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/4) then
local s_kakashi = doCreateMonster("Kakashi Sensei  ", {x= 2313, y=3687, z= 7})
onSay(s_kakashi, "Kai")
addEvent(onSay, 1000, s_kakashi, "Caiu na minha armadilha")
addEvent(summon, 2000 , attacker)
doSendMagicEffect(getCreaturePosition(cid), 10)
doRemoveCreature(cid)
return false
end
return true
end


function onDeath(cid, corpse, deathList)
playerCheck(deathList)
doRemoveCreature(cid)
return false
end


