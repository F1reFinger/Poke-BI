CREATE SCHEMA IF NOT EXISTS dw;

CREATE TABLE IF NOT EXISTS dw.Dim_pkm (
    SRK_pkn SERIAL PRIMARY KEY,
    pkm_nam VARCHAR(50) NOT NULL,
    tp1 VARCHAR(50) NOT NULL,
    gen INT NOT NULL,
    leg BOOLEAN NOT NULL,
    all_frm BOOLEAN NOT NULL,
    glr_frm BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS dw.Dim_btl (
    SRK_btl SERIAL PRIMARY KEY,
    atk INT NOT NULL,
    dfs INT NOT NULL,
    cap_rte INT NOT NULL
);

CREATE TABLE IF NOT EXISTS dw.Dim_efetContr (
    SRK_eft SERIAL PRIMARY KEY,
    agt_nrm DOUBLE PRECISION NOT NULL,
    agt_fgt DOUBLE PRECISION NOT NULL,           
    agt_rck DOUBLE PRECISION NOT NULL,
    agt_drg DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS dw.Fat_pokdx (
    SRK_pkx SERIAL PRIMARY KEY,
    SRK_pkn INT NOT NULL,
    SRK_btl INT NOT NULL,
    SRK_eft INT NOT NULL,
    
    -- chaves estrangeiras
    CONSTRAINT fk_pokemon
        FOREIGN KEY (SRK_pkn)
        REFERENCES dw.Dim_pkm (SRK_pkn),
        
    CONSTRAINT fk_batalha
        FOREIGN KEY (SRK_btl)
        REFERENCES dw.Dim_btl (SRK_btl),
        
    CONSTRAINT fk_efetividade
        FOREIGN KEY (SRK_eft)
        REFERENCES dw.Dim_efetContr (SRK_eft)
);
