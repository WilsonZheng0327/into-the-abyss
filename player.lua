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
        sfx(12)
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

    -- check death block collision
    if collide_all_directions(7) and not collide_all_directions(3) then
        player.dead=true
    end
    
    if collide_all_directions(6) then
        player.on_portal=true
        if not player.portal_opened then
            if btnp(❎) then 
                player.portal_opened=true
                mset(4,25,34) mset(4,26,50) mset(5,25,35) mset(5,26,51)
                original_map[4][25]=34
                original_map[4][26]=50
                original_map[5][25]=35
                original_map[5][26]=51
            end
        else
            if btnp(❎) and player.x < 72*8 then tp_to_layer_3() end
        end
    else player.on_portal=false end

    if collide_all_directions(5) then
        player.on_switch=true
        if not player.in_trial then
            if btnp(❎) then
                player.in_trial=true
                mset(83,5,153)
                original_map[83][5]=153
                mset(85,2,157)
                mset(85,3,158)
                mset(85,4,158)
                mset(85,5,158)
                original_map[85][2]=157
                original_map[85][3]=158
                original_map[85][4]=158
                original_map[85][5]=158
                start_trial()
            end
        end
    else player.on_switch=false end

    if collide_all_directions(4) then
        reset_trial()
        player.trial_finished=true
        cls(0)
        for j=1,30 do flip() end
        player.x=87*8 player.y=11*8
        music(-1)
        music(3,1000,0)
    end

    if collide_all_directions(3) and collide_all_directions(7) then
        win()
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

-- helper function
function collide_all_directions(flag)
    return collide_map(player,"down",flag)
    or collide_map(player,"up",flag)
    or collide_map(player,"left",flag)
    or collide_map(player,"right",flag)
end

function tp_to_layer_3()
    cls(0)
    for j=1,30 do flip() end
    player.x=74*8 player.y=4*8
    player.has_layer2_key=false
end

function die()
    music(-1)
    cls(0)
    for j=1,10 do flip() end
    local m1 = "wOAH..."
    print(m1, cam_x+10, cam_y+50, 7)
    for j=1,40 do flip() end
    local m2 = "tHAT wAS a sCARY nIGHTMARE..."
    print(m2, cam_x+10, cam_y+56, 7)
    for j=1,50 do flip() end
    local m3 = "lET'S nOT dO tHAT..."
    print(m3, cam_x+10, cam_y+62, 7)
    -- Pause to let player read
    for i=1,60 do flip() end

    if not player.in_trial then
        player.x=56*8 player.y=28*8
        player.dead=false
        player.has_layer2_key=false
        key_item.sp=24
        original_map[key_item.x/8][key_item.y/8] = key_item.sp
    else 
        player.x=74*8 player.y=5*8
        player.dead=false
        player.in_trial=false

        reset_trial()
    end
    music(3, 1000, 0)
end

function win()
    cls(0)
    for j=1,30 do flip() end
    local m1 = "tHE oNE pIECE OF tREASURE"
    print(m1, cam_x+4, cam_y+44, 7)
    local m2 = "eVERYONE wANTED..."
    print(m2, cam_x+58, cam_y+50, 7)
    for j=1,60 do flip() end
    local m3 = "bUT aT wHAT cOST...?"
    print(m3, cam_x+4, cam_y+62, 7)
    for j=1,60 do flip() end
    local m4 = "iT iS nOW yOUR tURN"
    print(m4, cam_x+4, cam_y+74, 7)
    local m5 = "tO pROTECT iT..."
    print(m5, cam_x+60, cam_y+80, 7)
    for j=1,60 do flip() end

    local m6 = "uNTIL tHE dAY yOU dIE..."
    local displayed = ""
    for i=1, #m6-3 do
        local char = sub(m6, i, i)
        displayed = displayed .. char
    
        print(displayed, cam_x+4, cam_y+110, 7)
        for j=1,10 do flip() end
    end
    for j=1,20 do flip() end
    for i=#m6-2, #m6 do
        local char = sub(m6, i, i)
        displayed = displayed .. char
    
        print(displayed, cam_x+4, cam_y+110, 7)
        for j=1,20 do flip() end
    end
    
    for j=1,60 do flip() end
    print("❎ TO RESTART...",cam_x+66,cam_y+118,7)
    
    player.in_win_screen=true
end