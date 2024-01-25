local positions = {
{x = 1960, y = 687, z = 6},
{x = 1960, y = 689, z = 5},
{x = 1962, y = 700, z = 5},
{x = 1960, y = 719, z = 5},
{x = 1988, y = 699, z = 5},
{x = 2017, y = 701, z = 6},
{x = 1994, y = 701, z = 6},
{x = 1956, y = 719, z = 6},
{x = 1974, y = 670, z = 6},
{x = 1956, y = 700, z = 6},
{x = 1950, y = 656, z = 7},
{x = 1943, y = 674, z = 7},
{x = 1981, y = 671, z = 7},
{x = 1998, y = 673, z = 7},
{x = 1947, y = 717, z = 7},
{x = 1973, y = 726, z = 7},
{x = 2008, y = 701, z = 7},
{x = 2020, y = 720, z = 7},
{x = 1962, y = 728, z = 7}
}

local storage = 5570
local exhaust = 15

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