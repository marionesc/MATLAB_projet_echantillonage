## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ZERO PADDING MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function zero_padding_mode()
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%   ENTREE DES VALEURS UTILISATEUR - MODE ZERO-PADDING (PROJECT ONLY)  %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  projectSamplingRate = str2num(inputdlg({'Sampling Rate :'}, ...
                                          'User values inputs', [1 30]));
  projectSamplingTime = str2num(inputdlg({'Sampling Time :'}, ...
                                          'User values inputs', [1 30]));
  projectSamplingFrequency = str2num(inputdlg({'Sampling frequency :'}, ...
                                               'User values inputs', [1 30]));
  projectBitDelete = str2num(inputdlg({'Nuber of Bit delete :'}, ...
                                       'User values inputs', [1 30]));

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE ZERO-PADDING (PROJECT ONLY)      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%     AFFICHAGE DE(S) FIGURE(S) - MODE ZERO-PADDING (PROJECT ONLY)     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Ajout d'une possibilité de configuration de la figure par l'utilisateur
 legengeSettings = questdlg('Do you want to change the captions?', 'Caption', ...
                            'Yes','No', 'No') 
 switch(legengeSettings)
    case 'Yes'         
      xTitle = inputdlg({'Caption x of the figure:'}, ...
                         'Caption - Advanced settings', [1 30]);
      yTitle = inputdlg({'Caption y of the figure:'}, ...
                         'Caption - Advanced settings', [1 30]);
      figureTitle = inputdlg({'Figure title:'}, ...
                              'Caption - Advanced settings', [1 30]);
                            
    case 'No'
      xTitle = 'Time t [s]';
      yTitle = 'Amplitude';
      figureTitle = 'Amplitude of the signal as a function of time';
  end
  
  %affichage de la figure avec en intégrant la configuration précédente
  close all; 
  plot(x,y ,'r')          % signal d'origine
  hold on 
  plot(x_2, y_2, 'b')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
  
endfunction