--variables
function _init()

    player = {
        sp = 2,
        x = 32,
        y = 8,
        w = 8,
        h = 8,
        flp = false, --flipped
        dx = 0,
        dy = 0,
        max_dx = 10,
        max_dy = 3,
        acc = 2,
        boost = 6.2, --y acceleration
        anim = 0,
        running = false,
        jumping = false,
        falling = false,
        landed = false,
        vision_radius = 32,
        tile_available = false,
        holding_tile = false,
    }

    game_objects = {}

    -- collectable magic tile item
    magic_tile_item = {
        sp=18,
        x=232,
        y=96,
        w=4,
        h=4,
        anim=0,
        visible=true,
    }
    add(game_objects, magic_tile_item)

    -- placeable magic tile
    magic_tile = {
        sp=23,
        x=0, --by tile not pixel
        y=0,
        placed=false,
        orig_sp=0,
    }

    magic_cursor = {
        sp=22,
        x=0,
        y=0,
        visible=false,
    }

    gravity = 0.7
    friction = 0.1

    cam_x = 0
    cam_y = 0

    map_start_x=0
    map_end_x=1024
    map_start_y=0
    map_end_y=512

    -- save map data for fog effect
    original_map = {}
    for x=0,127 do
        original_map[x] = {}
        for y=0,31 do
            original_map[x][y] = mget(x,y)
        end
    end

    --test
    x1r=0 y1r=0 x2r=0 y2r=0
end

function fog_update()
    local px = flr(player.x/8)
    local py = flr(player.y/8)
    
    -- check tiles around player
    for mx=px-8,px+16 do
        for my=py-8,py+16 do
            -- check map bounds
            if mx >= 0 and mx < 128 and my >= 0 and my < 32 then
                local dist = sqrt((mx*8-player.x)^2 + (my*8-player.y)^2)
                
                if dist <= player.vision_radius then
                    -- reveal tile
                    mset(mx, my, original_map[mx][my])
                else
                    -- hide tile with darkness (sprite 1)
                    -- make sure not to hide collision tiles
                    -- if not fget(original_map[mx][my], 0) and 
                    --    not fget(original_map[mx][my], 1) then
                    --    end
                    mset(mx, my, 16)
                end
            end
        end
    end
end

--update and draw
function _update()
    if not player.holding_tile then player_update() end
    player_animate()
    fog_update()
    check_object_collisions()
    magic_tile_item_update()
    magic_tile_update()
    

    cam_x=player.x-64+(player.w/2)
    cam_y=player.y-64+(player.h/2)
    if cam_x<map_start_x then cam_x=map_start_x end
    if cam_x>map_end_x-128 then cam_x=map_end_x-128 end
    if cam_y<map_start_y then cam_y=map_start_y end
    if cam_y>map_end_y-128 then cam_y=map_end_y-128 end
    camera(cam_x, cam_y)

    --debug
    if btnp(⬆️) then print("WTF",cam_x,cam_y,7)end
end

function _draw()
    cls()
    map(0, 0)
    spr(player.sp, player.x, player.y, 1, 1, player.flp)
    spr(magic_tile_item.sp, magic_tile_item.x, magic_tile_item.y, 1, 1)
    if player.tile_available then 
        rect(cam_x+1,cam_y+2,cam_x+10,cam_y+11, 8)
        spr(18,cam_x+2,cam_y+2,1,1) 
    end
    if player.holding_tile then
        print("placing...",cam_x+4,cam_y+118,7)
        print("🅾️ to confirm",cam_x+74,cam_y+112,7)
        print("❎ to cancel",cam_x+74,cam_y+118,7)
        spr(magic_cursor.sp,magic_cursor.x,magic_cursor.y,1,1)
        magic_cursor_update()
    elseif player.tile_available and not player.holding_tile then
        print("❎ to place magic tile...",cam_x+4,cam_y+118,7)
    end

    --test
    -- rect(x1r, y1r, x2r, y2r, 7)
    -- print(tostr(player.tile_available), player.x-16,player.y,7)
    -- if btnp(🅾️) then
    --     print("yoyo",cam_x,cam_y,7)
    -- end

end