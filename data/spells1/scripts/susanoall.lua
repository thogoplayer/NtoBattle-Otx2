local config = { 
duration = 30, --- duração

effect = {
    [10] = {{740, {1,0}}, {537, {1,0}}, 110},  ---Sasuke
    [100] = {{117, {1,0}}, {502, {2,0}}, 109}, -- Itachi
    [140] = {{739, {1,0}}, {929, {1,0}}, 254},   -- Madara
    [260] = {{532, {1,0}}, {684, {2,0}}, 258}  -- Shisui
    },
	
status = {
    [1] = {skills = {{C_NINJUTSU, 10}, {C_SWORD, 10}}, health = 0, speed = 0, str = "Mangekyou Sharingan:Susanoo"},
    [2] = {skills = {{C_NINJUTSU, 18}, {C_SWORD, 18}}, health = 0, speed = 0, str = "Mangekyou Sharingan:Perfect Susanoo"}
	}


} 


local function addSusano(cid, num)
if isCreature(cid) then
local info = config.status[num]
local effects = config.effect[getPlayerVocation(cid)] or config.effect[10]
doSendMagicEffect(getCreaturePosition(cid), effects[3])
doCreatureSay(cid, info.str, TALKTYPE_MONSTER)
doCreatureAddBuff(cid, info.skills, info.health, info.speed, config.duration, 3)
createLoopEffectBuff(cid, config.duration, effects[num][1], effects[num][2], 500, true, 3)
end
end


function onCastSpell(cid, var)
if isBuffID(cid, 3) then doPlayerSendCancel(cid, "desculpe-me, voce ja esta transformado.")return false end
addSusano(cid, 1)
addEvent(addSusano, config.duration * TIME_SECONDS, cid, 2)
-- return true
end