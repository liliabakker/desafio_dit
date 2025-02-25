import pandas as pd
from sqlalchemy import create_engine
import psycopg2

# leitura dados brutos 

dados = 'dados_ficha_a_desafio.csv'

df = pd.read_csv(dados)

# correção e codificação de colunas

def corrigir_limpar_e_strip(texto):
    if isinstance(texto, str):
        texto_corrigido = texto.encode('latin1').decode('unicode_escape')
        texto_limpo = texto_corrigido.replace('"', '').replace("'", '').replace('[', '').replace(']', '').strip()
        return texto_limpo
    return texto

df = df.map(corrigir_limpar_e_strip)

df

# envio dos dados brutos para o banco

engine = create_engine(f'postgresql://postgres:root@localhost:5432/dbt_dit')

with engine.connect() as connection:
    try:
        df.to_sql('dados_ficha_a_desafio', engine, schema='staging', if_exists='replace', index=False)
        print("Dados inseridos com sucesso.")
    except Exception as e:
        print(f"Ocorreu um erro ao inserir dados na tabela: {e}")



