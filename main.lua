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
        boost = 6.5, --y acceleration
        anim = 0,
        running = false,
        jumping = false,
        falling = false,
        landed = false,
        vision_radius = 32,
    }

    gravity = 0.7
    friction = 0.1

    cam_x = 0

    map_start=0
    map_end=1024

    -- save map data for fog effect
    original_map = {}
    for x=0,127 do
        original_map[x] = {}
        for y=0,31 do
            original_map[x][y] = mget(x,y)
        end
    end

    -- initialize fog
    update_fog()

    --test
    x1r=0 y1r=0 x2r=0 y2r=0
end

function update_fog()
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
                    mset(mx, my, 10)
                end
            end
        end
    end
end

--update and draw
function _update()
    player_update()
    player_animate()
    update_fog()

    cam_x=player.x-64+(player.w/2)
    if cam_x<map_start then cam_x=map_start end
    if cam_x>map_end-128 then cam_x=map_end-128 end

    camera(cam_x, 0)
end

function _draw()
    cls()
    map(0, 0)
    spr(player.sp, player.x, player.y, 1, 1, player.flp)

    --test
    rect(x1r, y1r, x2r, y2r, 7)
end

function player_update()
    player.dy+=gravity
    player.dx*=friction

    if btn(⬅️) then
        player.dx-=player.acc
        player.running=true
        player.flp=true
    end
    if btn(➡️) then
        player.dx+=player.acc
        player.running=true
        player.flp=false
    end

    --slide
    if player.running and not btn(⬅️) and not btn(➡️)
    and not player.falling and not player.jumping then
        player.running=false
    end

    --jump
    if btnp(⬆️) and player.landed then
        player.dy-=player.boost
        player.landed=false
    end

    --check collision
    if player.dy>0 then
        player.falling=true
        player.landed=false
        player.jumping=false
        
        player.dy=limit_speed(player.dy,player.max_dy)

        if collide_map(player,"down",0) then
            player.landed=true
            player.falling=false
            player.dy=0
            player.y-=((player.y+player.h+1)%8)-1 --align with block in case bug
        end
    elseif player.dy<0 then
        player.jumping=true
        if collide_map(player,"up",1) then
            player.dy=0
        end
    end
    
    if player.dx<0 then
        player.dx=limit_speed(player.dx,player.max_dx)
        if collide_map(player,"left",1) then
            player.dx=0
        end
    elseif player.dx>0 then
        player.dx=limit_speed(player.dx,player.max_dx)
        if collide_map(player,"right",1) then
            player.dx=0
        end
    end


    player.x+=player.dx
    player.y+=player.dy

    if player.x<map_start then player.x=map_start end
    if player.x>map_end-player.w then player.x=map_end-player.w end

end

function limit_speed(num, max)
    return mid(-max,num,max) 
end

function player_animate()
    if player.jumping then player.sp=8
    elseif player.falling then player.sp=9
    elseif player.running then
        if time()-player.anim>.1 then
            player.anim=time()
            player.sp+=1
            if player.sp>7 then player.sp=4 end
        end
    else --idle
        if time()-player.anim>.3 then
            player.anim=time()
            player.sp+=1
            if player.sp>3 then player.sp=2 end
        end
        player.sp = 2
    end
end

--collisions
function collide_map(obj, aim, flag)
    local x = obj.x local y = obj.y
    local w = obj.w local h = obj.h

    --draw rec where collision needs to be checked
    local x1 = 0 local y1 = 0
    local x2 = 0 local y2 = 0

    if aim=="left" then
        x1=x-1      y1=y
        x2=x        y2=y+h-1
        
    elseif aim=="right" then
        x1=x+w-1    y1=y
        x2=x+w      y2=y+h-1
        
    elseif aim=="up" then
        x1=x+2      y1=y-1
        x2=x+w-3    y2=y
        
    elseif aim=="down" then
        x1=x+2      y1=y+h
        x2=x+w-3    y2=y+h
    end

    --pixels to tiles
    x1/=8   y1/=8
    x2/=8   y2/=8

    if fget(mget(x1,y1), flag)
    or fget(mget(x1,y2), flag)
    or fget(mget(x2,y1), flag)
    or fget(mget(x2,y2), flag) then
        return true
    else 
        return false
    end

end