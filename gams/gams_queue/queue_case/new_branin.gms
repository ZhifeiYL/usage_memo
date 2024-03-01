Variable
x1
x2
x3
z
;

x1.up = 10;
x1.lo = -5;
x2.up = 15;
x2.lo = 0;

Parameter
a
b
c
d
h
ff
;

a = 1;
b = 5.1/(4*pi**2);
c = 5/pi;
d = 6;
h = 10;
ff = 1 / (8*pi);

Equation
constraint
objective
;

constraint..
    1/51.95*(power(a*x2-b*power(x1,2)+c*x1-d, 2) + h*(1-ff)*cos(x1) -5 + h) =l= 0;
    
objective..
    z =e= 1/80 * (-power(x1-10, 2) - power(x2-15,2));
    
model new_branin /all/;
option limrow = 50000;
option nlp = ipopth;

Solve new_branin using nlp minimizing z;

execute_unload "new_branin.gdx";