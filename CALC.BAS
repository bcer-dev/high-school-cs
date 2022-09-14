DECLARE SUB MAIN ()
CALL MAIN

SUB MAIN
        LET RUNNING = 1
        WHILE RUNNING
                CLS

                PRINT "ENTER AN OPERATOR: '+', '-', '*', '/'"
                INPUT OP$

                PRINT "ANY MORE CALCULATIONS? Y/N"
                INPUT MORE$
                MORE$ = LCASE$(MORE$)
                IF MORE$ <> "y" THEN RUNNING = 0
        WEND
END SUB

