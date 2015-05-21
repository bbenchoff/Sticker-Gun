
module example001()
{
	difference() {
		cylinder(h=12, r=13, $fn=100);
		translate([0,0,2])
			cylinder(h=12, r=10.5, $fn=100);
		translate([0,0,-1])
			cylinder(h=15, r=1, $fn=100);

		translate([5.25,5.25,-1])
			cylinder(h=15, r=3, $fn=100);

		translate([-5.25,5.25,-1])
			cylinder(h=15, r=3, $fn=100);

		translate([-5.25,-5.25,-1])
			cylinder(h=15, r=3, $fn=100);

		translate([5.25,-5.25,-1])
			cylinder(h=15, r=3, $fn=100);
		
		rotate([0,0,45])
		{
			translate([2.25,2.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,225])
		{
			translate([2.25,2.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,315])
		{
			translate([2.25,2.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

		rotate([0,0,135])
		{
			translate([2.25,2.25,-1])
				cylinder(h=15, r=1, $fn=100);
		}

	}
}

example001();

