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
    spy_asserter = NEW z_aspec_spy_asserter( ).
    z_aspec_xunit=>asserter = spy_asserter.
  ENDMETHOD.

  METHOD not_quit.
    given_expectant( ).
    me->expectant = expectant->not( )->with_quit( if_aunit_constants=>class ).

    when_matching( ).

    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.


  METHOD quit.
    given_expectant( ).
    me->expectant = expectant->with_quit( if_aunit_constants=>class ).

    when_matching( ).

    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.

  METHOD message.
    given_expectant( ).
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

ENDCLASS.
