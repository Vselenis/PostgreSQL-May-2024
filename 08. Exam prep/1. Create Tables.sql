CREATE TABLE owners(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(50)
);


CREATE TABLE animal_types(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_type VARCHAR(30) NOT NULL
);


CREATE TABLE cages(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_type_id INT NOT NULL,

    CONSTRAINT fk_cages_animal_type
    FOREIGN KEY (animal_type_id)
    REFERENCES animal_types(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE animals(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    birthdate DATE NOT NULL,
    owner_id INT,
    animal_type_id INT NOT NULL,

    CONSTRAINT fk_animals_owners
    FOREIGN KEY (owner_id)
    REFERENCES owners(id) ON UPDATE CASCADE ON DELETE CASCADE ,
    CONSTRAINT fk_animals_animal_type
    FOREIGN KEY (animal_type_id)
    REFERENCES animal_types(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE volunteers_departments(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL
);

CREATE TABLE volunteers(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(50),
    animal_id INT,
    department_id INT NOT NULL,


    CONSTRAINT fk_volunteers_animals
    FOREIGN KEY (animal_id)
    REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE ,
    CONSTRAINT fk_volunteers_volunteers_departments
    FOREIGN KEY (department_id)
    REFERENCES volunteers_departments(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE animals_cages(
    cage_id INT NOT NULL,
    animal_id INT NOT NULL,

    CONSTRAINT fk_animals_cages_cages
    FOREIGN KEY (cage_id)
    REFERENCES cages(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_animals_cages_animals
    FOREIGN KEY (animal_id)
    REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);