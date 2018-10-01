/* DDL */
CREATE TABLE Trainer(
	trainer_id INT,
	name_title VARCHAR(15),
	first_name VARCHAR(15),
	PRIMARY KEY (trainer_id)
)

CREATE TABLE Gym(
	city_name VARCHAR(24),
	type_specialization VARCHAR(24),
	badge_name VARCHAR(24),
    gym_leader_id int,
	-- Gym leader information,
	-- merged into gym info because of total,
	-- 1-to-1 participation between tables
	FOREIGN KEY (gym_leader_id) REFERENCES Trainer(trainer_id),
	gym_leader_monologue VARCHAR(1024),
	PRIMARY KEY (city_name)
)

CREATE TABLE PokemonSpecies(
	species_number INT,
	species_number INT,
	name VARCHAR(24),
	type_1 VARCHAR(12),
	type_2 VARCHAR(12),
    evolves_from int,
	FOREIGN KEY (evolves_from) REFERENCES PokemonSpecies(species_number),
	PRIMARY KEY (species_number)
)

CREATE TABLE Pokemon(
    trainer_id int,
	FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id),
	nickname VARCHAR(16),
	level INT,
    species_number int,
	FOREIGN KEY (species_number) REFERENCES PokemonSpecies(species_number),
	PRIMARY KEY (trainer_id, nickname)
)

CREATE TABLE GymBattle(
    city_name VARCHAR(24),
    trainer_id int,
	FOREIGN KEY (city_name) REFERENCES Gym(city_name),
	FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id),
)


/* Insertions */
-- INSERT INTO Trainer VALUES(trainer_id, 'title', 'first_name')
INSERT INTO Trainer VALUES(1, 'Lady', 'Madame')
INSERT INTO Trainer VALUES(2, 'Richboy', 'Richy')
INSERT INTO Trainer VALUES(3, 'Botanist', 'Lief')
INSERT INTO Trainer VALUES(4, 'Ace Trainer', 'Ace')
INSERT INTO Trainer VALUES(100, 'Gym Leader', 'Brock')
INSERT INTO Trainer VALUES(200, 'Gym Leader', 'Misty')
INSERT INTO Trainer VALUES(300, 'Gym Leader', 'Lt. Surge')
INSERT INTO Trainer VALUES(400, 'Gym Leader', 'Koga')
INSERT INTO Trainer VALUES(500, 'Gym Leader', 'Janine')
INSERT INTO Trainer VALUES(600, 'Gym Leader', 'Sabrina')
INSERT INTO Trainer VALUES(700, 'Gym Leader', 'Blaine')
INSERT INTO Trainer VALUES(800, 'Gym Leader', 'Giovanni')

-- INSERT INTO Gym VALUES (city_name, type_specialization, badge_name, gym_leader_id, gym_leader_monologue)
INSERT INTO Gym VALUES ('Pewter City', 'Rock', 'Boulder Badge', 100,'My rock-hard willpower is evident even in my Pokemon. My Pokemon are all rock hard and have true-grit determination. That''s right - my Pokemon are all the Rock type!')
INSERT INTO Gym VALUES ('Cerulean City', 'Water', 'Cascade Badge', 200,'My policy is an all-out offensive with Water-type Pokemon!')
INSERT INTO Gym VALUES ('Vermillion City', 'Electric', 'Thunder Badge', 300,'Hey, kid! What do you think you''re doing here? You won''t live long in combat! That''s for sure! I tell you kid, electric Pokémon saved me during the war! They zapped my enemies into paralysis! The same as I''ll do to you!')
INSERT INTO Gym VALUES ('Celadon City', 'Grass', 'Rainbow Badge', 400,'Fwahahaha! A mere child like you dares to challenge me? Very well, I shall show you true terror as a ninja master! You shall feel the despair of poison and sleep techniques!')
INSERT INTO Gym VALUES ('Fuchsia City', 'Poison', 'Soul Badge', 500,'Fufufufu... I''m sorry to disappoint you... I''m only joking! I''m the real deal! Janine of Fuchsia Gym, that''s me!')
INSERT INTO Gym VALUES ('Saffron City', 'Psychic', 'Marsh Badge', 600,'I had a vision of your arrival! I have had psychic powers since I was a little child. I first learned to bend spoons with my mind. I dislike fighting, but if you wish, I will show you my powers!')
INSERT INTO Gym VALUES ('Cinnabar Island', 'Fire', 'Volcano Badge', 700,'Hah! I''m Blaine! I am the Leader of Cinnabar Gym! My fiery Pokémon will incinerate all challengers! Hah! You better have Burn Heal!''')
INSERT INTO Gym VALUES ('Viridian City', 'Ground', 'Earth Badge', 800,'Fwahahaha! This is my hideout! I planned to resurrect Team Rocket here! But, you have caught me again! So be it! This time, I''m not holding back! Once more, you shall face Giovanni, the greatest trainer!')
-- , 'Blue','Yo! Finally got here, huh? I wasn't in the mood at Cinnabar, but now I'm ready to battle you. … You're telling me you conquered all the Gyms in Johto? Heh! Johto's Gyms must be pretty pathetic then. Hey, don't worry about it. I'll know if you are good or not by battling you right now. '

