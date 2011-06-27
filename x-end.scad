// PRUSA Mendel  
// X-end prototype for
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 
use <bushing.scad>
use <teardrop.scad>

axis_diameter_real = 4;
axis_diameter_larger = 4.5 ;
pressure_pad_height = 1.4;
add_strenght = 1;

module xend(){

translate(v = [0, 9.5, 0])bushing(true,13);
translate(v = [0, 4.8, 0.5])cube(size = [8,2,1], center = true);
translate(v = [0, 4.8, 12.5])cube(size = [8,2,1], center = true);
translate(v = [0, 9.5, 48])bushing(true,13);
translate(v = [0, 4.8, 48+0.5])cube(size = [8,2,1], center = true);
translate(v = [0, 4.8, 48+12.5])cube(size = [8,2,1], center = true);
translate(v = [0, 9.5, 32]){
difference(){
bushing(true,16);
translate(v = [0,3,2]) rotate(a=[45,0,0]) cube(size = [16,30,16], center = true);
}
}


translate(v = [0,35,24.5]) union(){ 

difference(){
union(){
translate(v = [-25, -40, -16.6])cube(size = [20,40,15.8], center = true);
translate(v = [25, -40, -16.6])cube(size = [20,40,15.8], center = true);
}

translate(v = [-25, -40, -16.6]){
translate(v = [-12,0,2]) rotate(a=[0,25,0]) cube(size = [10,50,20], center = true);
mirror() translate(v = [-12,0,2]) rotate(a=[0,25,0]) translate(v = [0,-3.5,0]) cube(size = [10,13,20], center = true);
translate(v = [-13,0,]) rotate(a=[0,-10,0]) cube(size = [10,50,20], center = true);
mirror() translate(v = [-13,0,]) rotate(a=[0,-10,0]) translate(v = [0,-3.5,0]) cube(size = [10,13,20], center = true);
}

mirror(){
translate(v = [-25, -40, -16.6]){
translate(v = [-12,0,2]) rotate(a=[0,25,0]) cube(size = [10,50,20], center = true);
mirror() translate(v = [-12,0,2]) rotate(a=[0,25,0]) translate(v = [0,-3.5,0]) cube(size = [10,13,20], center = true);
translate(v = [-13,0,]) rotate(a=[0,-10,0]) cube(size = [10,50,20], center = true);
mirror() translate(v = [-13,0,]) rotate(a=[0,-10,0]) translate(v = [0,-3.5,0]) cube(size = [10,13,20], center = true);
}
}


//holes for axis
translate(v = [-25, -23, -16.7]) rotate(a=[90,0,0]) {
	rotate(a=[-90,-90,0]){ 
		//making friction area
		difference(){
			//hole cuting
			teardropcentering(axis_diameter_larger,50);
			//substracting friction pad
			translate(v = [0, -axis_diameter_larger, (-axis_diameter_larger-10)-(axis_diameter_real-pressure_pad_height)]) cube(size = [33,axis_diameter_larger*2,axis_diameter_larger+10]);
		}
		//smaller cut
		translate(v = [0, axis_diameter_larger-1, -axis_diameter_larger]) #cube(size = [34,1,axis_diameter_larger]);
		//cut thru	
		translate(v = [0, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [34,1,axis_diameter_larger+10]);
		//bottom cut
		translate(v = [0, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [1,axis_diameter_larger*2,axis_diameter_larger+10]);
		//top cut
		translate(v = [33, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [1,axis_diameter_larger*2,axis_diameter_larger+10]);
		
		if(add_strenght==1){
		//strenght cuts
		translate(v = [5, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [10, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [15, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [20, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [25, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [30, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [5+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [10+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [15+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [20+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [25+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		}

		
	}
}
mirror([ 1, 0, 0 ])translate(v = [-25, -23, -16.7]) rotate(a=[90,0,0]) {
	rotate(a=[-90,-90,0]){ 
		//making friction area
		difference(){
			//hole cuting
			teardropcentering(axis_diameter_larger,50);
			//substracting friction pad
			translate(v = [0, -axis_diameter_larger, (-axis_diameter_larger-10)-(axis_diameter_real-pressure_pad_height)]) cube(size = [33,axis_diameter_larger*2,axis_diameter_larger+10]);
		}
		//smaller cut
		translate(v = [0, axis_diameter_larger-1, -axis_diameter_larger]) cube(size = [34,1,axis_diameter_larger]);
		//cut thru	
		translate(v = [0, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [34,1,axis_diameter_larger+10]);
		//bottom cut
		translate(v = [0, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [1,axis_diameter_larger*2,axis_diameter_larger+10]);
		//top cut
		translate(v = [33, -axis_diameter_larger, -axis_diameter_larger-10]) cube(size = [1,axis_diameter_larger*2,axis_diameter_larger+10]);
		if(add_strenght==1){
		//strenght cuts
		translate(v = [5, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [10, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [15, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [20, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [25, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [30, axis_diameter_larger-2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [5+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [10+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [15+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [20+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
		translate(v = [25+2.5, axis_diameter_larger+2, -axis_diameter_larger]) cylinder(h = 7, r=0.4, $fn=6, center=true);
}
		
	}
}

}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -3.5, -9.5]) cube(size = [15.5+2*thin_wall,17,60], center = true);

	translate(v = [0, -3.5, -31.6]) cube(size = [33,17,15.8], center = true);
}
	translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);}

//nut trap
//correction for thin wall



translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -19.5])cylinder(h = 40, r=m8_nut_diameter/2+thin_wall*corection, $fn=6, center=true);
	translate(v = [0, 0, -31.6]) cube(size = [35,10,15.8], center = true);}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cylinder(h = 4, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);}
	translate(v = [0, 0, 12.5]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//idler wheel connector
}

//two more rounded corners

}

module xendcorners(dia1, dia2, dia3, dia4, height=0){
translate(v = [0,35,24.5]) union(){ 
//round corners
translate(v = [33.1, -60.1, -25]) rotate(a=[0,0,90]) roundcorner(dia1);
translate(v = [33.1, -19.9, -25]) rotate(a=[0,0,-180]) roundcorner(dia2);
translate(v = [-33.1,-60.1,-25]) rotate(a=[0,0,0]) roundcorner(dia3);
translate(v = [-33.1, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(dia4);
}
}
//xendcorners(5,5,5,5,0);
xend();



