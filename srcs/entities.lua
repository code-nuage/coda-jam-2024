Entity = {}
ENTITIES = {}

Entity.__index = Entity
--================NORMAL ENTITY===================
function Entity:new(type, id, x, y, w, h)
    local instance = setmetatable({}, Entity)

    instance.type = type
    instance.id = id

    instance.x = x
    instance.y = y
    instance.w = w
    instance.h = h
    instance.activate = true

    ENTITIES[#ENTITIES + 1] = instance

    if type == "SPIKE" then
        instance.image = love.graphics.newImage("assets/entities/spike.png")
    --[[elseif type == "LASER" then
        instance.image = love.graphics.newImage("assets/entities/laser_top.png")
    elseif type == "DOOR" then
        instance.image = love.graphics.newImage("assets/entities/door.png")
    elseif type == "BUTTON" then
        instance.image = love.graphics.newImage("assets/entities/button.png")
    ]]
    elseif type == "PRESSURE_PLATE" then
        instance.image = love.graphics.newImage("assets/entities/pressure_plate.png")
    elseif type == "PORTAL" then
        instance.image = love.graphics.newImage("assets/entities/portal.png")
    end

    return instance
end

function Entity:draw()
    if self.activate == true then
        love.graphics.draw(self.image, self.x, self.y, 0, 2, 2)
    end
end