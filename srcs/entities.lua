Bullet = {}
BULLETS = {}
Spike = {}
Laser = {}
Closed_door = {}
Button = {}
Pressure_plate = {}
Beacon_tp = {}
Portal_finish = {}

Bullet.__index = Bullet
Pressure_plate.__index = Pressure_plate
Beacon_tp.__index = Beacon_tp
Portal_finish.__index = Portal_finish
Button.__index = Button
Spike.__index = Spike
Laser.__index = Laser
Closed_door.__index = Closed_door
Portal_finish.__index = Portal_finish
--===================BULLET===============================================

function Bullet:new(x, y, dx, dy)
    local instance = setmetatable({}, Bullet)
    instance.x = x
    instance.y = y
    instance.speed = CONFIG.BULLET.SPEED
    instance.dx = dx
    instance.dy = dy
    return instance
end

function Bullet:update(dt)
    self.x = self.x + self.dx * self.speed * dt
    self.y = self.y + self.dy * self.speed * dt
end

function Bullet:draw()
    love.graphics.rectangle("fill", self.x, self.y, 4, 4)
end

function BULLETS_DRAW()
    for i = 1, #BULLETS do
        BULLETS[i]:draw()
    end
end

function BULLETS_UPDATE(dt)
    for i = 1, #BULLETS do
        BULLETS[i]:update(dt)
    end
end

--===================SPIKES=================================================
function Spike:load(type, x, y, height, width)
    local instance = setmetatable({}, Spike)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Spike:draw()
    love.graphics.setColor(0.2, 0.2, 0.2) --gray
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

--============================LASER==================================================
function Laser:load(type, x, y, height, width)
    local instance = setmetatable({}, Laser)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Laser:draw()
    love.graphics.setColor(0.1, 0, 1) --blue
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

--======================================CLOSED_DOOR===============================================
function Closed_door:load(type, x, y, height, width)
    local instance = setmetatable({}, Closed_door)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Closed_door:draw()
    love.graphics.setColor(0.1, 0.2, 0) --dark=green
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(1, 1, 1)
end

--==========================================BUTTON=======================================
function Button:load(type, x, y, height, width)
    local instance = setmetatable({}, Button)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Button:draw()
    love.graphics.setColor(0.5, 0.5, 0.5) --dark=green
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

--==========================================PRESURE_PLATE====================================
function Pressure_plate:load(type, x, y, height, width)
    local instance = setmetatable({}, Pressure_plate)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Pressure_plate:draw()
    love.graphics.setColor(1, 0.3, 0.5)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

--==============================================BEACON=======================================
function Beacon_tp:load(type, x1, y1, x2, y2, height, width)
    local instance = setmetatable({}, Beacon_tp)
    instance.type = type
    instance.x1 = x1
    instance.y1 = y1
    instance.x2 = x2
    instance.y2 = y2
    instance.height = height
    instance.width = width
    return instance
end

function Beacon_tp:draw()
    love.graphics.setColor(1, 0.9, 0.1)
    love.graphics.rectangle("fill", self.x1, self.y1, self.width, self.height)
    love.graphics.rectangle("fill", self.x2, self.y2, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end

--===============================PORTAL_FINISH===================================
function Portal_finish:load(type, x, y, height, width)
    local instance = setmetatable({}, Portal_finish)
    instance.type = type
    instance.x = x
    instance.y = y
    instance.height = height
    instance.width = width
    return instance
end

function Portal_finish:draw()
    love.graphics.setColor(1, 0.8, 0.45)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
end
