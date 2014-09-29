filamentThickness = 0.5;
wallFilaments=2;
wallThickness = wallFilaments*filamentThickness;
floorThickness = 1.5;


clipHeight = 8;
clipHead=4;
clipThickness = 2;
clipWidth = 4;
clipFromCorner=5;



module rightTriangle(adjacent, opposite, depth){
	angle = atan(opposite/adjacent);
	hyp = sqrt(opposite*opposite+adjacent*adjacent);
	difference(){
		cube([opposite, adjacent, depth]);
		translate([opposite,0,-1]) rotate([0,0,angle]) cube([hyp,hyp,depth+2]);
	}

}


module box(l,w,h, thickness = wallThickness, clips=true){
	difference(){
		cube([l,w,h]);
		translate([thickness,thickness,floorThickness]) cube([l-2*thickness,w-2*thickness,h]);
		if(clips){
			translate([clipFromCorner,-1,h-(clipHeight-floorThickness)])cube([clipWidth,wallThickness+2, clipHead]);
			translate([l-clipWidth-clipFromCorner,-1,h-(clipHeight-floorThickness)])cube([clipWidth,wallThickness+2, clipHead]);
			translate([clipFromCorner,w-thickness-1,h-(clipHeight-floorThickness)])cube([clipWidth,wallThickness+2, clipHead]);
			translate([l-clipWidth-clipFromCorner,w-thickness-1,h-(clipHeight-floorThickness)])cube([clipWidth,wallThickness+2, clipHead]);
		}
	}
}




module clip(h=clipHeight, head= clipHead, w= clipWidth, thickness=clipThickness){
	union(){
		cube([w, thickness, h-head+0.1]);
		translate([w,0, h-head]) rotate([0,-90,0]) rightTriangle(4,4,w);
	}
} 

module lid(l,w, clips=true){
	union(){
	cube([l,w,floorThickness]);
		if(clips){
			translate([clipFromCorner+clipWidth, clipThickness+wallThickness,0]) rotate([0,0,180]) clip();
			translate([l-clipFromCorner, clipThickness+wallThickness,0]) rotate([0,0,180]) clip();		
			translate([clipFromCorner, w-clipThickness-wallThickness,0])  clip();
			translate([l-clipFromCorner-clipWidth, w-clipThickness-wallThickness,0])  clip();
		}
	}
}

//example box
/*
l=50; w=30; h=20;
translate([0,-w-5]) lid(l,w);
box(l,w,h);
*/