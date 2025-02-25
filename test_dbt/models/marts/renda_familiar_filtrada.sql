-- models/filtrar_renda_familiar.sql

{{ config(materialized='table', schema= 'marts') }}

SELECT
    *
FROM
    {{ ref('transformar_dados_colunas') }} 
WHERE
    renda_familiar NOT IN ('Manhã', 'Internet')