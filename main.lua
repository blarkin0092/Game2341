--game where animals fall from top player clicks
--before hit the bottom
--game ends when animal hits bottom

-- Besabel Larkin
-- 10/14/2026
-- Editing the Chicken Game

-- Changed the chicken to a burger 

function love.load()
  burger = love.graphics.newImage("burger.png")
  backgroundImage = love.graphics.newImage("bg.png")
  powerup = love.graphics.newImage("powerup.png")

  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  startx = {math.random(0, love.graphics.getWidth() - burger:getWidth()), 
            math.random(0, love.graphics.getWidth() - burger:getWidth()),  
            math.random(0, love.graphics.getWidth() - burger:getWidth()),  
            math.random(0, love.graphics.getWidth() - burger:getWidth()), 
            math.random(0, love.graphics.getWidth() - burger:getWidth())}
  starty = {0 - math.random(burger:getHeight(), burger:getHeight() * 2),
            0 - math.random(burger:getHeight(), burger:getHeight() * 2),
            0 - math.random(burger:getHeight(), burger:getHeight() * 2),
            0 - math.random(burger:getHeight(), burger:getHeight() * 2),
            0 - math.random(burger:getHeight(), burger:getHeight() * 2)}
end

-------------------------------------------------
--MOUSE PRESS
--1 = left, 2 = right, 3 = middle wheel
-------------------------------------------------
function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    --print("left mouse clicked")
    for i, v in ipairs(startx) do
      --if the mouse x and y is within the boundary of a burger picture
      if x >= startx[i] and x <= startx[i] + burger:getWidth() and y >= starty[i] and y <= starty[i] + burger:getHeight() then
        --print("in bounds")
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        --reset its y value (go back to the top)
        starty[i] = math.random(burger:getHeight(), burger:getHeight() * 2) * -1
      end
    end
  end
end

-------------------------------------------------
--UPDATE
-------------------------------------------------
function love.update(dt)
  for i, v in ipairs(starty) do
    --if burger hits the bottom of the screen, lua quits (we lose)
    if starty[i] + burger:getHeight() >= love.graphics.getHeight() then
      --print("over the edge")
      love.event.quit()
    end
    --burgers move down 
    starty[i] = starty[i] + 80 * dt
  end
  -- Attempting to do speed power up: If burger overlaps power up, speed increases for 5 seconds then goes to normal
  if burger:getHeight() = powerup:getHeight() then
  starty[i] = starty[i] + 160 * dt
  wait(5)
  starty[i] = starty[i] + 80 * dt
  end
end




-------------------------------------------------
--DRAW
-------------------------------------------------
function love.draw()
  
  love.graphics.draw(backgroundImage, 0, 0)
  --draw each burger at their respective x and y
  for i, v in ipairs(startx) do
    love.graphics.draw(burger, startx[i], starty[i])
  end
  -- to test for now
  love.graphics.draw(powerup, 0, 0)
end