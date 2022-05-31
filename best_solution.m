function qs_best = best_solution(qs_good, theta1_deg, theta2_deg, theta3_deg)
    n = length(qs_good);
    e_sum = [];

    % Calculate the error for each set of qs
    for i = 1: n 
        e_1 = abs(theta1_deg - qs_good(i, 1));
        e_2 = abs(theta2_deg - qs_good(i, 2));
        e_3 = abs(theta3_deg - qs_good(i, 3));
        e_sum(end+1,:) = e_1 + e_2 + e_3;
    end
    % Get the qs with the minimum error
    [min_value, min_index] = min(e_sum);
    qs_best = qs_good(min_index,:);
end