function onCombat(cid, target)
if(isPlayer(cid) and isPlayer(target)) then
if(getConfigValue("noDamageToGuildMates") and getPlayerGuildId(cid) > 0 and getPlayerGuildId(cid) == getPlayerGuildId(target)) then
return false
elseif(getConfigValue("noDamageToPartyMembers") and isInParty(target) and getPartyLeader(target) == getPartyLeader(cid)) then
return false	
end
end
return true
end