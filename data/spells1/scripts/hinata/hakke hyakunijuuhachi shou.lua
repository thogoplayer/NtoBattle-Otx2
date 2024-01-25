local quant_hit = 4 -- quantidade de hit's que ira dar no target 
local timeHit = 0.5 -- segundos de diferença para cada hit

local quant_sqm = 3 -- sqms que ira empurrar o target
local sqmTime = 0.01 -- segundos para empurrar após hitar, exemplo de meio segundo.

local playerEffect = 191 -- efeito no player.

local tiles_exception = {8277,8283,410,459,6169,6130,411,369,1385,1394,1395,5260,9574,9573,5023,1387,470,4836} -- sqms que não podera ser criado os itens, ou seja, os buracos de escada.

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3000) 
setConditionParam(condition, CONDITION_PARAM_SPEED, -40000)
setConditionFormula(condition, 0, 0, 0, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
if target > 0 then
	local position_target = nil
	local cont = 0
	for i=-1, 1 do
		for j=-1,1 do
			position_target = {x=getCreaturePosition(target).x+i, y=getCreaturePosition(target).y+j, z=getCreaturePosition(target).z}
			if isWalkable(position_target) then
				cont = cont+1
				break
			end
		end
		if cont > 0 then
			break
		end
		position_target = nil
	end
	
	local px = math.random(-1,1)
	local py = 0
	if px == -1 or px == 1 then
		py = 0
	elseif px == 0 then 
		local n = {1,-1}
		py = n[math.random(1,#n)]
	end	
	local poscentral = {x=getCreaturePosition(target).x+px, y=getCreaturePosition(target).y+py, z=getCreaturePosition(target).z}
	if isWalkable(poscentral) then
		position_target = poscentral
	end
	
	if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(target)) <= 1 then
		position_target = getCreaturePosition(cid)
	end
	
	if position_target == nil then
		doPlayerSendCancel(cid, "Você não pode atravesar isso!")
		return false
	end
	local pos = position_target
	posTile1 = {{x=pos.x,y=pos.y,z=pos.z,stackpos=1}, 7524} -- embaixo do player
	posTile2 = {{x=pos.x+1,y=pos.y+1,z=pos.z,stackpos=1}, 7520}
	posTile3 = {{x=pos.x+1,y=pos.y,z=pos.z,stackpos=1}, 7523}
	posTile4 = {{x=pos.x+1,y=pos.y-1,z=pos.z,stackpos=1}, 7526}
	posTile5 = {{x=pos.x,y=pos.y-1,z=pos.z,stackpos=1}, 7500}
	posTile6 = {{x=pos.x-1,y=pos.y-1,z=pos.z,stackpos=1}, 7501}
	posTile7 = {{x=pos.x-1,y=pos.y,z=pos.z,stackpos=1}, 7525}
	posTile8 = {{x=pos.x-1,y=pos.y+1,z=pos.z,stackpos=1}, 7522}
	posTile9 = {{x=pos.x,y=pos.y+1,z=pos.z,stackpos=1}, 7521}
	posAllTeste = {posTile1,posTile2,posTile3,posTile4,posTile5,posTile6,posTile7,posTile8,posTile9}
	posAll = {}
	for i=1, #posAllTeste do
		if isWalkable(posAllTeste[i][1]) then
			posAll[#posAll+1] = posAllTeste[i]
		end
	end
	if position_target ~= nil then
		doTeleportThing(cid, position_target)			
		local tempo = 0
		while (tempo ~= quant_hit*(timeHit*1000)) do
			addEvent(sendEffect13, tempo, cid, target)
			tempo = tempo + 500
		end
		tempo = 0
		while (tempo ~= quant_hit*(timeHit*1000)) do
			addEvent(hitTarget3, tempo, cid, target)
			tempo = tempo + (timeHit*1000)
		end
		local temp = tempo
		while (tempo ~= temp+quant_sqm*(sqmTime*1000)) do
			addEvent(empurrar1Target, tempo, cid, target, tempo, posAll)
			tempo = tempo + (sqmTime*1000)
		end
		doAddCondition(cid, condition)
		doAddCondition(target, condition)
		local mana_hit = (getPlayerLevel(cid)*2 + getPlayerMagLevel(cid)*2 + 1400)
		doCreatureAddMana(target, -mana_hit)
		for o=1, #posAll do
			local check = true
			for j=0, 255 do
				pos_stack = {x=posAll[o][1].x,y=posAll[o][1].y,z=posAll[o][1].z,stackpos=j}
				removeTile = getThingfromPos(pos_stack)
				if isInArray(tiles_exception, removeTile.itemid) then
					check = false
				end
			end
			if check then
				if isWalkable(posAll[o][1]) then
					doCreateItem(posAll[o][2], 1, posAll[o][1])
				end
			end
		end
		return true
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	end
else
	doPlayerSendCancel(cid, "Você precisa de um target!")
end
end


function hitTarget3(cid, target)
if isCreature(target) and isPlayer(cid) then
	local effect13 = 9 -- efeito do hit na creatura.
	doAddCondition(target, condition)
	doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, -getHit3(cid), -getHit3(cid), effect13)
end
end

function getHit3(cid)
local hit3 = getPlayerLevel(cid)*1 + getPlayerMagLevel(cid)*1 + math.random(6700,7500)
return hit3
end

function empurrar1Target(cid, target, tempo, posAll)
if isPlayer(cid) then
	doRemoveCondition(cid, CONDITION_PARALYZE)
end
if not isCreature(target) then
	for k=1, #posAll do
		for j=0, 255 do
			pos_stack = {x=posAll[k][1].x,y=posAll[k][1].y,z=posAll[k][1].z,stackpos=j}
			removeTile = getThingfromPos(pos_stack)
			if removeTile.itemid == posAll[k][2] then
				doRemoveItem(removeTile.uid)
			end
		end
	end
end
if isCreature(target) and isPlayer(cid) then
	local positions = nil
	doAddCondition(target, condition)
	if getPlayerLookDir(cid) == 0 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 1 then
        positions = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 2 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 3 then
       positions = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    end
	if positions ~= nil and isWalkable(positions) then
		doTeleportThing(target, positions)
	end
	local tp = sqmTime*1000*(quant_sqm-1)+quant_hit*timeHit*1000
	if tempo == tp then
		doRemoveCondition(target, CONDITION_PARALYZE)
		for k=1, #posAll do
			for j=0, 255 do
				pos_stack = {x=posAll[k][1].x,y=posAll[k][1].y,z=posAll[k][1].z,stackpos=j}
				removeTile = getThingfromPos(pos_stack)
				if removeTile.itemid == posAll[k][2] then
					doRemoveItem(removeTile.uid)
				end
			end
		end
	end	
end
end

function sendEffect13(cid, target)
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
if isCreature(target) and isPlayer(cid) then
	doSendMagicEffect(position1, playerEffect) 
end
end