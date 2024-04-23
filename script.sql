
-- -- Criando a tabela para armazenar os dados
-- CREATE TABLE dados_vinhos (
-- 	cod_top_wine SERIAL PRIMARY KEY,
-- 	RANK INTEGER,
--     country VARCHAR(100),
--     description TEXT,
--     points INTEGER,
--     price NUMERIC
-- );


-- DO $$
-- DECLARE
--     -- Declaração do cursor
--     cur_nomes_pais REFCURSOR;
--     -- Variáveis para armazenar os valores do cursor
--     v_country VARCHAR(100);
--     v_preco_medio NUMERIC(10,2);
--     -- Variável para o nome da tabela
--     v_nome_tabela VARCHAR(200) := 'dados_vinhos';
-- BEGIN 
--     -- Abertura do cursor
--     OPEN cur_nomes_pais FOR EXECUTE 
--         format(
--             '
--             SELECT country, SUM(price) / COUNT(*) AS preco_medio
--             FROM %I
--             GROUP BY country
--             ORDER BY preco_medio DESC; -- Ordenar por preços maiores
--             ',
--             v_nome_tabela
--         );
        
--     -- Loop para recuperar os resultados do cursor
--     LOOP
--         FETCH cur_nomes_pais INTO v_country, v_preco_medio;
--         -- Sair do loop quando não houver mais resultados
--         EXIT WHEN NOT FOUND;
--         -- Exibir os resultados
--         RAISE NOTICE 'País: %, Preço Médio: %', v_country, v_preco_medio;
--     END LOOP;
    
--     -- Fechar o cursor
--     CLOSE cur_nomes_pais;
-- END $$;


DO $$
DECLARE
    -- Declaração do cursor
    cur_nomes_pais REFCURSOR;
    -- Variáveis para armazenar os valores do cursor
    v_country VARCHAR(100);
    v_descricao_mais_long TEXT;
    -- Variável para o nome da tabela
    v_nome_tabela VARCHAR(200) := 'dados_vinhos';
BEGIN 
    -- Abertura do cursor
    OPEN cur_nomes_pais FOR EXECUTE 
        format(
            '
            SELECT country, MAX(description) AS descricao_mais_long
            FROM %I
            GROUP BY country;
            ',
            v_nome_tabela
        );
        
    -- Loop para recuperar os resultados do cursor e levantar avisos
    LOOP
        FETCH cur_nomes_pais INTO v_country, v_descricao_mais_long;
        -- Sair do loop quando não houver mais resultados
        EXIT WHEN NOT FOUND;
        -- Levantar aviso com os resultados
        RAISE NOTICE 'País: %, Descrição Mais Longa: %', v_country, v_descricao_mais_long;
    END LOOP;
    
    -- Fechar o cursor
    CLOSE cur_nomes_pais;
END $$;













