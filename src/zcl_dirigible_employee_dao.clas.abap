CLASS zcl_dirigible_employee_dao DEFINITION PUBLIC.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_employee,
        id         TYPE n LENGTH 10,
        first_name TYPE string,
        last_name  TYPE string,
      END OF ty_employee,
      ty_employees TYPE STANDARD TABLE OF ty_employee WITH DEFAULT KEY.

    CLASS-METHODS insert_employee.

    CLASS-METHODS select_all
      RETURNING VALUE(rv_result) TYPE string.

    CLASS-METHODS update_employee_last_name.

    CLASS-METHODS delete_all_employees.

ENDCLASS.

CLASS zcl_dirigible_employee_dao IMPLEMENTATION.

  METHOD delete_all_employees.
    DATA: lv_rc TYPE i.

    DELETE FROM employees WHERE id > 0.

    lv_rc = sy-dbcnt.

    IF lv_rc > 0.
      WRITE: / 'All employees deleted successfully.'.
    ELSE.
      WRITE: / 'No employees found to delete.'.
    ENDIF.
  ENDMETHOD.

  METHOD select_all.
    DATA: lt_employees TYPE ty_employees,
          lv_json      TYPE string.

    SELECT id first_name last_name
      FROM employees
      INTO TABLE lt_employees.

    zcl_dirigible_response=>println(
      EXPORTING
        message_in = lt_employees ).
  ENDMETHOD.

  METHOD insert_employee.
    " Declare a work area for the employee record
    DATA: wa_employee TYPE ty_employee.

    wa_employee-id = 321.
    wa_employee-first_name = 'Desislava'.
    wa_employee-last_name = 'Dimitrova'.

    " Insert the work area into the employees table
    INSERT INTO employees VALUES wa_employee.

    IF sy-subrc = 0.
      WRITE: / 'Employee inserted successfully.'.
    ELSE.
      WRITE: / 'Failed to insert employee.'.
    ENDIF.
  ENDMETHOD.

  METHOD update_employee_last_name.
    DATA: lv_rc TYPE i.

    UPDATE employees
      SET last_name = 'Popova'
      WHERE id = 321.

    lv_rc = sy-dbcnt.

    IF lv_rc > 0.
      WRITE: / 'Employee last name updated successfully.'.
    ELSE.
      WRITE: / 'Failed to update employee last name.'.
    ENDIF.
  ENDMETHOD.



ENDCLASS.
