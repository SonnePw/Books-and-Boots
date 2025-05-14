BEGIN BOKitty

IF ~NumTimesTalkedTo(0) Global("BOCatInPearls","Global",1)~ THEN BEGIN 0.1
   SAY ~(You looking at the cat sitting haughtily with a pearl necklace around his neck)~ IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0) Global("BOCatUpset","Global",2)~ THEN BEGIN 0.2
   SAY ~You. Again. I hope this time around you brought better manners with you.~ IF ~~ GOTO 0.3
END


IF ~Global("BOKittyAd","LOCALS",0)~ THEN BEGIN 0.3
   SAY ~I'll give you healing potions for pearls.~ IF ~~ DO ~SetGlobal("BOKittyAd","LOCALS",1)~ GOTO 0
END


IF ~TRUE()~ BEGIN 0
   SAY ~Do you have something for me?~
       +~RandomNum(2,1) PartyHasItem("MISC36")~+ ~Here's one pearl.~ GOTO 1.1
       +~RandomNum(2,2) PartyHasItem("MISC36")~+ ~Here's one pearl.~ GOTO 1.2
       +~PartyHasItem("MISC36")~+ ~I want to trade a pearl for a pair of boots you have lying around here.~ GOTO 1.3
       + ~Global("BOCatStalk","GLOBAL",0) CheckStatGT(Player1,13,WIS) CheckStatLT(Player1,11,CHR)~ + ~Are you stalking this man? He looks troubled enough already, why rattle him even more?~ DO ~SetGlobal("BOCatStalk","GLOBAL",1)~ GOTO 2.1
       + ~Global("BOCatStalk","GLOBAL",0) CheckStatGT(Player1,13,WIS) CheckStatLT(Player1,10,CHR)~ + ~Are you stalking this man? He looks troubled enough already, why rattle him even more?~ DO ~SetGlobal("BOCatStalk","GLOBAL",1)~ GOTO 2.2
       ++ ~No. I should go.~ EXIT
END

IF ~~ THEN BEGIN 1.1
   SAY ~Good. Take this.~
   ++ ~Thanks, kitty.~ DO ~GiveItemCreate("POTN52",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC36",1) DestroyItem("MISC36")~ EXIT
END

IF ~~ THEN BEGIN 1.2
   SAY ~Good. Take this.~
   ++ ~Thanks, kitty.~ DO ~GiveItemCreate("POTN17",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC36",1) DestroyItem("MISC36")~ EXIT
END

IF ~~ THEN BEGIN 1.3
   SAY ~Deal.~
   ++ ~Great.~ DO ~GiveItemCreate("BOBOOT01",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC36",1) DestroyItem("MISC36")~ EXIT
END

IF ~~ THEN BEGIN 2.1
   SAY ~Just because I can, obviously. Do you want potions?~ IF ~~ GOTO 0
END

IF ~~ THEN BEGIN 2.2
   SAY ~He's troubled alright. I'm just glad the other one is asleep and I don't need to babysit him too. Damn crazy wizards.~ IF ~~ GOTO 0
END