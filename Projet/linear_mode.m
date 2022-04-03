## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATTEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LINEAR MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%%
function linear_mode(mode)  
  % initialization of locals variable
  titre = "titre de la figure";
  
  % Mode values  
  if (mode = 0) % DEMO 
    DEMO_SAMPLING_RATE = 2;
    DEMO_SAMPLING_TIME = 10;
    DEMO_SAMPLING_FREQUENCY = 10;
  endif
  
  if (mode = 1) % PROJECT
    userInput = inputdlg({'Sampling Time :', 'Sampling frequency :'}, ...
                          ' entrée des valeurs utilisateurs', [1 30; 1 30]);
    projectSamplingRate = 2;
    projectSamplingTime = userInput(0);
    projectSamplingFrequency = userInput(1);
  endif
  

endfunction