*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION FINAL FOR TESTING
                                      DURATION SHORT
                                      RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: m_cut TYPE REF TO zcl_sampletrmactions.
    METHODS setup.
    METHODS test_sum FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS lcl_test IMPLEMENTATION.

  METHOD setup.
    CREATE OBJECT m_cut.
  ENDMETHOD.

  METHOD test_sum.
    cl_abap_unit_assert=>assert_equals( msg = 'Error in result 1 + 1'
                                        exp = m_cut->sum( iv_val1 = 1
                                                          iv_val2 = 1 )
                                        act = 2 ).
  ENDMETHOD.

ENDCLASS.
