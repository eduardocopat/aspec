CLASS z_aspec_test_options DEFINITION
  PUBLIC ABSTRACT
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec_test.

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS:
      quit            FOR TESTING RAISING cx_static_check,
      not_quit        FOR TESTING RAISING cx_static_check,
      message         FOR TESTING RAISING cx_static_check,
      not_message     FOR TESTING RAISING cx_static_check,
      "Combo
      message_quit    FOR TESTING RAISING cx_static_check,
      quit_message    FOR TESTING RAISING cx_static_check,
      given_expectant ABSTRACT,
      when_matching   ABSTRACT.
    DATA:
      expectant TYPE REF TO z_aspec_expectant.
  PRIVATE SECTION.
    METHODS:
      setup.
ENDCLASS.

CLASS z_aspec_test_options IMPLEMENTATION.

  METHOD setup.
    setup_spy_asserter( ).
    given_expectant( ).
  ENDMETHOD.

  METHOD not_quit.
    me->expectant = expectant->not( )->with_quit( if_aunit_constants=>class ).

    when_matching( ).

    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.

  METHOD quit.
    me->expectant = expectant->with_quit( if_aunit_constants=>class ).

    when_matching( ).

    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.

  METHOD message.
    me->expectant = expectant->with_message( 'a message' ).

    when_matching( ).

    message_option_should_be( 'a message' ).
  ENDMETHOD.

  METHOD not_message.
    given_expectant( ).
    me->expectant = expectant->not( )->with_message( 'a message' ).

    when_matching( ).

    message_option_should_be( 'a message' ).
  ENDMETHOD.

  METHOD message_quit.
    me->expectant = expectant->with_message( 'a message' )->with_quit( if_aunit_constants=>class ).

    when_matching( ).

    message_option_should_be( 'a message' ).
    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.

  METHOD quit_message.
    me->expectant = expectant->with_quit( if_aunit_constants=>class )->with_message( 'a message' ).

    when_matching( ).

    message_option_should_be( 'a message' ).
    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.

ENDCLASS.
