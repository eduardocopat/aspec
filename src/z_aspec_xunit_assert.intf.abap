"! Contains a copy of some of cl_abap_unit_assert interfaces
INTERFACE z_aspec_xunit_assert
  PUBLIC .
  METHODS:
    "! Abort test execution due to missing context
    "!
    "! @parameter msg    | Description
    "! @parameter detail | Further description
    "! @parameter quit   | Alter control flow/ quit test (METHOD, +++CLASS+++)
    abort
      IMPORTING !msg    TYPE csequence OPTIONAL
                !detail TYPE csequence OPTIONAL
                !quit   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>class
                  PREFERRED PARAMETER msg,

    "! Ensure the validity of the reference
    "!
    "! @parameter act              | Reference variable to be checked
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_bound
      IMPORTING !act                    TYPE any
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that character string fits to simple pattern
    "!
    "! @parameter act              | Actual Object
    "! @parameter exp              | Expected Template
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_char_cp
      IMPORTING !act                    TYPE csequence
                !exp                    TYPE csequence
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that character string does not fit to simple pattern
    "!
    "! @parameter act              | Actual text which shall not adhere to EXP pattern
    "! @parameter exp              | Simple text pattern
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_char_np
      IMPORTING !act                    TYPE csequence
                !exp                    TYPE csequence
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

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
      IMPORTING !act                    TYPE simple
                !exp                    TYPE simple
                !tol                    TYPE f OPTIONAL
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

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
      IMPORTING !act                    TYPE any
                !exp                    TYPE any
                !ignore_hash_sequence   TYPE abap_bool DEFAULT abap_false
                !tol                    TYPE f OPTIONAL
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,


    "! Ensure approximate consistency of 2 floating point numbers
    "!
    "! @parameter act              | Data object with current value
    "! @parameter exp              | Data object with expected value
    "! @parameter rtol             | Relative tolerance
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, CRITICAL, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_equals_float
      IMPORTING !act                    TYPE numeric
                !exp                    TYPE numeric
                !rtol                   TYPE numeric DEFAULT cl_abap_unit_assert=>rtol_default
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that boolean equals ABAP_FALSE
    "!
    "! @parameter act              | Actual data object
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_false
      IMPORTING !act                    TYPE abap_bool
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that data object value is initial
    "!
    "! @parameter act              | Actual data object
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_initial
      IMPORTING !act                    TYPE any DEFAULT sy-subrc
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
                  PREFERRED PARAMETER act
      RETURNING
                VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure invalidity of the reference of a reference variable
    "!
    "! @parameter act              | Reference variable to be checked
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_not_bound
      IMPORTING !act                    TYPE any
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that value of data object is not initial
    "!
    "! @parameter act              | Actual Data Object
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_not_initial
      IMPORTING !act                    TYPE any
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING
                VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that number is in given range
    "!
    "! @parameter lower            | Upper boundary
    "! @parameter upper            | Lower boundary
    "! @parameter number           | Number expected to be within the boundaries
    "! @parameter msg              | Description
    "! @parameter level            | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter quit             | Control flow in case of failed assertion
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_number_between
      IMPORTING !lower                  TYPE numeric
                !upper                  TYPE numeric
                !number                 TYPE numeric
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure specific value of return code
    "!
    "! @parameter exp              | Expected return code, optional, if not zero
    "! @parameter act              | Return code of ABAP statements
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter symsg            | System message
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_subrc
      IMPORTING VALUE(exp)              TYPE sysubrc DEFAULT 0
                VALUE(act)              TYPE sysubrc DEFAULT sy-subrc
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
                !symsg                  TYPE symsg OPTIONAL
                  PREFERRED PARAMETER act
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that data is contained as line within internal table
    "!
    "! @parameter line             | Data Object that is typed like line of TABLE
    "! @parameter table            | Internal Table that shall contain LINE
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_table_contains
      IMPORTING !line                   TYPE any
                !table                  TYPE ANY TABLE
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that data is not contained as line in internal table
    "!
    "! @parameter line             | Data Object that is typed like line of TABLE
    "! @parameter table            | Internal Table that must not contain LINE
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_table_not_contains
      IMPORTING !line                   TYPE any
                !table                  TYPE ANY TABLE
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that text matches regular expression
    "!
    "! @parameter pattern          | Regular Expression - see also TA ABAPHELP
    "! @parameter text             | Text that is assumed to met the regular expression
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_text_matches
      IMPORTING !pattern                TYPE csequence
                !text                   TYPE csequence
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that a constraint is met by data object
    "!
    "! @parameter act              | Data object which should adhere to constraint EXP
    "! @parameter exp              | Constraint to which ACT needs to adhere
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_that
      IMPORTING !act                    TYPE data
                !exp                    TYPE REF TO if_constraint
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Ensure that boolean equals ABAP_TRUE
    "!
    "! @parameter act              | Actual value
    "! @parameter msg              | Description
    "! @parameter level            | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit             | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter assertion_Failed | Condition was not met (and QUIT = NO)
    assert_true
      IMPORTING !act                    TYPE abap_bool
                !msg                    TYPE csequence OPTIONAL
                !level                  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit                   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
      RETURNING VALUE(assertion_failed) TYPE abap_bool,

    "! Report unconditional assertion
    "!
    "! @parameter msg    | Description
    "! @parameter level  | Severity (TOLERABLE, +CRITICAL+, FATAL)
    "! @parameter quit   | Alter control flow/ quit test (NO, +METHOD+, CLASS)
    "! @parameter detail | Further Description
    fail
      IMPORTING !msg    TYPE csequence OPTIONAL
                !level  TYPE aunit_level DEFAULT if_aunit_constants=>critical
                !quit   TYPE aunit_flowctrl DEFAULT if_aunit_constants=>method
                !detail TYPE csequence OPTIONAL
                  PREFERRED PARAMETER msg.
ENDINTERFACE.
