--[[
    Capture The Flag System
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

local focus = 0
local talk_start = 0
local target = 0
local talkState = {}
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end


function onCreatureDisappear(cid, pos)
   if (focus ~= 0) then
      selfSay("Good bye too!")
      focus, talk_start = 0, 0
   end
end


function onCreatureTurn(creature)
end


function msgcontains(txt, str)
   return (string.find(txt, str) and not string.find(txt, "(%w+)" .. str) and not string.find(txt, str .. "(%w+)"))
end

function onCreatureSay(cid, type, msg)
   local msg = string.lower(msg)
   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

   local iteimbymsg = getItemIdByName(msg, false)

   if (msgcontains(msg, "bye") and (focus == cid)) and getDistanceToCreature(cid) < 4 then
      local playerguid = getPlayerGUIDByName(getCreatureName(getNpcId()))
      focus, talk_start, talkState[talkUser] = 0, 0, 0

      selfSay("Adeus " .. getCreatureName(cid) .. "!", cid)
   elseif (msgcontains(msg, "hi") and (focus == 0)) and getDistanceToCreature(cid) < 4 then
      local playerguid = getPlayerGUIDByName(getCreatureName(getNpcId()))

      focus, talk_start, talkState[talkUser] = cid, os.clock(), -1
      if (_CTF_LIB.nopen) and (getGlobalStorageValue(_CTF_LIB.CTFSto) < 1) then
         selfSay("Olá {" .. getCreatureName(cid) .. "}, sou responsável por levar os players para o evento ROUBAR A BANDEIRA, porém ele está fechado no momento.", cid)
      else
         selfSay("Olá {" .. getCreatureName(cid) .. "}, sou responsável por levar os players para o evento ROUBAR A BANDEIRA, caso esteja interessado em ir diga {evento}.", cid)
         talkState[talkUser] = 0
      end
   elseif (msgcontains(msg, "evento")) and (talkState[talkUser] == 0) and (focus == cid) and (getDistanceToCreature(cid) < 4) then
      talk_start, talkState[talkUser] = os.clock(), 1
      if (_CTF_LIB.price) then
         selfSay("Para ir para o evento você precisa pagar uma taxa de {".. _CTF_LIB.price .."} gold coins. Você tem certeza que quer ir para o evento?", cid)
      else
         selfSay("Você tem certeza que quer ir para o evento?", cid)
      end
      selfSay("Se você tiver algum stealth ring ele será removido.", cid)
   elseif (msgcontains(msg, "sim") or msgcontains(msg, "yes")) and (talkState[talkUser] == 1) and (focus == cid) and (getDistanceToCreature(cid) < 4) then
      if (_CTF_LIB.nopen) and (getGlobalStorageValue(_CTF_LIB.CTFSto) < 1) then
         selfSay("Você não pode ir para o evento agora!", cid)
		 talkState[talkUser] = 0
      else
         talk_start = os.clock()
         if (_CTF_LIB.price) then
            if not(doPlayerRemoveMoney(cid, _CTF_LIB.price)) then
               selfSay("Você precisa de {".. _CTF_LIB.price .. "} gold coins para poder ir para o evento :'(", cid)
               talk_start, talkState[talkUser] = os.clock(), 1
            else
                focus, talk_start, talkState[talkUser] = 0, 0, 0
                local teamid = getTeamLivre()
                local team = _CTF_LIB.flags[teamid]

               registerCreatureEvent(cid, "CTFCombat")
               registerCreatureEvent(cid, "CTFAttack")
               registerCreatureEvent(cid, "CTFDeath")
               registerCreatureEvent(cid, "CTFLogout")

               if not(_CTF_LIB.teamsOUT[teamid][getPlayerSex(cid)]) then
                  doAddCondition(cid, _CTF_LIB.teamsOUT[teamid][2])
               else
                  doAddCondition(cid, _CTF_LIB.teamsOUT[teamid][getPlayerSex(cid)])
               end

               local ring = getPlayerSlotItem(cid, 9)
               if (ring.itemid == 2165) or (ring.itemid == 2202) then
                  doRemoveItem(ring.uid, 1)
               end

               if (doPlayerRemoveItem(cid, 2165, getPlayerItemCount(cid, 2165))) then
                  doPlayerSendTextMessage(cid, 27, "Boa Sorte no Evento!")
               end

               doRemoveCondition(cid, CONDITION_INVISIBLE)
               setGlobalStorageValue(teamid, getGlobalStorageValue(teamid)+1)
               setPlayerStorageValue(cid, _CTF_LIB.teamssto, teamid)
               doPlayerSetTown(cid, team.temple)
               doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
               selfSay("BOM EVENTO!", cid)
            end
         else
             focus, talk_start, talkState[talkUser] = 0, 0, 0
             local teamid = getTeamLivre()
             local team = _CTF_LIB.flags[teamid]

             registerCreatureEvent(cid, "CTFCombat")
             registerCreatureEvent(cid, "CTFAttack")
             registerCreatureEvent(cid, "CTFDeath")
             registerCreatureEvent(cid, "CTFLogout")

             if not(_CTF_LIB.teamsOUT[teamid][getPlayerSex(cid)]) then
                doAddCondition(cid, _CTF_LIB.teamsOUT[teamid][2])
             else
                doAddCondition(cid, _CTF_LIB.teamsOUT[teamid][getPlayerSex(cid)])
             end

             local ring = getPlayerSlotItem(cid, 9)
             if (ring.itemid == 2165) or (ring.itemid == 2202) then
                doRemoveItem(ring.uid, 1)
             end

             if (doPlayerRemoveItem(cid, 2165, getPlayerItemCount(cid, 2165))) then
                doPlayerSendTextMessage(cid, 27, "Boa Sorte no Evento!")
             end

             doRemoveCondition(cid, CONDITION_INVISIBLE)
             setGlobalStorageValue(teamid, getGlobalStorageValue(teamid)+1)
             setPlayerStorageValue(cid, _CTF_LIB.teamssto, teamid)
             doPlayerSetTown(cid, team.temple)
             doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
             selfSay("BOM EVENTO!", cid)
         end
      end
   end
end

function onCreatureChangeOutfit(creature)
end

function onThink()
         doNpcSetCreatureFocus(focus)
        if (os.clock() - talk_start) > 60 then
            if focus > 0 then
               selfSay("Flw!", cid)
            end
               focus = 0
               talk_start = 0
        end

        if focus ~= 0 then
           if getDistanceToCreature(focus) > 3 then
              selfSay("FLW AEW!", cid)
              focus = 0
              talk_start = 0
           end
        end
end
