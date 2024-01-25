function onCastSpell(cid, words, param)
pos = getCreaturePosition(cid)

function effectFollow(uid,jump,pos)
if jump <= 0 then
return true
end
posx = getPosByDir(pos,getDirectionTo(pos,getCreaturePosition(getCreatureTarget(cid))))

doAreaCombatHealth(cid, 1, posx, 0, -7000, -8400, 95)
addEvent(effectFollow, 500, uid, jump-1, pos)
end
effectFollow(getCreatureTarget(cid),15,pos)
end