World = {}
World.__index = World

function World:new(map)
    for y = 1, #map do
        for x = 1, #map[y] do
            print("Collision added")
        end
    end
end