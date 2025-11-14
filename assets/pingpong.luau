local PingPong = {}

function PingPong:on_start()
    self.time = 0
    self.amplitude = 10
    self.speed = 0.5
end

function PingPong:on_update(dt)
    self.time += dt
    local offset = math.sin(self.time * self.speed) * self.amplitude
    if Engine and Engine.setEntityPosition then
        Engine.setEntityPosition(self.entity, 0, offset, 0)
    else
        self.last_offset = offset
    end
end

return PingPong


