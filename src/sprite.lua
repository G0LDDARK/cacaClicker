--
-- Caca Clicker
-- sprite.lua
--

local Sprite = {}
Sprite.__index = Sprite

function Sprite.new(image)
    local imageData = love.image.newImageData(image.asset)
    local img = love.graphics.newImage(imageData)
    return setmetatable({
        image = img,
        imageData = imageData,
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
        local r, g, b, a = self.imageData:getPixel(
            (mx - self.x) / self.scaleX,
            (my - self.y) / self.scaleY
        )
        return a > 0
    else
        return false
    end
end

return Sprite
