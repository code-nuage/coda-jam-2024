Player = {}
Player.__index = Player
--=================================Player_New=====================================================
function Player:new(type, active_sprite, inactive_sprite, x, y, jump_count)
    local instance = setmetatable({}, Player)

    instance.type = type

    instance.active_sprite = love.graphics.newImage(active_sprite)
    instance.inactive_sprite = love.graphics.newImage(inactive_sprite)
    instance.defaultx = World.active.spawn[instance.type].x
    instance.defaulty = World.active.spawn[instance.type].y
    instance.x = instance.defaultx
    instance.y = instance.defaulty
    instance.spawn = {x = 100, y = 100}
    instance.dy = 0
    instance.dx = 0
    instance.status = true
    instance.w = CONFIG.PLAYER.WIDTH
    instance.h = CONFIG.PLAYER.HEIGHT

    instance.facing = "right"

    instance.jump_default = jump_count
    instance.jump_count = jump_count
    instance.has_jumped = false
    instance.speed = CONFIG.PLAYER.SPEED
    instance.force = CONFIG.PLAYER.JUMPFORCE
    instance.gravity = CONFIG.PLAYER.GRAVITY
    instance.shoot_direction_x = 0
    instance.shoot_direction_y = 0
    instance.hasshoot = false

    World.active.world:add(instance, instance.x, instance.y, instance.w, instance.h)
    return instance
end

--===========================================Player_Update=========================================
function Player:update(dt)
    if self.status == true then
        if love.keyboard.isDown(CONFIG.INPUTS.LEFT) then
            self.dx = -self.speed
            self.facing = "left"
        end
        if love.keyboard.isDown(CONFIG.INPUTS.RIGHT) then
            self.dx = self.speed
            self.facing = "right"
        end

        if self.jump_count > 0 then
            if love.keyboard.isDown(CONFIG.INPUTS.JUMP) then
                if love.keyboard.isDown(CONFIG.INPUTS.JUMP) and not self.has_jumped then
                    self.dy = -self.force
                    self.jump_count = self.jump_count - 1
                    self.has_jumped = true
                end
            else
                self.has_jumped = false
            end
        end

        if self.type == "HUMAN" then
            if love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_TOP) then
                self.shoot_direction_y = -1
            else
                self.shoot_direction_y = 0
            end
            if love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_LEFT) then
                self.shoot_direction_x = -1
            elseif love.keyboard.isDown(CONFIG.INPUTS.VIEW_SHOOT_RIGHT) then
                self.shoot_direction_x = 1
            else
                self.shoot_direction_x = 0
            end

            if self.shoot_direction_x ~= 0 or self.shoot_direction_y ~= 0 then
                if love.keyboard.isDown(CONFIG.INPUTS.SHOOT) then
                    if love.keyboard.isDown(CONFIG.INPUTS.SHOOT) and not self.hasshoot then
                        BULLETS[#BULLETS + 1] = Bullet:new(self.x, self.y, self.shoot_direction_x, self.shoot_direction_y)
                        self.hasshoot = true
                    end
                else
                    self.hasshoot = false
                end
            end
        end
    end
    --================================colision=============================================================
    self.x, self.y = World.active.world:move(self, self.x + self.dx * dt, self.y + self.dy * dt, collisionFilter)
    World.active.world:check(self, self.x + CONFIG.JUSTABIT, self.y + CONFIG.JUSTABIT, collisionFilter)


    if self:isGrounded() then
        self.jump_count = self.jump_default
        self.dy = 0
        self.has_jumped = false
    else
        self.dy = self.dy + self.gravity * dt
    end

    if self:isTopped() then
        self.dy = 10
    end

    self.dx = 0
end

function Player:isGrounded()
    local x, y, cols, len = World.active.world:check(self, self.x, self.y + CONFIG.JUSTABIT)

    if len >= 1 then
        return true
    end
end

--====================================Player_Topped======================================================
function Player:isTopped()
    local x, y, cols, len = World.active.world:check(self, self.x, self.y - CONFIG.JUSTABIT)

    if len >= 1 then
        return true
    end
end

--=====================================Player_Draw====================================================
function Player:draw()
    love.graphics.rectangle("fill", self.x + self.w / 2 + 50 * self.shoot_direction_x,
        self.y + self.h / 2 + 50 * self.shoot_direction_y, 5, 5)
    if self.status == true then
        if self.facing == "right" then
            love.graphics.draw(self.active_sprite, self.x, self.y, 0, 2, 2)
        end
        if self.facing == "left" then
            love.graphics.draw(self.active_sprite, self.x + self.w, self.y, 0, -2, 2)
        end
    else
        love.graphics.draw(self.inactive_sprite, self.x, self.y, 0, 2, 2)
    end
end
--[[function Bullet:draw()
    love.graphics.rectangle("fill",Player.x + Player.y /2 +75* Player.shoot_direction_x,
        Player.y + Player.h / 2 + 75 * Player.shoot_direction_y, 5, 5)
end]]

--=====================================Player_switch==========================================
function Player:activate()
    self.status = not self.status
end

function love.keypressed(key)
    if key == CONFIG.INPUTS.SWITCH then
        HUMAN:activate()
        ROBOT:activate()
    end
end


function Player:respawn()
    World.active.world:remove(self, self.x, self.y, self.w, self.h)
    self.dx, self.dy = 0, 0
    self.x, self.y = self.defaultx, self.defaulty
    World.active.world:add(self, self.x, self.y, self.w, self.h)
end
