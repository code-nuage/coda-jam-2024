require("config")
require("srcs/world")
require("srcs/bullet")
require("srcs/entities")
require("srcs/maps")
require("srcs/player")
require("srcs/ui")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new("HUMAN", CONFIG.HUMAN.ACTIVE_SPRITE, CONFIG.HUMAN.INACTIVE_SPRITE, 100, 100, 1)
    ROBOT = Player:new("ROBOT", CONFIG.ROBOT.ACTIVE_SPRITE, CONFIG.ROBOT.INACTIVE_SPRITE, 200, 200, 2)
    ROBOT:activate()
end

function GAME:update(dt)
    HUMAN:update(dt)
    ROBOT:update(dt)
    BULLETS_UPDATE(dt)
    
end

function GAME:draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", 0, 0, 1280, 720)
    love.graphics.setColor(1, 1, 1)
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
    BULLETS_DRAW()
end
