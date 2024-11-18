require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAIN = Player:new(100, 100, 1)
    ROBOT = Player:new(200, 200, 2)
end

function GAME:update(dt)
    HUMAIN:update(dt)
end

function GAME:draw()
    HUMAIN:draw()
end