/* rpi4case_holder_MPSMv2.scad
Author: andimoto@posteo.de
----------------------------
 */
$fn=50;
extra=2;
wallThickness=2;

mpsmScrewRadius=1.55;
holeDistancePiCase=75;
radiusPiMountHoles=2.2;

module rpi4case_holder(length=100, depth=15,hight=20)
{
  cutOutHight=hight-wallThickness;
  cutOutDepth=depth-wallThickness;

  difference() {
    cube([length,depth,hight]);

    translate([-extra/2,-extra,-extra]) cube([length+extra,cutOutDepth+extra,cutOutHight+extra]);

    /* top holes */
    translate([(length-holeDistancePiCase)/2,cutOutDepth*0.4,hight-extra/2]) hull() {
        translate([holeDistancePiCase,0,0]) cylinder(r=mpsmScrewRadius, h=wallThickness*2, center=true);
        cylinder(r=mpsmScrewRadius, h=wallThickness*2, center=true);
    }

    /* rpi mounting holes */
    translate([((length-holeDistancePiCase-radiusPiMountHoles*2)),depth-wallThickness/2,cutOutHight/2-1])
    rotate([90,0,0])
    union()
    {
      translate([0, 0, 0]) cylinder(r=radiusPiMountHoles, h=wallThickness*2, center=true);
      translate([holeDistancePiCase, 0, 0]) cylinder(r=radiusPiMountHoles, h=wallThickness*2, center=true);
    }
    /* #translate([88.5,14,-84]) rotate([0,180,0]) import("Rpi_4_Case_Bottom.stl"); */

    /* cut of edges */
    translate([0,0,20]) rotate([0,0,45]) cube([10,10,10], center=true);
    translate([length,0,20]) rotate([0,0,45]) cube([10,10,10], center=true);

    /* extra coutout for z axis */
    translate([-extra,0,0]) cube([(length-holeDistancePiCase-radiusPiMountHoles*4)+extra,depth+extra,cutOutHight]);

    translate([(length-holeDistancePiCase-radiusPiMountHoles*4),depth,0])
      rotate([0,45,0]) cube([10,10,10], center=true);
    translate([(length),depth,0])
      rotate([0,45,0]) cube([10,10,10], center=true);
  }

}

/* extra pins for mounting rpi case on this profile, just to try it out */
module pins()
{
  translate([20,12,8]) rotate([-90,0,0]) cylinder(r=radiusPiMountHoles, h=10);
  translate([20,19,8]) rotate([-90,0,0]) cylinder(r=radiusPiMountHoles+1, h=3);
}


/* ==========================================================================*/
/* --------------------------CALL MODULES----------------------------------- */
/* ========================================================================= */

/* display rpi4 case for simulation */
translate([89,15,-84.2]) rotate([0,180,0]) color("green") import("Rpi_4_Case_Bottom.stl");

/* show profile holder */
rpi4case_holder();

/* simulated pins to show how it looks */
translate([0.6,0,0]) rotate([0,0,0]) pins();
translate([75.6,0,0]) rotate([0,0,0]) pins();

/* only call this for printable pins */
/* translate([-50,0,0]) rotate([0,0,0]) pins();
translate([-60.6,0,0]) rotate([0,0,0]) pins(); */
