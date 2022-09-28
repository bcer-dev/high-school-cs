DECLARE SUB Main ()
DECLARE FUNCTION GetWeightClass! (weight AS DOUBLE)
CALL Main
END

SUB Main
        DIM weight AS DOUBLE
        LET quit = 0
        WHILE quit <> 1
                CLS
                PRINT "Enter your weight: "
                INPUT weight
                IF weight <= 0! THEN
                        PRINT "Invalid Weight"
                ELSEIF weight <= 126 THEN
                        PRINT "Featherweight"
                ELSEIF weight <= 135 THEN
                        PRINT "Lightweight"
                ELSEIF weight <= 160 THEN
                        PRINT "Middleweight"
                ELSEIF weight <= 200 THEN
                        PRINT "Cruiserweight"
                ELSE
                        PRINT "Heavyweight"
                END IF
               

                PRINT "Done? [Y/N]"
                INPUT done$
                IF LCASE$(done$) = "y" THEN
                        quit = 1
                END IF
        WEND
END SUB

