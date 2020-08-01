/* rpi4case_holder_MPSMv2.scad
Author: andimoto@posteo.de
----------------------------
 */
$fn=50;
extra=2;
wallThickness=2;
holeDistancePiCase=75;

module rpi4case_holder(length=90, depth=15,hight=20)
{
  cutOutHight=hight-wallThickness;
  cutOutDepth=depth-wallThickness;

  difference() {
    cube([length,depth,hight]);

    translate([-extra/2,-extra,-extra]) cube([length+extra,cutOutDepth+extra,cutOutHight+extra]);

    /* top holes */
    #translate([(length-holeDistancePiCase)/2,cutOutDepth/2,hight-extra/2]) hull() {
        translate([holeDistancePiCase,0,0]) cylinder(r=1.5, h=4, center=true);
        cylinder(r=1.5, h=4, center=true);
    }

    /* rpi mounting holes */
    #translate([(length-holeDistancePiCase)/2,depth,cutOutHight/2-1])
    rotate([90,0,0])
    union()
    {
      translate([0, 0, 0]) cylinder(r=2.5, h=10, center=true);
      translate([holeDistancePiCase, 0, 0]) cylinder(r=2.5, h=10, center=true);
    }
    /* translate([76,14,-84]) rotate([0,180,0]) import("Rpi_4_Case_Bottom.stl"); */

    /* cut of edges */
    translate([0,0,20]) rotate([0,0,45]) cube([10,10,10], center=true);
    translate([length,0,20]) rotate([0,0,45]) cube([10,10,10], center=true);

  }

}

/* hull() {
    translate([100,0,0]) cylinder(r=1.5, h=4, center=true);
    cylinder(r=1.5, h=4, center=true);
} */


/* translate([76,15,-83]) rotate([0,180,0]) color("green") import("Rpi_4_Case_Bottom.stl"); */
  rpi4case_holder();
