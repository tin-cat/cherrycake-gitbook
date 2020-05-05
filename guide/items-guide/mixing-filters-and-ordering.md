# Mixing filters and ordering

Let's take a look at a more advanced example of mixing both [custom filters](items-custom-filters.md) and [custom ordering](items-custom-ordering.md). This time, we'll setup the Movies class from [our past examples](item-lists.md) so it can get movies released between two given years, and it can order the results by the year of release. We'll also set up a second ordering method to order movies by their title, so movies released in the same year are ordered secondarily by title:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    
    function fillFromParameters($p = false) {
        // Treat parameters
        self::treatParameters($p, [
            "minYear" => ["default" => false],
            "maxYear" => ["default" => false],
            "orders" => ["addArrayKeysIfNotExist" => [
                "released" => "movies.year asc",
                "title" => "movies.title asc"
            ]]
        ]);
        
        // Modify $p accordingly
        if ($p["minYear"]) {
            $p["wheres"][] = [
                "sqlPart" => "movies.year >= ?",
                "values" => [
                    [
                        "type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER,
                        "value" => $p["minYear"]
                    ]
                ]
            ];
        }
        
        if ($p["maxYear"]) {
            $p["wheres"][] = [
                "sqlPart" => "movies.year <= ?",
                "values" => [
                    [
                        "type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER,
                        "value" => $p["maxYear"]
                    ]
                ]
            ];
        }
        
        // Call the parent fillFromParameters
        return parent::fillFromParameters($p);
    }
}
```

That's it, did you get it? Now we can use our new Movies class to get a neat list of Movies released in the glorious 80's, ordered by their release year and title, check this out:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "minYear" => 1980,
        "maxYear" => 1989,
        "order" => ["released", "title"]
    ]
]);

foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
Blade Runner (1982)
E.T. the Extra-Terrestrial (1982)
The Thing (1982)
Tron (1982)
Brainstorm (1983)
WarGames (1983)
Dune (1984)
The Last Starfighter (1984)
Enemy Mine (1985)
Explorers (1985)
The Abyss (1989)
```

