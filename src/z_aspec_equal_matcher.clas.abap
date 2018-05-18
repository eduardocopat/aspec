CLASS z_aspec_equal_matcher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        negating TYPE abap_bool.
    METHODS match
      IMPORTING
        actual   TYPE any
        expected TYPE any.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: negative TYPE abap_bool.

ENDCLASS.

CLASS z_aspec_equal_matcher IMPLEMENTATION.
  METHOD constructor.
    me->negative = negating.
  ENDMETHOD.

  METHOD match.
    IF negative = abap_false.
      z_aspec_xunit=>asserter->assert_equals(
          act = actual
          exp = expected ).
    ELSE.
      z_aspec_xunit=>asserter->assert_differs(
        act = actual
        exp = expected ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
