CLASS zcl_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS run.
  
  PRIVATE SECTION.
    DATA: lo_employee_dao TYPE REF TO zcl_dirigible_employee_dao.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD run.
    DATA: lv_result TYPE string.

    CREATE OBJECT lo_employee_dao.

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Hello world!' ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Selecting all employees...' ).

    lv_result = lo_employee_dao->select_all( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employees selected.' ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employee Data:'
        data_in    = lv_result ).
  ENDMETHOD.

ENDCLASS.
