
-- Sistema de Look Geral --


   local door_list = {12183, 12184, 12185, 12186, 12187}
   function getDoor(itemid)
      if isInArray(door_list, itemid) then
         return true
      end

      return false
   end
--

function onLook(cid, thing, position, lookDistance)

		if getHouseFromPos(position) and getHouseFromPos(position) > 0 and getDoor(thing.itemid) then
			sendHouseOpcodedWindow(cid, getHouseFromPos(position))
			return true
		end
	--
    return true
end