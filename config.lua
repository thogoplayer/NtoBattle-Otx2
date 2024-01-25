
	accountManager = false
	namelockManager = true
	newPlayerChooseVoc = false
	newPlayerSpawnPosX = 1
	newPlayerSpawnPosY = 1
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 1
	newPlayerLevel = 8
	newPlayerMagicLevel = 0
	generateAccountNumber = false
	generateAccountSalt = false
	enableCast = true
	
	    -- Ghost mode
    ghostModeInvisibleEffect = false
    ghostModeSpellEffects = false

stairhopDelay = 1000

timeBetweenActions = 200
timeBetweenExActions = 0
timeBetweenCustomActions = 500


		blessings = true
		blessingOnlyPremium = false
		blessingReductionBase = 30
		blessingReductionDecrement = 5
		eachBlessReduction = 8
			useFairfightReduction = false
			fairFightTimeRange = 30
			pvpBlessingThreshold = 50

fragsLimit = 24 * 60 * 60
fragsSecondLimit = 1 * 24 * 60 * 60
fragsThirdLimit = 1 * 24 * 60 * 60


fragsToRedSkull = 25
fragsSecondToRedSkull = 99999
fragsThirdToRedSkull = 99999
redSkullLength = 1 * 24 * 60 * 60


experienceShareRadiusX = 90
experienceShareRadiusY = 90
experienceShareRadiusZ = 1
experienceShareLevelDifference = 3 / 4
extraPartyExperienceLimit = 20
extraPartyExperiencePercent = 15
experienceShareActivity = 5 * 60 * 1000


    staminaSystem = true
	rateStaminaLoss = 1
	rateStaminaGain = 5
	rateStaminaThresholdGain = 10
	staminaRatingLimitTop = 35 * 60
	staminaRatingLimitBottom = 14 * 60
	staminaLootLimit = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 1.0
	staminaThresholdOnlyPremium = false

fragsToBlackSkull = 35
fragsSecondToBlackSkull = 99999
fragsThirdToBlackSkull = 99999
blackSkulledDeathHealth = 40
blackSkulledDeathMana = 0
blackSkullLength = 3 * 24 * 60 * 60
useBlackSkull = true

notationsToBan = 4
warningsToFinalBan = 5
warningsToDeletion = 6
banLength = 2 * 24 * 60 * 60
killsBanLength = 7 * 24 * 60 * 60
finalBanLength = 30 * 24 * 60 * 60
ipBanLength = 365 * 24 * 60 * 60
fragsToBanishment = 25
fragsSecondToBanishment = 70
fragsThirdToBanishment = 99

	protectionLevel = 100
	pvpTileIgnoreLevelAndVocationProtection = true
	hotkeyAimbotEnabled = true
	pzLocked = 60 * 1000
	huntingDuration = 20 * 1000
	criticalHitMultiplier = 1
	displayCriticalHitNotify = true
	removeWeaponAmmunition = true
	removeWeaponCharges = true
	removeRuneCharges = true
	whiteSkullTime = 10 * 60 * 1000
	useFragHandler = true
	noDamageToSameLookfeet = false
	showHealthChange = true
	showManaChange = true
	showHealthChangeForMonsters = true
	showManaChangeForMonsters = true
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = true
	loginProtectionPeriod = 5 * 1000
	deathLostPercent = 10
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = true
	recoverManaAfterDeathInPvPZone = true
	squareColor = 0
	broadcastBanishments = true
	maxViolationCommentSize = 60
	violationNameReportActionType = 2
	removeChargesFromRunes = true
	removeChargesFromPotions = true
	timeToDecreaseFrags = 24 * 60 * 60 * 1000
	stairJumpExhaustion = 1 * 1000
	skipItemsVersionCheck = true
	pushCreatureDelay = 1 * 500
	ingameGuildManagement = false
	elfProtectionTarget = false
	advancedFragList = false
    noDamageToGuildMates = false
	noDamageToPartyMembers = false
	playerFollowExhaust = 2000
	checkCorpseOwner = false
			
			
			
worldId = 0
ip = "127.0.0.1"
worldType = "open" 
bindOnlyGlobalAddress = false
loginPort = 7171
gamePort = "7172"
statusPort = 7171
loginOnlyWithLoginServer = false
maxPlayers = 550
onePlayerOnlinePerAccount = false
allowClones = false
statusTimeout = 5 * 1000
replaceKickOnLogin = true
packetsPerSecond = 500

displayGamemastersWithOnlineCommand = false
serverName = "NtoBattle"
motd = "Bem vindo ao NTO Battle -  O Novo mundo Shinobi!"
loginMessage = "Bem vindo ao NTO Battle -  O Novo mundo Shinobi!"


clientVersionMin = 860
clientVersionMax = 860
clientVersionStr = "Only clients with protocol 8.60 allowed!"

deathLosePercent = -1


timeBetweenActions = 100
timeBetweenExActions = 1000


mapName = "nowo.otbm"
mapAuthor = "Jeff"


sqlType = "mysql"
sqlHost = "localhost"
sqlPort = 3306
sqlUser = "root"
sqlPass = ""
sqlDatabase ="ntobattle"
sqlFile = "otxserver.s3db"
sqlKeepAlive = 0
mysqlReadTimeout = 10
mysqlWriteTimeout = 10
mysqlReconnectionAttempts = 3
encryptionType = "sha1"

freePremium = false
kickIdlePlayerAfterMinutes = 10
maxMessageBuffer = 5
emoteSpells = true
classicEquipmentSlots = false
allowWalkthrough = true
classicAttackSpeed = false
exhaustionNPC = true
exhaustionInSecondsNPC = 0.5


	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	disableOutfitsForPrivilegedPlayers = false
	addonsOnlyPremium = true


experienceStages = true
rateExp = 1.0
rateSkill = 4.0
rateLoot = 1.0
rateMagic = 1.0
rateSpawn = 1.0

formulaLevel = 3.0
formulaMagic = 0.4

rateMonsterHealth = 1.0
rateMonsterAttack = 0.8
rateMonsterDefense = 1.7


deSpawnRange = 2
deSpawnRadius = 50


warnUnsafeScripts = true
convertUnsafeScripts = true


defaultPriority = "high"
startupDatabaseOptimization = true

	globalSaveEnabled = false
	globalSaveHour = 5
	globalSaveMinute = 0
	shutdownAtGlobalSave = false
	cleanMapAtGlobalSave = false
	closeInstanceOnShutdown = false
	
	buyableAndSellableHouses = true
	houseNeedPremium = false
	bedsRequirePremium = false
	levelToBuyHouse = 200
	housesPerAccount = 2
	houseRentAsPrice = true
	housePriceAsRent = true
	housePriceEachSquare = 145000
	houseRentPeriod = "weekly"
	houseCleanOld = 604800
	guildHalls = true
	houseSkipInitialRent = true
	houseProtection = true

	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	reportsExpirationAfterReads = 1
	playerQueryDeepness = 2
	tileLimit = 5
	protectionTileLimit = 5
	houseTileLimit = 10



ownerName = "Projeto Shinobi"
ownerEmail = "thogoplayer@gmail.com"
url = "www.ntobattle.com.br"
location = "Brazil"


dataDirectory = "data/"
logsDirectory = "data/logs/"

logPlayersStatements = false
allowBlockSpawn = false
teleportAllSummons = true

AutoLoot_BlockIDs = "" 
AutoLoot_MoneyIDs = "2148;2152;2160;18149" 
AutoLoot_MaxItem = 5 
rareSystem = true
rateLootRare = 1.0  
rateBonusPremium = 0
