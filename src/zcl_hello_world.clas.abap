CLASS zcl_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS:
      run,
      print_hello_world,
      delete_all_employees,
      insert_employee,
      select_all_employees,
      update_employee_last_name.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.


  METHOD run.
    print_hello_world( ).

    delete_all_employees( ).
    select_all_employees( ).

    insert_employee( ).
    select_all_employees( ).

    update_employee_last_name( ).
    select_all_employees( ).

    delete_all_employees( ).
    select_all_employees( ).
  ENDMETHOD.

  METHOD print_hello_world.
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Hello world!' ).
  ENDMETHOD.

  METHOD delete_all_employees.
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Deleting all employees...' ).

    zcl_dirigible_employee_dao=>delete_all_employees( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'All employees were deleted.' ).
  ENDMETHOD.

  METHOD insert_employee.
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Inserting an employee...' ).

    zcl_dirigible_employee_dao=>insert_employee( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'An employee was inserted.' ).
  ENDMETHOD.

  METHOD select_all_employees.
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Selecting all employees...' ).

    zcl_dirigible_employee_dao=>select_all( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employees selected.' ).
  ENDMETHOD.

  METHOD update_employee_last_name.
    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Updating employee last name...' ).

    zcl_dirigible_employee_dao=>update_employee_last_name( ).

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = 'Employee last name was updated.' ).
  ENDMETHOD.

ENDCLASS.
