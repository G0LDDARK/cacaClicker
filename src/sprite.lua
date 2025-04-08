--
-- Caca Clicker
-- sprite.lua
--

local Sprite = {}
Sprite.__index = Sprite

function Sprite.new(image)
    local img = love.graphics.newImage(image.asset)
    return setmetatable({
        image = img,
        x = image.x,
        y = image.y,
        width = img:getWidth(),
        height = img:getHeight()
    }, Sprite)
end

function Sprite:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Sprite:isHovered(mx, my)
    return mx >= self.x and mx <= self.x + self.width and
           my >= self.y and my <= self.y + self.height
end

return Sprite
