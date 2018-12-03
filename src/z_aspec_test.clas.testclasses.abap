CLASS lcl_aspec DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec_test.

  PUBLIC SECTION.

  PRIVATE SECTION.

    METHODS:
      setup,
      should_match_equality       FOR TESTING RAISING cx_static_check,
      should_match_not_equality   FOR TESTING RAISING cx_static_check,
      should_match_truthiness     FOR TESTING RAISING cx_static_check,
      should_match_not_truthiness FOR TESTING RAISING cx_static_check,
      should_match_falsiness      FOR TESTING RAISING cx_static_check,
      should_match_not_falsiness  FOR TESTING RAISING cx_static_check,
      should_match_contains       FOR TESTING RAISING cx_static_check,
      should_match_table_equality FOR TESTING RAISING cx_static_check,
      should_match_not_contains FOR TESTING RAISING cx_static_check,
      should_match_table_not_equal FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS lcl_aspec IMPLEMENTATION.
  METHOD setup.
    spy_asserter = NEW z_aspec_spy_asserter( ).
    z_aspec_xunit=>asserter = spy_asserter.
  ENDMETHOD.
  METHOD should_match_equality.
    z_aspec=>expect( 1 )->to_equal( 1 ).

    should_assert_equals( ).
    actual_should_be( 1 ).
    expected_should_be( 1 ).
  ENDMETHOD.

  METHOD should_match_not_equality.
    z_aspec=>expect( 1 )->not( )->to_equal( 2 ).

    should_assert_differs( ).
    actual_should_be( 1 ).
    expected_should_be( 2 ).
  ENDMETHOD.

  METHOD should_match_truthiness.
    z_aspec=>expect( abap_true )->to_be_true( ).

    should_assert_true( ).
    actual_should_be( abap_true ).
  ENDMETHOD.

  METHOD should_match_not_truthiness.
    z_aspec=>expect( abap_true )->not( )->to_be_true( ).

    should_assert_false( ).
    actual_should_be( abap_true ).
  ENDMETHOD.

  METHOD should_match_falsiness.
    z_aspec=>expect( abap_false )->to_be_false( ).

    should_assert_false( ).
    actual_should_be( abap_false ).
  ENDMETHOD.

  METHOD should_match_not_falsiness.
    z_aspec=>expect( abap_false )->not( )->to_be_false( ).

    should_assert_true( ).
    actual_should_be( abap_false ).
  ENDMETHOD.

  METHOD should_match_contains.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(line) = VALUE ts_a_line( a_key = '2' ).
    z_aspec=>expect( table )->to_contain( line ) .

    should_assert_contains( ).
    table_should_be( table ).
    line_should_be( line ).
  ENDMETHOD.

  METHOD should_match_not_contains.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(line) = VALUE ts_a_line( a_key = '3' ).

    z_aspec=>expect( table )->not( )->to_contain( line ) .

    should_assert_not_contains( ).
    table_should_be( table ).
    line_should_be( line ).
  ENDMETHOD.

  METHOD should_match_table_equality.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(another_table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ) .

    z_aspec=>expect( table )->to_equal( another_table ).

    should_assert_equals( ).
    "Should compare line by line
    actual_should_be( VALUE ts_a_line( a_key = '2' ) ).
    expected_should_be( VALUE ts_a_line( a_key = '2' ) ).
  ENDMETHOD.

  METHOD should_match_table_not_equal.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(another_table) = VALUE ts_a_table( ( a_key = '3' ) ( a_key = '4' ) ) .

    z_aspec=>expect( table )->not( )->to_equal( another_table ).

    should_assert_differs( ).
    "Should compare line by line
    actual_should_be( VALUE ts_a_line( a_key = '2' ) ).
    expected_should_be( VALUE ts_a_line( a_key = '4' ) ).
  ENDMETHOD.



ENDCLASS.
