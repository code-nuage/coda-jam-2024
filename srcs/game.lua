require("config")
require("srcs/maps")
require("srcs/world")
require("srcs/player")
require("srcs/entities")
require("srcs/ui")

GAME = {}

function GAME:load()
    TUTORIAL = World:new(MAPS.TUTORIAL)
    TUTORIAL:switch()
    HUMAN = Player:new("HUMAN", CONFIG.HUMAN.ACTIVE_SPRITE, CONFIG.HUMAN.INACTIVE_SPRITE, 100, 100, 1)
    ROBOT = Player:new("ROBOT", CONFIG.ROBOT.ACTIVE_SPRITE, CONFIG.ROBOT.INACTIVE_SPRITE, 200, 200, 2)
    ROBOT:activate()
    SPIKE = Entity:new("SPIKE", 500, 500)
end

function GAME:update(dt)
    HUMAN:update(dt)
    ROBOT:update(dt)
    BULLETS_UPDATE(dt)
    
end

function GAME:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
    BULLETS_DRAW()
    ENTITIES_DRAW()
end