INSERT INTO GymBattle VALUES ('Pewter City', 1)
INSERT INTO GymBattle VALUES ('Cerulean City', 1)
INSERT INTO GymBattle VALUES ('Vermillion City', 1)
INSERT INTO GymBattle VALUES ('Celadon City', 1)
INSERT INTO GymBattle VALUES ('Pewter City', 2)
INSERT INTO GymBattle VALUES ('Cerulean City', 2)
INSERT INTO GymBattle VALUES ('Pewter City', 3)
INSERT INTO GymBattle VALUES ('Cerulean City', 3)
INSERT INTO GymBattle VALUES ('Vermillion City', 3)
INSERT INTO GymBattle VALUES ('Celadon City', 3)
INSERT INTO GymBattle VALUES ('Fuchsia City', 3)
INSERT INTO GymBattle VALUES ('Saffron City', 3)

-- INSERT INTO PokemonSpecies VALUES(species_id, name, type_1, type_2, evolves_from)
INSERT INTO PokemonSpecies VALUES(1, 'bulbasaur', 'grass', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(2, 'ivysaur', 'grass', 'poison', 1) 
INSERT INTO PokemonSpecies VALUES(3, 'venusaur', 'grass', 'poison', 2) 
INSERT INTO PokemonSpecies VALUES(4, 'charmander', 'fire', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(5, 'charmeleon', 'fire', NULL, 4) 
INSERT INTO PokemonSpecies VALUES(6, 'charizard', 'fire', 'flying', 5) 
INSERT INTO PokemonSpecies VALUES(7, 'squirtle', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(8, 'wartortle', 'water', NULL, 7) 
INSERT INTO PokemonSpecies VALUES(9, 'blastoise', 'water', NULL, 8) 
INSERT INTO PokemonSpecies VALUES(10, 'caterpie', 'bug', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(11, 'metapod', 'bug', NULL, 10) 
INSERT INTO PokemonSpecies VALUES(12, 'butterfree', 'bug', 'flying', 11) 
INSERT INTO PokemonSpecies VALUES(13, 'weedle', 'bug', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(14, 'kakuna', 'bug', 'poison', 13) 
INSERT INTO PokemonSpecies VALUES(15, 'beedrill', 'bug', 'poison', 14) 
INSERT INTO PokemonSpecies VALUES(16, 'pidgey', 'normal', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(17, 'pidgeotto', 'normal', 'flying', 16) 
INSERT INTO PokemonSpecies VALUES(18, 'pidgeot', 'normal', 'flying', 17) 
INSERT INTO PokemonSpecies VALUES(19, 'rattata', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(20, 'raticate', 'normal', NULL, 19) 
INSERT INTO PokemonSpecies VALUES(21, 'spearow', 'normal', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(22, 'fearow', 'normal', 'flying', 21) 
INSERT INTO PokemonSpecies VALUES(23, 'ekans', 'poison', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(24, 'arbok', 'poison', NULL, 23) 
INSERT INTO PokemonSpecies VALUES(25, 'pikachu', 'electric', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(26, 'raichu', 'electric', NULL, 25) 
INSERT INTO PokemonSpecies VALUES(27, 'sandshrew', 'ground', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(28, 'sandslash', 'ground', NULL, 27) 
INSERT INTO PokemonSpecies VALUES(29, 'nidoran-f', 'poison', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(30, 'nidorina', 'poison', NULL, 29) 
INSERT INTO PokemonSpecies VALUES(31, 'nidoqueen', 'poison', 'ground', 30) 
INSERT INTO PokemonSpecies VALUES(32, 'nidoran-m', 'poison', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(33, 'nidorino', 'poison', NULL, 32) 
INSERT INTO PokemonSpecies VALUES(34, 'nidoking', 'poison', 'ground', 33) 
INSERT INTO PokemonSpecies VALUES(35, 'clefairy', 'fairy', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(36, 'clefable', 'fairy', NULL, 35) 
INSERT INTO PokemonSpecies VALUES(37, 'vulpix', 'fire', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(38, 'ninetales', 'fire', NULL, 37) 
INSERT INTO PokemonSpecies VALUES(39, 'jigglypuff', 'normal', 'fairy', NULL) 
INSERT INTO PokemonSpecies VALUES(40, 'wigglytuff', 'normal', 'fairy', 39) 
INSERT INTO PokemonSpecies VALUES(41, 'zubat', 'poison', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(42, 'golbat', 'poison', 'flying', 41) 
INSERT INTO PokemonSpecies VALUES(43, 'oddish', 'grass', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(44, 'gloom', 'grass', 'poison', 43) 
INSERT INTO PokemonSpecies VALUES(45, 'vileplume', 'grass', 'poison', 44) 
INSERT INTO PokemonSpecies VALUES(46, 'paras', 'bug', 'grass', NULL) 
INSERT INTO PokemonSpecies VALUES(47, 'parasect', 'bug', 'grass', 46) 
INSERT INTO PokemonSpecies VALUES(48, 'venonat', 'bug', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(49, 'venomoth', 'bug', 'poison', 48) 
INSERT INTO PokemonSpecies VALUES(50, 'diglett', 'ground', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(51, 'dugtrio', 'ground', NULL, 50) 
INSERT INTO PokemonSpecies VALUES(52, 'meowth', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(53, 'persian', 'normal', NULL, 52) 
INSERT INTO PokemonSpecies VALUES(54, 'psyduck', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(55, 'golduck', 'water', NULL, 54) 
INSERT INTO PokemonSpecies VALUES(56, 'mankey', 'fighting', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(57, 'primeape', 'fighting', NULL, 56) 
INSERT INTO PokemonSpecies VALUES(58, 'growlithe', 'fire', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(59, 'arcanine', 'fire', NULL, 58) 
INSERT INTO PokemonSpecies VALUES(60, 'poliwag', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(61, 'poliwhirl', 'water', NULL, 60) 
INSERT INTO PokemonSpecies VALUES(62, 'poliwrath', 'water', 'fighting', 61) 
INSERT INTO PokemonSpecies VALUES(63, 'abra', 'psychic', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(64, 'kadabra', 'psychic', NULL, 63) 
INSERT INTO PokemonSpecies VALUES(65, 'alakazam', 'psychic', NULL, 64) 
INSERT INTO PokemonSpecies VALUES(66, 'machop', 'fighting', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(67, 'machoke', 'fighting', NULL, 66) 
INSERT INTO PokemonSpecies VALUES(68, 'machamp', 'fighting', NULL, 67) 
INSERT INTO PokemonSpecies VALUES(69, 'bellsprout', 'grass', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(70, 'weepinbell', 'grass', 'poison', 69) 
INSERT INTO PokemonSpecies VALUES(71, 'victreebel', 'grass', 'poison', 70) 
INSERT INTO PokemonSpecies VALUES(72, 'tentacool', 'water', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(73, 'tentacruel', 'water', 'poison', 72) 
INSERT INTO PokemonSpecies VALUES(74, 'geodude', 'rock', 'ground', NULL) 
INSERT INTO PokemonSpecies VALUES(75, 'graveler', 'rock', 'ground', 74) 
INSERT INTO PokemonSpecies VALUES(76, 'golem', 'rock', 'ground', 75) 
INSERT INTO PokemonSpecies VALUES(77, 'ponyta', 'fire', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(78, 'rapidash', 'fire', NULL, 77) 
INSERT INTO PokemonSpecies VALUES(79, 'slowpoke', 'water', 'psychic', NULL) 
INSERT INTO PokemonSpecies VALUES(80, 'slowbro', 'water', 'psychic', 79) 
INSERT INTO PokemonSpecies VALUES(81, 'magnemite', 'electric', 'steel', NULL) 
INSERT INTO PokemonSpecies VALUES(82, 'magneton', 'electric', 'steel', 81) 
INSERT INTO PokemonSpecies VALUES(83, 'farfetchd', 'normal', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(84, 'doduo', 'normal', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(85, 'dodrio', 'normal', 'flying', 84) 
INSERT INTO PokemonSpecies VALUES(86, 'seel', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(87, 'dewgong', 'water', 'ice', 86) 
INSERT INTO PokemonSpecies VALUES(88, 'grimer', 'poison', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(89, 'muk', 'poison', NULL, 88) 
INSERT INTO PokemonSpecies VALUES(90, 'shellder', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(91, 'cloyster', 'water', 'ice', 90) 
INSERT INTO PokemonSpecies VALUES(92, 'gastly', 'ghost', 'poison', NULL) 
INSERT INTO PokemonSpecies VALUES(93, 'haunter', 'ghost', 'poison', 92) 
INSERT INTO PokemonSpecies VALUES(94, 'gengar', 'ghost', 'poison', 93) 
INSERT INTO PokemonSpecies VALUES(95, 'onix', 'rock', 'ground', NULL) 
INSERT INTO PokemonSpecies VALUES(96, 'drowzee', 'psychic', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(97, 'hypno', 'psychic', NULL, 96) 
INSERT INTO PokemonSpecies VALUES(98, 'krabby', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(99, 'kingler', 'water', NULL, 98) 
INSERT INTO PokemonSpecies VALUES(100, 'voltorb', 'electric', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(101, 'electrode', 'electric', NULL, 100) 
INSERT INTO PokemonSpecies VALUES(102, 'exeggcute', 'grass', 'psychic', NULL) 
INSERT INTO PokemonSpecies VALUES(103, 'exeggutor', 'grass', 'psychic', 102) 
INSERT INTO PokemonSpecies VALUES(104, 'cubone', 'ground', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(105, 'marowak', 'ground', NULL, 104) 
INSERT INTO PokemonSpecies VALUES(106, 'hitmonlee', 'fighting', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(107, 'hitmonchan', 'fighting', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(108, 'lickitung', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(109, 'koffing', 'poison', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(110, 'weezing', 'poison', NULL, 109) 
INSERT INTO PokemonSpecies VALUES(111, 'rhyhorn', 'ground', 'rock', NULL) 
INSERT INTO PokemonSpecies VALUES(112, 'rhydon', 'ground', 'rock', 111) 
INSERT INTO PokemonSpecies VALUES(113, 'chansey', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(114, 'tangela', 'grass', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(115, 'kangaskhan', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(116, 'horsea', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(117, 'seadra', 'water', NULL, 116) 
INSERT INTO PokemonSpecies VALUES(118, 'goldeen', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(119, 'seaking', 'water', NULL, 118) 
INSERT INTO PokemonSpecies VALUES(120, 'staryu', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(121, 'starmie', 'water', 'psychic', 120) 
INSERT INTO PokemonSpecies VALUES(122, 'mr-mime', 'psychic', 'fairy', NULL) 
INSERT INTO PokemonSpecies VALUES(123, 'scyther', 'bug', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(124, 'jynx', 'ice', 'psychic', NULL) 
INSERT INTO PokemonSpecies VALUES(125, 'electabuzz', 'electric', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(126, 'magmar', 'fire', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(127, 'pinsir', 'bug', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(128, 'tauros', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(129, 'magikarp', 'water', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(130, 'gyarados', 'water', 'flying', 129) 
INSERT INTO PokemonSpecies VALUES(131, 'lapras', 'water', 'ice', NULL) 
INSERT INTO PokemonSpecies VALUES(132, 'ditto', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(133, 'eevee', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(134, 'vaporeon', 'water', NULL, 133) 
INSERT INTO PokemonSpecies VALUES(135, 'jolteon', 'electric', NULL, 133) 
INSERT INTO PokemonSpecies VALUES(136, 'flareon', 'fire', NULL, 133) 
INSERT INTO PokemonSpecies VALUES(137, 'porygon', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(138, 'omanyte', 'rock', 'water', NULL) 
INSERT INTO PokemonSpecies VALUES(139, 'omastar', 'rock', 'water', 138) 
INSERT INTO PokemonSpecies VALUES(140, 'kabuto', 'rock', 'water', NULL) 
INSERT INTO PokemonSpecies VALUES(141, 'kabutops', 'rock', 'water', 140) 
INSERT INTO PokemonSpecies VALUES(142, 'aerodactyl', 'rock', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(143, 'snorlax', 'normal', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(144, 'articuno', 'ice', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(145, 'zapdos', 'electric', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(146, 'moltres', 'fire', 'flying', NULL) 
INSERT INTO PokemonSpecies VALUES(147, 'dratini', 'dragon', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(148, 'dragonair', 'dragon', NULL, 147) 
INSERT INTO PokemonSpecies VALUES(149, 'dragonite', 'dragon', 'flying', 148) 
INSERT INTO PokemonSpecies VALUES(150, 'mewtwo', 'psychic', NULL, NULL) 
INSERT INTO PokemonSpecies VALUES(151, 'mew', 'psychic', NULL, NULL) 

-- INSERT INTO Pokemon VALUES (trainer_id, nickname, level)
INSERT INTO Pokemon VALUES (1, 'Octosire', 100, 121)
INSERT INTO Pokemon VALUES (1, 'Banub', 50, 3)
INSERT INTO Pokemon VALUES (1, 'Ostrung', 20, 101)
INSERT INTO Pokemon VALUES (1, 'Pelicaring', 12, 130)
INSERT INTO Pokemon VALUES (1, 'Quilhopper', 14, 111)
INSERT INTO Pokemon VALUES (1, 'Zappy', 27, 17)
INSERT INTO Pokemon VALUES (2, 'Squiggles', 2, 6)
INSERT INTO Pokemon VALUES (2, 'Wiggles', 2, 7)
INSERT INTO Pokemon VALUES (2, 'Chillanzee', 29, 11)
INSERT INTO Pokemon VALUES (2, 'Hardtocatch', 23, 48)
INSERT INTO Pokemon VALUES (2, 'Muk', 35, 99)
INSERT INTO Pokemon VALUES (2, 'Sandosaur', 56, 78)
INSERT INTO Pokemon VALUES (3, 'Mermantis', 45, 12)
INSERT INTO Pokemon VALUES (3, 'Salamaniac', 67, 58)
INSERT INTO Pokemon VALUES (3, 'Recyclops', 45, 139)
INSERT INTO Pokemon VALUES (3, 'Specipion', 88, 111)
INSERT INTO Pokemon VALUES (3, 'Moltyte', 73, 128)
INSERT INTO Pokemon VALUES (3, 'Quickida', 88, 10)
INSERT INTO Pokemon VALUES (4, 'Beavermin', 89, 12)
INSERT INTO Pokemon VALUES (4, 'Pandotto', 78, 132)
INSERT INTO Pokemon VALUES (4, 'Leotle', 70, 120)
INSERT INTO Pokemon VALUES (4, 'Wolvebite', 60, 121)
INSERT INTO Pokemon VALUES (4, 'Lobstaring', 65, 19)
INSERT INTO Pokemon VALUES(100, 'Onix', 12, 2)
INSERT INTO Pokemon VALUES(100, 'Geodude', 14, 4)
INSERT INTO Pokemon VALUES(200, 'Staryu', 18, 9)
INSERT INTO Pokemon VALUES(200, 'Starmie', 21, 98)
INSERT INTO Pokemon VALUES(300, 'Voltorb', 21, 58)
INSERT INTO Pokemon VALUES(300, 'Pikachu', 18, 29)
INSERT INTO Pokemon VALUES(300, 'Raichu', 24, 11)
INSERT INTO Pokemon VALUES(400, 'Victreebel', 29, 29)
INSERT INTO Pokemon VALUES(400, 'Tangela', 24, 98)
INSERT INTO Pokemon VALUES(400, 'Vileplume', 29, 59)
INSERT INTO Pokemon VALUES(500, 'Koffing', 37, 29)
INSERT INTO Pokemon VALUES(500, 'Koffing2', 37, 19)
INSERT INTO Pokemon VALUES(500, 'Weezing', 43, 81)
INSERT INTO Pokemon VALUES(500, 'Muk', 39, 48)
INSERT INTO Pokemon VALUES(600, 'Kadabra', 38, 12)
INSERT INTO Pokemon VALUES(600, 'Venomoth', 38, 22)
INSERT INTO Pokemon VALUES(600, 'Mr. Mime', 37, 38)
INSERT INTO Pokemon VALUES(600, 'Alakazam', 43, 59)
INSERT INTO Pokemon VALUES(700, 'Growlithe', 42, 49)
INSERT INTO Pokemon VALUES(700, 'Ponyta', 40, 29)
INSERT INTO Pokemon VALUES(700, 'Rapidash', 42, 11)
INSERT INTO Pokemon VALUES(700, 'Arcanine', 47, 89)
INSERT INTO Pokemon VALUES(800, 'Rhyhorn', 45, 59)
INSERT INTO Pokemon VALUES(800, 'Dugtrio', 42, 82)
INSERT INTO Pokemon VALUES(800, 'Nidoqueen', 44, 61)
INSERT INTO Pokemon VALUES(800, 'Nidoking', 45, 92)
INSERT INTO Pokemon VALUES(800, 'Rhydon', 50, 21)

--Retrieve the names of all gym leaders along with their monologues at their respective gyms
SELECT first_name, gym_leader_monologue
FROM Gym LEFT JOIN Trainer ON Trainer.trainer_id = gym_leader_id;

--Retrieve the count of trainers who have completed the Pewter City gym
SELECT COUNT(*)
FROM GymBattle
WHERE city_name='Pewter City'

--Retrieve the average level of each trainer's pokemon team
SELECT trainer_id, AVG(level)
FROM Pokemon
GROUP BY trainer_id;

--Retrieve a list of all trainers who have completed at least one gym, along with their highest level pokemon
SELECT trainer_id, MAX(level) FROM Pokemon
WHERE Pokemon.trainer_id IN (SELECT DISTINCT(trainer_id) FROM GymBattle)
GROUP BY trainer_id;

--A new gym has opened in Pewter City. It specializes in bug type pokemon and will give away the Moth Badge. Botanist Lief will be the gym leader.
INSERT INTO Gym VALUES(
	'Pewter City',
	'Bug',
	'Moth Badge',
	3,
	'My lens is always focused on victory. I won''t let anything ruin this shot!'
);

--The gym leader of Cinnabar Island has changed to a new trainer in the region. He claims his trainer Id is 9999
UPDATE Gym
SET gym_leader_id=9999;