
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
			translate([4.25,4.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,225])
		{
			translate([4.25,4.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,315])
		{
			translate([4.25,4.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,135])
		{
			translate([4.25,4.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

	}
}
Slinger();

