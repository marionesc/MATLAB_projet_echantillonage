## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-04-11

function remove_bits(projectMode = 3)
  load signal1; 
  ySize = length(y);
  display(ySize);
  
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
        
         for i = 0 : ySize 
            yBit = bitshift(y_t, -numberOfDelete);    
         endfor  
         
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%% ZERO-PADDING MODE %%%%%         
    case 2      
         userInput = inputdlg({nRemoveMessage,samplingRateMessage},  ...
                              "User values inputs", {[1,20],[1,20]}, {2, 2});
         numberOfDelete = str2num(cell2mat(userInput(1)));
         samplingRate   = str2num(cell2mat(userInput(2)));
         for i = 0 : ySize
            yBit = bitshift(y_t, -numberOfDelete);    
         endfor
         
    %%%%%%%%%%%%%%%%%%%%%%%
    %%%%% LINEAR MODE %%%%%
    case 3 
         userInput = inputdlg(nRemoveMessage, ...
                              'User values inputs', [1,20],{2});
         numberOfDelete = str2num(cell2mat(userInput(1)));
         for i = 0 : ySize
            yBit = bitshift(y, -numberOfDelete);    
         endfor
         plot(t, yBit, 'xr')
         linear_mode(1, t , y, yBit);
    end
endfunction