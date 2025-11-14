local GamemodeTable = {}

function GamemodeTable:on_start()
    self.counter = 0
    self.initialized = true
    -- Load from localStorage if available
    local saved = localStorage.get("counter")
    if saved then
        self.counter = tonumber(saved) or 0
    end
end

function GamemodeTable:on_update(dt)
    self.counter = (self.counter or 0) + 1
    -- Save to localStorage
    localStorage.set("counter", tostring(self.counter))
    
    -- Trigger event every 10 updates
    if self.counter % 10 == 0 then
        local api = Gamemode or self._GamemodeAPI
        if api and api.triggerEvent then
            api.triggerEvent("counter_updated", self.counter)
        end
    end
end

return GamemodeTable

