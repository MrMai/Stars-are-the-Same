tools = {}
tools.tileset = function(tileImage, tileW, tileH) -- creates a 
	-- This returns an array of tile quads
	imageTileW, imageTileH = tileImage:getWidth()/tileW-1, tileImage:getHeight()/tileH-1
	tileset = {}
	for currentRow=0, imageTileH do -- Sorts in columns
		for currentColumn=0, imageTileW do -- Turns columns into quads
			currentTile = love.graphics.newQuad(currentColumn*tileW, currentRow*tileH, tileW, tileH, tileImage:getDimensions())
			table.insert(tileset, currentTile)
			print(currentRow + currentColumn)
		end
	end
	print("Done with tile")
	print(#tileset)
	print(imageTileW*imageTileH)
	return tileset
end


tools.generateWorld = function(mapLength, samples, maxHeight, minHeight)
	math.randomseed(os.time())
	land = {}
	for i=1,mapLength do
		table.insert(land, math.random(minHeight, maxHeight))
	end
	for i=1,samples do
		smoothPoint = math.random(2, mapLength-1) -- start at 2 because 1-1 = 0 returns nil
		land[smoothPoint] = math.floor((land[smoothPoint] + land[smoothPoint-1] + land[smoothPoint+1])/3)
		print(land[smoothPoint])
	end
	print("Done with land")
	print(#land)
	return land
end

world = {}
	world.generateWorld = function (worldH, worldW, maxTerrainHeight)

	end
player = {}
	player.x = 0 
	player.y = 0 
	player.speed = 1 -- walk speed
	player.rotation = 0 -- 0 1 2 3 = north east south west
	player.state = 0 -- 0 1 = idle walk
	player.animation = {}
	player.animation.update = function (dt)
		-- Update animation based on state
	end
	player.animation.walk = {} -- Walk animation container
	player.animation.walk.imagePath = "tilesheet.png"
	player.animation.walk.image = love.graphics.newImage(player.animation.walk.imagePath)
	player.animation.walk.sprite = tools.tileset(player.animation.walk.image, 8, 8)

	player.animation.idle = {}
randomterrain = {}
land = tools.generateWorld(60,150,1,8)

function love.load()
	love.graphics.setDefaultFilter("nearest","nearest",0)
	player.animation.walk.image:setFilter("nearest","nearest")
	print(love.graphics.getDefaultFilter())
	for i=0,60 do
		table.insert(randomterrain, math.random(1,3))
	end
end

function love.update(dt)
end

function love.draw()
	for i=1,60 do
		love.graphics.draw(player.animation.walk.image, player.animation.walk.sprite[randomterrain[i]], (i-1)*16, 400-(land[i]*16),0,2)
		for d=0,randomterrain[i] do
			love.graphics.draw(player.animation.walk.image, player.animation.walk.sprite[5], (i-1)*16, 400-(d*16),0,2)
		end
	end
	for i=1,#player.animation.walk.sprite do
		love.graphics.draw(player.animation.walk.image, player.animation.walk.sprite[i], i*16, 0, 0, 2, 2, 8,8)
	end
end	
