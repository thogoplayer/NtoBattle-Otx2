local HP = 150

function onLogin(cid)
registerCreatureEvent(cid, "LifeBUGIn")
registerCreatureEvent(cid, "LifeBUGOut")
registerCreatureEvent(cid, "LifeBUGDeath")

if getCreatureMaxHealth(cid) < 150 then
doCreatureAddHealth(cid, HP)
setCreatureMaxHealth(cid, HP)
doCreatureAddHealth(cid, HP)
if getCreatureMaxHealth(cid) <= 0 then
doPlayerAddLevel(cid, 1)
db.query("UPDATE players SET maxhealth = HP, health = HP WHERE id = "..getPlayerGUID(cid))
end
end
return true
end

function onLogout(cid)
if getCreatureMaxHealth(cid) <= 0 then
setCreatureMaxHealth(cid, HP)
db.query("UPDATE players SET maxhealth = HP, health = HP WHERE id = "..getPlayerGUID(cid))
end
return true
end

function onDeath(cid)
if getCreatureMaxHealth(cid) <= 0 then
setCreatureMaxHealth(cid, HP)
db.query("UPDATE players SET maxhealth = HP, health = HP WHERE id = "..getPlayerGUID(cid))
end
return true
end