grouprequired = 3
jailedstoragevalue_time = 1338
jailedstoragevalue_bool = 1339
local jailpos = {
[1] = {x= 1995, y=1991, z= 9},
[2] = {x= 1995, y=1987, z= 9},
[3] = {x= 1995, y=1983, z= 9},
[4] = {x= 1995, y=1979, z= 9},
[5] = {x= 2006, y=1979, z= 9},
[6] = {x= 2006, y=1987, z= 9},
[6] = {x= 2006, y=1991, z= 9},
[7] = {x= 1995, y=1991, z= 8},
[8] = {x= 1995, y=1987, z= 8},
[9] = {x= 1995, y=1983, z= 8},
[10] = {x= 1995, y=1979, z= 8},
[11] = {x= 2006, y=1979, z= 8},
[12] = {x= 2006, y=1987, z= 8},
[13] = {x= 2006, y=1991, z= 9}
}
local unjailpos = {x= 2007, y=1987, z= 7}
local from1,to1 = {x=1017, y=905, z=9},{x=1030, y=907, z=9}
local from2,to2 = {x=1017, y=913, z=9},{x=1030, y=915, z=9}
jail_list = {}
jail_list_work = 0

function checkJailList(param)
    addEvent(checkJailList, 1000, {})
    for targetID,player in ipairs(jail_list) do
        if isPlayer(player) == true then
            if getPlayerStorageValue(player, jailedstoragevalue_time) < os.time() then
                doTeleportThing(player, unjailpos, true)
                setPlayerStorageValue(player, jailedstoragevalue_time, 0)
                setPlayerStorageValue(player, jailedstoragevalue_bool, 0)
                table.remove(jail_list,targetID)
                doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, 'You got out of jail! Think before you do certain things. Take care friend.')
            end
        else
            table.remove(jail_list,targetID)
        end
    end
end


function onSay(cid, words, param, channel)
    if(param == '') then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o Nome do Player.")
        return true
    end
    local t = string.explode(param, ",")
    if jail_list_work == 0 then
        jail_list_work = addEvent(checkJailList, 1000, {})
    end
    local jail_time = -1
    for word in string.gmatch(tostring(t[1]), "(%w+)") do
        if tostring(tonumber(word)) == word then
            jail_time = tonumber(word)
        end
    end
    local isplayer = getPlayerByName(t[1])
    if isPlayer(isplayer) ~= true then
        isplayer = getPlayerByName(string.sub(t[1], string.len("jail_time")+1))
        if isPlayer(isplayer) ~= true then
            isplayer = getPlayerByName(string.sub(t[1], string.len("jail_time")+2))
            if isPlayer(isplayer) ~= true then
                isplayer = getPlayerByName(string.sub(t[1], string.len("jail_time")+3))
            end
        end
    end
    local default_jail = 300
    if(t[2]) then
        default_jail = t[2]
    end
    if jail_time ~= -1 then
        jail_time = jail_time * 60
    else
        jail_time = default_jail
    end
    
    if (words == '!prender' or words == '/prender') then
        if getPlayerGroupId(cid) >= grouprequired then
            if isPlayer(isplayer) == true then
                    doTeleportThing(isplayer, jailpos[math.random(#jailpos)], true)
                    setPlayerStorageValue(isplayer, jailedstoragevalue_time, os.time()+jail_time)
                    setPlayerStorageValue(isplayer, jailedstoragevalue_bool, 1)
                    table.insert(jail_list,isplayer)
                    doPlayerSendTextMessage (cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You arrested Shinobi: '.. getCreatureName(isplayer) ..' up until ' .. os.date("%H:%M:%S", getPlayerStorageValue(isplayer, jailedstoragevalue_time)) .. ' (Now is: ' .. os.date("%H:%M:%S", os.time()) .. ').')
                    doPlayerSendTextMessage (isplayer, MESSAGE_STATUS_CONSOLE_ORANGE, 'You were arrested for: '.. getCreatureName(cid) ..' up until ' .. os.date("%H:%M:%S", getPlayerStorageValue(isplayer, jailedstoragevalue_time)) .. ' (Now is: ' .. os.date("%H:%M:%S", os.time()) .. ').')
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This Shinobi does not exist or is offline.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are not allowed to arrest shinobi.")
        end
  elseif (words == '!desprender' or words == '/desprender') then
        if getPlayerGroupId(cid) >= grouprequired then
            if isPlayer(isplayer) == true then
                if getPlayerStorageValue(isplayer, jailedstoragevalue_bool) == 1 then
                    doTeleportThing(isplayer, unjailpos, true)
                    setPlayerStorageValue(isplayer, jailedstoragevalue_time, 0)
                    setPlayerStorageValue(isplayer, jailedstoragevalue_bool, 0)
                    table.remove(jail_list,targetID)
                    doPlayerSendTextMessage(isplayer, MESSAGE_STATUS_CONSOLE_ORANGE, 'The staff '.. getCreatureName(cid) ..' got you out of prison. See you soon!')
                    doPlayerSendTextMessage (cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'You got Shinobi out of prison: '.. getCreatureName(isplayer) ..'.')
                else
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This Shinobi is not trapped.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This Shinobi does not exist or is offline.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are not allowed to arrest Shinobis.")
        end
    end
    return true
end
