local function addConditionVocDay(cid)
local condition = createConditionObject(CONDITION_ATTRIBUTES,11)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1) -- Tempo que ira durar
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 15) -- Quanto de magic level ira adicionar
doAddCondition(cid, condition)
end

function onLogin(cid)
if getPlayerVocation(cid) == getStorage(25000) then
addEvent(addConditionVocDay, 11 ,cid)
end

addEvent(addBonusElo, 10 ,cid)
return true
end
