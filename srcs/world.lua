World = {}
World.__index = World

World.active = nil

function World:new(map)
    local instance = setmetatable({}, World)
    instance.world = bump.newWorld(32)
    instance.map = {}

    for y = 1, #map do
        for x = 1, #map[y] do
            local block = {x, y}
            instance.map[y][x] = map[y][x]
            if map[y][x] ~= 0 then
                instance.world:add(block, x * CONFIG.WORLD.TILES, y * CONFIG.WORLD.TILES, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
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
            love.graphics.rectangle("fill", x * CONFIG.WORLD.TILES, y * CONFIG.WORLD.TILES, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
        end
    end
end