function [Coord] = Ensamblador(Ag)
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
    xlim([-20 20]);
    ylim([-20 20]);
    %disp(I);
end
