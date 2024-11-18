Player = {}
Player.__index = Player 
function Player:new(x,y)
    local instance = setmetatable({},Player)
    instance.x = x
    instance.y = y
    instance.w = 32
    instance.h = 32
    return instance
end

function Player:update(dt)
    if love.keyboard.isDown(CONFIG.INPUTS.LEFT)then
        self.x = self.x - 32 * dt
    end
    if love.keyboard.isDown(CONFIG.INPUTS.RIGHT)then
        self.x = self.x + 32 * dt
    end
    if love.keyboard.isDown(CONFIG.INPUTS.JUMP)then
        self.y = self.y -32 * dt
    end
end
function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end 