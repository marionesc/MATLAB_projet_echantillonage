## Copyright (C) 2022 MARION ESCOUTELOUP
##                    THEO FAURE
##                    ETIENNE MATTEOS
##                    YOHANN DELAVEAUX
##                    JULIEN ARNAUDIES
##
## Created: 2022-03-23

%%%%%%%%%%%%%%%%%%%%
%% INITIALIZATION %%
%%%%%%%%%%%%%%%%%%%%
%% Initialization of global message
CHOICE_MODE_MESSAGE = 'Choississez le mode que vous souhaitez lancer.'
DEMO_MESSAGE = 'Vous etes dans le mode démo.'
PROJECT_MESSAGE = 'vous etes dans le mode projet. \n Choississez votre mode.'

%% Initialization of globals constants
DEMO_SAMPLING_RATE = 2
DEMO_SAMPLING_TIME = 10
DEMO_SAMPLING_FREQUENCY = 10

%%%%%%%%%%%%%%%
%% MAIN CODE %%
%%%%%%%%%%%%%%%  
%% Print command interface message for the project's start
display("Lancement interface d'utilisation du projet") 

%% First menu for the choice between Demo and Project mode
modeChoice = questdlg(CHOICE_MODE_MESSAGE, 'choix du mode', ...
                'Demo', 'Projet','Quitter', 'Projet') 
switch(modeChoice)
  case 1 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% enter on demo mode interface
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    demoMode = menu(DEMO_MESSAGE,'1', '2', '3')
    
  case 2 
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

  case 3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Quit the glabal project (break)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 end 