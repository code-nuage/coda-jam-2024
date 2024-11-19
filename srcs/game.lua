require("config")
require("srcs/world")
require("srcs/bullet")
require("srcs/entities")
require("srcs/maps")
require("srcs/player")
require("srcs/ui")
Background = {}
local fond = love.graphics.newImage("assets/background/usine_bg.png")
function Background:load()
    love.window.setMode(1280, 720)
end


function Background:draw()
    
    love.graphics.draw(fond, 0, 0, 0, 1280 / fond:getWidth(), 720 / fond:getHeight())
end
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
    Background:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
    BULLETS_DRAW()
end
