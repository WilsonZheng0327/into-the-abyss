function magic_tile_item_update()
    tile_animate(not player.tile_available)
end

function tile_animate(available)
    if not available then magic_tile_item.sp=16 return end;

    local dist = sqrt((magic_tile_item.x-player.x)^2 + (magic_tile_item.y-player.y)^2)
    
    if dist > player.vision_radius then
        magic_tile_item.sp=16
    else

        if time()-magic_tile_item.anim>0.7 then
            magic_tile_item.anim=time()
            if magic_tile_item.sp+1<18 then magic_tile_item.sp=18
            else magic_tile_item.sp+=1 end
        if magic_tile_item.sp>21 then magic_tile_item.sp=18 end
        end
    end
end

function magic_cursor_update() 
    if btnp(⬆️) and magic_cursor.y>(max(map_start_y,player.y-player.vision_radius)) then
        magic_cursor.y-=8
    end
    if btnp(⬇️) and magic_cursor.y<(max(map_start_y,player.y+player.vision_radius)) then
        magic_cursor.y+=8
    end
    if btnp(⬅️) and magic_cursor.x>(max(map_start_x,player.x-player.vision_radius)) then
        magic_cursor.x-=8
    end
    if btnp(➡️) and magic_cursor.x<(max(map_start_x,player.x+player.vision_radius)) then
        magic_cursor.x+=8
    end
end

function magic_tile_update()
    if player.tile_available and btnp(❎) then 
        if not player.holding_tile and (player.jumping or player.falling) and not player.has_crown then return end
        -- reset magic cursor location to player
        if not player.holding_tile then 
            magic_cursor.x=player.x-(player.x%8)
            magic_cursor.y=player.y-(player.y%8)
        end
        player.holding_tile = not player.holding_tile
    end

    if player.holding_tile and btnp(🅾️) then
        -- check placement not on player or map tile
        local orig_sp=mget(magic_cursor.x/8,magic_cursor.y/8)
        if not fget(orig_sp,0)
        and not fget(orig_sp,1) then
            -- reset original magic tile location (if exists)
            if magic_tile.placed then
                mset(magic_tile.x,magic_tile.y,magic_tile.orig_sp)
                original_map[magic_tile.x][magic_tile.y]=magic_tile.orig_sp --for fog
            end
            -- place new magic tile
            magic_tile.x=magic_cursor.x/8
            magic_tile.y=magic_cursor.y/8
            player.holding_tile=false
            magic_tile.placed=true
            magic_tile.orig_sp=orig_sp
            mset(magic_tile.x,magic_tile.y,magic_tile.sp)
            original_map[magic_tile.x][magic_tile.y]=magic_tile.sp --for fog
        end
    end
end