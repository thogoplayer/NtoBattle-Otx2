function onStepIn(cid, item, frompos, topos)
pos = getCreaturePosition(cid)

if getCreatureCondition(cid, CONDITION_INFIGHT) == true then
doRemoveCondition(cid, CONDITION_INFIGHT)
else
end

end