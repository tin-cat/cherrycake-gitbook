# DatabaseResult methods

## countRows

**Returns:** The number of rows in the results of the query.

## freeResult

Frees the memory associated to the results of the query. This causes results to no longer be available.

## getRow

Returns the current row in the results of the query, and advances to the next row.

**Returns:** A [DatabaseRow](../databaserow.md) object.

## isAny

**Returns:** True if there were any results, false if not.

## reset

Sets the row pointer to the beginning of the results, so the next retrieved row will be the first.



