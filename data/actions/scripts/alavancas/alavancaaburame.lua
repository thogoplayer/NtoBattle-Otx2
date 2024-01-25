local req = {
{i=15487, q=1}, -- i = id do item, q=quantidade
{i=10199, q=10} -- i = id do item, q=quantidade
}
local win = {i=15489, q=1} -- i = id do item, q = quantidade que vai receber
function onUse(cid, item, frompos, item2, topos)

if getPlayerItemCount(cid, req[1].i) >= req[1].q and getPlayerItemCount(cid, req[2].i) >= req[2].q then
doPlayerRemoveItem(cid, req[1].i, req[1].q)
doPlayerRemoveItem(cid, req[2].i, req[2].q) 
doPlayerAddItem(cid, win.i, win.q)
doPlayerSendTextMessage(cid, 20, "Voce recebeu "..win.q.."x "..getItemNameById(win.i)..".")
else
doPlayerSendTextMessage(cid, 20, "Voce precisa de "..req[1].q.."x "..getItemNameById(req[1].i).." e "..req[2].q.."x "..getItemNameById(req[2].i)..".")
end
return true
end