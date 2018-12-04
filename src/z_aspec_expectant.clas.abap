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
    METHODS to_fail.
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
      FIELD-SYMBOLS: <actual_table> TYPE STANDARD TABLE.
      FIELD-SYMBOLS: <expected_table> TYPE STANDARD TABLE.

      "Dereference to standard table
      DATA expected_table TYPE REF TO data.
      CREATE DATA expected_table LIKE expected.
      ASSIGN expected_table->* TO <expected_table>.
      <expected_table> = expected.

      ASSIGN me->actual->* TO <actual_table>.

      DATA(table_size) = lines( <actual_table> ).

      DATA(index) = 1.
      WHILE index <= table_size.
        NEW z_aspec_equal_matcher( negative )->match(
            actual   = <actual_table>[ index ]
            expected = <expected_table>[ index ]
            quit     = quit ).

        index = index + 1.
      ENDWHILE.

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

    NEW z_aspec_contains_matcher( negative )->match(
      line = expected
      table   = <actual>
      quit = ''
    ).
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

  METHOD to_fail.
    IF negative = abap_false.
      z_aspec_xunit=>asserter->fail( ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
