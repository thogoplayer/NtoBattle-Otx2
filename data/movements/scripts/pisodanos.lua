local config = {
  vocation = {4}, -- Lista de Vocations afetadas pelo damage
  damagePerTick = 50, -- Dano recebido a cada tick
  tickTime = 5 -- Tempo do dano (segundos)
}

-- Main
function onStepIn(cid, item, pos)
  if not isPlayer (cid) then
    return false
  end

  if not isInArray(config.vocation, getPlayerVocation(cid)) then
    infos = {
      cid = cid,
      pos = getPlayerPosition(cid),
    }
    addEvent (damageCondition, config.tickTime * 1000, infos)
  end

  return true
end

-- Funcao para comparar duas coordenadas (Retorna true caso sejam iguais)
function comparePositions (posA, posB)
  if posA.x == posB.x and posA.y == posB.y and posA.z == posB.z then
    return true
  end
  return false
end

-- Funcao responsavel pela condition do player receber dano
function damageCondition (infos)
  if comparePositions (infos.pos, getPlayerPosition(infos.cid)) then
        doCreatureAddHealth (infos.cid, -config.damagePerTick)
        addEvent (damageCondition, config.tickTime * 1000, infos)
  end
end