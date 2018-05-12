CLASS z_aspec_expectant DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        actual   TYPE any
        negating TYPE abap_bool DEFAULT abap_false.
    METHODS to_equal
      IMPORTING
        expected TYPE any.
    METHODS to_be_true.
    METHODS to_be_false.
    METHODS not
      RETURNING
        VALUE(return) TYPE REF TO z_aspec_expectant.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA actual TYPE REF TO data.
    DATA negative TYPE abap_bool.
    METHODS flip_boolean
      IMPORTING
        boolean       TYPE abap_bool
      RETURNING
        VALUE(return) TYPE abap_bool.

ENDCLASS.



CLASS z_aspec_expectant IMPLEMENTATION.
  METHOD constructor.
    CREATE DATA me->actual LIKE actual.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).
    <actual> = actual.

    negative = negating.
  ENDMETHOD.

  METHOD not.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    return = NEW z_aspec_expectant(
        actual   = <actual>
        negating = abap_true ).
  ENDMETHOD.

  METHOD to_equal.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_equal_matcher( negative )->match(
      actual   = <actual>
      expected = expected ).
  ENDMETHOD.

  METHOD to_be_true.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_boolean_matcher( negative )->match( <actual> ).
  ENDMETHOD.

  METHOD to_be_false.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_boolean_matcher( flip_boolean( negative ) )->match( <actual> ).
  ENDMETHOD.

  METHOD flip_boolean.
    return = boolc( boolean <> abap_true ).
  ENDMETHOD.

ENDCLASS.
