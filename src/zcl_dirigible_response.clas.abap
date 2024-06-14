CLASS zcl_dirigible_response DEFINITION PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS println
      IMPORTING
        message_in     TYPE any.
ENDCLASS.

CLASS zcl_dirigible_response IMPLEMENTATION.
  METHOD println.
    WRITE '@KERNEL const http = await import("sdk/http");'.
    WRITE '@KERNEL const valueString = JSON.stringify(message_in.value)'.
    WRITE '@KERNEL http.response.println(valueString);'.
  ENDMETHOD.

ENDCLASS.