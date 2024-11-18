require("srcs/player")
Spike = {}
Laser = {}
Closed_door = {}
Spike.__index = Spike
Laser.__index = Laser
Closed_door.__index = Closed_door
function Spike:load(x, y, height, width)
    local instance = setmetatable({}, Spike)
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Spike:draw()
    love.graphics.setColor(100, 200, 100)
    love.graphics.rectangle("fill", self.x, self.y, self.height, self.width)
end

function Laser:load(x, y, height, width)
    local instance = setmetatable({}, Laser)
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Laser:draw()
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", self.x, self.y, self.height, self.width)
end

function Closed_door:load(x, y, height, width)
    local instance = setmetatable({}, Closed_door)
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Closed_door:draw()
    love.graphics.setColor(150, 75, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.height, self.width)
    love.graphics.setColor(1, 1, 1)
end
