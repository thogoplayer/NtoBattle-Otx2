local function Teleportkamui(uid, ponto)
savePos(uid, 5020)
doTeleportThing(uid, ponto)
doSendMagicEffect(ponto, 196)
exhaustion.set(uid, 5570, 30)
return true
end
local positions = {
{x = 2890, y = 2911, z = 6},
{x = 2913, y = 2953, z = 6},
{x = 2943, y = 2900, z = 5}
}

function onStepIn(cid, item, position, fromPosition)
Teleportkamui(cid, positions[math.random(1, #positions)])
return true
end