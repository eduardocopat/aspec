CLASS lcl_aspec DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec_test.

  PUBLIC SECTION.

  PRIVATE SECTION.

    METHODS:
      setup,
      match_equality        FOR TESTING RAISING cx_static_check,
      match_not_equality    FOR TESTING RAISING cx_static_check,
      match_truthiness      FOR TESTING RAISING cx_static_check,
      match_not_truthiness  FOR TESTING RAISING cx_static_check,
      match_falsiness       FOR TESTING RAISING cx_static_check,
      match_not_falsiness   FOR TESTING RAISING cx_static_check,
      match_contains        FOR TESTING RAISING cx_static_check,
      match_table_equal     FOR TESTING RAISING cx_static_check,
      match_not_contains    FOR TESTING RAISING cx_static_check,
      match_table_not_equal FOR TESTING RAISING cx_static_check,
      fail                  FOR TESTING RAISING cx_static_check,
      fail_table_size_different FOR TESTING RAISING cx_static_check,
      not_fail FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS lcl_aspec IMPLEMENTATION.
  METHOD setup.
    spy_asserter = NEW z_aspec_spy_asserter( ).
    z_aspec_xunit=>asserter = spy_asserter.
  ENDMETHOD.
  METHOD match_equality.
    expect( 1 )->to_equal( 1 ).

    should_assert_equals( ).
    actual_should_be( 1 ).
    expected_should_be( 1 ).
  ENDMETHOD.

  METHOD match_not_equality.
    expect( 1 )->not( )->to_equal( 2 ).

    should_assert_differs( ).
    actual_should_be( 1 ).
    expected_should_be( 2 ).
  ENDMETHOD.

  METHOD match_truthiness.
    expect( abap_true )->to_be_true( ).

    should_assert_true( ).
    actual_should_be( abap_true ).
  ENDMETHOD.

  METHOD match_not_truthiness.
    expect( abap_true )->not( )->to_be_true( ).

    should_assert_false( ).
    actual_should_be( abap_true ).
  ENDMETHOD.

  METHOD match_falsiness.
    expect( abap_false )->to_be_false( ).

    should_assert_false( ).
    actual_should_be( abap_false ).
  ENDMETHOD.

  METHOD match_not_falsiness.
    expect( abap_false )->not( )->to_be_false( ).

    should_assert_true( ).
    actual_should_be( abap_false ).
  ENDMETHOD.

  METHOD match_contains.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(line) = VALUE ts_a_line( a_key = '2' ).
    expect( table )->to_contain( line ) .

    should_assert_contains( ).
    table_should_be( table ).
    line_should_be( line ).
  ENDMETHOD.

  METHOD match_not_contains.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(line) = VALUE ts_a_line( a_key = '3' ).

    expect( table )->not( )->to_contain( line ) .

    should_assert_not_contains( ).
    table_should_be( table ).
    line_should_be( line ).
  ENDMETHOD.

  METHOD match_table_equal.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(another_table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ) .

    expect( table )->to_equal( another_table ).

    should_assert_equals( ).
    "Should compare line by line
    actual_should_be( VALUE ts_a_line( a_key = '2' ) ).
    expected_should_be( VALUE ts_a_line( a_key = '2' ) ).
  ENDMETHOD.

  METHOD match_table_not_equal.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(another_table) = VALUE ts_a_table( ( a_key = '3' ) ( a_key = '4' ) ) .

    expect( table )->not( )->to_equal( another_table ).

    should_assert_differs( ).
    "Should compare line by line
    actual_should_be( VALUE ts_a_line( a_key = '2' ) ).
    expected_should_be( VALUE ts_a_line( a_key = '4' ) ).
  ENDMETHOD.

  METHOD fail_table_size_different.
    DATA(table) = VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ).
    DATA(larger_table) = VALUE ts_a_table( ( a_key = '3' ) ( a_key = '4' ) ( a_key = '5' ) ).

    expect( table )->not( )->to_equal( larger_table ).
    should_assert_fail( ).
    message_should_be( 'Tables do not have the same size' ).
  ENDMETHOD.

  METHOD fail.
    expect( )->to_fail( ).

    should_assert_fail( ).
  ENDMETHOD.

  METHOD not_fail.
    expect( )->not( )->to_fail( ).

    should_assert_not_fail( ).
  ENDMETHOD.



ENDCLASS.
