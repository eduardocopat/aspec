CLASS z_aspec_aunit_asserter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      z_aspec_xunit_assert.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_aspec_aunit_asserter IMPLEMENTATION.
  METHOD z_aspec_xunit_assert~assert_equals.
    cl_abap_unit_assert=>assert_equals(
      act = act
      exp = exp ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_table_contains.

  ENDMETHOD.

ENDCLASS.
