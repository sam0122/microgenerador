function [Ag] = Generador(nAgreg,tamMed, tamDesv,incInf,incSup)
    %nAgreg = Numero de particulas
    %tamMed = Longitud media lados distribución normal 
    %tamDesv = Desviacion longitud lados distribución normal
    %incInf = Límite inferior distribución uniforme inclinación agregado
    %incSup = Limite superior distribución uniforme inclinación agregado
    %Ag = {zeros(nAgreg,1),zeros(nAgreg,2),cell(nAgreg,5)};
    %Ag{:,1} = int8(normrnd(tamMed,tamDesv,[nAgreg,1]));
    %Ag{:,3}{:,1}=1;
    %Ag{:,2}{:,1}-Ag{:,1}*0.5;
    %Ag{:,3}{:,1}(1,2)=%Ag{:,2}{:,2}-Ag{:,1}*0.5;
    %Tamaño medio del lado de los polígonos van en la primera celda de Ag. 
    %Inclinación del agregado se asigna en la segunda columna de la primera
    %celda de Ag.
    Ag = { zeros(nAgreg,2)};
    Ag{:, 1} = int8(normrnd(tamMed,tamDesv,[nAgreg,1]));
    Ag{:, 2} = unidrnd(incSup-incInf,nAgreg,1)+incInf;

end
