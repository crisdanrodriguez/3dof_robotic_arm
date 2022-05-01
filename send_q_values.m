% Start the serial communication 
disp("Starting Serial Communication") 
device = serialport("COM3", 9600); 

% User desired theta values
theta1_deg = 180;   
theta2_deg = 90;
theta3_deg = 90;

% Map the user input value from angle type to a value between 0 and 1023
theta1_dyn = theta1_deg * 1023 / 300;
theta2_dyn = theta2_deg * 1023 / 300;
theta3_dyn = theta3_deg * 1023 / 300;

% Waits a little bit to ensure serial port is ready
pause(1.0)

% Reads until it gets the new line character 
configureTerminator(device, "LF") 
disp("Reading Starting Message from Arduino") 
while device.NumBytesAvailable ~= 0 
    disp(readline(device)) 
end 
pause(1.0) 

% Write the string of data to the Arduino 
theta_array = strcat("<", int2str(theta1_dyn), int2str(theta2_dyn), int2str(theta3_dyn), ">"); 
writeline(device, theta_array) 

% Reads until it gets the new line character 
configureTerminator(device, "LF") 
disp("Reading Message from Arduino") 
while device.NumBytesAvailable ~= 0 
    disp(readline(device)) 
end 
pause(1.0) 
 
% Clear the device variable to close the serial port  
disp("Finished") 
clear device 