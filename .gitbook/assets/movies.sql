CREATE TABLE `directors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthYear` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `directors` (`id`, `name`, `birthYear`) VALUES
(1, 'Robert Wise', 1914),
(2, 'Byron Haskin', 1899),
(3, 'Stanley Kubrick', 1928),
(4, 'Franklin J. Schaffner', 1920),
(5, 'Douglas Trumbull', 1942),
(6, 'Steven Spielberg', 1946),
(7, 'Ridley Scott', 1937),
(8, 'John Carpenter', 1948),
(9, 'Steven Lisberger', 1951),
(10, 'John Badham', 1939),
(11, 'David Lynch', 1946),
(12, 'Nick Castle', 1947),
(13, 'Wolfgang Petersen', 1941),
(14, 'Joe Dante', 1946),
(15, 'James Cameron', 1954),
(16, 'Robert Zemeckis', 1951),
(17, 'Garth Jennings', 1972),
(18, 'Richard Schenkman', 1958),
(19, 'Duncan Jones', 1971),
(20, 'J.J. Abrams', 1966),
(21, 'Christopher Nolan', 1970),
(22, 'Alex Garland', 1970),
(23, 'Denis Villeneuve', 1967);

CREATE TABLE `movies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `imdbRating` float DEFAULT NULL,
  `directorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `movies` (`id`, `title`, `summary`, `year`, `imdbRating`, `directorId`) VALUES
(1, 'Alien', 'After a space merchant vessel receives an unknown transmission as a distress call, one of the crew is attacked by a mysterious life form and they soon realize that its life cycle has merely begun.', 1979, 8.4, 7),
(2, 'The Thing', 'A research team in Antarctica is hunted by a shape-shifting alien that assumes the appearance of its victims.', 1982, 8.1, 8),
(3, 'Silent Running', 'In a future where all flora is extinct on Earth, an astronaut is given orders to destroy the last of Earth\'s botany, kept in a greenhouse aboard a spacecraft.', 1972, 6.7, 5),
(4, 'Arrival', 'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.', 2016, 7.9, 23),
(5, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 2014, 8.6, 21),
(6, 'Ex Machina', 'A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.', 2014, 7.7, 22),
(7, '2001: A Space Odyssey', 'After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', 1968, 8.3, 3),
(8, 'The Martian', 'An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.', 2015, 8, 7),
(9, 'Planet of the Apes', 'An astronaut crew crash-lands on a planet in the distant future where intelligent talking apes are the dominant species, and humans are the oppressed and enslaved.', 1968, 8, 4),
(10, 'Moon', 'Astronaut Sam Bell has a quintessentially personal encounter toward the end of his three-year stint on the Moon, where he, working alongside his computer, GERTY, sends back to Earth parcels of a resource that has helped diminish our planet\'s power problems.', 2009, 7.9, 19),
(11, 'Contact', 'Dr. Ellie Arroway, after years of searching, finds conclusive radio proof of extraterrestrial intelligence, sending plans for a mysterious machine.', 1997, 7.4, 16),
(12, 'The Man from Earth', 'An impromptu goodbye party for Professor John Oldman becomes a mysterious interrogation after the retiring scholar reveals to his colleagues he has a longer and stranger past than they can imagine.', 2007, 7.9, 18),
(13, 'Dune', 'A Duke\'s son leads desert warriors against the galactic emperor and his father\'s evil nemesis when they assassinate his father and free their desert world from the emperor\'s rule.', 1984, 6.5, 11),
(14, 'Blade Runner', 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.', 1982, 8.1, 7),
(15, 'Brainstorm', 'Researchers develop a system where they can jump into people\'s minds. But when people involved bring their personal problems into the equation, it becomes dangerous - perhaps deadly.', 1983, 6.5, 5),
(16, 'The Hitchhiker’s Guide to the Galaxy', 'Mere seconds before the Earth is to be demolished by an alien construction crew, journeyman Arthur Dent is swept off the planet by his friend Ford Prefect, a researcher penning a new edition of \"The Hitchhiker\'s Guide to the Galaxy.\"', 2005, 6.8, 17),
(17, 'Blade Runner 2049', 'Young Blade Runner K\'s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who\'s been missing for thirty years.', 2017, 8, 23),
(18, 'Prometheus', 'Following clues to the origin of mankind, a team finds a structure on a distant moon, but they soon realize they are not alone.', 2012, 7, 7),
(19, 'The Last Starfighter', 'Video game expert Alex Rogan finds himself transported to another planet after conquering The Last Starfighter video game only to find out it was just a test. He was recruited to join the team of best starfighters to defend their world from the attack.', 1984, 6.8, 12),
(20, 'Enemy Mine', 'During a long space war, the lives of two wounded enemies become dependent on their ability to forgive and to trust.', 1985, 6.9, 13),
(21, 'Explorers', 'A boy obsessed with 50s sci-fi movies about aliens has a recurring dream about a blueprint of some kind, which he draws for his inventor friend. With the help of a third kid, they follow it and build themselves a spaceship. Now what?', 1985, 6.6, 14),
(22, 'Tron', 'A computer hacker is abducted into the digital world and forced to participate in gladiatorial games where his only chance of escape is with the help of a heroic security program.', 1982, 6.8, 9),
(23, 'WarGames', 'A young man finds a back door into a military central computer in which reality is confused with game-playing, possibly starting World War III.', 1983, 7.1, 10),
(24, 'Close Encounters of the Third Kind', 'Roy Neary, an electric lineman, watches how his quiet and ordinary daily life turns upside down after a close encounter with a UFO.', 1977, 7.6, 6),
(25, 'The War of the Worlds', 'A small town in California is attacked by Martians, beginning a worldwide invasion.', 1953, 7.1, 2),
(26, 'The Day the Earth Stood Still', 'An alien lands and tells the people of Earth that they must live peacefully or be destroyed as a danger to other planets.', 1951, 7.7, 1),
(27, 'E.T. the Extra-Terrestrial', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', 1982, 7.8, 6),
(28, 'The Abyss', 'A civilian diving team is enlisted to search for a lost nuclear submarine and face danger while encountering an alien aquatic species.', 1989, 7.6, 15),
(29, 'War of the Worlds', 'As Earth is invaded by alien tripod fighting machines, one family fights for survival in this sci-fi action film.', 2005, 6.5, 6),
(30, 'Super 8', 'During the summer of 1979, a group of friends witness a train crash and investigate subsequent unexplained events in their small town.', 2011, 7, 20);

ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directorId` (`directorId`);


ALTER TABLE `directors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `movies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;
