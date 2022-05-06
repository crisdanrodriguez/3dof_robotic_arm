function [DH, q] = DH_parameters(theta1_deg, theta2_deg, theta3_deg)
    % Converting degrees to radians
    theta1_rad = round(theta1_deg) * (pi/180);
    theta2_rad = round(theta2_deg) * (pi/180);
    theta3_rad = round(theta3_deg) * (pi/180);
    
    % Variables values
    D1 = 131; L2 = 91.7; L3 = 100; D4 = 50;

    % DH parameters
    DH.sigma = [0, 0, 0, 1];
    DH.a = [0, L2, L3, 0].';
    DH.alpha = [-pi/2, 0, -pi/2, 0].';
    DH.d = [D1, 0, 0, D4].';
    q = [theta1_rad, theta2_rad, theta3_rad, 0];
end