--variables
function _init()

    player = {
        sp = 2,
        -- x=32, y=8,
        x=73*8,y=3*8,
        w=8,
        h=8,
        flp=false, --flipped
        dx=0,
        dy=0,
        max_dx=10,
        max_dy=3,
        acc=2,
        boost=6.0, --y acceleration
        anim=0,
        running=false,
        jumping=false,
        falling=false,
        landed=false,
        vision_radius=32,
        tile_available=true,
        holding_tile=false,
        has_crown=false,
        has_layer2_key=false,
        portal_opened=false,
        on_portal=false,

        dead=false,
    }

    -- save map data for fog effect
    original_map = {}
    for x=0,127 do
        original_map[x] = {}
        for y=0,33 do
            original_map[x][y] = mget(x,y)
        end
    end

    game_objects = {}

    -- collectable magic tile item
    magic_tile_item = {
        sp=18,
        x=232,
        y=96,
        w=4,
        h=4,
        anim=0,
    }
    add(game_objects, magic_tile_item)

    -- placeable magic tile
    magic_tile = {
        sp=23,
        x=0, --by tile not pixel
        y=0,
        placed=false,
        orig_sp=0, --for fog
    }

    magic_cursor = {
        sp=22,
        x=0,
        y=0,
    }
 
    -- collectable crown to unlock magic tile placement while jumping
    crown_item = {
        sp=25,
        x=55*8,
        y=30*8,
        w=6,
        h=6,
    }
    original_map[crown_item.x/8][crown_item.y/8] = crown_item.sp
    add(game_objects, crown_item)

    -- collectable key item for layer 3
    key_item = {
        sp=24,
        x=28*8,
        y=20*8,
        w=8,
        h=8,
    }
    original_map[key_item.x/8][key_item.y/8] = key_item.sp
    add(game_objects, key_item)


    gravity = 0.7
    friction = 0.1

    cam_x = 0
    cam_y = 0

    map_start_x=0
    map_end_x=1024
    map_start_y=0
    map_end_y=272

    --test
    x1r=0 y1r=0 x2r=0 y2r=0
end

function fog_update()
    local px = flr(player.x/8)
    local py = flr(player.y/8)
    
    -- check tiles around player
    for mx=px-8,px+16 do
        for my=py-16,py+16 do
            -- check map bounds
            if mx >= 0 and mx < 128 and my >= 0 and my < 34  then
                local dist = sqrt((mx*8-player.x)^2 + (my*8-player.y)^2)
                
                if dist <= player.vision_radius then
                    -- reveal tile
                    mset(mx, my, original_map[mx][my])
                else
                    -- hide tile with black
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
    if not player.on_portal then
        magic_tile_update()
    end
    item_update(key_item, player.has_layer2_key)
    item_update(crown_item, player.has_crown)

    cam_x=player.x-64+(player.w/2)
    cam_y=player.y-64+(player.h/2)
    if cam_x<map_start_x then cam_x=map_start_x end
    if cam_x>map_end_x-128 then cam_x=map_end_x-128 end
    if cam_y<map_start_y then cam_y=map_start_y end
    if cam_y>map_end_y-128 then cam_y=map_end_y-128 end
    camera(cam_x, cam_y)

    --debug
    if btnp(⬆️) then print("WTF",cam_x,cam_y,7) end
end

function _draw()
    cls()
    map(0, 0)
    spr(player.sp, player.x, player.y, 1, 1, player.flp)
    spr(magic_tile_item.sp, magic_tile_item.x, magic_tile_item.y, 1, 1)
    if player.tile_available then 
        --indicator for having magic tile
        rect(cam_x+1,cam_y+2,cam_x+10,cam_y+11, 8)
        spr(18,cam_x+2,cam_y+2,1,1) 
    end
    if player.holding_tile then
        print("placing...",cam_x+4,cam_y+118,7)
        print("🅾️ to confirm",cam_x+74,cam_y+112,7)
        print("❎ to cancel",cam_x+74,cam_y+118,7)
        spr(magic_cursor.sp,magic_cursor.x,magic_cursor.y,1,1)
        magic_cursor_update()
    elseif player.tile_available and not player.holding_tile 
    and not player.on_portal then
        print("❎ to place magic tile...",cam_x+4,cam_y+118,7)
    end

    if player.on_portal then
        if not player.portal_opened then
            print("❎ to activate portal...",cam_x+4,cam_y+118,7)
        else
            print("❎ to enter...",cam_x+4,cam_y+118,7)
        end
    end

    spr(crown_item.sp,crown_item.x,crown_item.y,1,1)
    if player.has_crown then
        --indicator for having crown
        rect(cam_x+13,cam_y+2,cam_x+22,cam_y+11, 8)
        spr(25,cam_x+14,cam_y+3,1,1) 
    end

    spr(key_item.sp,key_item.x,key_item.y,1,1)
    if player.has_layer2_key then
        --indicator for having layer 2 key
        rect(cam_x+25,cam_y+2,cam_x+34,cam_y+11, 8)
        spr(24,cam_x+26,cam_y+3,1,1) 
    end

    if player.dead then die() end


    --test
    -- rect(x1r, y1r, x2r, y2r, 7)
    -- print(tostr(player.portal_opened), player.x-16,player.y,7)
    -- print(key_item.sp, player.x-16,player.y+8,7)
    -- if btnp(🅾️) then
    --     print("yoyo",cam_x,cam_y,7)
    -- end

end

function item_update(item, boolean)
    if boolean then 
        item.sp=16 
        original_map[item.x/8][item.y/8] = item.sp
        return 
    end;

    local dist = sqrt((item.x-player.x)^2 + (item.y-player.y)^2)
    
    if dist > player.vision_radius then
        item.sp=16
    end
end