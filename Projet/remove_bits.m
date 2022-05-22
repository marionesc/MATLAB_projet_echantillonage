## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-04-11

function remove_bits(projectMode = 2)
  close all; 
  load signal1; 
  plot(t, y) 
  
  %% INITALIZATION OF MESSAGE
  nRemoveMessage = "number of bit to delete "; 
  samplingRateMessage = "Sampling rate ";
  
  switch(projectMode)
    %%%%%%%%%%%%%%%%%%%%%%%
    %%%%% INTERP MODE %%%%%
    case 1 
         userInput = inputdlg({nRemoveMessage,samplingRateMessage},  ...
                              "User values inputs", [1,20 ; 1,20]);
         numberOfDelete = str2num(cell2mat(userInput(1)));
         samplingRate   = str2num(cell2mat(userInput(2)));
        
         for i = 0 : length(y); 
            yBit = bitshift(y, -numberOfDelete);    
         endfor  
         % plot(t, yBit, 'g')   FOR DEBBUG ONLY
         inter_mode(t , y, yBit);
         
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%% ZERO-PADDING MODE %%%%%         
    case 2      
         userInput = inputdlg({nRemoveMessage,samplingRateMessage},  ...
                              "User values inputs", [1,0 ; 1,20], {2,2});
         numberOfDelete = str2num(cell2mat(userInput(1)));
         samplingRate   = str2num(cell2mat(userInput(2)));
         
         for i = 0 : length(y);
            yBit = bitshift(y, -numberOfDelete);    
         endfor
         % plot(t, yBit, 'g')   FOR DEBBUG ONLY
         zero_padding_mode(t , y, samplingRate, yBit);
         
    %%%%%%%%%%%%%%%%%%%%%%%
    %%%%% LINEAR MODE %%%%%
    case 3 
         userInput = inputdlg(nRemoveMessage, ...
                              'User values inputs', [1,20],{2});
         numberOfDelete = str2num(cell2mat(userInput(1)));
         for i = 0 : length(y);
            yBit = bitshift(y, -numberOfDelete);    
         endfor
         % plot(t, yBit, 'g')   FOR DEBBUG ONLY
         linear_mode(1, t , y, yBit);
    end
endfunction