function [y] = Ensamblador(Ag)
    %Area total de agregados
    Atotal = sum(Ag{:,3});
    %Area en la que se ubican los polígonos, Atotal*1.5
    Arect = Atotal*1.5;
    %Dimensiones del área rectangular
    b = sqrt(Arect*0.6/0.4);
    a = b*0.4/0.6;
    %Coordenadas del centro del área de dibujo.
    centro = [0,0];
    %Determina el número de agregados en Ag, Nrow(1,1)
    [Nrow, Ncol] = cellfun(@size,Ag,'UniformOutput',false);
    %Variable auxiliar con los indices aleatorios de los agregados. Los
    %agregados se ubican de acuerdo a este orden.
    vecInd = datasample(1:Nrow{1,1},Nrow{1,1},'Replace', false);
    %Vector que contiene toda la información de las coordenadas de los polígonos, listos para dibujar. 
    geomPol = zeros(Nrow{1,1},6);
    %Máximo número de vertices en el conjunto de agregados
    maxVert = max(Ag{1,6}(:,1));
    C = maxVert*2;
    %Vector que almacena las coordenadas de los vértices de los polígonos.
    coord = zeros(Nrow{1,1},C+2);
    x = zeros(Nrow{1,1},maxVert);
    y = zeros(Nrow{1,1},maxVert);
    %Loop que ordena de forma aleatoria los parámetros geométricos de los
    %polígonos
    for i=1:Nrow{1,1} 
        %Longitud lado
        geomPol(i,1) = Ag{1,1}(vecInd(1,i),1);
        %Inclinación
        geomPol(i,2) = Ag{1,2}(vecInd(1,i),1);
        %Radio medio equivalente
        geomPol(i,3) = Ag{1,5}(vecInd(1,i),1);
        %Cantidad de vertices
        geomPol(i,4) = Ag{1,6}(vecInd(1,i),1);
        %Coordenada x' del centroide
        geomPol(i,5) = Ag{1,4}(vecInd(1,i),1).*cosd(geomPol(i,2))-sind(geomPol(i,2)).*Ag{1,4}(vecInd(1,i),2);
        %Coordenada y' del centroide
        geomPol(i,6) = sind(geomPol(i,2)).*Ag{1,4}(vecInd(1,i),1) + cosd(geomPol(i,2)).*Ag{1,4}(vecInd(1,i),2);
    end
     
    %Dibujo del rectángulo
    c1 = centro(1,1)-b/2;
    c2 = centro(1,1)+b/2;
    c3 = centro(1,2)-a/2;
    c4 = centro(1,2)+a/2;
    xRect = [c1, c2, c2, c1, c1];
    yRect = [c3, c3, c4, c4, c3];
    rX = c1:0.5:c2;
    rY = c3:0.5:c4;
    
    for i = 1:Nrow{1,1}
        centro(1,1) = datasample(rX,1,'Replace',true);
        centro(1,2) = datasample(rY,1,'Replace',true);
        coord(i,1) = centro(1,1)+geomPol(i,5);
        coord(i,2) = centro(1,2)+geomPol(i,6);
        if (coord(i,1)- geomPol(i,3)<c1); or (coord(i,1)+ geomPol(i,3)>c2); or (coord(i,2)-geomPol(i,3)<c3) ; or (coord(i,2)+ geomPol(i,3)>c4)
            
        else
            for j = i:-1:1
            
      
            
            end
        end
        
        %disp(centro);
        
         %{
         coord(i,1) =centro(1,1)-geomPol(i,1)*0.5;
         coord(i,2) =centro(1,2)-geomPol(i,1)*0.5;
         coord(i,3) = centro(1,1)+geomPol(i,1)*0.5;
         coord(i,4) = centro(1,2)-geomPol(i,1)*0.5;
         coord(i,5) = centro(1,1)+geomPol(i,1)*0.5; 
         coord(i,6)= centro(1,2)+geomPol(i,1)*0.5;
         coord(i,7) = centro(1,1)+0;
         coord(i,8) =  centro(1,2)+geomPol(i,1)*0.5+geomPol(i,1)*0.5*tand(45);
         coord(i,9) = centro(1,1)-geomPol(i,1)*0.5;
         coord(i,10) = centro(1,2)+geomPol(i,1)*0.5;
         %Modifican las coordenadas de los poligonos de acuerdo a la
         %inclinación predefinida.
         x(i,1) = cosd(geomPol(i,2))*coord(i,1)-sind(geomPol(i,2))*coord(i,2);
         x(i,2) = cosd(geomPol(i,2))*coord(i,3)-sind(geomPol(i,2))*coord(i,4);
         x(i,3) = cosd(geomPol(i,2))*coord(i,5)-sind(geomPol(i,2))*coord(i,6);
         x(i,4) = cosd(geomPol(i,2))*coord(i,7)-sind(geomPol(i,2))*coord(i,8);
         x(i,5) = cosd(geomPol(i,2))*coord(i,9)-sind(geomPol(i,2))*coord(i,10);
         x(i,6) = cosd(geomPol(i,2))*coord(i,1)-sind(geomPol(i,2))*coord(i,2);
                 
         y(i,1)= sind(geomPol(i,2))*coord(i,1)+cosd(geomPol(i,2))*coord(i,2);
         y(i,2) = sind(geomPol(i,2))*coord(i,3)+cosd(geomPol(i,2))*coord(i,4);
         y(i,3) = sind(geomPol(i,2))*coord(i,5)+cosd(geomPol(i,2))*coord(i,6);
         y(i,4) = sind(geomPol(i,2))*coord(i,7)+cosd(geomPol(i,2))*coord(i,8);
         y(i,5) = sind(geomPol(i,2))*coord(i,9)+cosd(geomPol(i,2))*coord(i,10);
         y(i,6) = sind(geomPol(i,2))*coord(i,1)+cosd(geomPol(i,2))*coord(i,2);
         %}
    end
    
    L = Ag{1,1}(1,1);
    I = Ag{1,2}(1,1);
   
    %Lista de coordenadas de los puntos que conforman el polígono si este
    %estuviese inclinado horizontalmente
    %Coord = {zeros(1,2),zeros(1,2),zeros(1,2),zeros(1,2),zeros(1,2)};
    %Coord{1,1}(1,1) =centro(1,1)-L*0.5;
    %Coord{1,1}(1,2) =centro(1,2)-L*0.5;
    %Coord{1,2}(1,1) = centro(1,1)+L*0.5;
    %Coord{1,2}(1,2) = centro(1,2)-L*0.5;
    %Coord{1,3}(1,1) = centro(1,1)+L*0.5; 
    %Coord{1,3}(1,2)= centro(1,2)+L*0.5;
    %Coord{1,4}(1,1) = centro(1,1)+0;
    %Coord{1,4}(1,2) =  centro(1,2)+L*0.5+L*0.5*tand(45);
    %Coord{1,5}(1,1) = centro(1,1)-L*0.5;
    %Coord{1,5}(1,2) = centro(1,2)+L*0.5;
    %x = [cosd(I)*Coord{1,1}(1,1)-sind(I)*Coord{1,1}(1,2),cosd(I)*Coord{1,2}(1,1)-sind(I)*Coord{1,2}(1,2),cosd(I)*Coord{1,3}(1,1)-sind(I)*Coord{1,3}(1,2),cosd(I)*Coord{1,4}(1,1)-sind(I)*Coord{1,4}(1,2),cosd(I)*Coord{1,5}(1,1)-sind(I)*Coord{1,5}(1,2),cosd(I)*Coord{1,1}(1,1)-sind(I)*Coord{1,1}(1,2)];
    %y = [sind(I)*Coord{1,1}(1,1)+cosd(I)*Coord{1,1}(1,2),sind(I)*Coord{1,2}(1,1)+cosd(I)*Coord{1,2}(1,2),sind(I)*Coord{1,3}(1,1)+cosd(I)*Coord{1,3}(1,2),sind(I)*Coord{1,4}(1,1)+cosd(I)*Coord{1,4}(1,2),sind(I)*Coord{1,5}(1,1)+cosd(I)*Coord{1,5}(1,2),sind(I)*Coord{1,1}(1,1)+cosd(I)*Coord{1,1}(1,2)];
    %{
    for i=1:Nrow{1,1}
        plot(x(i,:),y(i,:));
        hold on;
    end
    hold on;
    %}
    plot(xRect, yRect);
    %disp(I);
    axis equal;
end
