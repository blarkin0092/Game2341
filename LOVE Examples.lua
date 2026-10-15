--LOVE Examples

-- Loading assets, important variables, setting up the window, etc.
function love.load()
    love.graphics.setBackgroundColor(0.2, 0.3, 0.7)

    -- player with default position and height/width
    player = [x = 250, y = 250, width = 15, height = 15]

    -- randomness
    math.randomseed(os.time())
end


-- Every frame, uses delta time to make sure computers all run equal
function love.update(dt)
    
    if love.keyboard.isDown("d") then
        player.x = player.x + 50 * dt
    end

    if love.keyboard.isDown("a") then
        player.x = player.x - 50 * dt
    end

    if love.keyboard.isDown("w") then
        player.y = player.y - 50 * dt
    end

    if love.keyboard.isDown("s") then
        player.y = player.y + 50 * dt
    end
end


-- Taking assets, variables, objects and drawing them to the screen
function love.draw()
    -- Set player to green, draw as rectangle
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle("fill", player.x)
end