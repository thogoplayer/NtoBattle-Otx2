local level = 10  ----- change this to make the npc hit more/less---------------------|damage_min = (level * 2 + maglevel * 3) * min_multiplier | 
 local maglevel = 10  ----- change this to make the npc hit more/less -----------------|damage_max = (level * 2 + maglevel * 3) * max_multiplier | 
 local min_multiplier = 2.1  ----- change this to make the npc hit more/less ----------|damage_formula = math.random(damage_min,damage_max)      | 
 local max_multiplier = 4.2  ----- change this to make the npc hit more/less --------------------------------------------------------------------- 
 local check_interval = 5  ----- change this to the time between checks for a creature (the less time the more it will probably lag :S)   
 local radiusx = 7  ----- change this to the amount of squares left/right the NPC checks (default 7 so he checks 7 squares left of him and 7 squares right (the hole screen)   
 local radiusy = 5  ----- change this to the amount of squares left/right the NPC checks (default 5 so he checks 5 squares up of him and 5 squares down (the hole screen)   
 local Attack_message = "An Invader, ATTACK!!!"  ----- change this to what the NPC says when he sees a monster(s)   
 local town_name = "Archgard"  ----- the name of the town the NPC says when you say "hi"  
 local Attack_monsters = false  ----- set to true for the npc to attack monsters in his area or false if he doesnt  
 local Attack_swearers = true  ----- set to true for the npc to attack players that swear near him or false if he doesnt  
 local Attack_pkers = true  ----- set to true for the npc to attack players with white and red skulls or false if he doesnt  
 local health_left = 10  ----- set to the amount of health the npc will leave a player with if they swear at him (ie at 10 he will hit the player to 10 health left)  
 local swear_message = "Take this!!!"  ----- change this to what you want the NPC to say when he attackes a swearer  
 local swear_words = {"shit", "fuck", "dick", "cunt"}  ----- if "Attack_swearers" is set to true then the NPC will attack anyone who says a word in here. Remember to put "" around each word and seperate each word with a comma (,)  
 local hit_effect = CONST_ME_MORTAREA  ----- set this to the magic effect the creature will be hit with, see global.lua for more effects 
 local shoot_effect = CONST_ANI_SUDDENDEATH  ----- set this to the magic effect that will be shot at the creature, see global.lua for more effects 
 local damage_colour = TEXTCOLOR_RED  ----- set this to the colour of the text that shows the damage when the creature gets hit 
 ------------------end of config------------------  
 local check_clock = os.clock()  ----- leave this  
 local focus = 0  ----- leave this   
  
 function msgcontains(txt, str)   
  return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))   
 end   
  
 function onCreatureSay(cid, type, msg)   
 msg = string.lower(msg)  
 health = getCreatureHealth(cid) - health_left  
    if ((string.find(msg, '(%a*)hi(%a*)'))) and getDistanceToCreature(cid) < 4 then   
        selfSay('Hello ' .. creatureGetName(cid) .. '! I am a defender of '..town_name..'.')   
        doNpcSetCreatureFocus(cid)   
        focus = 0  
    end  
  
    if msgcontains(msg, 'time') then 
        selfSay('The time is ' .. getWorldTime() .. '.') 
    end 
  
    if messageIsInArray(swear_words, msg) then  
        if Attack_swearers == true then  
            selfSay('' .. swear_message ..' ')   
            doCreatureAddHealth(cid,-health)  
            doSendMagicEffect(getThingPos(cid),17)   
            doSendAnimatedText(getThingPos(cid),health,180)  
            doNpcSetCreatureFocus(cid)   
            focus = 0   
        end  
    end  
 end   
  
 function getMonstersfromArea(pos, radiusx, radiusy, stack)  
 local monsters = { }   
 local starting = {x = (pos.x - radiusx), y = (pos.y - radiusy), z = pos.z, stackpos = stack}   
 local ending = {x = (pos.x + radiusx), y = (pos.y + radiusy), z = pos.z, stackpos = stack}   
 local checking = {x = starting.x, y = starting.y, z = starting.z, stackpos = starting.stackpos}   
    repeat   
        creature = getThingfromPos(checking)   
            if creature.itemid > 0 then   
                if isCreature(creature.uid) == true then  
                    if isPlayer(creature.uid) == false then 
                        if Attack_monsters == true then                             
                            table.insert (monsters, creature.uid)   
                            check_clock = os.clock()                          
                        end 
                    elseif isPlayer(creature.uid) == true then   
                        if Attack_pkers == true then  
                            if getPlayerSkullType(creature.uid) > 0 then  
                                table.insert (monsters, creature.uid)   
                                check_clock = os.clock()       
                            end  
                        end  
                    end   
                end   
            end   
        if checking.x == pos.x-1 and checking.y == pos.y then   
            checking.x = checking.x+2   
        else    
            checking.x = checking.x+1   
        end   
        if checking.x > ending.x then   
            checking.x = starting.x   
            checking.y = checking.y+1   
        end   
    until checking.y > ending.y   
        return monsters   
 end   
  
 function onThink()   
 if (Attack_monsters == true and Attack_pkers == true) or (Attack_monsters == true and Attack_pkers == false) or (Attack_monsters == false and Attack_pkers == true) then  
    if (os.clock() - check_clock) > check_interval then       
        monster_table = getMonstersfromArea(getCreaturePosition(getNpcCid(  )), radiusx, radiusy, 253)   
            if #monster_table >= 1 then  
                selfSay('' .. Attack_message ..' ')   
                    for i = 1, #monster_table do   
                        doNpcSetCreatureFocus(monster_table[i])   
                        local damage_min = (level * 2 + maglevel * 3) * min_multiplier   
                        local damage_max = (level * 2 + maglevel * 3) * max_multiplier   
                        local damage_formula = math.random(damage_min,damage_max) 
                        doSendDistanceShoot(getCreaturePosition(getNpcCid(  )), getThingPos(monster_table[i]), shoot_effect) 
                        doSendMagicEffect(getThingPos(monster_table[i]),hit_effect)   
                        doSendAnimatedText(getThingPos(monster_table[i]),damage_formula,damage_colour)   
                        doCreatureAddHealth(monster_table[i],-damage_formula)   
                        check_clock = os.clock()   
                        focus = 0   
                    end   
            elseif table.getn(monster_table) < 1 then   
                focus = 0   
                check_clock = os.clock()   
            end     
    end  
 end  
    focus = 0  
 end