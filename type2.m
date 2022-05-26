function q = type2(X, Y, Z)
    if (X == 0 && Y ~= 0)
        C = Z / Y;
        theta1_a = atan2(sqrt(1 - C^2), C);
        theta1_b = atan2(-sqrt(1 - C^2), C);
    elseif (Y == 0 && X ~= 0)
        S = Z / X;
        theta1_a = atan2(S, sqrt(1 - S^2));
        theta1_b = atan2(S, -sqrt(1 - S^2));
    elseif (X ~= 0 && Y ~= 0 && Z == 0)
        theta1_a = atan2(-Y, X);
        theta1_b = theta1_1 + pi;
    elseif (X ~= 0 && Y ~= 0 && Z ~= 0)     
        senn_1=(((X*Z)+(Y*sqrt((X^2)+(Y^2)-(Z^2))))/((X^2)+(Y^2)));
        coss_1=(((Y*Z)-(X*sqrt((X^2)+(Y^2)-(Z^2))))/((X^2)+(Y^2))); 
        theta1_a = atan2(senn_1,coss_1);
        senn_1=(((X*Z)-(Y*sqrt((X^2)+(Y^2)-(Z^2))))/((X^2)+(Y^2)));
        coss_1=(((Y*Z)+(X*sqrt((X^2)+(Y^2)-(Z^2))))/((X^2)+(Y^2)));
        theta1_b = atan2(senn_1,coss_1);
    end
    q = [theta1_a, theta1_b];
end