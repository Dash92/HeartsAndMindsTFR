
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_killed

Description:
    Create marker wreck and change reputation on vehicle destruction.

Parameters:
    _vehicle - Vehicle object. [Object]

Returns:

Examples:
    (begin example)
        [btc_veh_12] call btc_fnc_eh_veh_killed;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

private _marker = createMarker [format ["m_%1", _vehicle], getPos _vehicle];
_marker setMarkerType "mil_box";
_marker setMarkerColor "ColorRed";
[_marker, "STR_BTC_HAM_O_EH_VEHKILLED_MRK", getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName")] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; // %1 wreck

_attackPos_01 = [_vehicle, 1000, 1500, 5, 0, 25, 0] call BIS_fnc_findSafePos;
_attackGroup_01 = [_attackPos_01, east, (configfile >> "CfgGroups" >> "East" >> "CFP_O_IS" >> "Infantry" >> "cfp_o_grp_is_inf_fire_team")] call BIS_fnc_spawnGroup;
_attackwp_01 = _attackGroup_01 addWaypoint [position _vehicle, 0];

_attackPos_02 = [_vehicle, 1000, 1500, 5, 0, 25, 0] call BIS_fnc_findSafePos;
_attackGroup_02 = [_attackPos_02, east, (configfile >> "CfgGroups" >> "East" >> "CFP_O_IS" >> "Motorized" >> "cfp_o_grp_is_offroad_mgs")] call BIS_fnc_spawnGroup;
_attackwp_02 = _attackGroup_02 addWaypoint [position _vehicle, 0];

_vehicle setVariable ["marker", _marker];

if (isServer) then {
    btc_rep_malus_veh_killed call btc_fnc_rep_change;
} else {
    btc_rep_malus_veh_killed remoteExec ["btc_fnc_rep_change", 2];
};
