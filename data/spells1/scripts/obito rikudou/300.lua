-- local combat = createCombatObject()
-- setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
-- setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -48, 1, -50, 1)

-- local function onCastSpell1(parameters)
-- return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
-- end

-- function onCastSpell(cid, var) 
-- if isSelado(cid) then
-- return false 
-- end
-- local parameters = {cid = cid, var = var}

-- if isPlayer(cid) and exhaustion.check(cid, 774372) == true then
-- doPlayerSendCancel(cid, "You are exhausted.")
-- doSendMagicEffect(getCreaturePosition(cid), 2)
-- return false
-- end

-- local efepos = {x=getCreaturePosition(getCreatureTarget(cid)).x, y=getCreaturePosition(getCreatureTarget(cid)).y, z=getCreaturePosition(getCreatureTarget(cid)).z}
-- exhaustion.set(cid, 774372, 2.0)
-- doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 40)
-- addEvent(doSendMagicEffect, 200, efepos, 68)
-- addEvent(onCastSpell1, 200, parameters)
-- return true
-- end




local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)		---defesa nivel 300
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -55, 1, -60, 1)
local directions = {
        [0] = {
		       [1] = {{0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}},
			   [2] = {{0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}}
			  },
        [1] = {
		       [1] = {{-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}},
			   [2] = {{-1, 0}, {-1, -1}, {0, -1}, {1, -1}, {1, 0}}
			  },
		[2] = {
		       [1] = {{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}},
			   [2] = {{0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}}
			  },
		[3] = {
		       [1] = {{1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}},
			   [2] = {{1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}}
			  },
}


local function onCastGudou(cid, target, lastPos, num, dir, parameters)
if isCreature(cid) and isCreature(target) then
if #directions[dir][1] >= num then
X1,Y1 = directions[dir][1][num][1],directions[dir][1][num][2]
X2,Y2 = directions[dir][2][num][1],directions[dir][2][num][2]
newPos1 = {x=lastPos[1].x+X1, y=lastPos[1].y+Y1, z=lastPos[1].z}
newPos2 = {x=lastPos[2].x+X2, y=lastPos[2].y+Y2, z=lastPos[2].z}
doSendDistanceShoot(lastPos[1], newPos1, 111)
doSendDistanceShoot(lastPos[2], newPos2, 111)
lastPos = {newPos1,newPos2}
addEvent(onCastGudou, 30, cid, target, lastPos, num+1, dir, parameters)
else
tPos = getCreaturePosition(target)
-- doSendMagicEffect({x=tPos.x+1, y=tPos.y, z=tPos.z}, 410)
doSendDistanceShoot(lastPos[1], tPos, 111)
doSendDistanceShoot(lastPos[2], tPos, 111)
doCombat(parameters.cid, combat, parameters.var)
end
end
end


function onCastSpell(cid, var)
if isSelado(cid) then return false end

local waittime = 2.0
local storage = 774372

local target = getCreatureTarget(cid)
if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
onCastGudou(cid, target, {pos,pos}, 1, getCreatureLookDirection(cid), {cid = cid, var = var})
exhaustion.set(cid, storage, waittime)
return true
end