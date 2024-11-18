require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new(100, 100, 1)
    ROBOT = Player:new(200, 200, 2)
    ROBOT:activate()
end

function GAME:update(dt)
    if HUMAN.status == true then
        HUMAN:update(dt)
    elseif HUMAN.status == false then
        ROBOT:update(dt)
    end
end

function GAME:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
end
