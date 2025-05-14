APPEND Gorion

       IF ~~ THEN BEGIN BOGorion
          SAY ~Take one of mine's. They may be old but still can make you walk faster.~
          IF ~~ THEN DO ~GiveItemCreate("BOBOOT02",LastTalkedToBy,0,0,0) SetGlobal("BOBOOT02given","Global",2)~ EXIT
       END

END


EXTEND_BOTTOM GORION 0
       +~!Global("BOBOOT02given","Global",2)~+ ~I want some good boots for our travels but Winthrop doesn't have any. Maybe you know where I can find a sturdy pair?~ GOTO BOGorion
END