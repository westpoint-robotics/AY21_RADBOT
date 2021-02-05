module cube_base(width, length, height)
{
    cube(size = [width, length, height], center = true);
}

module cylinder_base(radius, height, roundness)
{
    cylinder(r = radius, h = height, $fn = roundness, center = true);
}

module cone_base(radius1, radius2, height, roundness)
{
    cylinder(r1 = radius1, r2 = radius2, h = height, $fn = roundness, center = true);
}

module sphere_base(radius, roundness)
{
    sphere(r = radius, $fn = roundness, center = true);
}
/****************************************************************/
in_to_mm      = 25.4;
roundness     = 100;

module nav_tower()
{
    //bottom plate
    bottom_plate_x = (17 + 5/8) * in_to_mm;
    bottom_plate_y = 3 * in_to_mm;
    bottom_plate_z = (3/8) * in_to_mm;

    //tower
    tower_x = 2 * in_to_mm;
    tower_y = 2 * in_to_mm;
    tower_z = 24.5 * in_to_mm;
    slot_x  = 0.5 * in_to_mm;
    slot_y  = 0.25 * in_to_mm;
    slot_z  = tower_z;

    //cap cube
    cap_cube_x = 2 * in_to_mm;
    cap_cube_y = 2 * in_to_mm;
    cap_cube_z = (3 + 1/8) * in_to_mm;

    //imu gap
    imu_gap_x = 1.75 * in_to_mm;
    imu_gap_y = 2.1 * in_to_mm;
    imu_gap_z = 1 * in_to_mm;

    //cap disk
    cap_disk_r = 2 * in_to_mm;
    cap_disk_z = (3/8) * in_to_mm;

    translate([0, 0, bottom_plate_z * 0.5])
    {
        cube_base(bottom_plate_x, bottom_plate_y, bottom_plate_z);
        translate([0, 0, tower_z * 0.5])
        {
            difference()
            {
                cube_base(tower_x, tower_y, tower_z);
                for(rz = [-1:2])
                {
                    rotate([0, 0, 90 * rz])
                    translate([(tower_y - slot_y) * 0.5, 0 ,0])
                    cube_base(slot_x, slot_y, slot_z);
                }
            }
            translate([0, 0, tower_z * 0.5 + cap_cube_z * 0.5])
            {
                difference()
                {
                    cube_base(cap_cube_x, cap_cube_y, cap_cube_z);
                    translate([0, 0, - cap_cube_z * 0.5 + imu_gap_z * 0.5 + 2 * in_to_mm])
                    cube_base(imu_gap_x, imu_gap_y, imu_gap_z);
                }
                translate([0, 0, cap_cube_z * 0.5 + cap_disk_z * 0.5])
                cylinder_base(cap_disk_r, cap_disk_z, roundness);
            }
        }
    }
}

module tread_guards()
{
    translate([-26.5 * in_to_mm * 0.5 * 0.001968504/2, -4.625 * in_to_mm * 0.001968504/2, 0])
    import("/home/user1/rad_ws/src/gvrbot_description/meshes/IGVC_8020Frame.stl");
}

rotate([0, 0, 90])
scale([0.001968504/2, 0.001968504/2, 0.001968504/2])
nav_tower();
//tread_guards();
scale([0.001968504/2, 0.001968504/2, 0.001968504/2])
{
    translate([10, 0, -0.125 * 0.5 * in_to_mm])
    difference()
    {
        cube_base(26.5 * in_to_mm, 17.625 * in_to_mm, 0.125 * in_to_mm);
        cube_base(26.5 * in_to_mm, (9.625) * in_to_mm, 0.125 * in_to_mm);
    }

    translate([0, 0, -3.25 * 0.5 * in_to_mm])
    difference()
    {
        cube_base(26.5 * in_to_mm, 10 * in_to_mm, 3.25 * in_to_mm);
        cube_base(26.5 * in_to_mm, (9.625) * in_to_mm, 3.25 * in_to_mm);
    }
}
//difference()
//{
//    tread_guards();
//    scale([0.001968504/2, 0.001968504/2, 0.001968504/2])
//    translate([0, 0, 12 * in_to_mm * 0.5])
//    cube_base(36 * in_to_mm, 17.625 * in_to_mm, 12 * in_to_mm);
//}