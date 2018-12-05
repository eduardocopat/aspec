CLASS z_aspec_boolean_matcher DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM z_aspec_matcher
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS match REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_aspec_boolean_matcher IMPLEMENTATION.

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
