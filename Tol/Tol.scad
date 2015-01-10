

//disc();
pin();

module disc() {
	difference() {
		union() {
			for (i = [0:20:360]) {
				rotate(a=i, v=[0,0,1]) {
					cube([2,10,2]);
					translate([6,6,0]) {
						cube([10,10,2]);
					}
				}
			}
			for (i = [0:60:360]) {
				rotate(a=i, v=[0,0,1]) {
					cube([1,10,2]);
				}
			}
		}
	pin();
	}
}

module pin() {
	cylinder(h=10,r=2,$fn=40);
	translate([0,0,-10]) {
		cylinder(h=10,r1=0.1,r2=2,$fn=40);
	}
}
