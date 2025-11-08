CREATE DATABASE POKEBI;

CREATE TABLE IF NOT EXISTS pokemon (
    SRK_pok INT NOT NULL PRIMARY KEY,
    pokemon_name VARCHAR(50) NOT NULL,
    type_1 VARCHAR(50) NOT NULL,
    type_2 VARCHAR(50),
    height DOUBLE PRECISION NOT NULL,
    weight DOUBLE PRECISION NOT NULL,
    generation INT NOT NULL,
    legendary BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Dim_Form (
    SRK_frm SERIAL NOT NULL PRIMARY KEY,
    mega_evolution BOOLEAN NOT NULL,
    alolan_form BOOLEAN NOT NULL,
    galarian_form BOOLEAN NOT NULL,
    forms_switchable BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemon (
    SRK_btl SERIAL NOT NULL PRIMARY KEY,
    attack INT NOT NULL,
    defense INT NOT NULL,
    capture_rate INT NOT NULL,
    base_experience INT NOT NULL,
    exp_type VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemon (
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

CREATE TABLE IF NOT EXISTS possui (
    SRK_pok_FK INT NOT NULL,
    SRK_frm_FK INT NOT NULL,
    
    PRIMARY KEY (SRK_pok_FK, SRK_frm_FK),
    
    FOREIGN KEY (SRK_pok_FK) 
        REFERENCES Fat_pokemon(SRK_pok) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    FOREIGN KEY (SRK_frm_FK) 
        REFERENCES Dim_Form(SRK_frm) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS realiza_ (
    SRK_pok_FK INT NOT NULL,
    SRK_btl_FK INT NOT NULL,
    
    PRIMARY KEY (SRK_pok_FK, SRK_btl_FK),
    
    FOREIGN KEY (SRK_pok_FK) 
        REFERENCES Fat_pokemon(SRK_pok) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    FOREIGN KEY (SRK_btl_FK) 
        REFERENCES Dim_Btl(SRK_btl) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS contem (
    SRK_pok_FK INT NOT NULL,
    SRK_efctr_FK INT NOT NULL,
    
    PRIMARY KEY (SRK_pok_FK, SRK_efctr_FK),
    
    FOREIGN KEY (SRK_pok_FK) 
        REFERENCES Fat_pokemon(SRK_pok) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    FOREIGN KEY (SRK_efctr_FK) 
        REFERENCES Dim_EfctContr(SRK_efctr) 
        ON DELETE CASCADE ON UPDATE CASCADE
);