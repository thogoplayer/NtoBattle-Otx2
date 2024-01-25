-- This script is part of Biohazard Event System
-- Copyright (C) 2012 XTibia, Oneshot
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


-- Main config.

BIOHAZARD_DEFAULT_MAX_PLAYERS = 10

BIOHAZARD_IGNORE_GROUP_ID = 4

BIOHAZARD_ARENA_ENTER_POSITION = {x = 919, y = 669, z = 7}
BIOHAZARD_ARENA_KICK_POSITION = {x = 1014, y = 893, z = 7}

BIOHAZARD_GLOBAL_STATUS = 67600
BIOHAZARD_GLOBAL_MAX_PLAYERS = 67601

BIOHAZARD_PLAYER_STATUS = 67600
BIOHAZARD_PLAYER_NEMESIS_HEALTH = 67601

BIOHAZARD_NEMESIS_MAX_HEALTH = 100000

-- Main functions.

function doSetBiohazardMaxPlayers(amount)
        doSetStorage(BIOHAZARD_GLOBAL_MAX_PLAYERS, amount)
        return true
end

function getBiohazardMaxPlayers()
        return getStorage(BIOHAZARD_GLOBAL_MAX_PLAYERS)
end

function getBiohazardPlayerStatus(cid)
        return getCreatureStorage(cid, BIOHAZARD_PLAYER_STATUS)
end

function doSetBiohazardPlayerStatus(cid, status)
        doCreatureSetStorage(cid, BIOHAZARD_PLAYER_STATUS, status)
        return true
end

function doBiohazardAddPlayer(cid)
        doTeleportThing(cid, BIOHAZARD_ARENA_ENTER_POSITION)
        if getPlayerGroupId(cid) < BIOHAZARD_IGNORE_GROUP_ID then
                doCreatureSetStorage(cid, BIOHAZARD_PLAYER_STATUS, 1)
        end
        return true
end

function doBiohazardKickPlayer(cid)
        doTeleportThing(cid, BIOHAZARD_ARENA_KICK_POSITION)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        doCreatureSetStorage(cid, BIOHAZARD_PLAYER_STATUS, -1)
        return true
end

function getBiohazardEventPlayers()
        local ret = {}
        for _, cid in ipairs(getPlayersOnline()) do
                if cid and getCreatureStorage(cid, BIOHAZARD_PLAYER_STATUS) >= 1 then
                        table.insert(ret, cid)
                end
        end
        return ret
end

function doBiohazardChooseNemesis()
        local players = getBiohazardEventPlayers()
        local cid = players[math.random(1, #players)]

        doSetCreatureOutfit(cid, {lookType = 264}, -1)
        doCreatureSetStorage(cid, BIOHAZARD_PLAYER_NEMESIS_HEALTH, BIOHAZARD_NEMESIS_MAX_HEALTH)
        doCreatureSetStorage(cid, BIOHAZARD_PLAYER_STATUS, 2)
        return true
end

function isNemesis(cid)
        return getCreatureStorage(cid, BIOHAZARD_PLAYER_STATUS) == 2
end

function getBiohazardNemesis()
        local ret
        for _, cid in ipairs(getBiohazardEventPlayers()) do
                if getCreatureStorage(cid, BIOHAZARD_PLAYER_STATUS) == 2 then
                        ret = cid
                        break
                end
        end
        return ret
end