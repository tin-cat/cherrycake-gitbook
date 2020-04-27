# Untitled



```sql
CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `imdbRating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `movies` (`id`, `title`, `summary`, `year`, `imdbRating`) VALUES
(2, 'Brainstorm', 'Researchers develop a system where they can jump into people\'s minds. But when people involved bring their personal problems into the equation, it becomes dangerous - perhaps deadly.', 1983, 7.5),
(3, 'Silent Running', 'In a future where all flora is extinct on Earth, an astronaut is given orders to destroy the last of Earth\'s botany, kept in a greenhouse aboard a spacecraft.', 1972, 6.7),
(4, 'Arrival', 'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.', 2016, 7.9),
(5, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 2014, 8.6),
(6, 'Ex Machina', 'A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.', 2014, 7.7),
(7, '2001: A Space Odyssey', 'After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', 1968, 8.3),
(8, 'The Martian', 'An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.', 2015, 8),
(9, 'Planet of the Apes', 'An astronaut crew crash-lands on a planet in the distant future where intelligent talking apes are the dominant species, and humans are the oppressed and enslaved.', 1968, 8),
(10, 'Moon', 'Astronaut Sam Bell has a quintessentially personal encounter toward the end of his three-year stint on the Moon, where he, working alongside his computer, GERTY, sends back to Earth parcels of a resource that has helped diminish our planet\'s power problems.', 2009, 7.9),
(11, 'Contact', 'Dr. Ellie Arroway, after years of searching, finds conclusive radio proof of extraterrestrial intelligence, sending plans for a mysterious machine.', 1997, 7.4),
(12, 'The Man from Earth', 'An impromptu goodbye party for Professor John Oldman becomes a mysterious interrogation after the retiring scholar reveals to his colleagues he has a longer and stranger past than they can imagine.', 2007, 7.9),
(13, 'Dune', 'A Duke\'s son leads desert warriors against the galactic emperor and his father\'s evil nemesis when they assassinate his father and free their desert world from the emperor\'s rule.', 1984, 6.5),
(14, 'Blade Runner', 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.', 1982, 8.1),
(15, 'Alien', 'After a space merchant vessel receives an unknown transmission as a distress call, one of the crew is attacked by a mysterious life form and they soon realize that its life cycle has merely begun.', 1979, 8.4),
(16, 'The Hitchhiker’s Guide to the Galaxy', 'Mere seconds before the Earth is to be demolished by an alien construction crew, journeyman Arthur Dent is swept off the planet by his friend Ford Prefect, a researcher penning a new edition of \"The Hitchhiker\'s Guide to the Galaxy.\"', 2005, 6.8),
(17, 'Blade Runner 2049', 'Young Blade Runner K\'s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who\'s been missing for thirty years.', 2017, 8),
(18, 'Prometheus', 'Following clues to the origin of mankind, a team finds a structure on a distant moon, but they soon realize they are not alone.', 2012, 7),
(19, 'The Thing', 'A research team in Antarctica is hunted by a shape-shifting alien that assumes the appearance of its victims.', 1982, 8.1);

ALTER TABLE `movies` ADD PRIMARY KEY (`id`);
```



