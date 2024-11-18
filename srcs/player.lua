Player = {}
Player.__index = Player

function Player:new(x, y, jump_count)
    local instance = setmetatable({}, Player)
    instance.x = x
    instance.y = y

    instance.dy = 0
    instance.dx = 0
    instance.jump_default = jump_count
    instance.jump_count = jump_count
    instance.speed = CONFIG.PLAYER.SPEED
    instance.force = CONFIG.PLAYER.JUMPFORCE
    instance.gravity = CONFIG.PLAYER.GRAVITY
    instance.w = CONFIG.PLAYER.WIDTH
    instance.h = CONFIG.PLAYER.HEIGHT

    return instance
end

function Player:update(dt)
    if love.keyboard.isDown(CONFIG.INPUTS.LEFT) then
        self.dx = self.x - 32 * dt
    end
    if love.keyboard.isDown(CONFIG.INPUTS.RIGHT) then
        self.dx = self.x + 32 * dt
    end


    self.y = self.y + self.dy * dt
    self.dy = self.dy + self.gravity * dt
    if self.jump_count > 0 then
        if love.keyboard.isDown(CONFIG.INPUTS.JUMP) then
            self.dy = -self.force
            self.jump_count = self.jump_count - 1
        end
    end
    if cols > 1 then
        self.jump_count = self.jump_default
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end
