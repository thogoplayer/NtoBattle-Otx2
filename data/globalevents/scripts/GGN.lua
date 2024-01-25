function onTime(cid, interval)
local time = os.date("*t")

	if (isInArray(GGNCONF.days, time.wday)) then
     doBroadcastMessage("[Guild Castle War] O portal para o evento sera aberto em 10 minutos, nao percam!")
	 addEvent(doBroadcastMessage, 5 * TIME_MINUTES, "[Guild Castle War] O portal para o evento vai sera aberto em 5 minutos, nao percam!")
     addEvent(doBroadcastMessage, 7 * TIME_MINUTES, "[Guild Castle War] O portal para o evento vai sera aberto em 3 minutos, nao percam!")
	 addEvent(doBroadcastMessage, 8 * TIME_MINUTES, "[Guild Castle War] O portal para o evento vai sera aberto em 2 minutos, nao percam!")
	 addEvent(doBroadcastMessage, 9 * TIME_MINUTES, "[Guild Castle War] O portal para o evento vai sera aberto em 1 minuto, nao percam!")
	 addEvent(GGN_OPEN, 10 * TIME_MINUTES)
	 end
     return true
end
