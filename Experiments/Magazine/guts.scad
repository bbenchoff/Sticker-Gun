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
    translate([-16,6.5,61]){
        rotate([180,0,270]){
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
                    cylinder(h=5, d=20);
            }
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
            
            translate([12,-15,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([-12,-15,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([-27,0,45])
                cylinder(h=6, d=2, $fs=.5);
            translate([27,0,45])
                cylinder(h=6, d=2, $fs=.5);     
            translate([-16,.5,40])
                cube([22,12,20]);
            
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
    
    color("Aqua",1)
        servo();
}

module magbarrel(){
    union(){
        difference(){
            
            translate([0,0,1]){
                cylinder(h=98, d=35, $fs = 0.5);
            }
            cylinder(h=100, d= 26, $fs = 0.5);
            
            translate([14,0,52])
                cube([3,3,105], center=true);
            translate([-14,0,52])
                cube([3,3,105], center=true);
            
        }
    }
}

module upper(){
    
    union(){
        translate([4,54,6])
            cube([37,88,2], center=true);
        translate([21.5,54,17])
            cube([2,88,20], center=true);
        
            difference(){
                translate([-15,98,25])
                    rotate([90,0,0])
                        cylinder(h=80, d=45);
                magbarrel();
                translate([-15,99,25])
                    rotate([90,0,0])
                        cylinder(h=99, d=34);
                
                translate([-30,50,25])
                cube([30,100,45], center=true);
                
                translate([-8,60,2.5])
                cube([15,100,5], center=true);
            }
        
        translate([0,58,10])
            cube([6,80,6],center=true);
        
        translate([5,58,16])
            cube([5,80,20], center=true);
    }
}


union(){
    
     baseUnit();
    
    translate([-15,15,25])
        rotate([270,0,0])
            magbarrel();
    
    //cover();

    color("DarkSlateGray",1)
        upper();
    
    
    extras();
    

}