function executeClean()
	doCleanMap()
	doBroadcastMessage("Mapa do jogo limpo, próxima limpeza em 4 horas.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Limpeza do mapa dentro de 30 segundos, Por favor, pegue seus itens!")
	addEvent(executeClean, 30000)
	return true
end
