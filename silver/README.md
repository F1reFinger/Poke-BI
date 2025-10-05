# Sobre esta pasta 

Onde está os dados limpos, padronizados e enriquecidos, movidos da camada Bronze. Será desenvolvido o Lakehouse, que consistirá em uma tabela com todos os dados da camada Silver, servindo de base para a criação do banco de dados.

## Tarefas relacionadas a esta camada 

**Etapa 1:**

| Atividade | Responsável| Revisores |  
|-----------|--------------| ----------|
| MER, DER, DLD, DDL e Dicionário de dados       | Todos  | -- | 

**Etapa 2:**

| Atividade | Responsável| Revisores |  
|-----------|--------------| ----------|
| **Job ETL**<br> - Apagar colunas: ability_1, ability_2, ability_3, number_pokemon_with_typing, primary_color. <br>- Acrescentar outras colunas se necessário.   | [Larissa Stéfane Barboza](https://github.com/SkywalkerSupreme) | [Maria Eduarda Barbosa](https://github.com/Madu01) |
| **Job ETL**<br>- Corrigir coluna pokedex_number em relação ao nome dos pokémons, e colocar nome da coluna de pokedex_ID, ou algum nome relacionado a ID.<br>- Apagar colunas: shape, bmi, special_attack, special_defense, speed.  | [Helder Lourenço](https://github.com/F1reFinger) |  |
| **Job ETL**<br> - Apagar colunas: mean, standard_deviation, exp_to_level_100, can_evolve, final_evolution. <br>- Apagar Null das colunas: type_2 e evolves_from. | [Maria Eduarda Barbosa](https://github.com/Madu01) | [Larissa Stéfane Barboza](https://github.com/SkywalkerSupreme) |
| **Job ETL**<br> - Apagar colunas: is_default, baby_pokemon, genus, egg_group_1, egg_group_2. <br> - Colocar comando para visualizar a tabela já tratada | [Lucas Rodrigues](https://github.com/nickby2) |  |
| Adicionar comandos de SELECT na tabela tratada  | Todos | -- |

**Etapa 3:**

| Atividade | Responsável| Revisores |  
|-----------|--------------| ----------|
| **Docker**<br> Organizar container: usar a Imagem do banco PostgreSQL | [Helder Lourenço](https://github.com/F1reFinger) e [Lucas Rodrigues](https://github.com/nickby2) |  |
| **Docker**<br> Fazer no jupyter notebook uma célula com script python que  popula, com a tabela tratada, o banco que está no container |  [Maria Eduarda Barbosa](https://github.com/Madu01) e [Larissa Stéfane Barboza](https://github.com/SkywalkerSupreme) |  |
| **Docker**<br> fazer docker compose que executar o script do jupyter notebook junto com o banco |  |  |