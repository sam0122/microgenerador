function [Ag] = Generador(nAgreg,tamMed, tamDesv,incInf,incSup)
    %nAgreg = Numero de particulas
    %tamMed = Longitud media lados distribuci�n normal 
    %tamDesv = Desviacion longitud lados distribuci�n normal
    %incInf = L�mite inferior distribuci�n uniforme inclinaci�n agregado
    %incSup = Limite superior distribuci�n uniforme inclinaci�n agregado
    %Ag = {zeros(nAgreg,1),zeros(nAgreg,2),cell(nAgreg,5)};
    %Ag{:,1} = int8(normrnd(tamMed,tamDesv,[nAgreg,1]));
    %Ag{:,3}{:,1}=1;
    %Ag{:,2}{:,1}-Ag{:,1}*0.5;
    %Ag{:,3}{:,1}(1,2)=%Ag{:,2}{:,2}-Ag{:,1}*0.5;
    %Tama�o medio del lado de los pol�gonos van en la primera celda de Ag. 
    %Inclinaci�n del agregado se asigna en la segunda columna de la primera
    %celda de Ag.
    Ag = { zeros(nAgreg,2)};
    Ag{:, 1} = int8(normrnd(tamMed,tamDesv,[nAgreg,1]));
    Ag{:, 2} = unidrnd(incSup-incInf,nAgreg,1)+incInf;

end
