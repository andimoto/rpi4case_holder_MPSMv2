/* rpi4case_holder_MPSMv2.scad
Author: andimoto@posteo.de
----------------------------
 */
$fn=50;
extra=2;
wallThickness=2;
holeDistance=56;
holeDistancePiCase=75;

module rpi4case_holder(length=80, depth=15,hight=20)
{
  cutOutHight=hight-wallThickness;
  cutOutDepth=depth-wallThickness;

  difference() {
    cube([length,depth,hight]);

    translate([-extra/2,-extra,-extra]) cube([length+extra,cutOutDepth+extra,cutOutHight+extra]);

    /* top holes */
    #translate([(length-holeDistance)/2,cutOutDepth/2,hight-extra/2]) union()
    {
      translate([0, 0, 0]) cylinder(r=1, h=4, center=true);
      translate([holeDistance, 0, 0]) cylinder(r=1, h=4, center=true);
    }

    /* rpi mounting holes */
    #translate([(length-holeDistancePiCase)/2,depth,cutOutHight/2])
    rotate([90,0,0])
    #union()
    {
      translate([0, 0, 0]) cylinder(r=1, h=10, center=true);
      translate([holeDistancePiCase, 0, 0]) cylinder(r=1, h=10, center=true);
    }

  }

}





rpi4case_holder();
