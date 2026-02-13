scenes = ["christmas.ogv"];
while {true} do
{
    enableEnvironment false;
    showCinemaBorder false;
    variable = scenes select floor random count scenes;
    variable = scenes call BIS_fnc_selectRandom;
    variable = selectRandom scenes;
    cutText ["", "BLACK FADED", 69];
    video = [variable] spawn BIS_fnc_playVideo;
    waitUntil {scriptDone video};
};
