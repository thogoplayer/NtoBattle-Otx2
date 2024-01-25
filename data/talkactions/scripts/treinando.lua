    local time = 5    -- 1 = 1 sec, 2 = 2 sec, ...
    local timeEnd = 12
    local say_events = {}
	local area = {
        {1, 1, 1}, 
        {1, 2, 1},
        {1, 1, 1}, 
    }
	
local function isAreaTrainer(cid)
    for _, pos in pairs(getPosfromArea(cid, area)) do
    local creature = getTopCreature(pos).uid
	    if isMonster(creature) and getCreatureName(creature) == "Trainer" then
	    return true
	    end
    end
return false
end
	
local function SayText(cid, count)
    if isPlayer(cid) == true then
         if say_events[getPlayerGUID(cid)] ~= nil then
             if isPlayer(cid) == true then
                 doSendAnimatedText(getPlayerPosition(cid),"TREINANDO!", math.random(01,255))
             end
			 if count < timeEnd then
             say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 1000, cid, count+1)
			 else
			 say_events[getPlayerGUID(cid)] = nil
			 doCreatureSetNoMove(cid, false)
			 doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Afk time finish.")
             end			 
         end                                                       
    end
    return true
end
function onSay(cid, words, param, channel) 
    if(param == '') then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
     return true
     end
     if param == "on" then
	 if not isAreaTrainer(cid) then doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Somente em area de trainer") return true end
	 if say_events[getPlayerGUID(cid)] then 
	 stopEvent(say_events[getPlayerGUID(cid)])
	 end
        if isPlayer(cid) == true then
            doSendAnimatedText(getPlayerPosition(cid),"TREINANDO!", math.random(01,255))
        end
		doCreatureSetNoMove(cid, true)
        say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 1000, cid, 1)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"You Now Stated you are (afk).")
     elseif param == "off" then
	 doCreatureSetNoMove(cid, false)
            stopEvent(say_events[getPlayerGUID(cid)])
            say_events[getPlayerGUID(cid)] = nil
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"You Now stated your are not (afk).")
    end
    return true
end
