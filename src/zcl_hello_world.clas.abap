CLASS zcl_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS run.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.
  METHOD run.
    WRITE '@KERNEL const http = await import("@dirigible/http");'.
    WRITE '@KERNEL http.response.println("hello world");'.
  ENDMETHOD.
ENDCLASS.