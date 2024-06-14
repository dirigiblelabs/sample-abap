CLASS zcl_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS run.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD run.
    DATA: lv_result TYPE string.

    " Print 'Hello world!'
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Hello world!' ).

    " Print 'Selecting all employees...'
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Selecting all employees...' ).

    " Call select_all method
    lv_result = zcl_dirigible_employee_dao=>select_all( ).

    " Print 'Employees selected.'
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employees selected.' ).

    " Print Employee Data
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = lv_result ).

  ENDMETHOD.

ENDCLASS.
