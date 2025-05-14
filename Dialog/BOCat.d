BEGIN BOCat

IF ~Global("BOCatUpset","Global",2)~ THEN BEGIN 4.1
   SAY ~Hssss!~ IF ~~ THEN EXIT
END


IF ~TRUE()~ BEGIN 0
   SAY ~Came here to laze by the hearth, <CHARNAME>?~
       +~NumTimesTalkedTo(0) CheckStatLT(Player1,8,INT) CheckStatLT(Player1,8,WIS)~+ ~A-a-ah! A talking cat! I'm going crazy!~ GOTO 7
       +~NumTimesTalkedTo(0)~+ ~How do you know my name, pretty kitty?~ GOTO 9
       + ~Global("BOFreeBoots","LOCALS",0) CheckStatGT(Player1,17,CHR)~ + ~Am I as pretty as you are, kitty?~ DO ~SetGlobal("BOFreeBoots","LOCALS",1)~ GOTO 1
       + ~Global("BOFreeBoots","LOCALS",0) CheckStatLT(Player1,18,CHR)~ + ~Am I as pretty as you are, kitty?~ DO ~SetGlobal("BOFreeBoots","LOCALS",1)~ GOTO 2
       ++ ~You have some nice boots over there. I want to buy them. How much?~ GOTO 4
       ++ ~No. I should go.~ EXIT
END

IF ~~ THEN BEGIN 1
   SAY ~Yeah, you kinda are. Take those. Free sample.~
   ++ ~Thanks, kitty.~ DO ~GiveItemCreate("BOBOOT01",LastTalkedToBy,0,0,0)~ EXIT
END

IF ~~ THEN BEGIN 2
   SAY ~No.~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4
   SAY ~Three hundred coins. Or pearls. Pearls will do.~
   +~PartyGoldGT(299)~+ ~Fine. Here's your gold.~ GOTO 6
   +~PartyHasItem("MISC36")~+ ~Fine. Here's your pearl.~ GOTO 6.1
   +~Global("BOCatInPearls","Global",0) PartyHasItem("AMUL11")~+ ~Will pearl necklace do?~ GOTO 6.2
   ++ ~No, this is way too much. Besides, what are you even going to do with them? Hold it in your paws? Store it in your fur? Trade it for some milk?~ DO ~SetGlobal("BOCatUpset","Global",2)~ GOTO 8
   ++ ~I guess I'll go and find some.~ EXIT
   ++ ~No, not now.~ EXIT
END

IF ~~ THEN BEGIN 6
   SAY ~You got yourself a deal.~
   ++ ~Great.~ DO ~GiveItemCreate("BOBOOT01",LastTalkedToBy,0,0,0) TakePartyGold(300) DestroyGold(300)~ EXIT
END

IF ~~ THEN BEGIN 6.1
   SAY ~You got yourself a deal.~
   ++ ~Great.~ DO ~GiveItemCreate("BOBOOT01",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC36",1) DestroyItem("MISC36")~ EXIT
END

IF ~~ THEN BEGIN 6.2
   SAY ~Fine. But just this once.~
   ++ ~Great.~ DO ~SetGlobal("BOCatInPearls","Global",1) GiveItemCreate("BOBOOT01",LastTalkedToBy,0,0,0) TakePartyItemNum("AMUL11",1) DestroyItem("AMUL11")~ EXIT
END

IF ~~ THEN BEGIN 7
   SAY ~I'm a familiar, you dumbass!~
   =~So much for being raised by one of the greatest mages...~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8
   SAY ~Hssss!~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 9
   SAY ~This place is full of books, not people.~
   ++ ~I guess that's true.~ GOTO 0
   ++ ~If you say so. I should go.~ EXIT
END