function [ func ] = model_error( nlp )
%torque cost for torque
%   Creates SymFunction for a torque cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for torque cost
q = nlp.Plant.States.x;
dq = nlp.Plant.States.dx;
k = SymVariable('k');
T  = SymVariable('t',[2,1]);
t = (k - 1) / (nlp.NumNode - 1) * (T(2) - T(1)) + T(1);


% LIP model x position
g   =  
h   = 
xo  = 
dxo =


% Only under such condisiton, the period T is a real number (exist)
if 0 < (dxo*h - xo*(g*h)^(1/2))/(dxo*h + xo*(g*h)^(1/2)) && dxo*h + xo*(g*h)^(1/2) ~= 0 && in(log((dxo*h - xo*(g*h)^(1/2))/(dxo*h + xo*(g*h)^(1/2)))/(g*h)^(1/2), 'real') && dxo*h ~= xo*(g*h)^(1/2)
   T = (h*log((dxo*h - xo*(g*h)^(1/2))/(dxo*h + xo*(g*h)^(1/2))))/(g*h)^(1/2);
else
   T = ??
end   
   
    

LIP_x = (exp((t*(g*h)^(1/2))/h)*(dxo*h + xo*(g*h)^(1/2)))/(2*(g*h)^(1/2)) - (exp(-(t*(g*h)^(1/2))/h)*(dxo*h - xo*(g*h)^(1/2)))/(2*(g*h)^(1/2));
LIP_dx = (exp((t*(g*h)^(1/2))/h)*(dxo*h + xo*(g*h)^(1/2)))/(2*h) + (exp(-(t*(g*h)^(1/2))/h)*(dxo*h - xo*(g*h)^(1/2)))/(2*h);

cost = q(1) - LIP_x;
func = SymFunction('modelerror', cost, {q, T}, {k});

end

