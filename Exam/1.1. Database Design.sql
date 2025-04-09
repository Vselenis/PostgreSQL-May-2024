CREATE TABLE IF NOT EXISTS planets(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS spaceships(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    manufacturer VARCHAR(50),
    speed INTEGER NOT NULL DEFAULT 1000
);

CREATE TABLE IF NOT EXISTS colonists(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    identity CHAR(10) NOT NULL UNIQUE,
    birth_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS stations(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    max_capacity INTEGER NOT NULL CHECK ( max_capacity >= 0 ),
    planet_id INTEGER NOT NULL,

    CONSTRAINT fk_stations_planets
    FOREIGN KEY (planet_id)
    REFERENCES planets(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS journeys(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    purpose VARCHAR(8) NOT NULL CHECK ( purpose IN ('Civil', 'Military') ),
    station_id INTEGER NOT NULL,
    spaceship_id INTEGER NOT NULL,

    CONSTRAINT fk_journeys_stations
    FOREIGN KEY (station_id)
    REFERENCES stations(id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_journeys_spaceships
    FOREIGN KEY (spaceship_id)
    REFERENCES spaceships(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS assignments(
    colonist_id INTEGER NOT NULL,
    journey_id INTEGER NOT NULL,
    task TEXT NOT NULL DEFAULT 'Engineering activities',

    CONSTRAINT pk_assignments_colonists_journeys
    PRIMARY KEY (colonist_id, journey_id),

    CONSTRAINT fk_assignments_colonists
    FOREIGN KEY (colonist_id)
    REFERENCES colonists(id) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_assignments_journeys
    FOREIGN KEY (journey_id)
    REFERENCES journeys(id) ON DELETE CASCADE ON UPDATE CASCADE
);