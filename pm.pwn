
#include <a_samp>
#include <sscanf2>
#include <zcmd>

#define FILTERSCRIPT
#define Version 1
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_RED 0xFF0000FF
#define COLOR_GREEN 0x00FF00FF

//=============================== Main =====================
main() 
{
	print("PM sistemi yukleniyor.");
}
//=============================== OnFilterScriptInit ==========================
public OnFilterScriptInit()
{
	printf("Running PM Script by Wixa Versoin %d", Version);
	return 1;
}
//============================== OnFilterScriptExit ===========================
public OnFilterScriptExit()
{
	printf("PM Script By Wixa Version %d Unloded.", Version);
	return 1;
}

CMD:pm(playerid, params[])
{
	new PmPlayer, Message[124], String[124], PlayerName[MAX_PLAYER_NAME], PlayerName2[MAX_PLAYER_NAME], PmSent[50];
	if (sscanf(params, "us[140]", PmPlayer, Message)) return SendClientMessage(playerid, COLOR_WHITE, "Kullanim: /pm [Oyuncu İD] [Mesaj]");
	if (!IsPlayerConnected(PmPlayer)) return SendClientMessage(playerid, COLOR_RED, "Hata: Oyuncu Bulunamadi");
	if (strlen(Message) < 1) return SendClientMessage(playerid, COLOR_RED, "Hata: 1'den fazla harf yazman z gerekiyor.");
	else{

		GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
		GetPlayerName(PmPlayer, PlayerName2, sizeof(PlayerName2));
		format(PmSent, sizeof(PmSent), "~PM Gonderdi %s", PlayerName2);
		SendClientMessage(playerid, COLOR_GREEN, PmSent);
		format(String, sizeof(String), "~ [PM] %s: %s",PlayerName, Message);
		SendClientMessage(PmPlayer, COLOR_YELLOW, String);
		GameTextForPlayer(PmPlayer, "~n~~n~~n~~n~~n~~n~~n~~n~~y~Yeni mesaj", 3000, 3);
		printf("%s to %s, %s", PlayerName, PlayerName2, Message);
	}
	return 1;
}


