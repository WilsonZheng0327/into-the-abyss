--variables
function _init()

    music(3, 1000, 0)

    player = {
        sp = 2,
        -- x=32, y=8,
        x=80*8,y=5*8,
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
        has_crown=true,
        has_layer2_key=false,
        portal_opened=false,
        on_portal=false,
        on_switch=false,
        in_trial=false,
        trial_finished=false,

        can_interact=false,
        dialogue_id="",
        in_dialogue=false,

        dead=false,
        win=false,
        in_win_screen=false
    }
    
    arrows={}
    arrow_tiles={}
    arr_tile_sp=192
    arr_sp=193
    arr_tile_count = 0


    -- save map data for fog effect
    original_map = {}
    for x=0,127 do
        original_map[x] = {}
        for y=0,33 do
            original_map[x][y] = mget(x,y)

            -- save arrow tiles
            if mget(x,y)==arr_tile_sp then
                arr_tile_count+=1
                add(arrow_tiles, {
                    x=x,y=y,
                    last_shot=0
                }) end
        end
    end

    game_objects = {}

    -- collectable magic tile item
    magic_tile_item = {
        sp=18,
        x=232,y=96,
        w=4,h=4,
        anim=0,
    }
    add(game_objects, magic_tile_item)

    -- placeable magic tile
    magic_tile = {
        sp=23,
        x=0,y=0, -- by tile not pixel
        placed=false,
        orig_sp=0, --for fog
    }

    magic_cursor = {
        sp=22,
        x=0,y=0,
    }
 
    -- collectable crown to unlock magic tile placement while jumping
    crown_item = {
        sp=25,
        x=55*8,y=30*8,
        w=6,h=6,
    }
    original_map[crown_item.x/8][crown_item.y/8] = crown_item.sp
    add(game_objects, crown_item)

    -- collectable key item for layer 3
    key_item = {
        sp=24,
        x=28*8,y=20*8,
        w=8,h=8,
    }
    original_map[key_item.x/8][key_item.y/8] = key_item.sp
    add(game_objects, key_item)

    -- trial switch in layer 3
    switch_item = {
        sp=152,
        x=83*8,y=5*8,
        w=8,h=8,
    }
    original_map[switch_item.x/8][switch_item.y/8] = switch_item.sp
    add(game_objects, switch_item)

    -- animation state for trial filling
    trial_animation = {
        active = false,
        current_column = 80,
        last_update = 0,
        column_delay = 1.5, -- seconds between columns
    }

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
    if player.in_win_screen then
        if btnp(❎) then
            player.in_win_screen = false
            player.tile_available = false
            player.has_crown = false
            player.has_layer2_key = false
            player.portal_opened = false
            player.trial_finished = false
            player.x = 32
            player.y = 8
            crown_item.sp=25
            original_map[crown_item.x/8][crown_item.y/8] = crown_item.sp
        end
        return
    end

    trial_animation_update()
    if not player.holding_tile and not player.in_dialogue then 
        player_update() 
        if not player.trial_finished then arrow_update() end
    end

    if player.can_interact then
        if btnp(❎) then player.in_dialogue=not player.in_dialogue end
    end

    player_animate()
    fog_update()
    check_object_collisions()
    magic_tile_item_update()
    if not player.on_portal and not player.on_switch 
    and not player.trial_finished then
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

end

function _draw()
    if player.in_win_screen then return end

    cls()
    map(0, 0)

    if not player.trial_finished then arrow_draw() end
    spr(player.sp, player.x, player.y, 1, 1, player.flp)

    if player.holding_tile then
        print("placing...",cam_x+4,cam_y+118,7)
        print("🅾️ to confirm",cam_x+74,cam_y+112,7)
        print("❎ to cancel",cam_x+74,cam_y+118,7)
        spr(magic_cursor.sp,magic_cursor.x,magic_cursor.y,1,1)
        magic_cursor_update()

    elseif player.on_portal and player.has_layer2_key then
        if not player.portal_opened then
            print("❎ to activate portal...",cam_x+4,cam_y+118,7)
        else print("❎ to enter...",cam_x+4,cam_y+118,7) end

    elseif player.on_switch and not player.in_trial then
        print("❎ to open the door... beware...",cam_x+4,cam_y+118,7)

    elseif player.in_dialogue then
        handle_dialogue(player.dialogue_id)

    elseif player.can_interact then
        print("❎ to investigate...",cam_x+4,cam_y+118,7)

    elseif player.tile_available and not player.trial_finished then
        print("❎ to place magic tile...",cam_x+4,cam_y+118,7)
    end


    spr(magic_tile_item.sp, magic_tile_item.x, magic_tile_item.y, 1, 1)
    handle_indicator(player.tile_available,18,0,0)
    spr(crown_item.sp,crown_item.x,crown_item.y,1,1)
    handle_indicator(player.has_crown,25,1,1)
    spr(key_item.sp,key_item.x,key_item.y,1,1)
    handle_indicator(player.has_layer2_key,24,2,1)

    if trial_animation.active then
        print("TRIAL ACTIVATING...", cam_x+4, cam_y+110, 8)
        -- visual progress bar
        rect(cam_x+4, cam_y+100, cam_x+124, cam_y+106, 5)
        local progress = (trial_animation.current_column - 80) / 48
        rectfill(cam_x+4, cam_y+100, cam_x+4+progress*120, cam_y+106, 8)
    end

    if player.dead then die() end


    --test
    -- rect(x1r, y1r, x2r, y2r, 7)
    -- print(tostr(player.portal_opened), player.x-16,player.y,7)
    -- print(key_item.sp, player.x-16,player.y+8,7)
    -- print(player.in_dialogue, cam_x,cam_y,7)

end

function handle_indicator(bool,item_spr,big_offset,y_offset)
    if bool then
        rect(cam_x+1+big_offset*12,cam_y+2,cam_x+10+big_offset*12,cam_y+11, 8)
        spr(item_spr,cam_x+2+big_offset*12,cam_y+2+y_offset,1,1) 
    end
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

function handle_dialogue(id)
    rectfill(cam_x+4, cam_y+96, cam_x+124, cam_y+124, 0)
    rect(cam_x+4, cam_y+96, cam_x+124, cam_y+124, 7)
    -- Message text
    if id=="grave" then
        local m1="hERE lIES oNE wHO dREAMT oF"
        local displayed = ""
        for i=1, #m1 do
            local char = sub(m1, i, i)
            displayed = displayed .. char
            print(displayed, cam_x+8, cam_y+100, 7)
            for j=1,3 do flip() end
        end

        local m2="rEACHING tHE tREASURE..."
        local displayed = ""
        for i=1, #m2 do
            local char = sub(m2, i, i)
            displayed = displayed .. char
            print(displayed, cam_x+8, cam_y+108, 7)
            for j=1,3 do flip() end
        end
        while player.in_dialogue do flip() end
    end
end