CLASS z_aspec_xunit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      class_constructor.
    CLASS-DATA:
      asserter TYPE REF TO z_aspec_xunit_assert.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_aspec_xunit IMPLEMENTATION.
  METHOD class_constructor.
    asserter = NEW z_aspec_aunit_asserter( ).
  ENDMETHOD.

ENDCLASS.
