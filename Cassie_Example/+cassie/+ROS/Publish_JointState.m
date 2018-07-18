function [] = Publish_JointState(t, q, varargin)
% Publish_JointState
% Publishes sensor_msgs/JointState ROS message
%
%   q (20 x N): logged configuration vector for N time steps
%   t (1 x N): time 
%
%   Author: Ross Hartley
%   Date:   12/15/2017

p = inputParser; 

p.addOptional('dq', zeros(size(q)))
p.addOptional('ddq', zeros(size(q)))
p.addOptional('time_scale', 1)
p.addOptional('elevation_map_image', [])

p.parse(varargin{:});
parser_results = p.Results;

% Initialize Publisher
pub_joint_state = rospublisher('/joint_states_matlab', 'sensor_msgs/JointState');
pub_image = rospublisher('/image', 'sensor_msgs/Image');

% Initialize ROS JointState Message
joint_state_msg = rosmessage('sensor_msgs/JointState');
joint_state_msg.Name = {'x','y','z','yaw','pitch','roll','hip_abduction_left', 'hip_rotation_left', 'hip_flexion_left', 'knee_joint_left', 'knee_to_shin_left', 'ankle_joint_left', 'toe_joint_left', 'hip_abduction_right', 'hip_rotation_right', 'hip_flexion_right', 'knee_joint_right', 'knee_to_shin_right', 'ankle_joint_right', 'toe_joint_right'};
joint_state_msg.Header.FrameId = 'pelvis';

% Initialize Image
image_msg = rosmessage('sensor_msgs/Image');
image_msg.Header.Stamp = rostime('now','system');
image_msg.Header.FrameId = 'map';
image_msg.Encoding = 'rgb8'; 
writeImage(image_msg, parser_results.elevation_map_image);

% image_msg.Height = size(parser_results.elevation_map,1);
% image_msg.Width = size(parser_results.elevation_map,2);
% image_msg.Step = ;
% image_msg.Data = parser_results.elevation_map;
send(pub_image, image_msg);
    
for i = 1:length(t)
    % Time Stamp
    joint_state_msg.Header.Seq = i;
    joint_state_msg.Header.Stamp = rostime('now','system');
    
    % Joint Data
    joint_state_msg.Position = q(:,i);
    joint_state_msg.Velocity = parser_results.dq(:,i);
    joint_state_msg.Effort = parser_results.ddq(:,i);
    
    % Delay
    if i > 1
        pause((t(i) - t(i-1))/parser_results.time_scale);
    end

    % Send Message
    send(pub_joint_state, joint_state_msg);
end

end