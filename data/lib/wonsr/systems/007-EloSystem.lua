ALUNO = 0
GENIN = 1
CHUNIN = 2
JOUNIN = 3
ELITE_JOUNIN = 4
SENNIN = 5
KAZEKAGE = 6
MIZUKAGE = 7
TSUCHIKAGE = 8
RAIKAGE = 9
HOKAGE = 10

TIER_TYPES = {
	[ALUNO] = {desc = "Aluno", bonus = 0},
	[GENIN] = {desc = "Gennin", bonus = 4},
	[CHUNIN] = {desc = "Chunin", bonus = 7},
	[JOUNIN] = {desc = "Jounin", bonus = 13},
	[ELITE_JOUNIN] = {desc = "Elite Jounin", bonus = 18},
	[SENNIN] = {desc = "Sennin", bonus = 25},
	[KAZEKAGE] = {desc = "Kazekage", bonus = 35, outfit = 956},
	[MIZUKAGE] = {desc = "Mizukage", bonus = 35, outfit = 957},
	[TSUCHIKAGE] = {desc = "Tsuchikage", bonus = 35, outfit = 959},
	[RAIKAGE] = {desc = "Raikage", bonus = 35, outfit = 958},
	[HOKAGE] = {desc = "Hokage", bonus = 35, outfit = 955},
}

function Graduation(elo_point)
	local var = {
	{getKazekagePoints(420), SENNIN},
	{250, ELITE_JOUNIN},
	{160, JOUNIN},
	{50, CHUNIN},
	{10, GENIN},
	{0, ALUNO},	
	}
	for r = 1, #var do
		if elo_point >= var[r][1] then
			return var[r][2]
		end
	end
end

elo_condition = createConditionObject(CONDITION_ATTRIBUTES, false , false, 70)
setConditionParam(elo_condition, CONDITION_PARAM_TICKS, -1)

function addBonusElo(cid)
if isCreature(cid) then
local gradu = getPlayerGraduation(cid)
setConditionParam(elo_condition, CONDITION_PARAM_STAT_MAGICLEVEL, gradu.bonus) -- Quanto de magic level ira adicionar
doAddCondition(cid, elo_condition)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, string.format("Graduation: %s, Bonus: +%d Ninjutsu.", gradu.desc,gradu.bonus))
if gradu.outfit then
doCreatureChangeOutfit(cid,  {lookType = gradu.outfit})
-- doSetCreatureOutfit(cid, {lookType = gradu.outfit})
end
end
return true
end


function loadRank()
local kagesTable, query = {}, db.getResult("SELECT `id`, `name`, `elo_points` FROM `players` WHERE  `elo_points` > 599 AND `group_id` < 2 ORDER BY `elo_points` DESC LIMIT 5;")
	if (query:getID() ~= -1) then 
		while true do
			table.insert(kagesTable, {id = query:getDataInt("id"), name = query:getDataString("name"), elo = query:getDataInt("elo_points")})
			if not(query:next()) then
				break 
			end 
		end 
		query:free()
	end
return kagesTable
end

function updateKages()
local new = loadRank()
local reload, c, limit = false, 1, #new
local str = "Lista de Kages atualizada"
    while (limit > 0 and c <= limit) do
        old = getKageByRank(11-c)        
		if (old and new[c].id ~= old.id) then
		decreaseKages(11-c)
		setRank(new[c].name, 11-c)
		reload = true
		elseif not old then
		setRank(new[c].name, 11-c)
		reload = true
        end
	str = str .. "\n ["..TIER_TYPES[11-c].desc.."] - " .. new[c].name .. "("..new[c].elo..")"
    c = c+1
    end
return reload and doBroadcastMessage(str, 22)
end


function getPlayerGraduationId(cid)
local check = db.getResult("SELECT `graduation` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
return check:getDataInt("graduation") <= 0 and 0 or check:getDataInt("graduation") end


function updateGraduation(cid, points)
if isCreature(cid) and getPlayerGraduationId(cid) < 6 and (Graduation(points) ~= getPlayerGraduationId(cid)) then
return db.query("UPDATE `players` SET `graduation` = "..Graduation(points).." WHERE `id` = "..getPlayerGUID(cid))
end
return false
end


function getPlayerEloPoints(cid)
local check = db.getResult("SELECT `elo_points` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
return check:getDataInt("elo_points") <= 0 and 0 or check:getDataInt("elo_points") end

function doPlayerAddEloPoints(cid,amount)
db.query("UPDATE `players` SET `elo_points` = "..getPlayerEloPoints(cid).."+"..amount.." WHERE `id` = "..getPlayerGUID(cid))
updateGraduation(cid, getPlayerEloPoints(cid))
return updateKages()
end

function doPlayerRemovePoints(cid,amount)
db.query("UPDATE `players` SET `elo_points` = "..getPlayerEloPoints(cid).."-"..amount.." WHERE `id` = "..getPlayerGUID(cid)) 
updateGraduation(cid, getPlayerEloPoints(cid))
return updateKages()
end

function doPlayerSetEloPoints(cid,value)
db.query("UPDATE `players` SET `elo_points` = "..value.." WHERE `id` = "..getPlayerGUID(cid)) 
updateGraduation(cid, getPlayerEloPoints(cid))
return updateKages()
end

function resetEloRank()
db.query("UPDATE `players` SET `elo_points` = 0")
db.query("UPDATE `players` SET `graduation` = 0") 
end

function setRank(player, gradu)
return db.query("UPDATE `players` SET `graduation` = "..gradu.." WHERE `name` = '"..player.."'") and addBonusElo(getPlayerByNameWildcard(player))
end

function decreaseKages(i)
while (i > 5) do
db.query("UPDATE `players` SET `graduation` = "..(i-1).." WHERE `group_id` < 2 AND `graduation` = "..i.."")
i=i-1
end
end

function getKageByRank(num)
local check = db.getResult("SELECT `elo_points`,`name`,`id` FROM `players` WHERE `graduation` = "..num.." AND `group_id` < 2 LIMIT 1")
if (check:getID() ~= -1) then
return {id = check:getDataInt("id"),name = check:getDataString("name"),  elo = check:getDataInt("elo_points")}
end
return false
end


function getPlayerGraduation(cid)
return TIER_TYPES[getPlayerGraduationId(cid)]
end

function getKazekagePoints(percent)
local points = 420
if getKageByRank(KAZEKAGE) then
points =  math.floor(getKageByRank(KAZEKAGE).elo*percent/100)
elseif getKageByRank(MIZUKAGE) then
points =  math.floor(getKageByRank(MIZUKAGE).elo*percent/100)
elseif getKageByRank(TSUCHIKAGE) then
points =  math.floor(getKageByRank(TSUCHIKAGE).elo*percent/100)
elseif getKageByRank(RAIKAGE) then
points =  math.floor(getKageByRank(RAIKAGE).elo*percent/100)
elseif getKageByRank(HOKAGE) then
points =  math.floor(getKageByRank(HOKAGE).elo*percent/100)
end	
return points
end


function loadKageList()
local kagesTable, query = {}, db.getResult("SELECT `id`,`name` FROM `players` WHERE `graduation` > 5 AND `group_id` < 2 ORDER BY `graduation` DESC;")
	if (query:getID() ~= -1) then 
		while true do
			table.insert(kagesTable, {id= query:getDataInt("id"), name = query:getDataString("name")})
			if not(query:next()) then
				break 
			end 
		end 
		query:free()
	end
return kagesTable
end
