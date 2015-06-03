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
           
           translate([0,-25.5,-2]){
                rotate([270,0,0]){
                   cover();
                }
            }
           
            }
            
           
         
      }
     
     


module motor(){
 
 cylinder(r=9, h=18);
    
}

module flywheel(){
    cylinder(r=11.75, h=12);
}

module servo(){
    translate([-20,8,60.5]){
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
                    cylinder(h=5, d=25);
            }
        }
    }
}

module baseUnit(){
    difference(){
        union(){
            
            difference(){    
                translate([-21,13,25])  
                    sphere(d=35);
                translate([-21,13,25])
                    sphere(d=32);
                translate([-12.5,13,25])
                    cube([20,36,36],center=true);
                translate([-12,0,4])
                    cylinder(h=30, d=27);
                translate([-25,23.5,25])
                    cube([36,20,36],center=true);
             }
             

          
            difference(){
                difference(){
                    
                    
                    
                    union(){
                        translate([12,0,0])
                            cylinder(h=42.5, d=35);
                        translate([-12,0,0])
                            cylinder(h=42.5, d=35);
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
                translate([-21,13,25])
                    sphere(d=32);
                
                translate([-12,0,0])
                    standoffHoles();
                translate([12,0,0])
                    standoffHoles();
                //translate([0,10,25])
                  //  cube([50,30,40], center=true);
                translate([0,0,25])
                    cube([10,30,35], center=true);
                
               servo();
               
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
    }
    
}
module cover(){

            difference(){            
                union(){
                    translate([12,0,42])
                        cylinder(h=8, d=35);
                    translate([-12,0,42])
                        cylinder(h=8, d=35);
                    translate([0,10,46])
                        cube([57,15,8], center=true);
                }
                
                translate([12,-15,45])
                    cylinder(h=6, d=2, $fs=.5);
                translate([-12,-15,45])
                    cylinder(h=6, d=2, $fs=.5);
                translate([-27,0,45])
                    cylinder(h=6, d=2, $fs=.5);
                translate([27,0,45])
                    cylinder(h=6, d=2, $fs=.5);     
                translate([-20,2,40])
                    cube([22,12,20]);
                
                
                
                servo();
                
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
difference(){
        union(){
            difference(){
                translate([0,0,1]){
                    union(){
                        cylinder(h=98, d=35, $fs = 0.5);
                        cylinder(h=5, d=35);
                    }
                }
                translate([0,0,-10])
                    cylinder(h=115, d= 26, $fs = 0.5);
                
                translate([14,0,52])
                    cube([3,3,105], center=true);
                translate([-14,0,52])
                    cube([3,3,105], center=true);
                
                translate([17,0,3]) 
                    cube([35,35,7], center = true);  
            }
          cylinder(h=5, d=35);  
        }
        translate([15,0,3]) 
        cube([35,35,9], center = true); 
        
        translate([0,-5,-1])
            cylinder(d=15, h=12);
        
    }
    
    
    
}

module feeder(){
    
    translate([-13,8,5]){
            difference(){
                cylinder(h=30, d=35);
                translate([0,0,-1])
                    cylinder(h=40, d=25);
                
                translate([0,-12,15])
                    cube([35,20,55], center=true);
            
                translate([-7.5,0,15])
                    cube([20,35,55], center=true);
                
                translate([-1,12,0])   
                    cube([10,10,40]);
                
                translate([-10,13,19])
                    rotate([90,0,0])
                        cylinder(h=5, d=36);
                translate([25,-4,-1])
                    cylinder(r=12, h=40);
          }
          
      }
  }
  
  
module barrelHolder(){
               difference(){
                translate([-21,99,25])
                    rotate([90,0,0])
                        cylinder(h=79, d=45);
                magbarrel();
                translate([-21,103,25])
                    rotate([90,0,0])
                        cylinder(h=108, d=32);
                
                translate([-30,50,25])
                cube([30,100,45], center=true);
                
                translate([-10,62,2.5])
                cube([15,100,5], center=true);
            }
        
        translate([-5,60,10])
            cube([6,80,6],center=true);
        
        translate([-1,60,16])
            cube([5,80,20], center=true); 
}

module upper(){
    
    union(){
        translate([4,56,6])
            cube([37,88,2], center=true);
        translate([21.5,56,17])
            cube([2,88,20], center=true);

        translate([0,-1,0])
                barrelHolder();
        
       
        feeder();
        
    }
}


union(){
    
    baseUnit();
    
    //translate([-21,13,25]) 
    //    rotate([270,0,0])
    //        magbarrel();
    
   //cover();

    //color("DarkSlateGray",1)
   //     upper();
    
    
   //extras();
    

}