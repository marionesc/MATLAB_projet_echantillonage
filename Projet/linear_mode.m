## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Github : maesc
##
## Created:     2022-05-04
## Last update: 2022-05-22  
##
## linear_mode.m  --> file and function allowing the application of the linear method
##                --> requires file & function 'bit_delete.m' to work properly
##                    @param    modeChoice : choice between demo mode (0) or project mode (1, default value)
##                    @param             t : time variable in abscissa of the original signal (signal1)
##                    @param             y : original signal ordinate data variable (signal1)
##                    @param          yBit : variable of the data in ordinate of the signal after the use of the bitshift
##                    no @return


function linear_mode(modeChoice = 1, t , y, yBit)  
 SAMPLING_RATE = 2; % imposé pour le mode lineaire 

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%             CONFIGURATION BETWEEN DEMO OR PROJECT MODE              %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  switch(modeChoice)
    case 0 % DEMO 
      % Default values for demo mode
      DEMO_SAMPLING_TIME = 10;
      DEMO_SAMPLING_FREQUENCY = 10;
      
      % Calculations of other necessary values
      samplingTime = DEMO_SAMPLING_TIME;
      samplingPeriod = 1/DEMO_SAMPLING_FREQUENCY; 
      samplingXAxis = [0 : samplingPeriod : DEMO_SAMPLING_TIME];
      samplingYAxis = sin(pi/2*samplingXAxis); %% +132 ???

    case 1 % PROJECT
      % User input of PROJECT Mode values
      prompt1 = "Sampling Frequency";
      prompt2 = "Sampling Time ";
      userInput = inputdlg({prompt1, prompt2},...
                           'User values inputs', [1,30 ; 1,30], {1000, 1});
                            
      projectSamplingFrequency = str2num(cell2mat(userInput(1)));
      projectSamplingTime = str2num(cell2mat(userInput(2)));
    
      % Calculations of other necessary values
      samplingTime = projectSamplingTime;
      samplingPeriod = 1/projectSamplingFrequency; 
      samplingXAxis = t;
      samplingYAxis = yBit;
    end
  
  % Signal oversampling
  yBitSize = length(samplingYAxis);
  
  for i = 1 : yBitSize
    % we position the original values in the odd cells of the table
    samplingYAxis_2((2 * i) - 1) = samplingYAxis(i);
    
    % We position the calculated values in the even cells of the table
    if i < yBitSize
      samplingYAxis_2((2 * i)) = (samplingYAxis(i) + samplingYAxis(i + 1))/SAMPLING_RATE;
    endif
  endfor
  
  samplingXAxis_2 = 0 : samplingPeriod/2 : samplingTime;
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%      DISPLAY OF FIGURE(S) - LINEAR MODE (DEMO 1 PROJECT MODE      %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
      figureTitle = 'amplitude of the signal as a function of time';
  end
  
  % display of the figure with by integrating the previous configuration
  close all; 
  % Original signal
  plot(samplingXAxis, samplingYAxis,'ob')
  hold on
  
  % Over-sampling signal
  plot(samplingXAxis_2, samplingYAxis_2, 'xr')
  
  title(figureTitle);        
  xlabel(xTitle);                  
  ylabel(yTitle);   
  legend("Original signal", "Over-sampled signal");
endfunction