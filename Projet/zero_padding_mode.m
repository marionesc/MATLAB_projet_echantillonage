## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATcd Desk  EOS
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
  projectSamplingRate = str2double(
                        inputdlg({'Sampling Rate :'}, ...
                                  'Enter user values', [1 30]));
  projectSamplingTime = str2double(
                        inputdlg({'Sampling Time :'}, ...
                                  'Enter user values', [1 30]));
  projectSamplingFrequency = str2double(
                             inputdlg({'Sampling frequency :'}, ...
                                       'Enter user values', [1 30]));
  projectBitDelete = str2double(
                     inputdlg({'Number of Bit deleted :'}, ...
                               'Enter user values', [1 30]));

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE ZERO-PADDING (PROJECT ONLY)      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%     AFFICHAGE DE(S) FIGURE(S) - MODE ZERO-PADDING (PROJECT ONLY)     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Ajout d'une possibilité de configuration de la figure par l'utilisateur
 legengeSettings = questdlg('Do you want to customize the legends?', 'Legende', ...
                            'Yes','No', 'No') 
 switch(legengeSettings)
    case 'Oui'         
      xTitle = inputdlg({'Caption x of the figure:'}, ...
                         'Caption - Advanced settings', [1 30]);
      yTitle = inputdlg({'Legende y of the figure:'}, ...
                         'Caption - Advanced settings', [1 30]);
      figureTitle = inputdlg({'Figure title:'}, ...
                              'Caption - Advanced settings', [1 30]);
                            
    case 'No'
      xTitle = 'Time t [s]';
      yTitle = 'Amplitude';
      figureTitle = 'amplitude of the signal as a function of time';
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