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
##
##
## main.m --> File containing the entire main launch of the project
##            no @param
##            no @return

clear all; 
close all; 

load signal1; 
plot(t, y); 

%%%%%%%%%%%%%%%%%%%%
%% INITIALIZATION %%
%%%%%%%%%%%%%%%%%%%%
%% Initialization of global message
CHOICE_MODE_MESSAGE =   'Choose the mode that you want to launch.'
DEMO_MESSAGE =          'You are in demo mode.'
PROJECT_MESSAGE =       'You are in project mode. Choose the method.'
INPUT_INTERFACE_TITLE = 'User values inputs'

%% Initialization of others variables
DEMO = 0;             
PROJECT = 1;

INTERP = 1; 
ZEROPADDING = 2; 
LINEAR = 3;

yBit = 0;    % delete bit variable
yLenght = length(y); 
ySize = size(y); 

%%%%%%%%%%%%%%%
%% MAIN CODE %%
%%%%%%%%%%%%%%%  
%% Print command interface message for the project's start
display("Launch project user interface") 

%% First menu for the choice between Demo and Project mode
modeChoice = questdlg(CHOICE_MODE_MESSAGE, 'Mode choice', ...
                      'Demo', 'Project','Quit', 'Project') 
                        
switch(modeChoice)
  case 'Demo' 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% entering at demo mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linear_mode(DEMO);
    
  
  case 'Project' 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% entering at the project mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    projectMode = menu(PROJECT_MESSAGE, 'interpolation', 'zero-padding', 'linear');
    switch(projectMode)                                                                   
      case 1 
        %% entering on interpolation vision
        remove_bits(INTERP);
        %% inter_mode() directly called on remove_bits() function
        
      case 2
        %% entering on zero-padding vision
        remove_bits(ZEROPADDING);
        %% zero_padding_mode() directly called on remove_bits() function
        
      case 3
        %% entering on linear vision
        remove_bits(LINEAR);
        %% linear_mode directly called on remove_bits() function
    end

  case 'Quit'
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% You quit the global project (break)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end