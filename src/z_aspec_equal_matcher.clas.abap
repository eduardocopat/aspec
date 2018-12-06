CLASS z_aspec_equal_matcher DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM z_aspec_matcher
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      match
        IMPORTING
          actual   TYPE any
          expected TYPE any
          quit     TYPE aunit_flowctrl
          message  TYPE csequence.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_aspec_equal_matcher IMPLEMENTATION.
  METHOD match.
    IF negative = abap_true.
      z_aspec_xunit=>asserter->assert_differs(
        act  = actual
        exp  = expected
        quit = quit
        msg  = message ).
    ELSE.
      z_aspec_xunit=>asserter->assert_equals(
        act  = actual
        exp  = expected
        quit = quit
        msg  = message ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
