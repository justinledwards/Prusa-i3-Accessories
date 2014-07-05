ribsize = 11;
module rib(q)
{
translate([q/2,q/-2,q/2])
	rotate([90,0,0])
		difference(){
			difference(){
			cube(q, center=true);
			cylinder(h=12, r=q/2, center=true);
		}	
		translate([q/2,0,0])
		cube([q+1, q+1, q+4], center=true);
		translate([0,q/2,0])
		cube([q+1, q+1, q+4], center=true);
	};
}

	



//$fn=200;
socketsize = 9.5;
pillarsize = 20;
// deleting openscad design from original to see accuracy
difference(){
// original model
//import("/Users/ws/Downloads/neck-2_2.stl");
//openscad designed part
	union(){
		intersection(){
			union(){
				translate([0,0,10])
					sphere(pillarsize);
				translate([0,0,16])
					sphere(pillarsize);
			}
			union(){
				//top pillar ribs
				translate([0,0,16])
					for(i = [[0, 0, 45],
					  [0, 0, 165],
					  [0, 0, 285]]) 
							{
								rotate(i)
								translate([0,-ribsize+2,0])
									rib(ribsize);	
									}
				translate([0,0,16])
					for(i = [[0, 0, 15],
					  [0, 0, 135],
					  [0, 0, 255]]) 
							{
								rotate(i)
								translate([0,-ribsize+2,0])
									rotate([0,270,0])
										rib(ribsize);	
									}
				//bottom pillar ribs
				translate([0,0,10])
					for(i = [[0, 0, 75],
					  [0, 0, 195],
					  [0, 0, 315]]) 
							{
								rotate(i)
								translate([0,-ribsize+2,0])
									rotate([0,180,0])
										rib(ribsize);	
									}
				translate([0,0,10])
					for(i = [[0, 0, 105],
					  [0, 0, 225],
					  [0, 0, 345]]) 
							{
								rotate(i)
								translate([0,-ribsize+2,0])
									rotate([0,90,0])
										rib(ribsize);	
							}
			}

		}



					
		union(){
			difference(){
			
				union(){
					difference(){
					// main outside structure
					translate([0,0,10])
						cylinder(h=8.5, r=20);
					// bottom cutoff
					translate([0,0,-13])
						cylinder(h=23, r=30);
					// top cutoff
					translate([0,0,16])
						cylinder(h=22, r=30);
					}	
					difference(){
						//pillar structures
						union(){
							translate([0,0,10])
								sphere(pillarsize);
							translate([0,0,16])
								sphere(pillarsize);
						}
						//top and bottom pillar cutoffs
						union(){
							translate([0,0,-10])
								cylinder(h=7, r=30);
							translate([0,0,29])
								cylinder(h=7, r=30);
						}
						//cutouts top layer
						translate([0,0,16])
						for(i = [[0, 0, 75],
					                 [0, 0, 195],
					                 [0, 0, 315]]) 
							{
								rotate(i)
								cube(20);
							}
						translate([0,0,-5])
						for(i = [[0, 0, 15],
					                 [0, 0, 135],
					                 [0, 0, 255]]) 
							{
								rotate(i)
								cube(20);
							}	
					}
				}
				

				//top and bottom sockets
				union(){
					translate([0,0,1])
						sphere(socketsize);
					translate([0,0,25])
						sphere(socketsize);

				}
				//top and bottom socket taper
				union(){
					translate([0,0,32])
						sphere(socketsize);
					translate([0,0,-6])
						sphere(socketsize);

				}
			}
		}
	}
	//socket inside cutout
	union(){
		translate([0,0,0])
			cylinder(h=10, r=socketsize);
		translate([0,0,16])
			cylinder(h=10, r=socketsize);
	}
}
