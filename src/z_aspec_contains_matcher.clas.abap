CLASS z_aspec_contains_matcher DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM z_aspec_matcher
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS match
      IMPORTING
        line   TYPE any
        !table type any table
        quit   TYPE aunit_flowctrl.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_aspec_contains_matcher IMPLEMENTATION.
  METHOD match.
    IF negative = abap_true.
      z_aspec_xunit=>asserter->assert_table_not_contains(
        line  = line
        table = table ).
    ELSE.
      z_aspec_xunit=>asserter->assert_table_contains(
        line  = line
        table = table ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
