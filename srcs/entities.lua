<<<<<<< HEAD
LASER = {}

Pressure_Plate = {}

IRON_DOOR = {}

BULLET = {}
BULLET.pos_x = 0
BULLET.pos_y = 0
BULLET.alive = 0

 -- _____________________________________________________________________
function LASER:load(100, 100)
    love.graphics.setColor(245, 125, 125)
    love.graphics.rectangle("fill", x+8, y, 4, 32)
    love.graphics.rectangle("fill", x+20, y, 4, 32)
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", x+12, y, 8, 32)

    love.graphics.setColor(255, 255, 255)
end

function Pressure_Plate:load(200, 200)
    love.graphics.setColor(230, 169, 2)
    love.graphics.rectangle("fill", x+4, y-, 24, 6)

    love.graphics.setColor(255, 255, 255)
end

function IRON_DOOR:load(x, y)

end
--_______________________________________________________________________

function LASER:touch_robot()
    
end

--BULLET_________________________________________________________________


function BULLET:shoot(pos_x, pos_y, mode, facing)
    if BULLET.alive== 0 do
    BULLET.pos_x = pos_x
    BULLET.pos_y = pos_y
    BULLET.alive = 1
    
    World.active.world:add(self, pos_x+32, pos_y, 4, 4)
    
    while BULLET.alive == 1 do
        love.graphics.setColor(17, 153, 184)
        love.graphics.rectangle("fill", BULLET.pos_x, BULLET.pos_y, 4, 4)
=$
        love.graphics.setColor(255, 255, 255)
        BULLET.pos_x=BULLET.pos_x+100
        World.active.world:move(self, BULLET.pos_x+100, pos_y)

        local actualX, actualY, cols, len = World.active.world:check(self, BULLET.pos_x-CONFIG.JUSTABIT, pos_y)
    end
    
    --[[if mode == 1 do

    end

    else if mode == 2 do

    end

    else if mode == 3 do

    end

    else if mode == 4 do

    end--]]
    end
end

--BULLET_________________________________________________________________
=======
Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, dx, dy)
    local instance = setmetatable({}, Player)
    instance.x = x
    instance.y = y
    instance.dx = dx
    instance.dy = dy
end
>>>>>>> 35b2e21d54bf24accdb29eca5f7a401690582a51
