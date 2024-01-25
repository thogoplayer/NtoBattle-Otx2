function onMoveDir(uid, dir, count, delay)
if isCreature(uid) then
if isWalkable(getPosByDir(getCreaturePosition(uid),dir)) then
doMoveCreature(uid, dir)
end
if count > 0 then
addEvent(onMoveDir, delay, uid, dir, count-1, delay)
end
end
end


local positions = {
[0] = {0, -1},
[1] = {1, 0},
[2] = {0, 1},
[3] = {-1, 0},
[4] = {-1, 1},
[5] = {1, 1},
[6] = {-1, -1},
[7] = {1, -1},
}

local function adjustPos(pos)
local POS = {}
for i= 0, 7 do
POS[i] = {x= pos.x+positions[i][1], y= pos.y+positions[i][2], z= pos.z}
end
return POS
end


local function removeCorvo(uid)
if isCreature(uid) then
doRemoveCreature(uid)
end
end

local function outfitAdd(cid)
local cPos = getPlayerPosition(cid)
doSendMagicEffect({x=cPos.x+1, y=cPos.y+1, z=cPos.z}, 397)
doSetCreatureOutfit(cid, {lookType = 961}, 5000)
return true
end	


local function covrvosRemove(cid)
if isPlayer(cid) then
local cPos = getPlayerPosition(cid)
doSendMagicEffect({x=cPos.x+1, y=cPos.y+1, z=cPos.z}, 533)
end
return true
end

		
local exausted = 42524
local cooldown = 10


local function summonCorvos(cid)
	local anyPos, pos = {x= 2181, y=3577, z= 7}, getCreaturePosition(cid)
    local toPos = adjustPos(pos)
    for i = 0, 7 do
    doCombatAreaHealth(0, 0, anyPos, 0, 0, 0, 255)
    doCreateItem(460, 1, anyPos)
    local corvo = doCreateMonster("kuchyose corvo", anyPos)
	setCreatureName(corvo, getCreatureName(cid), "a " .. getCreatureName(cid))
	local toPos = isWalkable(toPos[i]) == false and pos or toPos[i]
    addEvent(doTeleportThing, 10, corvo, toPos)
	addEvent(onMoveDir, 500, corvo, i, 5, 200)
	addEvent(removeCorvo, 5000, corvo)
    end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
if getPlayerStorageValue(cid, 16700) > 1 then
doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!")
return false
end

if exhaustion.check(cid, exausted) then
local seetime = exhaustion.get(cid, exausted)
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendCancel(cid, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente o Genjutsu!")
return false
end



outfitAdd(cid)
exhaustion.set(cid, exausted, cooldown)
setCreatureBattleLockTime(cid, 6)
summonCorvos(cid)
addEvent(summonCorvos, 1000, cid)
addEvent(covrvosRemove, 6000, cid)
    return true
end
           
