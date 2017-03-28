// Auxiliary functions

/**
 * [addVec description]
 * @param  {[type]} a  [description]
 * @param  {[type]} b) [description]
 * @return {[type]}    [description]
 */
function addVec(a, b) = 
    (len(a) == len(b)) ? 
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b[i] ] :
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b ];

/**
 * [multiplyVec description]
 * @param  {[type]} a       [description]
 * @param  {Array}  b)      [description]
 * @param  {[type]} len(b)) -             1 ] [description]
 * @return {[type]}         [description]
 */
function multiplyVec(a, b) = [
    for (i = [ 0 : min(len(a),len(b)) - 1 ])
        a[i]*b[i] ];

function dipRadius(x, keydip) = (x*x)/(8*keydip) + keydip / 2;

function baseSize(layout,keysize,keymargin,defaultspace) =
    len(layout)*(keysize+ 2 * keymargin + defaultspace) - defaultspace;