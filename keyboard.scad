/**
* Simple keyboard
* 
* @author Jakub Topic
* @version 1.1
*/

use <keyboard/parts.scad>
use <keyboard/functions.scad>

/**
* Keyboard module
* @param  {Array}  layout       Vector of vectors of vectors, that represents
*                               the keyboard layout.
* @param  {Array}  keysize      XYZ size of a [1,1] key
* @param  {Number} keydip       Dip of keytops
* @param  {Number} textsize     Size of letters
* @param  {Number} textz        Vertical size of letters
* @param  {Number} keymargin    Key margin
* @param  {Number} defaultspace Size of wall separating holes
* @param  {Number} basez        Vertical size of the base
* @param  {Number} basemargin   Base margin
* @param  {Number} upwards      Keycap immersion
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
    // Vector used for a starting translation of keycaps and holes 
    translateSize = [basemargin,-basemargin,basez-keysize[2]+upwards];

    // Keyboard base with holes prepared for keycaps
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
    }

    // Keycaps itself
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
}
