function qs = IGM(P4X, P4Y, P4Z)

    q1 = type2(-P4X, P4Y, 0);

    W1 = 100;
    W2 = 50;
    X = -91;
    Y = 0;
    Z1_a = (P4X*cos(q1(1)))+(P4Y*sin(q1(1)));
    Z1_b = (P4X*cos(q1(2)))+(P4Y*sin(q1(2)));
    Z2 = 91-P4Z;

    q23_a = type7(W1, W2, X, Y, Z1_a, Z2);
    q23_b = type7(W1, W2, X, Y, Z1_b, Z2);

    qs = [
        q1(1), q23_a(1,1), q23_a(2,1);
        q1(1), q23_a(1,2), q23_a(2,2);
        q1(2), q23_b(1,1), q23_b(2,1);
        q1(2), q23_b(1,2), q23_b(2,2)];
    
    qs_13 = [(wrapTo180(rad2deg(qs(:,1)))),(wrapTo180(rad2deg(qs(:,3))))];
    qs_2 = wrapTo180(rad2deg(qs(:,2)));
    for n=1:4
        if qs_2(n) > 60
            qs_2(n) = qs_2(n)-360;
        end
    end
    qs = [qs_13(:,1), qs_2, qs_13(:,2)];
    
end