## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-04-11

function remove_bit(y, t)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%  INITIALIZATION OF GLOBAL MESSAGE AND VALUES  %%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  nRemoveMessage = 'How many bits do you want remove ?'
  nBits = 'How many bits do you want as oversampling rate ?'
  nBitsDefault = 2; 

  userInput = inputdlg({nRemoveMessage, nBits}, ...
                        'User values inputs', [1,20 ; 1,20],{'',nBitsDefault});
  
  numberOfDelete = str2num(cell2mat(userInput(2)));
  overSamplingRate = str2num(cell2mat(userInput(1))); 
  
  for i = 0 : size(y)
    yBit = bitshift(y, -numberOfDelete);    
  endfor
endfunction