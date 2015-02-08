$fn=64;

module pitft() {
	color("darkgreen") {
		cube([56,85,1.7]);
	}
	color("slategray") {
		translate([6,7.5,1.7]) {
			cube([50,70,3.3]);
		}
	}
	color("black") {
		translate([1,1,-15]) {
			cube([5,33.4,15]);
		}
	}
}

module sdc() {
	color("royalblue") {
		cube([24,32,2]);
	}
}

module screw_hole(h) {
	difference() {
		cylinder(d=5,h=h);
		translate([1.5,1.5,-0.5]);cylinder(d=1.5,h=h+1);
	}
}

module screw_hole2(h) {
	difference() {
		cylinder(d=5,h=h, center=true);
		translate([0,0,-1]) { cylinder(d=4,h=h, center=true); }
		cylinder(d=2,h=h+1, center=true);
	}	
}

module screw_pin(h,h2) {
	cylinder(d=5,h=h);
	translate([2.5,2.5,0]);cylinder(d=2.5,h=h2);
}

module roundedbox(xd,yd,zd,rd) {
	union() {
	hull() {
		translate([rd,rd,0]) 		{ cylinder(r=rd, h=zd); }
		translate([xd-rd,rd,0]) 		{ cylinder(r=rd, h=zd); }
		translate([rd,yd-rd,0]) 		{ cylinder(r=rd, h=zd); }
		translate([xd-rd,yd-rd,0]) 	{ cylinder(r=rd, h=zd); }
	}
}
}

module top() {
	union() {
		difference() {
			difference() {
				roundedbox(170,90,25,15);
				translate ([2,2,2]) 		{ roundedbox(166,86,21,15); }
				translate([72.5,-5,1]) 	{ cube([25,10,2.25]); }
				translate([74,85,3]) 	{ cube([16,10,18]); }
				translate([93.5,85,3]) 	{ cube([18,10,16]); }
				translate([99,-5,4]) 	{ cube([13,10,6]); }
				translate([63,9.5,21]) 	{ cube([50,70,5]); }
				translate([59,72,20]) { cube([3,6,10]); }
				translate([59,62,20]) { cube([3,6,10]); }
				translate([59,52,20]) { cube([3,6,10]); }
				translate([59,42,20]) { cube([3,6,10]); }
			}
			translate([-10,-10,-10]) { cube([190,110,22.5]);}
			translate([32,35,25]) { joystick_hole(); }
			translate([138,35,22]) { buttons_holes(); }
	
		}
		translate([71,0,5]) { cube([26,2,8]); }

		translate([8,8,12.5]) { screw_hole(10.5); }
		translate([170-8,8,12.5]) { screw_hole(10.5); }
		translate([170-8,90-8,12.5]) { screw_hole(10.5); }
		translate([8,90-8,12.5]) { screw_hole(10.5); }

		translate([32,35,20]) { joystick_backsupport(); }
		translate([138,35,16]) { buttons_backsupport(); }
	}
}

module bottom() {
	union() {
		difference() {
			difference() {
				roundedbox(170,90,25,15);
				translate ([2,2,2]) {roundedbox(166,86,21,15);}
				translate([71,-5,2]) { cube([26,10,12]); }
				translate([74,85,3]) { cube([16,10,18]); }
				translate([93.5,85,3]) { cube([18,10,16]); }
				translate([99,-5,4]) { cube([13,10,10]); }
				translate([63,9.5,21]) { cube([50,70,5]); }
			}
			translate([-10,-10,12.5]) { cube([190,110,22.5]);}
			translate([8,8,1]) { cylinder(d=4, h=3, center=true); }
			translate([170-8,8,1]) { cylinder(d=4, h=3, center=true); }
			translate([170-8,90-8,1]) { cylinder(d=4, h=3, center=true); }
			translate([8,90-8,1]) { cylinder(d=4, h=3, center=true); }
		}

		translate([95.5,27.5,2]) { screw_pin(1,4); }
		translate([69.5,82,2]) { screw_pin(1,4); }

		translate([8,8,7]) { screw_hole2(10.5); }
		translate([170-8,8,7]) { screw_hole2(10.5); }
		translate([170-8,90-8,7]) { screw_hole2(10.5); }
		translate([8,90-8,7]) { screw_hole2(10.5); }
		translate([53,1,2]) {cube([4,88,2]); }
		translate([113,1,2]) {cube([4,88,2]); }
		
		difference() {
			translate([32,35,1]) { cylinder(d=18, h=12); }
			translate([32,35,1]) { cylinder(d=15, h=13); }
		}
		difference() {
			translate([138,35,1]) { cylinder(d=23, h=12); }
			translate([138,35,1]) { cylinder(d=20, h=13); }
		}
	}
}

