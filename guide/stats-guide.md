# Stats guide

## What's the difference between a SystemLogEvent and a StatsEvent?

[SystemLog](../reference/core-modules/systemlog/) stores a unique object in the database per each logged event, allowing individual events to hold their own unique data. [Stats](../reference/core-modules/stats.md), in the other hand, stores a single object in the database for all the events triggered during a certain period. This doesn't allows for individual [Stats](../reference/core-modules/stats.md) events to hold their own differentiating data, because it only stores the number of times a certain event has been triggered, thus making Stats a more suitable solution to store big amounts of information aimed to be analyzed statistically.

