--
-- Caca Clicker
-- structure.lua
--

local Game = {}

Game.states =
{
    inMenu = 0,
    inGame = 1,
    inOption = 2
}

Game.events =
{
    leftClic = 1
}

Game.musics =
{
    main = nil
}

Game.sounds =
{
    click = nil
}

Game.data =
{
    config = {},
    sprites = {},
    currentState = 0,
}

return Game
