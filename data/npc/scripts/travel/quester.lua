local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local storage,pos = 130,{x=1067, y=877, z=7}
if isInArray({"teleporto","teleport","teleporte","entrar"}, msg) then
npcHandler:say("Okay, I already tell you that you have to have 4 companions to do the quest together with you, do you want to go to the place where the {start} of the quest is?.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","inicio"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Good luck in the quest, you in 3 more have to stay on top of the red floors and one of you pull the lever!", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("You have already completed this quest, you can no longer go to the location", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Okay, come back when you want to do the same and organize a team!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())