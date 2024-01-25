function getTime(s)
        local n = math.floor(s / 60)
        s = s - (60 * n)
        return n, s
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 1)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, 0, -10.3, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 214)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -60.2, 1, -60.2, 1)

arr1 = {
{0, 0, 0},
{0, 3, 0},
{0, 0, 0},
}

arr3 = {
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local pos = getPlayerPosition(cid)
local storage = 15456
addEvent(onCastSpell1, 0, parameters)

-- Configs --

local tempo = 2 -- tempo em segundos para acontecer a explosão.
local cd = 5 -- tempo em segundos para usar a explosão.

-- daki para baixo , não mexer --
if os.time()-getPlayerStorageValue(cid, storage) <= cd then
        minutes,seconds = getTime(cd-(os.time()-getPlayerStorageValue(cid, storage)))
return doPlayerSendTextMessage(cid, 27, "Tera que esperar " .. minutes .." minutos e ".. seconds .. " segundos para conseguir colocar uma outra bomba!")
end

local i = 0 
local tempo2 = 0
while i <= tempo-1 do
addEvent(doSendAnimatedText, 0+tempo2, pos, "Jutsu!", 108)
tempo2 = tempo2+2000
i = i+1
end
addEvent(onCastSpell2, 1000*tempo, parameters)
addEvent(onCastSpell3, 1000*tempo, parameters)
addEvent(doSendAnimatedText, 1000*tempo, pos, "Explosion!", TEXTCOLOR_RED)
setPlayerStorageValue(cid, storage, os.time()+cd)
return true
end