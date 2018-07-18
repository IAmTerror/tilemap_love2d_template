local MAP_WIDTH = 16
local MAP_HEIGHT = 14
local TILE_WIDTH = 48
local TILE_HEIGHT = 48

local Game = {}

Game.Map = {}
Game.Map = {
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
            {5,5,5,5,5,5,5,7,7,5,5,5,5,5,5,5},
            {5,5,5,5,8,5,6,7,7,5,5,5,5,5,5,5},
            {5,5,5,6,7,7,7,7,7,5,5,5,5,5,5,5},
            {5,5,6,7,7,7,7,7,7,5,5,5,5,5,5,5},
            {5,6,7,7,7,7,7,7,7,4,5,5,5,5,5,5},
            {7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7},
            {2,3,7,7,7,7,7,7,7,7,7,7,7,7,2,2},
            {5,5,7,7,7,7,7,7,7,7,7,7,7,7,5,5},
            {5,5,7,7,7,7,7,7,7,7,7,7,7,7,5,5},
            {5,5,2,2,2,2,2,2,2,2,2,2,2,2,5,5},
            {5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5},
          }
         
Game.TileTextures = {}
  
  function Game.GetTileId()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    local col = math.floor(x / TILE_WIDTH) + 1
    local lin = math.floor(y / TILE_HEIGHT) + 1
    if col > 0 and col <= MAP_WIDTH and lin > 0 and lin <= MAP_HEIGHT then
      local id = Game.Map[lin][col]
      love.graphics.print("ID"..tostring(id),1,1)
    else
      love.graphics.print("Out of bounds",1,1)
    end     
  end
  
  function Game.SetTiles()
    local l,c
    
    for l=1,MAP_HEIGHT do
      for c=1,MAP_WIDTH do
        local id = Game.Map[l][c]
        local tex = Game.TileTextures[id]
        if tex ~= nil then
          love.graphics.draw(tex, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT, 0, 3, 3)
        end
      end      
    end
  end
    
  function Game.Load()
    print("Game:Loading textures...")
    Game.TileTextures[0] = nil
    Game.TileTextures[1] = love.graphics.newImage("images/green_mountain_1.png")
    Game.TileTextures[2] = love.graphics.newImage("images/green_mountain_2.png")
    Game.TileTextures[3] = love.graphics.newImage("images/green_mountain_3.png")
    Game.TileTextures[4] = love.graphics.newImage("images/green_mountain_4.png")
    Game.TileTextures[5] = love.graphics.newImage("images/green_mountain_5.png")
    Game.TileTextures[6] = love.graphics.newImage("images/green_mountain_6.png")
    Game.TileTextures[7] = love.graphics.newImage("images/sand.png")
    Game.TileTextures[8] = love.graphics.newImage("images/door.png")
    print("Game:Finished loading textures")
  end
  
  function Game.Draw()

    Game.SetTiles()
    
    Game.GetTileId()
    
  end

return Game