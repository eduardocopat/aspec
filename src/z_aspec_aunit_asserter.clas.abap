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

  METHOD z_aspec_xunit_assert~abort.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_bound.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_char_cp.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_char_np.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_differs.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_equals_float.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_false.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_initial.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_not_bound.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_not_initial.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_number_between.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_subrc.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_table_not_contains.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_text_matches.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_that.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_true.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~fail.

  ENDMETHOD.

ENDCLASS.
