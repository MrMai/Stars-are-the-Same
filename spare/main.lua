world = {}
world.xGravityMain = 0 -- x gravity of world mainPhysics
world.yGravityMain = 40 -- y gravity of world mainPhysics 

world.mainPhysics = love.physics.newWorld(world.xGravityMain, world.yGravityMain)


player = {}
player.xPos = 100 -- x position
player.yPos = 100 -- y position
	
player.hitWidth  = 30 -- player width
player.hitHeight = 30 -- player height
player.hitBody = love.physics.newBody(world.mainPhysics, player.xPos, player.yPos, "dynamic")
player.hitBox  = love.physics.newRectangleShape(player.hitWidth, player.hitHeight)
player.hitFixture = love.physics.newFixture(player.hitBody, player.hitBox)


function love.load()
	
end

function love.update(dt)
	world.mainPhysics:update(dt)	
end

function love.draw()
	x, y = player.hitBody:getX(), player.hitBody:getY()
	love.graphics.circle("fill", x, y, player.hitWidth, 10)
end

function love.key
