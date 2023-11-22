CLASS zcl_abap_cicd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS version TYPE string VALUE '1.0.0' ##NO_TEXT.
    METHODS constructor.
    METHODS get_sum
      IMPORTING iv_value1        TYPE i
                iv_value2        TYPE i
      RETURNING VALUE(rv_result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_cicd IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

  METHOD get_sum.
    rv_result = iv_value1 + iv_value2. " abapLint will tell us something is wrong with this line (space_before_dot)
  ENDMETHOD.

ENDCLASS.
