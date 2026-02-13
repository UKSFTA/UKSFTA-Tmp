#define SOUND(var1,var2) \
    class GVAR(DOUBLES(var2,Quiet)) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+100, 1, 10}; \
        titles[] = {}; \
    }; \
    class GVAR(var2) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+150, 1, 10}; \
        titles[] = {}; \
    }; \
    class GVAR(DOUBLES(var2,Loud)) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+250, 1, 10}; \
        titles[] = {}; \
    };

class CfgSounds {
    sounds[] = {track1, track2, track3, track4, track5, track6, track8, track9, track10, track11, track12, track13, track14, track15, track16, track17, track18, track19};

    SOUND(track1,Enter_Sandman)
    SOUND(track2,Fuel)
    SOUND(track3,Warpigs)
    SOUND(track4,Voodoo_Chile)
    SOUND(track5,Crazy_Train)
    SOUND(track6,Master_Of_Puppets)
    SOUND(track7,Thunderstruck)
    SOUND(track8,Kickstart_My_Heart)
    SOUND(track9,YUP)
    SOUND(track10,Seek_and_Destroy)
    SOUND(track11,Danger_Zone)
    SOUND(track12,Hurricane)
    SOUND(track13,Back_In_Black)
    SOUND(track14,Last_Time_That_I_Checked)
    SOUND(track15,HUMBLE)
    SOUND(track16,DNA)
    SOUND(track17,Candyman)
    SOUND(track18,Shadowboxin)
    SOUND(track19,Victory_Lap)
};
