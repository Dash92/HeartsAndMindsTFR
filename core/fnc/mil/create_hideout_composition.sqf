
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_create_hideout_composition

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_create_hideout_composition;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]]
];

private _type_bigbox = selectRandom ["Box_FIA_Ammo_F", "C_supplyCrate_F"];

private _composition_hideout = [
    [selectRandom btc_type_campfire,0,[-2.30957,-1.02979,0]],
    [_type_bigbox,121.331,[0.675781,-1.52539,0]],
    [selectRandom btc_type_bigbox,227.166,[2.66504,1.4126,0]],
    [selectRandom btc_type_sleepingbag,135.477,[0.758789,-3.91309,0]],
    [selectRandom btc_type_power,77.6499,[0.418945,3.51855,0]],
    ["ISC_Flag_IS",0,[0,0,0]],
    [selectRandom btc_type_sleepingbag,161.515,[-0.726563,-4.76953,0]],
    ["Land_SatelliteAntenna_01_F",304.749,[-3.71973,2.46143,0]],
    [selectRandom btc_type_seat,279.689,[-4.52783,-0.76416,0]],
    [selectRandom btc_type_seat,238.639,[-3.89014,-2.94873,0]],
    [selectRandom btc_type_tent,86.984,[3.19922,-4.36133,0]],
    [selectRandom btc_type_tent,10,[-4.35303,-5.66309,0]]

];

private _composition = [_pos, random 360, _composition_hideout] call btc_fnc_create_composition;

_composition select ((_composition apply {typeOf _x}) find _type_bigbox);
