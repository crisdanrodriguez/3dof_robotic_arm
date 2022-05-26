function q = type3(X1, X2, Y1, Y2, Z1, Z2)

    senn = (((Z1*Y2)-(Z2*Y1))/((X1*Y2)-(X2*Y1)));
    coss = (((Z2*X1)-(Z1*X2))/((X1*Y2)-(X2*Y1)));
    
    q = atan2(senn, coss);
end