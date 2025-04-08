CREATE TABLE IF NOT EXISTS countries(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    continent VARCHAR(40) NOT NULL,
    currency VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS categories(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS actors(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    height INTEGER,
    awards INTEGER NOT NULL DEFAULT 0 CHECK (awards >= 0),
    country_id INTEGER NOT NULL,

    CONSTRAINT fk_actors_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS productions_info(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rating DECIMAL(4,2) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0),
    budget DECIMAL(10,2),
    release_date DATE NOT NULL,
    has_subtitles BOOLEAN NOT NULL DEFAULT FALSE,
    synopsis TEXT
);

CREATE TABLE IF NOT EXISTS productions(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(70) NOT NULL UNIQUE,
    country_id INTEGER NOT NULL,
    production_info_id INTEGER NOT NULL UNIQUE,

    CONSTRAINT fk_productions_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_productions_productions_info
    FOREIGN KEY (production_info_id)
    REFERENCES productions_info(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS productions_actors(
    production_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,

    CONSTRAINT pk_productions_actors_productions_actors
    PRIMARY KEY (production_id, actor_id),

    CONSTRAINT fk_productions_actors_productions
    FOREIGN KEY (production_id)
    REFERENCES productions(id) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_productions_actors_actors
    FOREIGN KEY (actor_id)
    REFERENCES actors(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories_productions(
    category_id INTEGER NOT NULL,
    production_id INTEGER NOT NULL,

    CONSTRAINT pk_categories_productions_categories_productions
    PRIMARY KEY (category_id, production_id),

    CONSTRAINT fk_categories_productions_categories
    FOREIGN KEY (category_id)
    REFERENCES categories(id) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_categories_productions_productions
    FOREIGN KEY (production_id)
    REFERENCES productions(id) ON UPDATE CASCADE ON DELETE CASCADE
);
