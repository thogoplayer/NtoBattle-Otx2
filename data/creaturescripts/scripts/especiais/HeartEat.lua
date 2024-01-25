local function addHealth(cid)
exhaustion.set(cid,14500, 10)
doPlayerRemoveItem(cid, 5943, 1)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/100*5)
end

function onStatsChange(cid, attacker, type, combat, value)
if not exhaustion.check(cid,14500) and getCreatureHealth(cid) <= getCreatureMaxHealth(cid)/2 and getPlayerItemCount(cid, 5943) >= 1 then
addHealth(cid)
return false
end
return true
end