--
-- Caca Clicker
-- sprite.lua
--

local Sprite = {}
Sprite.__index = Sprite

function Sprite.new(imagePath, x, y)
    local img = love.graphics.newImage(imagePath)
    return setmetatable({
        image = img,
        x = x,
        y = y,
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
