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
      projectSamplingFrequency = str2num(inputdlg({'Sampling Frequency :'}, ...
                                                   'User values inputs', [1 30]));
      projectSamplingTime = str2num(inputdlg({'Sampling Time :'}, ...
                                              'User values inputs', [1 30]));


    
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
      figureTitle = 'amplitude of the signal as a function of time';
  end
  
  %affichage de la figure avec en intégrant la configuration précédente
  close all; 
  plot(samplingXAxis, samplingYAxis,'r')          % signal d'origine
  hold on 
  plot(samplingXAxis_2, samplingYAxis_2, 'b')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
  
endfunction