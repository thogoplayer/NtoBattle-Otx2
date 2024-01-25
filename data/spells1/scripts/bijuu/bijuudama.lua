local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -72, 1, -80, 1)

arr = {
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local waittime = 5.0-- Tempo de exhaustion
local storage = 263563
local storag2 = 10215


if isPlayer(cid) and getPlayerStorageValue(cid, storag2) < 1 then
doPlayerSendCancel(cid, "Voce precisa estar no Modo Bijuu para usar esta spell.")
return false
end


if isPlayer(cid) and exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+2, y=p.y, z=p.z},
[1] = {x=p.x+7, y=p.y+2, z=p.z},
[2] = {x=p.x+2, y=p.y+6, z=p.z},
[3] = {x=p.x, y=p.y+2, z=p.z}
}
local y = {
[0] = 483,
[1] = 480,
[2] = 482,
[3] = 481
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat, var)
return true
end