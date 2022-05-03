function [Tn, T0Tn] = DGM(DH, q)
    n = length(DH.sigma);
    T0n = eye(4);

    for i = 1: n
        T(:,:,i) = [cos(q(i)), -sin(q(i))*cos(DH.alpha(i)), sin(q(i))*sin(DH.alpha(i)), DH.a(i)*cos(q(i));
                    sin(q(i)), cos(q(i))*cos(DH.alpha(i)), -cos(q(i))*sin(DH.alpha(i)), DH.a(i)*sin(q(i));
                    0, sin(DH.alpha(i)), cos(DH.alpha(i)), DH.d(i);
                    0, 0, 0, 1];
        Tn{i} = T(:,:,i);
        T0n = T0n * T(:,:,i);
        T0Tn{i} = T0n;
    end
end