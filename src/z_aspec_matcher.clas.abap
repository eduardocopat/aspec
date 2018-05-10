CLASS z_aspec_matcher DEFINITION
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
    METHODS not
      RETURNING
        VALUE(return) TYPE REF TO z_aspec_matcher.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA actual TYPE REF TO data.
    DATA negative TYPE abap_bool.
ENDCLASS.



CLASS z_aspec_matcher IMPLEMENTATION.
  METHOD constructor.
    CREATE DATA me->actual LIKE actual.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).
    <actual> = actual.

    negative = negating.
  ENDMETHOD.

  METHOD to_be_true.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    z_aspec_xunit=>asserter->assert_true( <actual> ).
  ENDMETHOD.

  METHOD to_equal.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_equal_matcher( negative )->match(
      actual   = <actual>
      expected = expected ).
  ENDMETHOD.

  METHOD not.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    return = NEW z_aspec_matcher(
        actual   = <actual>
        negating = abap_true ).
  ENDMETHOD.
ENDCLASS.
