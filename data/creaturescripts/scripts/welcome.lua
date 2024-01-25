local texto = [[        Nto Battle!!

Seja bem vindo ao Nto Battle
Site: http://www.ntobattle.com.br
Equipe NTOBATTLE
]]

function onLogin(cid)
if getPlayerStorageValue(cid, 12231) < 1 and getPlayerAccountManager(cid) == MANAGER_NONE then
doShowTextDialog(cid, 2175, texto)
setPlayerStorageValue(cid, 12231, 1)
end
return true
end