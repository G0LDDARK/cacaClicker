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
        height = img:getHeight(),
        scaleX = image.scaleX or image.scale or 1,
        scaleY = image.scaleY or image.scale or 1,
        rotation = image.rotation or 0,
    }, Sprite)
end

function Sprite:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation,
        self.scaleX, self.scaleY)
end

function Sprite:isHovered(mx, my)
    if ( mx >= self.x and mx <= self.x + self.width * self.scaleX and
           my >= self.y and my <= self.y + self.height * self.scaleY ) 
    then
        local r, g, b, a = self.image.img:getData():getPixel(mx, my)
        return a > 0
    else
        return false
    end
end

return Sprite
