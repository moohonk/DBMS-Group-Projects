CREATE TABLE Trainer(
	trainer_id INT,
	name_title VARCHAR(15),
	first_name VARCHAR(15),
	PRIMARY KEY (trainer_id)
)

CREATE TABLE Gym(
	city_name VARCHAR(24),
	type_specialization VARCHAR(12),
	badge_name VARCHAR(12),
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