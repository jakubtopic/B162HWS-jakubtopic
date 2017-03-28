use <keyboard.scad>
difference(){
keyboard(
    keysize=[15,10,9],
    keydip=3,
    textsize=3,
    textz=1,
    keymargin=2,
    defaultspace=0.1,
    basez=15,
    basemargin = 5,
    upwards=2,
    layout=[
    [[1,1, "Esc"], [], [1,1,"F1"], [1,1,"F2"], [1,1,"F3"], [1,1,"F4"], [], [1,1,"F5"], [1,1,"F6"], [1,1,"F7"], [1,1,"F8"], [], [1,1,"F9"], [1,1,"F10"], [1,1,"F11"], [1,1,"F12"], [], [1,1], [1,1], [1,1], [], [], [], [], []],
    [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
    [[1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [1,1], [2,1], [], [], [1,1], [1,1], [1,1], [], [1,1], [1,1], [1,1], [1,1]],
    [[2,1], [], [1,1,"Q"], [1,1,"W"], [1,1,"E"], [1,1,"R"], [1,1,"T"], [1,1,"Y"], [1,1,"U"], [1,1,"I"], [1,1,"O"], [1,1,"P"], [1,1], [1,1], [2,2], [], [], [1,1], [1,1], [1,1], [], [1,1], [1,1], [1,1], [1,2]],
    [[2,1], [], [1,1,"A"], [1,1,"S"], [1,1,"D"], [1,1,"F"], [1,1,"G"], [1,1,"H"], [1,1,"J"], [1,1,"K"], [1,1,"L"], [1,1], [1,1], [1,1], [], [], [], [], [], [], [], [1,1], [1,1], [1,1], []],
    [[3,1], [], [], [1,1,"Z"], [1,1,"X"], [1,1,"C"], [1,1,"V"], [1,1,"B"], [1,1,"N"], [1,1,"M"], [1,1], [1,1], [1,1], [3,1], [], [], [], [], [1,1], [], [], [1,1], [1,1], [1,1], [1,2]],
    [[2,1], [], [2,1], [], [6,1], [], [], [], [], [], [2,1], [], [2,1], [], [2,1], [], [], [1,1], [1,1], [1,1], [], [2,1], [], [1,1], []],
],$fn = 100);
    
    translate([0,-50,0])cube(200,100,30);
}