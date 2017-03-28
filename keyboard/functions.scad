/**
 * [addvec description]
 * @param  {[type]} a  [description]
 * @param  {[type]} b) [description]
 * @return {[type]}    [description]
 */
function addvec(a, b) = 
    (len(a) == len(b)) ? 
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b[i] ] :
        [ for (i = [ 0 : len(a)-1 ]) a[i] + b ];

/**
 * [multiplyvec description]
 * @param  {[type]} a       [description]
 * @param  {Array}  b)      [description]
 * @param  {[type]} len(b)) -             1 ] [description]
 * @return {[type]}         [description]
 */
function multiplyvec(a, b) = [
    for (i = [ 0 : min(len(a),len(b)) - 1 ])
        a[i]*b[i] ];

/**
 * [dipRadius description]
 * @param  {[type]} x       [description]
 * @param  {[type]} keydip) [description]
 * @return {[type]}         [description]
 */
function dipRadius(x, keydip) = (x*x)/(8*keydip) + keydip / 2;