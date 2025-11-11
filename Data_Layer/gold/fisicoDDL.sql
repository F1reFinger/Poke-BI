
CREATE TABLE IF NOT EXISTS Dim_pokmn (
    SRK_pkn SERIAL NOT NULL PRIMARY KEY,
    pokemon_name VARCHAR(50) NOT NULL,
    type_1 VARCHAR(50) NOT NULL,
    type_2 VARCHAR(50),
    height DOUBLE PRECISION NOT NULL,
    weight DOUBLE PRECISION NOT NULL,
    generation INT NOT NULL,
    legendary BOOLEAN NOT NULL,
    mega_evolution BOOLEAN NOT NULL,
    alolan_form BOOLEAN NOT NULL,
    galarian_form BOOLEAN NOT NULL,
    forms_switchable BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Dim_batlh (
    SRK_btl SERIAL NOT NULL PRIMARY KEY,
    attack INT NOT NULL,
    defense INT NOT NULL,
    capture_rate INT NOT NULL,
    base_experience INT NOT NULL,
    exp_type VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dim_efetContr (
    SRK_efctr SERIAL NOT NULL PRIMARY KEY,
    against_normal DOUBLE PRECISION NOT NULL,
    against_fire DOUBLE PRECISION NOT NULL,
    against_water DOUBLE PRECISION NOT NULL,
    against_electric DOUBLE PRECISION NOT NULL,
    against_grass DOUBLE PRECISION NOT NULL,
    against_ice DOUBLE PRECISION NOT NULL,
    against_fighting DOUBLE PRECISION NOT NULL,
    against_poison DOUBLE PRECISION NOT NULL,
    against_ground DOUBLE PRECISION NOT NULL,
    against_flying DOUBLE PRECISION NOT NULL,
    against_psychic DOUBLE PRECISION NOT NULL,
    against_bug DOUBLE PRECISION NOT NULL,
    against_rock DOUBLE PRECISION NOT NULL,
    against_ghost DOUBLE PRECISION NOT NULL,
    against_dragon DOUBLE PRECISION NOT NULL,
    against_dark DOUBLE PRECISION NOT NULL,
    against_steel DOUBLE PRECISION NOT NULL,
    against_fairy DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS Fat_pokdx (
    SRK_pkx INT NOT NULL PRIMARY KEY,
    SRK_pkn INT NOT NULL,
    SRK_btl INT NOT NULL,
    SRK_efctr INT NOT NULL,
    
    FOREIGN KEY (SRK_pkn) REFERENCES Dim_pokmn (SRK_pkn),
    FOREIGN KEY (SRK_btl) REFERENCES Dim_batlh (SRK_btl),
    FOREIGN KEY (SRK_efctr) REFERENCES Dim_efetContr (SRK_efctr)
);
