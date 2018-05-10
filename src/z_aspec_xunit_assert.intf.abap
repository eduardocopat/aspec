"! Contains a copy of some of cl_abap_unit_assert interfaces
INTERFACE z_aspec_xunit_assert
  PUBLIC .
  METHODS:
    "! Ensure equality of two data objects
    "!
    "! @parameter act                  | Data object with current value
    "! @parameter exp                  | Data object with expected type
    "! @parameter ignore_Hash_Sequence | Ignore sequence in hash tables
    "! @parameter tol                  | Tolerance Range (for directly passed floating numbers)
    "! @parameter msg                  | Description
    "! @parameter level                | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit                 | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed     | Condition was not met (and QUIT = NO)
    assert_equals
      IMPORTING
        act                     TYPE any
        exp                     TYPE any
        ignore_hash_sequence    TYPE abap_bool DEFAULT abap_false
        tol                     TYPE f OPTIONAL
        msg                     TYPE csequence OPTIONAL
        level                   TYPE aunit_level DEFAULT if_aunit_constants=>critical
        quit                    TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING
        VALUE(assertion_failed) TYPE abap_bool,
    "! Ensure difference between 2 elementary data objects
    "!
    "! @parameter act              | Data object with current value
    "! @parameter exp              | Compare object with unexpected value
    "! @parameter tol              | Tolerance range for floating point comparison
    "! @parameter msg              | Message in case of error
    "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_differs
      IMPORTING
        act                     TYPE simple
        exp                     TYPE simple
        tol                     TYPE f OPTIONAL
        msg                     TYPE csequence OPTIONAL
        level                   TYPE aunit_level DEFAULT if_aunit_constants=>critical
        quit                    TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING
        VALUE(assertion_failed) TYPE abap_bool,
    "! Ensure that boolean equals ABAP_TRUE
    "!
    "! @parameter act              | Actual value
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_true
      IMPORTING
        act                     TYPE abap_bool
        msg                     TYPE csequence OPTIONAL
        level                   TYPE aunit_level DEFAULT if_aunit_constants=>critical
        quit                    TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING
        VALUE(assertion_failed) TYPE abap_bool.
ENDINTERFACE.
