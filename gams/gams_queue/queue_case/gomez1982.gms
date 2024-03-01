Variable
x1
x2
z
;

x1.up = 1;
x1.lo = -1;
x2.up = 1;
x2.lo = -1;

Equation
constraint
objective
;

constraint..
    -sin(4*pi*x1) + 2*(sin(2*pi*x2))**2 =l= 0;
    
objective..
    z =e= (4 - 2.1*x1**2 + 1/3*x1**4)*x1**2 + x1*x2 + (-4+4*x2**2)*x2**2
    
model gomez1982 /all/;
option limrow = 50000;
option nlp = ipopth;

Solve gomez1982 using nlp minimizing z;

execute_unload "gomez1982.gdx";