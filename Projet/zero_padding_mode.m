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
                                  ' entrée des valeurs utilisateurs', [1 30]));
  projectSamplingTime = str2double(
                        inputdlg({'Sampling Time :'}, ...
                                  ' entrée des valeurs utilisateurs', [1 30]));
  projectSamplingFrequency = str2double(
                             inputdlg({'Sampling frequency :'}, ...
                                       ' entrée des valeurs utilisateurs', [1 30]));
  projectBitDelete = str2double(
                     inputdlg({'Nuber of Bit delete :'}, ...
                               ' entrée des valeurs utilisateurs', [1 30]));

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE ZERO-PADDING (PROJECT ONLY)      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%     AFFICHAGE DE(S) FIGURE(S) - MODE ZERO-PADDING (PROJECT ONLY)     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Ajout d'une possibilité de configuration de la figure par l'utilisateur
 legengeSettings = questdlg('Voulez vous personnaliser les legendes ?', 'Legende', ...
                            'Oui','Non', 'Non') 
 switch(legengeSettings)
    case 'Oui'         
      xTitle = inputdlg({'Legende x de la figure :'}, ...
                         'Legende - Paramètres avancés', [1 30]);
      yTitle = inputdlg({'Legende y de la figure:'}, ...
                         'Legende - Paramètres avancés', [1 30]);
      figureTitle = inputdlg({'Titre de la figure:'}, ...
                              'Legende - Paramètres avancés', [1 30]);
                            
    case 'Non'
      xTitle = 'Temps t [s]';
      yTitle = 'Amplitude';
      figureTitle = 'amplitude du signal en fonction du temps';
  end
  
  %affichage de la figure avec en intégrant la configuration précédente
  close all; 
  plot(x,y ,'r')          % signal d'origine
  hold on 
  plot(x_2, y_2, 'b')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("signal d'origine", "signal sur-echantillone");
  

endfunction