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
    SPIKE = Spike:load("Trap", 100, 100, 32, 64)                    --(type,x,y,h,w)
    LASER = Laser:load("Trap", 200, 200, 128, 32)                   --(type,x,y,h,w)
    CLOSED_DOOR = Closed_door:load("Trap", 200, 450, 32, 32)        --(type,x,y,h,w)
    BUTTON = Button:load("activable", 400, 500, 16, 16)             --(type,x,y,h,w)
    PRESSURE_PLATE = Pressure_plate:load("activable", 450, 450, 16, 16) --(type,x,y,h,w)
    BEACON_TP = Beacon_tp:load("activate", 700, 500, 750, 550, 32, 32) --(type,x1,y1,x2,y2,h,w)
    PORTAL_FINISH = Portal_finish:load("activate", 700, 100, 32, 32) --(type,x,y,h,w)
end

function GAME:update(dt)
    HUMAN:update(dt)
    Player:shoot(dt)
    ROBOT:update(dt)
end

function GAME:draw()
    HUMAN:draw()
    ROBOT:draw()
    TUTORIAL.active:draw()
    SPIKE:draw()
    LASER:draw()
    CLOSED_DOOR:draw()
    BUTTON:draw()
    PRESSURE_PLATE:draw()
    BEACON_TP:draw()
    PORTAL_FINISH:draw()
    
end
