## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created:     2022-03-23
## Last update: 2022-05-22  

%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTER MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%
function inter_mode(t, y, yBit, samplingRate)
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%         USER VALUES INPUT - INTERPOLATION MODE(PROJECT ONLY)         %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 userInput = inputdlg({"Sampling Frequency", "Sampling Time "},...
                       'User values inputs', [1,30 ; 1,30], {1000, 1});
                            
 projectSamplingFrequency = str2num(cell2mat(userInput(1)));
 projectSamplingTime      = str2num(cell2mat(userInput(2)));
                                               

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS & CONFIGURATIONS - INTERPOLATION MODE (PROJECT ONLY)    %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
interp_t = 0:(1/(samplingRate*projectSamplingFrequency)):projectSamplingTime ;

interp_y = interp1(t,yBit,interp_t);       % using generic function "interp1"


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%       DISPLAY OF FIGURE(S) - MODE INTERPOLATION (PROJECT ONLY)       %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Added possibility of configuration of the figure by the user
 legengeSettings = questdlg('Do you want to change the captions?', 'Caption', ...
                            'yes','No', 'No') 
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

  % display of the figure with by integrating the previous configuration
  close all;
  % Original signal
  plot(t,yBit ,'ob')
  hold on 
  
  % Over-sampling signal
  plot(interp_t, interp_y, 'xr')
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
 
 
 
 
endfunction