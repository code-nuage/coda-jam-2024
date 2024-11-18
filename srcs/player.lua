Player = {}
Player.__index = Player

function Player:new(type, x, y, jump_count)
    local instance = setmetatable({}, Player)

    instance.x = x
    instance.y = y

    instance.dy = 0
    instance.dx = 0

    instance.w = CONFIG.PLAYER.WIDTH
    instance.h = CONFIG.PLAYER.HEIGHT

    instance.jump_default = jump_count
    instance.jump_count = jump_count
    instance.speed = CONFIG.PLAYER.SPEED
    instance.force = CONFIG.PLAYER.JUMPFORCE
    instance.gravity = CONFIG.PLAYER.GRAVITY
    instance.shoot_direction_x = 0
    instance.shoot_direction_y = 0

    World.active.world:add(instance, instance.x, instance.y, instance.w, instance.h)
    return instance
end

function Player:update(dt)
    if love.keyboard.isDown(CONFIG.INPUTS.LEFT) then
        self.dx = -self.speed
    end
    if love.keyboard.isDown(CONFIG.INPUTS.RIGHT) then
        self.dx = self.speed
    end

    if self.jump_count > 0 then
        if love.keyboard.isDown(CONFIG.INPUTS.JUMP) then
            self.dy = -self.force
            self.jump_count = self.jump_count - 1
        end
    end

    if love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_TOP) then
        self.shoot_direction_y = -1
    else
        self.shoot_direction_y = 0
    end
    if love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_LEFT) then
        self.shoot_direction_x = -1
    elseif love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_RIGHT) then
        self.shoot_direction_x = 1
    else
        self.shoot_direction_x = 0
    end

    if self.shoot_direction_x ~= 0 or self.shoot_direction_y ~= 0 then
        if love.keyboard.isDown(CONFIG.INPUTS.SHOOT) then
            print("Shoot")
        end
    end

    self.x, self.y = World.active.world:move(self, self.x + self.dx * dt, self.y + self.dy * dt)

    if self:isGrounded() then
        self.jump_count = self.jump_default
        self.dy = 0
    else
        self.dy = self.dy + self.gravity * dt
    end

    if self:isTopped() then
        self.dy = 10
    end

    self.dx = 0
end

function Player:isGrounded()
    local x, y, cols, len = World.active.world:check(self, self.x, self.y + CONFIG.JUSTABIT)

    if len >= 1 then
        return true
    end
end

function Player:isTopped()
    local x, y, cols, len = World.active.world:check(self, self.x, self.y - CONFIG.JUSTABIT)

    if len >= 1 then
        return true
    end
end

function Player:shoot()
    print("Shoot")
    -- Add shooting
end

function Player:draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1,1,1)
end
