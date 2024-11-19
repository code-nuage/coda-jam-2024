--[[
         __  __                                            
        |  \/  |                                           
        | \  / | ___  __ _  __ _ ___  ___  _ __ ___   __ _ 
        | |\/| |/ _ \/ _` |/ _` / __|/ _ \| '_ ` _ \ / _` |
        | |  | |  __/ (_| | (_| \__ \ (_) | | | | | | (_| |
        |_|  |_|\___|\__, |\__,_|___/\___/|_| |_| |_|\__,_|
                    __/ |                                
                    |___/                                  
                        By AKATSUKODE
]]

bump = require("libs/bump")
anim8 = require("libs/anim8")

love.graphics.setDefaultFilter("nearest", "nearest")

require("srcs/game")

function love.load()
    GAME:load()
end

function love.update(dt)
    GAME:update(dt)
end

function love.draw()
    GAME:draw()
end