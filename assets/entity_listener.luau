local Entity = {}

function Entity:on_start()
    self.eventCount = 0
    self.lastEventData = nil
    
    -- Listen for events from gamemode
    local entitySelf = self
    Gamemode.onEvent("counter_updated", function(data)
        entitySelf.eventCount = entitySelf.eventCount + 1
        entitySelf.lastEventData = data
    end)
end

function Entity:on_update(dt)
    -- Entity can access gamemode state
    local counter = Gamemode.getState("counter")
    if counter then
        self.gamemodeCounter = tonumber(counter) or 0
    end
end

return Entity

