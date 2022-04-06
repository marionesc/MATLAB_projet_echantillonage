## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTER MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%
function inter_mode()
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%  ENTREE DES VALEURS UTILISATEUR - MODE INTERPOLATION (PROJECT ONLY)  %%%
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


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE INTERPOLATION (PROJECT ONLY)     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%     AFFICHAGE DE(S) FIGURE(S) - MODE INTERPOLATION (PROJECT ONLY)    %%%
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