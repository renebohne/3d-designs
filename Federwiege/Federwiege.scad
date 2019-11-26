$fn = 100;


module scheibe()
{
    difference()
    {
    union()
    {            
        difference()
        {
            union()
            {
                cylinder(r=70/2, h=5, center=true);
                //cylinder(r=70/2, h=5, center=true);
                //translate([0,0,5/2+3/2]) cylinder(r=7/2, h=3, center=true);//motorbefestigung
            }
            translate([70/2-13/2-3,0,0]) cylinder(r=13.1/2, h=50, center=true); //Kugellager
            
            //translate([0,0,5/2+3/2]) rotate(a=[0,90,0]) cylinder(r=2.6/2, h=50, center=true); //Motormadenschraube
            translate([50,0,0]) rotate(a=[0,90,0]) cylinder(r=2.6/2, h=50, center=true); //Kugellagermadenschraube
            
            
        }
        translate([0,0,-5/2-3/2])cylinder(r=70/2, h=3, center=true);
    }
    translate([0,0,0]) cylinder(r=4/2, h=50, center=true); //Motor
    translate([70/2-13/2-3,0,0]) cylinder(r=8.5/2, h=50, center=true); //Kugellager innen
    }
}


module quadrant()
{
    difference()
    {
        scheibe();
         translate([-10,35,0]) rotate(a=[0,0,45]) cube([100,50,50], center=true);
         translate([-10,-35,0]) rotate(a=[0,0,-45]) cube([100,50,50], center=true);
        
        translate([-8,8,0]) rotate(a=[45,90,0]) cylinder(r=2.6/2, h=20, center=true); //Motormadenschraube
    }
}



module pcbBefestigung()
{
    translate([44/2,0,0]) cylinder(r=3.7/2, h=50, center=true);
    translate([-44/2,0,0]) cylinder(r=3.7/2, h=50, center=true);
    translate([44/2,-26,0]) cylinder(r=3.7/2, h=50, center=true);
    translate([-44/2,-26,0]) cylinder(r=3.7/2, h=50, center=true);
    translate([10,-26/2,19.5-5]) rotate(a=[0,90,0]) cylinder(r=7/2, h=50, center=true);
}

module motorbefestigung()
{
    difference()
    {
        cube([75,75,15], center=true);
        translate([0,0,2]) cube([75-2,75-2,15], center=true);
        translate([0,0,0]) cylinder(r=7/2, h=50, center=true); //Motorabsatz
        translate([0,15/2,0]) cylinder(r=2.8/2, h=50, center=true); //Motorbefestigungsschraube1
        translate([0,15/2,-5.9]) cylinder(r=4.5/2, h=1, center=true); //Motorbefestigungsschraube1versenkung
        translate([0,-15/2,0]) cylinder(r=2.8/2, h=50, center=true); //Motorbefestigungsschraube2
        translate([0,-15/2,-5.9]) cylinder(r=4.5/2, h=1, center=true); //Motorbefestigungsschraube2versenkung
//        translate([11.5,-6,0]) pcbBefestigung();
        translate([0,20,3.5]) rotate(a=[90,90,0]) cylinder(r=4/2, h=50, center=true);//Ausgang 
    }
    //translate([11.5,-6-26/2,0]) cube([50,32,2], center=true);
}

module deckel()
{
    difference()
    {
        cube([78,78,55+2], center=true);
        translate([0,0,-2]) cube([78-2,78-2,55], center=true);
        translate([15,-10,-20]) rotate(a=[90,180,90]) pcbBefestigung();
        translate([0,20,23]) rotate(a=[90,90,0]) cylinder(r=4/2, h=50, center=true);//Ausgang 
    }
}


//scheibe();
//translate([0,0,15/2-8/2-2/2]) motorbefestigung();
// translate([0,0,-55/2+15/2+3]) deckel();
quadrant();
