syms x(t) 
syms g h real;
Dx = diff(x);

ode = diff(x,t,2) == g/h*x;
cond1 = x(0) == 1;
cond2 = Dx(0) == 1;


conds = [cond1 cond2];
xSol(t) = dsolve(ode,conds);
xSol = simplify(xSol)