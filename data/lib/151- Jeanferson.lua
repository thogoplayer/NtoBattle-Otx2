function doCreatureAddCondition(cid, condition)
if not isCreature(cid) then return true end
doAddCondition(cid, condition)
end

function doCreatureRemoveCondition(cid, condition)
if not isCreature(cid) then return true end
doRemoveCondition(cid, condition)
end


function doDisapear(cid)   --Faz ficar invisivel
if not isCreature(cid) then return true end
doCreatureAddCondition(cid, permanentinvisible)
doCreatureSetHideHealth(cid, true)
doSetCreatureOutfit(cid, {lookType = 2}, -1)
end

function doAppear(cid)    --Faz um poke q tava invisivel voltar a ser visivel...
if not isCreature(cid) then return true end
	doRemoveCondition(cid, CONDITION_INVISIBLE)
    doRemoveCondition(cid, CONDITION_OUTFIT)
	doCreatureSetHideHealth(cid, false)
end

function addPresencePoints(cid, quant)    --Faz um poke q tava invisivel voltar a ser visivel...
setPlayerStorageValue(cid, 3000, getPlayerStorageValue(cid, 3000)+quant) 
end

function getPoints(cid)
local res = db.getResult('select `premium_points` from accounts where name = \''..getPlayerAccount(cid)..'\'')
if(res:getID() ~= -1) then
local ret = res:getDataInt("premium_points")
return res:free() and tonumber(ret)
end
return false
end


function doPlayerSetSkill(cid, skill, amount)
local pid = getPlayerGUID(cid)
doRemoveCreature(cid,true)
db.query("UPDATE `player_skills` SET `value` = ".. amount .." WHERE `player_id` = ".. pid .. " and `skillid` = ".. skill ..";")
return true
end
function doPlayerSetMagic(cid, amount)
local pid = getPlayerGUID(cid)
doRemoveCreature(cid,true)
db.query("UPDATE `players` SET `maglevel` = " .. amount .. " WHERE `id` = "..pid)
return true
end

function getPlayerFrags(cid)
    local time = os.time()
    local times = {today = (time - 86400), week = (time - (7 * 86400))}
    local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
    if(result:getID() ~= -1) then
        repeat
            local content = {date = result:getDataInt("date")}
            if(content.date > times.today) then
                table.insert(contents.day, content)
            elseif(content.date > times.week) then
                table.insert(contents.week, content)
            else
                table.insert(contents.month, content)
            end
        until not result:next()
        result:free()
    end
    local size = {
        day = table.maxn(contents.day),
        week = table.maxn(contents.week),
        month = table.maxn(contents.month)
    }
    return size.day + size.week + size.month
end
function getDeathsAndKills(cid, type) -- by vodka
    local query,d = db.getResult("SELECT `player_id` FROM "..(tostring(type) == "kill" and "`player_killers`" or "`player_deaths`").." WHERE `player_id` = "..getPlayerGUID(cid)),0
        if (query:getID() ~= -1) then
            repeat
                d = d+1
            until not query:next()
            query:free()
        end
    return d  
end


function doRemoveElementFromTable(t, e)
	local ret = {}
	for a = 1, #t do
		if t[a] ~= e then
		table.insert(ret, t[a])
		end
	end
return ret
end

--- POke tibia
function getItemsInContainerById(container, itemid) -- Function By Kydrai
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
for slot=0, (getContainerSize(container)-1) do
local item = getContainerItem(container, slot)
if isContainer(item.uid) then
local itemsbag = getItemsInContainerById(item.uid, itemid)
for i=0, #itemsbag do
table.insert(items, itemsbag[i])
end
else
if itemid == item.itemid then
table.insert(items, item.uid)
end
end
end
end
return items
end


function doRemoveTile(pos)-- Script by mock
pos.stackpos = 0
local sqm = getTileThingByPos(pos)
doRemoveItem(sqm.uid,1)
end

function doCreateTile(id,pos) -- By mock
doAreaCombatHealth(0,0,pos,0,0,0,CONST_ME_NONE)
doCreateItem(id,1,pos)
end

function addItemInFreeBag(container, item, num)
if not isContainer(container) then return false end                                             
if not item then return false end
if not num then num = 1 end                                            --alterado v2.6.1
if getContainerSize(container) < getContainerCap(container) then
   return doAddContainerItem(container, item, num)
else
   for slot = 0, (getContainerSize(container)-1) do
       local container2 = getContainerItem(container, slot)
       if isContainer(container2.uid) and getContainerSize(container2.uid) < getContainerCap(container2.uid) then
          return doAddContainerItem(container2.uid, item, num)
       end
   end
end
return false
end


function checkMonstersInArea(area,monsters)
local scan = false
	for x = area[1].x - 1, area[2].x + 1 do
		for y = area[1].y - 1, area[2].y + 1 do
			local m = getTopCreature({x=x, y=y, z=area[1].z}).uid
            if m ~= 0 and isMonster(m) and isInArray(monsters, getCreatureName(m)) then	
			scan = true
			end				
		end 
	end
