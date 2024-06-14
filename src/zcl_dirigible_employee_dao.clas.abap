CLASS zcl_dirigible_employee_dao DEFINITION PUBLIC.
  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_employee,
        id         TYPE n LENGTH 10,
        first_name  TYPE string,
        last_name   TYPE string,
      END OF ty_employee,
      ty_employees TYPE STANDARD TABLE OF ty_employee WITH DEFAULT KEY.
    CLASS-METHODS select_all
        RETURNING VALUE(rv_result) TYPE string.

ENDCLASS.
CLASS zcl_dirigible_employee_dao IMPLEMENTATION.
  METHOD select_all.
    DATA: lt_employees TYPE ty_employees,
          lv_json       TYPE string.

    SELECT id first_name last_name
      FROM employees
      INTO TABLE lt_employees.

      zcl_dirigible_response=>println(
        EXPORTING
          message_in = lt_employees ).
  ENDMETHOD.

ENDCLASS.