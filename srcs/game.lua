require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new(CONFIG.HUMAN.ACTIVE_SPRITE, CONFIG.HUMAN.INACTIVE_SPRITE, 100, 100, 1)
    ROBOT = Player:new(CONFIG.ROBOT.ACTIVE_SPRITE, CONFIG.ROBOT.INACTIVE_SPRITE, 200, 200, 2)
    ROBOT:activate()
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
