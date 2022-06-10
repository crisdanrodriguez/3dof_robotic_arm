function circle_points = circlepointsIGM(xi, yi,xm, ym, x_final, y_final,z)
    syms x y    
    pointA = [xi, yi];
    pointB = [xm,ym];
    pointC = [x_final, y_final];
    midpointAB = [(pointA(1)+pointB(1))/2 (pointA(2)+pointB(2))/2];
    perpgrad1 = -1/((pointA(2)-pointB(2))/(pointA(1)-pointB(1)));
    midpointBC = [(pointB(1)+pointC(1))/2 (pointB(2)+pointC(2))/2];
    perpgrad2 = -1/((pointB(2)-pointC(2))/(pointB(1)-pointC(1)));
    
    eqn1 = y-midpointAB(2) == perpgrad1*(x-midpointAB(1));
    eqn2 = y-midpointBC(2) == perpgrad2*(x-midpointBC(1));
    [A,B] = equationsToMatrix([eqn1, eqn2], [x, y]);
%     A=[perpgrad1, -1; perpgrad2, - 1 ];
%     B=[-perpgrad1*midpointAB(1) + midpointAB(2); -perpgrad2*midpointBC(1) + midpointBC(2)];
    sol = linsolve(A,B);
    radius = double(subs(sqrt((pointC(1)-sol(1))^2+(pointC(2)-sol(2))^2)));
    r = double(subs(radius));
    position = [pointA; pointB; pointC];
    position = sortrows(position);    
        
    %poner q si el punto inicial es igual al punto de position 1 solo sea un punto
    solution= double(subs(sol));
    if -r+solution(1)==position(1,1)
            rangex1 = position(1,1);        
            rangex2= vpa(position(1,1)+(position(2,1)-(position(1,1)))/10:(position(2,1)-position(1,1))/5:position(2,1))';
        else
            rangex1= vpa(-r+solution(1):(position(1,1)-(-r+solution(1)))/10:position(1,1))';
            rangex2= vpa(position(1,1)+(position(2,1)-(position(1,1)))/10:(position(2,1)-position(1,1))/5:position(2,1))';
    end
    if r+solution(1)==position(3,1)+((r+solution(1))-(position(3,1)))/10
        rangex3= vpa(position(2,1)+(position(3,1)-(position(2,1)))/10:(position(3,1)-position(2,1))/5:position(3,1))';    
        rangex4 = r+solution(1);        
    else
        rangex3= vpa(position(2,1)+(position(3,1)-(position(2,1)))/10:(position(3,1)-position(2,1))/5:position(3,1))';
        rangex4= vpa(position(3,1)+((r+solution(1))-(position(3,1)))/10:((r+solution(1))-position(3,1))/5:r+solution(1))';
    end
    rangeinX = [rangex1; rangex2; rangex3; rangex4];

    rangey1 = real(sqrt(r^2-(rangeinX(:,1)-solution(1)).^2)+solution(2));
    rangey2 = real(-sqrt(r^2-(rangeinX(:,1)-solution(1)).^2)+solution(2));
    rangeinX = [rangeinX; flip(rangeinX(1:end-1,1))];
    
    y = [rangey1; flip(rangey2(1:end-1,1))];
    rangescw = [rangeinX y];
    rangescw = [rangescw; rangescw(2:end,:)];
    rangesccw = flip(rangescw);
    
    for i=1:height(rangescw)
        if round(rangescw(i,:)) == round(pointC)
            for n=i+1:height(rangescw)
                if round(rangescw(n,:)) == round(pointA)
                    direction=1; %clockwise
                    break;
                elseif round(rangescw(n,:)) == round(pointB)
                    direction=0; %counterclockwise                
                    break;
                end
            end
        break;
        end
    end    
    if direction == 1
        for i=1:height(rangescw)
            if round(rangescw(i,:)) == round(pointA)
                for n=i+1:height(rangescw)
                    if round(rangescw(n,:)) == round(pointC)
                        circle_points = rangescw(i:n,:);
                        circle_points(:,3) = z;
                        break;
                    end  
                end
            break;
            end
        end
    else
        for i=1:height(rangesccw)
            if round(rangesccw(i,:)) == round(pointA)
                for n=i+1:height(rangesccw)
                    if round(rangesccw(n,:)) == round(pointC)
                        circle_points = rangesccw(i:n,:);
                        circle_points(:,3) = z;
                        break;
                    end  
                end
            break;
            end
        end
    end
end