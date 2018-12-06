CLASS z_aspec_tables_matcher DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM z_aspec_matcher
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      match
        IMPORTING
          actual   TYPE any
          expected TYPE any
          quit     TYPE aunit_flowctrl
          message  TYPE csequence.
  PROTECTED SECTION.
ENDCLASS.



CLASS z_aspec_tables_matcher IMPLEMENTATION.
  METHOD match.
    FIELD-SYMBOLS: <actual_table> TYPE STANDARD TABLE.
    FIELD-SYMBOLS: <expected_table> TYPE STANDARD TABLE.

    "Dereference to standard table
    DATA expected_table TYPE REF TO data.
    CREATE DATA expected_table LIKE expected.
    ASSIGN expected_table->* TO <expected_table>.
    <expected_table> = expected.

    ASSIGN actual->* TO <actual_table>.

    DATA(table_size) = lines( <actual_table> ).
    IF table_size <> lines( <expected_table> ).
      z_aspec_xunit=>asserter->fail( msg = 'Tables do not have the same size' ).
      RETURN.
    ENDIF.

    DATA(index) = 1.
    WHILE index <= table_size.
      NEW z_aspec_equal_matcher( negative )->match(
          actual   = <actual_table>[ index ]
          expected = <expected_table>[ index ]
          quit     = quit
          message = '' ).

      index = index + 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
