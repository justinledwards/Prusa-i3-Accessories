$fn=100;

//horizontal arm
translate([0,100,0])
	difference(){
		union(){
			translate([-50,-15,0])
				cube([100,30,3]);
			translate([-50,0,0])
				cylinder(h = 3,r = 15);
			translate([50,0,0])
				cylinder(h = 3,r = 15);
		};
	translate([-50,0,-1])
		cylinder(h = 5,r = 1.25);
	translate([50,0,-1])
		cylinder(h = 5,r = 1.25);
	};
//bed attachment
translate([-35,40,0])
	difference(){
		union(){
			difference(){
				cube([70,30,30]);
				translate([3,-1,4])
					cube([7.1, 32, 27]);
				translate([13.1,-1,4])
					cube([60, 32, 27]);
			};
		translate([67, 0, 0])
			cube([3,30,15]);
		translate([67, 15, 15])
			rotate([0,90,0])
				cylinder(h = 3,r = 15);

	
		};
	translate([66, 15, 15])
		rotate([0,90,0])
		cylinder(h = 5,r = 1.25);
	};
//camera swivel
translate([-45,15,0])
	difference(){
		union(){
			translate([-15,-15,0])
				cube([15,30,3]);
			translate([-15,-15,0])
				cube([3,30,50]);
			cylinder(h = 3,r = 15);	
			translate([5,-12,40.5])
				rotate([90,0,0])
					cylinder(h = 3,r = 9.5);	
			translate([-15,-15,31])
				cube([20,3,19]);
	
		};
		translate([0,0,-1])
			cylinder(h = 5,r = 1.25);
		translate([5,-11,40.5])
				rotate([90,0,0])
					cylinder(h = 5,r = 1.4);	
	};

//camera attachment
difference(){
	union(){
		cube([58,19,3]);
		translate ([29,0,0])
			cube([3,19,10]);
		translate ([29,9.5,10])
			rotate([0,90,0])
				cylinder(h = 3,r = 9.5);	
	
	};
	translate ([28,9.5,10])
			rotate([0,90,0])
				cylinder(h = 5,r = 1.4);	
};
