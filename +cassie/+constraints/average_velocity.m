function [ avg_vel_fun ] = average_velocity( nlp )
%AVERAGE_VELOCITY constraint for average velocity
%   Constrains the average velocity for both x and y
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Create function for average_velocity constraint
T  = SymVariable('t',[2,1]);
X0  = SymVariable('x0',[nlp.Plant.numState,1]);
XF  = SymVariable('xF',[nlp.Plant.numState,1]);
avg_vel = (XF(1:2) - X0(1:2)) ./ (T(2) - T(1));
avg_vel_fun = SymFunction('average_velocity', avg_vel, {T,X0,XF});

end

