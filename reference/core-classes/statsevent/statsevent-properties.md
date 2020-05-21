# StatsEvent properties

## $id <a id="id"></a>

The id of the event in the database.

## $type <a id="type"></a>

The type of the stats event, matching the name of the class that generated it.

## $subType <a id="subtype"></a>

The sub-type of the stats event.

## $resolution <a id="resolution"></a>

The time frame resolution used by this event. One of the available [`STATS_EVENT_TIME_RESOLUTION_?`](./#constants) constants.

## $timestamp <a id="dateadded"></a>

The timestamp this event was added to the event log.

## $isSecondaryId <a id="issecondaryid"></a>

Whether this [StatsEvent](./) uses secondary id or not.

## $secondary\_id <a id="secondary_id"></a>

The secondary if for this event.

## $isTertiaryId <a id="istertiaryid"></a>

Whether this [StatsEvent](./) uses tertiary id or not.

## $tertiary\_id <a id="tertiary-id"></a>

The tertiary if for this event.

## $count <a id="count"></a>

The number of times this stats event has been triggered during the time frame specified by this event's `resolution` and `timestamp`.



