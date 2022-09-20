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
        DIM priceNoTax AS DOUBLE
        DIM qty AS INTEGER
        DIM totalPrice AS DOUBLE
        
        totalPrice = 0!
        LET running = 1
        WHILE running
                CLS
                COLOR 7, 0
                PRINT "WHAT DO YOU WANT TO BUY?"
                INPUT item$

                qty = 1
                priceNoTax = GetPrice(item$)
                IF priceNoTax = -1 THEN
                        COLOR 4, 0
                        PRINT "Sorry, we don't sell "; item$; "."
                ELSE
                        PRINT "How many "; item$; "s do you want to buy?"
                        INPUT qty
                        IF qty < 1 THEN qty = 1
                        totalPrice = totalPrice + PriceWithTax(priceNoTax) * qty
                END IF

                COLOR 7, 0
                PRINT "Is that everything? Y/N"
                INPUT isDone$
                isDone$ = LCASE$(isDone$)

                IF isDone$ = "y" THEN
                        CLS
                        PRINT "Total Price: $"; totalPrice
                        running = 0
                END IF
        WEND
END SUB

FUNCTION PriceWithTax (price AS DOUBLE)
        PriceWithTax = price * 1.15
END FUNCTION

