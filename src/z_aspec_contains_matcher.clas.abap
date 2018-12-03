CLASS z_aspec_contains_matcher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        negating TYPE abap_bool.
    METHODS match
      IMPORTING
        line   TYPE any
        !table type any table
        quit   TYPE aunit_flowctrl.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: negative TYPE abap_bool.
ENDCLASS.



CLASS z_aspec_contains_matcher IMPLEMENTATION.
 METHOD constructor.
    me->negative = negating.
  ENDMETHOD.

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
    endmethod.
ENDCLASS.
