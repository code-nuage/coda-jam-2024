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