local config = {
    mirrorArea = {
        {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
        {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
        {0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
        {0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0},
        {1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
        {1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
        {1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
        {0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0},
        {0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
        {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
        {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}, 
    },
	
	damageArea = {
        {0, 0, 1, 1, 1, 0, 0},
        {0, 1, 1, 1, 1, 1, 0},
        {1, 1, 1, 1, 1, 1, 1}, 
        {1, 1, 1, 2, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1},
        {0, 1, 1, 1, 1, 1, 0},
        {0, 0, 1, 1, 1, 0, 0},     
    },
	
    effect = 140,          --Efeito.
    wallId = 14465,          --ID da parede.
    time = 5,              --Duração da parede.
    cooldown = 90,  
    storage = 9571,
	hit = {9, 8, 600, 920}, --- danos percent, quantidade de hit, delay, effect
	delay_effect_again = 15
}


local function removePlayerGhost(uid)
if isCreature(uid) then
doCreatureExecuteTalkAction(uid, "/ghost", true)
setPlayerGroupId(uid, 1)
end
end

local function damageMirror(uid, count, cid)
if isCreature(uid) and isPlayer(cid) then
if count > 0 and getPlayerModes(cid).secure == 1 then
local u_Pos = getCreaturePosition(uid)
doCreatureAddHealth(uid, - getCreatureMaxHealth(uid)/100*config.hit[1])
doSendMagicEffect({x=u_Pos.x+2, y=u_Pos.y+2, z=u_Pos.z}, config.hit[4])
addEvent(damageMirror, config.hit[3], uid, count -1, cid)
end
end
end


local function createMirror(cid)
local c_Pos = getCreaturePosition(cid)
local positionsMirror = {}
for _, pos in pairs(getPosfromArea(cid, config.mirrorArea)) do
    if isWalkable(pos, true) then
    -- local creature = getTopCreature(pos).uid
        -- if creature > 0 and isPlayer(creature) then
        -- local tp = false
        -- local dir = 0
            -- while(not tp) do
            -- local tp_Pos = getPositionByDirection(c_Pos, dir)
                -- if dir == 8 then
                -- doTeleportThing(creature, c_Pos)
                -- tp = true
                -- elseif isWalkable(tp_Pos) then
                -- doTeleportThing(creature, tp_Pos)
                -- tp = true
                -- dir = dir +1
                -- end
            -- end
        -- end
        doCreateItem(config.wallId, 1, pos)
        doSendMagicEffect(pos, config.effect)
        table.insert(positionsMirror, pos)
    end
end
	
addEvent(removeItemPositions, config.time * TIME_SECONDS, config.wallId, positionsMirror)	
end

local function validateCreature(cid, cr)
return isPlayer(cr) and cid ~= cr and getPlayerLevel(cr) >= 200 and getPlayerGroupId(cr) < 3 and not (isInParty(cid) and isInParty(cr) and getPlayerParty(cid) == getPlayerParty(cr))
end

local function addDamageMirror(cid)
setPlayerGroupId(cid, 2)
doCreatureExecuteTalkAction(cid, "/ghost", true)
addEvent(removePlayerGhost, config.time * TIME_SECONDS, cid)
for _, pos in pairs(getPosfromArea(cid, config.damageArea)) do
    if isWalkable(pos, true) then
        local cr = getTopCreature(pos).uid
        if validateCreature(cid, cr) then		
            if getPlayerStorageValue(cr, config.storage+1) < os.time() then
		    setPlayerStorageValue(cr, config.storage+1, os.time() + config.delay_effect_again)
		    damageMirror(creature, config.hit[2], cid)
            end
		end
    end 
end

end

function onCastSpell(cid)
if getPlayerStorageValue(cid, config.storage) > os.time() then doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).") return false end
setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
createMirror(cid)
setCreatureBattleLockTime(cid, config.hit[3]*config.hit[2]/1000)
addDamageMirror(cid)
return true
end