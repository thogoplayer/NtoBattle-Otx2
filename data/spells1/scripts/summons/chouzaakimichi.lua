local AURASYSTEM_STORAGE = 200001 -- STORAGE DE CONTROLE
local AURASYSTEM_AURA_DELAY = 0.1


local AURASYSTEM_CONFIG = {
        DURATION = 10, -- O tempo de duração da aura
        DELAY = 0.1, -- O delay, quanto menor, mais rápida a aura será.
        TYPE = "holy", -- O tipo de aura. [fire/ice/energy/earth/death/holy/all]
        DAMAGE = {-14100, -15800} -- O dano da aura
}

local AURASYSTEM_DIRECTIONS = {
        [NORTH] = {
                {0, 0}, {1, 0}, {1, 1}, {1, 2}, {0, 2}, {-1, 2}, {-1, 1}, {-1, 0}
        },
        [EAST] = {
                {0, 0}, {0, 1}, {-1, 1}, {-2, 1}, {-2, 0}, {-2, -1}, {-1, -1}, {0, -1}
        },
        [SOUTH] = {
                {0, 0}, {-1, 0}, {-1, -1}, {-1, -2}, {0, -2}, {1, -2}, {1, -1}, {1, 0}
        },
        [WEST] = {
                {0, 0}, {0, -1}, {1, -1}, {2, -1}, {2, 0}, {2, 1}, {1, 1}, {0, 1}
        }
}

local AURASYSTEM_TEMPLATES = {
        ["fire"] = {COMBAT_FIREDAMAGE, CONST_ME_FIREATTACK},
        ["ice"] = {COMBAT_ICEDAMAGE, CONST_ME_ICEATTACK},
        ["earth"] = {COMBAT_EARTHDAMAGE, CONST_ME_SMALLPLANTS},
        ["energy"] = {COMBAT_ENERGYDAMAGE, CONST_ME_PURPLEENERGY},
        ["holy"] = {COMBAT_PHYSICALDAMAGE, 180},
        ["death"] = {COMBAT_DEATHDAMAGE, 210},
        ["all"] = {
                {COMBAT_FIREDAMAGE, CONST_ME_FIREATTACK},
                {COMBAT_ICEDAMAGE, CONST_ME_ICEATTACK},
                {COMBAT_EARTHDAMAGE, CONST_ME_SMALLPLANTS},
                {COMBAT_ENERGYDAMAGE, CONST_ME_PURPLEENERGY},
                {COMBAT_HOLYDAMAGE, CONST_ME_HOLYDAMAGE},
                {COMBAT_DEATHDAMAGE, CONST_ME_MORTAREA}
        }
}

local AURASYSTEM_COUNT = 1

function doPlayerCastAura3(cid, position)
        if getCreatureStorage(cid, AURASYSTEM_STORAGE) == -1 then
        
        end
          
        local PLAYER_LOOKDIRECTION = getCreatureLookDirection(cid)

        local tmp = AURASYSTEM_DIRECTIONS[PLAYER_LOOKDIRECTION][AURASYSTEM_COUNT]
        local position = getPositionByDirection(getThingPosition(cid), PLAYER_LOOKDIRECTION, 1)

        position.x = position.x + tmp[1]
        position.y = position.y + tmp[2]

        if AURASYSTEM_CONFIG.TYPE == "all" then
                local x = AURASYSTEM_TEMPLATES[AURASYSTEM_CONFIG.TYPE]
                local r = math.random(1, #x)
                doAreaCombatHealth(cid, x[r][1], position, 0, AURASYSTEM_CONFIG.DAMAGE[1], AURASYSTEM_CONFIG.DAMAGE[2], x[r][2])
        else
                doAreaCombatHealth(cid, AURASYSTEM_TEMPLATES[AURASYSTEM_CONFIG.TYPE][1], position, 0, AURASYSTEM_CONFIG.DAMAGE[1], AURASYSTEM_CONFIG.DAMAGE[2], AURASYSTEM_TEMPLATES[AURASYSTEM_CONFIG.TYPE][2])
        end

        if getCreatureStorage(cid, AURASYSTEM_STORAGE) > os.time() then
                addEvent(doPlayerCastAura3, AURASYSTEM_CONFIG.DELAY * 1000, cid)
        end

        AURASYSTEM_COUNT = AURASYSTEM_COUNT + 1
        if AURASYSTEM_COUNT > #AURASYSTEM_DIRECTIONS[PLAYER_LOOKDIRECTION] then
                AURASYSTEM_COUNT = 1
        end
end

function onCastSpell(cid, var)
        if getCreatureStorage(cid, AURASYSTEM_STORAGE) > os.time() then
                return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
        end

        doCreatureSetStorage(cid, AURASYSTEM_STORAGE, os.time() + AURASYSTEM_CONFIG.DURATION)
        return doPlayerCastAura3(cid)
end