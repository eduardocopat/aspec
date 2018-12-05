CLASS z_aspec_matcher DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        negating TYPE abap_bool.
    METHODS match ABSTRACT
      IMPORTING
        actual   TYPE any OPTIONAL
        expected TYPE any OPTIONAL
        line     TYPE any OPTIONAL
        !table   TYPE ANY TABLE OPTIONAL
        quit     TYPE aunit_flowctrl OPTIONAL
        message  TYPE csequence OPTIONAL.
  PROTECTED SECTION.
    DATA: negative TYPE abap_bool.
  PRIVATE SECTION.

ENDCLASS.



CLASS z_aspec_matcher IMPLEMENTATION.
  METHOD constructor.
    me->negative = negating.
  ENDMETHOD.
ENDCLASS.
