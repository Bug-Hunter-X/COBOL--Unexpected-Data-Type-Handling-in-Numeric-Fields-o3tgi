To prevent this issue, add input validation and error handling.  Verify the data type before performing any operations on a field.

01 WS-CUSTOMER-ID PIC 9(5).
01 WS-CUSTOMER-NAME PIC X(20).
01 WS-INPUT-ID PIC X(5). 
01 WS-ERROR-FLAG PIC 9.

PROCEDURE DIVISION.

    DISPLAY "Enter customer ID: ".
    ACCEPT WS-INPUT-ID.

    IF WS-INPUT-ID NUMERIC
        MOVE WS-INPUT-ID TO WS-CUSTOMER-ID
        IF WS-CUSTOMER-ID = 12345
            MOVE "John Doe" TO WS-CUSTOMER-NAME
        ELSE
            MOVE "Unknown" TO WS-CUSTOMER-NAME
        END-IF
    ELSE
        MOVE 1 TO WS-ERROR-FLAG
        DISPLAY "Invalid customer ID. Please enter a numeric value."
    END-IF.

    IF WS-ERROR-FLAG = 0
        DISPLAY "Customer Name: " WS-CUSTOMER-NAME
    END-IF.
    STOP RUN.