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
function inter_mode(t, y, ybit)
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%         USER VALUES INPUT - INTERPOLATION MODE(PROJECT ONLY)         %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  projectSamplingRate = str2num(inputdlg({'Sampling Rate :'}, ...
                                          'User values inputs', [1 30]));
  projectSamplingTime = str2num(inputdlg({'Sampling Time :'}, ...
                                          'User values inputs', [1 30]));
  projectSamplingFrequency = str2num(inputdlg({'Sampling frequency :'}, ...
                                               'User values inputs', [1 30]));


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      CALCULS & CONFIGURATIONS - INTERPOLATION MODE (PROJECT ONLY)    %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 
 
 
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
  plot(x,y ,'r')
  hold on 
  
  % Over-sampling signal
  plot(x_2, y_2, 'b')
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
 
 
 
 
endfunction