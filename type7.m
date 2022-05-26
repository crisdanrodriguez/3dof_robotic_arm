function qn = type7(W1, W2, X, Y, Z1, Z2)

    B1 = 2*((Z1*Y)+(Z2*X));
    B2 = 2*((Z1*X)-(Z2*Y));
    B3 = (W1^2)+(W2^2)-(X^2)-(Y^2)-(Z1^2)-(Z2^2);
    
    qk = type2(B1, B2, B3);
    
    X1_3 = W2;
    X2_3 = W1;
    Y1_3 = W1;
    Y2_3 = -W2;
    Z1_3 = ((X*cos(qk(1)))+(Y*sin(qk(1)))+(Z1));
    Z2_3 = ((X*sin(qk(1)))-(Y*cos(qk(1)))+(Z2));
    
    qt_1 = type3(X1_3, X2_3, Y1_3, Y2_3, Z1_3, Z2_3);
    
    X1_3 = W2;
    X2_3 = W1;
    Y1_3 = W1;
    Y2_3 = -W2;
    Z1_3 = ((X*cos(qk(2)))+(Y*sin(qk(2)))+(Z1));
    Z2_3 = ((X*sin(qk(2)))-(Y*cos(qk(2)))+(Z2));
    
    qt_2 = type3(X1_3, X2_3, Y1_3, Y2_3, Z1_3, Z2_3);
    
    qt_f = [qt_1, qt_2]';
    
    restarq3 = [(qt_1-qk(1)), (qt_2-qk(2))];
    
    qn = [qk(1), qk(2); (qt_1-qk(1)), (qt_2-qk(2))];
end