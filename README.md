# aspec
ABAP spec-like testing library.

**WARNING**: <u>Prototype!</u>

## Description

This is a wrapper around abap unit to make the calls more readable and shorter. For example:

### Equality check

###### abap_unit
```abap
DATA(integer) = NEW integer( 2 ).
cl_abap_unit_assert=>assert_equals(
  act = integer->sum( 3 ) 
  exp = 5 
).
```
###### aspec
```abap
DATA(integer) = NEW integer( 2 ).
z_aspec=>expect( integer->sum( 3 ) )->to_equal( 5 ).
```

Or **inheriting** `z_aspec`:

```abap
DATA(integer) = NEW integer( 2 ).
expect( integer->sum( 3 ) )->to_equal( 5 ).
```

### Inequality/not
###### abap_unit
```abap
DATA(integer) = NEW integer( 2 ).
cl_abap_unit_assert=>assert_differs(
  act = integer->sum( 3 ) 
  exp = 6 
).
```
###### aspec
```abap
DATA(integer) = NEW integer( 2 ).
z_aspec=>expect( integer->sum( 3 ) )->not( )->to_equal( 6 ).
```
### Boolean
###### abap_unit
```abap
DATA(integer) = NEW integer( 2 ).
cl_abap_unit_assert=>assert_true( integer->is_positive( ) ).
cl_abap_unit_assert=>assert_false( integer->is_negative( ) ).
```
###### aspec
```abap
DATA(integer) = NEW integer( 2 ).
z_aspec=>expect( integer->is_positive( ) )->to_be_true( ).
z_aspec=>expect( integer->is_negative( ) )->to_be_false( ).
```
### Table comparison
Comparing tables using abap unit assert_equals will not indicate which structure component and index is different. This can be especially hard for tables with large structures.

aspec will point directly to the different columns and index.

#### And much more...
- contains: `z_aspec=>expect( table )->to_contain( line ).`
- fail: `z_aspec=>expect( )->to_fail( )`

## Install

Clone this repository using [abapGit](https://github.com/larshp/abapGit).

Then inherit from `z_aspec` or use the static methods from it.
