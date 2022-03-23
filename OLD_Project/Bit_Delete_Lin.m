prompt = {"Nombre de bits à supprimer"};       %texte de la fenêtre
defaults = {"2"};                              %Valeur initialle dans la fenêtre
rowscols = [1,15];                             %Taille de le fenêtre de texte
SortieIHM = inputdlg (prompt, "Entrer les paramètres", rowscols, defaults);  %Commande de l'interface et appel des autres fonctions + nom de la fenêtre

MdelBits = str2num(cell2mat(SortieIHM(1)))                                   %Convertion des sorties de l'IHM de cell à matrice et de string à entier pour pouvoir mettre le -
    
 for i = 0 : TailleY   
 yDel = bitshift(y,-MdelBits);            %Suppression des bits
 endfor
plot(t,yDel,'xr')
title('Signal en fonction du temps');        %Titre
xlabel('Temps (en seconde)');                %Abscisses
ylabel('Amplitude');                         %ordonnées

Lineaire(1,yDel,y,t)
