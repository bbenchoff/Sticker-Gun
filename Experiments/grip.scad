module button(){
 
 cube([12,12,4],center=true);   
 cylinder(d=7,h=7);
 translate([0,0,0])
    cylinder(d=13.1,h=6.5);
    translate([0,0,6.4])
        cylinder(d=11.6, h=4);
    
}

module bar(){
  translate([0,0,100])
    sphere(d=25);
sphere(d=25);
cylinder(h=100, d=25, $fs=0.25);  
}

module solidbase(){
    translate([0,0,12.5]){
        difference(){
            hull(){
                rotate([0,0,15]){
                    
                    rotate([90,0,0])
                        bar();
                
                    translate([35,0,0])
                        rotate([90,0,0])
                            bar();


                    translate([35,0,0])
                        rotate([90,0,0])
                            bar();
                
                    translate([0,0,0])
                        rotate([90,0,0])
                            bar();
              
                }
            }
            translate([20,15 ,7])
                cube([80,30,60], center=true);
        }
        
    }
    
}

module boss(){
    
    difference(){
        cylinder(d=10, h=10);
        translate([0,0,-1])
            cylinder(d=3, h=12, $fs=0.5);
    }
}

module bosshole(){
    
    
}

module lowerGrip(){
union(){        
        difference(){
            solidbase();
            translate([-20,-120,10])
                cube([100,200,30]);
            scale([0.85,0.95,0.90])
                translate([6,1,1])
                    solidbase();
           
           translate([3,-20,10])
            rotate([15,270,0])
                button();

            translate([11,-50,10])
                rotate([15,270,0])
                    button(); 
            
            translate([25,-100,0])
                cylinder(d=10, h=12);
        
            translate([65,-90,0])
                cylinder(d=10, h=12);
        
            translate([-10,-5,0])
                cylinder(d=10, h=12);
                
            translate([50,-5,0])
                cylinder(d=10, h=12);
        }
    
    translate([1,-5,0])
        rotate([0,0,180])   
            rotate([0,0,14])
                cube([2,90,10]);
    
    translate([25,-100,0])
        boss();
        
    translate([65,-90,0])
        boss();
        
    translate([-10,-5,0])
        boss();
        
    translate([50,-5,0])
        boss();
            
    }
}

module battery(){
    color("Teal",1)
        rotate([0,0,15])
            translate([0, -90, 2])
                cube([40,75,15]);
    
}

module Grip()
{
    
    //lowerGrip();
    
    translate([0,0,20])
        mirror([0,0,1])
            lowerGrip();   
    
}

union(){

    Grip();
    
    //battery();
    


}