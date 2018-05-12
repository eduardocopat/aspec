CLASS z_aspec_boolean_matcher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        negating TYPE abap_bool.
    METHODS match
      IMPORTING
        actual   TYPE any.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: negative TYPE abap_bool.
ENDCLASS.



CLASS z_aspec_boolean_matcher IMPLEMENTATION.
  METHOD constructor.
    me->negative = negating.
  ENDMETHOD.

  METHOD match.
    IF negative = abap_true.
      z_aspec_xunit=>asserter->assert_false(
        act = actual ).
    ELSE.
      z_aspec_xunit=>asserter->assert_true(
        act = actual ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
