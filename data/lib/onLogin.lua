local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}
local vocation_day = createConditionObject(CONDITION_ATTRIBUTES, false , false, 11)
setConditionParam(vocation_day, CONDITION_PARAM_TICKS, -1) -- Tempo que ira durar
setConditionParam(vocation_day, CONDITION_PARAM_STAT_MAGICLEVEL, 15) -- Quanto de magic level ira adicionar
local function addConditionVocDay(cid)
if isCreature(cid) and getPlayerVocation(cid) == getStorage(25000) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Vocation of the day, ninjutsu +15.")
return doAddCondition(cid, vocation_day)
end
end


function playerLogin(cid)
	-- Dar House ao Banco de Dados --
		if (getHouseByPlayerGUID(getPlayerGUID(cid)) ~= nil) then
			local resultado = db.getResult("SELECT `house_id` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. ";")
			if resultado:getID() ~= -1 then
				if resultado:getDataInt("house_id") == 0 then
					db.executeQuery("UPDATE `players` SET `house_id` = '" .. getHouseByPlayerGUID(getPlayerGUID(cid)) .. "' WHERE `id` = '" .. getPlayerGUID(cid) .. "';")
				end
			end
		end
	--
	
	--  Auto Loot System
	registerCreatureEvent(cid, "AutoLootReceive")
	registerCreatureEvent(cid, "AutoLootChangeCategory")
	registerCreatureEvent(cid, "AutoLootAdd")
	registerCreatureEvent(cid, "AutoLootRemove")
	registerCreatureEvent(cid, "AutoLootStatus")
	registerCreatureEvent(cid, "AutoLootSearch")

	onReceiveItemsAdded(cid) -- send items added of the player to the client
	--

	--  - Character Image --
		doSendPlayerExtendedOpcode(cid, 77, getPlayerVocation(cid).."@")
	--
	
	--  - Look System --
		registerCreatureEvent(cid, "LookSystem")
	--

	doRemoveCondition(cid, CONDITION_OUTFIT)
	
	local msgfirstlogin = "Bem Vindo Ao Nto Battle, verifique se esta utilizado o cliente atual"
	doPlayerPopupFYI(cid, msgfirstlogin)
	doPlayerSetLossPercent(cid, PLAYERLOSS_ITEMS, 100)
	doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, 20)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 2)
		doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, loss * 20)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Este Nickname esta bloqueado!! Qual outro nick deseja por?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola diga 'account' para criar sua conta ou vaza do server 'cancel'.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bem Vindo ao Nto Battle!")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, diga 'account' para criar sua conta ou fale 'recover' para recuperar uma conta perdida.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Servidor novo")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	
	if getPlayerStorageValue(cid, 10215) >= 1 then -- buff bijuu
	setPlayerStorageValue(cid, 10215, 0)
	end

    doPlayerOpenChannel(cid, 21) -- Loot Channel
	setPlayerStorageValue(cid, "lootch", 1)
	
	
	if getPlayerGroupId(cid) == 2 then -- Tobirama Dimen
	doCreatureExecuteTalkAction(cid, "/ghost", true)
	setPlayerGroupId(cid, 1)
	end

	exhaustion.set(cid,14100,-1) --  KugutsuShunshin
	doPlayerOpenChannel(cid, 10) -- chat loot
	if isGaara(cid) then
	registerCreatureEvent(cid, "Gaara Defense")
	end
	
	if isKakuzu(cid) then
	registerCreatureEvent(cid, "HeartEat")
	end
	
	-- - Shop System --
	registerCreatureEvent(cid, "ShopReceive")
	--
	
	-- sistema de tasks
	registerCreatureEvent(cid, "TaskSystemOpcodes")
	registerCreatureEvent(cid, "TaskKill")
	registerCreatureEvent(cid, "ResetDailyTask")

	for k, v in pairs(TASKSYSTEM_MONSTERS) do
		if getPlayerStorageValue(cid, v.storage) == -1 then
			setPlayerStorageValue(cid, v.storage, 0)
		end
	end
		-- Rankings Storages
	for i = 1, #TASKSYSTEM_OPTIONS_RANKS_STORAGES do
		if getPlayerStorageValue(cid, TASKSYSTEM_OPTIONS_RANKS_STORAGES[i]) == -1 then
		setPlayerStorageValue(cid, TASKSYSTEM_OPTIONS_RANKS_STORAGES[i], 0)
	end
		if TASKSYSTEM_OPTIONS_RANKS_STORAGES[i] == TASKSYSTEM_OPTIONS_RANKS_STORAGES[1] then
			setPlayerStorageValue(cid, TASKSYSTEM_OPTIONS_RANKS_STORAGES[1], 1)
		end
	end
	if getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS) <= 0 then
		setPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS, 0)
	end	

	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")

	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	       registerCreatureEvent(cid, "ProtDeath")
		   registerCreatureEvent(cid, "Premiolvl200")
		   registerCreatureEvent(cid, "Premiolvl400")
		   registerCreatureEvent(cid, "Premiolvl600")
		   registerCreatureEvent(cid, "LevelSpeed")
           registerCreatureEvent(cid, "Biohazard")
		   registerCreatureEvent(cid, "Attack2")
	       registerCreatureEvent(cid, "Attack")
           registerCreatureEvent(cid, "ZombieAttack")
           registerCreatureEvent(cid, "WeaponMana")
		   registerCreatureEvent(cid, "showVoc")
	       registerCreatureEvent(cid, "ReportBug")
	       registerCreatureEvent(cid, "AdvanceSave")
		   registerCreatureEvent(cid, "Evento")
		   registerCreatureEvent(cid, "Recompensa")
		   registerCreatureEvent(cid, "Respawn")     
		   registerCreatureEvent(cid, "PlayerDeath")
           registerCreatureEvent(cid, "AdvancedSkill")
		   registerCreatureEvent(cid, "Imortaly")
		   registerCreatureEvent(cid, "SummonAntKillPlayer")
		   registerCreatureEvent(cid, "guardablood")
		   registerCreatureEvent(cid, "arcanjoblood")
		   registerCreatureEvent(cid, "morrerblood")
		   registerCreatureEvent(cid, "loginblood")
		   registerCreatureEvent(cid, "GuildTarget")
		   registerCreatureEvent(cid, "GuildCombat")
		   registerCreatureEvent(cid, "AdvLevelSpells")
		   registerCreatureEvent(cid, "DropItemEffect")
		   registerCreatureEvent(cid, "NonCorvo")
		   registerCreatureEvent(cid, "NonCorvo2")
		   registerCreatureEvent(cid, "Protection")   
		   registerCreatureEvent(cid, "NpcSay") -- OK
		   registerCreatureEvent(cid, "DesbugarSaga")
		   registerCreatureEvent(cid, "samehada")
		   -- registerCreatureEvent(cid, "SpawnDuende")
		   -- registerCreatureEvent(cid, "noel")
		   registerCreatureEvent(cid, "ExtendedOpcode")
		       -- Sistema de Dungeon --
                   registerCreatureEvent(cid, "DungeonReceive")
                   registerCreatureEvent(cid, "DungeonChangeCategory")
                   registerCreatureEvent(cid, "DungeonViewRecompense")
                   registerCreatureEvent(cid, "DungeonInvitePlayer")
                   registerCreatureEvent(cid, "DungeonDenyInvite")
                   registerCreatureEvent(cid, "DungeonAcceptInvite")
                   registerCreatureEvent(cid, "DungeonEnter")
                   setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
                   setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
                   setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Gennin/Chunnin")
                   setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                   setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
		   
		   
		   registerCreatureEvent(cid, "castChannel")  -- Cast
	setPlayerStorageValue(cid, "broadcast", -1)
	db.executeQuery("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0 WHERE `id` = " .. getPlayerGUID(cid))
		   
		   
-- addEvent(addConditionVocDay, 100 ,cid) --  Vocation Day
addConditionVocDay(cid)
addBonusElo(cid) --  Elo System

return true
end