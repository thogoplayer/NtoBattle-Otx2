local offsets = {
        [0] = {{0, 0}, {1, 0}, {1, 1}, {1, 2}, {0, 2}, {-1, 2}, {-1, 1}, {-1, 0}},
        [1] = {{0, 0}, {0, 1}, {-1, 1}, {-2, 1}, {-2, 0}, {-2, -1}, {-1, -1}, {0, -1}},
        [2] = {{0, 0}, {-1, 0}, {-1, -1}, {-1, -2}, {0, -2}, {1, -2}, {1, -1}, {1, 0}},
        [3] = {{0, 0}, {0, -1}, {1, -1}, {2, -1}, {2, 0}, {2, 1}, {1, 1}, {0, 1}}
}

local storage = 88888

local k = 1

local duration = 30

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 194)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 10, 10, 2.4, 2.4)

function onCastAura(cid, lastDirection)
        local position = getPositionByDirection(getThingPosition(cid), lastDirection, 1)
        local offset = offsets[lastDirection][(k > #offsets[lastDirection] and ((k % #offsets[lastDirection]) == 0 and #offsets[lastDirection] or (k % #offsets[lastDirection])) or k)]
        local tmp = {x = position.x + offset[1], y = position.y + offset[2], z = position.z}
        doCombat(cid, combat, positionToVariant(tmp))
        doCreatureSetLookDirection(cid, lastDirection)
        if os.time() < getCreatureStorage(cid, storage) then
                addEvent(onCastAura, 100, cid, getCreatureLookDirection(cid))
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Aura effect ended.")
                mayNotMove(cid, false)
        end
        k = k + 1
end

function onCastSpell(cid, var)
        doCreatureSetStorage(cid, storage, os.time() + duration)
        mayNotMove(cid, true)
        onCastAura(cid, getCreatureLookDirection(cid))
        return true
end