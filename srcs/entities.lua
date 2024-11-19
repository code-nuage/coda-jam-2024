Entity = {}
ENTITIES = {}

Entity.__index = Entity
--================NORMAL ENTITY===================
function Entity:new(type, x, y, w, h)
    local instance = setmetatable({}, Entity)
    
    instance.type = type

    instance.x = x
    instance.y = y
    instance.w = w
    instance.h = h

    ENTITIES[#ENTITIES+1] = instance

    if type == "SPIKE" then
        instance.image = love.graphics.newImage("assets/entities/spike.png")
    elseif type == "LASER" then
        instance.image = love.graphics.newImage("assets/entities/laser.png")
    end

    return instance
end

function Entity:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 2, 2)
end