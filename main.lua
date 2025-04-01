function love.load()
    love.window.setTitle("My First LÖVE Window")  -- Set window title
    love.window.setMode(800, 600, {               -- Set window size
        resizable = true,                         -- Allow resizing
        vsync = true,                             -- Enable VSync
        fullscreen = false                        -- No fullscreen
    })
end

function love.draw()
    love.graphics.print("Hello, LÖVE!", 350, 280) -- Draw text in the window
end
