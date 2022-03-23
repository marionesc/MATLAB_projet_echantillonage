t2 = 0:(1/(Najout*Fe)):1;      %Balayage du temps avec le même nobre de valeurs que le signal sur-échantilloné

y2 = interp1(t,yDel,t2);       %Y décalé = interp1(Abscisses, ordonnées, Abscisses décalées)

plot(t,yDel,'ob');                           %Affichage du signal de base
hold on
plot(t2,y2,'xr');                            %Affichage du signal sur-échantilloné
title('Signal en fonction du temps');        %Titre
xlabel('Temps (en seconde)');                %Abscisses
ylabel('Amplitude');                         %ordonnées

