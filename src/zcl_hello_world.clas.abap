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
        message_in = 'Deleting all employees...' ).

    zcl_dirigible_employee_dao=>delete_all_employees( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Inserting an employee...' ).

    zcl_dirigible_employee_dao=>insert_employee( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'An employee was inserted.' ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Selecting all employees...' ).

    zcl_dirigible_employee_dao=>select_all( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employees selected.' ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Updating employee last name' ).

    zcl_dirigible_employee_dao=>update_employee_last_name( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employee last name was updated' ).

  ENDMETHOD.

ENDCLASS.
