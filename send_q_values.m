function send_q_values(device, theta_array)
    % Send array with theta values 
    writeline(device, theta_array)

    % Reads until it gets the new line character 
    configureTerminator(device, "LF") 
    disp("Reading Message from Arduino") 
    while device.NumBytesAvailable ~= 0 
        disp(readline(device)) 
    end 
    pause(1.0)
end

