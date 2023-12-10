c_lego_1he = 9.6;
//c_lego_1he = 11.3;


module elf78(x=2,y=4,h=1) {
    w=0.2;
    translate([w/2,w/2,w/2]) cube([x*8-w,y*8-w,c_lego_1he*h-w], center=false);
}

module LT(x=0,y=0,z=0) {
    translate([x*8,y*8,z*c_lego_1he]) children();
}

module ZL() {
    rotate([0,0,90]) children();
}

module ZR() {
    rotate([0,0,-90]) children();
}

module YL() {
    rotate([0,-90,0]) children();
}

module XL() {
    rotate([90,0,0]) children();
}

module YR() {
    rotate([0,90,0]) children();
}

module brick1square(a=8) {
    el_brickarea(1,a,1);
    translate([(a-1)*8,0,0]) el_brickarea(1,a,1);
    el_brickarea(a,1,1);
    translate([0,(a-1)*8,0]) el_brickarea(a,1,1);
}


module lego_m8_nut(x=0,y=0,z=0,he=2) {
    difference() {
        translate([x*8,y*8,z*9.6]) lego_boxarea(2,2,he);
        translate([8*(x+1),8*(y+1),z*9.6]) cylinder(d=7.4, h=3*10*he, center=true, $fn=50);
    }

}


module lego_spax1he2() {
    union() {
        translate([0,0,10-5]) translate([0,0,0]) cylinder(d=6, h=10, center=true, $fn=50);
        translate([0,0,10]) cut_spax2x12();
    }
}



// Easy Lego Frame
module el_frame(x=20, y=13, h=2, w=2) {
    el_brickarea(x=x, y=w, h=h);
    el_brickarea(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) el_brickarea(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) el_brickarea(x=x, y=w, h=h);
}

module elf_frame(x=20, y=13, h=2, w=2) {
    elf_brick(x=x, y=w, h=h);
    elf_brick(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) elf_brick(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) elf_brick(x=x, y=w, h=h);
}

module elf13_frame(x=20, y=13, h=2, w=2) {
    elf13_brick(x=x, y=w, h=h);
    elf13_brick(x=w,y=y, h=h);
    translate([8*x-8*w,0,0]) elf13_brick(x=w,y=y, h=h);
    translate([0,8*y-8*w,0]) elf13_brick(x=x, y=w, h=h);
}


module lego1_stl() {
    x="parts/lego/1x1x1HE.stl";
    import(x, convexity=3);
}

module lego1(a=8) {
    difference() {
        union() {
            translate([0,0,9.6/2]) cube([a, a, c_lego_1he], center=true); // klotz
            translate([0,0,11.3/2]) cylinder(d=5.3, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_box(a=8) {
    translate([0,0,9.6/2]) cube([a, a, c_lego_1he], center=true); // klotz
}

module lego1_easy(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}


module lego1_ffeasy(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            //translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
        translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_flat(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            //translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.1, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.3, h=3.3, center=true, $fn=50); // nopp unten
        //translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego1_v2(a=8, he=1, top_nop=1, bottom_nop=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
            if (top_nop == 1) {
                translate([0,0,((he-1)*9.6)+11.3/2]) cylinder(d=5.3-0.18, h=11.3, center=true, $fn=50); // nopp oben, 5.1 lose
            }
        }
        if (bottom_nop == 1) {
            translate([0,0,1-0.3]) cylinder(d=5.2+0.23, h=3.3, center=true, $fn=50); // nopp unten
        }
        //translate([0,0,3/2+9.6-3+0.7]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}

module lego13_v2(a=8, he=1, top_nop=1, bottom_nop=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2/3]) cube([a, a, c_lego_1he*he/3], center=true); // klotz
            hnew=3.2*he+1.7;
            if (top_nop == 1) {
                    translate([0,0,hnew/2]) cylinder(d=5.3-0.18, h=hnew, center=true, $fn=50); // nopp oben, 5.1 lose
                }
            }
            if (bottom_nop == 1) {

        translate([0,0,1-0.3]) cylinder(d=5.2+0.23, h=3.3, center=true, $fn=50); // nopp unten
    }
    
}
}

module lego1_easy_nonop(a=8, he=1) {
    difference() {
        union() {
            translate([0,0,he*9.6/2]) cube([a, a, c_lego_1he*he], center=true); // klotz
        }
        translate([0,0,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten
    }
}




module el13_area(x=2,y=2,xtra=0) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        lego1_3_easy();
    }
    // auto raster END =========================
    if (xtra > 0) {
        translate([0,0,-xtra]) cube([8*x,8*y,xtra], center=false);
    }
}

module el13_brickarea(x=2,y=2) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        difference() {
            lego1_3_easy();
            translate([4,4,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten

        }
    }
    // auto raster END =========================
    
}

module elf13_brickarea(x=2,y=2) {
    // auto raster BEGIN =========================
    raster_nx=x;
    raster_ny=y;
    raster_dx=8;
    raster_dy=8;
    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
        difference() {
            //TODO:bob
            //lego1_3_easy();
            //lego1_v2();
            //translate([4,4,1-0.3]) cylinder(d=5.2+0.1, h=3, center=true, $fn=50); // nopp unten

        }
    }
    // auto raster END =========================
    
}

