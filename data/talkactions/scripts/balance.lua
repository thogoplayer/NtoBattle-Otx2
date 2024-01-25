function onSay(cid, words, param, channel)
                if(getPlayerBalance(cid) < 1) then
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have money on your bank balance.")
                    return true
                end
			    doPlayerAddMoney(cid, getPlayerBalance(cid))
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You got " .. getPlayerBalance(cid) .. " coins from bank balance!")
                doPlayerSetBalance(cid, 0)
    return true
end