t2 = 0:(1/(Najout*Fe)):1;      %Balayage du temps avec le m�me nobre de valeurs que le signal sur-�chantillon�

y2 = interp1(t,yDel,t2);       %Y d�cal� = interp1(Abscisses, ordonn�es, Abscisses d�cal�es)

plot(t,yDel,'ob');                           %Affichage du signal de base
hold on
plot(t2,y2,'xr');                            %Affichage du signal sur-�chantillon�
title('Signal en fonction du temps');        %Titre
xlabel('Temps (en seconde)');                %Abscisses
ylabel('Amplitude');                         %ordonn�es

