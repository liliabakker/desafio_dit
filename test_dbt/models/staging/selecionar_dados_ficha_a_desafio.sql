-- models/selecionar_dados_ficha_a_desafio.sql

{{ config(materialized='table', schema='staging') }}

WITH dados_ordenados AS (
    SELECT DISTINCT ON (id_paciente) * 
    FROM staging.dados_ficha_a_desafio
    ORDER BY id_paciente, data_cadastro DESC
)

SELECT *
FROM dados_ordenados

