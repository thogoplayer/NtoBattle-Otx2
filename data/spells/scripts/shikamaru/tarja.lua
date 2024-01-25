local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -40, 1, -45, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -65, 1, -70, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -75, 1, -80, 1)

arr1 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1},
}

arr2 = {
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0},
}

arr3 = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2)
local area3 = createCombatArea(arr3)
setCombatArea(combat3, area3)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

local function removet(pos)
local tarja = getTileItemById(pos, 2268).uid
    if tarja  > 0 then
    doRemoveItem(tarja, 1)
    end
end
		  
		  
local count_color = {
[1] = 144,
[2] = 210,
[3] = 25
}

local function cont(pos, count)
if count > 0 then
doSendAnimatedText(pos, ""..count.."", count_color[count])
count = count -1
addEvent(cont, 1000,pos, count)
else
removet(pos)
doSendAnimatedText(pos, "Explosion!", TEXTCOLOR_RED)
end
return true
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local parameters = { cid = cid, var = var}
local pos = getPlayerPosition(cid)
local storage = 899123

-- Configs --

local tempo = 3 -- tempo em segundos para acontecer a explosão.
local cd = 10 -- tempo em segundos para usar a explosão.

-- daki para baixo , não mexer --

if isPlayer(cid) and exhaustion.check(cid, storage) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para plantar outra bomba!")
return false
end


local item = doCreateItemEx(2268, 1)
doTileAddItemEx(pos, item)
if getPlayerLevel(cid) < 450 then
addEvent(onCastSpell1, 1000*tempo, parameters)
elseif getPlayerLevel(cid) >= 450 and getPlayerLevel(cid) < 500 then
addEvent(onCastSpell2, 1000*tempo, parameters)
elseif getPlayerLevel(cid) >= 525 then
addEvent(onCastSpell3, 1000*tempo, parameters)
end
cont(pos, tempo)
exhaustion.set(cid, storage, cd)
return true
end