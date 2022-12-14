DECLARE FUNCTION RunQuiz! ()
DECLARE SUB PrintTitle ()
DECLARE SUB Main ()

DIM SHARED QUESTIONCOUNT AS INTEGER
QUESTIONCOUNT = 5

DIM SHARED questions(QUESTIONCOUNT) AS STRING
DIM SHARED answers(QUESTIONCOUNT) AS STRING
questions(1) = "Write 'Hello!' to the screen."
answers(1) = "PRINT " + CHR$(34) + "Hello!" + CHR$(34)

questions(2) = "Read a value into a string called 'str$'"
answers(2) = "INPUT str$"

questions(3) = "Make a program jump to line 87"
answers(3) = "GOTO 87"

questions(4) = "IF x = 4, what does this code output? IF x < 7 THEN PRINT 1 ELSE PRINT 2"
answers(4) = "1"

questions(5) = "Add a comment that says 'I know BASIC'"
answers(5) = "REM " + CHR$(34) + "I know BASIC" + CHR$(34)

CALL Main
END

SUB Main
	LET quit = 0
	WHILE quit <> 1
	CLS
	LET correct = RunQuiz
	PRINT "YOU SCORED: "; correct; "/"; QUESTIONCOUNT
	PRINT "Would you like to play again? [Y/N]"
	INPUT playAgain$
	IF LCASE$(playAgain$) <> "y" THEN
	    quit = 1
	END IF
    WEND
END SUB

SUB PrintTitle
    COLOR 0, 15
    PRINT "==== BASIC Quiz ===="
    COLOR 7, 0
    PRINT
END SUB

FUNCTION RunQuiz
	LET correct = 0
	FOR i = 1 TO QUESTIONCOUNT
		 CALL PrintTitle
		 PRINT questions(i)
		 INPUT res$
		 IF res$ = "" THEN
			i = i - 1
		 ELSEIF res$ = answers(i) THEN
			COLOR 10, 0
			PRINT "Correct!"
			correct = correct + 1
		 ELSE
			COLOR 4, 0
			PRINT "Incorrect!"
		 END IF
		 COLOR 7, 0
		 SLEEP 1
		 CLS
	 NEXT i
	 RunQuiz = correct
END FUNCTION

