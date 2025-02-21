function collide_map(obj, aim, flag)
    local x = obj.x local y = obj.y
    local w = obj.w local h = obj.h

    --draw rec where collision needs to be checked
    local x1 = 0 local y1 = 0
    local x2 = 0 local y2 = 0

    if aim=="left" then
        x1=x-1      y1=y+1
        x2=x        y2=y+h-1
        
        if player.falling then y1=y+2 y2=y+h-2 end

    elseif aim=="right" then
        x1=x+w-1    y1=y+1
        x2=x+w      y2=y+h-1

        if player.falling then y1=y+2 y2=y+h-2 end

    elseif aim=="up" then
        x1=x+2      y1=y-1
        x2=x+w-3    y2=y
        
    elseif aim=="down" then
        x1=x+2      y1=y+h
        x2=x+w-2    y2=y+h
    end

    --------TEST---------
    x1r=x1 y1r=y1
    x2r=x2 y2r=y2

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

function collide_object(obj1, obj2)
    -- Simple AABB (Axis-Aligned Bounding Box) collision
    return obj1.x < obj2.x + obj2.w and
           obj1.x + obj1.w > obj2.x and
           obj1.y < obj2.y + obj2.h and
           obj1.y + obj1.h > obj2.y
end

function check_object_collisions()
    for object in all(game_objects) do
        if collide_object(player, object) then
            if object == magic_tile_item and not player.tile_available then 
                player.tile_available=true
            elseif object == key_item and not player.has_layer2_key then
                player.has_layer2_key=true
            elseif object == crown_item and not player.has_crown then
                player.has_crown=true
            end
        end
    end
end