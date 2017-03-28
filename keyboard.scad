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
    translateSize = [basemargin,-basemargin,basez-keysize[2]+upwards];

    difference() {
        // Keyboard base:
        keyboardBase([
                baseSize(layout[0],keysize[0],keymargin,defaultspace),
                baseSize(layout,keysize[1],keymargin,defaultspace),
                basez
            ], basemargin);

        // Holes for keycaps
        translate(addVec(translateSize,[0,0,-keymargin]))
            parseLayout(
                    layout,
                    addVec(keysize,defaultspace+2*keymargin),
                    addVec(keysize,2*keymargin),
                    defaultspace,
                    false);
                //keyHoles(addVec(keysize,2*keymargin));
    }

    // keycaps
    translate(addVec(translateSize,[keymargin,-keymargin,0]))
        parseLayout(
                layout,
                addVec(keysize,defaultspace+2*keymargin),
                keysize,
                defaultspace+2*keymargin,
                true,
                keydip,
                textsize,
                textz);
            //keyCap(keysize);
}