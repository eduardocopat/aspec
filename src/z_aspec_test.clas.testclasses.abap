CLASS lcl_aspec DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec_test.

  PUBLIC SECTION.

  PRIVATE SECTION.

    METHODS:
      should_match_equality       FOR TESTING RAISING cx_static_check,
      should_match_not_equality   FOR TESTING RAISING cx_static_check,
      should_match_truthiness     FOR TESTING RAISING cx_static_check,
      should_match_not_truthiness FOR TESTING RAISING cx_static_check,
      should_match_falsiness      FOR TESTING RAISING cx_static_check,
      should_match_not_falsiness  FOR TESTING RAISING cx_static_check,
      should_match_contains       FOR TESTING RAISING cx_static_check,

      setup.
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
    z_aspec=>expect(
      VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) )
    )->to_contain(
      VALUE ts_a_line( a_key = '2' ) ) .

    should_assert_contains( ).
    table_should_be( VALUE ts_a_table( ( a_key = '1' ) ( a_key = '2' ) ) ).
    line_should_be( VALUE ts_a_line( a_key = '2' ) ).
  ENDMETHOD.


















ENDCLASS.
