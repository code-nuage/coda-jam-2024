World = {}
World.__index = World

World.active = nil
World.tiles = {}


for i = 1, 48 do
    World.tiles[i] = love.graphics.newImage("assets/tiles/tile" .. i .. ".png")
end

function World:new(map)
    local instance = setmetatable({}, World)
    instance.world = bump.newWorld(32)
    instance.map = map.tiles
    instance.entities = map.entities
    instance.spawn = map.spawn

    print(map.entities[1].id)

    for y = 1, #instance.map do
        for x = 1, #instance.map[y] do
            local block = {x, y}

            if instance.map[y][x] ~= 0 then
                instance.world:add(block, (x - 1) * CONFIG.WORLD.TILES, (y - 1) * CONFIG.WORLD.TILES, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
            end
        end
    end

    for i = 1, #instance.entities do
        local entity = {type = instance.entities[i].type, id = instance.entities[i].id, activate = instance.entities[i].activate, x = instance.entities[i].x, y = instance.entities[i].y}
        instance.world:add(entity, entity.x, entity.y, CONFIG.WORLD.TILES, CONFIG.WORLD.TILES)
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
                love.graphics.draw(World.tiles[self.map[y][x]], (x - 1) * CONFIG.WORLD.TILES, (y - 1) * CONFIG.WORLD.TILES, 0, 2)
            end
        end
    end

    for i = 1, #self.entities do
        self.entities[i]:draw()
    end
end

function collisionFilter(i, other)
    if i.type == "HUMAN" or i.type == "ROBOT" and other.activate == true then
        if i.type == "HUMAN" then
            if other.type == "SPIKE" then
                HUMAN:respawn()
                ROBOT:respawn()
            elseif other.type == "PRESSURE_PLATE" then
                if other.id == 1 then
                    print("aaaa")
                    for i = 1, #World.active.entities do
                        if World.active.entities[i].id == 1 and World.active.entities[i].type == "SPIKE" then
                            World.active.entities[i].activate = false
                        end
                    end
                end
            elseif other.type == "PORTAL" then
                print("Victoire")
                return "cross"
            else
                return "slide"
            end
        end
        if i.type == "ROBOT" then
            if other.type == "SPIKE" and other.activate == true then
                HUMAN:respawn()
                ROBOT:respawn()
            end
        end
    else
        return "slide"
    end
end