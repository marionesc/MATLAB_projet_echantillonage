## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Github : maesc
##
## Created:     2022-03-23
## Last update: 2022-05-22  
## linear_mode.m  --> file and function allowing the application of the zero-padding method
##                --> requires file & function 'bit_delete.m' to work properly
##                    @param             t : time variable in abscissa of the original signal (signal1)
##                    @param             y : original signal ordinate data variable (signal1)
##                    @param  samplingRate : signal sampling rate
##                    @param          yBit : variable of the data in ordinate of the signal after the use of the bitshift
##                    no @return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ZERO PADDING MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function zero_padding_mode(t, y, samplingRate, yBit) 
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%         USER VALUES INPUT - ZERO-PADDING MODE (PROJECT ONLY)         %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
 userInput = inputdlg({"Sampling Frequency", "Sampling Time "},...
                       'User values inputs', [1,30 ; 1,30], {1000, 1});
                            
 projectSamplingFrequency = str2num(cell2mat(userInput(1)));
 projectSamplingTime      = str2num(cell2mat(userInput(2)));
                                               
 % Calculations of other necessary values
 samplingTime = projectSamplingTime;
 samplingPeriod = 1/projectSamplingFrequency; 
  

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS & CONFIGURATIONS - ZERO-PADDING MODE(PROJECT ONLY)      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%% FIRST STEP --> Creation of the original FFT and division into two parts
 fft_ZPori      = fft(yBit);                    % Creation of original FFT signal
 fft_yZPori_size = length(fft_ZPori);           % definition of lenght of original FFT signal
 fft_yZPori_center = floor(fft_yZPori_size/2)   % definition of median height of original FFT signal 
 
 % creation of two arrays containing respectively the first and the second half of the original FFT values
 tab_ZP1 = fft_ZPori(  1                    : fft_yZPori_center  ) ; 
 tab_ZP2 = fft_ZPori(fft_yZPori_center + 1  : fft_yZPori_size    ); 
  
  
 %%% SECOND STEP --> Creation of zero's array to add and fusion for final FFT
 tab_ZP0 = zeros(1,(samplingRate -1 ) * (fft_yZPori_size - 1));
 
 % Array merge -- add zero array in center
 fft_ZPfinal = [tab_ZP1 tab_ZP0 tab_ZP2]; 
  
 fft_yZPfinal = samplingRate * ifft(fft_ZPfinal);
 fft_tZPfinal = [0 : 1/(samplingRate * projectSamplingFrequency): 1];
  
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%       DISPLAY OF FIGURE(S) - MODE ZERO-PADDING (PROJECT ONLY)        %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Added possibility of configuration of the figure by the user
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
  
  % display of the figure by integrating the previous configuration
  close all;
  % Original signal
  plot(t, yBit, 'ob')
  hold on 
  
  % Over-sampling signal
  plot(fft_tZPfinal , fft_yZPfinal, 'xr')
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
  
endfunction