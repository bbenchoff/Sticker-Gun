module magbarrel(){
    union(){
        difference(){
            
            translate([0,0,1]){
                cylinder(h=98, d=40, $fs = 0.5);
            }
            cylinder(h=100, d= 26, $fs = 0.5);
            
            translate([14,0,52])
                cube([3,3,105], center=true);
            translate([-14,0,52])
                cube([3,3,105], center=true);
            
        }
    }
}

module magback(){

        difference(){
            translate([0,0,90])
                cylinder(h = 15, d=45, $fa=0.1);
            magbarrel();
            translate([0,0,88])
                cylinder(h=11, d=40);
            
        }
  
    
}

module prefollower(){
    
    scale([0.95,0.95,1]){
        difference(){
            translate([0,0,15])
                cylinder(h=3, d=38);
            magbarrel();
        }
    }
}

module follower(){
    difference(){
        
        prefollower();
        
        translate([0,-8,0])
            cylinder(h=20, d=3, $fs=0.5);
        translate([0,8,0])
            cylinder(h=20, d=3, $fs=0.5);
        
    }
    
}


magbarrel();

magback();

follower();
