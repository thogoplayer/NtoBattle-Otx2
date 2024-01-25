time = 8000
tempo = 8000
local condition = createConditionObject(CONDITION_PACIFIED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 4000)
local invisible = createConditionObject(CONDITION_GAMEMASTER, 4000, false, GAMEMASTER_INVISIBLE)
local outfit = createConditionObject(CONDITION_INVISIBLE, 4000, false)
 
local function removeGhost(player)
    local newPlayer = getPlayerByGUID(player)
    if isCreature(newPlayer) then
        if isPlayerGhost(newPlayer) then
            doCreatureExecuteTalkAction(newPlayer, "/theghostaberto", true)
        end
        if getPlayerGroupId(newPlayer) < 6 then
            setPlayerGroupId(newPlayer, 1)
        end
        if isPlayerGhost(newPlayer) then
            addEvent(removeGhost, 1000, player)
        end
    else
        addEvent(removeGhost, 1000, player)
    end
end 
 
function onCastSpell(cid, var)
local storage = 100769
local waittime = 60
local tempo = 8
local delay = 98121
local delay2 = 8
if exhaustion.check(cid, delay) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, delay2) .. " segundos para usar uma fuga novamente.")
return false
end
	
if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
local removeTarget = getCreatureTarget(cid) 
doPlayerRemoveTarget(removeTarget) 
doPlayerRemoveTarget(cid) 
local bijuu = jin.getPlayerBijuu(cid)
if bijuu then
if not getCreatureCondition(cid, CONDITION_ATTRIBUTES, 988) then
doSetCreatureOutfit(cid, {lookType = 2312}, 8000)
doCreatureExecuteTalkAction(cid, "/theghostaberto", TRUE)
doCombat(cid, combat, var)
exhaustion.set(cid, STORAGE_IMORTAL, 8)
exhaustion.set(cid, STORAGE_BLOCKATTACK, 8)
exhaustion.set(cid, STORAGE_TARGET, 8)
local player = getPlayerGUID(cid)
addEvent(function()
if isCreature(cid) then
removeGhost(player)
doPlayerSendTextMessage(cid, 27, "Você perdeu o modo Invisible")
end
end, 8000)
local pos = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 500, {x = pos.x, y = pos.y, z = pos.z}, 5)
        else
            doPlayerSendCancel(cid, "Sorry, you are transformed.")
        end
    else
        return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você precisa selar algum bijuu para usar seu buff.")
    end
	exhaustion.set(cid, storage, waittime)
	exhaustion.set(cid, delay, delay2)
    return true
end