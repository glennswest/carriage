include <CarriageSupport.scad>;

hori = 39;
verti = 50;
fn_cercles=50;

difference(){
	translate([0,12,3])
		rotate([0,180,0])
			carriage();
	translate([-58,0,-5])
		rotate([0,-7,0])
			cube([100,100,2], center=true);
	translate([0,0,-30])
		cube([100,100,5], center=true);
}
difference(){
	difference(){
		roundedRect(size = [hori+10,verti+10,8], radius = 5);
		translate([-11,2,0])
			cube([2,24,30], center=true);
		translate([-20,14,0])
			cube([20,2,30], center=true);

		translate([-5,8,0])
			rotate([0,0,90])
				cube([5.5,2,30], center=true);
	}
//hueco rodes
	union(){
		translate([(hori/2),-(verti/2),0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
		translate([(hori/2),(verti/2),0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
		translate([-(hori/2),0,0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
	}
//hueco cap rodes tornillo
	union(){
		translate([(hori/2),-(verti/2),0])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
		translate([(hori/2),(verti/2),0])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
		translate([-(hori/2),0,0])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
	}
//hueco tornillo
	rotate([0,90,0])
		translate([-4,8,-20])
			cylinder(h=40,d=3.2,$fn=fn_cercles,center=true);
//ranura cap tornillo
	rotate([0,90,0])
		translate([-4,8,-25])
			cylinder(h=4,d=5.2,$fn=fn_cercles,center=true);
}






module roundedRect(size, radius) {

	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
    	// place 4 circles in the corners, with the given radius
    	translate([(-x/2)+(radius/2), (-y/2)+20, 0])
    	circle(r=radius);

    	translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    	circle(r=radius);

    	translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    	circle(r=radius);

    	translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    	circle(r=radius);
	}
}
