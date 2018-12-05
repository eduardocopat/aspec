CLASS z_aspec_test_options DEFINITION
  PUBLIC ABSTRACT
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT
  INHERITING FROM z_aspec_test.

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS:
      quit,
      given_expectant ABSTRACT,
      when_matching   ABSTRACT.
    data:
      expectant TYPE ref to z_aspec_expectant.
  PRIVATE SECTION.
    METHODS:
      setup.
ENDCLASS.



CLASS z_aspec_test_options IMPLEMENTATION.
  METHOD setup.
    spy_asserter = NEW z_aspec_spy_asserter( ).
    z_aspec_xunit=>asserter = spy_asserter.
  ENDMETHOD.
  METHOD quit.
    given_expectant( ).
    expectant->with_quit( if_aunit_constants=>class ).
    when_matching( ).

    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.


ENDCLASS.
