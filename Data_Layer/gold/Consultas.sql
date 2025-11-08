-- ARQUIVO DE CONSULTAS DA CAMADA GOLD PARA O POWER BI

-- Consulta 1: Contagem de Pokémon por Tipo (Gráfico de Barras)
SELECT
    type_1,
    COUNT(pokedex_number) AS total_pokemon
FROM
    Fat_pokemon
GROUP BY
    type_1
ORDER BY
    total_pokemon DESC;


-- Consulta 2: Lista de Pokémon Lendários (Tabela/Filtro)

SELECT
    pokemon_name,
    type_1,
    type_2,
    generation
FROM
    Fat_pokemon
WHERE
    legendary = TRUE
ORDER BY
    pokemon_name;



-- Consulta 3: Contagem de Pokémon por Geração/Região (Gráfico de Barras)
SELECT
    generation,
    COUNT(pokedex_number) AS total_pokemon
FROM
    Fat_pokemon
GROUP BY
    generation
ORDER BY
    generation ASC;



-- Consulta 4: Tabela de Atributos Físicos (IV)

SELECT
    F.pokemon_name,
    F.height,
    F.weight,
    B.attack,
    B.defense,
    -- (O 'total_stats' será calculado no Power BI como a soma dos status)
    (B.attack + B.defense) AS stats_fisicos_parcial 
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl;



-- Consulta 5: Tabela de Captura (para Análise de Dificuldade)

SELECT
    F.pokemon_name,
    B.capture_rate,
    B.base_experience,
    B.exp_type
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
ORDER BY
    B.capture_rate ASC, B.base_experience DESC;



-- Consulta 6: Tabela de Vantagens (Matriz de Tipos Puros)

SELECT
    F.type_1,
    AVG(E.against_normal) AS against_normal,
    AVG(E.against_fire) AS against_fire,
    AVG(E.against_water) AS against_water,
    AVG(E.against_electric) AS against_electric,
    AVG(E.against_grass) AS against_grass,
    AVG(E.against_ice) AS against_ice,
    AVG(E.against_fighting) AS against_fighting,
    AVG(E.against_poison) AS against_poison,
    AVG(E.against_ground) AS against_ground,
    AVG(E.against_flying) AS against_flying,
    AVG(E.against_psychic) AS against_psychic,
    AVG(E.against_bug) AS against_bug,
    AVG(E.against_rock) AS against_rock,
    AVG(E.against_ghost) AS against_ghost,
    AVG(E.against_dragon) AS against_dragon,
    AVG(E.against_dark) AS against_dark,
    AVG(E.against_steel) AS against_steel,
    AVG(E.against_fairy) AS against_fairy
FROM
    Fat_pokemon AS F
JOIN
    Dim_EfetContr AS E ON F.SRK_efctr = E.SRK_efctr
WHERE
    F.type_2 = ' ' -- Assumindo que o ETL trata nulos como um espaço em branco
GROUP BY
    F.type_1
ORDER BY
    F.type_1;



-- Consulta 7: Distribuição de Gênero (Gráfico de Pizza)

SELECT
    CASE
        WHEN B.genderless = TRUE THEN 'Sem Gênero'
        WHEN B.female_rate = 0.0 THEN 'Apenas Macho'
        WHEN B.female_rate = 1.0 THEN 'Apenas Fêmea'
        ELSE 'Macho e Fêmea'
    END AS tipo_genero,
    COUNT(F.pokedex_number) AS total_pokemon
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
GROUP BY
    tipo_genero
ORDER BY
    total_pokemon DESC;



-- Consulta 8: Contagem de Formas Especiais (Gráfico de Barras)

SELECT
    'Mega Evoluções' AS tipo_forma,
    COUNT(F.pokedex_number) AS total
FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
WHERE
    D_Form.mega_evolution = TRUE

UNION ALL

SELECT
    'Formas de Alola' AS tipo_forma,
    COUNT(F.pokedex_number) AS total
FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
WHERE
    D_Form.alolan_form = TRUE

UNION ALL

SELECT
    'Formas de Galar' AS tipo_forma,
    COUNT(F.pokedex_number) AS total
FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
WHERE
    D_Form.galarian_form = TRUE;


-- Consulta 9: Pokémon Iniciais (Evolução)

SELECT
    pokemon_name,
    type_1,
    generation,
    legendary
FROM
    Fat_pokemon
WHERE
    evolves_from = ' ' 
ORDER BY
    pokedex_number;



-- Consulta 10: Os 10 Melhores "Tanques" (Defesa Alta)

SELECT
    F.pokemon_name,
    F.type_1,
    F.type_2,
    B.defense
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
WHERE
    F.legendary = FALSE
ORDER BY
    B.defense DESC
LIMIT 10;


-- Consulta 11: Tabela Mestra (Flat Table para Power BI)

SELECT
    -- Fatos e atributos da Fat_pokemon
    F.pokedex_number,
    F.pokemon_name,
    F.type_1,
    F.type_2,
    F.height,
    F.weight,
    F.generation,
    F.legendary,
    F.evolves_from,
    
    -- Atributos da Dim_Form
    D_Form.mega_evolution,
    D_Form.alolan_form,
    D_Form.galarian_form,
    D_Form.forms_switchable,
    
    -- Atributos da Dim_Batlh
    B.attack,
    B.defense,
    B.capture_rate,
    B.base_experience,
    B.exp_type

FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl;