## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Github : maesc
##
## Created:     2022-04-11
## Last update: 2022-05-22  
##
## linear_mode.m  --> file and function allowing the application of the bitshift application used for all method
##                    @param projectMode : Project's choice between Interp method (1, default value),
##                                         Zero-padding method (2) or linear method (3) 
##                    no @return


function remove_bits(projectMode = 1)
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
         inter_mode(t , y, yBit, samplingRate);
         
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