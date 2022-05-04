## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%  modeChoice = 1 : pour pouvoir débugger seulement ce fichier si besoin en mode project

function linear_mode(modeChoice = 1, t, y, yBit)  
 SAMPLING_RATE = 2; % imposé pour le mode lineaire
 yLenght = length(y); 
 ySize = size(y); 
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
      prompt1 = "Sampling Frequency";
      prompt2 = "Sampling Time ";
      userInput = inputdlg({prompt1, prompt2},...
                           'User values inputs', [1,30 ; 1,30], {1000, 1});
                            
      projectSamplingFrequency = str2num(cell2mat(userInput(1)));
      projectSamplingTime = str2num(cell2mat(userInput(2)));
    
      % Calculs des autres valeurs nessaires
      samplingTime = projectSamplingTime;
      samplingPeriod = 1/projectSamplingFrequency; 
      samplingXAxis = t;
      samplingYAxis = yBit; 
    end
  
  % Sur echantillonage du signal 
  samplingXAxis_2 = [0 : samplingPeriod/2 : samplingTime]
  for i = 1 : yLenght
    ydPosition = (2 * i) - 1; 
    samplingYAxis_2(ydPosition) = samplingYAxis(i)
    if i < yLenght 
      samplingYAxis_2(ydPosition + 1) = (samplingYAxis(i) + samplingYAxis(i + 1))/SAMPLING_RATE;
    endif
  endfor
  
  
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
  plot(samplingXAxis, samplingYAxis,'ob')          % signal d'origine
  hold on 
  plot(samplingXAxis_2, samplingYAxis_2, 'xr')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
  
endfunction