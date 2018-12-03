CLASS ltc_aspec_quit DEFINITION
INHERITING FROM z_aspec_test
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PUBLIC SECTION.

  PRIVATE SECTION.
    METHODS:
      setup,
      should_match_with_quit FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltc_aspec_quit IMPLEMENTATION.
  METHOD setup.
    spy_asserter = NEW z_aspec_spy_asserter( ).
    z_aspec_xunit=>asserter = spy_asserter.
  ENDMETHOD.

  METHOD should_match_with_quit.
    z_aspec=>expect( 1 )->with_quit( if_aunit_constants=>class )->to_equal( 1 ).

    should_assert_equals( ).
    quit_option_should_be( if_aunit_constants=>class ).
  ENDMETHOD.


ENDCLASS.
