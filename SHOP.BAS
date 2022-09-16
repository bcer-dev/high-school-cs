DECLARE FUNCTION GetPrice! (itemName AS STRING)
DECLARE FUNCTION PriceWithTax! (price AS DOUBLE)
DECLARE SUB Main ()
CLS
CALL Main

FUNCTION GetPrice (itemName AS STRING)
        itemName = LCASE$(itemName)

        IF itemName = "apple" THEN
                GetPrice = 2.99
        ELSEIF itemName = "lemon" THEN
                GetPrice = 3.75
        ELSEIF itemName = "orange" THEN
                GetPrice = 2.86
        ELSEIF itemName = "chicken" THEN
                GetPrice = 10.65
        ELSEIF itemName = "cake" THEN
                GetPrice = 20.01
        ELSE
                REM "If the item doesn't exist then return -1 as an error value"
                GetPrice = -1
        END IF
END FUNCTION

SUB Main
        LET running = 1
        WHILE running
                CLS
                PRINT "WHAT DO YOU WANT TO BUY?"
                INPUT item$

                LET priceNoTax = GetPrice(item$)
                IF priceNoTax = -1 THEN
                        PRINT "Sorry, we don't sell "; item$; "."
                END IF


                PRINT "Is that everything? Y/N"
                INPUT isDone$
                isDone$ = LCASE$(isDone$)

                IF isDone$ = "y" THEN
                        running = 0
                END IF
        WEND
END SUB

FUNCTION PriceWithTax (price AS DOUBLE)
        PriceWithTax = price * 1.15
END FUNCTION

