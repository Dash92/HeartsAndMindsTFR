enableSaving [false, false];

if (hasInterface) then {btc_intro_done = [] spawn btc_fnc_intro;};

[] call compile preprocessFileLineNumbers "core\def\mission.sqf";
[] call compile preprocessFileLineNumbers "define_mod.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "core\init_server.sqf";
};

[] call compile preprocessFileLineNumbers "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_headless.sqf";
};

if (isServer) then {
 
    CuratorLogicGroup = creategroup sideLogic;  
    CheatCurator0 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 90, 90],[],0.5,"NONE"];    
    CheatCurator0 setvariable ["text","CheatCurator0"];    
    CheatCurator0 setvariable ["Addons",3,true];//3: allow all addons with proper use of CfgPatches
    CheatCurator0 setvariable ["owner","objnull"];  
    CheatCurator0 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
    unassignCurator CheatCurator0;
    objnull assignCurator CheatCurator0;
   
    CheatCurator1 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 90, 90],[],0.5,"NONE"];    
    CheatCurator1 setvariable ["text","CheatCurator1"];    
    CheatCurator1 setvariable ["Addons",3,true];//3: allow all addons with proper use of CfgPatches
    CheatCurator1 setvariable ["owner","objnull"];  
    CheatCurator1 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
    unassignCurator CheatCurator1;
    objnull assignCurator CheatCurator1;
   
    CheatCurator2 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 90, 90],[],0.5,"NONE"];    
    CheatCurator2 setvariable ["text","CheatCurator2"];    
    CheatCurator2 setvariable ["Addons",3,true];//3: allow all addons with proper use of CfgPatches
    CheatCurator2 setvariable ["owner","objnull"];  
    CheatCurator2 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
    unassignCurator CheatCurator2;
    objnull assignCurator CheatCurator2;
   
    CheatCurator3 = CuratorLogicGroup createunit ["ModuleCurator_F", [0, 90, 90],[],0.5,"NONE"];    
    CheatCurator3 setvariable ["text","CheatCurator3"];    
    CheatCurator3 setvariable ["Addons",3,true];//3: allow all addons with proper use of CfgPatches
    CheatCurator3 setvariable ["owner","objnull"];  
    CheatCurator3 setvariable ["vehicleinit","_this setvariable ['Addons',3,true]; _this setvariable ['owner','objnull'];"];
    unassignCurator CheatCurator3;
    objnull assignCurator CheatCurator3;
   
    missionCurators = [ CheatCurator0, CheatCurator1, CheatCurator2, CheatCurator3 ];
    [] execVM "server\functions\setupmissionzeus.sqf";
};
