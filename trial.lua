
function start_trial()
    music(-1)
    music(0, 500, 0)
    -- backup
    original_map_backup = {}
    for i=80,127 do 
        original_map_backup[i] = {}
        for j=1,7 do
            original_map_backup[i][j] = original_map[i][j]
        end
    end
    
    trial_animation.active = true
    trial_animation.current_column = 80
    trial_animation.last_update = time()
    
    fill_trial_column(trial_animation.current_column)
    trial_animation.current_column += 1

    player.vision_radius = 48
end

function trial_animation_update()
    if not trial_animation.active then return end
    
    if time() - trial_animation.last_update >= trial_animation.column_delay then
        fill_trial_column(trial_animation.current_column)
        
        trial_animation.current_column += 1
        trial_animation.last_update = time()
        
        if trial_animation.current_column > 127 then
            trial_animation.active = false
        end
    end
end

function fill_trial_column(col)
    if col < 80 or col > 127 then return end
    
    for j=1,7 do
        if original_map[col][j]==0 or original_map[col][j]==16 then 
            mset(col, j, 172)
            original_map[col][j] = 172
        end
    end
end

function reset_trial()
    for i=80,127 do 
        for j=1,7 do
            mset(i, j, original_map_backup[i][j])
            original_map[i][j] = original_map_backup[i][j]
        end
    end
    player.vision_radius = 32
    mset(83, 5, 152)
    original_map[83][5] = 152
    mset(85, 2, 154)
    mset(85, 3, 156)
    mset(85, 4, 155)
    mset(85, 5, 156)
    original_map[85][2] = 154
    original_map[85][3] = 156
    original_map[85][4] = 155
    original_map[85][5] = 156
    
    trial_animation.active = false
end

function create_arrow(tile)
    local arrow = {
        x=tile.x*8+4,
        y=tile.y*8+8,
        w=2, h=6,
        dy=3,
        sp = arr_sp,
        active = true
    }
    add(arrows, arrow)
end

function arrow_update()
    local current_time = time()
    
    for tile in all(arrow_tiles) do
        local interval=0
        if tile.x==98 then interval = 0.2
        else interval = 1 end

        local tile_x = tile.x * 8
        local tile_y = tile.y * 8
        
        local dist = sqrt((tile_x-player.x)^2 + (tile_y-player.y)^2)
        if dist <= player.vision_radius then
            if current_time - tile.last_shot > interval then
                create_arrow(tile)
                tile.last_shot = current_time
            end
        end
    end
    
    -- update existing arrows
    for arrow in all(arrows) do
        if arrow.active then
            arrow.y += arrow.dy
            
            local tile_x = flr(arrow.x / 8)
            local tile_y = flr(arrow.y / 8)
            
            if tile_y >= 0 and tile_y < 34 then
                if fget(mget(tile_x, tile_y), 0) or fget(mget(tile_x, tile_y), 1) then
                    arrow.active = false
                end
            else arrow.active = false end
            
            if arrow.active and collide_object(player, arrow) then
                player.dead = true
                arrow.active = false
            end
        end
    end
    
    -- remove inactive arrows
    for i=#arrows,1,-1 do
        if not arrows[i].active then
            deli(arrows, i)
        end
    end
end

function arrow_draw()
    for arrow in all(arrows) do
        if arrow.active then
            -- Only draw if within the visible screen area
            spr(arrow.sp, arrow.x-4, arrow.y-4, 1, 1)  -- -4 to center sprite
        end
    end
end