CLASS z_aspec_expectant DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        actual   TYPE any
        negating TYPE abap_bool DEFAULT abap_false
        quit     TYPE aunit_flowctrl OPTIONAL .
    METHODS to_equal
      IMPORTING
        expected TYPE any.
    METHODS to_be_true.
    METHODS to_be_false.
    METHODS to_contain
      IMPORTING
        expected TYPE any.
    METHODS not
      RETURNING
        VALUE(return) TYPE REF TO z_aspec_expectant.
    METHODS with_quit
      IMPORTING
        quit          TYPE aunit_flowctrl
      RETURNING
        VALUE(return) TYPE REF TO z_aspec_expectant.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA actual TYPE REF TO data.
    DATA negative TYPE abap_bool.
    DATA quit TYPE aunit_flowctrl.
    METHODS invert_boolean
      IMPORTING
        boolean       TYPE abap_bool
      RETURNING
        VALUE(return) TYPE abap_bool.
    METHODS actual_is_a_table
      RETURNING
        VALUE(return) TYPE abap_bool.

ENDCLASS.



CLASS z_aspec_expectant IMPLEMENTATION.
  METHOD constructor.
    CREATE DATA me->actual LIKE actual.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).
    <actual> = actual.

    me->negative = negating.
    me->quit = quit.
  ENDMETHOD.

  METHOD not.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    return = NEW z_aspec_expectant(
      actual   = <actual>
      negating = abap_true
    ).
  ENDMETHOD.

  METHOD to_equal.

    IF actual_is_a_table( ).
      FIELD-SYMBOLS: <table> TYPE ANY TABLE.
      ASSIGN me->actual->* TO <table>.

      LOOP AT <table> ASSIGNING FIELD-SYMBOL(<table_line>).
        NEW z_aspec_equal_matcher( negative )->match(
          actual   = <table_line>
          expected = expected
          quit     = quit ).
      ENDLOOP.



    ELSE.
      ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

      NEW z_aspec_equal_matcher( negative )->match(
        actual   = <actual>
        expected = expected
        quit     = quit ).
    ENDIF.



  ENDMETHOD.

  METHOD to_be_true.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_boolean_matcher( negative )->match( <actual> ).
  ENDMETHOD.

  METHOD to_be_false.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    NEW z_aspec_boolean_matcher( invert_boolean( negative ) )->match( <actual> ).
  ENDMETHOD.

  METHOD invert_boolean.
    return = boolc( boolean <> abap_true ).
  ENDMETHOD.

  METHOD to_contain.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    z_aspec_xunit=>asserter->assert_table_contains(
      line             = expected
      table            = <actual> ).
  ENDMETHOD.

  METHOD with_quit.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).

    return = NEW z_aspec_expectant(
        actual   = <actual>
        negating = me->negative
        quit     = quit ).
  ENDMETHOD.


  METHOD actual_is_a_table.
    CONSTANTS:
           internal_table TYPE string VALUE 'h'.

    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).
    DESCRIBE FIELD <actual> TYPE DATA(actual_type).

    "https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abapdescribe_field.htm
    IF actual_type = internal_table.
      return = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
