DECLARE FUNCTION GetProductIndex! (itemName AS STRING)
DECLARE SUB PrintItems ()
DECLARE FUNCTION GetPrice! (itemName AS STRING)
DECLARE FUNCTION PriceWithTax! (price AS DOUBLE)
DECLARE SUB Main ()

DIM SHARED items(5) AS STRING
DIM SHARED prices(5) AS DOUBLE
DIM SHARED purchases(5) AS INTEGER

REM "Items and their prices"
items(1) = "apple"
prices(1) = 3.49

items(2) = "orange"
prices(2) = 4.23

items(3) = "lemon"
prices(3) = 3.5

items(4) = "chicken"
prices(4) = 10.99

items(5) = "cake"
prices(5) = 20.87

REM "Main program execution"
CLS
CALL Main

FUNCTION GetPrice (itemName AS STRING)
        itemName = LCASE$(itemName)
        GetPrice = -1
        FOR i = 1 TO LEN(items) + 1
                IF items(i) = itemName THEN GetPrice = prices(i)
        NEXT i
END FUNCTION

FUNCTION GetProductIndex (itemName AS STRING)
        GetProductIndex = -1
        FOR i = 1 TO LEN(items) + 1
                IF items(i) = itemName THEN
                        GetProductIndex = i
                END IF
        NEXT i
END FUNCTION

SUB Main
        DIM priceNoTax AS DOUBLE
        DIM qty AS INTEGER
        DIM totalPrice AS DOUBLE
        DIM totalPriceNoTax AS DOUBLE
        
        totalPrice = 0!
        LET running = 1
        WHILE running
                CLS
                CALL PrintItems
                COLOR 7, 0
                PRINT "WHAT DO YOU WANT TO BUY?"
                INPUT item$

                qty = 1
                priceNoTax = GetPrice(item$)
                IF item$ = "" THEN
                        COLOR 4, 0
                        PRINT "Please enter a valid product name."
                ELSEIF priceNoTax = -1 THEN
                        COLOR 4, 0
                        PRINT "Sorry, we don't sell "; item$; "."
                ELSE
                        PRINT "How many "; item$; "s do you want to buy?"
                        INPUT qty
                        IF qty < 1 THEN qty = 1
                        totalPrice = totalPrice + PriceWithTax(priceNoTax) * qty
                        LET pIndex = GetProductIndex(item$)
                        purchases(pIndex) = qty
                END IF

                COLOR 7, 0
                PRINT "Is that everything? Y/N"
                INPUT isDone$
                isDone$ = LCASE$(isDone$)

                IF isDone$ = "y" THEN
                        CLS
                        FOR i = 1 TO LEN(purchases) + 1
                                IF purchases(i) <> 0 THEN
                                        LET pr = GetPrice(items(i)) * purchases(i)
                                        totalPriceNoTax = totalPriceNoTax + pr
                                        PRINT items(i); " x "; purchases(i); "    $"; pr
                                END IF
                        NEXT i

                        PRINT USING "TAX:   $#####.##"; totalPrice - totalPriceNoTax
                        PRINT
                        COLOR 10, 0
                        PRINT "Total Price:"
                        PRINT USING "$#########,.##"; totalPrice
                        running = 0
                END IF
        WEND
END SUB

FUNCTION PriceWithTax (price AS DOUBLE)
        PriceWithTax = price * 1.15
END FUNCTION

SUB PrintItems
        COLOR 3, 0
        PRINT "Products:"
        FOR i = 1 TO LEN(items) + 1
                PRINT USING "&     $#####.##"; items(i); prices(i)
        NEXT i
        PRINT
        COLOR 7, 0
END SUB

