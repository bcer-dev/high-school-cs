DECLARE SUB MAIN ()
CALL MAIN

SUB MAIN
        LET RUNNING = 1
        WHILE RUNNING
                CLS
                PRINT "ENTER AN OPERATOR: '+', '-', '*', '/'"
                INPUT OP$

                PRINT "ENTER NUMBER 1: "
                INPUT NUM1

                PRINT "ENTER NUMBER 2: "
                INPUT NUM2

                DIM RESULT AS DOUBLE
                LET FAILED = 0
                IF OP$ = "+" THEN
                        RESULT = NUM1 + NUM2
                ELSEIF OP$ = "-" THEN
                        RESULT = NUM1 - NUM2
                ELSEIF OP$ = "*" THEN
                        RESULT = NUM1 * NUM2
                ELSEIF OP$ = "/" THEN
                        IF NUM2 <> 0 THEN
                                RESULT = NUM1 / NUM2
                        ELSE
                                PRINT "CAN'T DIVIDE BY 0"
                                FAILED = 1
                        END IF
                ELSE
                        PRINT "INVALID OPERATOR"
                        FAILED = 1
                END IF

                IF FAILED = 0 THEN
                        PRINT NUM1; OP$; NUM2; " = "; RESULT
                END IF

                PRINT "ANY MORE CALCULATIONS? Y/N"
                INPUT MORE$
                MORE$ = LCASE$(MORE$)
                IF MORE$ <> "y" THEN RUNNING = 0
        WEND
END SUB

