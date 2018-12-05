"Missing table equal
"Missing boolean matcher
"Missing contains matcher
"Missing fail matcher

CLASS ltc_equal_options DEFINITION
FOR TESTING
INHERITING FROM z_aspec_test_options
RISK LEVEL HARMLESS DURATION SHORT.
  PROTECTED SECTION.
    METHODS: given_expectant REDEFINITION,
             when_matching REDEFINITION.
ENDCLASS.
CLASS ltc_equal_options IMPLEMENTATION.
  METHOD given_expectant.
    me->expectant = z_aspec=>expect( 1 ).
  ENDMETHOD.

  METHOD when_matching.
    expectant->to_equal( 1 ).
  ENDMETHOD.

ENDCLASS.