module joystick_hole() {
	difference() {
		cylinder(d=24.5,h=8, center=true);
		translate([-1.25,-15,-5]) {	cube([2.5,30,10]); }
		rotate([0,0,90]) { translate([-1.25,-15,-5]) { cube([2.5,30,10]); } }
		translate([0,8,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([0,-22,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([15,-7.07,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([-15,-7.07,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
	}	
}

module joystick_backsupport() {
	rotate([0,0,45]) {
		difference() {
			cylinder(d=31,h=9, center=true);
			cylinder(d=30,h=10, center=true);
			translate([13,13,0]) { cube([10,10,10], center=true); }
			translate([13,-13,0]) { cube([10,10,10], center=true); }
			translate([-13,13,0]) { cube([10,10,10], center=true); }
			translate([-13,-13,0]) { cube([10,10,10], center=true); }
		}

		for(n=[0:90:360]) {
			rotate([0,0,n]) {
				translate([-7.5,12,0]) { cube([1,3,9], center=true); }
				translate([7.5,12,0]) { cube([1,3,9], center=true); }
			}
		}
	}
}

module joystick() {
	difference() {
		cylinder(d=23,h=8, center=true);
		translate([-1.5,-15,-3.5]) {	cube([3,30,8]); }
		rotate([0,0,90]) { translate([-1.5,-15,-3.5]) { cube([3,30,8]); } }
		translate([0,7.07,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([0,-21.21,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([14.14,-7.07,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
		translate([-14.14,-7.07,-5.5]) {rotate([0,0,45]) {  cube([10,10,10]);} }
	translate([0,0,52.9]) { sphere(d=100); }
	}
	translate([0,0,-4]) { cylinder(d=23,h=1, center=true); }
	intersection() {
		translate([0,0,-4]) { cylinder(d=27,h=1, center=true); }
		union() {
			rotate([0,0,45]) { translate([-5.5,-15,-4.5]) { cube([11,30,1]); } }
			rotate([0,0,-45]) { translate([-5.5,-15,-4.5]) { cube([11,30,1]); } }
		}
	}
	translate([0,0,-3.5]) { cylinder(d=8,h=2); }
	translate([0,0,-8]) { cylinder(d=2,h=4); }
	translate([8/1.41,8/1.41,-6]) { cylinder(d=4,h=2); }
	translate([8/1.41,-8/1.41,-6]) { cylinder(d=4,h=2); }
	translate([-8/1.41,8/1.41,-6]) { cylinder(d=4,h=2); }
	translate([-8/1.41,-8/1.41,-6]) { cylinder(d=4,h=2); }
}

module button(angle) {
	rotate([0,0,angle]) {
		union() {
			cylinder(d=10.5,h=9, center=true);
			translate([-1,5.25,-4.5]) { cube([2,2,1]); }
			translate([-2,-7.25,-4.5]) { cube([4,4,1]); }
		}
	}
}

//y 23, x 25
module buttons() {
	translate([0,11.5,0]) { button(0); }
	translate([0,-11.5,0]) { button(180); }
	translate([12.5,0,0]) { button(270); }
	translate([-12.5,0,0]) { button(90); }
}
module buttons_holes() {
	translate([0,11.8,0]) { cylinder(d=12,h=4); }
	translate([0,-11.5,0]) { cylinder(d=12,h=4); }
	translate([12.5,0,0]) { cylinder(d=12,h=4); }
	translate([-12.5,0,0]) { cylinder(d=12,h=4); }
}
module buttons_backsupport() {
	difference() {
		translate([0,11.8,0]) { cylinder(d=13,h=8); }
		translate([0,11.8,-1]) { cylinder(d=12,h=10); }
		translate([0,18,2]) { cube([2.5,2.5,6], center=true); }
		translate([0,6,2]) { cube([5,5,6], center=true); }
	}
	difference() {
		translate([0,-11.5,0]) { cylinder(d=13,h=8); }
		translate([0,-11.5,-1]) { cylinder(d=12,h=10); }
		translate([0,-18,2]) { cube([2.5,2.5,6], center=true); }
		translate([0,-6,2]) { cube([5,5,6], center=true); }
	}

	difference() {
		translate([12.5,0,0]) { cylinder(d=13,h=8); }
		translate([12.5,0,-1]) { cylinder(d=12,h=10); }
		translate([18,0,2]) { cube([2.5,2.5,6], center=true); }
		translate([6,0,2]) { cube([5,5,6], center=true); }
	}

	difference() {
		translate([-12.5,0,0]) { cylinder(d=13,h=8); }
		translate([-12.5,0,-1]) { cylinder(d=12,h=10); }
		translate([-18,0,2]) { cube([2.5,2.5,6], center=true); }
		translate([-6,0,2]) { cube([5,5,6], center=true); }
	}
	translate([-2.5,0,-1]) { cylinder(d=3,h=9); }
	translate([2.5,0,-1]) { cylinder(d=3,h=9); }

}

module small_button() {

}

translate([-28,-45,-15]) {
	color("lightgrey") { translate([0,2,0]) {
//		import("/Users/gertjan/Downloads/RaspberryPiRelease2.stl");
	} }
//	translate([0,2,17.1]) { pitft(); }
//	translate([15,-18,-2]) 	{ sdc(); }
	color("lightblue") { translate([-57,0,-3]) { top(); } }
//	translate([-57,0,-3]) { bottom(); }
//	color("orange") { translate([-25,35,20]) { joystick(); } }
//	color("orange") { translate([81,35,20]) { buttons(); } }
}
