myHeight=30;
myDiameter=120;
myWalls=10;
cigaretteDiameter = 8;
numberofcigs = 8; //only 4 or 8

$fs=0.1;
$fa=1;

module ashtray(height, diameter, walls, ciggy)
{
	union()
	{
		difference()
		{
			cylinder(h=height, r2=diameter/2, r1=(diameter*0.9)/2);
			translate([0,0,walls])
				cylinder(h=(height*1.01)-walls, r2=(diameter/2)-walls, r1=((diameter*0.9)/2)-walls);
			translate([-(diameter*1.1)/2,0,height*0.975])
				rotate([0, 90, 0])
					cylinder(h=diameter*1.1, r=ciggy/2);
			translate([0, (diameter*1.1)/2, height*0.975])
				rotate([90, 0, 0])
					cylinder(h=diameter*1.1, r=ciggy/2);
			if(numberofcigs == 8)
			{
				translate([-(diameter*1.1)/2.8,-(diameter*1.1)/2.8,height*0.975])
					rotate([0, 90, 45])
						cylinder(h=diameter*1.1, r=ciggy/2);
				translate([-(diameter*1.1)/2.8, (diameter*1.1)/2.8, height*0.975])
					rotate([90, 0, 45])
						cylinder(h=diameter*1.1, r=ciggy/2);
			}
		}
		difference()
		{
			if(height<(diameter/4)*1.1)
			{
				translate([0,0,-diameter/4+height*0.8])
					sphere(r=diameter/4);
			} else {
				sphere(r=diameter/4);
			}
			translate([-diameter/2, -diameter/2, -diameter])
				cube(diameter);
		}
	}
}

ashtray(myHeight, myDiameter, myWalls, cigaretteDiameter);