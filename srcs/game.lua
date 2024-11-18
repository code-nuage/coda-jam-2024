require("srcs/player")
require("config")
GAME = {}

function GAME:load()
    HUMAIN = Player:new(100,100)
    ROBOT = Player:new(200, 200)
end

function GAME:update(dt)
    HUMAIN:update(dt)
end

function GAME:draw()
    HUMAIN:draw()
end