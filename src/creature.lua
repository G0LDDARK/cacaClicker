local Creature = {}
Creature.__index = Creature
local Sprite = require("src.sprite")

function Creature:new(creature, image)
    assert(image, "Image is nil in Creature.new")
    assert(creature, "Creature is nil in Creature.new")

    return setmetatable({
        sprite = Sprite.new(image),
        position = {
            x = creature.x,
            y = creature.y,
            startX = creature.x,
            startY = creature.y,
            endX = creature.endX,
            endY = creature.endY,
            state = creature.State or "Idle",
            velocityX = creature.velocityX or 0,
            velocityY = creature.velocityY or 0,
            turnX = creature.turnX or false,
            turnY = creature.turnY or false
        },
    }, Creature)
end

function Creature:draw()
    self.sprite.x = self.position.x
    self.sprite.y = self.position.y
    self.sprite:draw()
end

function Creature:move(dt)
    local turnedX = false
    local turnedY = false
    self.position.x = self.position.x + self.position.velocityX * dt
    if self.position.x > self.position.endX then
        self.position.x = self.position.endX
        turnedX = true
    end
    if self.position.x < self.position.startX then
        self.position.x = self.position.startX
        turnedX = true
    end
    self.position.y = self.position.y + self.position.velocityY * dt
    if self.position.y > self.position.endY then
        self.position.y = self.position.endY
        turnedY = true
    end
    if self.position.y < self.position.startY then
        self.position.y = self.position.startY
        turnedY = true
    end
    if turnedX or turnedY then
        self:turn(turnedX, turnedY)
    end
end

function Creature:turn(turnedX, turnedY)
    if turnedX then
        if (self.position.turnX) then
            self.position.velocityX = -self.position.velocityX
            self.sprite:rotateX()
        else
            self.position.velocityX = 0
        end
    end
    if turnedY then
        if (self.position.turnY) then
            self.position.velocityY = -self.position.velocityY
        else
            self.position.velocityY = 0
        end
    end
end

function Creature:update(dt)
    self:move(dt)
    self.sprite:Anim()
end

return Creature