CLASS zcl_abap_app DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS:
    run.

ENDCLASS.

CLASS zcl_abap_app IMPLEMENTATION.

  " this is the main method called by run.mjs
  METHOD run.
    zcl_employee_dao=>delete_all_employees( ).
    zcl_employee_dao=>select_all( ).
    zcl_employee_dao=>insert_employee( ).
    zcl_employee_dao=>select_all( ).
    zcl_employee_dao=>update_employee_last_name( ).
    zcl_employee_dao=>select_all( ).
  ENDMETHOD.

ENDCLASS.