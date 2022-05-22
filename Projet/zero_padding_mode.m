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
function zero_padding_mode(t, y, samplingRate, yBit) 
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%   ENTREE DES VALEURS UTILISATEUR - MODE ZERO-PADDING (PROJECT ONLY)  %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
 prompt1 = "Sampling Frequency";
 prompt2 = "Sampling Time ";
 userInput = inputdlg({prompt1, prompt2},...
                       'User values inputs', [1,30 ; 1,30], {1000, 1});
                            
 projectSamplingFrequency = str2num(cell2mat(userInput(1)));
 projectSamplingTime = str2num(cell2mat(userInput(2)));
                                               
 % Calculs des autres valeurs nessaires
 samplingTime = projectSamplingTime;
 samplingPeriod = 1/projectSamplingFrequency; 
  

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS &CONFIGURATIONS - MODE ZERO-PADDING (PROJECT ONLY)      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%% FIRST STEP --> Creation of the original FFT and division into two parts
 % On signal sampling by zero padding mode
 % Fast Fourier Transform application
 fft_ZPori      = fft(yBit);                    % Creation of original FFT signal
 fft_yZPori_size = length(fft_ZPori);           % definition of lenght of original FFT signal
 fft_yZPori_center = floor(fft_yZPori_size/2)   % definition of median height of original FFT signal 
 
 % Creating the array containing the first half of the original FFT values
 tab_ZP1 = fft_ZPori(  1                    : fft_yZPori_center  ) ; 
 
 % Creating the array containing the second half of the original FFT values
 tab_ZP2 = fft_ZPori(fft_yZPori_center + 1  : fft_yZPori_size    ); 
  

 %%% SECOND STEP --> Creation of zero's array to add and fusion for final FFT
 % Creation of an array of zeros based on the desired sampling rate
 tab_ZP0 = zeros(1,(samplingRate -1 ) * (fft_yZPori_size - 1));
 
 % Array merge -- add zero array in center
 fft_ZPfinal = [tab_ZP1 tab_ZP0 tab_ZP2]; 
  
 fft_yZPfinal = samplingRate * ifft(fft_ZPfinal);
 fft_tZPfinal = [0 : 1/(samplingRate * projectSamplingFrequency): 1];
  
 
 
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
  
  %affichage des figures avant/apres 
  display(t_size = length(t))

  plot(t, yBit        , 'ob')     % signal d'origine
  hold on 
  plot(fft_tZPfinal , fft_yZPfinal, 'xr')     % signal sur-echantillone
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
  
endfunction