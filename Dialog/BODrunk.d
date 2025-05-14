BEGIN BODrunk

IF ~Global("BOCONNotPassed","Global",2)~ THEN BEGIN 6
   SAY ~Scram.~ IF ~~ THEN EXIT
END

IF ~Global("BOCONPassed","Global",2)~ THEN BEGIN 7
   SAY ~Leave me to my sorrows, kid.~ IF ~~ THEN EXIT
END

IF ~TRUE()~ BEGIN 0
   SAY ~What are you staring at? Either drink with me or get lost.~
       + ~CheckStatGT(Player1,11,CON)~ + ~I'll have a drink.~ GOTO 1
       + ~CheckStatLT(Player1,12,CON)~ + ~I'll have a drink.~ GOTO 2
       ++ ~My apologies, I didn't mean to disturb you.~ EXIT
END

IF ~~ THEN BEGIN 1
   SAY ~Cheers.~
   =~Another one.~
             + ~CheckStatGT(Player1,13,CON)~ + ~Sure.~ GOTO 3
             + ~CheckStatLT(Player1,14,CON)~ + ~Sure.~ GOTO 2
             ++ ~I've had enough.~ EXIT
END

IF ~~ THEN BEGIN 2
   SAY ~Looks like you are not gonna survive another one. Scram, kid.~
   ++ ~Whatever.~ DO ~SetGlobal("BOCONNotPassed","Global",2)~ EXIT
END

IF ~~ THEN BEGIN 3
   SAY ~Keep them coming.~
       + ~CheckStatGT(Player1,15,CON)~ + ~Sure.~ GOTO 4
       + ~CheckStatLT(Player1,16,CON)~ + ~Sure.~ GOTO 2
       ++ ~I've had enough.~ EXIT
END

IF ~~ THEN BEGIN 4
   SAY ~Another.~
       + ~CheckStatGT(Player1,17,CON)~ + ~Sure.~ GOTO 5
       + ~CheckStatLT(Player1,18,CON)~ + ~Sure.~ GOTO 2
       ++ ~I've had enough.~ EXIT
END

IF ~~ THEN BEGIN 5
   SAY ~That's enough for you.~
   =~Take this. And think twice before drinking so much or the stuff will ruin ya.~
   ++ ~Thanks.~ DO ~GiveItemCreate("BOAMUL01",LastTalkedToBy,0,0,0) SetGlobal("BOCONPassed","Global",2)~ EXIT
END