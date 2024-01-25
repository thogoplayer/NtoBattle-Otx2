local config = {
pos = {x = 3740, y = 877, z = 6}, -- posição que será teleportado
tempo = 3, -- tempo pra voltar
effect1 = 386, -- efeito ao ser teleportado
effect2 = 386, -- efeito ao voltar
storage = 19329, -- storage que fica guardado o cooldown
from = {x=1082, y=943, z=15}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=1092, y=951, z=15}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
cooldown = 20, --- tempo entre um uso e outro (após usar a spell vc vai ficar X segundos sem poder usar ela novamente)
}

local exceptions = {'trainer'} --- nome das criaturas que não poderão ser levadas pro kamui (sempre em minúsculo e entre aspas)

local traps = {
               {11022, {-1, -1}}, 
			   {11021, {0, -1}}, 
			   {11029, {1, -1}}, 
			   {11028, {-1, 0}}, 
			   {11027, {0, 0}}, 
			   {11026, {1, 0}}, 
			   {11025, {-1, 1}}, 
			   {11024, {0, 1}}, 
			   {11023, {1, 1}}
			   }

local function getPositions(pos)
local positions = {}
for i = 1, 9 do
positions[i] = {x = pos.x+traps[i][2][1], y = pos.y+traps[i][2][2] , z = pos.z}
end
return positions
end

local function createTrap(positions)
for i = 1, 9 do
item_trap = doCreateItemEx(traps[i][1], 1)
doTileAddItemEx(positions[i], item_trap)
doDecayItem(item_trap)
end
end

local function TRAP(cid, positions)
for _, tPos in ipairs(positions) do
local mob = getTopCreature(tPos).uid
if mob ~= 0 and isWalkable(tPos, true) then
if not isLimboProtection(cid, mob) then
Trap(mob, config.tempo)
end
end
end
end



function onCastSpell(cid, var) if isPlayer(cid) and exhaustion.check(cid, 7689) then doPlayerSendCancel(cid, "Voce esta Selado, o selo vai sair em "..exhaustion.get(cid, 7689).." segundo(s)") return false end
local cPos = getPlayerPosition(cid)

if isInRange(cPos, config.from, config.to) then
doPlayerSendCancel(cid, "Voce Nao Pode Usar Esta Spell Aqui!")
return false
end
if getPlayerStorageValue(cid, config.storage) > os.time() then
doPlayerSendCancel(cid, "Your skill is in cooldown, you must wait "..(getPlayerStorageValue(cid, config.storage) -os.time()+config.cooldown).." seconds.")
return false
end

local positions = getPositions(cPos)
doPlayerSetStorageValue(cid, config.storage, os.time()+config.cooldown)
TRAP(cid, positions)
createTrap(positions)

return true
end