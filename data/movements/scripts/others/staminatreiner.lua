addSta = {}

local config = {
    timeToAdd = 2,
    addTime = 1,
}

local function addStamina(playerId)
    local player = Player(playerId)
    if not player then
	     addSta[playerId] = nil
        return
    end
    player:setStamina(player:getStamina() + config.addTime)
end
function onStepIn(creature, item, lastPosition, position, fromPosition, toPosition, actor)
    local player = creature:getPlayer()
    if not player then
        return true
    end
		
    local playerId = player:getId()
    addSta[playerId] = addEvent(addStamina, config.timeToAdd * 60 * 1000, playerId)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,("Attack the Monk and you will win 1 of stamina every 2 minutes training here."))

	return true
end

function onStepOut(creature, item, lastPosition, position, fromPosition, toPosition, actor)
    if not player then
    stopEvent(addSta[playerId])
    addSta[playerId] = nil
	end
    return true
end