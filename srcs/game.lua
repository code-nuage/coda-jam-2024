require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new("human", 100, 100, 1)
    ROBOT = Player:new("robot", 200, 200, 2)
end

function GAME:update(dt)
    HUMAN:update(dt)
    ROBOT:update(dt)
end

function GAME:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
end