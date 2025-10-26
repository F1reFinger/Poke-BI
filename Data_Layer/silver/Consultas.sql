-- Consultar tabela
SELECT * FROM pokemon;

-- Consulta dos nomes dos pokémons presentes na tabela pokemon
SELECT pokemon_name FROM pokemon; 

-- Consulta dos Pokémon que são do tipo 'Fire' (Fogo)
SELECT pokemon_name, type_1, type_2 FROM pokemon WHERE type_1 = 'Fire';

-- Consulta os Top 10 Pokémon Mais Pesados
SELECT pokemon_name, weight, type_1
FROM pokemon
ORDER BY weight DESC
LIMIT 10;

-- Consulta dos Pokémon Lendários e Míticos da Primeira Geração
SELECT pokedex_number, pokemon_name, type_1, type_2, total_stats
FROM pokemon
WHERE generation = 1 AND (legendary = TRUE OR mythical = TRUE)
ORDER BY pokedex_number;

-- Consulta: Pokémon com dois tipos e Total Stats acima de 600
SELECT pokemon_name, type_1, type_2, total_stats
FROM pokemon
WHERE total_stats > 600 AND type_2 != ' '
ORDER BY total_stats DESC;

-- Contagem de Pokémon por Tipo Primário
SELECT type_1, COUNT(pokedex_number) AS quantidade
FROM pokemon
GROUP BY type_1
ORDER BY quantidade DESC;

-- Consulta: Super Fracos contra Fogo (Dano 4x)
SELECT pokemon_name, type_1, type_2, against_fire
FROM pokemon
WHERE against_fire = 4.0;

-- Consulta: "Canhões de Vidro" (Ataque > 110 e Defesa < 70)
SELECT pokemon_name, attack, defense, total_stats
FROM pokemon
WHERE attack > 110 AND defense < 70
ORDER BY attack DESC;





