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
            state = creature.State or "Idle",
            velocityX = creature.velocityX or 0,
            velocityY = creature.velocityY or 0
        },
    }, Creature)
end

function Creature:draw()
    self.sprite.x = self.position.x
    self.sprite.y = self.position.y
    self.sprite:draw()
end

function Creature:move(dt)
    self.position.x = self.position.x + self.position.velocityX * dt
    self.position.y = self.position.y + self.position.velocityY * dt
end

function Creature:update(dt)
    self:move(dt)
    self.sprite:Anim()
end

return Creature