Gamestate = {}
Gamestate.__index = Gamestate
Gamestate.active = nil

function Gamestate:new(name)
    local instance = setmetatable({}, Gamestate)
    instance.name = name

    instance.updatable = {}
    instance.drawable = {}
    return instance
end


function Gamestate:append(method, func)
    if method == "updatable" then
        self.updatable[#self.updatable + 1] = func
    elseif method == "drawable" then
        self.drawable[#self.drawable + 1] = func
    end
end

function Gamestate:switch()
    Gamestate.active = self
end

function Gamestate.update(dt)
    for i = 1, #Gamestate.active.updatable do
        Gamestate.active.updatable[i](dt)
    end
end

function Gamestate.draw()
    for i = 1, #Gamestate.active.drawable do
        Gamestate.active.drawable[i]()
    end
end

return Gamestate