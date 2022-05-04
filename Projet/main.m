## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23
clear all; 
close all; 

load signal1; 
plot(t, y); 

%%%%%%%%%%%%%%%%%%%%
%% INITIALIZATION %%
%%%%%%%%%%%%%%%%%%%%
%% Initialization of global message
CHOICE_MODE_MESSAGE =   'Choose the mode do you want to launch.'
DEMO_MESSAGE =          'You are in demo mode.'
PROJECT_MESSAGE =       'You are in project mode. Choose the mode.'
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% enter on demo mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linear_mode(DEMO);
    
  
  case 'Project' 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% enter on the project mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    projectMode = menu(PROJECT_MESSAGE, 'interpolation', 'zero-padding', 'linear');
    switch(projectMode)                                                                   
      case 1 
        %% enter on interpolation vision
        remove_bits(INTERP);
        inter_mode();
      case 2
        %% enter on zero-padding vision
        remove_bits(ZEROPADDING);
        zero_padding_mode();
      case 3
        %% enter on linear vision
        remove_bits(LINEAR);
    end

  case 'Quit'
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Quit the global project (break)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end