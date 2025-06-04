--
-- Caca Clicker
-- sprite_loader
--

local Sprite = require("src.graphics.sprite")

local function loadSpritesFromConfig(config)
    local spriteTable = {}
    for name, spriteConfig in pairs(config.sprites) do
        spriteTable[name] = Sprite.new(spriteConfig)
    end
    return spriteTable
end

return {
    loadSpritesFromConfig = loadSpritesFromConfig
}
