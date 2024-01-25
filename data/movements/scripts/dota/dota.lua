function onStepIn(cid, item, pos, frompos)
local positions = {
{x=691, y=42, z=7},
{x=595, y=42, z=7}
}
local destino = math.random(#positions)
doTeleportThing(cid,positions[destino], true)
doSendMagicEffect(getPlayerPosition(cid), 10)
end