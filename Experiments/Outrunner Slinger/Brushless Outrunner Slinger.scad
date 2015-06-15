
module Slinger()
{
	difference() {
		cylinder(h=12, d=23.7, $fn=100);
		translate([0,0,2])
			cylinder(h=12, d=23.10, $fn=100);
		translate([0,0,-1])
			cylinder(h=15, r=1, $fn=100);
		
		rotate([0,0,45])
		{
			translate([3.25,3.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,225])
		{
			translate([3.25,3.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,315])
		{
			translate([3.25,3.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,135])
		{
			translate([3.25,3.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

	}
}

module torus()
{


	difference(){
		translate([0,0,2])
			rotate_extrude(convexity = 10, $fn = 100)
				translate([10, 0, 0])
					circle(r = 1.75, $fn = 100);
		translate([0,0,4])
			rotate_extrude(convexity = 10, $fn = 100)
				translate([10, 0, 0])
					circle(r = 1.7, $fn = 100);
		translate([0,0,6])
			cube([30,30,5], center=true);
	}
}
Slinger();

torus();

