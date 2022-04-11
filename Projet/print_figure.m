function print_figure()
  legengeSettings = questdlg('Do you want to customize the captions?', 'Légende', ...
                'Yes','No', 'No') 
  
  switch(legengeSettings)
    case 'Yes'         
      userInput0 = inputdlg({'Caption x :'}, ...
                            'Caption - Advanced settings', [1 30]);
      userInput1 = inputdlg({'Caption y :'}, ...
                            'Caption - Advanced settings', [1 30]);
      userInput2 = inputdlg({'Titre :'}, ...
                            'Caption - Advanced settings', [1 30]);
      xTitle = userInput0;
      yTitle = userInput1;
      figureTitle = userInput2;    
   
    case 'No'
      xTitle = 'Value of x';
      yTitle = 'Value of y';
      figureTitle = 'Values of f(x) --> x ';
  end
  
  xlabel(xTitle); 
  ylabel(yTitle); 
  title(figureTitle,'FontSize',20);
endfunction  