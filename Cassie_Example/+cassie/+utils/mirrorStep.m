function [ step2 ] = mirrorStep( step1 )
%MIRRORSTEP Mirrors a step from optimization
%
% Author: Ross Hartley
%   Date: 2018/03/22

step2 = step1([1:6,14:20,7:13],:);
step2([2,4,6,7,8,14,15],:) = -step2([2,4,6,7,8,14,15],:);
H = [Angles.Euler_to_Rotation( step2(4:6,1) ), step2(1:3,1); zeros(1,3), 1];
H12 = [Angles.Euler_to_Rotation( step1(4:6,end) ), step1(1:3,end); zeros(1,3), 1]; 
for i = 1:size(step2,2)
    H23 = H\[Angles.Euler_to_Rotation( step2(4:6,i) ), step2(1:3,i); zeros(1,3), 1];
    H13 = H12 * H23;
    step2(1:6,i) = [H13(1:3,end); Angles.Rotation_to_Euler(H13(1:3,1:3))];
end

end

