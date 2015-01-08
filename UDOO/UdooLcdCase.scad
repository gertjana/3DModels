//comment out lines you don't want to see

//printable parts

//rotate([0,-90,-90]) { caseleft(); }
//rotate([0,90,-90]) { caseright(); }
pin();

// complete views

//translate([-85,-56,-25]) {complete();}
//translate([-85,-56,-25]) {explodedview();}
//translate([-65,-42.5,-10]) {UDOO();}
//translate([-85,-53,-5]){LCD();}

module complete() {	
	translate([0,0,30]) { LCD(); }
	translate([0,0,0]) { UDOO(); }
	translate([-5,0,0]) { caseleft(); }
	translate([85,0,0]) { caseright(); }
	translate([106.5,3.5,-5]) { pin(); }
	translate([106,35,-5]) { pin(); }	
	translate([100,82,-5]) { pin(); }
	translate([3.5,3.5,-5]) { pin(); }
	translate([24,35,-5]) { pin(); }
	translate([21,82,-5]) { pin(); }
}

module explodedview() {
	translate([0,0,30]) { LCD(); }
	translate([0,0,0]) { UDOO(); }
	translate([-25,0,-15]) { caseleft(); }
	translate([105,0,-15]) { caseright(); }
	translate([106.5,3.5,-15]) { pin(); }
	translate([106,35,-15]) { pin(); }	
	translate([100,82,-15]) { pin(); }
	translate([3.5,3.5,-15]) { pin(); }
	translate([24,35,-15]) { pin(); }
	translate([21,82,-15]) { pin(); }
}

module UDOO() {
	difference() {
		color("darkgreen",a=1.0) { cube([110,85,2]);}
	 	translate([106.5,3.5,-5]) { pin(); }
		translate([106,35,-5]) { pin(); }	
		translate([100,82,-5]) { pin(); }
		translate([3.5,3.5,-5]) { pin(); }
		translate([24,35,-5]) { pin(); }
		translate([21,82,-5]) { pin(); }
	}
	color("black",a=1.0) {
		translate([0,39,4]) { cube([54,32,12]);}
		translate([14,71,4]) { cube([40,10,12]);}
		translate([7,72,8]) { rotate([-90,0,0]) {cylinder(h=13,d=10); }}
		translate([2,83,2]) { cube([13,3,11]);}
		translate([29,82,2]) { cube([68,2,15]); } 
		translate([36,36,2]) { cube([60,2,15]); } 
		translate([103,39,2]) { cube([5,45,15]); } 
		translate([93,20,2]) {cube([15,6,8]);}
	}
	color("silver", a=1.0) {
		translate([8,-1,2]) { cube([7,5,3]);}
		translate([20,-1,2]) { cube([7,5,3]);}
		translate([33,-1,2]) { cube([15,13,6]);}
		translate([51,-1,2]) { cube([15,20,13]);}
		translate([67,-1,2]) { cube([15,17,15]);}
	}
	color("palegreen",a=1.0) {
		translate([85,-1,2]) { audiocon();}
	}
	color("lightcoral",a=1.0) {
		translate([94,-1,2]) { audiocon();}
	}
	translate([0,24,2]) { rotate([0,0,-90]) { button(1); }}
	translate([0,14,2]) { rotate([0,0,-90]) { button(3); }}
	translate([82,27,2]) { color("white",a=1.0) { cube([26,5,6]);}}
}

module button(length) {
	color("silver",a=1.0) { translate([0,0,1]) { cube([7,4,7]); }}
	color("black", a=1.0) { translate([3.5,-length,4]) { rotate([-90,90,0]) { cylinder(h=5,d=4,$fn=20); }}}
}


module audiocon() {
	translate([0,4,0]) { cube([8,14,12]); }
	translate([3.5,0,7]) { rotate([-90,90,0]) { cylinder(h=5,d=5,$fn=20); }}
}

module pin() {
	cylinder(h=10,d=3,$fn=20);
	translate([0,0,4]) { cylinder(h=1,d=4,$fn=20); }
}

module LCD() {
	color( "silver",  a=1.0) { cube([165,106,5.5]);}
	translate([0,3,5.5]) { color("steelblue", a=0.3) { cube([165,102,1.1]);}}
	translate([0,0,-2]) 	{ color("darkgreen",a=1.0) { cube([165,40,2]);}}
	translate([105,8,-8]) { color("white",a=1.0) { cube([26,5,6]);}}

}

module bar() {
	{ cube([4,80,2]);}
}

module caseleft() {
	difference() {
		union() {
			difference() {
				translate([0,-2,-4]) { cube([4,112,40.6]);}
				translate([-5,5,2]) { cube([10,20,10]); }
			}
			translate([0,-2,-8]) { cube([90,112,4]);}
			translate([4,-2,26]) { 
				difference() {
					cube([10,112,10.55]);
					translate([0,2,4]) { LCD();}
				}
			}
			translate([4,106,-4]) { cube([10,4,30]); }
		}
		translate([88,14,-7]) {bar();}
		translate([8.5,3.5,-5]) { pin(); }
		translate([29,35,-5]) { pin(); }
		translate([25,82,-5]) { pin(); }
	}
}

module caseright() {
	difference() {
		union() {
			translate([0,-2,-8]) { cube([86,112,4]); }
			translate([82,-2,-4]) { cube([4,112,40.6]);}
			translate([72,-2,26]) { 
				difference() {
					cube([10,112,10.55]);
					translate([-157,2,4]) { LCD();}
				}
			}
			translate([-2,14,-7]) {bar();}
			translate([72,106,-4]) { cube([10,4,30]); }
			translate([72,-2,-4]) { cube([10,4,30]); }
		}
		translate([21.5,3.5,-5]) { pin(); }
		translate([21,35,-5]) { pin(); }	
		translate([15,82,-5]) { pin(); }
	}
}