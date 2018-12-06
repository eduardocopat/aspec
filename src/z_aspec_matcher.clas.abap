CLASS z_aspec_matcher DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        negating TYPE abap_bool.
  PROTECTED SECTION.
    DATA: negative TYPE abap_bool.
  PRIVATE SECTION.

ENDCLASS.



CLASS z_aspec_matcher IMPLEMENTATION.
  METHOD constructor.
    me->negative = negating.
  ENDMETHOD.
ENDCLASS.
