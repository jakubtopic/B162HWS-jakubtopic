use <keyboard/parts.scad>
use <keyboard/functions.scad>

/**
* [keyboard description]
* @param  {Array}  layout       [description]
* @param  {[type]} 1            [description]
* @param  {[type]} "A"]]]       [description]
* @param  {Array}  keysize      [description]
* @param  {[type]} 13           [description]
* @param  {[type]} 7]           [description]
* @param  {Number} keydip       [description]
* @param  {Number} textsize     [description]
* @param  {Number} textz        [description]
* @param  {Number} keymargin    [description]
* @param  {Number} defaultspace [description]
* @param  {Number} basez        [description]
* @param  {Number} basemargin   [description]
* @param  {Number} upwards      [description]
* @return {[type]}              [description]
*/
module keyboard(
        layout=[[[1,1,"A"]]],
        keysize=[13,13,7],
        keydip=2,
        textsize=4,
        textz=0.5,
        keymargin=1,
        defaultspace=0.25,
        basez=10,
        basemargin = 10,
        upwards=2
        ) {

    difference() {
        // Keyboard base
        keyboardBody([
                len(layout[0])*(keysize[0]+ 2 * keymargin) +
                    (len(layout[0]) - 1) * defaultspace,
                len(layout)*(keysize[1]+ 2 * keymargin) +
                    (len(layout) - 1) * defaultspace,
                basez],
                basemargin=basemargin);

        // Holes for keycaps
        translate([basemargin,-basemargin,basez-keysize[2]+upwards])
            parseLayout(
                    layout,
                    addvec(keysize,defaultspace+2*keymargin),
                    addvec(keysize,2*keymargin),
                    defaultspace,
                    false);
                //keyHoles(addvec(keysize,2*keymargin));
    }

    // keycaps
    color("IndianRed")
    translate(
            [basemargin+keymargin,-basemargin-keymargin,basez+upwards-keysize[2]+keymargin])
        parseLayout(layout,addvec(keysize,defaultspace+2*keymargin),keysize,
                defaultspace+2*keymargin, true, keydip,textsize,textz);
            //keyCap(keysize);
}