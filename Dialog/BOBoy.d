BEGIN BOBoy



IF ~NumTimesTalkedTo(0)~ BEGIN 0
   SAY ~Greetings! You look like adverturing sort, so maybe you will be interseted in my services - I am capable of adding additional enchantmets to magical boots. For now I specialize in making any of them faster, but for additional fee and some gems I may try to do fast ones more interesting. Take this note, please.~
   IF ~~ DO ~GiveItemCreate("BOMISC01",LastTalkedToBy,0,0,0)~ GOTO 21
END



IF ~TRUE()~ BEGIN 20
   SAY ~Good day to you!~
   IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21
   SAY ~Do you want some kind of enchanted boots from me?~
       +~PartyHasItem("BOOT05")~+ ~I want faster Talos's Gift.~ GOTO 22
       +~PartyHasItem("BOOT03")~+ ~I want faster boots made from The Frost's Embrace.~ GOTO 23
       +~PartyHasItem("BOOT04")~+ ~I want faster Senses of the Cat.~ GOTO 24
       +~PartyHasItem("BOOT02")~+ ~I want faster Worn Whispers.~ GOTO 25
       +~PartyHasItem("boot02zh")~+ ~I want faster Worn Whispers.~ GOTO 25.1
       +~PartyHasItem("BOOT01") PartyHasItem("MISC45")~+ ~I have boots of speed and this rare stone - give me stylish boots.~ GOTO 26
       +~PartyHasItem("BOOT01") NumItemsPartyGT("MISC18",23)~+ ~I have boots of speed and bunch of sunstones - give me something better in return.~ GOTO 27
       +~NumTimesTalkedToGT(1) Global("Ask1","LOCALS",0)~+ ~I may not be an expert in the art of enchantment, but I do wonder how two dozen sunstones can be used to make a pair of boots.~ DO ~SetGlobal("Ask1","LOCALS",1)~ GOTO 28
       ++ ~Not now. I should go.~ EXIT
END

IF ~~ THEN BEGIN 22
   SAY ~Fifteen thousand gold.~
   +~PartyGoldGT(14999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT03",LastTalkedToBy,0,0,0) TakePartyItemNum("BOOT05",1) DestroyItem("BOOT05") TakePartyGold(15000) DestroyGold(15000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 23
   SAY ~Fifteen thousand gold.~
   +~PartyGoldGT(14999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT04",LastTalkedToBy,0,0,0) TakePartyItemNum("BOOT03",1) DestroyItem("BOOT03") TakePartyGold(15000) DestroyGold(15000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 24
   SAY ~Fifteen thousand gold.~
   +~PartyGoldGT(14999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT05",LastTalkedToBy,0,0,0) TakePartyItemNum("BOOT04",1) DestroyItem("BOOT04") TakePartyGold(15000) DestroyGold(15000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 25
   SAY ~Fifteen thousand gold.~
   +~PartyGoldGT(14999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT06",LastTalkedToBy,0,0,0) TakePartyItemNum("BOOT02",1) DestroyItem("BOOT02") TakePartyGold(15000) DestroyGold(15000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 25.1
   SAY ~Fifteen thousand gold.~
   +~PartyGoldGT(14999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT06",LastTalkedToBy,0,0,0) TakePartyItemNum("boot02zh",1) DestroyItem("boot02zh") TakePartyGold(15000) DestroyGold(15000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 26
   SAY ~Fifty thousand gold.~
   +~PartyGoldGT(49999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT07",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC45",1) DestroyItem("MISC45") TakePartyItemNum("BOOT01",1) DestroyItem("BOOT01") TakePartyGold(50000) DestroyGold(50000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 27
   SAY ~Twenty five thousand gold.~
   +~PartyGoldGT(24999)~+ ~Thanks.~ DO ~GiveItemCreate("BOBOOT08",LastTalkedToBy,0,0,0) TakePartyItemNum("MISC18",24) DestroyItem("MISC18") TakePartyItemNum("BOOT01",1) DestroyItem("BOOT01") TakePartyGold(25000) DestroyGold(25000)~ EXIT
   ++ ~No. Some time later. Right now I should go.~ EXIT
END

IF ~~ THEN BEGIN 28
   SAY ~Well. I... don't? I don't actually use them for boots, they are used only for decorating books downstairs as far as I know. Maybe for something else.~
   =~Everything I'm paid goes straight in my Order coffins, gold and gems alike.~
   IF ~~ THEN GOTO 21
END