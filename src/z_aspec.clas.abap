CLASS z_aspec DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS:
      expect
        IMPORTING
          actual        TYPE any OPTIONAL
        RETURNING
          VALUE(return) TYPE REF TO z_aspec_expectant.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_aspec IMPLEMENTATION.

  METHOD expect.
    return = NEW z_aspec_expectant( actual ).
  ENDMETHOD.

ENDCLASS.
