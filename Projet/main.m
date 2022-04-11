## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATTEOS
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
CHOICE_MODE_MESSAGE = 'Choisissez le mode que vous souhaitez lancer.'
DEMO_MESSAGE = 'Vous etes dans le mode démo.'
PROJECT_MESSAGE = 'vous etes dans le mode projet. \n Choississez votre mode.'

%% Initialization of others variables
DEMO = 0;
PROJECT = 1;

%%%%%%%%%%%%%%%
%% MAIN CODE %%
%%%%%%%%%%%%%%%  
%% Print command interface message for the project's start
display("Lancement interface d'utilisation du projet") 

  %% First menu for the choice between Demo and Project mode
  modeChoice = questdlg(CHOICE_MODE_MESSAGE, 'choix du mode', ...
                'Demo', 'Projet','Quitter', 'Projet') 
switch(modeChoice)
  case 'Demo' 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% enter on demo mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linear_mode(DEMO);
  
  case 'Projet' 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% enter on the project mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    projectMode = menu(PROJECT_MESSAGE, 'interpolation', 'zero-padding', 'lineaire');
    switch(projectMode)                                                                   
      case 1 
        %% enter on interpolation vision
        
      case 2
        %% enter on zero-padding vision
        
      case 3
        %% enter on linear vision
    end

  case 'Quitter'
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Quit the glabal project (break)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end