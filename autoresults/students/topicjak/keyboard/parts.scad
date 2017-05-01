use <functions.scad>

/**
 * Keyboard base module
 * @param  {[type]} size       Size of keyboard base
 * @param  {[type]} basemargin Base margin
 */
module keyboardBase(size,basemargin) {
    hull()
        mirror([0,1,0])
            for (i=[0:1], j=[0:1])
                translate([basemargin+i*size[0],basemargin+j*size[1],0])
                    cylinder(h=size[2], r=basemargin, center=false);
}

/**
 * Keyboard layout parser - module intended for the keycaps and holes generation
 * @param  {[type]} layout   Vector of vectors of vectors, that represents
 *                           the keyboard layout.
 * @param  {[type]} size     Key size plus margins and wall separator size
 * @param  {[type]} keysize  XYZ size of a [1,1] key
 * @param  {[type]} offset   Offset between keycaps
 * @param  {[type]} keycap   Indicates whether to generate keycaps (true) or 
 *                           keyholes (false).
 * @param  {[type]} keydip   Dip of keytops
 * @param  {[type]} textsize Size of letters
 * @param  {[type]} textz    Vertical size of letters
 */
module parseLayout(layout, size, keysize, offset, keycap, keydip, textsize, textz) {
    for (row = [0:len(layout)-1])
        for (col = [0:len(layout[0])-1])
            // Check if the key isn't empty
            if (len(layout[row][col]) > 0)
                translate(multiplyVec(size,[col,-row,0])) {
                    ksize = addVec(
                        multiplyVec(
                            keysize,
                            [layout[row][col][0],layout[row][col][1],1]
                        ), [
                            (layout[row][col][0]-1)*offset,
                            (layout[row][col][1]-1)*offset,
                            0
                        ]);

                    if (keycap)
                        keyCap(ksize,layout[row][col][2],keydip,textsize,textz);
                    else
                        keyHole(ksize);
                }
}

/**
 * Key hole module
 * @param  {[type]} size Size of a key hole
 */
module keyHole(size) {
    translate([0,-size[1],0])
        cube(size);
}

/**
 * Keycap module
 * @param  {[type]} size     Size of keycap
 * @param  {[type]} text     Text to be printed
 * @param  {Number} keydip   Dip of keytops
 * @param  {Number} textsize Size of letters
 * @param  {Number} textz    Vertical size of letters
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
 * Keycap dip
 * @param  {[type]} size   Kize of keycap
 * @param  {[type]} keydip Dip of keytops
 */
module keyCapDip(size, keydip) {
    radius = dipRadius(size[0],keydip);
    translate([size[0]/2,0,size[2]+radius-keydip])
            rotate([90,0,0])
                cylinder(r=radius,h=size[1]);
}

/**
 * Keycap text
 * @param  {[type]} size     Size of keycap used for text alignment
 * @param  {[type]} text     Text to be printed
 * @param  {[type]} textsize Size of letters
 * @param  {[type]} textz    Vertical size of letters
 */
module keyCapText(size, text, textsize, textz) {
    translate(multiplyVec(size,[.5,-.5,0]))
        linear_extrude(height=size[2]+textz)
            text(text, halign="center", valign="center", convexity=10,
                    size=textsize);
}
