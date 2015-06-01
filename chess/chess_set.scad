$fn=64;

//pieces();
//print_pawns4();
//print_pieces1();
print_pieces2();
//chess_set();

module base() {
	translate([0,0,4]) { cube([16,16,8],center=true); }
}


module king() {
	base();
	translate([0,0,24]) { cube([12,12,32], center=true); }
	translate([0,0,42]) { cube([10,4,4], center=true); }
	translate([0,0,42]) { cube([4,10,4], center=true); }
}

module queen() {
	base();
	translate([0,0,24]) { cube([12,12,32], center=true); }
	translate([0,0,42]) { cylinder(d=10,h=4, center=true); }
}

module bishop() {
	base();
	hull() {
		translate([0,0,6]) { cube([12,12,4], center=true); }
		translate([0,0,30]) { cube([4,4,4], center=true); }
	}
}

module knight() {
	base();
	translate([-4,0,20]) { cube([8,8,24], center=true); } 
	translate([4,0,28]) { cube([8,8,8], center=true); } 
}

module rook() {
	base();
	translate([0,0,20]) { cube([12,12,24], center=true); }
}

module pawn() {
	base();
	translate([0,0,14]) { cube([12,12,12], center=true); }
}

module pieces() {
	translate([0,-50,0]) { pawn(); }
	translate([0,-30,0]) { rook(); }
	translate([0,-10,0]) { bishop(); }
	translate([0,10,0]) { knight(); }
	translate([0,30,0]) { queen(); }
	translate([0,50,0]) { king(); }
}


module print_pawns4() {
	translate([-20,20,0]) { pawn(); }
	translate([20,20,0]) { pawn(); }
	translate([20,-20,0]) { pawn(); }
	translate([-20,-20,0]) { pawn(); }
}

module print_pieces1() {
	translate([-20,20,0]) { rook(); }
	translate([20,20,0]) { rook(); }
	translate([20,-20,0]) { bishop(); }
	translate([-20,-20,0]) { bishop(); }
}

module print_pieces2() {
	translate([-20,20,0]) { king(); }
	translate([40,20,8]) { rotate([0,-90,0]) { knight(); } }
	translate([20,-20,0]) { queen(); }
	translate([-10,-20,8]) { rotate([0,-90,0]) { knight(); } }
}

module chess_set() {
	translate([0,-70,0]) { rook(); }
	translate([0,-50,0]) { knight(); }
	translate([0,-30,0]) { bishop(); }
	translate([0,-10,0]) { queen(); }
	translate([0,10,0]) { king(); }
	translate([0,30,0]) { bishop(); }
	translate([0,50,0]) { knight(); }
	translate([0,70,0]) { rook(); }	
	translate([20,-70,0]) { pawn(); }
	translate([20,-50,0]) { pawn(); }
	translate([20,-30,0]) { pawn(); }
	translate([20,-10,0]) { pawn(); }
	translate([20,10,0]) { pawn(); }
	translate([20,30,0]) { pawn(); }
	translate([20,50,0]) { pawn(); }
	translate([20,70,0]) { pawn(); }
}




