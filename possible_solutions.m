function qs_good = possible_solutions(qs_deg)
    n = length(qs_deg);
    qs_good = [];
    qs_bad = [];
    
    % Classify if solution as good or bad according to the thetas values
    for i = 1: n
        if qs_deg(i,1) < -150 || qs_deg(i,1) > 150 || qs_deg(i,3) < -150 || qs_deg(i,3) > 150 || qs_deg(i,2) > 60 || qs_deg(i,2) < -240
            qs_bad(end+1,:) = qs_deg(i,:);
        else
            qs_good(end+1,:) = qs_deg(i,:);
        end
    end
end