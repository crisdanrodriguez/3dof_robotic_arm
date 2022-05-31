function points = pointsIGM(xi, yi, zi, xf, yf, zf)
    
    pos_inicial = [xi yi zi];
    pos_final = [xf yf zf];

    if pos_final(1)==pos_inicial(1)
        range1 = zeros(1,21)+pos_inicial(1);
    else
        range1 =(pos_inicial(1):(pos_final(1)-pos_inicial(1))/20:pos_final(1));
    end
    if pos_final(2)==pos_inicial(2)
        range2 = zeros(1,21)+pos_inicial(2);
    else
        range2 = zeros(1,21)+(pos_inicial(2):(pos_final(2)-pos_inicial(2))/20:pos_final(2));
    end
    if pos_final(2)==pos_inicial(2)
        range3 = zeros(1,21)+pos_inicial(3);
    else
        range3 = zeros(1,21)+(pos_inicial(3):(pos_final(3)-pos_inicial(3))/20:pos_final(3));
    end
    points = [range1' range2' range3'];
end