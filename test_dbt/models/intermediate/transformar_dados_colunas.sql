
-- Use the `ref` function to select from other models

-- models/transformacao_dados_colunas.sql

{{ config(materialized='table', schema='intermediate') }}

WITH dados_transformados AS (
    SELECT
        id_paciente,
        sexo,
        CASE WHEN CAST(obito AS BOOLEAN) = true THEN 1 ELSE 0 END AS obito,
        bairro,
        raca_cor,
        ocupacao,
        religiao,
        CASE WHEN CAST(luz_eletrica AS BOOLEAN) = true THEN 1 ELSE 0 END AS luz_eletrica,
        CAST(data_cadastro AS TIMESTAMP) AS data_cadastro,
        escolaridade,
        nacionalidade,
        renda_familiar,
        TO_DATE(data_nascimento, 'YYYY/MM/DD') AS data_nascimento,
        CASE WHEN CAST(em_situacao_de_rua AS BOOLEAN) = true THEN 1 ELSE 0 END AS em_situacao_de_rua,
        frequenta_escola,
        meios_transporte,
        doencas_condicoes,
        identidade_genero,
        meios_comunicacao,
        orientacao_sexual,
        CASE WHEN CAST(possui_plano_saude AS BOOLEAN) = true THEN 1 ELSE 0 END AS possui_plano_saude,
        em_caso_doenca_procura,
        situacao_profissional,
        CASE WHEN CAST(vulnerabilidade_social AS BOOLEAN) = true THEN 1 ELSE 0 END AS vulnerabilidade_social,
        CAST(data_atualizacao_cadastro AS TIMESTAMP) AS data_atualizacao_cadastro,
        CASE WHEN CAST(familia_beneficiaria_auxilio_brasil AS BOOLEAN) = true THEN 1 ELSE 0 END AS familia_beneficiaria_auxilio_brasil,
        CASE WHEN CAST(crianca_matriculada_creche_pre_escola AS BOOLEAN) = true THEN 1 ELSE 0 END AS crianca_matriculada_creche_pre_escola,
        altura,
        peso,
        pressao_sistolica,
        pressao_diastolica,
        n_atendimentos_atencao_primaria,
        n_atendimentos_hospital,
        CAST(updated_at AS TIMESTAMP) AS updated_at,
        tipo
    FROM {{ ref('selecionar_dados_ficha_a_desafio') }}
)

SELECT *
FROM dados_transformados


