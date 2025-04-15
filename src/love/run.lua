--
-- Caca Clicker
-- run.lua
--

function love.run()
    if love.load then love.load() end

    local dt = 0

    return function()
        love.timer.step()
        local frameStart = love.timer.getTime()

        dt = love.timer.getDelta()

        love.event.pump()
        for name, a,b,c,d,e,f in love.event.poll() do
            if name == "quit" then
                if not love.quit or not love.quit() then
                    return a or 0
                end
            end
            love.handlers[name](a,b,c,d,e,f)
        end

        if love.update then love.update(dt) end

        if love.graphics.isActive() then
        --     love.graphics.origin()
        --     love.graphics.clear(love.graphics.getBackgroundColor())
            if love.draw then love.draw() end
            love.graphics.present()
        end

        local frameDuration = 1 / 30
        local frameTime = love.timer.getTime() - frameStart
        if frameTime < frameDuration then
            love.timer.sleep(frameDuration - frameTime)
        end
    end
end
