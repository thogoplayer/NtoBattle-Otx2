local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)

	local msgfirstlogin = "Seja bem vindo ao naruto insanity online!"
	doPlayerPopupFYI(cid, msgfirstlogin)

local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 1, 1215},         --naruto      ok
[70] = { 70, 1134},       --neji	    ok
[25] = { 25, 736},         -- lee       ok
[130] = { 130, 717},      --hinata      ok
[170] = { 170, 1507},      --itachi     ok
[190] = { 190, 722},      --bee  		ok
[200] = { 200, 744},      --kakashi     ok
[400] = { 400, 1391},     --obito       ok
[401] = { 401, 1391},     --obito       ok
[402] = { 402, 1391},     --obito       ok
[209] = { 209, 1520},     --madara      ok
[210] = { 210, 1520},     --madara      ok
[211] = { 211, 1520},     --madara      ok
[300] = { 300, 1379},     --minato	    ok
[301] = { 301, 1379},     --minato	    ok
[302] = { 302, 1379},     --minato	    ok
[530] = { 530, 1477},     --orochimaru  ok
[631] = { 631, 1345},     --deidara     ok
[700] = { 700, 1307},     --tobirama    ok
[800] = { 800, 1521},     --shisui      ok
[439] = { 439, 1324},     --hashirama   ok
[440] = { 440, 1324},     --hashirama   ok
[441] = { 441, 1324},     --hashirama   ok
[467] = { 467, 1471},     --sai         ok
[767] = { 767, 1517},     --guren       ok
[633] = { 633, 1551},     --sasori      ok
[447] = { 447, 953},     --haku      ok
[13] = { 13, 700},     --sasuke      ok
}

	if getPlayerStorageValue(cid, 89745) == 5 then
    local voc = config[getPlayerVocation(cid)]
    local outfit = {lookType = voc[2]}
	setPlayerStorageValue(cid,89745,5)
        doCreatureChangeOutfit(cid, outfit)
		doPlayerSetExperienceRate(cid, 1.1) 
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem 10% de exp a mais por ser um membro da akatsuki, divirtasse!")	
			return true
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 8)
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
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bem Vindo ao Nto Insanity!")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, diga 'account' para criar sua conta ou fale 'recover' para recuperar uma conta perdida.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Servidor novo")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	if getPlayerStorageValue(cid, 10215) >= 1 then
setPlayerStorageValue(cid, 10215, 0)
return true
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
		   registerCreatureEvent(cid, "Izanagi")
		   registerCreatureEvent(cid, "NonGuild")
		   registerCreatureEvent(cid, "LevelSpeed")
           registerCreatureEvent(cid, "Biohazard")
		   	       registerCreatureEvent(cid, "Attack2")
	       registerCreatureEvent(cid, "Attack")
           registerCreatureEvent(cid, "ZombieAttack")
           registerCreatureEvent(cid, "WeaponMana")
		   registerCreatureEvent(cid, "showVoc")
	       registerCreatureEvent(cid, "ReportBug")
	       registerCreatureEvent(cid, "AdvanceSave")
		   registerCreatureEvent(cid, "MaxLevel")
		   registerCreatureEvent(cid, "Maxml")
		   registerCreatureEvent(cid, "Evento")
		   registerCreatureEvent(cid, "Recompensa")
           registerCreatureEvent(cid, "kyoku")
		              registerCreatureEvent(cid, "Respawn")     
					  registerCreatureEvent(cid, "PlayerDeath")
					  registerCreatureEvent(cid, "NiwDeath")
					  registerCreatureEvent(cid, "AdvancedSkill")
					  registerCreatureEvent(cid, "Absolute Defense")
					  

	return true
end