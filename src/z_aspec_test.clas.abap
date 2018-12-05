CLASS z_aspec_test DEFINITION
  PUBLIC ABSTRACT
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA: spy_asserter TYPE REF TO z_aspec_spy_asserter.
    METHODS: should_assert_equals,
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
      should_assert_contains,
      should_assert_not_contains,
      should_assert_fail,
      quit_option_should_be
        IMPORTING
          quit TYPE any,
      message_option_should_be
        importing
          message type string.
    TYPES:
      BEGIN OF ts_a_line,
        a_key       TYPE char30,
        description TYPE char30,
      END OF ts_a_line,
      ts_a_table TYPE TABLE OF ts_a_line WITH KEY a_key.
    METHODS should_assert_not_fail.
    METHODS: message_should_be
      IMPORTING
        message TYPE string.
ENDCLASS.



CLASS z_aspec_test IMPLEMENTATION.
  METHOD message_should_be.
    cl_abap_unit_assert=>assert_equals(
      exp = message
      act = spy_asserter->message ).
  ENDMETHOD.

  METHOD should_assert_not_fail.
    cl_abap_unit_assert=>assert_false( spy_asserter->assert_fail ).
  ENDMETHOD.
  METHOD should_assert_fail.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_fail ).
  ENDMETHOD.

  METHOD should_assert_not_contains.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_table_not_contains ).
  ENDMETHOD.

  METHOD quit_option_should_be.
    cl_abap_unit_assert=>assert_equals(
      act = spy_asserter->quit
      exp = quit ).
  ENDMETHOD.

  METHOD message_option_should_be.
    cl_abap_unit_assert=>assert_equals(
      act = spy_asserter->message
      exp = message ).
  ENDMETHOD.

  METHOD should_assert_contains.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_table_contains ).
  ENDMETHOD.

  METHOD should_assert_false.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_false_called ).
  ENDMETHOD.

  METHOD should_assert_differs.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_differs_called ).
  ENDMETHOD.

  METHOD should_assert_true.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_true_called ).
  ENDMETHOD.

  METHOD table_should_be.
    ASSIGN spy_asserter->table->* TO FIELD-SYMBOL(<table>).
    cl_abap_unit_assert=>assert_equals(
      act = <table>
      exp = table ).
  ENDMETHOD.

  METHOD line_should_be.
    ASSIGN spy_asserter->line->* TO FIELD-SYMBOL(<line>).
    cl_abap_unit_assert=>assert_equals(
      act = <line>
      exp = line ).
  ENDMETHOD.

  METHOD expected_should_be.
    ASSIGN spy_asserter->expected->* TO FIELD-SYMBOL(<expected>).
    cl_abap_unit_assert=>assert_equals(
      act = <expected>
      exp = expected ).
  ENDMETHOD.

  METHOD actual_should_be.
    ASSIGN spy_asserter->actual->* TO FIELD-SYMBOL(<actual>).
    cl_abap_unit_assert=>assert_equals(
      act = <actual>
      exp = actual ).
  ENDMETHOD.

  METHOD should_assert_equals.
    cl_abap_unit_assert=>assert_true( spy_asserter->assert_equals_called ).
  ENDMETHOD.
ENDCLASS.
