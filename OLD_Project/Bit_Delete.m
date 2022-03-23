   prompt = {"Nombre de bits � supprimer", "Taux de sur-�chantillonage"};       %texte de la fen�tre
   defaults = {"", "2"};                                                        %Valeur initialle dans la fen�tre
   rowscols = [1,15; 1,15;];                                                    %Taille de le fen�tre de texte
   SortieIHM = inputdlg (prompt, "Entrer les param�tres", rowscols, defaults);  %Commande de l'interface et appel des autres fonctions + nom de la fen�tre

   Najout = str2num(cell2mat(SortieIHM(2)));                                    %Convertion des sorties de l'IHM de cell � matrice et de string � entier pour pouvoir mettre le -
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