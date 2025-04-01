function love.load()
    love.window.setTitle("Caca Clicker")  -- Set window title
    love.window.setMode(1920, 1080, {     -- Set window size
        resizable = false,                -- Allow resizing
        vsync = true,                     -- Enable VSync
        fullscreen = false                -- No fullscreen
    })
end

function love.draw()
    love.graphics.print("Hello, LÖVE!", 350, 280) -- Draw text in the window
end
