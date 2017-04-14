// Auxiliary functions

/**
 * "Adjusted" vector addition 
 */
function addVec(a, b) = 
    (len(a) == len(b)) ? 
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b[i] ] :
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b ];

/**
 * "Adjusted" vector multiplication
 */
function multiplyVec(a, b) = [
    for (i = [ 0 : min(len(a),len(b)) - 1 ])
        a[i]*b[i] ];

/**
 * Radius of cylinder used for creating keytops dips
 */
function dipRadius(x, keydip) = (x*x)/(8*keydip) + keydip / 2;

/**
 * Function calculating size of keyboard base
 */
function baseSize(layout,keysize,keymargin,defaultspace) =
    len(layout)*(keysize+ 2 * keymargin + defaultspace) - defaultspace;
