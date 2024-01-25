local monstros = {"Duende","Beezer","Dog","Bandit","Boxer","Mind Bat","Black Wolf","Fire Shinobi"} -- nome do monstro que ao ser morto irá sumonar outro monstro


local block = {} -- pra nao executar mais de 1x
function onKill(cid, target, lastHit)
	if(isMonster(target) and not getCreatureMaster(target) and not isInArray(monstros, getCreatureName(target):lower()) and not block[target]) then
	if math.random(1, 1000) <= 10 then
		block[target] = true
        local sumonado = doCreateMonster("duende", getThingPos(target))
		doCreatureSay(sumonado, "Merry Christmas!!", TALKTYPE_SAY)
end	
end
	return true
end