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
    %Area de cada agregado va en la tercera columna
    %Coordenadas del centroide del pol�gono, con respecto al centro del
    %cuadrado, van en la cuarta columna.
    Ag = { zeros(nAgreg,5)};
    Ag{:, 1} = normrnd(tamMed,tamDesv,[nAgreg,1]);
    Ag{:, 2} = unidrnd(incSup-incInf,nAgreg,1)+incInf;
    Ag{:, 3} = Ag{:,1}.^2+0.5.*(Ag{:,1}.*Ag{:,1}.*0.5.*tand(45));
    Ag{:,4} = zeros(nAgreg,2);
    Ag{:,4}(:,2) = ((Ag{:, 1}.*0.5+(Ag{:, 1}.*0.5.*tand(45))./3).*0.5.*Ag{:, 1}.*(0.5.*Ag{:, 1}.*tand(45)))./ Ag{:, 3};
    %Ag{:,5}= sqrt(( Ag{:, 1}.*0.5+Ag{:,4}(:,2)).^2+(Ag{:,1}.*0.5).^2);
    %Expresi�n que representa la distancia m�s grande que existe entre el
    %centroide del pol�gono y el v�rtice m�s alejado. Almacenado en la
    %quinta columna
    Ag{:,5} = Ag{:,1}.*0.5-Ag{:,4}(:,2)+Ag{:,1}.*0.5.*tand(45);
    %[sorted1,index1]= sort(cell2mat(Ag{1}));
    %Ag{1} = num2cell(sorted1);
    %Ag{2} = Ag{2}(index1);
    %Ag{3}= Ag{3}(index1);
    %Ag{4} = Ag{4}(index1);
    %Ag{5} = Ag{5}(index1);
    
end
