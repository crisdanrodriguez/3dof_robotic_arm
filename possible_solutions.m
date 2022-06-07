function [qs_good, qs_bad] = possible_solutions(qs_deg)
    n = height(qs_deg);
    qs_good = [];
    qs_bad = [];
    
    % Classify if solution as good or bad according to the thetas values
    for i = 1: n
        if double(subs(qs_deg(i,1))) < -150 || double(subs(qs_deg(i,1))) > 150 || double(subs(qs_deg(i,3))) < -150 || double(subs(qs_deg(i,3))) > 150 || double(subs(qs_deg(i,2))) > 60 || double(subs(qs_deg(i,2))) < -200
            qs_bad(end+1,:) = qs_deg(i,:);
            qs_good(end+1,:) = [300, 300, 300];
        else
            qs_good(end+1,:) = qs_deg(i,:);
            qs_bad(end+1,:) = [300, 300, 300];
        end
    end
end