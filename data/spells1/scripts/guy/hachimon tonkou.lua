local waittime = 90.0
local storage = 663333

local config = {
{eff = 251, eff_on = 316, say = "Three Gate Open!!!", skills = {{C_NINJUTSU, 15}, {C_GLOVE, 20}}, speed = 350, health = 0},
{eff = 251, eff_on = 316, say = "Fourth Gate Open!!!", skills = {{C_NINJUTSU, 20}, {C_GLOVE, 25}}, speed = 400, health = 0},
{eff = 305, eff_on = 577, say = "Seventh Gate Open!!!", skills = {{C_NINJUTSU, 30}, {C_GLOVE, 30}}, speed = 750, health = 0},
{eff = 1107, eff_on = 576, say = "Eighth Gate Open!!!", skills = {{C_NINJUTSU, 40}, {C_GLOVE, 40}}, speed = 800, health = 0},
{eff = 1107, eff_on = 576, skills = {{C_NINJUTSU, 50}, {C_GLOVE, 50}}, speed = 1000, health = 0},
}
 
local Outfits = {
{outfit = 56, stages = {57,58,59,60,909}},
{outfit = 61, stages = {62,65,66,67,54}},
{outfit = 63, stages = {64,65,66,67,54}},
{outfit = 68, stages = {69,70,71,72,55}},
{outfit = 1415, stages = {1434,1435,1437,1438,1439}}
}


-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

local function Select_Stages(value)
for i, v in pairs(Outfits) do
    if v.outfit == value then
	  return v.stages
    end
end
return Outfits[1].stages
end

local function OpenGate(cid, door, num)
if isCreature(cid) and num <= 5 then
local tempo = (num == 5 and 20 or 10)
local b = config[num]
doCreatureAddBuff(cid, b.skills, b.health, b.speed, tempo, 1)
doSetCreatureOutfit(cid, {lookType = door[num]}, tempo* TIME_SECONDS)
createLoopEffectBuff(cid, tempo, b.eff_on, false, 500, true, 1)
if b.say then
doCreatureSay(cid, b.say, TALKTYPE_MONSTER)
end
doSendMagicEffect(getPlayerPosition(cid), b.eff)
addEvent(OpenGate, tempo* TIME_SECONDS, cid, door, num+1)
end
end
                
function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid,"Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o Open Gates novamente.")
return false
end
exhaustion.set(cid, storage, waittime)
OpenGate(cid, Select_Stages(getCreatureOutfit(cid).lookType), 1)
setPlayerStorageValue(cid, storage+1,1)
setPlayerStorageValue(cid, 102053,0) -- storage verifica transformado, quando = 1 player esta transformado.
-- return true
end