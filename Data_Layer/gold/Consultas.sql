-- Consulta 1: Top 10 Pokémon "Canhões de Vidro" (Não Lendários)

SELECT
    F.pokemon_name,
    F.type_1,
    B.attack,
    B.defense
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
WHERE
    F.legendary = FALSE
    AND B.attack > 110
    AND B.defense < 70
ORDER BY
    B.attack DESC
LIMIT 10;


-- Consulta 2: Pokémon com Formulário "Alolan" e suas Fraquezas

SELECT
    F.pokemon_name,
    F.type_1,
    F.type_2,
    E.against_fire,
    E.against_water,
    E.against_grass
FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
JOIN
    Dim_EfetContr AS E ON F.SRK_efctr = E.SRK_efctr
WHERE
    D_Form.alolan_form = TRUE
ORDER BY
    F.pokemon_name;

-- Consulta 3: Média de Ataque e Defesa por Geração 

SELECT
    F.generation,
    AVG(B.attack) AS media_de_ataque,
    AVG(B.defense) AS media_de_defesa,
    AVG(B.capture_rate) AS media_taxa_captura
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
GROUP BY
    F.generation
ORDER BY
    F.generation;


-- Consulta 4: Contagem de Pokémon por Tipo de Experiência (EXP)

SELECT
    B.exp_type,
    COUNT(F.pokedex_number) AS total_pokemon
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
GROUP BY
    B.exp_type
ORDER BY
    total_pokemon DESC;

-- Consulta 5: Os 10 Melhores "Tanques" (Não Lendários)

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

-- Consulta 6: Lista de Todas as "Mega Evoluções" e Seus Status

SELECT
    F.pokemon_name,
    F.type_1,
    F.generation,
    B.attack,
    B.defense,
    B.base_experience
FROM
    Fat_pokemon AS F
JOIN
    Dim_Form AS D_Form ON F.SRK_frm = D_Form.SRK_frm
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
WHERE
    D_Form.mega_evolution = TRUE
ORDER BY
    B.attack DESC;

-- Consulta 7: Análise de Fraqueza Extrema (4x vs. Voador)

SELECT
    F.pokemon_name,
    F.type_1,
    F.type_2,
    E.against_flying
FROM
    Fat_pokemon AS F
JOIN
    Dim_EfetContr AS E ON F.SRK_efctr = E.SRK_efctr
WHERE
    E.against_flying = 4.0
ORDER BY
    F.pokemon_name;

-- Consulta 8: Pokémon Mais Difíceis de Capturar (Taxa de Captura Baixa)

SELECT
    F.pokemon_name,
    F.type_1,
    F.generation,
    F.legendary,
    B.capture_rate
FROM
    Fat_pokemon AS F
JOIN
    Dim_Batlh AS B ON F.SRK_btl = B.SRK_btl
ORDER BY
    B.capture_rate ASC
LIMIT 15; 