return scan 
end	

function getPosfromArea(cid, area) 
local mydir = getCreatureLookDirection(cid)
    icenter = math.floor(table.getn(area)/2)+1
    jcenter = math.floor(table.getn(area[1])/2)+1
    center = area[icenter]
    ivar = table.getn(area)
    jvar = table.getn(area[1])
    i = table.getn(area)^2
    j = table.getn(area[1])^2
    if center[jcenter] == 3 then
        if mydir == 0 then
            signal = {-1,1,1,2}
        elseif mydir == 1 then
            signal = {1,-1,2,1}
        elseif mydir == 2 then
            signal = {1,-1,1,2}
        elseif mydir == 3 then
            signal = {-1,1,2,1}
        end
    else
        signal = {-1,1,1,2}
    end
    POSITIONS = {}  
    P = 0      
    repeat
        pvar = {0,0}
        I = area[ivar]
        J = I[jvar]
        i = i-1
        j = j-1
        if J == 1 then
            if jvar < jcenter then  
                pvar[signal[3]] = signal[1]*math.abs((jcenter-jvar)) 
            elseif jvar > jcenter then  
                pvar[signal[3]] = signal[2]*math.abs((jcenter-jvar)) 
            end             
            if ivar < icenter then  
                pvar[signal[4]] = signal[1]*math.abs((icenter-ivar)) 
            elseif ivar > icenter then
                pvar[signal[4]] = signal[2]*math.abs((icenter-ivar))
            end
        end    
        if jvar > 1 then
            jvar = (jvar-1)
        elseif ivar > 1 then
            jvar = table.getn(area[1])
            ivar = (ivar-1)
        end  
        local pos = getThingPos(cid)
        local areapos = {x=pos.x+(pvar[1]),y=pos.y+(pvar[2]),z=pos.z}  
        if pos.x ~= areapos.x or pos.y ~= areapos.y then
            P = P+1
            POSITIONS[P] = areapos
        end  
    until i <= 0 and j <= 0
    return POSITIONS
end

function getPositionsfromRaio(pos, raio, center)
local POSITIONS = {}
if center then
table.insert(POSITIONS, pos)
end

for posX=-raio[1], raio[1] do
    for posY=-raio[2], raio[2] do
		if posX ~= 0 or posY ~= 0 then
		table.insert(POSITIONS, {x= pos.x+posX, y= pos.y+posY, z=pos.z})
		end
	end
end
    return POSITIONS
end

function bloqProjectile(pos)
for i = 0, 255 do
    pos.stackpos = i
    local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, CONST_PROP_BLOCKPATHFIND) or hasProperty(tile.uid, CONST_PROP_BLOCKINGANDNOTMOVABLE) then
			return true
            end
        end
    end
return false
end

function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if not creature and getTopCreature(pos).uid > 0 then return false end
    if not pz and getTileInfo(pos).protection then return false end
	if not proj and bloqProjectile(pos) then return false end
    return true
end

