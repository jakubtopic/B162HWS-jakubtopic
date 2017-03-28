use <functions.scad>

/**
 * [keyboardBase description]
 * @param  {[type]} size       [description]
 * @param  {[type]} basemargin [description]
 * @return {[type]}            [description]
 */
module keyboardBase(size,basemargin) {
    hull()
        mirror([0,1,0])
            for (i=[0:1], j=[0:1])
                translate([basemargin+i*size[0],basemargin+j*size[1],0])
                    cylinder(h=size[2], r=basemargin, center=false);
}

/**
 * [parseLayout description]
 * @param  {[type]} layout  [description]
 * @param  {[type]} size    [description]
 * @param  {[type]} keysize [description]
 * @param  {[type]} offset  [description]
 * @param  {[type]} keycap  [description]
 * @return {[type]}         [description]
 */
module parseLayout(layout, size, keysize, offset, keycap, keydip,textsize,textz) {
    for (row = [0:len(layout)-1])
        for (col = [0:len(layout[0])-1])
            if (len(layout[row][col]) > 0)
                translate(multiplyVec(size,[col,-row,0])) {
                    ksize = addVec(
                                multiplyVec(
                                    keysize,
                                    [layout[row][col][0],layout[row][col][1],1]
                                ), [
                                    (layout[row][col][0]-1)*offset,
                                    (layout[row][col][1]-1)*offset, 0
                                ]);
                    if (keycap)
                        keyCap(ksize,layout[row][col][2],keydip,textsize,textz);
                    else
                        keyHole(ksize);
                }
}

/**
 * [keyHole description]
 * @param  {[type]} size [description]
 * @return {[type]}      [description]
 */
module keyHole(size) {
    translate([0,-size[1],0])
        cube(size);
}

/**
 * [keyCap description]
 * @param  {[type]} size     [description]
 * @param  {[type]} text     [description]
 * @param  {Number} keydip   [description]
 * @param  {Number} textsize [description]
 * @param  {Number} textz    [description]
 * @return {[type]}          [description]
 */
module keyCap(size,text,keydip,textsize,textz) {
    color("IndianRed")
    difference() {
        translate([0,-size[1],0])
            cube(size);
        keyCapDip(size, keydip);
    }

    color("white")
    difference() {
        keyCapText(size, text, textsize, textz);
        translate([0,0,textz])
            keyCapDip(size, keydip);
    }
}

/**
 * [keyCapDip description]
 * @param  {[type]} size   [description]
 * @param  {[type]} keydip [description]
 * @return {[type]}        [description]
 */
module keyCapDip(size, keydip) {
    radius = dipRadius(size[0],keydip);
    translate([size[0]/2,0,size[2]+radius-keydip])
            rotate([90,0,0])
                cylinder(r=radius,h=size[1]);
}

/**
 * [keyCapText description]
 * @param  {[type]} size     [description]
 * @param  {[type]} text     [description]
 * @param  {[type]} textsize [description]
 * @param  {[type]} textz    [description]
 * @return {[type]}          [description]
 */
module keyCapText(size, text, textsize, textz) {
    translate(multiplyVec(size,[.5,-.5,0]))
        linear_extrude(height=size[2]+textz)
            text(text, halign="center", valign="center", convexity=10,
                    size=textsize);
}