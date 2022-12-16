-- Utilizando 1 query, obtenha a quantidade de **depoimentos** (`testimonials`) que o usuário com id **435** efetuou, incluindo o seu nome. 

-- A resposta deve vir no formato:

-- ```
-- |---writer---|---testimonialCount---|
--     Jesus               3
--      ...               ...    
-- ```

-- **OBS:** a coluna `id` se refere ao id do usuário

  SELECT u.name, COUNT(t.id) AS testimonialCount
    FROM users u
    JOIN testimonials t ON u.id = t."writerId"
   WHERE u.id = 435
GROUP BY u.id;