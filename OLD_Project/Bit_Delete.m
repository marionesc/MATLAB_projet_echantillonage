   prompt = {"Nombre de bits à supprimer", "Taux de sur-échantillonage"};       %texte de la fenêtre
   defaults = {"", "2"};                                                        %Valeur initialle dans la fenêtre
   rowscols = [1,15; 1,15;];                                                    %Taille de le fenêtre de texte
   SortieIHM = inputdlg (prompt, "Entrer les paramètres", rowscols, defaults);  %Commande de l'interface et appel des autres fonctions + nom de la fenêtre

   Najout = str2num(cell2mat(SortieIHM(2)));                                    %Convertion des sorties de l'IHM de cell à matrice et de string à entier pour pouvoir mettre le -
   MdelBits = str2num(cell2mat(SortieIHM(1))) 
    
    for i = 0 : TailleY
    
    yDel = bitshift(y,-MdelBits);            %Suppression des bits
    endfor

switch(mode)
case 1
Interp();
  
case 2
Zero_Padding();
endswitch