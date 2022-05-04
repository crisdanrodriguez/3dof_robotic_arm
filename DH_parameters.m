function [DH, q] = DH_parameters(theta1_deg, theta2_deg, theta3_deg)
    % Converting degrees to radians
    theta1_rad = round(theta1_deg) * (pi/180);
    theta2_rad = round(theta2_deg) * (pi/180);
    theta3_rad = round(theta3_deg) * (pi/180);
    
    % DH parameters
    DH.sigma = [0, 0, 0];
    DH.a = [0, 1, 1].';
    DH.alpha = [pi/2, 0, 0].';
    DH.d = [1, 0, 0].';
    q = [theta1_rad, theta2_rad, theta3_rad];
end