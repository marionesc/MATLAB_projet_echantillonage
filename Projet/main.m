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
%%%%%%%%%%%%%%%%%%%%
%% INITIALIZATION %%
%%%%%%%%%%%%%%%%%%%%
%% Initialization of global message
CHOICE_MODE_MESSAGE = 'Choose the mode you want to launch.'
DEMO_MESSAGE = 'You are in demo mode.'
PROJECT_MESSAGE = 'You are in project mode. \n Choose the mode.'

%% Initialization of others variables
DEMO = 0;
PROJECT = 1;

%%%%%%%%%%%%%%%
%% MAIN CODE %%
%%%%%%%%%%%%%%%  
%% Print command interface message for the project's start
display("Launch project user interface") 

  %% First menu for the choice between Demo and Project mode
  modeChoice = questdlg(CHOICE_MODE_MESSAGE, 'choose of mode', ...
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
        inter_mode();
      case 2
        %% enter on zero-padding vision
        zero_padding_mode();
      case 3
        %% enter on linear vision
        linear_mode(PROJECT);
    end

  case 'Quit'
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Quit the global project (break)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end