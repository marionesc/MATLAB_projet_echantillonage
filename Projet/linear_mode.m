## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%  modeChoice = 1 : pour pouvoir débugger seulement ce fichier si besoin en mode project
function linear_mode(modeChoice = 1)  
 SAMPLING_RATE = 2; % imposé pour le mode lineaire
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%                    CONFIGURATION EN FONCTION DU MODE                %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  switch(modeChoice)
    case 0 % DEMO 
      % Valeur par defaut du mode DEMO
      DEMO_SAMPLING_TIME = 10;
      DEMO_SAMPLING_FREQUENCY = 10;
      
      % Calculs des autres valeurs nessaires
      samplingTime = DEMO_SAMPLING_TIME;
      samplingPeriod = 1/DEMO_SAMPLING_FREQUENCY; 
      samplingXAxis = [0 : samplingPeriod : DEMO_SAMPLING_TIME];
      samplingYAxis = sin(pi/2*samplingXAxis);

    case 1 % PROJECT
      % Entree des valeurs du Mode PROJECT par l'utilisateur
      projectSamplingFrequency = str2double(
                                 inputdlg({'Sampling frequency :'}, ...
                                           ' entrée des valeurs utilisateurs', [1 30]));
      projectSamplingTime = str2double(
                            inputdlg({'Sampling Time :'}, ...
                                      ' entrée des valeurs utilisateurs', [1 30]));


    
      % Calculs des autres valeurs nessaires
      samplingTime = projectSamplingTime;
      samplingPeriod = 1/projectSamplingFrequency; 
      samplingXAxis = [0 : samplingPeriod : projectSamplingTime];
      samplingYAxis = sin(pi/2*samplingXAxis);
  end
  
  % Sur echantillonage du signal 
  samplingXAxis_2 = [0 : samplingPeriod/2 : samplingTime]
  samplingYAxis_2 = sin(pi/2*samplingXAxis_2);
  
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%                      AFFICHAGE DES RESULTATS                      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  plot(samplingXAxis, samplingYAxis,'r')          % signal d'origine
  hold on 
  plot(samplingXAxis_2, samplingYAxis_2, 'b')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("signal d'origine", "signal sur-echantillone");
  
endfunction