local exausted = 42524
local cooldown = 120
local duration = 5

local function removeCorvos(cid)
local c_Pos = getPlayerPosition(cid)
return isCreature(cid) and doSendMagicEffect({x=c_Pos.x+1, y=c_Pos.y+1, z=c_Pos.z}, 533)
end

local function removeCorvo(uid)
if isCreature(uid) then
doRemoveCreature(uid)
end
end

local function addCorvos(cid, quant, removetime)
if isCreature(cid) then
local anyPos, pos = {x= 2181, y=3577, z= 7}, getCreaturePosition(cid)
doSendMagicEffect({x=pos.x+1, y=pos.y+1, z=pos.z}, 397)
    local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }
    for i = 1, quant do
            local corvo = doCreateMonster("kuchyose corvo", anyPos)
			setCreatureName(corvo, getCreatureName(cid), "a " .. getCreatureName(cid))
			local toPos =  isWalkable(toPos[i]) and toPos[i] or pos
            addEvent(doTeleportThing, 100, corvo, toPos)
			addEvent(removeCorvo, removetime * TIME_SECONDS, corvo)
    end
end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

if exhaustion.check(cid, exausted) then
local seetime = exhaustion.get(cid, exausted)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar novamente o Genjutsu!")
return false
end
   
setCreatureBattleLockTime(cid, duration)
doSetCreatureOutfit(cid, {lookType = 961}, duration * TIME_SECONDS)
addCorvos(cid, 4, duration)
addEvent(addCorvos, duration/2 * TIME_SECONDS, cid, 4, duration/2)
exhaustion.set(cid, exausted, cooldown)
addEvent(removeCorvos, duration * TIME_SECONDS, cid)
    return true
end
           
