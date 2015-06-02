module standoffs(){
    translate([0,8,0]){
        difference(){
            cylinder(h=6, r=2.5, $fs=.25);
            translate([0,0,-4])
                cylinder(h=12, r=1, $fs=.25);
        }
    }
    
    translate([0,-8,0]){
        difference(){
            cylinder(h=6, r=2.5, $fs=.25);
            translate([0,0,-4])
                cylinder(h=12, r=1, $fs=.25);
        }
    }
    
    translate([6,0,0]){
        difference(){
            cylinder(h=6, r=2.5, $fs=.25);
            translate([0,0,-4])
                cylinder(h=12, r=1, $fs=.25);
        }
    }
    
    translate([-6,0,0]){
        difference(){
            cylinder(h=6, r=2.5, $fs=.25);
            translate([0,0,-4])
                cylinder(h=12, r=1, $fs=.25);
        }
    }
}

module standoffHoles(){
 
        translate([-6,0,-4])
            cylinder(h=12, r=1, $fs=.25);
        translate([6,0,-4])
            cylinder(h=12, r=1, $fs=.25);
        translate([0,8,-4])
            cylinder(h=12, r=1, $fs=.25);
        translate([0,-8,-4])
            cylinder(h=12, r=1, $fs=.25);
}

module barrel(){
      difference(){
           cylinder(r=25, h=75, $fa=40);
           cube([6,35,300], center=true);
          
           translate([0,0,-1]){
            cylinder(h=78, r1=5, r2=22);
           }
           
           translate([10,0,-6])
               rotate([90,0,0])
                cylinder(r=19, h=120, center=true);
           
           translate([-10,0,-6])
               rotate([90,0,0])
                cylinder(r=19, h=60, center=true);
      } 
}

module motor(){
 
 cylinder(r=9, h=18);
    
}

module flywheel(){
    cylinder(r=11.75, h=12);
}

module servo(){
    
    rotate([180,0,90]){
        union(){
            translate([-6,0,0]){
                rotate([90,0,0]){
                    cube([12,16,22]);
                    translate([0,16,-5.5])
                        cube([12, 2.5, 33]);
                    translate([0,18.5,0])
                        cube([12,5,22]);
                    
                }
            }
            translate([0,-6,23])    
                cylinder(h=5, d=11.5);
            translate([0,-6,28])
                cylinder(h=6, d=20);
        }
    }
}

module baseUnit()
{

    difference(){
        difference(){
            
            
            
            union(){
                translate([12,0,0])
                    cylinder(h=44, d=35);
                translate([-12,0,0])
                    cylinder(h=44, d=35);
                //translate([12,0,35])
                //    sphere(d=45);
                //translate([-12,0,35])
                //    sphere(d=45);
                
            }
            
            
            union(){
                translate([12,0,4])
                    cylinder(h=30, d=27);
                translate([-12,0,4])
                    cylinder(h=30, d=27);
            }
            
        translate([0,10,25])
            cube([45,35,40], center=true);
            
        }
        translate([-12,0,0])
            standoffHoles();
        translate([12,0,0])
            standoffHoles();
        //translate([0,10,25])
          //  cube([50,30,40], center=true);
        translate([0,0,25])
            cube([10,30,35], center=true);
        
       
    }
    
    //translate([0,47,3])
    //    cube([40,70,6], center=true);
    
    translate([0,-2,25]){
        rotate([90,0,0]){
           barrel();
        }
    }
    
    translate([-12,0,0]){
        standoffs();  
    }
    
    translate([12,0,0]){
        standoffs();  
    }
}

module cover(){
        difference(){
            union(){
                translate([12,0,44])
                    cylinder(h=6, d=35);
                translate([-12,0,44])
                    cylinder(h=6, d=35);
            }
            rotate([0,0,90])
                translate([15,10,62.5])
                    rotate([180,0,90]){
                        union(){
                            translate([-6,3,0]){
                                rotate([90,0,0]){
                                    cube([12,19,22]);
                                        translate([0,12,-5.5])
                                            cube([12,2.5, 33]);
                                }
                            }
                        }
                    }
            translate([12,-15,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([-12,-15,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([-27,0,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([27,0,45])
                cylinder(h=6, d=2, $fs=.5);     
         
    }
}

module extras(){
    translate([12,0,6])
        color("Purple",1)
            motor();
    translate([-12,0,6])
        color("Purple",1)
            motor();
    
    translate([-12,0,15])
        color("SteelBlue",1)
            flywheel();
    translate([12,0,15])
        color("SteelBlue",1)
            flywheel();
    
    rotate([0,0,90])
        translate([15,10,62.5])
            color("Aqua",1)
                servo();
}


union(){
    
    baseUnit();
    

    
    cover();
    
    extras();
    

}