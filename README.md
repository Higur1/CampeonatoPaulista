📚 Finalidade Acadêmica
Este projeto foi desenvolvido como trabalho prático do semestre, focando em:

Lógica de programação em SQL

Manipulação de dados relacionais

Simulação de cenários reais com regras e resultados dinâmicos

# Campeonato Paulista 2021 – Projeto de Banco de Dados 

Este projeto foi desenvolvido como trabalho semestral para a disciplina de Banco de Dados, com o objetivo de simular e gerenciar um campeonato de futebol, utilizando **SQL Server**.

---

## O que foi desenvolvido

O sistema gerencia a fase de grupos do Campeonato Paulista 2021 com as seguintes funcionalidades:

### Criação e Modelagem de Banco de Dados
- Criação de tabelas normalizadas para: Times, Grupos, Jogos, Datas, Classificação e Classificatória.
- Definição de chaves primárias, estrangeiras e integridade referencial.
- Triggers de proteção para impedir alterações nas tabelas sensíveis (`Times` e `Grupos`).

### Procedures (Stored Procedures)
- **Geração automática de grupos** com aleatoriedade.
- **Criação da tabela de classificação** inicial zerada.
- **Geração de jogos** entre os grupos com regras de mando de campo.
- **Inserção automática das datas dos jogos** com base em rodadas.
- **Atualização dos resultados dos jogos** e cálculo automático da classificação.
- **Seleção dos melhores times para as quartas de final.**
- **Reset completo do campeonato**, apagando os dados e reiniciando do zero.

### Consultas e Relatórios
- Tabela de classificação geral.
- Jogos por data.
- Visualização dos grupos e respectivos desempenhos.
- Quartas de final classificadas.

---

## Tecnologias e Recursos Utilizados

- **SQL Server** (Transact-SQL)
- Procedures, Functions e Triggers
- Operações com `JOIN`, `ORDER BY`, `NEWID()`, `DATEADD`
- Controle de fluxo (`WHILE`, `IF`, `CASE`)
- `DBCC CHECKIDENT` para reset de identidade
- Simulação de um calendário esportivo com inserção de datas reais
- Inserção inicial de 16 clubes participantes

---

## Organização das Procedures

```sql
-- Geração de dados
EXEC sp_gerar_novo_campeonato

-- Atualização e resultados
EXEC sp_atualizar_jogos @id, @gols, @cod

-- Consultas
EXEC sp_gerar_tabela_geral
EXEC sp_mostrar_jogos
EXEC sp_selecionar_por_data '2021-03-28'
EXEC sp_gerar_quartas
