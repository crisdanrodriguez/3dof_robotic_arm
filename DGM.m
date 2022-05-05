function [Tn, T0Tn, X, Y, Z] = DGM(DH, q)
    % Number of joints
    n = length(DH.sigma);
    % Identity matrix for the first frame
    T0n = eye(4);

    % Frames multiplication
    for i = 1: n
        T(:,:,i) = [cos(q(i)), -sin(q(i))*cos(DH.alpha(i)), sin(q(i))*sin(DH.alpha(i)), DH.a(i)*cos(q(i));
                    sin(q(i)), cos(q(i))*cos(DH.alpha(i)), -cos(q(i))*sin(DH.alpha(i)), DH.a(i)*sin(q(i));
                    0, sin(DH.alpha(i)), cos(DH.alpha(i)), DH.d(i);
                    0, 0, 0, 1];
        Tn{i} = T(:,:,i);
        T0n = T0n * T(:,:,i);
        T0Tn{i} = T0n;

        % Plotting parameters
        X(i + 1,:) = T0Tn{i}(1, 4);
        Y(i + 1,:) = T0Tn{i}(2, 4);
        Z(i + 1,:) = T0Tn{i}(3, 4);
    end
end