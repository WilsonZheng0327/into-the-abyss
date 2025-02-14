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
            -- player.x+=((player.x+player.w+1)%8)-1 --align with block in case bug
        end
    elseif player.dx>0 then
        player.dx=limit_speed(player.dx,player.max_dx)
        if collide_map(player,"right",1) then
            player.dx=0
            -- player.x-=((player.x+player.w+1)%8)-1 --align with block in case bug
        end
    end


    player.x+=player.dx
    player.y+=player.dy

    if player.x<map_start_x then player.x=map_start_x end
    if player.x>map_end_x-player.w then player.x=map_end_x-player.w end

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

-- helper function
function limit_speed(num, max)
    return mid(-max,num,max) 
end