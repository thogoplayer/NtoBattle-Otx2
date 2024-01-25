local novaspeed = 250
local gpl = 2.0
 
function onLogin(cid)
  registerCreatureEvent(cid, "SpeedAdvance")
  doChangeSpeed(cid, -getCreatureSpeed(cid))
  doChangeSpeed(cid, (novaspeed+(gpl*getPlayerLevel(cid))))
  return true
end
 
function onAdvance(cid, skill, oldLevel, newLevel)
if skill == 8 then
  doChangeSpeed(cid, -getCreatureSpeed(cid))
  doChangeSpeed(cid, (novaspeed+(gpl*getPlayerLevel(cid))))
end
  return true
end