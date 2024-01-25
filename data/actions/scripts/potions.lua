local config = { 
        removeOnUse = "yes", 
        usableOnTarget = "yes", -- can be used on target? (fe. healing friend) 
        splashable = "no", 
        realAnimation = "yes", -- make text effect visible only for players in range 1x1 
        healthMultiplier = 1.0, 
        manaMultiplier = 1.0 
} 
 
config.removeOnUse = getBooleanFromString(config.removeOnUse) 
config.usableOnTarget = getBooleanFromString(config.usableOnTarget) 
config.splashable = getBooleanFromString(config.splashable) 
config.realAnimation = getBooleanFromString(config.realAnimation) 
 
local POTIONS = { 
        [10541] = {empty = 7478, splash = 1, level = 75, health = {3500, 4900}}, -- small health potion 
        [10364] = {empty = 7478, splash = 1, level = 250, health = {8000, 10000}}, -- great health potion 
        [14258] = {empty = 7478, splash = 1, level = 450, health = {15000, 17000}}, -- divine health potion 
        [10540] = {empty = 7478, splash = 1, level = 75, mana = {3000, 4500}}, -- small mana potion 
        [10365] = {empty = 7478, splash = 1, level = 250, mana = {6000, 7000}}, -- great mana potion 
        [14259] = {empty = 7478, splash = 1, level = 450, mana = {9000, 12000}}, -- demonic mana potion 
} 
 
local exhaust = createConditionObject(CONDITION_EXHAUST, false, false, 15)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 800)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end
	
	if(hasCondition(cid, CONDITION_EXHAUST, 15)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end


	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		doTransformItem(item.uid, potion.empty)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Somente level ou maior para usar este potion.", TALKTYPE_ORANGE_1)
		return true
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_EXPLOSIONHIT)
	if(not realAnimation) then
		doCreatureSay(itemEx.uid, "Glup Glup...", TALKTYPE_ORANGE_1)
	else
		for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doCreatureSay(itemEx.uid, "Glup Glup...", TALKTYPE_ORANGE_1, false, tid)
			end
		end
	end

	doAddCondition(cid, exhaust)
	if(not potion.empty or config.removeOnUse) then
		doRemoveItem(item.uid, 1)
		return true
	end
	doRemoveItem(item.uid, 1)
     doPlayerAddItem(cid, potion.empty, 1)
	return true
end