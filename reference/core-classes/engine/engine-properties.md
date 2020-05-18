# Engine properties

## $timezoneId

The system's timezone. The same as timezoneName, but the matching id on the cherrycake timezones database table.

**Default:** `532` \(The `Etc/UTC` timezone id in the `cherrycake_location_timezones` table\)

## $timezoneName

The system's timezone. All modules, including Database for date/time retrievals/saves will be made taking this timezone into account. The server is expected to run on this timezone. Standard "`Etc/UTC`" is recommended.

**Default:** `Etc/UTC`

