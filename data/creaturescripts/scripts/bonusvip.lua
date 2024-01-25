local config = {
		welvip = "Voce e membro VIP, agora voce tem 30% EXP Bonus.",
		not_vip = "Ajude o Servidor, Players VIP's tem um aumento de EXP",
		welakat = "Voce e membro da Anbu/Akatsuki, Voce tem 10% EXP Bonus.",
		not_akat = "Seja membro da Anbu/Akatsuki e receba 10% de bonus EXP",
		guilddomain = "Sua Guild e dominante, voce possui 10% exp bonus.",
		notguilddomain = "Domine o castelo e tenha um aumento de 10% de EXP",
		notguild = "Entre em uma guild dominante, e receba 10% de EXP",
}

local function xpCasttle(cid)
    if getPlayerGuildId(cid) > 0 then
        if (getGlobalStorageValue(GGN_STATUS) == getPlayerGuildName(cid)) then
        doPlayerSendTextMessage(cid, 27, config.guilddomain)
		return 0.1
		else
		doPlayerSendTextMessage(cid, 27, config.notguilddomain)
        end
    else
    doPlayerSendTextMessage(cid, 27, config.notguild)
    end
return 0
end

local function xpAkatsuki(cid)
    if getPlayerStorageValue(cid, 89745) > 0 or getPlayerStorageValue(cid, 89746) > 0 then
    doPlayerSendTextMessage(cid, 27, config.welakat)
    return 0.1
    else
    doPlayerSendTextMessage(cid, 27, config.not_akat)
    end
return 0
end


function onLogin(cid)
    doPlayerSendTextMessage(cid, 27, (isPremium(cid) and config.welvip or config.not_vip))
    local xp = 1.0 + xpAkatsuki(cid) + xpCasttle(cid)
	doPlayerSetExperienceRate(cid, xp)
	return true
end
