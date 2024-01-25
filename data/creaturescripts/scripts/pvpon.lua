function onCombat(cid, target)
    if isPlayer(cid) and isPlayer(target) then
    if getPlayerModes(cid).secure == 0 then
      doPlayerSendCancel(cid, "Voce este com o modo PvP desligado. Se quiser atacar outros jogadores, ative a kunai de seguranca.")
      return false
     end
	end
   return true
end
function onTarget(cid, target)
    if isPlayer(cid) and isPlayer(target) then
    if getPlayerModes(cid).secure == 0 then
      doPlayerSendCancel(cid, "Voce este com o modo PvP desligado. Se quiser atacar outros jogadores, ative a kunai de seguranca.")
      return false
     end
	end
   return true
end


 
function onLogin(cid)
 registerCreatureEvent(cid, "PvPCombat")
 registerCreatureEvent(cid, "PvPCombat2")
 return true
end