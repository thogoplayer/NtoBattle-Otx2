 
function onKill(cid, target, lastHit)

        if not isMonster(target) then return true end

        local mInfo = getMonsterInfo(getCreatureName(target))

        if not mInfo then return true end

        local items = {2160} -- coloque os itens que serão sinalizados caso dropem
        local effect = 296 -- effect que vai aparecer no player se encontar o item
		local i = 0 
        addEvent(function(player, position, effect, items, corpseId)
                if not isCreature(player) then return end
                local corpse = getTileItemById(position, corpseId).uid
                if corpse <= 1 or not isContainer(corpse) then return end
                for slot = 0, getItemInfo(corpseId).maxItems - 1 do
                        if isInArray(items, getContainerItem(corpse, slot).itemid) then
						local function Effect(cid)
						if isPlayer(cid) then
if i < 5 then
doSendMagicEffect(getThingPos(player), effect)
i = i+1
addEvent(Effect, 1000, cid)
end
end
return true
end
                                return Effect(cid)
                        end
                end
        end, 1, cid, getThingPos(target), effect, items, mInfo.lookCorpse)

return true
end