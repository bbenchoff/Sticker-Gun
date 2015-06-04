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
            translate([20,15 ,10])
                cube([70,30,60], center=true);
        }
       
    }
}



module lowerBase(){
        
    difference(){
        solidbase();
        translate([-20,-120,12.5])
            cube([100,200,30]);
       
        scale([0.90,0.90,0.90])
            translate([1,1,1])
                solidbase();
        
    }
    

    
    
}

module battery(){
    color("Teal",1)
        rotate([0,0,15])
            translate([-3, -90, 2])
                cube([40,75,15]);
    
}


union(){

    lowerBase();
    battery();

}