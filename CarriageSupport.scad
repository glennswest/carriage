// Kossel Mini carriage for IGUS DryLin TWE-04-12
// Licence: CC BY-SA 3.0, http://creativecommons.org/licenses/by-sa/3.0/
// Author: Dominik Scholz <schlotzz@schlotzz.com> and contributors
// Based upon: https://github.com/jcrocholl/kossel/blob/master/carriage.scad by jcrocholl
// visit: http://www.schlotzz.com


// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.4;

// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;



separation = 50;
thickness = 4;

horn_thickness = 13;
horn_x = 8;

belt_width = 5;
belt_x = 5.6;
belt_z = 7;



module carriage()
{

	clearance = 0.122;

	// timing belt, up and down
	for (x = [-belt_x, belt_x])
		translate([x, 0, belt_z + belt_width / 2])
			% cube([1.7, 100, belt_width], center = true);


	difference()
	{

	    union()
		{
			// main body
			translate([0, 0, thickness / 2 + 2])
				cube([18, 38, thickness], center = true);

			


			// belt clamps for GT2
			difference()
			{
				union()
				{
					for (y = [-12, 12])
					{
						union()
						{
							translate([-0.5 - clearance * 2, y, horn_thickness / 2 + 1])
								cube([2, 14, horn_thickness - 2], center = true);
							translate([-1 - clearance * 2, y, horn_thickness / 2 + 1])
								cube([2.5, 12, horn_thickness - 2], center = true);
							for (n = [-6, 6])
								translate([-1 - clearance * 2, y + n, horn_thickness / 2 + 1])
									cylinder(r = 1, h = horn_thickness - 2, center = true, $fn = 16);

							translate([3.25 - clearance, y, horn_thickness / 2 + 1])
								cube([5, 14, horn_thickness - 2], center = true);

							translate([7.5, y, horn_thickness / 2 + 1])
								cube([3, 14, horn_thickness - 2], center = true);
						}
					}
				}

				// tooth cutout
				for (x = [1.125 - 0.300 - clearance, 5.375 + 0.30 - clearance])
				{
					for (y = [0 : 19])
					{
						translate([x, 19 - y * 2, 6 - 0.001])
							cylinder(r = 0.7, h = horn_thickness / 2 + 1, $fn = 16);
					}
				}

				// cutout for easier inserting of belt
				for (x = [0.5 - clearance, 6 - clearance])
					translate([x, 0, horn_thickness])
						rotate([0, 45, 0])
							cube([2 + clearance / 2, 50, 2 + clearance / 2], center = true);

			}

		}

		

	}

}

carriage();
