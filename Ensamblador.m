function [Coord] = Ensamblador(Ag)
    %Area total de agregados
    Atotal = sum(Ag{:,3});
    %Area en la que se ubican los polígonos, Atotal*1.5
    Arect = Atotal*1.5;
    %Dimensiones del área rectangular
    b = sqrt(Arect*0.6/0.4);
    a = b*0.4/0.6;
        
    L = Ag{1,1}(1,1);
    I = Ag{1,2}(1,1);
    centro = [0,0];
    %Lista de coordenadas de los puntos que conforman el polígono
    Coord = {zeros(1,2),zeros(1,2),zeros(1,2),zeros(1,2),zeros(1,2)};
    Coord{1,1}(1,1) =centro(1,1)-L*0.5;
    Coord{1,1}(1,2) =centro(1,2)-L*0.5;
    Coord{1,2}(1,1) = centro(1,1)+L*0.5;
    Coord{1,2}(1,2) = centro(1,2)-L*0.5;
    Coord{1,3}(1,1) = centro(1,1)+L*0.5; 
    Coord{1,3}(1,2)= centro(1,2)+L*0.5;
    Coord{1,4}(1,1) = centro(1,1)+0;
    Coord{1,4}(1,2) =  centro(1,2)+L*0.5+L*0.5*tand(45);
    Coord{1,5}(1,1) = centro(1,1)-L*0.5;
    Coord{1,5}(1,2) = centro(1,2)+L*0.5;
    x = [cosd(I)*Coord{1,1}(1,1)-sind(I)*Coord{1,1}(1,2),cosd(I)*Coord{1,2}(1,1)-sind(I)*Coord{1,2}(1,2),cosd(I)*Coord{1,3}(1,1)-sind(I)*Coord{1,3}(1,2),cosd(I)*Coord{1,4}(1,1)-sind(I)*Coord{1,4}(1,2),cosd(I)*Coord{1,5}(1,1)-sind(I)*Coord{1,5}(1,2),cosd(I)*Coord{1,1}(1,1)-sind(I)*Coord{1,1}(1,2)];
    y = [sind(I)*Coord{1,1}(1,1)+cosd(I)*Coord{1,1}(1,2),sind(I)*Coord{1,2}(1,1)+cosd(I)*Coord{1,2}(1,2),sind(I)*Coord{1,3}(1,1)+cosd(I)*Coord{1,3}(1,2),sind(I)*Coord{1,4}(1,1)+cosd(I)*Coord{1,4}(1,2),sind(I)*Coord{1,5}(1,1)+cosd(I)*Coord{1,5}(1,2),sind(I)*Coord{1,1}(1,1)+cosd(I)*Coord{1,1}(1,2)];
    plot(x,y);
    hold on;
    %Dibujo del rectángulo
    c1 = centro(1,1)-b/2;
    c2 = centro(1,1)+b/2;
    c3 = centro(1,2)-a/2;
    c4 = centro(1,2)+a/2;
    xRect = [c1, c2, c2, c1, c1];
    yRect = [c3, c3, c4, c4, c3];
    plot(xRect, yRect);
    %disp(I);
    axis equal;
end
