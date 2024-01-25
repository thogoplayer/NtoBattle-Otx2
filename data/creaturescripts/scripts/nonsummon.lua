function onCombat(cid, target) 
if isInArray(getCreatureSummons(target), cid) then 
return false 
end 
return true 
end