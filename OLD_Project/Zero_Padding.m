
FFTY = fft(yDel);                   %FFT du signal
tailleFFTY = size(FFTY);
tailleTAB1 = (tailleFFTY(2)-1)/2    %500 premières valeurs dans le premier tableau
tailleTAB2 = (tailleFFTY(2)+1)/2    %501 valeurs suivantes dans le premier tableau

tab1 = FFTY(1:tailleTAB1);                              %Première partie du tableau
tab2 = FFTY(tailleTAB1+1:tailleTAB1+tailleTAB2);        %Deuxième partie du tableau
tab0 = zeros(1,(Najout-1)*(tailleFFTY(2)-1));           %On remplit de zeros le tableau qu'on va mettre entre les deux autres

%On prend Najout-1 car pour Najout = 2 on ajoute 1001 zéros et non pas 2002

FFTY2 = [tab1 tab0 tab2];     %On fusionne les tableaux dans le bon ordre

y2 = Najout*ifft(FFTY2);      %FFT inverse du signal recomposé avec les 0
t2 = 0:1/(1000*Najout):1;     %Balayage du temps avec le nouveau nombre de valeurs

plot(t,yDel,'ob')                            %Affichage du signal de base
hold on 
plot(t2,y2,'xr')                             %Affichage du signal sur-échantilloné
title('Signal en fonction du temps');        %Titre
xlabel('Temps (en seconde)');                %Abscisses
ylabel('Amplitude');                         %ordonnées
