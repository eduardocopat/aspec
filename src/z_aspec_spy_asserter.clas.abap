CLASS z_aspec_spy_asserter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC FOR TESTING.

  PUBLIC SECTION.
    INTERFACES:
      z_aspec_xunit_assert.
    DATA:
      actual                    TYPE REF TO data,
      quit                      TYPE aunit_flowctrl,
      expected                  TYPE REF TO data,
      line                      TYPE REF TO data,
      table                     TYPE REF TO data,
      assert_equals_called      TYPE abap_bool,
      assert_true_called        TYPE abap_bool,
      assert_false_called       TYPE abap_bool,
      assert_differs_called     TYPE abap_bool,
      assert_table_contains     TYPE abap_bool,
      assert_table_not_contains TYPE abap_bool,
      assert_fail               TYPE abap_bool,
      message                   TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS save_actual
      IMPORTING
        actual TYPE any.
    METHODS save_expected
      IMPORTING
        expected TYPE any.
    METHODS save_line
      IMPORTING
        line TYPE any.
    METHODS save_table
      IMPORTING
        table TYPE ANY TABLE.
    METHODS save_quit
      IMPORTING
        quit TYPE aunit_flowctrl.
    METHODS save_message
      IMPORTING
        message TYPE csequence.

ENDCLASS.

CLASS z_aspec_spy_asserter IMPLEMENTATION.
  METHOD z_aspec_xunit_assert~assert_equals.
    assert_equals_called = abap_true.
    save_actual( act ).
    save_expected( exp ).
    save_quit( quit ).
    save_message( msg ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_true.
    assert_true_called = abap_true.
    save_actual( act ).
    save_quit( quit ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_differs.
    assert_differs_called = abap_true.
    save_actual( act ).
    save_expected( exp ).
    save_quit( quit ).
    save_message( msg ).
  ENDMETHOD.


  METHOD save_actual.
    CREATE DATA me->actual LIKE actual.
    ASSIGN me->actual->* TO FIELD-SYMBOL(<actual>).
    <actual> = actual.
  ENDMETHOD.


  METHOD save_expected.
    CREATE DATA me->expected LIKE expected.
    ASSIGN me->expected->* TO FIELD-SYMBOL(<expected>).
    <expected> = expected.
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~abort.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_bound.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_char_cp.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_char_np.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_equals_float.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_false.
    assert_false_called = abap_true.
    save_actual( act ).
    save_quit( quit ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_initial.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_not_bound.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_not_initial.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_number_between.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_subrc.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_table_contains.
    assert_table_contains = abap_true.

    save_line( line ).
    save_table( table ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_table_not_contains.
    assert_table_not_contains = abap_true.

    save_line( line ).
    save_table( table ).
  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_text_matches.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~assert_that.

  ENDMETHOD.

  METHOD z_aspec_xunit_assert~fail.
    assert_fail = abap_true.
    message = msg.
    save_quit( quit ).
  ENDMETHOD.


  METHOD save_line.
    CREATE DATA me->line LIKE line.
    ASSIGN me->line->* TO FIELD-SYMBOL(<line>).
    <line> = line.
  ENDMETHOD.


  METHOD save_table.
    CREATE DATA me->table LIKE table.
    ASSIGN me->table->* TO FIELD-SYMBOL(<table>).
    <table> = table.
  ENDMETHOD.


  METHOD save_quit.
    me->quit = quit.
  ENDMETHOD.


  METHOD save_message.
    me->message = message.
  ENDMETHOD.

ENDCLASS.
