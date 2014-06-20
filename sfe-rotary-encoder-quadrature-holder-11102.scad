// assume one unit = 1 mm


// TODO: 
//  * supports for channel lip (near edges) ?   

module thing()
{
  thickness = 5;
  height = 50;
  width = 50;
  mountr = 15;
  $fn = 100;
  hw=36;
  channel_mount_hole_from_c = 12.1412;

  // main panel that mounts to rot enc
  difference() {
    union() {
      cube( [ width, 5, thickness ] );

      translate([ (width-hw)/2, 0 ] ) {
      cube( [ hw, height/2+2, thickness ] );
      translate([ hw/2, height/2+2 ] ) {
         cylinder(h=thickness, r=hw/2, $fn=200);
      }
    }
  }

    // hole for main shaft
    translate([ width/2, height/2, -1 ] ) {
         cylinder(h=thickness*2, r=11, $fn=200);
      }

    translate([ width/2, 25 ] ) {
      translate([ 0, 15, -2 ] ) {
	      cylinder(h=60, r=1.5 );
	   }
   }

    translate([ width/2, 25 ] ) {
      rotate(a=[0,0,120]) {
        translate([ 0, 15, -2 ] ) {
	        cylinder(h=60, r=1.5 );
	     }
     }
   }

    translate([ width/2, 25 ] ) {
      rotate(a=[0,0,240]) {
        translate([ 0, 15, -2 ] ) {
	        cylinder(h=60, r=1.5 );
	     }
     }
   }


}


    // these are the little circles on the sides
    translate([ hw+7, 5, 0 ] ) {
		 cube( [ (width-hw)/2, 5, thickness ] );
 	    translate([ 0, 5, 0 ] ) {
         difference() {
   		   cube( [ (width-hw)/2, (width-hw)/2, thickness ] );
           translate([ (width-hw)/2, (width-hw)/2, -1 ] ) {
    	        cylinder(h=60, r=(width-hw)/2 );
           }
         }
       }
 	 }

    // these are the little circles on the sides
    translate([ 0, 5, 0 ] ) {
		 cube( [ 10, 5, thickness ] );
 	    translate([ 0, 5, 0 ] ) {
         difference() {
   		   cube( [ (width-hw)/2, (width-hw)/2, thickness ] );
           translate([ 0, (width-hw)/2, -1 ] ) {
    	        cylinder(h=60, r=(width-hw)/2 );
           }
         }
       }
 	 }

    // curley lip to the part that is on the channel.
    translate([ 0, 5, 5 ] ) {
difference() {
		 cube( [ width, 3, 3 ] );
        rotate(a=[0,90,0]) {
           translate([ -3, 3, 0 ] ) {
    	        cylinder(h=width+2, r=3 );
           }
       }
     }
   }

  // teeth to slide down the sides of the channel
  translate([ 0, -10 ] ) {
       translate([ 0, 0, 0 ] ) {
	 	    cube( [ 5.9, 10, 15+thickness ] );
       }
       translate([ width-5.9, 0, 0 ] ) {
	 	    cube( [ 5.9, 10, 15+thickness ] );
       }

/*    difference() {
 	    cube( [ width, 10, thickness ] );
       translate([ 6.3, -1, -2 ] ) {
    	    cube( [ 38.1, 10, thickness*2  ] );
       }
	 }
*/
  }

   //
   // a lip to mount to the channel itself
   //
  difference() {
     translate([ 0, 0, thickness ] ) {
       difference() {
  	      cube( [ width, thickness, 15  ] );
         translate([ width/2, 8, 18 ] ) {
             rotate(a=[90,0,0]) {
             translate([ -5, -8, 0 ] ) {
 		  	     cube( [ 10, 15, 17 ] );
             }
           }
         }
         translate([ width/2, 8, 10 ] ) {
             rotate(a=[90,0,0]) {
   	        cylinder( r=5, h=16 );
           }
         }

       }
    }

// outer 1.061 inch apart ( to mm/2 = 13.4747 )
// inner 0.956 inch apart ( to mm/2 = 12.1412 )

     // screw holes through the channel
     translate([ 0, 0, thickness ] ) {
       rotate(a=[90,0,0]) {
         translate([ width/2, 8, -1-thickness ] ) {
           translate([ channel_mount_hole_from_c, 0, 0 ] ) {
           cylinder(h=60, r=1.778 );
           }
           translate([ -1 * channel_mount_hole_from_c, 0, 0 ] ) {
           cylinder(h=60, r=1.778 );
           }
         }
       }
     }


 	  // sink holes for the two screws
     translate([ 0, 0, thickness ] ) {
       rotate(a=[90,0,0]) {
         translate([ width/2, 8, 0-thickness ] ) {
           translate([ channel_mount_hole_from_c - 5, -4, 0 ] ) {
			  	    cube( [ 10, 8, 2 ] );
           }
           translate([ -1 * channel_mount_hole_from_c - 5, -4, 0 ] ) {
			  	    cube( [ 10, 8, 2 ] );
           }
         }
       }
     }

   }
}

//	  	    cube( [ 1, 1, 60  ] );

thing();

