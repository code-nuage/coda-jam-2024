Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, dx, dy)
    local instance = setmetatable({}, Player)
    instance.x = x
    instance.y = y
    instance.dx = dx
    instance.dy = dy
end