CLASS zcl_sampletrmactions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor.

    METHODS sum
    IMPORTING iv_val1 TYPE i
              iv_val2 TYPE i
    RETURNING VALUE(rv_result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SAMPLETRMACTIONS IMPLEMENTATION.

  METHOD constructor.
    " empty
  ENDMETHOD.

  METHOD sum.
    rv_result = iv_val1 + iv_val2.
  ENDMETHOD.

ENDCLASS.
