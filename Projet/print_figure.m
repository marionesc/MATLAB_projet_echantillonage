function print_figure()
  legengeSettings = questdlg('Voulez vous personnaliser les l�gendes ?', 'L�gende', ...
                'Oui','Non', 'Non') 
  
  switch(legengeSettings)
    case 'Oui'         
      userInput0 = inputdlg({'Legende x :'}, ...
                            'Legende - Param�tres avanc�s', [1 30]);
      userInput1 = inputdlg({'Legende y :'}, ...
                            'Legende - Param�tres avanc�s', [1 30]);
      userInput2 = inputdlg({'Titre :'}, ...
                            'Legende - Param�tres avanc�s', [1 30]);
      xTitle = userInput0;
      yTitle = userInput1;
      figureTitle = userInput2;    
   
    case 'Non'
      xTitle = 'valeur de x';
      yTitle = 'valeur de y';
      figureTitle = 'valeurs de f(x) --> x ';
  end
  
  xlabel(xTitle); 
  ylabel(yTitle); 
  title(figureTitle,'FontSize',20);
endfunction  