module lego1_3_easy(a=8, he=1) {
    translate([4,4,0]) union() {
            translate([0,0,he*9.6/2/3]) cube([a, a, c_lego_1he*he/3], center=true); // klotz
            translate([0,0,(11.3-9.6)/2+(c_lego_1he*he/3)]) cylinder(d=5.3-0.1, h=11.3-9.6, center=true, $fn=50); // nopp oben, 5.1 lose
        }
    }

    module lego2() {
        lego1(a=8);
        translate([1*8,0,0]) lego1(a=8);
        translate([2*8,0,0]) lego1(a=8);
    }

    module lego3() {
// auto raster BEGIN =========================
    }




    module el_brickarea(x=2, y=2, h=1, center=false, nonop=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) el_brickarea_noc_(x=x,y=y,h=h,nonop=nonop);
        }
        else {
            el_brickarea_noc_(x=x,y=y,h=h,nonop=nonop);
        }
    }



    module el_brickarea_noc_(x=2, y=2, h=1,nonop=false) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                if (nonop==true) {

                    translate([0,0,0]) lego1_easy_nonop(a=8,he=h);
                }
                else {
                    translate([0,0,0]) lego1_easy(a=8,he=h);
                }
            }
// auto raster END =========================
        }

    }


    module el_ffbrickarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) el_ffbrickarea_noc_(x=x,y=y,h=h);
        }
        else {
            el_ffbrickarea_noc_(x=x,y=y,h=h);
        }
    }

    module elf_area(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) elf_area_(x=x,y=y,h=h);
        }
        else {
            elf_area_(x=x,y=y,h=h);
        }
    }


    module elf_area_(x=2, y=2, h=1) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_flat(a=8,he=h);
            }
// auto raster END =========================
        }

    }



    module elf_brick(x=2, y=2, h=1, center=false, top_nop=1, bottom_nop=1, do78=0) {
        if (center) {
            translate([-x/2*8,-y/2*8,0*-c_lego_1he*h/2]) elf_brick_(x=x,y=y,h=h, top_nop=top_nop, bottom_nop=bottom_nop, do78=do78);
        }
        else {
            elf_brick_(x=x,y=y,h=h, top_nop=top_nop, bottom_nop=bottom_nop, do78=do78);
        }
    }


    module elf_brick_(x=2, y=2, h=1, top_nop, bottom_nop, do78=0) {

        if (do78 == 1) {
            intersection() {
                LT(0,0,-1) elf78(x=x,y=y,h=h+2);
// auto raster BEGIN =========================
        translate([4,4,0]) union() {
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_v2(a=8,he=h, top_nop=top_nop, bottom_nop=bottom_nop);
            }
        }
// auto raster END =========================
            }
        }
        else {

// auto raster BEGIN =========================
        translate([4,4,0]) union() {
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_v2(a=8,he=h, top_nop=top_nop, bottom_nop=bottom_nop);
            }
        }
// auto raster END =========================
        }

    }

    module elf13_brick(x=2, y=2, h=1, center=false, top_nop=1, bottom_nop=1, do78=0) {
        if (center) {
            translate([-x/2*8,-y/2*8,0*-c_lego_1he*h/2]) elf13_brick_(x=x,y=y,h=h,top_nop=top_nop, bottom_nop=bottom_nop,do78=do78);
        }
        else {
            elf13_brick_(x=x,y=y,h=h,top_nop=top_nop, bottom_nop=bottom_nop,do78=do78);
        }
    }


    module elf13_brick_(x=2, y=2, h=1,top_nop, bottom_nop,do78=0) {

        if (do78 == 1) {
            intersection() {
                LT(0,0,-1) elf78(x=x,y=y,h=2);
                // auto raster BEGIN =========================
                translate([4,4,0]) union() {
                    raster_nx=x;
                    raster_ny=y;
                    raster_dx=8;
                    raster_dy=8;
                    for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                        translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                        translate([0,0,0]) lego13_v2(a=8,he=h,top_nop=top_nop, bottom_nop=bottom_nop);
                    }
                }
                // auto raster END =========================
            }

        }
        else {
            // auto raster BEGIN =========================
            translate([4,4,0]) union() {
                raster_nx=x;
                raster_ny=y;
                raster_dx=8;
                raster_dy=8;
                for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,0]) lego13_v2(a=8,he=h,top_nop=top_nop, bottom_nop=bottom_nop);
                }
            }
            // auto raster END =========================
        }



    }

    module el_ffbrickarea_noc_(x=2, y=2, h=1) {

        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                translate([0,0,0]) lego1_ffeasy(a=8,he=h);
            }
// auto raster END =========================
        }

    }





    module lego_brickarea_noc_(x=2, y=2, h=1) {
        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                for (i=[0:h-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,i*c_lego_1he]) lego1_stl();
                }
            }
// auto raster END =========================
        }

    }

    module lego_boxarea_noc_(x=2, y=2, h=1) {
        translate([4,4,0]) union() {

// auto raster BEGIN =========================
            raster_nx=x;
            raster_ny=y;
            raster_dx=8;
            raster_dy=8;
            for (raster_x=[0:raster_nx-1]) for (raster_y=[0:raster_ny-1]) {
                for (i=[0:h-1]) {
                    translate([raster_dx*raster_x, raster_dy*raster_y, 0])
                    translate([0,0,i*c_lego_1he]) lego1_box();
                }
            }
// auto raster END =========================
        }

    }

    module lego_brickarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) lego_brickarea_noc_(x=x,y=y,h=h);
        }
        else {
            lego_brickarea_noc_(x=x,y=y,h=h);
        }
    }

    module lego_boxarea(x=2, y=2, h=1, center=false) {
        if (center) {
            translate([-x/2*8,-y/2*8,-c_lego_1he*h/2]) lego_boxarea_noc_(x=x,y=y,h=h);
        }
        else {
            lego_boxarea_noc_(x=x,y=y,h=h);
        }
    }
