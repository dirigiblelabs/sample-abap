CLASS zcl_dirigible_employee_dao DEFINITION PUBLIC.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_employee,
        id         TYPE n LENGTH 10,
        firstName  TYPE string,
        lastName   TYPE string,
      END OF ty_employee,
      ty_employees TYPE TABLE OF ty_employee WITH EMPTY KEY.

    CLASS-METHODS:
      select_all
        RETURNING VALUE(rv_result) TYPE string.

ENDCLASS.

CLASS zcl_dirigible_employee_dao IMPLEMENTATION.

  METHOD select_all.
    DATA: lt_employees TYPE ty_employees,
          ls_employee  TYPE ty_employee,
          lv_result    TYPE string.

    SELECT id, firstName, lastName 
      FROM employees 
      INTO TABLE lt_employees.

    LOOP AT lt_employees INTO ls_employee.
      CONCATENATE lv_result
                  'ID:' ls_employee-id
                  ' First Name:' ls_employee-firstName
                  ' Last Name:' ls_employee-lastName
                  cl_abap_char_utilities=>cr_lf
                  INTO lv_result
                  SEPARATED BY space.
    ENDLOOP.

    rv_result = lv_result.
  ENDMETHOD.

ENDCLASS.
