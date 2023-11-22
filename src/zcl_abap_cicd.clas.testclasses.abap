*"* use this source file for your ABAP unit test classes
CLASS zclt_abap_cicd DEFINITION FINAL FOR TESTING
                                      DURATION SHORT
                                      RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: m_cut TYPE REF TO zcl_abap_cicd.
    METHODS setup.
    METHODS test_sum FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS zclt_abap_cicd IMPLEMENTATION.

  METHOD setup.
    CREATE OBJECT m_cut.
  ENDMETHOD.

  METHOD test_sum.
    cl_abap_unit_assert=>assert_equals( msg = 'Error in result 1 + 1'
                                        exp = m_cut->get_sum( iv_value1 = 1
                                                              iv_value2 = 1 )
                                        act = 1 ). " ADASH will tell us this unit test is broken
  ENDMETHOD.

ENDCLASS.
