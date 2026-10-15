--LOVE Examples

-- Loading assets, important variables, setting up the window, etc.
function love.load()
    love.graphics.setBackgroundColor(0.2, 0.3, 0.7)

    -- player with default position and height/width
    player = [x = 250, y = 250, width = 15, height = 15]

    -- Setting up bullets


    -- randomness
    math.randomseed(os.time())
end


-- Every frame, uses delta time to make sure computers all run equal
function love.update(dt)

    for i,v in inpairs(bullets) do
        -- Moving bullets
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)
    end
    
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
    love.graphics.rectangle("fill", player.x. player.y, player.width, player.height)

    -- Draw bullets
    for i,v in inpairs(bullets) do
        -- Bullets are circle, x, y, radius 3
        love.graphics.circle("fill", v.x, v.y, 3)
    end

end

-- Mouse pressed function
function love.mousepressed(x, y, button)