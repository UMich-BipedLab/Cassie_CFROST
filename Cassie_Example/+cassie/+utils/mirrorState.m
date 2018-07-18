function [ qm, dqm ] = mirrorState( q, dq )
%MIRRORSTEP Mirrors a step from optimization
%
% Author: Ross Hartley
%   Date: 2018/03/22

% Mirror Configuration
qm = q([1:6,14:20,7:13],:);
qm([2,4,6,7,8,14,15],:) = -qm([2,4,6,7,8,14,15],:);
H = [Angles.Euler_to_Rotation( qm(4:6,1) ), qm(1:3,1); zeros(1,3), 1];
H12 = [Angles.Euler_to_Rotation( q(4:6,end) ), q(1:3,end); zeros(1,3), 1]; 
for i = 1:size(qm,2)
    H23 = H\[Angles.Euler_to_Rotation( qm(4:6,i) ), qm(1:3,i); zeros(1,3), 1];
    H13 = H12 * H23;
    qm(1:6,i) = [H13(1:3,end); Angles.Rotation_to_Euler(H13(1:3,1:3))];
end

% Mirror Velocities
dqm = dq([1:6,14:20,7:13],:);
dqm([2,4,6,7,8,14,15],:) = -dqm([2,4,6,7,8,14,15],:);

end

