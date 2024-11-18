require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")
require("srcs/entities")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new("HUMAN", CONFIG.HUMAN.ACTIVE_SPRITE, CONFIG.HUMAN.INACTIVE_SPRITE, 100, 100, 1)
    ROBOT = Player:new("ROBOT", CONFIG.ROBOT.ACTIVE_SPRITE, CONFIG.ROBOT.INACTIVE_SPRITE, 200, 200, 2)
    ROBOT:activate()
    SPIKE = Spike:load(100, 100, 32, 64)--(x,y,h,w)
    LASER = Laser:load(150, 150, 64, 32)
    CLOSED_DOOR = Closed_door:load(200, 450, 32, 32)
end

function GAME:update(dt)
    HUMAN:update(dt)
    ROBOT:update(dt)
end

function GAME:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
    SPIKE:draw()
    LASER:draw()
    CLOSED_DOOR:draw()
end
