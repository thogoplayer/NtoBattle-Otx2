
local function onMoveNendoDir(uid, dir, count, delay)
if isCreature(uid) then
    if isWalkable(getPosByDir(getCreaturePosition(uid),dir)) then
    doMoveCreature(uid, dir)
        if count > 0 then
        addEvent(onMoveNendoDir, delay, uid, dir, count-1, delay)
        end
	else
	    if isMonster(uid) then
	    blowSummon(uid)
	    end
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


local function removeSpider(uid)
if isCreature(uid) then
doRemoveCreature(uid)
end
end


local exausted = 42524
local cooldown = 90


local function summonSpiders(cid)
if isCreature(cid) then
	local anyPos, pos = {x= 2181, y=3575, z= 7}, getCreaturePosition(cid)
    local toPos = adjustPos(pos)
	local mydir = math.random(0,7)
    for i = 0, 7 do
	-- anyPos.x = anyPos.x + i
	if mydir ~= i then
    local nendo = doCreateMonster("explosivespider", anyPos)
	if nendo then
	setCreatureName(nendo, getCreatureName(cid), "a " .. getCreatureName(cid))
    doTeleportThing(nendo, (isWalkable(toPos[i])  and toPos[i] or pos))
	setPlayerStorageValue(nendo, "owner", cid)
    setPlayerStorageValue(nendo, "name", "Spider")
	onMoveNendoDir(nendo, i, 10, 200)
	addEvent(removeSpider, 2000, nendo)
	end
	else
	onMoveNendoDir(cid, i, 4, 160)
	end
    end
end
end

function onCastSpell(cid, var) if isSelado(cid) then return false end
if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar o jutsu aqui!!")
return false
end
if exhaustion.check(cid, exausted) then
local seetime = exhaustion.get(cid, exausted)
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendCancel(cid, "Aguarde "..minutes.." minutos e "..seconds.." segundos para usar novamente!")
return false
end



doSetCreatureOutfit(cid, {lookType = 578}, 2000)
exhaustion.set(cid, exausted, cooldown)
setCreatureBattleLockTime(cid, 2)
summonSpiders(cid)
addEvent(summonSpiders, 1000, cid)
return true
end
           
