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
                                  ' entr�e des valeurs utilisateurs', [1 30]));
  projectSamplingTime = str2double(
                        inputdlg({'Sampling Time :'}, ...
                                  ' entr�e des valeurs utilisateurs', [1 30]));
  projectSamplingFrequency = str2double(
                             inputdlg({'Sampling frequency :'}, ...
                                       ' entr�e des valeurs utilisateurs', [1 30]));


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE INTERPOLATION (PROJECT ONLY)     %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%     AFFICHAGE DE(S) FIGURE(S) - MODE INTERPOLATION (PROJECT ONLY)    %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Ajout d'une possibilit� de configuration de la figure par l'utilisateur
 legengeSettings = questdlg('Voulez vous personnaliser les legendes ?', 'Legende', ...
                            'Oui','Non', 'Non') 
 switch(legengeSettings)
    case 'Oui'         
      xTitle = inputdlg({'Legende x de la figure :'}, ...
                         'Legende - Param�tres avanc�s', [1 30]);
      yTitle = inputdlg({'Legende y de la figure:'}, ...
                         'Legende - Param�tres avanc�s', [1 30]);
      figureTitle = inputdlg({'Titre de la figure:'}, ...
                              'Legende - Param�tres avanc�s', [1 30]);
                            
    case 'Non'
      xTitle = 'Temps t [s]';
      yTitle = 'Amplitude';
      figureTitle = 'amplitude du signal en fonction du temps';
  end
  
  %affichage de la figure avec en int�grant la configuration pr�c�dente
  close all; 
  plot(x,y ,'r')          % signal d'origine
  hold on 
  plot(x_2, y_2, 'b')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("signal d'origine", "signal sur-echantillone");
 
 
 
 
endfunction