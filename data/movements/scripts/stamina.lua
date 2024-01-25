local saga = {
-- Sasuke -----------ok
[10] = {1059},
-- Naruto -----------ok
[1] = {1046},
-- sakura -----------ok
[30] = {1062},
-- itachi -----------ok
[100] = {1033},
--lee----------------ok
[20] = {1057},
-- kakashi-----------ok
[120] = {1053},
-- shikamaru---------ok
[70] = {1056},
-- bee---------------ok
[110] = {1050},
-- tenten------------ok
[90] = {1039},
-- hinata------------ok
[80] = {1060},
-- obito-------------ok
[130] = {1433},
-- obito rikudou-----ok
[132] = {1433},
-- neji--------------ok
[50] = {1045},
-- gaara-------------ok
[40] = {1058},
-- minato------------ok
[180] = {1036},
-- tobirama----------ok
[250] = {1035},
-- madara------------ok
[140] = {1048},
-- rikudou madara----ok
[142] = {1048},
-- kankuro-----------ok
[170] = {1051},
-- jiraya------------ok
[190] = {1061},
-- raikage-----------ok
[200] = {1031},
-- shisui------------ok
[260] = {1029},
-- pain--------------ok
[150] = {1047},
-- hashirama---------ok
[280] = {1032},
-- haku--------------ok
[290] = {1068},
-- orochi------------ok
[210] = {1044},
-- deidara-----------ok
[240] = {1055},
-- sai---------------ok
[270] = {1043},
-- guren-------------ok
[300] = {1185},
-- sasori------------ok
[320] = {1064},
-- ino---------------ok
[340] = {1028},
-- hidan-------------ok
[360] = {1054},
-- tsunade-----------ok
[330] = {1041},
-- danzou------------ok
[370] = {1034},
-- guy---------------ok
[380] = {1027},
-- onoki-------------ok
[390] = {1432},
-- suigetsu----------ok
[350] = {1065},
-- kaguya----------ok
[310] = {1812},
-- kakuzu----------ok
[430] = {1030},
-- hiruzen----------ok
[420] = {1052},
-- konan----------ok
[440] = {1066},
-- nagato----------ok
[460] = {1047},
-- kabuto----------ok
[470] = {1037},
-- mifune----------ok
[450] = {1056},
}
-------------- Config by PedroSTT ----------
local storage = 6452
local time = 1 -- quantos minutos para pisar no tile e restaurar novamente
addSta = {}

---------- Script by: Adriano Swatt --------
local maxstamina = 42 * 60  -- quantidade máxima de Stamina (Não sei se é este valor mesmo)
local qtdd = 10  -- quantidade de Stamina é adicionada
local tempo = 3 -- em segundos para cada regeneração
local tileid, action = 493, 8489 -- ID do Piso de Stamina, ActionID usada no Piso
----------- FIM DAS CONFIGURAÇÕES -----------
function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 758498) == 1 then
		local outfia = {lookType = saga[getPlayerVocation(cid)][1]}
local outfit = getCreatureOutfit(cid)
for i, v in pairs(outfia) do
		outfit[i] = v
	end
doSetCreatureOutfit(cid, outfit, -1)
		local getpos = getPlayerPosition(cid)
		local tilepos = getTileItemById(getpos, tileid).actionid
		local getsta = getPlayerStamina(cid)
			if getPlayerStorageValue(cid, 15000)- os.time() <= 0 then
				if getsta < maxstamina and isPlayer(cid) then
				addSta[cid] = addEvent(GetStamina, tempo * 1000, cid)
				else
				doPlayerSendCancel(cid, "Your stamina's already full.")
				end
			end
	else
	doTeleportThing(cid, fromPosition)
	end
return true
end
function onStepOut(cid, item, pos, position, fromPosition)
local getpos = getPlayerPosition(cid)
local tilepos = getTileItemById(getpos, 3181).actionid
		doRemoveCondition(cid, CONDITION_OUTFIT)
		local dura = time * 60000
		if isPlayer(cid) then
        stopEvent(addSta[cid])	
		addSta[cid] = nil
    end
		setPlayerStorageValue(cid, storage+ os.time()+ dura, 1)
		if tilepos == 52638 then  
		setPlayerStorageValue(cid,758498,-1)		
		end
return true
end
function GetStamina(cid)
if not isPlayer(cid) then
        addSta[cid] = nil
	return true
    end
local getpos = getPlayerPosition(cid)
local tilepos = getTileItemById(getpos, tileid).actionid
local getsta = getPlayerStamina(cid)
    if tilepos == action then    
        if getsta < maxstamina then
         if getPlayerStorageValue(cid, storage) == -1 then
			setPlayerStorageValue(cid, 15000, os.time()+tempo)
			doSendMagicEffect(getPlayerPosition(cid), 28)
			doSendAnimatedText(getPlayerPosition(cid), "+10", math.random(10, 255))
            doPlayerSendCancel(cid, "Your stamina's going up.")
			doPlayerSetStamina(cid, getsta + (qtdd))
			addSta[cid] = addEvent(GetStamina, tempo * 1000, cid)
         end
        else
            doPlayerSendCancel(cid, "Your stamina's already full.")
        end
    end
return true
end