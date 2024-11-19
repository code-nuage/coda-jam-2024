Bullet = {}
BULLETS = {}

Bullet.__index = Bullet
--===================BULLET===============================================

function Bullet:new(x, y, dx, dy)
    local instance = setmetatable({}, Bullet)

    instance.x = x + CONFIG.PLAYER.WIDTH / 2 + dx * 20
    instance.y = y + CONFIG.PLAYER.HEIGHT / 2 + dy * 20
    instance.speed = CONFIG.BULLET.SPEED
    instance.dx = dx
    instance.dy = dy
    instance.touched = false

    World.active.world:add(instance, instance.x, instance.y, 4, 4)
    return instance
end

function Bullet:update(dt)
    self.x = self.x + self.dx * self.speed * dt
    self.y = self.y + self.dy * self.speed * dt

    self.x, self.y, cols, len = World.active.world:move(self, self.x + self.dx * self.speed * dt, self.y + self.dy * self.speed * dt, collisionFilter)

    if len >= 1 then
        self:destroy()
    end
end

function Bullet:destroy()
    if not self.touched then
        self.touched = true
        World.active.world:remove(self)
    end
end

function Bullet:draw()
    love.graphics.rectangle("fill", self.x, self.y, 4, 4)

    for i = 1, #BULLETS do
        if BULLETS[i].touched == self then
            table.remove(BULLETS, i)
        end
    end
end

function BULLETS_DRAW()
    for i = 1, #BULLETS do
        if BULLETS[i].touched == false then
            BULLETS[i]:draw()
        end
    end
end

function BULLETS_UPDATE(dt)
    for i = 1, #BULLETS do
        if BULLETS[i].touched == false then
            BULLETS[i]:update(dt)
        end
    end
end
