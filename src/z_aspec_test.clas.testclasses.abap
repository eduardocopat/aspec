CLASS lcl_aspec DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.
  PUBLIC SECTION.

  PRIVATE SECTION.
    DATA: spy_asserter TYPE REF TO z_aspec_spy_asserter.
    METHODS:
      should_match_equality       FOR TESTING RAISING cx_static_check,
      should_not_match_equality   FOR TESTING RAISING cx_static_check,
      should_match_truthiness     FOR TESTING RAISING cx_static_check,
      should_not_match_truthiness FOR TESTING RAISING cx_static_check,
      should_match_falsiness      FOR TESTING RAISING cx_static_check,
      should_not_match_falsiness  FOR TESTING RAISING cx_static_check,
      should_match_contains       FOR TESTING RAISING cx_static_check,

      setup,
      should_assert_equals,
      actual_should_be
        IMPORTING
          actual TYPE any,
      expected_should_be
        IMPORTING
          expected TYPE any,
      line_should_be
        IMPORTING
          line TYPE any,
      table_should_be
        IMPORTING
          table TYPE any,
      should_assert_true,
      should_assert_differs,
      should_assert_false,
      should_assert_contains.

    TYPES:
      BEGIN OF ts_a_line,
        a_key       TYPE char30,
        description TYPE char30,
      END OF ts_a_line,
      ts_a_table TYPE TABLE OF ts_a_line WITH KEY a_key.
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

  METHOD should_not_match_equality.
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

  METHOD should_not_match_truthiness.
    z_aspec=>expect( abap_true )->not( )->to_be_true( ).

    should_assert_false( ).
    actual_should_be( abap_true ).
  ENDMETHOD.

  METHOD should_match_falsiness.
    z_aspec=>expect( abap_false )->to_be_false( ).

    should_assert_false( ).
    actual_should_be( abap_false ).
  ENDMETHOD.

  METHOD should_not_match_falsiness.
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

  METHOD should_assert_equals.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_equals_called ).
  ENDMETHOD.

  METHOD actual_should_be.
    ASSIGN spy_asserter->actual->* TO FIELD-SYMBOL(<actual>).
    cl_abap_unit_assert=>assert_equals(
      act = <actual>
      exp = actual ).
  ENDMETHOD.

  METHOD expected_should_be.
    ASSIGN spy_asserter->expected->* TO FIELD-SYMBOL(<expected>).
    cl_abap_unit_assert=>assert_equals(
      act = <expected>
      exp = expected ).
  ENDMETHOD.

  METHOD should_assert_true.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_true_called ).
  ENDMETHOD.

  METHOD should_assert_differs.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_differs_called ).
  ENDMETHOD.

  METHOD should_assert_false.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_false_called ).
  ENDMETHOD.

  METHOD should_assert_contains.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_table_contains ).
  ENDMETHOD.

  METHOD line_should_be.
    ASSIGN spy_asserter->line->* TO FIELD-SYMBOL(<line>).
    cl_abap_unit_assert=>assert_equals(
      act = <line>
      exp = line ).
  ENDMETHOD.

  METHOD table_should_be.
    ASSIGN spy_asserter->table->* TO FIELD-SYMBOL(<table>).
    cl_abap_unit_assert=>assert_equals(
      act = <table>
      exp = table ).
  ENDMETHOD.



ENDCLASS.
