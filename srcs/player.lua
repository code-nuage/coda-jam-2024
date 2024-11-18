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
    if love.keyboard.isDown("s")then
        self.y = self.y 32 * dt
    end
    if love.keyboard.isDown("q")then
        self.x = self.x -32 * dt
    end
    if love.keyboard.isDown("d")then
        self.x = self.x 32 * dt
    end
    

end