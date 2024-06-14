CLASS zcl_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS run.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD run.
    DATA: lv_result TYPE string.

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Hello world!' ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Selecting all employees...' ).

    zcl_dirigible_employee_dao=>select_all( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employees selected.' ).

  ENDMETHOD.

ENDCLASS.
