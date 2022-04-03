## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATTEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTER MODE FUNCTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%
function inter_mode()
  userInput = inputdlg({'Sampling Rate :', 'Sampling Time :', 'Sampling frequency :'}, ...
                        ' entrée des valeurs utilisateurs', [1 30; 1 30; 1 30]);
  projectSamplingRate = userInput(0);
  projectSamplingTime = userInput(1);
  projectSamplingFrequency = userInput(2);
  

  
endfunction