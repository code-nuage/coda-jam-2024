World = {}
World.__index = World

World.active = nil

function World:new(map)
    local instance = setmetatable({}, World)
    instance.world = bump.newWorld(32)
    instance.map = map

    for y = 1, #map do
        for x = 1, #map[y] do
            local block = {x, y}

            if map[y][x] ~= 0 then
                instance.world:add(block, (x - 1) * CONFIG.WORLD.TILES, (y - 1) * CONFIG.WORLD.TILES, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
            end
        end
    end

    return instance
end

function World:switch()
    World.active = self
end

function World:draw()
    for y = 1, #self.map do
        for x = 1, #self.map[y] do
            if self.map[y][x] ~= 0 then
                love.graphics.rectangle("fill", (x - 1) * CONFIG.WORLD.TILES, (y - 1) * CONFIG.WORLD.TILES, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
            end
        end
    end
end