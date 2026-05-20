-- Nova 3D FPS World
cam_x, cam_y, cam_z = 0, 3, 10
cam_yaw, cam_pitch = 0, -10

nova_mouse_lock(true)
nova_mouse_visible(false)

bullets = {}
bullet_timer = 0

function update(dt)
    -- Mouse Look
    local mx = nova_mouse_dx()
    local my = nova_mouse_dy()
    cam_yaw = cam_yaw + mx * 0.2
    cam_pitch = cam_pitch - my * 0.2
    if cam_pitch > 89 then cam_pitch = 89 end
    if cam_pitch < -89 then cam_pitch = -89 end

    -- WASD Movement
    local speed = 8
    if nova_key_down("w") then cam_x = cam_x + math.sin(math.rad(cam_yaw)) * speed * dt; cam_z = cam_z - math.cos(math.rad(cam_yaw)) * speed * dt end
    if nova_key_down("s") then cam_x = cam_x - math.sin(math.rad(cam_yaw)) * speed * dt; cam_z = cam_z + math.cos(math.rad(cam_yaw)) * speed * dt end
    if nova_key_down("a") then cam_x = cam_x - math.cos(math.rad(cam_yaw)) * speed * dt; cam_z = cam_z - math.sin(math.rad(cam_yaw)) * speed * dt end
    if nova_key_down("d") then cam_x = cam_x + math.cos(math.rad(cam_yaw)) * speed * dt; cam_z = cam_z + math.sin(math.rad(cam_yaw)) * speed * dt end
    if nova_key_down("q") then cam_y = cam_y + speed * dt end
    if nova_key_down("e") then cam_y = cam_y - speed * dt end

    -- Shooting
    bullet_timer = bullet_timer - dt
    if nova_mouse_down(0) and bullet_timer <= 0 then
        bullet_timer = 0.15
        local bx = cam_x + math.sin(math.rad(cam_yaw)) * math.cos(math.rad(cam_pitch))
        local by = cam_y + math.sin(math.rad(cam_pitch))
        local bz = cam_z - math.cos(math.rad(cam_yaw)) * math.cos(math.rad(cam_pitch))
        table.insert(bullets, {x=bx, y=by, z=bz, vx=math.sin(math.rad(cam_yaw))*20, vy=math.sin(math.rad(cam_pitch))*20, vz=-math.cos(math.rad(cam_yaw))*20, life=2})
    end

    -- Update bullets
    for i=#bullets,1,-1 do
        local b = bullets[i]
        b.x = b.x + b.vx * dt; b.y = b.y + b.vy * dt; b.z = b.z + b.vz * dt
        b.life = b.life - dt
        if b.life <= 0 then table.remove(bullets, i) end
    end

    -- Fullscreen toggle
    if nova_key_pressed("f") then
        -- Simple toggle: just window mode for now
    end

    return "FPS | Pos: "..math.floor(cam_x)..","..math.floor(cam_y)..","..math.floor(cam_z)
end

function draw()
    nova_3d_clear(5, 5, 25)

    local lx = cam_x + math.sin(math.rad(cam_yaw))*math.cos(math.rad(cam_pitch))
    local ly = cam_y + math.sin(math.rad(cam_pitch))
    local lz = cam_z - math.cos(math.rad(cam_yaw))*math.cos(math.rad(cam_pitch))
    nova_3d_camera(cam_x, cam_y, cam_z, lx, ly, lz)

    -- Floor
    for x=-15,15 do for z=-15,15 do
        nova_3d_cube(x, -1.5, z, 0.9, 40+(x*3)%20, 40+(z*3)%20, 60)
    end end

    -- Buildings
    for i=0,30 do
        local bx = math.sin(i*1.7)*12
        local bz = math.cos(i*1.7)*12
        local h = 3 + (i%5)
        for j=0,h do nova_3d_cube(bx, -1+j, bz, 0.9, 150, 100, 80-j*10) end
    end

    -- Bullets
    for _,b in ipairs(bullets) do
        nova_3d_sphere(b.x, b.y, b.z, 0.15, 255, 255, 100)
    end
end