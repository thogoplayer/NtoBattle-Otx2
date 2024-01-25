function getFixedText(cid, text, replace)

local wrongWords = {"otservlist.org", "ots-list.pl", "google.br", "83.17.165.189", "hopto.org", "no-ip.org", ".com"}

local lowerText = string.lower(text)

local noSpaceText = string.gsub(string.gsub(string.gsub(lowerText, "%s", ""), "%p", ""),"-", "")

for w = 1, #wrongWords do

wordLen = string.len(wrongWords[w])

for p = 1, string.len(text) do

if(string.sub(lowerText, p, p+wordLen-1) == wrongWords[w]) then

text = string.sub(text, 1, p-1) .. string.rep(replace, wordLen) .. string.sub(text, p+wordLen)

end

end

end


if(string.lower(text) == lowerText) then

for c = 1, #wrongWords do

if(string.find(noSpaceText, string.gsub(string.gsub(wrongWords[c], "%p", ""),"-", "")) ~= nil) then

return "I want to post forbidden links.."

end

end

end

return text

end


--[[Channels which are not added to block:

1 - Party Channel

2 - Channel for Staff members

3 - Rule Violation Channel

4 - Channel for Counselors/Tutors

65536 - Private Chat Channel <-- Private Chat cannot be blocked with this script

]]--

local blocked_channels = {2,3,4, 5, 9, 7} --Game-Chat, Real Chat, Help Channel

local trade_channels = {6} --All trade channels <- These are also blocked

local replace = "°" --Symbols which are shown instead of forbidden links -> °

local delay = {16246,5} -- {empty_storage, lenght of muted}


function onSay(cid, words, param, channel)

local fixedWords = getFixedText(cid, words, replace)


if words ~= fixedWords and getPlayerAccess(cid) == 0 then

if getPlayerStorageValue(cid,delay[1]) > os.time() then

return doPlayerSendCancel(cid,"You are still muted for ".. getPlayerStorageValue(cid,delay[1])-os.time() .." seconds.")

end

setPlayerStorageValue(cid,delay[1],os.time()+delay[2])

if channel == CHANNEL_DEFAULT then

doCreatureSay(cid, fixedWords, TALKTYPE_SAY)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Link: "..words.." is forbidden.")

return true

elseif isInArray(trade_channels, channel) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Link: "..words.." is forbidden on the trade channel.")

return true

elseif isInArray(blocked_channels, channel) then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Link: "..words.." is forbidden.")

doPlayerSendChannelMessage(cid, getCreatureName(cid), fixedWords, TALKTYPE_CHANNEL_Y, channel)

return true

end

end

return false

end