function getZnotePoints(cid)
local check = db.getResult("SELECT `points` FROM `znote_accounts` WHERE `account_id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
return check:getDataInt("points") <= 0 and 0 or check:getDataInt("points") end

function addZnotePoints(cid, quant)
return db.query("UPDATE `znote_accounts` SET `points` = `points` + "..quant.." WHERE `account_id` = '" ..getPlayerAccountId(cid).. "';")
end

function removeZnotePoints(cid, quant)
return db.query("UPDATE `znote_accounts` SET `points` = `points` - "..quant.." WHERE `account_id` = '" ..getPlayerAccountId(cid).. "';")
end

function setZnotePoints(cid, quant)
return db.query("UPDATE `znote_accounts` SET `points` = "..quant.." WHERE `account_id` = '" ..getPlayerAccountId(cid).. "';")
end

function AddSkill(cid, pointsSkill, time, subId)
local buff = createConditionObject(CONDITION_ATTRIBUTES)
 setConditionParam(buff, CONDITION_PARAM_TICKS, time* TIME_SECONDS)
 setConditionParam(buff, CONDITION_PARAM_STAT_MAGICLEVEL, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_SWORD, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_CLUB, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_DISTANCE, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SKILL_SHIELD, pointsSkill)
 setConditionParam(buff, CONDITION_PARAM_SUBID, subId)
return doAddCondition(cid, buff)
end


function onSay(cid, say)
return isCreature(cid) and doCreatureSay(cid, say, TALKTYPE_SAY)
end

function savePos(uid, key)
	if isCreature(uid) then
		local pos = getCreaturePosition(uid)
		setPlayerStorageValue(uid, key, pos.x)
		setPlayerStorageValue(uid, key + 1, pos.y)
		setPlayerStorageValue(uid, key + 2, pos.z)
	end
end

function tpEffect(uid, pos, eff)
	if isCreature(uid) then
		doTeleportThing(uid, pos)
	    if eff then
		doSendMagicEffect(getCreaturePosition(uid), eff)
		end
	return true
	end
return false
end


function tpBack(uid, pos, eff)
	if isCreature(uid) then
		doTeleportThing(uid, pos)
		addEvent(doSendMagicEffect, 1, getCreaturePosition(uid), eff)
	end
end

function getPos(uid, key)
	if isCreature(uid) then
		pos = {x = getPlayerStorageValue(uid, key), y = getPlayerStorageValue(uid, key+1), z = getPlayerStorageValue(uid, key+2)}
	end
return pos
end

function removeCreature(uid)
return isCreature(uid) and doRemoveCreature(uid)
end

function removeItemPosition(item, pos)
local selectitem = getTileItemById(pos, item).uid
if selectitem > 0 then
return doRemoveItem(selectitem)
end
return false
end

function removeItemPositions(itemid, positions)
for _, pos in pairs(positions) do
removeItemPosition( itemid, pos)
end
end


function getPosDirs(p, dir) -- mkalo
    return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end
function validPos(pos)
tb = {}
for i = 1, 8 do
  newpos = getPosDirs(pos, i)
  if isWalkable(newpos) then
   table.insert(tb, newpos)
  end
end
table.insert(tb, pos)
return tb
end

function creatureMagicEffect(uid, effects)
if isCreature(uid) then
    for _, effect in pairs(effects) do
        if effect[3] and isCreature(getCreatureTarget(uid)) then
        local eff_Pos = getCreaturePosition(getCreatureTarget(uid))
        doSendMagicEffect({x=eff_Pos.x+effect[2][1], y=eff_Pos.y+effect[2][2], z=eff_Pos.z}, effect[1])
		elseif not effect[3] then
		local eff_Pos = getCreaturePosition(uid)
        doSendMagicEffect({x=eff_Pos.x+effect[2][1], y=eff_Pos.y+effect[2][2], z=eff_Pos.z}, effect[1])
        end
	end
return true
end
return false
end

function creatureShootEffects(uid, effects)
if isCreature(uid) and isCreature(getCreatureTarget(uid)) then
    for _, effect in pairs(effects) do
    local fromPos = effect[4] and getCreaturePosition(getCreatureTarget(uid)) or getCreaturePosition(uid)
    local toPos = effect[4] and getCreaturePosition(uid) or getCreaturePosition(getCreatureTarget(uid))
    doSendDistanceShoot({x= fromPos.x+effect[2][1], y= fromPos.y+effect[2][2], z= fromPos.z}, effect[3] and {x= toPos.x+effect[3][1], y= toPos.y+effect[3][2], z= toPos.z} or toPos, effect[1])
    end
return true
end
return false
end

function creatureShootEffectsFullTarget(uid, effects)
if isCreature(uid) and isCreature(getCreatureTarget(uid)) then
    for _, effect in pairs(effects) do
    local fromPos = getCreaturePosition(getCreatureTarget(uid))
    doSendDistanceShoot({x= fromPos.x+effect[2][1], y= fromPos.y+effect[2][2], z= fromPos.z}, effect[3] and {x= fromPos.x+effect[3][1], y= fromPos.y+effect[3][2], z= fromPos.z} or fromPos, effect[1])
    end
return true
end
return false
end

function attackDistFullTarget(cid, combat, var, dist_config)
return isCreature(cid) and creatureShootEffectsFullTarget(cid, dist_config) and doCombat(cid, combat, var)
end

function attackdist(cid, combat, var, dist_config)
return isCreature(cid) and creatureShootEffects(cid, dist_config) and doCombat(cid, combat, var)
end

function attackmagic(cid, combat, var, magic_config)
return isCreature(cid) and creatureMagicEffect(cid, magic_config) and doCombat(cid, combat, var)
end

function effect(uid, adjust, eff)
    if isCreature(uid) then
    local t_Pos = getCreaturePosition(uid)
    doSendMagicEffect({x=t_Pos.x+adjust[1], y=t_Pos.y+adjust[2], z=t_Pos.z}, eff)
    return true
    end
return false
end

function checkExhausted(cid, storage, seconds)
	local v = exhaustion.get(cid, storage)
	if(not v) then
		exhaustion.set(cid, storage, seconds)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Waiting " .. v .. " second".. (v > 1 and "s" or "") .." for use command again.")
		return false
	end
	return true
end


function xpAkat(cid)
    if getPlayerStorageValue(cid, 89745) > 0 or getPlayerStorageValue(cid, 89746) > 0 then
    return 0.1
    end
return 0
end

function teleportAllPlayersInArea(area, toPosition, level, eff)
local players = getAllPlayersInArea(area[1], area[2])
    for _, player in pairs (players) do
	    if getPlayerLevel(player) >= level then
	    doTeleportThing(player, toPosition)
	    doSendMagicEffect(getCreaturePosition(player), eff or 0)
		end
	end
doSendMagicEffect(toPosition, eff or 0)
return true
end
