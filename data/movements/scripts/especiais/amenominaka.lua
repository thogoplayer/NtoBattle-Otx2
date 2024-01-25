local positions = {
{x = 2873, y = 2934, z = 6},
{x = 2898, y = 2914, z = 6},
{x = 2907, y = 2951, z = 6},
{x = 2929, y = 2933, z = 6},
{x = 2951, y = 2891, z = 6},
{x = 2932, y = 2911, z = 5},
{x = 2887, y = 2928, z = 5},
{x = 2918, y = 2938, z = 4}
}

local storage = 5570
local exhaust = 8

function onStepIn(cid, item, position, fromPosition)
if exhaustion.check(cid, storage) then
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para voltar.")
return true
end
local pos = positions[math.random(1, #positions)]
if math.random(1, 100) >= 20 then
pos = getPos(cid, 5020)
end

exhaustion.set(cid, storage, exhaust)
doTeleportThing(cid, pos)
doSendMagicEffect(pos, 196)
return true
end