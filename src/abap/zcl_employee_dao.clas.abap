CLASS zcl_employee_dao DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES:
    BEGIN OF ty_employee,
        id         TYPE n LENGTH 10,
        first_name TYPE string,
        last_name  TYPE string,
    END OF ty_employee,
    ty_employees TYPE STANDARD TABLE OF ty_employee WITH DEFAULT KEY.

    CLASS-METHODS:
    delete_all_employees,
    select_all
        RETURNING VALUE(rv_result) TYPE string,
    insert_employee,
    update_employee_last_name.

ENDCLASS.

CLASS zcl_employee_dao IMPLEMENTATION.

  METHOD delete_all_employees.
    DATA: lv_rc TYPE i.

    DELETE FROM employees WHERE id > 0.

    lv_rc = sy-dbcnt.

    IF lv_rc > 0.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'All employees deleted successfully.' ).
    ELSE.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'No employees found to delete.' ).
    ENDIF.
  ENDMETHOD.

  METHOD select_all.
    DATA: lt_employees TYPE ty_employees,
        lv_json      TYPE string.

    SELECT id first_name last_name
    FROM employees
    INTO TABLE lt_employees.

    zcl_codbex_http_response=>println(
      EXPORTING
          message_in = 'Employees in DB:' ).
    zcl_codbex_http_response=>println(
      EXPORTING
          message_in = lt_employees ).
    WRITE: / 'Employees selected.'.
  ENDMETHOD.

  METHOD insert_employee.
    DATA: wa_employee TYPE ty_employee.

    wa_employee-id = 1.
    wa_employee-first_name = 'Jane'.
    wa_employee-last_name = 'Doe'.

    INSERT INTO employees VALUES wa_employee.

    IF sy-subrc = 0.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'Employee inserted successfully.' ).
    ELSE.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'Failed to insert employee.' ).
    ENDIF.
  ENDMETHOD.

  METHOD update_employee_last_name.
    DATA: lv_rc TYPE i.

    UPDATE employees
    SET last_name = 'Smith'
    WHERE id = 1.

    lv_rc = sy-dbcnt.

    IF lv_rc > 0.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'Employee last name updated successfully.' ).
    ELSE.
      zcl_codbex_http_response=>println(
        EXPORTING
        message_in = 'Failed to update employee last name.' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.