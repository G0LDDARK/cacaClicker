--
-- Caca Clicker
-- tiledSprite.lua
--

local TiledSprite = {}
TiledSprite.__index = TiledSprite

function TiledSprite.new(imagePath, scaleX, scaleY)
    local img = love.graphics.newImage(imagePath)
    img:setFilter("nearest", "nearest")
    return setmetatable({
        image = img,
        scaleX = scaleX or 1,
        scaleY = scaleY or 1
    }, TiledSprite)
end

function TiledSprite:draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    local w = self.image:getWidth() * self.scaleX
    local h = self.image:getHeight() * self.scaleY

    for x = 0, screenWidth, w do
        for y = 0, screenHeight, h do
            love.graphics.draw(self.image, x, y, 0, self.scaleX, self.scaleY)
        end
    end
end

return TiledSprite
