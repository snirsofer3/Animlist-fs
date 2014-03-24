/*
	Animlist - Development By Snir Sofer
*/
#include <a_samp>
enum E_ANIM_ARRAY
{
	AnimCommand[20],
	bool:AminIsSpecial,
	AnimSpecialID,
	Animlib[40],
	Animname[40],
	Float:AnimfDelta,
	Animloop,
	Animlockx,
	Animlocky,
	Animfreeze,
	Animtime
}
new AnimInfo[][E_ANIM_ARRAY] =
{
	{"handsup",true,SPECIAL_ACTION_HANDSUP,"","",0.0,0,0,0,0,0},
	{"cellin",true,SPECIAL_ACTION_USECELLPHONE,"","",0.0,0,0,0,0,0},
	{"cellout",true,SPECIAL_ACTION_STOPUSECELLPHONE,"","",0.0,0,0,0,0,0},
	{"piss",true,68,"","",0.0,0,0,0,0,0},
	{"dance",true,SPECIAL_ACTION_DANCE1,"","",0.0,0,0,0,0,0},
	{"dance2",true,SPECIAL_ACTION_DANCE2,"","",0.0,0,0,0,0,0},
	{"dance3",true,SPECIAL_ACTION_DANCE3,"","",0.0,0,0,0,0,0},
	{"dance4",true,SPECIAL_ACTION_DANCE4,"","",0.0,0,0,0,0,0},
	{"stopanim",false,-1,"CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0},
	{"rap",false,-1,"RAPPING","RAP_A_Loop", 4.0, 1, 1, 1, 1, 0},
	{"rap2",false,-1,"RAPPING","RAP_B_Loop",4.0,1,1,1,1,0},
	{"rap3",false,-1,"RAPPING","RAP_C_Loop",4.0,1,1,1,1,0},
	{"wank",false,-1,"PAULNMAC","wank_loop",4.0,1,1,1,1,0},
	{"wankoff",false,-1,"PAULNMAC","wank_in",4.0,1,1,1,1,0},
	{"strip",false,-1,"STRIP","strip_A",4.0,1,1,1,1,0},
	{"strip2",false,-1,"STRIP","strip_B",4.0,1,1,1,1,0},
    {"strip3",false,-1,"STRIP","strip_C",4.0,1,1,1,1,0},
    {"strip4",false,-1,"STRIP","strip_D",4.0,1,1,1,1,0},
    {"strip5",false,-1,"STRIP","strip_E",4.0,1,1,1,1,0},
    {"strip6",false,-1,"STRIP","strip_F",4.0,1,1,1,1,0},
    {"strip7",false,-1,"STRIP","strip_G",4.0,1,1,1,1,0},
	{"sexy",false,-1,"SNM","SPANKING_IDLEW",4.1,0,1,1,1,1},
	{"sexy2",false,-1,"SNM","SPANKING_IDLEP",4.1,0,1,1,1,1},
	{"sexy3",false,-1,"SNM","SPANKINGW",4.1,0,1,1,1,1},
	{"sexy4",false,-1,"SNM","SPANKINGP",4.1,0,1,1,1,1},
	{"sexy5",false,-1,"SNM","SPANKEDW",4.1,0,1,1,1,1},
	{"sexy6",false,-1,"SNM","SPANKEDP",4.1,0,1,1,1,1},
	{"sexy7",false,-1,"SNM","SPANKING_ENDW",4.1,0,1,1,1,1},
	{"sexy8",false,-1,"SNM","SPANKING_ENDP",4.1,0,1,1,1,1},
	{"bj",false,-1,"BLOWJOBZ","BJ_COUCH_START_P",4.1,0,1,1,1,1},
	{"bj2",false,-1,"BLOWJOBZ","BJ_COUCH_START_W",4.1,0,1,1,1,1},
	{"bj3",false,-1,"BLOWJOBZ","BJ_COUCH_LOOP_P",4.1,0,1,1,1,1},
	{"bj4",false,-1,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.1,0,1,1,1,1},
	{"lean",false,-1,"GANGS","leanIDLE", 4.0, 1, 0, 0, 0, 0},
	{"follow",false,-1,"WUZI","Wuzi_follow",4.0,0,0,0,0,0},
	{"greet",false,-1,"WUZI","Wuzi_Greet_Wuzi",4.0,0,0,0,0,0},
	{"stand",false,-1,"WUZI","Wuzi_stand_loop", 4.0, 1, 0, 0, 0, 0},
    {"injured2",false,-1,"SWAT","gnstwall_injurd", 4.0, 1, 0, 0, 0, 0},
    {"hitch",false,-1,"MISC","Hiker_Pose", 4.0, 1, 0, 0, 0, 0},
    {"bitchslap",false,-1,"MISC","bitchslap",4.0,0,0,0,0,0},
    {"cpr",false,-1,"MEDIC","CPR", 4.0, 1, 0, 0, 0, 0},
    {"gsign1",false,-1,"GHANDS","gsign1",4.0,0,1,1,1,1},
    {"gsign2",false,-1,"GHANDS","gsign2",4.0,0,1,1,1,1},
    {"gsign3",false,-1,"GHANDS","gsign3",4.0,0,1,1,1,1},
    {"gsign4",false,-1,"GHANDS","gsign4",4.0,0,1,1,1,1},
    {"gsign5",false,-1,"GHANDS","gsign5",4.0,0,1,1,1,1},
    {"gift",false,-1,"KISSING","gift_give",4.0,0,0,0,0,0},
    {"chairsit",false,-1,"PED","SEAT_idle", 4.0, 1, 0, 0, 0, 0},
    {"injured",false,-1,"SWEET","Sweet_injuredloop", 4.0, 1, 0, 0, 0, 0},
    {"slapped",false,-1,"SWEET","ho_ass_slapped",4.0,0,0,0,0,0},
    {"slapass",false,-1,"SWEET","sweet_ass_slap",4.0,0,0,0,0,0},
    {"drunk",false,-1,"PED","WALK_DRUNK",4.1,1,1,1,1,1},
    {"skate",false,-1,"SKATE","skate_run",4.1,1,1,1,1,1},
    {"gwalk",false,-1,"PED","WALK_gang1",4.1,1,1,1,1,1},
    {"gwalk2",false,-1,"PED","WALK_gang2",4.1,1,1,1,1,1},
    {"limp",false,-1,"PED","WALK_old",4.1,1,1,1,1,1},
    {"eatsit",false,-1,"FOOD","FF_Sit_Loop", 4.0, 1, 0, 0, 0, 0},
    {"celebrate",false,-1,"benchpress","gym_bp_celebrate", 4.0, 1, 0, 0, 0, 0},
    {"win",false,-1,"CASINO","cards_win", 4.0, 1, 0, 0, 0, 0},
    {"win2",false,-1,"CASINO","Roulette_win", 4.0, 1, 0, 0, 0, 0},
    {"yes",false,-1,"CLOTHES","CLO_Buy", 4.0, 1, 0, 0, 0, 0},
    {"deal2",false,-1,"DEALER","DRUGS_BUY", 4.0, 1, 0, 0, 0, 0},
    {"thankyou",false,-1,"FOOD","SHP_Thank", 4.0, 1, 0, 0, 0, 0},
    {"invite1",false,-1,"GANGS","Invite_Yes",4.1,0,1,1,1,1},
    {"invite2",false,-1,"GANGS","Invite_No",4.1,0,1,1,1,1},
    {"celebrate2",false,-1,"GYMNASIUM","gym_tread_celebrate", 4.0, 1, 0, 0, 0, 0},
    {"sit",false,-1,"INT_OFFICE","OFF_Sit_Type_Loop", 4.0, 1, 0, 0, 0, 0},
    {"scratch",false,-1,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0},
	{"chat ",false,-1,"PED","IDLE_CHAT",4.1,1,1,1,1,1},
	{"fucku",false,-1,"PED","fucku",4.0,0,0,0,0,0},
	{"taichi",false,-1,"PARK","Tai_Chi_Loop", 4.0, 1, 0, 0, 0, 0},
	{"chairsit",false,-1,"BAR","dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0},
	{"relax",false,-1,"BEACH","Lay_Bac_Loop", 4.0, 1, 0, 0, 0, 0},
	{"bat1",false,-1,"BASEBALL","Bat_IDLE", 4.0, 1, 0, 0, 0, 0},
	{"bat2",false,-1,"BASEBALL","Bat_M", 4.0, 1, 0, 0, 0, 0},
	{"bat3",false,-1,"BASEBALL","BAT_PART", 4.0, 1, 0, 0, 0, 0},
	{"bat4",false,-1,"CRACK","Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0},
	{"bat5",false,-1,"CRACK","Bbalbat_Idle_02", 4.0, 1, 0, 0, 0, 0},
	{"nod",false,-1,"COP_AMBIENT","Coplook_nod",4.0,0,0,0,0,0},
	{"gang1",false,-1,"GANGS","hndshkaa",4.0,0,0,0,0,0},
	{"gang2",false,-1,"GANGS","hndshkba",4.0,0,0,0,0,0},
	{"gang3",false,-1,"GANGS","hndshkca",4.0,0,0,0,0,0},
	{"gang4",false,-1,"GANGS","hndshkcb",4.0,0,0,0,0,0},
	{"gang5",false,-1,"GANGS","hndshkda",4.0,0,0,0,0,0},
	{"gang6",false,-1,"GANGS","hndshkea",4.0,0,0,0,0,0},
	{"gang7",false,-1,"GANGS","hndshkfa",4.0,0,0,0,0,0},
	{"cry1",false,-1,"GRAVEYARD","mrnF_loop", 4.0, 1, 0, 0, 0, 0},
	{"cry2",false,-1,"GRAVEYARD","mrnM_loop", 4.0, 1, 0, 0, 0, 0},
	{"bed1",false,-1,"INT_HOUSE","BED_In_L",4.1,0,1,1,1,1},
	{"bed2",false,-1,"INT_HOUSE","BED_In_R",4.1,0,1,1,1,1},
	{"bed3",false,-1,"INT_HOUSE","BED_Loop_L", 4.0, 1, 0, 0, 0, 0},
	{"bed4",false,-1,"INT_HOUSE","BED_Loop_R", 4.0, 1, 0, 0, 0, 0},
	{"kiss2",false,-1,"BD_FIRE","Grlfrd_Kiss_03",4.0,0,0,0,0,0},
	{"kiss3",false,-1,"KISSING","Grlfrd_Kiss_01",4.0,0,0,0,0,0},
	{"kiss4",false,-1,"KISSING","Grlfrd_Kiss_02",4.0,0,0,0,0,0},
	{"kiss5",false,-1,"KISSING","Grlfrd_Kiss_03",4.0,0,0,0,0,0},
	{"kiss6",false,-1,"KISSING","Playa_Kiss_01",4.0,0,0,0,0,0},
	{"kiss7",false,-1,"KISSING","Playa_Kiss_02",4.0,0,0,0,0,0},
	{"kiss8",false,-1,"KISSING","Playa_Kiss_03",4.0,0,0,0,0,0},
	{"carsit",false,-1,"CAR","Tap_hand", 4.0, 1, 0, 0, 0, 0},
	{"carsit2",false,-1,"LOWRIDER","Sit_relaxed", 4.0, 1, 0, 0, 0, 0},
	{"fwalk",false,-1,"ped","WOMAN_walksexy",4.1,1,1,1,1,1},
	{"mwalk",false,-1,"ped","WALK_player",4.1,1,1,1,1,1},
	{"stretch",false,-1,"PLAYIDLES","stretch",4.0,0,0,0,0,0},
	{"chant",false,-1,"RIOT","RIOT_CHANT", 4.0, 1, 0, 0, 0, 0},
	{"angry",false,-1,"RIOT","RIOT_ANGRY",4.0,0,0,0,0,0},
	{"ghand1",false,-1,"GHANDS","gsign1LH",4.0,0,1,1,1,1},
	{"ghand2",false,-1,"GHANDS","gsign2LH",4.0,0,1,1,1,1},
	{"ghand3",false,-1,"GHANDS","gsign3LH",4.0,0,1,1,1,1},
	{"ghand4",false,-1,"GHANDS","gsign4LH",4.0,0,1,1,1,1},
	{"ghand5",false,-1,"GHANDS","gsign5LH",4.0,0,1,1,1,1},
	{"exhausted",false,-1,"FAT","IDLE_tired", 4.0, 1, 0, 0, 0, 0},
	{"carsmoke",false,-1,"PED","Smoke_in_car", 4.0, 1, 0, 0, 0, 0},
	{"aim",false,-1,"PED","gang_gunstand", 4.0, 1, 0, 0, 0, 0},
	{"getup",false,-1,"PED","getup",4.0,0,0,0,0,0},
	{"basket1",false,-1,"BSKTBALL","BBALL_def_loop", 4.0, 1, 0, 0, 0, 0},
	{"basket2",false,-1,"BSKTBALL","BBALL_idleloop", 4.0, 1, 0, 0, 0, 0},
	{"basket3",false,-1,"BSKTBALL","BBALL_pickup",4.0,0,0,0,0,0},
	{"basket4",false,-1,"BSKTBALL","BBALL_Jump_Shot",4.0,0,0,0,0,0},
	{"basket5",false,-1,"BSKTBALL","BBALL_Dnk",4.1,0,1,1,1,1},
	{"basket6",false,-1,"BSKTBALL","BBALL_run",4.1,1,1,1,1,1},
	{"akick",false,-1,"FIGHT_E","FightKick",4.0,0,0,0,0,0},
	{"box",false,-1,"GYMNASIUM","gym_shadowbox",4.1,1,1,1,1,1},
	{"cockgun",false,-1,"SILENCED", "Silence_reload", 3.0, 0, 0, 0, 0, 0},
	{"bar1",false,-1,"BAR", "Barcustom_get", 3.0, 0, 0, 0, 0, 0},
	{"bar2",false,-1,"BAR", "Barcustom_order", 3.0, 0, 0, 0, 0, 0},
	{"bar3",false,-1,"BAR", "Barserve_give", 3.0, 0, 0, 0, 0, 0},
	{"bar4",false,-1,"BAR", "Barserve_glass", 3.0, 0, 0, 0, 0, 0},
	{"liftup",false,-1,"CARRY", "liftup", 3.0, 0, 0, 0, 0, 0},
	{"putdown",false,-1,"CARRY", "putdwn", 3.0, 0, 0, 0, 0, 0},
	{"joint",false,-1,"GANGS","smkcig_prtl",4.0,0,1,1,1,1},
	{"die",false,-1,"KNIFE","KILL_Knife_Ped_Die",4.1,0,1,1,1,1},
	{"shakehead",false,-1,"MISC", "plyr_shkhead", 3.0, 0, 0, 0, 0, 0},
	{"die2",false,-1,"PARACHUTE", "FALL_skyDive_DIE", 4.0, 0, 1, 1, 1, -1},
	{"aim2",false,-1,"SHOP", "SHP_Gun_Aim", 4.0, 0, 1, 1, 1, -1},
	{"benddown",false,-1,"BAR", "Barserve_bottle", 4.0, 0, 0, 0, 0, 0},
	{"checkout",false,-1,"GRAFFITI", "graffiti_Chkout", 4.0, 0, 0, 0, 0, 0},
	{"getarrested",false,-1,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1},
	{"laugh",false,-1,"RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0},
	{"lookout",false,-1,"SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0},
	{"robman",false,-1,"SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0},
	{"crossarms",false,-1,"COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1},
	{"crossarms2",false,-1,"DEALER", "DEALER_IDLE", 4.0, 0, 1, 1, 1, -1}, 
	{"crossarms3",false,-1,"DEALER", "DEALER_IDLE_01", 4.0, 0, 1, 1, 1, -1},
	{"lay",false,-1,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0}, 
	{"vomit",false,-1,"FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0},
	{"eat",false,-1,"FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0},
	{"wave",false,-1,"ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0},
	{"deal",false,-1,"DEALER", "DEALER_DEAL", 3.0, 0, 0, 0, 0, 0},
	{"crack",false,-1,"CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0},
	{"smokem",false,-1,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0},
	{"smokef",false,-1,"SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0},
	{"msit",false,-1,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0},
	{"fsit",false,-1,"BEACH", "ParkSit_W_loop", 4.0, 1, 0, 0, 0, 0},
	{"crack2",false,-1,"CRACK", "crckidle2", 4.0, 1, 0, 0, 0, 0},
	{"lay2",false,-1,"BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0},
	{"bomb",false,-1,"BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0}
};
public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[100],idx;
	cmd = strtok(cmdtext,idx);
	if(!strcmp(cmdtext,"/animlist",true))
	{
		new szBigString[1120];
		strcat(szBigString,"{FF0000}Syntax: {00FF00}/Anim {FFFFFF}[AnimName]\n{4277FF}");
        strcat(szBigString,"handsup, dance[1-4], rap, rap2, rap3, wankoff, wank, strip[1-7], sexy[1-8], bj[1-4], cellin, cellout, lean, piss, follow\n");
        strcat(szBigString,"greet, injured, injured2, hitch, bitchslap, cpr, gsign1, gsign2, gsign3, gsign4, gsign5, gift, getup\n");
        strcat(szBigString,"chairsit, stand, slapped, slapass, drunk, gwalk, gwalk2, mwalk, fwalk, celebrate, celebrate2, win, win2\n");
        strcat(szBigString,"yes, deal, deal2, thankyou, invite1, invite2, sit, scratch, bomb, getarrested, laugh, lookout, robman\n");
        strcat(szBigString,"crossarms, crossarms2, crossarms3, lay, cover, vomit, eat, wave, crack, crack2, smokem, smokef, msit, fsit\n");
        strcat(szBigString,"chat, fucku, taichi, chairsit, relax, bat1, bat2, bat3, bat4, bat5, nod, cry1, cry2, chant, carsmoke, aim\n");
       	strcat(szBigString,"gang1, gang2, gang3, gang4, gang5, gang6, gang7, bed1, bed2, bed3, bed4, carsit, carsit2, stretch, angry\n");
        strcat(szBigString,"kiss2, kiss3, kiss4, kiss5, kiss6, kiss7, kiss8, exhausted, ghand1, ghand2, ghand3, ghand4, ghand5\n");
        strcat(szBigString,"basket1, basket2, basket3, basket4, basket5, basket6, akick, box, cockgun\n");
        strcat(szBigString,"bar1, bar2, bar3, bar4, lay2, liftup, putdown, die, joint, die2, aim2\n");
        strcat(szBigString,"benddown, checkout");
        ShowPlayerDialog(playerid, random(2000)+1584, DIALOG_STYLE_MSGBOX, "{B0F000}__.:AnimList:.__",szBigString, "Close", "");
	    return 1;
	}
	if(!strcmp(cmd,"/anim",true))
	{
		cmd = strtok(cmdtext,idx);
		if(!strlen(cmd))return SendClientMessage(playerid,-1,"Syntax: /Anim [AnimName]");
		new bool:fl = false;
		for(new i,j=sizeof(AnimInfo); i<j; i++)
		{
			if(!strcmp(cmd,AnimInfo[i][AnimCommand],true))
			{
			    if(AnimInfo[i][AminIsSpecial])
			    {
			        fl = true;
			        SetPlayerSpecialAction(playerid,AnimInfo[i][AnimSpecialID]);
			        return 1;
			    } else {
			        fl = true;
			        ApplyAnimation(playerid,AnimInfo[i][Animlib],AnimInfo[i][Animname],AnimInfo[i][AnimfDelta],AnimInfo[i][Animloop],AnimInfo[i][Animlockx],AnimInfo[i][Animlocky],AnimInfo[i][Animfreeze],AnimInfo[i][Animtime]);
					return 1;
				}
			}
		}
		if(!fl)return SendClientMessage(playerid,0xFF0000AA,"Can't find anim!");
		return 1;
	}
    return 0;
}
stock strtok(const source[],&index)
{
    new variableStart;
    while (source[index] && source[index] <= 0x20) index ++;
    variableStart = index;
    while (source[index] && source[index] > 0x20) index ++;
    new szResult[20];
    memcpy(szResult, source[variableStart], 0, 4 * (index - variableStart), 20);
    return szResult;
}
