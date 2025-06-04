--
-- Caca Clicker
-- states.lua
--

local States = {}
local Creature = require("src.objects.creature")

local function getScoreOffset(nb)
    local digitnb = 0
    local offset = 22
    if nb == 0 then
        digitnb = 1
    else
        digitnb = math.floor(math.log10(math.abs(nb))) + 1
    end
    return offset * digitnb
end

function States.drawMenu(Game)
    for name, sprite in pairs(Game.data.sprites) do
        if name ~= "chicken" and name ~= "poop" and name ~= "toiletPaper" then
            sprite:draw()
        end
    end
end

function States.updateMenu(Game, dt)
    -- Menu animations, etc.
end

function States.handleMenuClick(Game, x, y, button)
    if Game.data.sprites.jouation:isHovered(x, y) then
        Game.data.currentState = Game.states.inGame

    elseif Game.data.sprites.partirement:isHovered(x, y) then
        love.event.quit()

    elseif Game.data.sprites.optionnage:isHovered(x, y) then
        Game.data.currentState = Game.states.inOption
    end
end

function States.handleMenuKey(Game, key)
    if key == "escape" then
        love.event.quit()
    end
end

function States.drawGame(Game)
    local chickenCreature = Creature:new(Game.data.config.creatures.chicken, Game.data.config.sprites.chicken)

    chickenCreature:draw()
    love.graphics.setColor(0.68, 0.45, 0.39)
    love.graphics.print(Game.data.cacaScore, (Game.data.config.window.width / 2) - getScoreOffset(Game.data.cacaScore), Game.data.config.window.height / 8)
    love.graphics.print("Score:", (Game.data.config.window.width / 2) - 110, Game.data.config.window.height / 35)
    love.graphics.setColor(1, 1, 1, 1)

    for name, sprite in pairs(Game.data.sprites) do
        if name == "poop" or name == "toiletPaper" then
            sprite:draw()
        end
    end
end

function States.updateGame(Game, dt)
    local chickenCreature = Creature:new(Game.data.config.creatures.chicken, Game.data.config.sprites.chicken)

    chickenCreature:update(dt)
end

function States.handleGameClick(Game, x, y, button)
    if Game.data.sprites.poop:isHovered(x, y) then
        if Game.sounds.click:isPlaying() then
            Game.sounds.click:stop()
        end
        Game.sounds.click:play()
        Game.data.cacaScore = Game.data.cacaScore + Game.data.clickMultiplier
    end
end

function States.handleGameKey(Game, key)
    if key == "escape" then
        Game.data.currentState = Game.states.inMenu
    end
end

return States
