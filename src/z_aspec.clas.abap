CLASS z_aspec DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS expect
      IMPORTING
        actual        TYPE any
      RETURNING
        VALUE(return) TYPE REF TO z_aspec_matcher.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_aspec IMPLEMENTATION.

  METHOD expect.
    return = NEW z_aspec_matcher( actual ).
  ENDMETHOD.

ENDCLASS.
