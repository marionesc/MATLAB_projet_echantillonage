mode = menu('Mode interpolation', 'interp','zero-padding','lin�aire')
    %Fonction IHM (texte affich�, bouton 1, bouton 2, bouton 3)
    
switch(mode)

  case 1
  Bit_Delete();
  %appel fonction interp
  case 2
  Bit_Delete();
  %appel fonction zero-padding
  case 3
  Lin = 1;
  Bit_Delete_Lin();
  %appel fonction lin�aire
end