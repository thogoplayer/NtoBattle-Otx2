local function Teleportkamui(uid, ponto)
savePos(uid, 5020)
doTeleportThing(uid, ponto)
doSendMagicEffect(ponto, 196)
exhaustion.set(uid, 5570, 30)
return true
end
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

function onStepIn(cid, item, position, fromPosition)
Teleportkamui(cid, positions[math.random(1, #positions)])
return true
end