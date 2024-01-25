local function doAddHealBuff(c)
	local healing = math.random(getCreatureMaxHealth(c)*0.04,getCreatureMaxHealth(c)*0.06)
	doCreatureAddHealth(c,healing)
	doSendMagicEffect(getPlayerPosition(c), 5)
	return healing
end

local exhaustion_healing = 5
local storage_healing = 200100

local storage_cast = 200101
local exhasustion_cast = 100

local condition = createConditionObject(CONDITION_ATTRIBUTES, 5000, false, 99)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 20)

function onCastSpell(cid, var)
	if exhaustion.check(cid, storage_cast) then
		doPlayerSendCancel(cid, "Aguarde "..(exhaustion.get(cid, storage_cast)).." segundos para usar novamente.")
		doSendMagicEffect(getCreaturePosition(cid), 5)
		return false
	end
	
	local membersList = getPartyMembers(cid)
	local spec = getSpectators(getCreaturePosition(cid), 12, 8,false)
	if membersList then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ativou a curar para Voce e seu grupo. Duracao 60 segundos.")
		for x,__cid in pairs(spec) do 
			for i, _cid in pairs(membersList) do	
				if __cid == _cid then
					if not exhaustion.check(_cid, storage_healing) then
						doAddCondition(_cid, condition)
						doSendAnimatedText(getPlayerPosition(_cid),"+DEF", COLOR_WHITE)
						for k = 1, 60 do
							addEvent(function()
								if isCreature(_cid) then
									local pos1 = {x = getPlayerPosition(_cid).x + 1, y = getPlayerPosition(_cid).y + 1, z = getPlayerPosition(_cid).z}
									doSendAnimatedText(getPlayerPosition(_cid),"+"..doAddHealBuff(_cid),COLOR_LIGHTBLUE)
								end
							end, k * 1000)
						end
						exhaustion.set(_cid, storage_healing, exhaustion_healing)
					end
				end
			end
		end
	else
		if not exhaustion.check(cid, storage_healing) then
			if isCreature(cid) then 
				doAddCondition(cid, condition)
				doSendAnimatedText(getPlayerPosition(cid),"+DEF", COLOR_WHITE)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ativou a curar somente em Voce pois não estava em grupo. Duracao 30 segundos.")
			end
			for k = 1, 30 do
				addEvent(function()
					if isCreature(cid) then
						local pos1 = {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z}
						doSendAnimatedText(getPlayerPosition(cid),"+"..doAddHealBuff(cid),COLOR_LIGHTBLUE)
					end
				end, k * 1000)
			end
			exhaustion.set(cid, storage_healing, exhaustion_healing)
		end
	end
	exhaustion.set(cid, storage_cast, exhasustion_cast)
	return true
end
