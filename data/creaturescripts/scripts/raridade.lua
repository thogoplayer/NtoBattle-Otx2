function onLogin(cid)
registerCreatureEvent(cid, "RaridadeSystem")
return true
end

function RareSystem(id)
if RaridadeTabble[id] then
return true
end
end


local effect = 737                                   --by brun123    --alterado v1.9 \/
local arrow = {740, 5}                     --Respectivamente, efeito e duração (segundos).
function sendEffect(pos, Reffect, time)
    if time < 0 then
        return true
    end
    doSendMagicEffect(pos, Reffect)
    addEvent(sendEffect, 1000, pos, Reffect, time - 1)
end
local function func(cid, position, corpseid, effect)
    if not isCreature(cid) then return true end
    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 then return end
    if not isContainer(corpse) then return true end
    for slot = 0, (getContainerSize(corpse)-1) do
        local item = getContainerItem(corpse, slot)
        if item.uid <= 1 then return end
        if RareSystem(item.itemid) then
		local sorteloot = math.random(1,1000)
        if sorteloot >= RaridadeChance.legendary[1] and sorteloot <= RaridadeChance.legendary[2] then
        doTransformItem(item.uid, RaridadeTabble[item.itemid].legendary, 1)
		doSendMagicEffect(getThingPos(cid), effect)
		sendEffect(position, arrow[1], arrow[2])
        elseif sorteloot >= RaridadeChance.epic[1] and sorteloot <= RaridadeChance.epic[2] then
        doTransformItem(item.uid, RaridadeTabble[item.itemid].epic, 1)
		doSendMagicEffect(getThingPos(cid), effect)
		sendEffect(position, arrow[1], arrow[2])
        elseif sorteloot >= RaridadeChance.rare[1] and sorteloot <= RaridadeChance.rare[2] then
        doTransformItem(item.uid, RaridadeTabble[item.itemid].rare, 1)
		doSendMagicEffect(getThingPos(cid), effect)
		sendEffect(position, arrow[1], arrow[2])
        end
        end
    end
end
function onKill(cid, target, lastHit)
 
    if not isMonster(target) then return true end
    local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
 
    addEvent(func, 0, cid, getThingPos(target), corpse, effect)
    return true
end