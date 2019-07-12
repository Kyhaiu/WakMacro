#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ScrollBarsConstants.au3>
#include <MsgBoxConstants.au3>
#include <GuiEdit.au3>
#include <File.au3>


#Region ### START Main GUI ###
Global $Form1 = GUICreate("WakMacro - By: Ihoru(Marcos)", 350, 270, 900, 300)
WinSetOnTop($Form1, "", 1)
Global $journal = GUICtrlCreateEdit("", 0, 0, 350, 200, BitOR($ES_AUTOVSCROLL,$ES_READONLY,$WS_VSCROLL))
GUICtrlSetData(-1, "")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetCursor (-1, 2)
$GUI_EVENT_START = GUICtrlCreateButton("Start", 25, 240, 150, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetBkColor(-1, 0x008080)
Opt("GUICoordMode", 2)
GUISetCoord(1153, 231)
GUISetState(@SW_SHOW)
#EndRegion ### END Main GUI ###

Func info($messageJournal)
   GUICtrlSetData($journal, GUICtrlRead($journal) & @CRLF & $messageJournal)
   $end = StringLen(GUICtrlRead($journal))
   _GUICtrlEdit_SetSel($journal, $end, $end)
   _GUICtrlEdit_Scroll($journal, $SB_SCROLLCARET)
EndFunc

Func debug($messageJournal, $autresInfos = "")
   $sleep = 500
   GUICtrlSetData($journal, GUICtrlRead($journal) & @CRLF & $messageJournal)
   $end = StringLen(GUICtrlRead($journal))
   _GUICtrlEdit_SetSel($journal, $end, $end)
   _GUICtrlEdit_Scroll($journal, $SB_SCROLLCARET)
EndFunc

Global $config 			= "config.ini"
Global $exitKey 		= IniRead($config, "settings" , "Exit_Key", "")
Global $pauseKey 		= IniRead($config, "settings" , "Pause_Key", "")
Global $width 			= IniRead($config, "settings" , "Area_Width", "")
Global $height 			= IniRead($config, "settings" , "Area_Height", "")
Global $harvest 		= IniRead($config, "settings" , "Harvest", "True")
Global $cut 			= IniRead($config, "settings" , "Cut", "True")
Global $replant 		= IniRead($config, "settings" , "Replant", "True")
Global $hkReplant 		= IniRead($config, "settings" , "Hot_Key_Replant", "")
Global $attemps 		= IniRead($config, "settings" , "Attemps", "1")
Global $tWalk			= IniRead($config, "settings", "Time_To_Walk", "400")
Global $tPlant			= IniRead($config, "settings", "Time_To_Plant", "3500")
Global $tHarvest		= IniRead($config, "settings", "Time_To_Harvest", "3500")
Global $tCut			= IniRead($config, "settings", "Time_To_Cut", "3700")
Global $tGrow			= IniRead($config, "settings", "Time_To_Grow", "210000")
Global $repeatProcess 	= IniRead($config, "settings" , "Repeat_Process", "1")

Global $launcher 		= "[TITLE:Updater Wakfu; CLASS:QWidget]"
Global $game 			= "[TITLE:WAKFU; CLASS:SunAwtFrame]"

HotKeySet ("{" & $exitKey & "}","ExitScript")
HotKeySet("{" & $pauseKey & "}", "WildCatApears")


Info("Bem vindo a WakMacro by: Ihoru(MARCOS)" & @CRLF)
Info("Botão Start para começar" & @CRLF)
Info("Aperte a tecla 'Pause Break' para quando o gatinho aparecer" & @CRLF)
Info("Aperte a tecla 'ESC' para sair/cancelar a macro" & @CRLF)

While 1
   $nMsg = GUIGetMsg()

   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
		 ExitScript()
	  Case $GUI_EVENT_START
		 GUICtrlSetData($GUI_EVENT_START, $exitKey & " = exit")
		 Requierements()
   EndSwitch
WEnd

Func Requierements()
   ConfigRead()
   $updater = false
   $gameWin = false
   if WinExists($launcher, "") Then
	  debug("Updater -> OK")
	  Sleep(1500)
	  $updater = True
   Else
	  debug("ERRO: Launcher/Game não encontrado")
	  Sleep(2000)
	  MsgBox(0, "ERROR", "Por favor, deixe o Launcher aberto, e então reinicie o script.")
	  ExitScript()
   EndIf
   if WinExists ($game, "") Then
	  debug("WAKFU -> OK")
	  $gameWin = True
	  Sleep(1500)
	  $updater = True
   Else
	  debug("ERRO: Launcher/Game não encontrado")
	  Sleep(2000)
	  MsgBox(0, "ERROR", "Por favor, inicie o jogo corretamente, e então reinicie o script. Lembrado de deixar o Laucher aberto")
	  ExitScript()
   EndIf
   if ($gameWin And $updater = true) and ($replant or $cut or $harvest == "True") Then
	  info("")
	  debug("INICIANDO A MACRO")
	  Start(1)
   Else
	  MsgBox(0, "ERROR", "COMPRA UMAS GALINHA PRETA UMAS CANINHA E CHAMA UM PAI DE SANTO PRA RESOLVER ESSE ERRO MEU FILHO")
	  Exit
   EndIf
EndFunc

Func ConfigRead()
   $hFileOpen = FileOpen($config)
	If $hFileOpen = -1 Then
		$create = FileOpen($config, 1)
		If $create = -1 Then
			MsgBox(0,"ERRO","Não foi possivel recriar o arquivo config.ini Mas você pode baixalo em: ")
			ExitScript()
		Else
			MsgBox(0,"SUCESSO", $config & " Foi criado com sucesso, por favor verifique se as configurações estão corretas e reinicie a macro")
			WriteDefaultConfig()
			Exit
		EndIf
	EndIf
 EndFunc

Func WriteDefaultConfig()
	FileWrite($config, "[settings]" & @CRLF & "Exit_Key=ESC" & @CRLF & "Pause_Key=PAUSE" & @CRLF & "Area_Width=4" & @CRLF & "Area_Height=4" & @CRLF & "Harvest=True" & @CRLF & "Cut=True" & @CRLF & "Replant=True" & @CRLF & "Hot_Key_Replant=7" & @CRLF & "Attemps=10" & @CRLF & "Time_To_Walk=400" & @CRLF & "Time_To_Plant=3500" & @CRLF & "Time_To_Harvets=3500" & @CRLF & "Time_To_Cut=3700" & @CRLF & "Repeat_Process=1")
EndFunc

Func Start($cont)
   if $cont = 1 Then
	  MsgBox(0, "AVISO", "POSICIONE O SEU PERSONAGEM NA POSIÇÃO INICIAL E APERTE OK!")
	  MouseClick("left", 10, 10,1)
   EndIf
   if ($replant == "True") and ($harvest and $cut == "False") Then
	  Replant()
	  MsgBox(0, "ALERTA", "Não se esqueça de cortar as plantas existentes, antes de replanta-las!! E Leia o console da macro")
	  info("Finalizando a Macro!! caso deseje coletar as sementes ou cortar os recursos, por favor ajuste o arquivo config.ini")
	  info("Não se esqueça de mudar a setting : 'Replant' para 'False'")
	  sleep(8000)
	  ExitScript()
   EndIf
   if $harvest == "True" Then
	  Harvest()
   EndIf
   if $cut == "True" Then
	  Cut()
   EndIf
   info("Macro terminou " & $cont & " execuçõe(s) com sucesso!"& @CRLF)
   sleep(1500)
   if $repeatProcess = 1 Then
	  ExitScript()
   EndIf
   info(@CRLF)
   info(@CRLF)
   info(@CRLF)
   info("REINICIANDO O PROCESSO")
   Sleep(2000)
   Mov($height, "s")
   if $cont <= $repeatProcess Then
	  $cont = $cont + 1
	  start($cont)
   EndIf
   ExitScript()
EndFunc

Func Replant()
   debug("MAOS A OBRA" & @CRLF)
   for $i = 1 To $height Step +1
	  info("Começando a plantação da linha: " & $i & @CRLF)
	  PlantLine(720,366)
   Next
EndFunc

Func Harvest()
   debug("MAOS A OBRA" & @CRLF)
   for $i = 1 To $height Step +1
	  info("Começando a colheita da linha: " & $i & @CRLF)
	  PickLine(720,366)
   Next
EndFunc

Func Cut()
   if $harvest = "True" Then
	  Mov($height, "s")
   EndIf
   debug("MAOS A OBRA" & @CRLF)
   for $i = 1 To $height Step +1
	  info("Começando a recolher os recursos da linha: " & $i & @CRLF)
	  CutLine(720,366)
   Next
EndFunc

Func PlantLine($x, $y)
   debug("MAOS A OBRA" & @CRLF)
   Sleep(1500)
	for $j = 1 To $width Step +1
	  Send("{" & $hkReplant & "}")
	  for $k = 1 To $attemps Step +1
		 MouseClick("left", $x, $y, 1)
		 debug($k & "° tentativa")
		 Sleep($tPlant)
	  Next
	  Send("{" & $hkReplant & "}")
	  debug("Indo para a próxima área")
	  Sleep(100)
	  Mov(1, "o")
   Next
   Mov(1, "n")
   Mov($width-1, "l")
EndFunc

Func PickLine($x, $y)
   for $j = 1 To $width Step +1
	  MouseClick("right", $x, $y, 1)
	  Sleep(200)
	  MouseClick("right", 684, 327, 1)
	  Sleep($tHarvest)
	  Mov(1, "o")
   Next
   Mov(1, "n")
   Mov($width-1, "l")
EndFunc

Func CutLine($x, $y)
   for $j = 1 To $width Step +1
	  MouseClick("right", $x, $y, 1)
	  Sleep(200)
	  MouseClick("right", 762, 322, 1)
	  Sleep($tCut)
	  Mov(1, "o")
   Next
   Mov(1, "n")
   Mov($width-1, "l")
EndFunc

Func Mov($unit, $coord)
   if $coord == "n" Then
	  for $i = 0 To $unit-1 Step +1
		 MouseClick("left", 720, 366, 1)
		 Sleep($tWalk)
	  Next
   ElseIf $coord == "s" Then
	  for $i = 0 To $unit-1 Step +1
		 MouseClick("left", 639, 413, 1)
		 Sleep($tWalk)
	  Next
   ElseIf $coord == "l" Then
	  for $i = 0 To $unit-1 Step +1
		 MouseClick("left", 723, 416, 1)
		 Sleep($tWalk)
	  Next
   ElseIf $coord == "o" Then
	  for $i = 0 To $unit-1 Step +1
		 MouseClick("left", 639, 369, 1)
		 Sleep($tWalk)
	  Next
   EndIf
EndFunc

Func WildCatApears()
   MsgBox(0, "AVISO", "APERTE OK QUANDO ACABAR A BATALHA")
   Sleep(1500)
   info("Por favor reinicie a macro pois o gatinho veio e você ficou tão distraido com sua fofura que você esqueceu o que estava fazendo" & @CRLF)
   Sleep(2000)
   info("Uma dica!! Mude no arquivo config.ini a largura e altura, para assim começar de onde você tinha parado." & @CRLF)
   MsgBox(0, "AVISO", "PORFAVOR REINICIE A MACRO")
   Exit
EndFunc

Func ExitScript()
   info(@CRLF & "Até a proxima :p")
   Sleep(2000)
   Exit
EndFunc
