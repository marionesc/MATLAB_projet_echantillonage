prompt = {"Nombre de bits � supprimer"};       %texte de la fen�tre
defaults = {"2"};                              %Valeur initialle dans la fen�tre
rowscols = [1,15];                             %Taille de le fen�tre de texte
SortieIHM = inputdlg (prompt, "Entrer les param�tres", rowscols, defaults);  %Commande de l'interface et appel des autres fonctions + nom de la fen�tre

MdelBits = str2num(cell2mat(SortieIHM(1)))                                   %Convertion des sorties de l'IHM de cell � matrice et de string � entier pour pouvoir mettre le -
    
 for i = 0 : TailleY   
 yDel = bitshift(y,-MdelBits);            %Suppression des bits
 endfor
plot(t,yDel,'xr')
title('Signal en fonction du temps');        %Titre
xlabel('Temps (en seconde)');                %Abscisses
ylabel('Amplitude');                         %ordonn�es

Lineaire(1,yDel,y,t)
